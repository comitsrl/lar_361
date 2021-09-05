/******************************************************************************
 * Copyright (C) 2009 Low Heng Sin                                            *
 * Copyright (C) 2009 Idalica Corporation                                     *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 *****************************************************************************/
package org.compiere.apps.form;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.minigrid.IMiniTable;
import org.compiere.model.MAllocationHdr;
import org.compiere.model.MAllocationLine;
import org.compiere.model.MDocType;
import org.compiere.model.MInvoice;
import org.compiere.model.MPayment;
import org.compiere.model.MRole;
import org.compiere.process.DocAction;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.DisplayType;
import org.compiere.util.Env;
import org.compiere.util.KeyNamePair;
import org.compiere.util.Msg;
import org.compiere.util.TimeUtil;
import org.compiere.util.Util;

import ar.com.ergio.model.MLARPaymentHeader;
import ar.com.ergio.util.LAR_Utils;

public class Allocation
{
	public DecimalFormat format = DisplayType.getNumberFormat(DisplayType.Amount);

	/**	Logger			*/
	public static CLogger log = CLogger.getCLogger(Allocation.class);

	private boolean     m_calculating = false;
	public int         	m_C_Currency_ID = 0;
	public int         	m_C_BPartner_ID = 0;
	private int         m_noInvoices = 0;
	private int         m_noPayments = 0;
	public BigDecimal	totalInv = new BigDecimal(0.0);
	public BigDecimal 	totalPay = new BigDecimal(0.0);
	public BigDecimal	totalDiff = new BigDecimal(0.0);

	public Timestamp allocDate = null;

	//  Index	changed if multi-currency
	private int         i_payment = 7;
	//
	private int         i_open = 6;
	private int         i_discount = 7;
	private int         i_writeOff = 8;
	private int         i_applied = 9;
	private int 		i_overUnder = 10;
//	private int			i_multiplier = 10;

	public int         	m_AD_Org_ID = 0;

	private ArrayList<Integer>	m_bpartnerCheck = new ArrayList<Integer>();

	public void dynInit() throws Exception
	{
		m_C_Currency_ID = Env.getContextAsInt(Env.getCtx(), "$C_Currency_ID");   //  default
		//
		log.info("Currency=" + m_C_Currency_ID);

		m_AD_Org_ID = Env.getAD_Org_ID(Env.getCtx());
	}

	/**
	 *  Load Business Partner Info
	 *  - Payments
	 *  - Invoices
	 */
	public void checkBPartner()
	{
		log.config("BPartner=" + m_C_BPartner_ID + ", Cur=" + m_C_Currency_ID);
		//  Need to have both values
		if (m_C_BPartner_ID == 0 || m_C_Currency_ID == 0)
			return;

		//	Async BPartner Test
		Integer key = new Integer(m_C_BPartner_ID);
		if (!m_bpartnerCheck.contains(key))
		{
			new Thread()
			{
				public void run()
				{
					MPayment.setIsAllocated (Env.getCtx(), m_C_BPartner_ID, null);
					MInvoice.setIsPaid (Env.getCtx(), m_C_BPartner_ID, null);
				}
			}.start();
			m_bpartnerCheck.add(key);
		}
	}

	public Vector<Vector<Object>> getPaymentData(boolean isMultiCurrency, boolean isSOTrx, Object date, IMiniTable paymentTable)
	{
		/********************************
		 *  Load unallocated Payments
		 *      1-TrxDate, 2-DocumentNo, (3-Currency, 4-PayAmt,)
		 *      5-ConvAmt, 6-ConvOpen, 7-Allocated
		 */
		Vector<Vector<Object>> data = new Vector<Vector<Object>>();
		StringBuffer sql = new StringBuffer("SELECT p.DateTrx,p.DocumentNo,p.C_Payment_ID,"  //  1..3
			+ "c.ISO_Code,p.PayAmt,"                            //  4..5
			+ "currencyConvert(p.PayAmt,p.C_Currency_ID,?,?,p.C_ConversionType_ID,p.AD_Client_ID,p.AD_Org_ID),"//  6   #1, #2
            //begin @emmie issue #17
			+ "currencyConvert(paymentAvailable_LAR(C_Payment_ID),p.C_Currency_ID,?,?,p.C_ConversionType_ID,p.AD_Client_ID,p.AD_Org_ID),"  //  7   #3, #4
            //end @emmie issue #17
			+ "p.MultiplierAP, "
		//TODO nuevo by German Wagner
		//{
			+ "RLTT.name AS TenderType, "// Medio de Pago
			+ "p.CheckNo, "// Nº Cheque
			+ "RLCCT.name AS CreditCardType, "// Tipo Tarjeta
			+ "p.CreditCardNumber "// Nº Tarjeta
		//}
			//begin @emmie issue #17
			+ ", p.EsRetencionIIBB "      // 13
            //end @emmie issue #17
			+ "FROM C_Payment_v p"		//	Corrected for AP/AR
			+ " INNER JOIN C_Currency c ON (p.C_Currency_ID=c.C_Currency_ID) "
		//TODO nuevo by German Wagner
		//{
			+ "INNER JOIN ad_ref_list RLTT "
		    + "ON (RLTT.value =  P.tenderType) "
		    + "INNER JOIN ad_reference REFTT "
		    + "ON (REFTT.ad_reference_id = RLTT.ad_reference_id "
		    + "AND REFTT.name='C_Payment Tender Type') "
		    + "INNER JOIN ad_reference REFCCT "
		    + "ON (REFCCT.name='C_Payment CreditCard Type') "
		    + "LEFT JOIN ad_ref_list RLCCT "
		    + "ON (RLCCT.value = P.CreditCardType "
		    + "AND RLCCT.ad_reference_id = REFCCT.ad_reference_id) "
	    //}
			+ "WHERE p.IsAllocated='N' AND p.Processed='Y'"
			//begin @emmie issue #17
			+ "  AND ((p.C_Charge_ID IS NULL AND p.EsRetencionIIBB='N') OR "		//	Prepayments OK
			+ "      (p.C_Charge_ID IS NOT NULL AND p.EsRetencionIIBB='Y'))"
			//end @emmie issue #17}
			+ "  AND p.C_BPartner_ID=?"                   		//      #5
			);
        // @fchiappano Se cambio el orden de los criterios, para que los
        // parametros no queden fuera de rango.
        sql.append(" AND p.IsReceipt=?");                      //       #6
        if (!isMultiCurrency)
            sql.append(" AND p.C_Currency_ID=?");              //       #7
        if (m_AD_Org_ID != 0)
            sql.append(" AND p.AD_Org_ID=" + m_AD_Org_ID);                       
		sql.append(" ORDER BY p.DateTrx,p.DocumentNo");

		// role security
		sql = new StringBuffer( MRole.getDefault(Env.getCtx(), false).addAccessSQL( sql.toString(), "p", MRole.SQL_FULLYQUALIFIED, MRole.SQL_RO ) );

		log.fine("PaySQL=" + sql.toString());
		try
		{
			PreparedStatement pstmt = DB.prepareStatement(sql.toString(), null);
			pstmt.setInt(1, m_C_Currency_ID);
			pstmt.setTimestamp(2, (Timestamp)date);
			pstmt.setInt(3, m_C_Currency_ID);
			pstmt.setTimestamp(4, (Timestamp)date);
			pstmt.setInt(5, m_C_BPartner_ID);
            // @fchiappano Se cambia el orden de los parametros, según el orden
            // de criterios en el where de la consulta.
            pstmt.setString(6, isSOTrx ? "Y" : "N"); // @emmie - filtrar cobros/pagos

            if (!isMultiCurrency)
                pstmt.setInt(7, m_C_Currency_ID);
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				Vector<Object> line = new Vector<Object>();
				line.add(new Boolean(false));       //  0-Selection
				line.add(rs.getTimestamp(1));       //  1-TrxDate
				KeyNamePair pp = new KeyNamePair(rs.getInt(3), rs.getString(2));
				line.add(pp);                       //  2-DocumentNo
				if (isMultiCurrency)
				{
					line.add(rs.getString(4));      //  3-Currency
					line.add(rs.getBigDecimal(5));  //  4-PayAmt
				}
				line.add(rs.getBigDecimal(6));      //  3/5-ConvAmt
				BigDecimal available = rs.getBigDecimal(7);
	            //begin @emmie issue #17
				boolean esRetencion = rs.getString(13).equals("Y"); //  13-EsRetencionIIBB
				if (!esRetencion && (available == null || available.signum() == 0))	//	nothing available
			    //end @emmie issue #17
					continue;
				line.add(available);				//  4/6-ConvOpen/Available
				line.add(Env.ZERO);					//  5/7-Payment
//				line.add(rs.getBigDecimal(8));		//  6/8-Multiplier
				//
				data.add(line);
			}
			rs.close();
			pstmt.close();
		}
		catch (SQLException e)
		{
			log.log(Level.SEVERE, sql.toString(), e);
		}

		return data;
	}

	   public Vector<Vector<Object>> getPaymentData(boolean isMultiCurrency, Object date, IMiniTable paymentTable)
	    {
	        /********************************
	         *  Load unallocated Payments
	         *      1-TrxDate, 2-DocumentNo, (3-Currency, 4-PayAmt,)
	         *      5-ConvAmt, 6-ConvOpen, 7-Allocated
	         */
	        Vector<Vector<Object>> data = new Vector<Vector<Object>>();
	        StringBuffer sql = new StringBuffer("SELECT p.DateTrx,p.DocumentNo,p.C_Payment_ID,"  //  1..3
	            + "c.ISO_Code,p.PayAmt,"                            //  4..5
	            + "currencyConvert(p.PayAmt,p.C_Currency_ID,?,?,p.C_ConversionType_ID,p.AD_Client_ID,p.AD_Org_ID),"//  6   #1, #2
	            //begin @emmie issue #17
	            + "currencyConvert(paymentAvailable_LAR(C_Payment_ID),p.C_Currency_ID,?,?,p.C_ConversionType_ID,p.AD_Client_ID,p.AD_Org_ID),"  //  7   #3, #4
	            //end @emmie issue #17
	            + "p.MultiplierAP, "
	        //TODO nuevo by German Wagner
	        //{
	            + "RLTT.name AS TenderType, "// Medio de Pago
	            + "p.CheckNo, "// Nº Cheque
	            + "RLCCT.name AS CreditCardType, "// Tipo Tarjeta
	            + "p.CreditCardNumber "// Nº Tarjeta
	        //}
	            //begin @emmie issue #17
	            + ", p.EsRetencionIIBB "      // 13
	            //end @emmie issue #17
	            + "FROM C_Payment_v p"      //  Corrected for AP/AR
	            + " INNER JOIN C_Currency c ON (p.C_Currency_ID=c.C_Currency_ID) "
	        //TODO nuevo by German Wagner
	        //{
	            + "INNER JOIN ad_ref_list RLTT "
	            + "ON (RLTT.value =  P.tenderType) "
	            + "INNER JOIN ad_reference REFTT "
	            + "ON (REFTT.ad_reference_id = RLTT.ad_reference_id "
	            + "AND REFTT.name='C_Payment Tender Type') "
	            + "INNER JOIN ad_reference REFCCT "
	            + "ON (REFCCT.name='C_Payment CreditCard Type') "
	            + "LEFT JOIN ad_ref_list RLCCT "
	            + "ON (RLCCT.value = P.CreditCardType "
	            + "AND RLCCT.ad_reference_id = REFCCT.ad_reference_id) "
	        //}
	            + "WHERE p.IsAllocated='N' AND p.Processed='Y'"
	            //begin @emmie issue #17
	            + "  AND ((p.C_Charge_ID IS NULL AND p.EsRetencionIIBB='N') OR "        //  Prepayments OK
	            + "      (p.C_Charge_ID IS NOT NULL AND p.EsRetencionIIBB='Y'))"
	            //end @emmie issue #17}
	            + "  AND p.C_BPartner_ID=?"                         //      #5
	            );
	        if (!isMultiCurrency)
	            sql.append(" AND p.C_Currency_ID=?");               //      #6
	        if (m_AD_Org_ID != 0 )
	            sql.append(" AND p.AD_Org_ID=" + m_AD_Org_ID);
	        sql.append(" ORDER BY p.DateTrx,p.DocumentNo");

	        // role security
	        sql = new StringBuffer( MRole.getDefault(Env.getCtx(), false).addAccessSQL( sql.toString(), "p", MRole.SQL_FULLYQUALIFIED, MRole.SQL_RO ) );

	        log.fine("PaySQL=" + sql.toString());
	        try
	        {
	            PreparedStatement pstmt = DB.prepareStatement(sql.toString(), null);
	            pstmt.setInt(1, m_C_Currency_ID);
	            pstmt.setTimestamp(2, (Timestamp)date);
	            pstmt.setInt(3, m_C_Currency_ID);
	            pstmt.setTimestamp(4, (Timestamp)date);
	            pstmt.setInt(5, m_C_BPartner_ID);
	            if (!isMultiCurrency)
	                pstmt.setInt(6, m_C_Currency_ID);
	            ResultSet rs = pstmt.executeQuery();
	            while (rs.next())
	            {
	                Vector<Object> line = new Vector<Object>();
	                line.add(new Boolean(false));       //  0-Selection
	                line.add(rs.getTimestamp(1));       //  1-TrxDate
	                KeyNamePair pp = new KeyNamePair(rs.getInt(3), rs.getString(2));
	                line.add(pp);                       //  2-DocumentNo
	                if (isMultiCurrency)
	                {
	                    line.add(rs.getString(4));      //  3-Currency
	                    line.add(rs.getBigDecimal(5));  //  4-PayAmt
	                }
	                line.add(rs.getBigDecimal(6));      //  3/5-ConvAmt
	                BigDecimal available = rs.getBigDecimal(7);
	                //begin @emmie issue #17
	                boolean esRetencion = rs.getString(13).equals("Y"); //  13-EsRetencionIIBB
	                if (!esRetencion && (available == null || available.signum() == 0)) //  nothing available
	                //end @emmie issue #17
	                    continue;
	                line.add(available);                //  4/6-ConvOpen/Available
	                line.add(Env.ZERO);                 //  5/7-Payment
//	              line.add(rs.getBigDecimal(8));      //  6/8-Multiplier
	                //
	                data.add(line);
	            }
	            rs.close();
	            pstmt.close();
	        }
	        catch (SQLException e)
	        {
	            log.log(Level.SEVERE, sql.toString(), e);
	        }

	        return data;
	    }

	public Vector<String> getPaymentColumnNames(boolean isMultiCurrency)
	{
		//  Header Info
		Vector<String> columnNames = new Vector<String>();
		columnNames.add(Msg.getMsg(Env.getCtx(), "Select"));
		columnNames.add(Msg.translate(Env.getCtx(), "Date"));
		columnNames.add(Util.cleanAmp(Msg.translate(Env.getCtx(), "DocumentNo")));
		if (isMultiCurrency)
		{
			columnNames.add(Msg.getMsg(Env.getCtx(), "TrxCurrency"));
			columnNames.add(Msg.translate(Env.getCtx(), "Amount"));
		}
		columnNames.add(Msg.getMsg(Env.getCtx(), "ConvertedAmount"));
		columnNames.add(Msg.getMsg(Env.getCtx(), "OpenAmt"));
		columnNames.add(Msg.getMsg(Env.getCtx(), "AppliedAmt"));
//		columnNames.add(" ");	//	Multiplier

	//TODO nuevo by German Wagner
	//{
		columnNames.add("Forma de Pago");
		columnNames.add("Nº Cheque");
		columnNames.add("Tarjeta");
		columnNames.add("Nº Tarjeta");
	//}
		return columnNames;
	}

	public void setPaymentColumnClass(IMiniTable paymentTable, boolean isMultiCurrency)
	{
		int i = 0;
		paymentTable.setColumnClass(i++, Boolean.class, false);         //  0-Selection
		paymentTable.setColumnClass(i++, Timestamp.class, true);        //  1-TrxDate
		paymentTable.setColumnClass(i++, String.class, true);           //  2-Value
		if (isMultiCurrency)
		{
			paymentTable.setColumnClass(i++, String.class, true);       //  3-Currency
			paymentTable.setColumnClass(i++, BigDecimal.class, true);   //  4-PayAmt
		}
		paymentTable.setColumnClass(i++, BigDecimal.class, true);       //  5-ConvAmt
		paymentTable.setColumnClass(i++, BigDecimal.class, true);       //  6-ConvOpen
		paymentTable.setColumnClass(i++, BigDecimal.class, true);      //  7-Allocated
//		paymentTable.setColumnClass(i++, BigDecimal.class, true);      	//  8-Multiplier

	//TODO nuevo by German Wagner
	//{
		paymentTable.setColumnClass(i++, String.class, true);      	//  08-Medio de Pago
		paymentTable.setColumnClass(i++, String.class, true);      	//  09-Nº Cheque
		paymentTable.setColumnClass(i++, String.class, true);      	//  10-Tipo Tarjeta
		paymentTable.setColumnClass(i++, String.class, true);      	//  11-Nº Tarjeta
	//}
		//
		i_payment = isMultiCurrency ? 7 : 5;


		//  Table UI
		paymentTable.autoSize();
	}

	public Vector<Vector<Object>> getInvoiceData(boolean isMultiCurrency, boolean isSOTrx, Object date, IMiniTable invoiceTable)
	{
		/********************************
		 *  Load unpaid Invoices
		 *      1-TrxDate, 2-Value, (3-Currency, 4-InvAmt,)
		 *      5-ConvAmt, 6-ConvOpen, 7-ConvDisc, 8-WriteOff, 9-Applied
		 *
		 SELECT i.DateInvoiced,i.DocumentNo,i.C_Invoice_ID,c.ISO_Code,
		 i.GrandTotal*i.MultiplierAP "GrandTotal",
		 currencyConvert(i.GrandTotal*i.MultiplierAP,i.C_Currency_ID,i.C_Currency_ID,i.DateInvoiced,i.C_ConversionType_ID,i.AD_Client_ID,i.AD_Org_ID) "GrandTotal $",
		 invoiceOpen(C_Invoice_ID,C_InvoicePaySchedule_ID) "Open",
		 currencyConvert(invoiceOpen(C_Invoice_ID,C_InvoicePaySchedule_ID),i.C_Currency_ID,i.C_Currency_ID,i.DateInvoiced,i.C_ConversionType_ID,i.AD_Client_ID,i.AD_Org_ID)*i.MultiplierAP "Open $",
		 invoiceDiscount(i.C_Invoice_ID,SysDate,C_InvoicePaySchedule_ID) "Discount",
		 currencyConvert(invoiceDiscount(i.C_Invoice_ID,SysDate,C_InvoicePaySchedule_ID),i.C_Currency_ID,i.C_Currency_ID,i.DateInvoiced,i.C_ConversionType_ID,i.AD_Client_ID,i.AD_Org_ID)*i.Multiplier*i.MultiplierAP "Discount $",
		 i.MultiplierAP, i.Multiplier
		 FROM C_Invoice_v i INNER JOIN C_Currency c ON (i.C_Currency_ID=c.C_Currency_ID)
		 WHERE -- i.IsPaid='N' AND i.Processed='Y' AND i.C_BPartner_ID=1000001
		 */
		Vector<Vector<Object>> data = new Vector<Vector<Object>>();
		StringBuffer sql = new StringBuffer("SELECT i.DateInvoiced,i.DocumentNo,i.C_Invoice_ID," //  1..3
			+ "c.ISO_Code,i.GrandTotal*i.MultiplierAP, "                            //  4..5    Orig Currency
			// @fchiappano Utilizar nueva función de conversión de moneda.
			+ "currencyConvertRate(i.GrandTotal*i.MultiplierAP, i.C_Currency_ID, ?, i.TasaDeCambio), " //  6   #1  Converted, #2 Date
			+ "currencyConvertRate(invoiceOpen(C_Invoice_ID, C_InvoicePaySchedule_ID), i.C_Currency_ID, ?, i.TasaDeCambio) * i.MultiplierAP, "  //  7   #3, #4  Converted Open
			+ "currencyConvertRate(invoiceDiscount"                               //  8       AllowedDiscount
			+ "(i.C_Invoice_ID, ?,C_InvoicePaySchedule_ID), i.C_Currency_ID, ?, i.TasaDeCambio) * i.Multiplier * i.MultiplierAP,"               //  #5, #6
			// @fchiappano Fin.
			+ "i.MultiplierAP "
			+ "FROM C_Invoice_v i"		//  corrected for CM/Split
			+ " INNER JOIN C_Currency c ON (i.C_Currency_ID=c.C_Currency_ID) "
			+ "WHERE i.IsPaid='N' AND i.Processed='Y'"
			+ " AND i.C_BPartner_ID=?");                                            //  #7
        // @fchiappano Se cambio el orden de los criterios, para que los
        // parametros no queden fuera de rango.
        sql.append(" AND i.IsSOTrx=?");                                             //  #8
        if (!isMultiCurrency)
            sql.append(" AND i.C_Currency_ID=?");                                   //  #9
		if (m_AD_Org_ID != 0 )
			sql.append(" AND i.AD_Org_ID=" + m_AD_Org_ID);
		
		sql.append(" ORDER BY i.DateInvoiced, i.DocumentNo");
		log.fine("InvSQL=" + sql.toString());

		// role security
		sql = new StringBuffer( MRole.getDefault(Env.getCtx(), false).addAccessSQL( sql.toString(), "i", MRole.SQL_FULLYQUALIFIED, MRole.SQL_RO ) );

		try
		{
			PreparedStatement pstmt = DB.prepareStatement(sql.toString(), null);
			pstmt.setInt(1, m_C_Currency_ID);
			pstmt.setInt(2, m_C_Currency_ID);
			pstmt.setTimestamp(3, (Timestamp)date);
			pstmt.setInt(4, m_C_Currency_ID);
			pstmt.setInt(5, m_C_BPartner_ID);
            // @fchiappano Se cambio el orden de los parametros, para que los mismos no queden fuera de rango.
            pstmt.setString(6, isSOTrx ? "Y" : "N"); // @emmie - Filtra facturas venta/compra

            if (!isMultiCurrency)
                pstmt.setInt(7, m_C_Currency_ID);

			ResultSet rs = pstmt.executeQuery();
			while (rs.next())
			{
				Vector<Object> line = new Vector<Object>();
				line.add(new Boolean(false));       //  0-Selection
				line.add(rs.getTimestamp(1));       //  1-TrxDate
				KeyNamePair pp = new KeyNamePair(rs.getInt(3), rs.getString(2));
				line.add(pp);                       //  2-Value
				if (isMultiCurrency)
				{
					line.add(rs.getString(4));      //  3-Currency
					line.add(rs.getBigDecimal(5));  //  4-Orig Amount
				}
				line.add(rs.getBigDecimal(6));      //  3/5-ConvAmt
				BigDecimal open = rs.getBigDecimal(7);
				if (open == null)		//	no conversion rate
					open = Env.ZERO;
				line.add(open);      				//  4/6-ConvOpen
				BigDecimal discount = rs.getBigDecimal(8);
				if (discount == null)	//	no concersion rate
					discount = Env.ZERO;
				line.add(discount);					//  5/7-ConvAllowedDisc
				line.add(Env.ZERO);      			//  6/8-WriteOff
				line.add(Env.ZERO);					// 7/9-Applied
				line.add(open);				    //  8/10-OverUnder

//				line.add(rs.getBigDecimal(9));		//	8/10-Multiplier
				//	Add when open <> 0 (i.e. not if no conversion rate)
				if (Env.ZERO.compareTo(open) != 0)
					data.add(line);
			}
			rs.close();
			pstmt.close();
		}
		catch (SQLException e)
		{
			log.log(Level.SEVERE, sql.toString(), e);
		}

		return data;
	}

	   public Vector<Vector<Object>> getInvoiceData(boolean isMultiCurrency, Object date, IMiniTable invoiceTable)
	    {
	        /********************************
	         *  Load unpaid Invoices
	         *      1-TrxDate, 2-Value, (3-Currency, 4-InvAmt,)
	         *      5-ConvAmt, 6-ConvOpen, 7-ConvDisc, 8-WriteOff, 9-Applied
	         *
	         SELECT i.DateInvoiced,i.DocumentNo,i.C_Invoice_ID,c.ISO_Code,
	         i.GrandTotal*i.MultiplierAP "GrandTotal",
	         currencyConvert(i.GrandTotal*i.MultiplierAP,i.C_Currency_ID,i.C_Currency_ID,i.DateInvoiced,i.C_ConversionType_ID,i.AD_Client_ID,i.AD_Org_ID) "GrandTotal $",
	         invoiceOpen(C_Invoice_ID,C_InvoicePaySchedule_ID) "Open",
	         currencyConvert(invoiceOpen(C_Invoice_ID,C_InvoicePaySchedule_ID),i.C_Currency_ID,i.C_Currency_ID,i.DateInvoiced,i.C_ConversionType_ID,i.AD_Client_ID,i.AD_Org_ID)*i.MultiplierAP "Open $",
	         invoiceDiscount(i.C_Invoice_ID,SysDate,C_InvoicePaySchedule_ID) "Discount",
	         currencyConvert(invoiceDiscount(i.C_Invoice_ID,SysDate,C_InvoicePaySchedule_ID),i.C_Currency_ID,i.C_Currency_ID,i.DateInvoiced,i.C_ConversionType_ID,i.AD_Client_ID,i.AD_Org_ID)*i.Multiplier*i.MultiplierAP "Discount $",
	         i.MultiplierAP, i.Multiplier
	         FROM C_Invoice_v i INNER JOIN C_Currency c ON (i.C_Currency_ID=c.C_Currency_ID)
	         WHERE -- i.IsPaid='N' AND i.Processed='Y' AND i.C_BPartner_ID=1000001
	         */
	        Vector<Vector<Object>> data = new Vector<Vector<Object>>();
	        StringBuffer sql = new StringBuffer("SELECT i.DateInvoiced,i.DocumentNo,i.C_Invoice_ID," //  1..3
	            + "c.ISO_Code,i.GrandTotal*i.MultiplierAP, "                            //  4..5    Orig Currency
	            // @fchiappano Utilizar nueva funcion de conversion de moneda.
	            + "currencyConvertRate(i.GrandTotal * i.MultiplierAP, i.C_Currency_ID, ?, i.TasaDeCambio), " //  6   #1  Converted, #2 Date
	            + "currencyConvertRate(invoiceOpen(C_Invoice_ID, C_InvoicePaySchedule_ID), i.C_Currency_ID, ?, i.TasaDeCambio) * i.MultiplierAP, "  //  7   #3, #4  Converted Open
	            + "currencyConvertRate(invoiceDiscount"                               //  8       AllowedDiscount
	            + "(i.C_Invoice_ID, ?, C_InvoicePaySchedule_ID), i.C_Currency_ID, ?, i.TasaDeCambio) * i.Multiplier * i.MultiplierAP,"               //  #5, #6
	            // @fchiappano Fin
	            + "i.MultiplierAP "
	            + "FROM C_Invoice_v i"      //  corrected for CM/Split
	            + " INNER JOIN C_Currency c ON (i.C_Currency_ID=c.C_Currency_ID) "
	            + "WHERE i.IsPaid='N' AND i.Processed='Y'"
	            + " AND i.C_BPartner_ID=?");                                            //  #7
	        if (!isMultiCurrency)
	            sql.append(" AND i.C_Currency_ID=?");                                   //  #8
	        if (m_AD_Org_ID != 0 )
	            sql.append(" AND i.AD_Org_ID=" + m_AD_Org_ID);
	        sql.append(" ORDER BY i.DateInvoiced, i.DocumentNo");
	        log.fine("InvSQL=" + sql.toString());

	        // role security
	        sql = new StringBuffer( MRole.getDefault(Env.getCtx(), false).addAccessSQL( sql.toString(), "i", MRole.SQL_FULLYQUALIFIED, MRole.SQL_RO ) );

	        try
	        {
	            PreparedStatement pstmt = DB.prepareStatement(sql.toString(), null);
	            pstmt.setInt(1, m_C_Currency_ID);
	            pstmt.setInt(2, m_C_Currency_ID);
	            pstmt.setTimestamp(3, (Timestamp)date);
	            pstmt.setInt(4, m_C_Currency_ID);
	            pstmt.setInt(5, m_C_BPartner_ID);
	            if (!isMultiCurrency)
	                pstmt.setInt(6, m_C_Currency_ID);
	            ResultSet rs = pstmt.executeQuery();
	            while (rs.next())
	            {
	                Vector<Object> line = new Vector<Object>();
	                line.add(new Boolean(false));       //  0-Selection
	                line.add(rs.getTimestamp(1));       //  1-TrxDate
	                KeyNamePair pp = new KeyNamePair(rs.getInt(3), rs.getString(2));
	                line.add(pp);                       //  2-Value
	                if (isMultiCurrency)
	                {
	                    line.add(rs.getString(4));      //  3-Currency
	                    line.add(rs.getBigDecimal(5));  //  4-Orig Amount
	                }
	                line.add(rs.getBigDecimal(6));      //  3/5-ConvAmt
	                BigDecimal open = rs.getBigDecimal(7);
	                if (open == null)       //  no conversion rate
	                    open = Env.ZERO;
	                line.add(open);                     //  4/6-ConvOpen
	                BigDecimal discount = rs.getBigDecimal(8);
	                if (discount == null)   //  no concersion rate
	                    discount = Env.ZERO;
	                line.add(discount);                 //  5/7-ConvAllowedDisc
	                line.add(Env.ZERO);                 //  6/8-WriteOff
	                line.add(Env.ZERO);                 // 7/9-Applied
	                line.add(open);                 //  8/10-OverUnder

//	              line.add(rs.getBigDecimal(9));      //  8/10-Multiplier
	                //  Add when open <> 0 (i.e. not if no conversion rate)
	                if (Env.ZERO.compareTo(open) != 0)
	                    data.add(line);
	            }
	            rs.close();
	            pstmt.close();
	        }
	        catch (SQLException e)
	        {
	            log.log(Level.SEVERE, sql.toString(), e);
	        }

	        return data;
	    }

	public Vector<String> getInvoiceColumnNames(boolean isMultiCurrency)
	{
		//  Header Info
		Vector<String> columnNames = new Vector<String>();
		columnNames.add(Msg.getMsg(Env.getCtx(), "Select"));
		columnNames.add(Msg.translate(Env.getCtx(), "Date"));
		columnNames.add(Util.cleanAmp(Msg.translate(Env.getCtx(), "DocumentNo")));
		if (isMultiCurrency)
		{
			columnNames.add(Msg.getMsg(Env.getCtx(), "TrxCurrency"));
			columnNames.add(Msg.translate(Env.getCtx(), "Amount"));
		}
		columnNames.add(Msg.getMsg(Env.getCtx(), "ConvertedAmount"));
		columnNames.add(Msg.getMsg(Env.getCtx(), "OpenAmt"));
		columnNames.add(Msg.getMsg(Env.getCtx(), "Discount"));
		columnNames.add(Msg.getMsg(Env.getCtx(), "WriteOff"));
		columnNames.add(Msg.getMsg(Env.getCtx(), "AppliedAmt"));
		columnNames.add(Msg.getMsg(Env.getCtx(), "OverUnderAmt"));
//		columnNames.add(" ");	//	Multiplier

		return columnNames;
	}

	public void setInvoiceColumnClass(IMiniTable invoiceTable, boolean isMultiCurrency)
	{
		int i = 0;
		invoiceTable.setColumnClass(i++, Boolean.class, false);         //  0-Selection
		invoiceTable.setColumnClass(i++, Timestamp.class, true);        //  1-TrxDate
		invoiceTable.setColumnClass(i++, String.class, true);           //  2-Value
		if (isMultiCurrency)
		{
			invoiceTable.setColumnClass(i++, String.class, true);       //  3-Currency
			invoiceTable.setColumnClass(i++, BigDecimal.class, true);   //  4-Amt
		}
		invoiceTable.setColumnClass(i++, BigDecimal.class, true);       //  5-ConvAmt
		invoiceTable.setColumnClass(i++, BigDecimal.class, true);       //  6-ConvAmt Open
		invoiceTable.setColumnClass(i++, BigDecimal.class, true);      //  7-Conv Discount
		invoiceTable.setColumnClass(i++, BigDecimal.class, true);      //  8-Conv WriteOff
		invoiceTable.setColumnClass(i++, BigDecimal.class, true);      //  9-Conv OverUnder
		invoiceTable.setColumnClass(i++, BigDecimal.class, true);		//	10-Conv Applied
//		invoiceTable.setColumnClass(i++, BigDecimal.class, true);      	//  10-Multiplier
		//  Table UI
		invoiceTable.autoSize();
	}

	public void calculate(boolean isMultiCurrency)
	{
		i_open = isMultiCurrency ? 6 : 4;
		i_discount = isMultiCurrency ? 7 : 5;
		i_writeOff = isMultiCurrency ? 8 : 6;
		i_applied = isMultiCurrency ? 9 : 7;
		i_overUnder = isMultiCurrency ? 10 : 8;
//		i_multiplier = isMultiCurrency ? 10 : 8;
	}   //  loadBPartner

	public String writeOff(int row, int col, boolean isInvoice, IMiniTable payment, IMiniTable invoice, boolean isAutoWriteOff)
	{
		String msg = "";
		/**
		 *  Setting defaults
		 */
		if (m_calculating)  //  Avoid recursive calls
			return msg;
		m_calculating = true;

		log.config("Row=" + row
			+ ", Col=" + col + ", InvoiceTable=" + isInvoice);

		//  Payments
		if (!isInvoice)
		{
			BigDecimal open = (BigDecimal)payment.getValueAt(row, i_open);
			BigDecimal applied = (BigDecimal)payment.getValueAt(row, i_payment);

			if (col == 0)
			{
				// selection of payment row
				if (((Boolean)payment.getValueAt(row, 0)).booleanValue())
				{
					applied = open;   //  Open Amount
					if (totalDiff.abs().compareTo(applied.abs()) < 0			// where less is available to allocate than open
							&& totalDiff.signum() == -applied.signum() )    	// and the available amount has the opposite sign
						applied = totalDiff.negate();						// reduce the amount applied to what's available

				}
				else    //  de-selected
					applied = Env.ZERO;
			}


			if (col == i_payment)
			{
				if ( applied.signum() == -open.signum() )
					applied = applied.negate();
				if ( open.abs().compareTo( applied.abs() ) < 0 )
							applied = open;
			}

			payment.setValueAt(applied, row, i_payment);
		}

		//  Invoice
		else
		{
			boolean selected = ((Boolean) invoice.getValueAt(row, 0)).booleanValue();
			BigDecimal open = (BigDecimal)invoice.getValueAt(row, i_open);
			BigDecimal discount = (BigDecimal)invoice.getValueAt(row, i_discount);
			BigDecimal applied = (BigDecimal)invoice.getValueAt(row, i_applied);
			BigDecimal writeOff = (BigDecimal) invoice.getValueAt(row, i_writeOff);
			BigDecimal overUnder = (BigDecimal) invoice.getValueAt(row, i_overUnder);
			int openSign = open.signum();

			if (col == 0)  //selection
			{
				//  selected - set applied amount
				if ( selected )
				{
					applied = open;    //  Open Amount
					applied = applied.subtract(discount);
					writeOff = Env.ZERO;  //  to be sure
					overUnder = Env.ZERO;

					if (totalDiff.abs().compareTo(applied.abs()) < 0			// where less is available to allocate than open
							&& totalDiff.signum() == applied.signum() )     	// and the available amount has the same sign
						applied = totalDiff;									// reduce the amount applied to what's available

					if ( isAutoWriteOff )
						writeOff = open.subtract(applied.add(discount));
					else
						overUnder = open.subtract(applied.add(discount));
				}
				else    //  de-selected
				{
					writeOff = Env.ZERO;
					applied = Env.ZERO;
					overUnder = Env.ZERO;
				}
			}

			// check entered values are sensible and possibly auto write-off
			if ( selected && col != 0 )
			{

				// values should have same sign as open except possibly over/under
				if ( discount.signum() == -openSign )
					discount = discount.negate();
				if ( writeOff.signum() == -openSign)
					writeOff = writeOff.negate();
				if ( applied.signum() == -openSign )
					applied = applied.negate();

				// discount and write-off must be less than open amount
				if ( discount.abs().compareTo(open.abs()) > 0)
					discount = open;
				if ( writeOff.abs().compareTo(open.abs()) > 0)
					writeOff = open;


				/*
				 * Two rules to maintain:
				 *
				 * 1) |writeOff + discount| < |open|
				 * 2) discount + writeOff + overUnder + applied = 0
				 *
				 *   As only one column is edited at a time and the initial position was one of compliance
				 *   with the rules, we only need to redistribute the increase/decrease in the edited column to
				 *   the others.
				*/
				BigDecimal newTotal = discount.add(writeOff).add(applied).add(overUnder);  // all have same sign
				BigDecimal difference = newTotal.subtract(open);

				// rule 2
				BigDecimal diffWOD = writeOff.add(discount).subtract(open);

				if ( diffWOD.signum() == open.signum() )  // writeOff and discount are too large
				{
					if ( col == i_discount )       // then edit writeoff
					{
						writeOff = writeOff.subtract(diffWOD);
					}
					else                            // col = i_writeoff
					{
						discount = discount.subtract(diffWOD);
					}

					difference = difference.subtract(diffWOD);
				}

				// rule 1
				if ( col == i_applied )
					overUnder = overUnder.subtract(difference);
				else
					applied = applied.subtract(difference);

			}

			//	Warning if write Off > 30%
			if (isAutoWriteOff && writeOff.doubleValue()/open.doubleValue() > .30)
				msg = "AllocationWriteOffWarn";

			invoice.setValueAt(discount, row, i_discount);
			invoice.setValueAt(applied, row, i_applied);
			invoice.setValueAt(writeOff, row, i_writeOff);
			invoice.setValueAt(overUnder, row, i_overUnder);

			invoice.repaint(); //  update r/o
		}

		m_calculating = false;

		return msg;
	}

	/**
	 *  Calculate Allocation info
	 */
	public String calculatePayment(IMiniTable payment, boolean isMultiCurrency)
	{
		log.config("");

		//  Payment
		totalPay = new BigDecimal(0.0);
		int rows = payment.getRowCount();
		m_noPayments = 0;
		for (int i = 0; i < rows; i++)
		{
			if (((Boolean)payment.getValueAt(i, 0)).booleanValue())
			{
				Timestamp ts = (Timestamp)payment.getValueAt(i, 1);
				if ( !isMultiCurrency )  // the converted amounts are only valid for the selected date
					allocDate = TimeUtil.max(allocDate, ts);
				BigDecimal bd = (BigDecimal)payment.getValueAt(i, i_payment);
				totalPay = totalPay.add(bd);  //  Applied Pay
				m_noPayments++;
				log.fine("Payment_" + i + " = " + bd + " - Total=" + totalPay);
			}
		}
		return String.valueOf(m_noPayments) + " - "
			+ Msg.getMsg(Env.getCtx(), "Sum") + "  " + format.format(totalPay) + " ";
	}

	public String calculateInvoice(IMiniTable invoice, boolean isMultiCurrency)
	{
		//  Invoices
		totalInv = new BigDecimal(0.0);
		int rows = invoice.getRowCount();
		m_noInvoices = 0;

		for (int i = 0; i < rows; i++)
		{
			if (((Boolean)invoice.getValueAt(i, 0)).booleanValue())
			{
				Timestamp ts = (Timestamp)invoice.getValueAt(i, 1);
				if ( !isMultiCurrency )  // converted amounts only valid for selected date
					allocDate = TimeUtil.max(allocDate, ts);
				BigDecimal bd = (BigDecimal)invoice.getValueAt(i, i_applied);
				totalInv = totalInv.add(bd);  //  Applied Inv
				m_noInvoices++;
				log.fine("Invoice_" + i + " = " + bd + " - Total=" + totalPay);
			}
		}
		return String.valueOf(m_noInvoices) + " - "
			+ Msg.getMsg(Env.getCtx(), "Sum") + "  " + format.format(totalInv) + " ";
	}

	/**************************************************************************
	 *  Save Data
	 */
	public String saveData(int m_WindowNo, Object date, IMiniTable payment, IMiniTable invoice, String trxName)
	{
		if (m_noInvoices + m_noPayments == 0)
			return "";

		//  fixed fields
		int AD_Client_ID = Env.getContextAsInt(Env.getCtx(), m_WindowNo, "AD_Client_ID");
		int AD_Org_ID = Env.getContextAsInt(Env.getCtx(), m_WindowNo, "AD_Org_ID");
		int C_BPartner_ID = m_C_BPartner_ID;
		int C_Order_ID = 0;
		int C_CashLine_ID = 0;
		Timestamp DateTrx = (Timestamp)date;
		int C_Currency_ID = m_C_Currency_ID;	//	the allocation currency
		//
		if (AD_Org_ID == 0)
		{
			throw new AdempiereException("@Org0NotAllowed@");
		}
		//
		log.config("Client=" + AD_Client_ID + ", Org=" + AD_Org_ID
			+ ", BPartner=" + C_BPartner_ID + ", Date=" + DateTrx);

		//  Payment - Loop and add them to paymentList/amountList
		int pRows = payment.getRowCount();
		ArrayList<Integer> paymentList = new ArrayList<Integer>(pRows);
		ArrayList<BigDecimal> amountList = new ArrayList<BigDecimal>(pRows);
		BigDecimal paymentAppliedAmt = Env.ZERO;
		for (int i = 0; i < pRows; i++)
		{
			//  Payment line is selected
			if (((Boolean)payment.getValueAt(i, 0)).booleanValue())
			{
				KeyNamePair pp = (KeyNamePair)payment.getValueAt(i, 2);   //  Value
				//  Payment variables
				int C_Payment_ID = pp.getKey();
				paymentList.add(new Integer(C_Payment_ID));
				//
				BigDecimal PaymentAmt = (BigDecimal)payment.getValueAt(i, i_payment);  //  Applied Payment
				amountList.add(PaymentAmt);
				//
				paymentAppliedAmt = paymentAppliedAmt.add(PaymentAmt);
				//
				log.fine("C_Payment_ID=" + C_Payment_ID
					+ " - PaymentAmt=" + PaymentAmt); // + " * " + Multiplier + " = " + PaymentAmtAbs);
			}
		}
		log.config("Number of Payments=" + paymentList.size() + " - Total=" + paymentAppliedAmt);

		//  Invoices - Loop and generate allocations
		int iRows = invoice.getRowCount();

        // @fchiappano Restringir la asignación multimoneda a 1 contra 1 (Una
        // factura contra una NC).
        ArrayList<Integer[]> invoiceList = new ArrayList<Integer[]>();
        boolean asignacionNC = false;
        for (int i = 0; i < iRows; i++)
        {
            if (((Boolean) invoice.getValueAt(i, 0)).booleanValue())
            {
                KeyNamePair ii = (KeyNamePair) invoice.getValueAt(i, 2);
                MInvoice factura = new MInvoice(Env.getCtx(), ii.getKey(), trxName);

                // @fchiappano Valor que determinara el orden de los items al
                // ordenarlos. 1 = Nota de Credito, 2 Factura.
                int tipoDoc = 2;
                if (factura.getC_DocType().getDocBaseType().equals(MDocType.DOCBASETYPE_ARCreditMemo)
                        || factura.getC_DocType().getDocBaseType().equals(MDocType.DOCBASETYPE_APCreditMemo))
                {
                    tipoDoc = 1;
                    asignacionNC = true;
                }

                // @fchiappano Array = C_Invoice_ID, nroRegistro en grilla, tipo de doc.
                Integer[] lineaSeleccionada = { ii.getKey(), i, tipoDoc };
                invoiceList.add(lineaSeleccionada);

                if (asignacionNC && invoiceList.size() > 2)
                    throw new AdempiereException(
                            "La asignación de Notas de Crédito contra Facturas, deberan realizarse de a una por vez.");
            }
        }

        // @fchiappano Ordenar las facturas, dejando primero las NC y luego las
        // facturas.
        if (invoiceList.size() > 0)
            ordenarLista(invoiceList);

		//	For all invoices
		BigDecimal unmatchedApplied = Env.ZERO;

        // @fchiappano variable para almacenar la moneda de las facturas.
        int monedaFactura_ID = 0;
        int notaCredito_ID = 0;
        MAllocationHdr alloc = null;

		for (int x = 0; x < invoiceList.size(); x++)
		{
		        int i = invoiceList.get(x)[1];

				KeyNamePair pp = (KeyNamePair)invoice.getValueAt(i, 2);    //  Value
				//  Invoice variables
				int C_Invoice_ID = pp.getKey();

                // @fchiappano Almacenar moneda de la factura.
                MInvoice factura = new MInvoice(Env.getCtx(), C_Invoice_ID, trxName);

                // @fchiappano si cambia la moneda de la factura, crear una
                // nueva cabecera de asignacion y procesar la anterior.
                if (monedaFactura_ID != factura.getC_Currency_ID())
                {
                    // @fchiappano procesar la asignación de factura.
                    if (alloc != null && alloc.get_ID() != 0)
                    {
                        alloc.processIt(DocAction.ACTION_Complete);
                        alloc.saveEx();
                    }
                    monedaFactura_ID = factura.getC_Currency_ID();
                    // Create Allocation
                    alloc = new MAllocationHdr(Env.getCtx(), true, // manual
                            DateTrx, monedaFactura_ID, Env.getContext(Env.getCtx(), "#AD_User_Name"), trxName);

                    if (factura.getC_ConversionType_ID() > 0)
                        alloc.set_ValueOfColumn("C_ConversionType_ID", factura.getC_ConversionType_ID());

                    alloc.setAD_Org_ID(AD_Org_ID);
                    alloc.saveEx();
                }

                // @fchiappano Chequear si la moneda de la factura, es una moneda extranjera.
                BigDecimal tasaCambio = Env.ZERO;
                int redondeo = factura.getC_Currency().getStdPrecision() + 2;
                boolean esMonedaExtranjera = monedaFactura_ID != LAR_Utils.getMonedaPredeterminada(
                        Env.getCtx(), AD_Client_ID, trxName) ? true : false;

				BigDecimal AppliedAmt = (BigDecimal)invoice.getValueAt(i, i_applied);
				//  semi-fixed fields (reset after first invoice)
				BigDecimal DiscountAmt = (BigDecimal)invoice.getValueAt(i, i_discount);
				BigDecimal WriteOffAmt = (BigDecimal)invoice.getValueAt(i, i_writeOff);
				//	OverUnderAmt needs to be in Allocation Currency
				BigDecimal OverUnderAmt = ((BigDecimal)invoice.getValueAt(i, i_open))
					.subtract(AppliedAmt).subtract(DiscountAmt).subtract(WriteOffAmt);

                // @fchiappano Convertir valores de la factura y setear la moneda correcta en la asignación.
                if (esMonedaExtranjera)
                {
                    tasaCambio = (BigDecimal) factura.get_Value("TasaDeCambio");
                    DiscountAmt = DiscountAmt.divide(tasaCambio, redondeo, RoundingMode.FLOOR);
                    WriteOffAmt = WriteOffAmt.divide(tasaCambio, redondeo, RoundingMode.FLOOR);
                    OverUnderAmt = OverUnderAmt.divide(tasaCambio, redondeo, RoundingMode.FLOOR);
                }

                // @fchiappano Si la moneda de la factura difiere de la moneda
                // seleccionada en la ventana, aplicar conversion al monto
                // aplicado, ya que viene convertido según este ultimo criterio.
                if (monedaFactura_ID != C_Currency_ID)
                    AppliedAmt = AppliedAmt.divide(tasaCambio, redondeo, RoundingMode.FLOOR);

                log.config("Invoice #" + i + " - AppliedAmt=" + AppliedAmt);// + " -> " + AppliedAbs);
				//  loop through all payments until invoice applied

				for (int j = 0; j < paymentList.size() && AppliedAmt.signum() != 0; j++)
				{
					int C_Payment_ID = ((Integer)paymentList.get(j)).intValue();
					BigDecimal PaymentAmt = (BigDecimal)amountList.get(j);
					if (PaymentAmt.signum() == AppliedAmt.signum())	// only match same sign (otherwise appliedAmt increases)
					{												// and not zero (appliedAmt was checked earlier)
						log.config(".. with payment #" + j + ", Amt=" + PaymentAmt);

						BigDecimal amount = AppliedAmt;

                        // @fchiappano Si la factura es en moneda extrangera,
                        // convertir el monto a asignar del cobro/pago.
                        if (esMonedaExtranjera)
                        {
                            PaymentAmt = PaymentAmt.divide(tasaCambio, redondeo, RoundingMode.FLOOR);

                            // @fchiappano Setear tasa de cambio en la cabecera del recibo,
                            // para evitar errores en la posterior validación de la asignación.
                            MPayment cobro = new MPayment(Env.getCtx(), C_Payment_ID, trxName);
                            if (cobro.get_ValueAsInt("LAR_PaymentHeader_ID") > 0)
                            {
                                MLARPaymentHeader cabecera = new MLARPaymentHeader(Env.getCtx(),
                                        cobro.get_ValueAsInt("LAR_PaymentHeader_ID"), trxName);
                                cabecera.set_ValueOfColumn("TasaDeCambio", tasaCambio);
                                cabecera.saveEx(trxName);
                            }
                        }
                        // @fchiappano Fin de Conversión de moneda.

						if (amount.abs().compareTo(PaymentAmt.abs()) > 0)  // if there's more open on the invoice
							amount = PaymentAmt;							// than left in the payment

						//	Allocation Line
                        MAllocationLine aLine = new MAllocationLine(alloc, amount,
							DiscountAmt, WriteOffAmt, OverUnderAmt);
						aLine.setDocInfo(C_BPartner_ID, C_Order_ID, C_Invoice_ID);
						aLine.setPaymentInfo(C_Payment_ID, C_CashLine_ID);
                        // @fchiappano Setear tasa de cambio en linea de asignacion.
                        aLine.set_ValueOfColumn("TasaDeCambio", tasaCambio);
						aLine.saveEx();

						//  Apply Discounts and WriteOff only first time
						DiscountAmt = Env.ZERO;
						WriteOffAmt = Env.ZERO;
						//  subtract amount from Payment/Invoice
						AppliedAmt = AppliedAmt.subtract(amount);
						PaymentAmt = PaymentAmt.subtract(amount);
						log.fine("Allocation Amount=" + amount + " - Remaining  Applied=" + AppliedAmt + ", Payment=" + PaymentAmt);
						amountList.set(j, PaymentAmt);  //  update
					}	//	for all applied amounts
				}	//	loop through payments for invoice

				if ( AppliedAmt.signum() == 0 && DiscountAmt.signum() == 0 && WriteOffAmt.signum() == 0)
				{
                    // @fchiappano guardar el notaCredito_ID, para en la
                    // siguiente vuelta, generar la vinculación cruzada en
                    // la asignación, con la factura.
                    if (factura.getC_DocType().getDocBaseType().equals(MDocType.DOCBASETYPE_ARCreditMemo)
                            || factura.getC_DocType().getDocBaseType().equals(MDocType.DOCBASETYPE_APCreditMemo))
                        notaCredito_ID = C_Invoice_ID;
					continue;
				}
				else {			// remainder will need to match against other invoices
					int C_Payment_ID = 0;

					//	Allocation Line
					MAllocationLine aLine = new MAllocationLine (alloc, AppliedAmt,
						DiscountAmt, WriteOffAmt, OverUnderAmt);
					aLine.setDocInfo(C_BPartner_ID, C_Order_ID, C_Invoice_ID);
					aLine.setPaymentInfo(C_Payment_ID, C_CashLine_ID);

                    // @fchiappano si se trata de una factura y el
                    // notacredito_ID es mayor a cero, quiere decir que
                    // anteriorrmente, se asigno una nota de credito y se debe
                    // generar la vinculación cruzada.
                    if (factura.getC_DocType().getDocBaseType().equals(MDocType.DOCBASETYPE_ARInvoice)
                            && notaCredito_ID > 0)
                    {
                        aLine.set_ValueOfColumn("NotaCredito_ID", notaCredito_ID);
                        notaCredito_ID = 0;
                    }

					aLine.saveEx();
					log.fine("Allocation Amount=" + AppliedAmt);
					unmatchedApplied = unmatchedApplied.add(AppliedAmt);
				}

                // @fchiappano guardar el notaCredito_ID, para en la
                // siguiente vuelta, generar la vinculación cruzada en la
                // asignación, con la factura.
                if (factura.getC_DocType().getDocBaseType().equals(MDocType.DOCBASETYPE_ARCreditMemo)
                        || factura.getC_DocType().getDocBaseType().equals(MDocType.DOCBASETYPE_APCreditMemo))
                    notaCredito_ID = C_Invoice_ID;

		}   //  invoice loop

        // @fchiappano procesar la asignación de factura.
        if (alloc != null && alloc.get_ID() != 0)
        {
            alloc.processIt(DocAction.ACTION_Complete);
            alloc.saveEx();
        }

		// check for unapplied payment amounts (eg from payment reversals)
		for (int i = 0; i < paymentList.size(); i++)	{

            BigDecimal payAmt = (BigDecimal) amountList.get(i);
            if (payAmt.signum() == 0)
                continue;

			// Create Allocation
            alloc = new MAllocationHdr(Env.getCtx(), true, // manual
                    DateTrx, C_Currency_ID, Env.getContext(Env.getCtx(), "#AD_User_Name"), trxName);
            alloc.setAD_Org_ID(AD_Org_ID);
            alloc.saveEx();

			int C_Payment_ID = ((Integer)paymentList.get(i)).intValue();
			log.fine("Payment=" + C_Payment_ID
					+ ", Amount=" + payAmt);

			//	Allocation Line
			MAllocationLine aLine = new MAllocationLine (alloc, payAmt,
				Env.ZERO, Env.ZERO, Env.ZERO);
			aLine.setDocInfo(C_BPartner_ID, 0, 0);
			aLine.setPaymentInfo(C_Payment_ID, 0);
			aLine.saveEx();
			unmatchedApplied = unmatchedApplied.subtract(payAmt);
            // Should start WF
            if (alloc.get_ID() != 0)
            {
                alloc.processIt(DocAction.ACTION_Complete);
                alloc.saveEx();
            }
		}

		if ( unmatchedApplied.signum() != 0 )
			log.log(Level.SEVERE, "Allocation not balanced -- out by " + unmatchedApplied );

		//  Test/Set IsPaid for Invoice - requires that allocation is posted
		for (int i = 0; i < iRows; i++)
		{
			//  Invoice line is selected
			if (((Boolean)invoice.getValueAt(i, 0)).booleanValue())
			{
				KeyNamePair pp = (KeyNamePair)invoice.getValueAt(i, 2);    //  Value
				//  Invoice variables
				int C_Invoice_ID = pp.getKey();
				String sql = "SELECT invoiceOpen(C_Invoice_ID, 0) "
					+ "FROM C_Invoice WHERE C_Invoice_ID=?";
				BigDecimal open = DB.getSQLValueBD(trxName, sql, C_Invoice_ID);
				if (open != null && open.signum() == 0)	{
					sql = "UPDATE C_Invoice SET IsPaid='Y' "
						+ "WHERE C_Invoice_ID=" + C_Invoice_ID;
					int no = DB.executeUpdate(sql, trxName);
					log.config("Invoice #" + i + " is paid - updated=" + no);
				} else
					log.config("Invoice #" + i + " is not paid - " + open);
			}
		}
		//  Test/Set Payment is fully allocated
		for (int i = 0; i < paymentList.size(); i++)
		{
			int C_Payment_ID = ((Integer)paymentList.get(i)).intValue();
			MPayment pay = new MPayment (Env.getCtx(), C_Payment_ID, trxName);
			if (pay.testAllocation())
				pay.saveEx();
			log.config("Payment #" + i + (pay.isAllocated() ? " not" : " is")
					+ " fully allocated");
		}
		paymentList.clear();
		amountList.clear();

		return "Asignación generada con exito.";
	}   //  saveData

    /**
     * Ordenar lista segun el tipo de documento.
     *
     * @param invoiceList
     */
    private void ordenarLista(List<Integer[]> invoiceList)
    {
        Collections.sort(invoiceList, new Comparator<Integer[]>()
        {
            public int compare(Integer[] o1, Integer[] o2)
            {
                return o1[2].compareTo(o2[2]);
            }
        });
    } // ordenarLista
} // Allocation
