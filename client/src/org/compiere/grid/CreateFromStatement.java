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
package org.compiere.grid;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Vector;
import java.util.logging.Level;

import org.compiere.minigrid.IMiniTable;
import org.compiere.model.GridTab;
import org.compiere.model.MBankAccount;
import org.compiere.model.MBankStatement;
import org.compiere.model.MBankStatementLine;
import org.compiere.model.MPayment;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.compiere.util.KeyNamePair;
import org.compiere.util.Msg;

/**
 *  Create Transactions for Bank Statements
 *
 *  @author Jorg Janke
 *  @version  $Id: VCreateFromStatement.java,v 1.2 2006/07/30 00:51:28 jjanke Exp $
 *  @author Victor Perez, e-Evolucion 
 *  <li> RF [1811114] http://sourceforge.net/tracker/index.php?func=detail&aid=1811114&group_id=176962&atid=879335
 *  @author Teo Sarca, www.arhipac.ro
 * 			<li>BF [ 2007837 ] VCreateFrom.save() should run in trx
 */
public abstract class CreateFromStatement extends CreateFrom 
{
	public MBankAccount bankAccount;
	
	/**
	 *  Protected Constructor
	 *  @param mTab MTab
	 */
	public CreateFromStatement(GridTab mTab)
	{
		super(mTab);
		log.info(mTab.toString());
	}   //  VCreateFromInvoice

	/**
	 *  Dynamic Init
	 *  @return true if initialized
	 */
	public boolean dynInit() throws Exception
	{
		log.config("");
		setTitle(Msg.translate(Env.getCtx(), "C_BankStatement_ID") + " / Cierre de Cajas" + " ... " + Msg.translate(Env.getCtx(), "CreateFrom"));
		
		return true;
	}   //  dynInit
	
	/**************************************************************************
	 *	Construct SQL Where Clause and define parameters
	 *  (setParameters needs to set parameters)
	 *  Includes first AND
	 *  @return sql where clause
	 */
	public String getSQLWhere(String DocumentNo, Object BPartner, Object DateFrom, Object DateTo, 
			Object AmtFrom, Object AmtTo, Object DocType, Object TenderType, Object TipoTarjeta, Object TipoTarjetaDebito, String AuthCode)
	{
		StringBuffer sql = new StringBuffer("WHERE p.Processed='Y' AND p.IsReconciled='N'"
		+ " AND p.DocStatus IN ('CO','CL','RE','VO') AND p.PayAmt<>0"
        // @fchiappano Se agrega condición C_BPartner_ID != null, para evitar que se 
		// visualicen movimientos mal generados tras una desconexión con el servidor.
        + " AND p.C_BPartner_ID IS NOT NULL"
		+ " AND p.C_BankAccount_ID = ?");

	    sql.append( " AND NOT EXISTS (SELECT * FROM C_BankStatementLine l " 
		//	Voided Bank Statements have 0 StmtAmt
			+ "WHERE p.C_Payment_ID=l.C_Payment_ID AND l.StmtAmt <> 0)");
		
		if (DocumentNo.length() > 0)
			sql.append(" AND UPPER(p.DocumentNo) LIKE ?");
		//
		if (BPartner != null)
			sql.append(" AND p.C_BPartner_ID=?");
		//
		if (DateFrom != null || DateTo != null)
		{
			Timestamp from = (Timestamp) DateFrom;
			Timestamp to = (Timestamp) DateTo;
			if (from == null && to != null)
				sql.append(" AND TRUNC(p.DateTrx) <= ?");
			else if (from != null && to == null)
				sql.append(" AND TRUNC(p.DateTrx) >= ?");
			else if (from != null && to != null)
				sql.append(" AND TRUNC(p.DateTrx) BETWEEN ? AND ?");
		}
		//
		if (AmtFrom != null || AmtTo != null)
		{
			BigDecimal from = (BigDecimal) AmtFrom;
			BigDecimal to = (BigDecimal) AmtTo;
			if (from == null && to != null)
				sql.append(" AND p.PayAmt <= ?");
			else if (from != null && to == null)
				sql.append(" AND p.PayAmt >= ?");
			else if (from != null && to != null)
				sql.append(" AND p.PayAmt BETWEEN ? AND ?");
		}
		
		if(DocType!=null)
			sql.append(" AND p.C_DocType_ID=?");
        if (TenderType != null && TenderType.toString().length() > 0)
        {
            sql.append(" AND p.TenderType=?");

            if (TenderType.equals(MPayment.TENDERTYPE_CreditCard))
            {
                if (TipoTarjeta != null && TipoTarjeta.toString().length() > 0)
                    sql.append(" AND pay.LAR_Tarjeta_Credito_ID = ?");
            }
            else if (TenderType.equals(MPayment.TENDERTYPE_DirectDebit))
                if (TipoTarjetaDebito != null && TipoTarjetaDebito.toString().length() > 0)
                    sql.append(" AND pay.LAR_Tarjeta_Debito_ID = ?");
        }
		if(AuthCode.length() > 0 )
			sql.append(" AND p.R_AuthCode LIKE ?");

		log.fine(sql.toString());
		return sql.toString();
	}	//	getSQLWhere
	
	/**
	 *  Set Parameters for Query.
	 *  (as defined in getSQLWhere)
	 *  @param pstmt statement
	 *  @param forCount for counting records
	 *  @throws SQLException
	 */
	void setParameters(PreparedStatement pstmt, boolean forCount, 
			String DocumentNo, Object BPartner, Object DateFrom, Object DateTo, 
			Object AmtFrom, Object AmtTo, Object DocType, Object TenderType, Object TipoTarjeta, Object TipoTarjetaDebito, String AuthCode) 
	throws SQLException
	{
		int index = 1;
		
		pstmt.setInt(index++, bankAccount.getC_BankAccount_ID());
		
		if (DocumentNo.length() > 0)
			pstmt.setString(index++, getSQLText(DocumentNo));
		//
		if (BPartner != null)
		{
			Integer bp = (Integer) BPartner;
			pstmt.setInt(index++, bp.intValue());
			log.fine("BPartner=" + bp);
		}
		//
		if (DateFrom != null || DateTo != null)
		{
			Timestamp from = (Timestamp) DateFrom;
			Timestamp to = (Timestamp) DateTo;
			log.fine("Date From=" + from + ", To=" + to);
			if (from == null && to != null)
				pstmt.setTimestamp(index++, to);
			else if (from != null && to == null)
				pstmt.setTimestamp(index++, from);
			else if (from != null && to != null)
			{
				pstmt.setTimestamp(index++, from);
				pstmt.setTimestamp(index++, to);
			}
		}
		//
		if (AmtFrom != null || AmtTo != null)
		{
			BigDecimal from = (BigDecimal) AmtFrom;
			BigDecimal to = (BigDecimal) AmtTo;
			log.fine("Amt From=" + from + ", To=" + to);
			if (from == null && to != null)
				pstmt.setBigDecimal(index++, to);
			else if (from != null && to == null)
				pstmt.setBigDecimal(index++, from);
			else if (from != null && to != null)
			{
				pstmt.setBigDecimal(index++, from);
				pstmt.setBigDecimal(index++, to);
			}
		}
		if(DocType!=null)
			pstmt.setInt(index++, (Integer) DocType);
        if (TenderType != null && TenderType.toString().length() > 0)
        {
            pstmt.setString(index++, (String) TenderType);
            if (TenderType.equals(MPayment.TENDERTYPE_CreditCard))
            {
                if (TipoTarjeta != null && TipoTarjeta.toString().length() > 0)
                    pstmt.setInt(index++, (Integer) TipoTarjeta);
            }
            else if (TenderType.equals(MPayment.TENDERTYPE_DirectDebit))
            {
                if (TipoTarjetaDebito != null && TipoTarjetaDebito.toString().length() > 0)
                    pstmt.setInt(index++, (Integer) TipoTarjetaDebito);
            }
        }
		if(AuthCode.length() > 0 )
			pstmt.setString(index++, getSQLText(AuthCode));

	}   //  setParameters
	
	/**
	 *  Get SQL WHERE parameter
	 *  @param f field
	 *  @return Upper case text with % at the end
	 */
	private String getSQLText (String text)
	{
		String s = text.toUpperCase();
		if (!s.endsWith("%"))
			s += "%";
		log.fine( "String=" + s);
		return s;
	}   //  getSQLText
	
	protected Vector<Vector<Object>> getBankData(String DocumentNo, Object BPartner, Object DateFrom, Object DateTo, 
			Object AmtFrom, Object AmtTo, Object DocType, Object TenderType, Object TipoTarjeta, Object TipoTarjetaDebito, String AuthCode)
	{
		Vector<Vector<Object>> data = new Vector<Vector<Object>>();
		
		String sql = "SELECT p.DateTrx,p.C_Payment_ID,p.DocumentNo, p.C_Currency_ID,c.ISO_Code, p.PayAmt,"
			+ "currencyConvert(p.PayAmt,p.C_Currency_ID,ba.C_Currency_ID,pay.DateAcct,p.C_ConversionType_ID,p.AD_Client_ID,p.AD_Org_ID),"
			+ " bp.Name, rt.Name, p.A_Name, p.CheckNo, pay.Fecha_Venc_Cheque, tc.Name, td.Name, p.R_PnRef, pay.NroCuotas "
			+ "FROM C_BankAccount ba"
			+ " INNER JOIN C_Payment_v p ON (p.C_BankAccount_ID=ba.C_BankAccount_ID)"
			+ " INNER JOIN C_Payment pay ON (p.C_Payment_ID=pay.C_Payment_ID)"
			+ " INNER JOIN C_Currency c ON (p.C_Currency_ID=c.C_Currency_ID)"
			+ " INNER JOIN AD_Ref_List r ON (r.Value=p.TenderType AND r.AD_Reference_ID=214)"
			+ " INNER JOIN AD_Ref_List_Trl rt ON (rt.AD_Ref_List_ID=r.AD_Ref_List_ID)"
			+ "  LEFT JOIN LAR_Tarjeta_Credito tc ON (pay.LAR_Tarjeta_Credito_ID = tc.LAR_Tarjeta_Credito_ID)"
			+ "  LEFT JOIN LAR_Tarjeta_Credito td ON (pay.LAR_Tarjeta_Debito_ID = td.LAR_Tarjeta_Credito_ID)"
			+ " LEFT OUTER JOIN C_BPartner bp ON (p.C_BPartner_ID=bp.C_BPartner_ID) ";

		sql = sql + getSQLWhere(DocumentNo, BPartner, DateFrom, DateTo, AmtFrom, AmtTo, DocType, TenderType, TipoTarjeta, TipoTarjetaDebito, AuthCode) + " ORDER BY p.DateTrx";

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			pstmt = DB.prepareStatement(sql.toString(), null);
			setParameters(pstmt, false, DocumentNo, BPartner, DateFrom, DateTo, AmtFrom, AmtTo, DocType, TenderType, TipoTarjeta, TipoTarjetaDebito, AuthCode);
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				Vector<Object> line = new Vector<Object>(6);
				line.add(new Boolean(false));       //  0-Selection
				line.add(rs.getTimestamp(1));       //  1-DateTrx
				KeyNamePair pp = new KeyNamePair(rs.getInt(2), rs.getString(3));
				line.add(pp);                       //  2-C_Payment_ID
				pp = new KeyNamePair(rs.getInt(4), rs.getString(5));
				line.add(pp);                       //  3-Currency
				line.add(rs.getBigDecimal(6));      //  4-PayAmt
				line.add(rs.getBigDecimal(7));      //  5-Conv Amt
				line.add(rs.getString(8));      	//  6-BParner
				// @fchiappano
				line.add(rs.getString(9));          //  7-TenderType
				line.add(rs.getString(10));         //  8-A_Name
				line.add(rs.getString(11));         //  9-CheckNo
				line.add(rs.getTimestamp(12));      // 10-Fecha Venc.
				line.add(rs.getString(13));         // 11-Tarjeta Credito
				line.add(rs.getString(14));         // 12-Tarjeta Debito
				line.add(rs.getString(15));         // 13-Nro Posnet
				line.add(rs.getInt(16));            // 14-NroCuotas
				data.add(line);
			}
		}
		catch (SQLException e)
		{
			log.log(Level.SEVERE, sql, e);
		}
		finally
		{
			DB.close(rs, pstmt);
			rs = null; pstmt = null;
		}
		
		return data;
	}
	
	public void info()
	{
		
	}
	
	protected void configureMiniTable (IMiniTable miniTable)
	{
		miniTable.setColumnClass(0, Boolean.class, false);      //  0-Selection
		miniTable.setColumnClass(1, Timestamp.class, false);    //  1-TrxDate / nmicoud - idempiere 240 Let user choose the 'Statement Line Date'
		miniTable.setColumnClass(2, String.class, true);        //  2-Payment
		miniTable.setColumnClass(3, String.class, true);        //  3-Currency
		miniTable.setColumnClass(4, BigDecimal.class, true);    //  4-Amount
		miniTable.setColumnClass(5, BigDecimal.class, true);    //  5-ConvAmount
		miniTable.setColumnClass(6, String.class, true);    	//  6-BPartner

		// @fchiappano
		miniTable.setColumnClass(7, String.class, true);        //  7-TenderType
		miniTable.setColumnClass(8, String.class, true);        //  8-A_Name
		miniTable.setColumnClass(9, String.class, true);        //  9-CheckNo
		miniTable.setColumnClass(10, Timestamp.class, true);    // 10-FechaVenc,
		miniTable.setColumnClass(11, String.class, true);       // 11-Tarjeta Credito
		miniTable.setColumnClass(12, String.class, true);       // 12-Tarjeta Debito
		miniTable.setColumnClass(13, String.class, true);       // 13-NroPostnet
		miniTable.setColumnClass(14, Integer.class, true);      // 14-NroCuota
		//  Table UI
		miniTable.autoSize();
	}

	/**
	 *  Save Statement - Insert Data
	 *  @return true if saved
	 */
	public boolean save(IMiniTable miniTable, String trxName)
	{
		//  fixed values
		int C_BankStatement_ID = ((Integer)getGridTab().getValue("C_BankStatement_ID")).intValue();
		MBankStatement bs = new MBankStatement (Env.getCtx(), C_BankStatement_ID, trxName);
		log.config(bs.toString());

		//  Lines
		for (int i = 0; i < miniTable.getRowCount(); i++)
		{
			if (((Boolean)miniTable.getValueAt(i, 0)).booleanValue())
			{
				Timestamp trxDate = (Timestamp)miniTable.getValueAt(i, 1);  //  1-DateTrx
				KeyNamePair pp = (KeyNamePair)miniTable.getValueAt(i, 2);   //  2-C_Payment_ID
				int C_Payment_ID = pp.getKey();
				pp = (KeyNamePair)miniTable.getValueAt(i, 3);               //  3-Currency
				int C_Currency_ID = pp.getKey();
				BigDecimal TrxAmt = (BigDecimal)miniTable.getValueAt(i, 5); //  5- Conv Amt

				log.fine("Line Date=" + trxDate
					+ ", Payment=" + C_Payment_ID + ", Currency=" + C_Currency_ID + ", Amt=" + TrxAmt);
				//	
				MBankStatementLine bsl = new MBankStatementLine (bs);
				bsl.setStatementLineDate(trxDate);
				bsl.setPayment(new MPayment(Env.getCtx(), C_Payment_ID, trxName));
				
				bsl.setTrxAmt(TrxAmt);
				bsl.setStmtAmt(TrxAmt);
				bsl.setC_Currency_ID(bankAccount.getC_Currency_ID()); 
				
				if (!bsl.save())
					log.log(Level.SEVERE, "Line not created #" + i);
			}   //   if selected
		}   //  for all rows
		return true;
	}   //  save
	
	protected Vector<String> getOISColumnNames()
	{
		//  Header Info
		Vector<String> columnNames = new Vector<String>(11);
		columnNames.add(Msg.getMsg(Env.getCtx(), "Select"));
		columnNames.add(Msg.translate(Env.getCtx(), "Date"));
		columnNames.add(Msg.getElement(Env.getCtx(), "C_Payment_ID"));
		columnNames.add(Msg.translate(Env.getCtx(), "C_Currency_ID"));
		columnNames.add(Msg.translate(Env.getCtx(), "Amount"));
		columnNames.add(Msg.translate(Env.getCtx(), "ConvertedAmount"));
		columnNames.add(Msg.translate(Env.getCtx(), "C_BPartner_ID"));

		// @fchiappano
		columnNames.add(Msg.translate(Env.getCtx(), "TenderType"));
		columnNames.add(Msg.translate(Env.getCtx(), "A_Name"));
		columnNames.add(Msg.translate(Env.getCtx(), "CheckNo"));
		columnNames.add(Msg.translate(Env.getCtx(), "Fecha_Venc_Cheque"));
		columnNames.add("Tarjeta Crédito");
		columnNames.add("Tarjeta Débito");
		columnNames.add(Msg.translate(Env.getCtx(), "R_PnRef"));
		columnNames.add("Nro. Cuotas");
	    
	    return columnNames;
	}
}
