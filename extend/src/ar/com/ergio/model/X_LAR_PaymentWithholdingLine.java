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
import java.util.Properties;
import org.compiere.model.*;
import org.compiere.util.Env;

/** Generated Model for LAR_PaymentWithholdingLine
 *  @author Adempiere (generated) 
 *  @version 361.Final (6410:0234094) | LAR 2.6.5 - $Id$ */
public class X_LAR_PaymentWithholdingLine extends PO implements I_LAR_PaymentWithholdingLine, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20190414L;

    /** Standard Constructor */
    public X_LAR_PaymentWithholdingLine (Properties ctx, int LAR_PaymentWithholdingLine_ID, String trxName)
    {
      super (ctx, LAR_PaymentWithholdingLine_ID, trxName);
      /** if (LAR_PaymentWithholdingLine_ID == 0)
        {
			setLAR_PaymentWithholding_ID (0);
			setLAR_PaymentWithholdingLine_ID (0);
			setProcessed (false);
			setTaxAmt (Env.ZERO);
			setTaxBaseAmt (Env.ZERO);
        } */
    }

    /** Load Constructor */
    public X_LAR_PaymentWithholdingLine (Properties ctx, ResultSet rs, String trxName)
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
      StringBuffer sb = new StringBuffer ("X_LAR_PaymentWithholdingLine[")
        .append(get_ID()).append("]");
      return sb.toString();
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

	public I_C_Payment getC_Payment() throws RuntimeException
    {
		return (I_C_Payment)MTable.get(getCtx(), I_C_Payment.Table_Name)
			.getPO(getC_Payment_ID(), get_TrxName());	}

	/** Set Payment.
		@param C_Payment_ID 
		Payment identifier
	  */
	public void setC_Payment_ID (int C_Payment_ID)
	{
		if (C_Payment_ID < 1) 
			set_Value (COLUMNNAME_C_Payment_ID, null);
		else 
			set_Value (COLUMNNAME_C_Payment_ID, Integer.valueOf(C_Payment_ID));
	}

	/** Get Payment.
		@return Payment identifier
	  */
	public int getC_Payment_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_Payment_ID);
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
			set_Value (COLUMNNAME_C_Tax_ID, null);
		else 
			set_Value (COLUMNNAME_C_Tax_ID, Integer.valueOf(C_Tax_ID));
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

	/** Set Description.
		@param Description 
		Optional short description of the record
	  */
	public void setDescription (String Description)
	{
		set_Value (COLUMNNAME_Description, Description);
	}

	/** Get Description.
		@return Optional short description of the record
	  */
	public String getDescription () 
	{
		return (String)get_Value(COLUMNNAME_Description);
	}

	public ar.com.ergio.model.I_LAR_PaymentWithholding getLAR_PaymentWithholding() throws RuntimeException
    {
		return (ar.com.ergio.model.I_LAR_PaymentWithholding)MTable.get(getCtx(), ar.com.ergio.model.I_LAR_PaymentWithholding.Table_Name)
			.getPO(getLAR_PaymentWithholding_ID(), get_TrxName());	}

	/** Set LAR_PaymentWithholding.
		@param LAR_PaymentWithholding_ID LAR_PaymentWithholding	  */
	public void setLAR_PaymentWithholding_ID (int LAR_PaymentWithholding_ID)
	{
		if (LAR_PaymentWithholding_ID < 1) 
			set_Value (COLUMNNAME_LAR_PaymentWithholding_ID, null);
		else 
			set_Value (COLUMNNAME_LAR_PaymentWithholding_ID, Integer.valueOf(LAR_PaymentWithholding_ID));
	}

	/** Get LAR_PaymentWithholding.
		@return LAR_PaymentWithholding	  */
	public int getLAR_PaymentWithholding_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_PaymentWithholding_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set LAR_PaymentWithholdingLine.
		@param LAR_PaymentWithholdingLine_ID LAR_PaymentWithholdingLine	  */
	public void setLAR_PaymentWithholdingLine_ID (int LAR_PaymentWithholdingLine_ID)
	{
		if (LAR_PaymentWithholdingLine_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LAR_PaymentWithholdingLine_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LAR_PaymentWithholdingLine_ID, Integer.valueOf(LAR_PaymentWithholdingLine_ID));
	}

	/** Get LAR_PaymentWithholdingLine.
		@return LAR_PaymentWithholdingLine	  */
	public int getLAR_PaymentWithholdingLine_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_PaymentWithholdingLine_ID);
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