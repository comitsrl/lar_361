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
package org.compiere.acct;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;

import org.compiere.model.MAccount;
import org.compiere.model.MAcctSchema;
import org.compiere.model.MBankAccount;
import org.compiere.model.MCharge;
import org.compiere.model.MDocType;
import org.compiere.model.MPayment;
import org.compiere.model.MSysConfig;
import org.compiere.model.MTax;
import org.compiere.util.Env;

/**
 *  Post Invoice Documents.
 *  <pre>
 *  Table:              C_Payment (335)
 *  Document Types      ARP, APP
 *  </pre>
 *  @author Jorg Janke
 *  @version  $Id: Doc_Payment.java,v 1.3 2006/07/30 00:53:33 jjanke Exp $
 */
public class Doc_Payment extends Doc
{
	/**
	 *  Constructor
	 * 	@param ass accounting schema
	 * 	@param rs record
	 * 	@param trxName trx
	 */
	public Doc_Payment (MAcctSchema as, ResultSet rs, String trxName)
	{
		super (as, MPayment.class, rs, null, trxName);
	}	//	Doc_Payment

	/**	Tender Type				*/
	private String		m_TenderType = null;
	/** Prepayment				*/
	private boolean		m_Prepayment = false;
	/** Es Retención Efectuada             */
    private boolean     m_EsRetencionEfectuada = false;
    /** Es Retención Efectuada             */
    private boolean     m_EsRetencionSufrida = false;
	/** Bank Account			*/
	private int			m_C_BankAccount_ID = 0;
	   /** Bank Account            */
    private int         m_GL_Category_ID = 0;

	/**
	 *  Load Specific Document Details
	 *  @return error message or null
	 */
	protected String loadDocumentDetails ()
	{
		MPayment pay = (MPayment)getPO();
		setDateDoc(pay.getDateTrx());
		m_TenderType = pay.getTenderType();
		m_Prepayment = pay.isPrepayment();
		m_C_BankAccount_ID = pay.getC_BankAccount_ID();
		m_EsRetencionEfectuada = pay.get_ValueAsBoolean("EsRetencionIIBB");
        m_EsRetencionSufrida = pay.get_ValueAsBoolean("EsRetencionSufrida");
		// @mzuniga Se obtiene la categoría de contabilidad del tipo de documento
		MDocType dt_Pay = new MDocType(Env.getCtx(), pay.getC_DocType_ID(), pay.get_TrxName());
		m_GL_Category_ID = dt_Pay.getGL_Category_ID();
		//	Amount
		setAmount(Doc.AMTTYPE_Gross, pay.getPayAmt());
		return null;
	}   //  loadDocumentDetails


	/**************************************************************************
	 *  Get Source Currency Balance - always zero
	 *  @return Zero (always balanced)
	 */
	public BigDecimal getBalance()
	{
		BigDecimal retValue = Env.ZERO;
	//	log.config( toString() + " Balance=" + retValue);
		return retValue;
	}   //  getBalance

	/**
	 *  Create Facts (the accounting logic) for
	 *  ARP, APP.
	 *  <pre>
	 *  ARP
	 *      BankInTransit   DR
	 *      UnallocatedCash         CR
	 *      or Charge/C_Prepayment
	 *  APP
	 *      PaymentSelect   DR
	 *      or Charge/V_Prepayment
	 *      BankInTransit           CR
	 *  CashBankTransfer
	 *      -
	 *  </pre>
	 *  @param as accounting schema
	 *  @return Fact
	 */
	public ArrayList<Fact> createFacts (MAcctSchema as)
	{
		//  create Fact Header
		Fact fact = new Fact(this, as, Fact.POST_Actual);
		//	Cash Transfer
		if ("X".equals(m_TenderType) && !MSysConfig.getBooleanValue("CASH_AS_PAYMENT", true , getAD_Client_ID()))
		{
			ArrayList<Fact> facts = new ArrayList<Fact>();
			facts.add(fact);
			return facts;
		}

        // Si la Cateoría CG (Contabilidad General) del tipo de documento es None (ID 0)
        // No se genera contabilidad para ese documento
        if (m_GL_Category_ID == 0)
        {
            ArrayList<Fact> facts = new ArrayList<Fact>();
            facts.add(fact);
            return facts;
        }

		int AD_Org_ID = getBank_Org_ID();		//	Bank Account Org
		if (getDocumentType().equals(DOCTYPE_ARReceipt))
		{
			//	Asset
            /*
             * Si se trata de un cheque se utiliza la cuenta de valores
             * en lugar de la cuenta de caja.
             *  K     | Check  (Cheque propio)
             *  Z     | Cheque Tercero
             *  O     | Contra Reembolso Cheque Propio
             */
            FactLine fl;
            int combinacion_ID_Valores_a_Depositar = MSysConfig.getIntValue(
                    "LAR_Combinacion_ID_Valores_a_Depositar", 0, getAD_Client_ID());
            if (("K".equals(m_TenderType) || "Z".equals(m_TenderType) || "O".equals(m_TenderType)) & combinacion_ID_Valores_a_Depositar != 0)
            {
                MAccount cuenta = MAccount.get (as.getCtx(), combinacion_ID_Valores_a_Depositar);
                fl = fact.createLine(null, cuenta, getC_Currency_ID(), getAmount(), null);
            } else
            {
                // @mzuniga Si es retención sufrida se utiliza la cuenta
                // contable de la tasa de impuesto (a depositar)
                if (m_EsRetencionSufrida)
                {
                    MPayment pay = (MPayment) getPO();
                    MTax impuesto = new MTax(Env.getCtx(),
                            pay.get_ValueAsInt("C_TaxWithholding_ID"), pay.get_TrxName());
                    BigDecimal importe = pay.getWriteOffAmt();
                    DocTax impuestoDoc = new DocTax(impuesto.getC_Tax_ID(), impuesto.getName(),
                            impuesto.getRate(), Env.ZERO, Env.ZERO, true);
                    MAccount cuenta = impuestoDoc.getAccount(DocTax.ACCTTYPE_TaxDue, as);
                    fl = fact.createLine(null, cuenta, getC_Currency_ID(), importe, null);
                    // Crear la línea con la cuenta a depositar como contrapartida
                } else
                    fl = fact.createLine(null, getAccount(Doc.ACCTTYPE_BankInTransit, as),
                            getC_Currency_ID(), getAmount(), null);
            }
			if (fl != null && AD_Org_ID != 0)
				fl.setAD_Org_ID(AD_Org_ID);
			//
			MAccount acct = null;
			if (getC_Charge_ID() != 0)
				acct = MCharge.getAccount(getC_Charge_ID(), as, getAmount());
			else if (m_Prepayment)
				acct = getAccount(Doc.ACCTTYPE_C_Prepayment, as);
            else
				acct = getAccount(Doc.ACCTTYPE_UnallocatedCash, as);
            // @mzuniga Si es retención sufrida se utiliza la cuenta
            // contable de la tasa de impuesto
            if (m_EsRetencionSufrida)
            {
                MPayment pay = (MPayment) getPO();
                MTax impuesto = new MTax(Env.getCtx(), pay.get_ValueAsInt("C_TaxWithholding_ID"),
                        pay.get_TrxName());
                BigDecimal importe = pay.getWriteOffAmt();
                DocTax impuestoDoc = new DocTax(impuesto.getC_Tax_ID(), impuesto.getName(),
                        impuesto.getRate(), Env.ZERO, Env.ZERO, true);
                acct = impuestoDoc.getAccount(DocTax.ACCTTYPE_TaxCredit, as);
                fl = fact.createLine(null, acct, getC_Currency_ID(), null, importe);
                // Crear la línea con la cuenta a depositar como contrapartida
            } else
                fl = fact.createLine(null, acct, getC_Currency_ID(), null, getAmount());
			if (fl != null && AD_Org_ID != 0
				&& getC_Charge_ID() == 0)		//	don't overwrite charge
				fl.setAD_Org_ID(AD_Org_ID);
		}
		//  APP
		else if (getDocumentType().equals(DOCTYPE_APPayment))
		{
			MAccount acct = null;
			if (getC_Charge_ID() != 0)
				acct = MCharge.getAccount(getC_Charge_ID(), as, getAmount());
			else if (m_Prepayment)
				acct = getAccount(Doc.ACCTTYPE_V_Prepayment, as);
			else
				acct = getAccount(Doc.ACCTTYPE_PaymentSelect, as);

            // En el caso de una retención efectuada se modifica la forma de contabilizar
            FactLine fl = null;
            if (m_EsRetencionEfectuada)
                fl = fact.createLine(null, acct, getC_Currency_ID(), null, getAmount());
            else
                fl = fact.createLine(null, acct, getC_Currency_ID(), getAmount(), null);

			if (fl != null && AD_Org_ID != 0
				&& getC_Charge_ID() == 0)		//	don't overwrite charge
				fl.setAD_Org_ID(AD_Org_ID);

            // Asset
            // En el caso de una retención efectuada se modifica la forma de contabilizar
            if (m_EsRetencionEfectuada)
            fl = fact.createLine(null, m_Prepayment ? getAccount(Doc.ACCTTYPE_V_Prepayment, as) : getAccount(Doc.ACCTTYPE_PaymentSelect, as),
                    getC_Currency_ID(), getAmount(), null);
            else
            {
                /*
                 * Si se trata de un cheque se utiliza la cuenta de valores
                 * en lugar de la cuenta de caja.
                 *  K     | Check  (Cheque propio)
                 *  Z     | Cheque Tercero
                 *  O     | Contra Reembolso Cheque Propio
                 */
                int combinacion_ID_Valores_a_Depositar = MSysConfig.getIntValue(
                        "LAR_Combinacion_ID_Valores_a_Depositar", 0, getAD_Client_ID());
                if (("K".equals(m_TenderType) || "Z".equals(m_TenderType) || "O"
                        .equals(m_TenderType)) & combinacion_ID_Valores_a_Depositar != 0)
                {
                    MAccount cuenta = MAccount.get(as.getCtx(), combinacion_ID_Valores_a_Depositar);
                    fl = fact.createLine(null, cuenta, getC_Currency_ID(), null, getAmount());
                } else
                    fl = fact.createLine(null, getAccount(Doc.ACCTTYPE_BankInTransit, as),
                            getC_Currency_ID(), null, getAmount());
            }
            if (fl != null && AD_Org_ID != 0)
                fl.setAD_Org_ID(AD_Org_ID);
		}
		else
		{
			p_Error = "DocumentType unknown: " + getDocumentType();
			log.log(Level.SEVERE, p_Error);
			fact = null;
		}
		//
		ArrayList<Fact> facts = new ArrayList<Fact>();
		facts.add(fact);
		return facts;
	}   //  createFact

	/**
	 * 	Get AD_Org_ID from Bank Account
	 * 	@return AD_Org_ID or 0
	 */
	private int getBank_Org_ID ()
	{
		if (m_C_BankAccount_ID == 0)
			return 0;
		//
		MBankAccount ba = MBankAccount.get(getCtx(), m_C_BankAccount_ID);
		return ba.getAD_Org_ID();
	}	//	getBank_Org_ID

}   //  Doc_Payment
