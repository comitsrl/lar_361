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

import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Properties;
import org.compiere.model.*;
import org.compiere.util.KeyNamePair;

/** Generated Model for LAR_Fiscal_Printer
 *  @author Adempiere (generated)
 *  @version 360LTS.015 - $Id$ */
public class X_LAR_Fiscal_Printer extends PO implements I_LAR_Fiscal_Printer, I_Persistent
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20120313L;

    /** Standard Constructor */
    public X_LAR_Fiscal_Printer (Properties ctx, int LAR_Fiscal_Printer_ID, String trxName)
    {
      super (ctx, LAR_Fiscal_Printer_ID, trxName);
      /** if (LAR_Fiscal_Printer_ID == 0)
        {
			setHost (null);
			setIsRemote (false);
			setLAR_Fiscal_Printer_ID (0);
			setLAR_Fiscal_Printer_Type_ID (0);
			setOnPrintProductFormat (null);
			setOnPrintUseProductReference (false);
			setPort (0);
        } */
    }

    /** Load Constructor */
    public X_LAR_Fiscal_Printer (Properties ctx, ResultSet rs, String trxName)
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
      StringBuffer sb = new StringBuffer ("X_LAR_Fiscal_Printer[")
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

	/** Set Host.
		@param Host Host	  */
	public void setHost (String Host)
	{
		set_Value (COLUMNNAME_Host, Host);
	}

	/** Get Host.
		@return Host	  */
	public String getHost ()
	{
		return (String)get_Value(COLUMNNAME_Host);
	}

	/** Set IsRemote.
		@param IsRemote IsRemote	  */
	public void setIsRemote (boolean IsRemote)
	{
		set_Value (COLUMNNAME_IsRemote, Boolean.valueOf(IsRemote));
	}

	/** Get IsRemote.
		@return IsRemote	  */
	public boolean isRemote ()
	{
		Object oo = get_Value(COLUMNNAME_IsRemote);
		if (oo != null)
		{
			 if (oo instanceof Boolean)
				 return ((Boolean)oo).booleanValue();
			return "Y".equals(oo);
		}
		return false;
	}

	/** Set LAR_Fiscal_Printer.
		@param LAR_Fiscal_Printer_ID LAR_Fiscal_Printer	  */
	public void setLAR_Fiscal_Printer_ID (int LAR_Fiscal_Printer_ID)
	{
		if (LAR_Fiscal_Printer_ID < 1)
			set_ValueNoCheck (COLUMNNAME_LAR_Fiscal_Printer_ID, null);
		else
			set_ValueNoCheck (COLUMNNAME_LAR_Fiscal_Printer_ID, Integer.valueOf(LAR_Fiscal_Printer_ID));
	}

	/** Get LAR_Fiscal_Printer.
		@return LAR_Fiscal_Printer	  */
	public int getLAR_Fiscal_Printer_ID ()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_Fiscal_Printer_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public ar.com.ergio.model.I_LAR_Fiscal_Printer_Type getLAR_Fiscal_Printer_Type() throws RuntimeException
    {
		return (ar.com.ergio.model.I_LAR_Fiscal_Printer_Type)MTable.get(getCtx(), ar.com.ergio.model.I_LAR_Fiscal_Printer_Type.Table_Name)
			.getPO(getLAR_Fiscal_Printer_Type_ID(), get_TrxName());	}

	/** Set LAR_Fiscal_Printer_Type.
		@param LAR_Fiscal_Printer_Type_ID LAR_Fiscal_Printer_Type	  */
	public void setLAR_Fiscal_Printer_Type_ID (int LAR_Fiscal_Printer_Type_ID)
	{
		if (LAR_Fiscal_Printer_Type_ID < 1)
			set_Value (COLUMNNAME_LAR_Fiscal_Printer_Type_ID, null);
		else
			set_Value (COLUMNNAME_LAR_Fiscal_Printer_Type_ID, Integer.valueOf(LAR_Fiscal_Printer_Type_ID));
	}

	/** Get LAR_Fiscal_Printer_Type.
		@return LAR_Fiscal_Printer_Type	  */
	public int getLAR_Fiscal_Printer_Type_ID ()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_Fiscal_Printer_Type_ID);
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

	/** OnPrintProductFormat AD_Reference_ID=3000006 */
	public static final int ONPRINTPRODUCTFORMAT_AD_Reference_ID=3000006;
	/** Name = N */
	public static final String ONPRINTPRODUCTFORMAT_Name = "N";
	/** Name Value = NV */
	public static final String ONPRINTPRODUCTFORMAT_NameValue = "NV";
	/** Value = V */
	public static final String ONPRINTPRODUCTFORMAT_Value = "V";
	/** Value Name = VN */
	public static final String ONPRINTPRODUCTFORMAT_ValueName = "VN";
	/** Set OnPrintProductFormat.
		@param OnPrintProductFormat OnPrintProductFormat	  */
	public void setOnPrintProductFormat (String OnPrintProductFormat)
	{

		set_Value (COLUMNNAME_OnPrintProductFormat, OnPrintProductFormat);
	}

	/** Get OnPrintProductFormat.
		@return OnPrintProductFormat	  */
	public String getOnPrintProductFormat ()
	{
		return (String)get_Value(COLUMNNAME_OnPrintProductFormat);
	}

	/** Set OnPrintUseProductReference.
		@param OnPrintUseProductReference OnPrintUseProductReference	  */
	public void setOnPrintUseProductReference (boolean OnPrintUseProductReference)
	{
		set_Value (COLUMNNAME_OnPrintUseProductReference, Boolean.valueOf(OnPrintUseProductReference));
	}

	/** Get OnPrintUseProductReference.
		@return OnPrintUseProductReference	  */
	public boolean isOnPrintUseProductReference ()
	{
		Object oo = get_Value(COLUMNNAME_OnPrintUseProductReference);
		if (oo != null)
		{
			 if (oo instanceof Boolean)
				 return ((Boolean)oo).booleanValue();
			return "Y".equals(oo);
		}
		return false;
	}

	/** Set Operation_Date.
		@param Operation_Date Operation_Date	  */
	public void setOperation_Date (Timestamp Operation_Date)
	{
		set_Value (COLUMNNAME_Operation_Date, Operation_Date);
	}

	/** Get Operation_Date.
		@return Operation_Date	  */
	public Timestamp getOperation_Date ()
	{
		return (Timestamp)get_Value(COLUMNNAME_Operation_Date);
	}

	/** Set Port.
		@param Port Port	  */
	public void setPort (int Port)
	{
		set_Value (COLUMNNAME_Port, Integer.valueOf(Port));
	}

	/** Get Port.
		@return Port	  */
	public int getPort ()
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_Port);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Status AD_Reference_ID=3000007 */
	public static final int STATUS_AD_Reference_ID=3000007;
	/** Busy = BSY */
	public static final String STATUS_Busy = "BSY";
	/** Error = ERR */
	public static final String STATUS_Error = "ERR";
	/** IDLE = IDL */
	public static final String STATUS_IDLE = "IDL";
	/** Set Status.
		@param Status
		Status of the currently running check
	  */
	public void setStatus (String Status)
	{

		set_Value (COLUMNNAME_Status, Status);
	}

	/** Get Status.
		@return Status of the currently running check
	  */
	public String getStatus ()
	{
		return (String)get_Value(COLUMNNAME_Status);
	}
}