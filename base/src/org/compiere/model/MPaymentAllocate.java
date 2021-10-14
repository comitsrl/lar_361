/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved.                *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
package org.compiere.model;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.util.DB;
import org.compiere.util.Env;
import org.compiere.util.Msg;

import ar.com.ergio.model.MLARPaymentHeader;
import ar.com.ergio.util.LAR_Utils;

/**
 * 	Payment Allocate Model
 *	
 *  @author Jorg Janke
 *  @version $Id: MPaymentAllocate.java,v 1.3 2006/07/30 00:51:05 jjanke Exp $
 */
public class MPaymentAllocate extends X_C_PaymentAllocate
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2894385378672375131L;
    /** AP Credit Memo = APC */
    public static final String DOCBASETYPE_APCreditMemo = "APC";
    /** AR Credit Memo = ARC */
    public static final String DOCBASETYPE_ARCreditMemo = "ARC";

	/**
	 * 	Get active Payment Allocation of Payment
	 *	@param parent payment
	 *	@return array of allocations
	 */
	public static MPaymentAllocate[] get (MPayment parent)
	{
		final String whereClause = "C_Payment_ID=?";
		Query query = MTable.get(parent.getCtx(), Table_ID).createQuery(whereClause, parent.get_TrxName());
		query.setParameters(parent.getC_Payment_ID()).setOnlyActiveRecords(true);
		List<MPaymentAllocate> list = query.list();
		return list.toArray(new MPaymentAllocate[list.size()]);
	}	//	get
	
	/**************************************************************************
	 * 	Standard Constructor
	 *	@param ctx context
	 *	@param C_PaymentAllocate_ID id
	 *	@param trxName trx
	 */
	public MPaymentAllocate (Properties ctx, int C_PaymentAllocate_ID, String trxName)
	{
		super (ctx, C_PaymentAllocate_ID, trxName);
		if (C_PaymentAllocate_ID == 0)
		{
		//	setC_Payment_ID (0);	//	Parent
		//	setC_Invoice_ID (0);
			setAmount (Env.ZERO);
			setDiscountAmt (Env.ZERO);
			setOverUnderAmt (Env.ZERO);
			setWriteOffAmt (Env.ZERO);
			setInvoiceAmt(Env.ZERO);
		}	
	}	//	MPaymentAllocate

	/**	The Invoice				*/
	private MInvoice	m_invoice = null;
	
	/**
	 * 	Load Cosntructor
	 *	@param ctx context
	 *	@param rs result set
	 *	@param trxName trx
	 */
	public MPaymentAllocate (Properties ctx, ResultSet rs, String trxName)
	{
		super (ctx, rs, trxName);
	}	//	MPaymentAllocate
	
	/**
	 * 	Set C_Invoice_ID
	 *	@param C_Invoice_ID id
	 */
	public void setC_Invoice_ID (int C_Invoice_ID)
	{
		super.setC_Invoice_ID (C_Invoice_ID);
		m_invoice = null;
	}	//	setC_Invoice_ID
	
	/**
	 * 	Get Invoice
	 *	@return invoice
	 */
	public MInvoice getInvoice()
	{
		if (m_invoice == null && getC_Invoice_ID() != 0)
			m_invoice = new MInvoice(getCtx(), getC_Invoice_ID(), get_TrxName());
		return m_invoice;
	}	//	getInvoice
	
	/**
	 * 	Get BPartner of Invoice
	 *	@return bp
	 */
	public int getC_BPartner_ID()
	{
		if (m_invoice == null)
			getInvoice();
		if (m_invoice == null)
			return 0;
		return m_invoice.getC_BPartner_ID();
	}	//	getC_BPartner_ID
	
	
	/**
	 * 	Before Save
	 *	@param newRecord new
	 *	@return true
	 */
	protected boolean beforeSave (boolean newRecord)
	{
		MPayment payment = new MPayment (getCtx(), getC_Payment_ID(), get_TrxName());
		if ((newRecord || is_ValueChanged("C_Invoice_ID"))
			&& (payment.getC_Charge_ID() != 0 
				|| payment.getC_Invoice_ID() != 0 
				|| payment.getC_Order_ID() != 0))
		{
			log.saveError("PaymentIsAllocated", "");
			return false;
		}
		
		BigDecimal check = getAmount()
			.add(getDiscountAmt())
			.add(getWriteOffAmt())
			.add(getOverUnderAmt());
		if (check.compareTo(getInvoiceAmt()) != 0)
		{
			log.saveError("Error", Msg.parseTranslation(getCtx(), 
				"@InvoiceAmt@(" + getInvoiceAmt()
				+ ") <> @Totals@(" + check + ")"));
			return false;
		}
		
		//	Org
		if (newRecord || is_ValueChanged("C_Invoice_ID"))
		{
			getInvoice();
			if (m_invoice != null)
				setAD_Org_ID(m_invoice.getAD_Org_ID());

            // Evita que se puedan agregar Notas de Crédito
            MDocType docType = new MDocType(Env.getCtx(), m_invoice.getC_DocType_ID(), get_TrxName());
            if (docType.getDocBaseType().equals(DOCBASETYPE_APCreditMemo)
                    || docType.getDocBaseType().equals(DOCBASETYPE_ARCreditMemo))
            {
                log.saveError("Error", "No está permitido ingresar Notas de Crédito");
                return false;
            }
		}

        // @fchiappano No permitir agregar facturas con distintas monedas.
        if (get_ValueAsInt("LAR_PaymentHeader_ID") > 0 && is_ValueChanged("C_Invoice_ID"))
        {
            String sql = "SELECT i.C_Currency_ID"
                       +  " FROM C_PaymentAllocate pa"
                       +  " JOIN C_Invoice i ON pa.C_Invoice_ID = i.C_Invoice_ID"
                       + " WHERE pa.LAR_PaymentHeader_ID = ? AND pa.C_PaymentAllocate_ID != ?";

            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try
            {
                pstmt = DB.prepareStatement(sql, get_TrxName());
                pstmt.setInt(1, get_ValueAsInt("LAR_PaymentHeader_ID"));
                pstmt.setInt(2, getC_PaymentAllocate_ID());
                rs = pstmt.executeQuery();

                while (rs.next())
                {
                    if (rs.getInt(1) != getInvoice().getC_Currency_ID())
                    {
                        log.saveError("Error", "No está permitido ingresar Facturas con distintas Monedas.");
                        return false;
                    }
                }
            }
            catch (SQLException eSql)
            {
                log.log(Level.SEVERE, sql, eSql);
            }
            finally
            {
                DB.close(rs, pstmt);
                rs = null;
                pstmt = null;
            }

            // @fchiappano Si es factura en moneda extranjera, validar que no
            // haya mas de una cargada en el Recibo/Pago.
            int monedaPredeterminada = LAR_Utils.getMonedaPredeterminada(p_ctx, getAD_Client_ID(), get_TrxName());
            if (m_invoice.getC_Currency_ID() != monedaPredeterminada)
            {
                sql = "SELECT COUNT (p.C_Invoice_ID)"
                    +  " FROM C_PaymentAllocate p"
                    +  " JOIN C_Invoice i ON p.C_Invoice_ID = i.C_Invoice_ID"
                    + " WHERE p.LAR_PaymentHeader_ID = " + get_ValueAsInt("LAR_PaymentHeader_ID")
                    +   " AND i.C_Currency_ID != " + monedaPredeterminada
                    +   " AND p.C_Invoice_ID != ?";

                int count = DB.getSQLValue(get_TrxName(), sql, m_invoice.getC_Invoice_ID());

                if (count > 0)
                {
                    log.saveError("Error",
                            "No está permitido ingresar mas de una factura en moneda extranjera, debido a que pueden existir diferencias de tasas de cambio.");
                    return false;
                }
            }
        } // @fchiappano No permitir agregar facturas con distintas monedas.

		return true;
	}	//	beforeSave

    /**
     * After Save
     *
     * @param newRecord new
     * @param success success
     * @return success
     */
    protected boolean afterSave(boolean newRecord, boolean success)
    {
        // @fchiappano no realizar acciones, si el registro no fue guardado.
        if (!success)
            return success;

        // @fchippano Obtener la tasa de cambio, desde la factura.
        if (get_ValueAsInt("LAR_PaymentHeader_ID") > 0)
        {
            MLARPaymentHeader paymentHeader = new MLARPaymentHeader(p_ctx, get_ValueAsInt("LAR_PaymentHeader_ID"), get_TrxName());
            paymentHeader.set_Value("TasaDeCambio", getInvoice().get_Value("TasaDeCambio"));
            paymentHeader.set_Value("C_CurrencyTo_ID", getInvoice().get_Value("C_Currency_ID"));
            paymentHeader.saveEx();
        }

        return true;
    } // afterSave
	
}	//	MPaymentAllocate
