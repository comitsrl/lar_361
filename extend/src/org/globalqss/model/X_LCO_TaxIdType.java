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

import java.sql.ResultSet;
import java.util.Properties;
import org.compiere.model.*;
import org.compiere.util.KeyNamePair;

/** Generated Model for LCO_TaxIdType
 *  @author Adempiere (generated) 
 *  @version Release 3.6.0LTS - $Id$ */
public class X_LCO_TaxIdType extends PO implements I_LCO_TaxIdType, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20100617L;

    /** Standard Constructor */
    public X_LCO_TaxIdType (Properties ctx, int LCO_TaxIdType_ID, String trxName)
    {
      super (ctx, LCO_TaxIdType_ID, trxName);
      /** if (LCO_TaxIdType_ID == 0)
        {
			setIsDetailedNames (false);
// N
			setIsDigitChecked (false);
// N
			setIsUseTaxIdDigit (false);
// N
			setLCO_TaxIdType_ID (0);
			setName (null);
        } */
    }

    /** Load Constructor */
    public X_LCO_TaxIdType (Properties ctx, ResultSet rs, String trxName)
    {
      super (ctx, rs, trxName);
    }

    /** AccessLevel
      * @return 2 - Client 
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
      StringBuffer sb = new StringBuffer ("X_LCO_TaxIdType[")
        .append(get_ID()).append("]");
      return sb.toString();
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

	/** Set Default.
		@param IsDefault 
		Default value
	  */
	public void setIsDefault (boolean IsDefault)
	{
		set_Value (COLUMNNAME_IsDefault, Boolean.valueOf(IsDefault));
	}

	/** Get Default.
		@return Default value
	  */
	public boolean isDefault () 
	{
		Object oo = get_Value(COLUMNNAME_IsDefault);
		if (oo != null) 
		{
			 if (oo instanceof Boolean) 
				 return ((Boolean)oo).booleanValue(); 
			return "Y".equals(oo);
		}
		return false;
	}

	/** Set Detailed Names.
		@param IsDetailedNames Detailed Names	  */
	public void setIsDetailedNames (boolean IsDetailedNames)
	{
		set_Value (COLUMNNAME_IsDetailedNames, Boolean.valueOf(IsDetailedNames));
	}

	/** Get Detailed Names.
		@return Detailed Names	  */
	public boolean isDetailedNames () 
	{
		Object oo = get_Value(COLUMNNAME_IsDetailedNames);
		if (oo != null) 
		{
			 if (oo instanceof Boolean) 
				 return ((Boolean)oo).booleanValue(); 
			return "Y".equals(oo);
		}
		return false;
	}

	/** Set Is Digit Checked.
		@param IsDigitChecked Is Digit Checked	  */
	public void setIsDigitChecked (boolean IsDigitChecked)
	{
		set_Value (COLUMNNAME_IsDigitChecked, Boolean.valueOf(IsDigitChecked));
	}

	/** Get Is Digit Checked.
		@return Is Digit Checked	  */
	public boolean isDigitChecked () 
	{
		Object oo = get_Value(COLUMNNAME_IsDigitChecked);
		if (oo != null) 
		{
			 if (oo instanceof Boolean) 
				 return ((Boolean)oo).booleanValue(); 
			return "Y".equals(oo);
		}
		return false;
	}

	/** Set Use Tax Id Digit.
		@param IsUseTaxIdDigit Use Tax Id Digit	  */
	public void setIsUseTaxIdDigit (boolean IsUseTaxIdDigit)
	{
		set_Value (COLUMNNAME_IsUseTaxIdDigit, Boolean.valueOf(IsUseTaxIdDigit));
	}

	/** Get Use Tax Id Digit.
		@return Use Tax Id Digit	  */
	public boolean isUseTaxIdDigit () 
	{
		Object oo = get_Value(COLUMNNAME_IsUseTaxIdDigit);
		if (oo != null) 
		{
			 if (oo instanceof Boolean) 
				 return ((Boolean)oo).booleanValue(); 
			return "Y".equals(oo);
		}
		return false;
	}

	/** Set Tax Code DIAN.
		@param LCO_TaxCodeDian Tax Code DIAN	  */
	public void setLCO_TaxCodeDian (String LCO_TaxCodeDian)
	{
		set_Value (COLUMNNAME_LCO_TaxCodeDian, LCO_TaxCodeDian);
	}

	/** Get Tax Code DIAN.
		@return Tax Code DIAN	  */
	public String getLCO_TaxCodeDian () 
	{
		return (String)get_Value(COLUMNNAME_LCO_TaxCodeDian);
	}

	/** Set Tax ID Type.
		@param LCO_TaxIdType_ID Tax ID Type	  */
	public void setLCO_TaxIdType_ID (int LCO_TaxIdType_ID)
	{
		if (LCO_TaxIdType_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LCO_TaxIdType_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LCO_TaxIdType_ID, Integer.valueOf(LCO_TaxIdType_ID));
	}

	/** Get Tax ID Type.
		@return Tax ID Type	  */
	public int getLCO_TaxIdType_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LCO_TaxIdType_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Name.
		@param Name 
		Alphanumeric identifier of the entity
	  */
	public void setName (String Name)
	{
		set_Value (COLUMNNAME_Name, Name);
	}

	/** Get Name.
		@return Alphanumeric identifier of the entity
	  */
	public String getName () 
	{
		return (String)get_Value(COLUMNNAME_Name);
	}

    /** Get Record ID/ColumnName
        @return ID/ColumnName pair
      */
    public KeyNamePair getKeyNamePair() 
    {
        return new KeyNamePair(get_ID(), getName());
    }
}