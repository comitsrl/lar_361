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

/** Generated Model for LAR_LetterRule
 *  @author Adempiere (generated)
 *  @version 360LTS.015 - $Id$ */
public class X_LAR_LetterRule extends PO implements I_LAR_LetterRule, I_Persistent
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20120313L;

    /** Standard Constructor */
    public X_LAR_LetterRule (Properties ctx, int LAR_LetterRule_ID, String trxName)
    {
      super (ctx, LAR_LetterRule_ID, trxName);
      /** if (LAR_LetterRule_ID == 0)
        {
			setLAR_DocumentLetter_ID (0);
			setLAR_LetterRule_ID (0);
			setLCO_TaxPayerType_Customer_ID (0);
			setLCO_TaxPayerType_Vendor_ID (0);
        } */
    }

    /** Load Constructor */
    public X_LAR_LetterRule (Properties ctx, ResultSet rs, String trxName)
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
      StringBuffer sb = new StringBuffer ("X_LAR_LetterRule[")
        .append(get_ID()).append("]");
      return sb.toString();
    }

	public ar.com.ergio.model.I_LAR_DocumentLetter getLAR_DocumentLetter() throws RuntimeException
    {
		return (ar.com.ergio.model.I_LAR_DocumentLetter)MTable.get(getCtx(), ar.com.ergio.model.I_LAR_DocumentLetter.Table_Name)
			.getPO(getLAR_DocumentLetter_ID(), get_TrxName());	}

	/** Set LAR_DocumentLetter.
		@param LAR_DocumentLetter_ID LAR_DocumentLetter	  */
	public void setLAR_DocumentLetter_ID (int LAR_DocumentLetter_ID)
	{
		if (LAR_DocumentLetter_ID < 1)
			set_Value (COLUMNNAME_LAR_DocumentLetter_ID, null);
		else
			set_Value (COLUMNNAME_LAR_DocumentLetter_ID, Integer.valueOf(LAR_DocumentLetter_ID));
	}

	/** Get LAR_DocumentLetter.
		@return LAR_DocumentLetter	  */
	public int getLAR_DocumentLetter_ID ()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_DocumentLetter_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set LAR_LetterRule.
		@param LAR_LetterRule_ID LAR_LetterRule	  */
	public void setLAR_LetterRule_ID (int LAR_LetterRule_ID)
	{
		if (LAR_LetterRule_ID < 1)
			set_ValueNoCheck (COLUMNNAME_LAR_LetterRule_ID, null);
		else
			set_ValueNoCheck (COLUMNNAME_LAR_LetterRule_ID, Integer.valueOf(LAR_LetterRule_ID));
	}

	/** Get LAR_LetterRule.
		@return LAR_LetterRule	  */
	public int getLAR_LetterRule_ID ()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_LetterRule_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set LCO_TaxPayerType_Customer_ID.
		@param LCO_TaxPayerType_Customer_ID LCO_TaxPayerType_Customer_ID	  */
	public void setLCO_TaxPayerType_Customer_ID (int LCO_TaxPayerType_Customer_ID)
	{
		if (LCO_TaxPayerType_Customer_ID < 1)
			set_Value (COLUMNNAME_LCO_TaxPayerType_Customer_ID, null);
		else
			set_Value (COLUMNNAME_LCO_TaxPayerType_Customer_ID, Integer.valueOf(LCO_TaxPayerType_Customer_ID));
	}

	/** Get LCO_TaxPayerType_Customer_ID.
		@return LCO_TaxPayerType_Customer_ID	  */
	public int getLCO_TaxPayerType_Customer_ID ()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LCO_TaxPayerType_Customer_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set LCO_TaxPayerType_Vendor_ID.
		@param LCO_TaxPayerType_Vendor_ID LCO_TaxPayerType_Vendor_ID	  */
	public void setLCO_TaxPayerType_Vendor_ID (int LCO_TaxPayerType_Vendor_ID)
	{
		if (LCO_TaxPayerType_Vendor_ID < 1)
			set_Value (COLUMNNAME_LCO_TaxPayerType_Vendor_ID, null);
		else
			set_Value (COLUMNNAME_LCO_TaxPayerType_Vendor_ID, Integer.valueOf(LCO_TaxPayerType_Vendor_ID));
	}

	/** Get LCO_TaxPayerType_Vendor_ID.
		@return LCO_TaxPayerType_Vendor_ID	  */
	public int getLCO_TaxPayerType_Vendor_ID ()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LCO_TaxPayerType_Vendor_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Max Amount.
		@param MaxAmt
		Maximum Amount in invoice currency
	  */
	public void setMaxAmt (BigDecimal MaxAmt)
	{
		set_Value (COLUMNNAME_MaxAmt, MaxAmt);
	}

	/** Get Max Amount.
		@return Maximum Amount in invoice currency
	  */
	public BigDecimal getMaxAmt ()
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_MaxAmt);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}
}