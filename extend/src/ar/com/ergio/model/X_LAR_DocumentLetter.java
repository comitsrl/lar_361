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
import java.util.Properties;
import org.compiere.model.*;

/** Generated Model for LAR_DocumentLetter
 *  @author Adempiere (generated)
 *  @version 360LTS.015 - $Id$ */
public class X_LAR_DocumentLetter extends PO implements I_LAR_DocumentLetter, I_Persistent
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20120313L;

    /** Standard Constructor */
    public X_LAR_DocumentLetter (Properties ctx, int LAR_DocumentLetter_ID, String trxName)
    {
      super (ctx, LAR_DocumentLetter_ID, trxName);
      /** if (LAR_DocumentLetter_ID == 0)
        {
			setIsDefault (false);
			setLAR_DocumentLetter_ID (0);
			setLetter (null);
        } */
    }

    /** Load Constructor */
    public X_LAR_DocumentLetter (Properties ctx, ResultSet rs, String trxName)
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
      StringBuffer sb = new StringBuffer ("X_LAR_DocumentLetter[")
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

	/** Set LAR_DocumentLetter.
		@param LAR_DocumentLetter_ID LAR_DocumentLetter	  */
	public void setLAR_DocumentLetter_ID (int LAR_DocumentLetter_ID)
	{
		if (LAR_DocumentLetter_ID < 1)
			set_ValueNoCheck (COLUMNNAME_LAR_DocumentLetter_ID, null);
		else
			set_ValueNoCheck (COLUMNNAME_LAR_DocumentLetter_ID, Integer.valueOf(LAR_DocumentLetter_ID));
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

	/** Letter AD_Reference_ID=3000003 */
	public static final int LETTER_AD_Reference_ID=3000003;
	/** A = A */
	public static final String LETTER_A = "A";
	/** B = B */
	public static final String LETTER_B = "B";
	/** C = C */
	public static final String LETTER_C = "C";
	/** E = E */
	public static final String LETTER_E = "E";
	/** Set Letter.
		@param Letter Letter	  */
	public void setLetter (String Letter)
	{

		set_Value (COLUMNNAME_Letter, Letter);
	}

	/** Get Letter.
		@return Letter	  */
	public String getLetter ()
	{
		return (String)get_Value(COLUMNNAME_Letter);
	}
}