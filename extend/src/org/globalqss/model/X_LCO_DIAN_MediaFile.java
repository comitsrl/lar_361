/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2007 ComPiere, Inc. All Rights Reserved.                *
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
/** Generated Model - DO NOT CHANGE */
package org.globalqss.model;

import java.lang.reflect.Constructor;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.logging.Level;
import org.compiere.model.*;

/** Generated Model for LCO_DIAN_MediaFile
 *  @author Adempiere (generated) 
 *  @version Release 3.4.2s - $Id$ */
public class X_LCO_DIAN_MediaFile extends PO implements I_LCO_DIAN_MediaFile, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

    /** Standard Constructor */
    public X_LCO_DIAN_MediaFile (Properties ctx, int LCO_DIAN_MediaFile_ID, String trxName)
    {
      super (ctx, LCO_DIAN_MediaFile_ID, trxName);
      /** if (LCO_DIAN_MediaFile_ID == 0)
        {
			setConceptCode (null);
			setLCO_DIAN_MediaFile_ID (0);
        } */
    }

    /** Load Constructor */
    public X_LCO_DIAN_MediaFile (Properties ctx, ResultSet rs, String trxName)
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
      StringBuffer sb = new StringBuffer ("X_LCO_DIAN_MediaFile[")
        .append(get_ID()).append("]");
      return sb.toString();
    }

	/** Set Address 1.
		@param Address1 
		Address line 1 for this location
	  */
	public void setAddress1 (String Address1)
	{

		if (Address1 != null && Address1.length() > 60)
		{
			log.warning("Length > 60 - truncated");
			Address1 = Address1.substring(0, 60);
		}
		set_Value (COLUMNNAME_Address1, Address1);
	}

	/** Get Address 1.
		@return Address line 1 for this location
	  */
	public String getAddress1 () 
	{
		return (String)get_Value(COLUMNNAME_Address1);
	}

	/** Set Concept Code.
		@param ConceptCode Concept Code	  */
	public void setConceptCode (String ConceptCode)
	{
		if (ConceptCode == null)
			throw new IllegalArgumentException ("ConceptCode is mandatory.");

		if (ConceptCode.length() > 4)
		{
			log.warning("Length > 4 - truncated");
			ConceptCode = ConceptCode.substring(0, 4);
		}
		set_Value (COLUMNNAME_ConceptCode, ConceptCode);
	}

	/** Get Concept Code.
		@return Concept Code	  */
	public String getConceptCode () 
	{
		return (String)get_Value(COLUMNNAME_ConceptCode);
	}

	/** Set Description.
		@param Description 
		Optional short description of the record
	  */
	public void setDescription (String Description)
	{

		if (Description != null && Description.length() > 255)
		{
			log.warning("Length > 255 - truncated");
			Description = Description.substring(0, 255);
		}
		set_Value (COLUMNNAME_Description, Description);
	}

	/** Get Description.
		@return Optional short description of the record
	  */
	public String getDescription () 
	{
		return (String)get_Value(COLUMNNAME_Description);
	}

	/** Set First Name 1.
		@param FirstName1 First Name 1	  */
	public void setFirstName1 (String FirstName1)
	{

		if (FirstName1 != null && FirstName1.length() > 60)
		{
			log.warning("Length > 60 - truncated");
			FirstName1 = FirstName1.substring(0, 60);
		}
		set_Value (COLUMNNAME_FirstName1, FirstName1);
	}

	/** Get First Name 1.
		@return First Name 1	  */
	public String getFirstName1 () 
	{
		return (String)get_Value(COLUMNNAME_FirstName1);
	}

	/** Set First Name 2.
		@param FirstName2 First Name 2	  */
	public void setFirstName2 (String FirstName2)
	{

		if (FirstName2 != null && FirstName2.length() > 60)
		{
			log.warning("Length > 60 - truncated");
			FirstName2 = FirstName2.substring(0, 60);
		}
		set_Value (COLUMNNAME_FirstName2, FirstName2);
	}

	/** Get First Name 2.
		@return First Name 2	  */
	public String getFirstName2 () 
	{
		return (String)get_Value(COLUMNNAME_FirstName2);
	}

	/** Set Last Name 1.
		@param LastName1 Last Name 1	  */
	public void setLastName1 (String LastName1)
	{

		if (LastName1 != null && LastName1.length() > 60)
		{
			log.warning("Length > 60 - truncated");
			LastName1 = LastName1.substring(0, 60);
		}
		set_Value (COLUMNNAME_LastName1, LastName1);
	}

	/** Get Last Name 1.
		@return Last Name 1	  */
	public String getLastName1 () 
	{
		return (String)get_Value(COLUMNNAME_LastName1);
	}

	/** Set Last Name 2.
		@param LastName2 Last Name 2	  */
	public void setLastName2 (String LastName2)
	{

		if (LastName2 != null && LastName2.length() > 60)
		{
			log.warning("Length > 60 - truncated");
			LastName2 = LastName2.substring(0, 60);
		}
		set_Value (COLUMNNAME_LastName2, LastName2);
	}

	/** Get Last Name 2.
		@return Last Name 2	  */
	public String getLastName2 () 
	{
		return (String)get_Value(COLUMNNAME_LastName2);
	}

	/** Set DANE City Code.
		@param LCO_DANECityCode DANE City Code	  */
	public void setLCO_DANECityCode (String LCO_DANECityCode)
	{

		if (LCO_DANECityCode != null && LCO_DANECityCode.length() > 5)
		{
			log.warning("Length > 5 - truncated");
			LCO_DANECityCode = LCO_DANECityCode.substring(0, 5);
		}
		set_Value (COLUMNNAME_LCO_DANECityCode, LCO_DANECityCode);
	}

	/** Get DANE City Code.
		@return DANE City Code	  */
	public String getLCO_DANECityCode () 
	{
		return (String)get_Value(COLUMNNAME_LCO_DANECityCode);
	}

	/** Set DANE Country Code.
		@param LCO_DANECountryCode DANE Country Code	  */
	public void setLCO_DANECountryCode (String LCO_DANECountryCode)
	{

		if (LCO_DANECountryCode != null && LCO_DANECountryCode.length() > 3)
		{
			log.warning("Length > 3 - truncated");
			LCO_DANECountryCode = LCO_DANECountryCode.substring(0, 3);
		}
		set_Value (COLUMNNAME_LCO_DANECountryCode, LCO_DANECountryCode);
	}

	/** Get DANE Country Code.
		@return DANE Country Code	  */
	public String getLCO_DANECountryCode () 
	{
		return (String)get_Value(COLUMNNAME_LCO_DANECountryCode);
	}

	/** Set DANE Region Code.
		@param LCO_DANERegionCode DANE Region Code	  */
	public void setLCO_DANERegionCode (String LCO_DANERegionCode)
	{

		if (LCO_DANERegionCode != null && LCO_DANERegionCode.length() > 2)
		{
			log.warning("Length > 2 - truncated");
			LCO_DANERegionCode = LCO_DANERegionCode.substring(0, 2);
		}
		set_Value (COLUMNNAME_LCO_DANERegionCode, LCO_DANERegionCode);
	}

	/** Get DANE Region Code.
		@return DANE Region Code	  */
	public String getLCO_DANERegionCode () 
	{
		return (String)get_Value(COLUMNNAME_LCO_DANERegionCode);
	}

	/** Set DIAN Media File.
		@param LCO_DIAN_MediaFile_ID DIAN Media File	  */
	public void setLCO_DIAN_MediaFile_ID (int LCO_DIAN_MediaFile_ID)
	{
		if (LCO_DIAN_MediaFile_ID < 1)
			 throw new IllegalArgumentException ("LCO_DIAN_MediaFile_ID is mandatory.");
		set_ValueNoCheck (COLUMNNAME_LCO_DIAN_MediaFile_ID, Integer.valueOf(LCO_DIAN_MediaFile_ID));
	}

	/** Get DIAN Media File.
		@return DIAN Media File	  */
	public int getLCO_DIAN_MediaFile_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LCO_DIAN_MediaFile_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public I_LCO_DIAN_SendSchedule getLCO_DIAN_SendSchedule() throws Exception 
    {
        Class<?> clazz = MTable.getClass(I_LCO_DIAN_SendSchedule.Table_Name);
        I_LCO_DIAN_SendSchedule result = null;
        try	{
	        Constructor<?> constructor = null;
	    	constructor = clazz.getDeclaredConstructor(new Class[]{Properties.class, int.class, String.class});
    	    result = (I_LCO_DIAN_SendSchedule)constructor.newInstance(new Object[] {getCtx(), new Integer(getLCO_DIAN_SendSchedule_ID()), get_TrxName()});
        } catch (Exception e) {
	        log.log(Level.SEVERE, "(id) - Table=" + Table_Name + ",Class=" + clazz, e);
	        log.saveError("Error", "Table=" + Table_Name + ",Class=" + clazz);
           throw e;
        }
        return result;
    }

	/** Set DIAN Send Schedule.
		@param LCO_DIAN_SendSchedule_ID DIAN Send Schedule	  */
	public void setLCO_DIAN_SendSchedule_ID (int LCO_DIAN_SendSchedule_ID)
	{
		if (LCO_DIAN_SendSchedule_ID < 1) 
			set_Value (COLUMNNAME_LCO_DIAN_SendSchedule_ID, null);
		else 
			set_Value (COLUMNNAME_LCO_DIAN_SendSchedule_ID, Integer.valueOf(LCO_DIAN_SendSchedule_ID));
	}

	/** Get DIAN Send Schedule.
		@return DIAN Send Schedule	  */
	public int getLCO_DIAN_SendSchedule_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LCO_DIAN_SendSchedule_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Name 2.
		@param Name2 
		Additional Name
	  */
	public void setName2 (String Name2)
	{

		if (Name2 != null && Name2.length() > 60)
		{
			log.warning("Length > 60 - truncated");
			Name2 = Name2.substring(0, 60);
		}
		set_Value (COLUMNNAME_Name2, Name2);
	}

	/** Get Name 2.
		@return Additional Name
	  */
	public String getName2 () 
	{
		return (String)get_Value(COLUMNNAME_Name2);
	}

	/** Set Tax ID.
		@param TaxID 
		Tax Identification
	  */
	public void setTaxID (String TaxID)
	{

		if (TaxID != null && TaxID.length() > 20)
		{
			log.warning("Length > 20 - truncated");
			TaxID = TaxID.substring(0, 20);
		}
		set_Value (COLUMNNAME_TaxID, TaxID);
	}

	/** Get Tax ID.
		@return Tax Identification
	  */
	public String getTaxID () 
	{
		return (String)get_Value(COLUMNNAME_TaxID);
	}

	/** Set Tax ID Digit.
		@param TaxIdDigit Tax ID Digit	  */
	public void setTaxIdDigit (String TaxIdDigit)
	{

		if (TaxIdDigit != null && TaxIdDigit.length() > 1)
		{
			log.warning("Length > 1 - truncated");
			TaxIdDigit = TaxIdDigit.substring(0, 1);
		}
		set_Value (COLUMNNAME_TaxIdDigit, TaxIdDigit);
	}

	/** Get Tax ID Digit.
		@return Tax ID Digit	  */
	public String getTaxIdDigit () 
	{
		return (String)get_Value(COLUMNNAME_TaxIdDigit);
	}
}