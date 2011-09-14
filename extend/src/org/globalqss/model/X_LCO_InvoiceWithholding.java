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
package org.globalqss.model;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Properties;
import org.compiere.model.*;
import org.compiere.util.Env;

/** Generated Model for LCO_InvoiceWithholding
 *  @author Adempiere (generated) 
 *  @version Release 3.6.0LTS - $Id$ */
public class X_LCO_InvoiceWithholding extends PO implements I_LCO_InvoiceWithholding, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20100617L;

    /** Standard Constructor */
    public X_LCO_InvoiceWithholding (Properties ctx, int LCO_InvoiceWithholding_ID, String trxName)
    {
      super (ctx, LCO_InvoiceWithholding_ID, trxName);
      /** if (LCO_InvoiceWithholding_ID == 0)
        {
			setC_Invoice_ID (0);
			setIsTaxIncluded (false);
// N
			setLCO_InvoiceWithholding_ID (0);
			setLCO_WithholdingType_ID (0);
			setProcessed (false);
// N
			setTaxAmt (Env.ZERO);
			setTaxBaseAmt (Env.ZERO);
        } */
    }

    /** Load Constructor */
    public X_LCO_InvoiceWithholding (Properties ctx, ResultSet rs, String trxName)
    {
      super (ctx, rs, trxName);
    }

    /** AccessLevel
      * @return 1 - Org 
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
      StringBuffer sb = new StringBuffer ("X_LCO_InvoiceWithholding[")
        .append(get_ID()).append("]");
      return sb.toString();
    }

	public I_C_AllocationLine getC_AllocationLine() throws RuntimeException
    {
		return (I_C_AllocationLine)MTable.get(getCtx(), I_C_AllocationLine.Table_Name)
			.getPO(getC_AllocationLine_ID(), get_TrxName());	}

	/** Set Allocation Line.
		@param C_AllocationLine_ID 
		Allocation Line
	  */
	public void setC_AllocationLine_ID (int C_AllocationLine_ID)
	{
		if (C_AllocationLine_ID < 1) 
			set_Value (COLUMNNAME_C_AllocationLine_ID, null);
		else 
			set_Value (COLUMNNAME_C_AllocationLine_ID, Integer.valueOf(C_AllocationLine_ID));
	}

	/** Get Allocation Line.
		@return Allocation Line
	  */
	public int getC_AllocationLine_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_AllocationLine_ID);
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
			set_ValueNoCheck (COLUMNNAME_C_Invoice_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_C_Invoice_ID, Integer.valueOf(C_Invoice_ID));
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

	public I_C_Tax getC_Tax() throws RuntimeException
    {
		return (I_C_Tax)MTable.get(getCtx(), I_C_Tax.Table_Name)
			.getPO(getC_Tax_ID(), get_TrxName());	}

	/** Set Tax.
		@param C_Tax_ID 
		Tax identifier
	  */
	public void setC_Tax_ID (int C_Tax_ID)
	{
		if (C_Tax_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_C_Tax_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_C_Tax_ID, Integer.valueOf(C_Tax_ID));
	}

	/** Get Tax.
		@return Tax identifier
	  */
	public int getC_Tax_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_Tax_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Account Date.
		@param DateAcct 
		Accounting Date
	  */
	public void setDateAcct (Timestamp DateAcct)
	{
		set_Value (COLUMNNAME_DateAcct, DateAcct);
	}

	/** Get Account Date.
		@return Accounting Date
	  */
	public Timestamp getDateAcct () 
	{
		return (Timestamp)get_Value(COLUMNNAME_DateAcct);
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

	/** Set Is Calc On Payment.
		@param IsCalcOnPayment Is Calc On Payment	  */
	public void setIsCalcOnPayment (boolean IsCalcOnPayment)
	{
		set_ValueNoCheck (COLUMNNAME_IsCalcOnPayment, Boolean.valueOf(IsCalcOnPayment));
	}

	/** Get Is Calc On Payment.
		@return Is Calc On Payment	  */
	public boolean isCalcOnPayment () 
	{
		Object oo = get_Value(COLUMNNAME_IsCalcOnPayment);
		if (oo != null) 
		{
			 if (oo instanceof Boolean) 
				 return ((Boolean)oo).booleanValue(); 
			return "Y".equals(oo);
		}
		return false;
	}

	/** Set Price includes Tax.
		@param IsTaxIncluded 
		Tax is included in the price 
	  */
	public void setIsTaxIncluded (boolean IsTaxIncluded)
	{
		set_Value (COLUMNNAME_IsTaxIncluded, Boolean.valueOf(IsTaxIncluded));
	}

	/** Get Price includes Tax.
		@return Tax is included in the price 
	  */
	public boolean isTaxIncluded () 
	{
		Object oo = get_Value(COLUMNNAME_IsTaxIncluded);
		if (oo != null) 
		{
			 if (oo instanceof Boolean) 
				 return ((Boolean)oo).booleanValue(); 
			return "Y".equals(oo);
		}
		return false;
	}

	/** Set Invoice Withholding.
		@param LCO_InvoiceWithholding_ID Invoice Withholding	  */
	public void setLCO_InvoiceWithholding_ID (int LCO_InvoiceWithholding_ID)
	{
		if (LCO_InvoiceWithholding_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LCO_InvoiceWithholding_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LCO_InvoiceWithholding_ID, Integer.valueOf(LCO_InvoiceWithholding_ID));
	}

	/** Get Invoice Withholding.
		@return Invoice Withholding	  */
	public int getLCO_InvoiceWithholding_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LCO_InvoiceWithholding_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public org.globalqss.model.I_LCO_WithholdingRule getLCO_WithholdingRule() throws RuntimeException
    {
		return (org.globalqss.model.I_LCO_WithholdingRule)MTable.get(getCtx(), org.globalqss.model.I_LCO_WithholdingRule.Table_Name)
			.getPO(getLCO_WithholdingRule_ID(), get_TrxName());	}

	/** Set Withholding Rule.
		@param LCO_WithholdingRule_ID Withholding Rule	  */
	public void setLCO_WithholdingRule_ID (int LCO_WithholdingRule_ID)
	{
		if (LCO_WithholdingRule_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LCO_WithholdingRule_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LCO_WithholdingRule_ID, Integer.valueOf(LCO_WithholdingRule_ID));
	}

	/** Get Withholding Rule.
		@return Withholding Rule	  */
	public int getLCO_WithholdingRule_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LCO_WithholdingRule_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public org.globalqss.model.I_LCO_WithholdingType getLCO_WithholdingType() throws RuntimeException
    {
		return (org.globalqss.model.I_LCO_WithholdingType)MTable.get(getCtx(), org.globalqss.model.I_LCO_WithholdingType.Table_Name)
			.getPO(getLCO_WithholdingType_ID(), get_TrxName());	}

	/** Set Withholding Type.
		@param LCO_WithholdingType_ID Withholding Type	  */
	public void setLCO_WithholdingType_ID (int LCO_WithholdingType_ID)
	{
		if (LCO_WithholdingType_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LCO_WithholdingType_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LCO_WithholdingType_ID, Integer.valueOf(LCO_WithholdingType_ID));
	}

	/** Get Withholding Type.
		@return Withholding Type	  */
	public int getLCO_WithholdingType_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LCO_WithholdingType_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Percent.
		@param Percent 
		Percentage
	  */
	public void setPercent (BigDecimal Percent)
	{
		set_Value (COLUMNNAME_Percent, Percent);
	}

	/** Get Percent.
		@return Percentage
	  */
	public BigDecimal getPercent () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_Percent);
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

	/** Set Tax Amount.
		@param TaxAmt 
		Tax Amount for a document
	  */
	public void setTaxAmt (BigDecimal TaxAmt)
	{
		set_Value (COLUMNNAME_TaxAmt, TaxAmt);
	}

	/** Get Tax Amount.
		@return Tax Amount for a document
	  */
	public BigDecimal getTaxAmt () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_TaxAmt);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set Tax base Amount.
		@param TaxBaseAmt 
		Base for calculating the tax amount
	  */
	public void setTaxBaseAmt (BigDecimal TaxBaseAmt)
	{
		set_Value (COLUMNNAME_TaxBaseAmt, TaxBaseAmt);
	}

	/** Get Tax base Amount.
		@return Base for calculating the tax amount
	  */
	public BigDecimal getTaxBaseAmt () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_TaxBaseAmt);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}
}