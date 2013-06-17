/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2007 ComPiere, Inc. All Rights Reserved.                *
 * This program is free software, you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY, without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program, if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
/** Generated Model - DO NOT CHANGE */
package ar.com.ergio.model;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Properties;
import org.compiere.model.*;
import org.compiere.util.Env;

/** Generated Model for LAR_PaymentHeader
 *  @author Adempiere (generated)
 *  @version 3.6.1-P20111003 | LAR 1.0.1-1c3c4dd - $Id$ */
public class X_LAR_PaymentHeader extends PO implements I_LAR_PaymentHeader, I_Persistent
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20130205L;

    /** Standard Constructor */
    public X_LAR_PaymentHeader (Properties ctx, int LAR_PaymentHeader_ID, String trxName)
    {
      super (ctx, LAR_PaymentHeader_ID, trxName);
      /** if (LAR_PaymentHeader_ID == 0)
        {
			setC_BPartner_ID (0);
			setC_DocType_ID (0);
			setDocAction (null);
// CO
			setDocStatus (null);
// DR
			setLAR_PaymentHeader_ID (0);
        } */
    }

    /** Load Constructor */
    public X_LAR_PaymentHeader (Properties ctx, ResultSet rs, String trxName)
    {
      super (ctx, rs, trxName);
    }

    /** AccessLevel
      * @return 3 - Client - Org
      */
    protected int get_AccessLevel()
    {
      return accessLevel.intValue();
    }

    /** Load Meta Data */
    protected POInfo initPO (Properties ctx)
    {
      POInfo poi = POInfo.getPOInfo (ctx, Table_ID, get_TrxName());
      return poi;
    }

    public String toString()
    {
      StringBuffer sb = new StringBuffer ("X_LAR_PaymentHeader[")
        .append(get_ID()).append("]");
      return sb.toString();
    }

	public I_C_BankAccount getC_BankAccount() throws RuntimeException
    {
		return (I_C_BankAccount)MTable.get(getCtx(), I_C_BankAccount.Table_Name)
			.getPO(getC_BankAccount_ID(), get_TrxName());	}

	/** Set Bank Account.
		@param C_BankAccount_ID
		Account at the Bank
	  */
	public void setC_BankAccount_ID (int C_BankAccount_ID)
	{
		if (C_BankAccount_ID < 1)
			set_Value (COLUMNNAME_C_BankAccount_ID, null);
		else
			set_Value (COLUMNNAME_C_BankAccount_ID, Integer.valueOf(C_BankAccount_ID));
	}

	/** Get Bank Account.
		@return Account at the Bank
	  */
	public int getC_BankAccount_ID ()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_BankAccount_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public I_C_BPartner getC_BPartner() throws RuntimeException
    {
		return (I_C_BPartner)MTable.get(getCtx(), I_C_BPartner.Table_Name)
			.getPO(getC_BPartner_ID(), get_TrxName());	}

	/** Set Business Partner .
		@param C_BPartner_ID
		Identifies a Business Partner
	  */
	public void setC_BPartner_ID (int C_BPartner_ID)
	{
		if (C_BPartner_ID < 1)
			set_ValueNoCheck (COLUMNNAME_C_BPartner_ID, null);
		else
			set_ValueNoCheck (COLUMNNAME_C_BPartner_ID, Integer.valueOf(C_BPartner_ID));
	}

	/** Get Business Partner .
		@return Identifies a Business Partner
	  */
	public int getC_BPartner_ID ()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_BPartner_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public I_C_DocType getC_DocType() throws RuntimeException
    {
		return (I_C_DocType)MTable.get(getCtx(), I_C_DocType.Table_Name)
			.getPO(getC_DocType_ID(), get_TrxName());	}

	/** Set Document Type.
		@param C_DocType_ID
		Document type or rules
	  */
	public void setC_DocType_ID (int C_DocType_ID)
	{
		if (C_DocType_ID < 0)
			set_Value (COLUMNNAME_C_DocType_ID, null);
		else
			set_Value (COLUMNNAME_C_DocType_ID, Integer.valueOf(C_DocType_ID));
	}

	/** Get Document Type.
		@return Document type or rules
	  */
	public int getC_DocType_ID ()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_DocType_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public I_C_Invoice getC_Invoice() throws RuntimeException
    {
		return (I_C_Invoice)MTable.get(getCtx(), I_C_Invoice.Table_Name)
			.getPO(getC_Invoice_ID(), get_TrxName());	}

	/** Set Invoice.
		@param C_Invoice_ID
		Invoice Identifier
	  */
	public void setC_Invoice_ID (int C_Invoice_ID)
	{
		if (C_Invoice_ID < 1)
			set_Value (COLUMNNAME_C_Invoice_ID, null);
		else
			set_Value (COLUMNNAME_C_Invoice_ID, Integer.valueOf(C_Invoice_ID));
	}

	/** Get Invoice.
		@return Invoice Identifier
	  */
	public int getC_Invoice_ID ()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_Invoice_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Transaction Date.
		@param DateTrx
		Transaction Date
	  */
	public void setDateTrx (Timestamp DateTrx)
	{
		set_Value (COLUMNNAME_DateTrx, DateTrx);
	}

	/** Get Transaction Date.
		@return Transaction Date
	  */
	public Timestamp getDateTrx ()
	{
		return (Timestamp)get_Value(COLUMNNAME_DateTrx);
	}

	/** Set Detail.
		@param Detail Detail	  */
	public void setDetail (boolean Detail)
	{
		set_Value (COLUMNNAME_Detail, Boolean.valueOf(Detail));
	}

	/** Get Detail.
		@return Detail	  */
	public boolean isDetail ()
	{
		Object oo = get_Value(COLUMNNAME_Detail);
		if (oo != null)
		{
			 if (oo instanceof Boolean)
				 return ((Boolean)oo).booleanValue();
			return "Y".equals(oo);
		}
		return false;
	}

	/** DocAction AD_Reference_ID=135 */
	public static final int DOCACTION_AD_Reference_ID=135;
	/** Complete = CO */
	public static final String DOCACTION_Complete = "CO";
	/** Approve = AP */
	public static final String DOCACTION_Approve = "AP";
	/** Reject = RJ */
	public static final String DOCACTION_Reject = "RJ";
	/** Post = PO */
	public static final String DOCACTION_Post = "PO";
	/** Void = VO */
	public static final String DOCACTION_Void = "VO";
	/** Close = CL */
	public static final String DOCACTION_Close = "CL";
	/** Reverse - Correct = RC */
	public static final String DOCACTION_Reverse_Correct = "RC";
	/** Reverse - Accrual = RA */
	public static final String DOCACTION_Reverse_Accrual = "RA";
	/** Invalidate = IN */
	public static final String DOCACTION_Invalidate = "IN";
	/** Re-activate = RE */
	public static final String DOCACTION_Re_Activate = "RE";
	/** <None> = -- */
	public static final String DOCACTION_None = "--";
	/** Prepare = PR */
	public static final String DOCACTION_Prepare = "PR";
	/** Unlock = XL */
	public static final String DOCACTION_Unlock = "XL";
	/** Wait Complete = WC */
	public static final String DOCACTION_WaitComplete = "WC";
	/** Set Document Action.
		@param DocAction
		The targeted status of the document
	  */
	public void setDocAction (String DocAction)
	{

		set_Value (COLUMNNAME_DocAction, DocAction);
	}

	/** Get Document Action.
		@return The targeted status of the document
	  */
	public String getDocAction ()
	{
		return (String)get_Value(COLUMNNAME_DocAction);
	}

	/** DocStatus AD_Reference_ID=131 */
	public static final int DOCSTATUS_AD_Reference_ID=131;
	/** Drafted = DR */
	public static final String DOCSTATUS_Drafted = "DR";
	/** Completed = CO */
	public static final String DOCSTATUS_Completed = "CO";
	/** Approved = AP */
	public static final String DOCSTATUS_Approved = "AP";
	/** Not Approved = NA */
	public static final String DOCSTATUS_NotApproved = "NA";
	/** Voided = VO */
	public static final String DOCSTATUS_Voided = "VO";
	/** Invalid = IN */
	public static final String DOCSTATUS_Invalid = "IN";
	/** Reversed = RE */
	public static final String DOCSTATUS_Reversed = "RE";
	/** Closed = CL */
	public static final String DOCSTATUS_Closed = "CL";
	/** Unknown = ?? */
	public static final String DOCSTATUS_Unknown = "??";
	/** In Progress = IP */
	public static final String DOCSTATUS_InProgress = "IP";
	/** Waiting Payment = WP */
	public static final String DOCSTATUS_WaitingPayment = "WP";
	/** Waiting Confirmation = WC */
	public static final String DOCSTATUS_WaitingConfirmation = "WC";
	/** Set Document Status.
		@param DocStatus
		The current status of the document
	  */
	public void setDocStatus (String DocStatus)
	{

		set_Value (COLUMNNAME_DocStatus, DocStatus);
	}

	/** Get Document Status.
		@return The current status of the document
	  */
	public String getDocStatus ()
	{
		return (String)get_Value(COLUMNNAME_DocStatus);
	}

	/** Set Document No.
		@param DocumentNo
		Document sequence number of the document
	  */
	public void setDocumentNo (String DocumentNo)
	{
		set_Value (COLUMNNAME_DocumentNo, DocumentNo);
	}

	/** Get Document No.
		@return Document sequence number of the document
	  */
	public String getDocumentNo ()
	{
		return (String)get_Value(COLUMNNAME_DocumentNo);
	}

	/** Set Invoice Amt.
		@param InvoiceAmt Invoice Amt	  */
	public void setInvoiceAmt (BigDecimal InvoiceAmt)
	{
		throw new IllegalArgumentException ("InvoiceAmt is virtual column");	}

	/** Get Invoice Amt.
		@return Invoice Amt	  */
	public BigDecimal getInvoiceAmt ()
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_InvoiceAmt);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set Receipt.
		@param IsReceipt
		This is a sales transaction (receipt)
	  */
	public void setIsReceipt (boolean IsReceipt)
	{
		set_Value (COLUMNNAME_IsReceipt, Boolean.valueOf(IsReceipt));
	}

	/** Get Receipt.
		@return This is a sales transaction (receipt)
	  */
	public boolean isReceipt ()
	{
		Object oo = get_Value(COLUMNNAME_IsReceipt);
		if (oo != null)
		{
			 if (oo instanceof Boolean)
				 return ((Boolean)oo).booleanValue();
			return "Y".equals(oo);
		}
		return false;
	}

	/** Set LAR_PaymentHeader.
		@param LAR_PaymentHeader_ID LAR_PaymentHeader	  */
	public void setLAR_PaymentHeader_ID (int LAR_PaymentHeader_ID)
	{
		if (LAR_PaymentHeader_ID < 1)
			set_ValueNoCheck (COLUMNNAME_LAR_PaymentHeader_ID, null);
		else
			set_ValueNoCheck (COLUMNNAME_LAR_PaymentHeader_ID, Integer.valueOf(LAR_PaymentHeader_ID));
	}

	/** Get LAR_PaymentHeader.
		@return LAR_PaymentHeader	  */
	public int getLAR_PaymentHeader_ID ()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_PaymentHeader_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set PayHeaderTotalAmt.
		@param PayHeaderTotalAmt PayHeaderTotalAmt	  */
	public void setPayHeaderTotalAmt (BigDecimal PayHeaderTotalAmt)
	{
		set_Value (COLUMNNAME_PayHeaderTotalAmt, PayHeaderTotalAmt);
	}

	/** Get PayHeaderTotalAmt.
		@return PayHeaderTotalAmt	  */
	public BigDecimal getPayHeaderTotalAmt ()
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_PayHeaderTotalAmt);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set Processed.
		@param Processed
		The document has been processed
	  */
	public void setProcessed (boolean Processed)
	{
		set_Value (COLUMNNAME_Processed, Boolean.valueOf(Processed));
	}

	/** Get Processed.
		@return The document has been processed
	  */
	public boolean isProcessed ()
	{
		Object oo = get_Value(COLUMNNAME_Processed);
		if (oo != null)
		{
			 if (oo instanceof Boolean)
				 return ((Boolean)oo).booleanValue();
			return "Y".equals(oo);
		}
		return false;
	}

	/** Set Remaining Amt.
		@param RemainingAmt
		Remaining Amount
	  */
	public void setRemainingAmt (BigDecimal RemainingAmt)
	{
		throw new IllegalArgumentException ("RemainingAmt is virtual column");	}

	/** Get Remaining Amt.
		@return Remaining Amount
	  */
	public BigDecimal getRemainingAmt ()
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_RemainingAmt);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set SearchPayments.
		@param SearchPayments SearchPayments	  */
	public void setSearchPayments (String SearchPayments)
	{
		set_Value (COLUMNNAME_SearchPayments, SearchPayments);
	}

	/** Get SearchPayments.
		@return SearchPayments	  */
	public String getSearchPayments ()
	{
		return (String)get_Value(COLUMNNAME_SearchPayments);
	}

	/** Set Withholding Amount.
		@param WithholdingAmt Withholding Amount	  */
	public void setWithholdingAmt (BigDecimal WithholdingAmt)
	{
		set_Value (COLUMNNAME_WithholdingAmt, WithholdingAmt);
	}

	/** Get Withholding Amount.
		@return Withholding Amount	  */
	public BigDecimal getWithholdingAmt ()
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_WithholdingAmt);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}
}
