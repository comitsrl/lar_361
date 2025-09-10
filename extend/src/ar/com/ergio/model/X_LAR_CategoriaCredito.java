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
import org.compiere.util.KeyNamePair;

/** Generated Model for LAR_CategoriaCredito
 *  @author Adempiere (generated) 
 *  @version 362.2 (e8f23fb40) | LAR 2.15.9 - $Id$ */
public class X_LAR_CategoriaCredito extends PO implements I_LAR_CategoriaCredito, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20250910L;

    /** Standard Constructor */
    public X_LAR_CategoriaCredito (Properties ctx, int LAR_CategoriaCredito_ID, String trxName)
    {
      super (ctx, LAR_CategoriaCredito_ID, trxName);
      /** if (LAR_CategoriaCredito_ID == 0)
        {
			setLAR_CategoriaCredito_ID (0);
			setName (null);
			setSO_CreditLimit (Env.ZERO);
			setValue (null);
        } */
    }

    /** Load Constructor */
    public X_LAR_CategoriaCredito (Properties ctx, ResultSet rs, String trxName)
    {
      super (ctx, rs, trxName);
    }

    /** AccessLevel
      * @return 6 - System - Client 
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
      StringBuffer sb = new StringBuffer ("X_LAR_CategoriaCredito[")
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

	/** Set Categoria de Crédito.
		@param LAR_CategoriaCredito_ID Categoria de Crédito	  */
	public void setLAR_CategoriaCredito_ID (int LAR_CategoriaCredito_ID)
	{
		if (LAR_CategoriaCredito_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LAR_CategoriaCredito_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LAR_CategoriaCredito_ID, Integer.valueOf(LAR_CategoriaCredito_ID));
	}

	/** Get Categoria de Crédito.
		@return Categoria de Crédito	  */
	public int getLAR_CategoriaCredito_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_CategoriaCredito_ID);
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

	/** Set Credit Limit.
		@param SO_CreditLimit 
		Total outstanding invoice amounts allowed
	  */
	public void setSO_CreditLimit (BigDecimal SO_CreditLimit)
	{
		set_Value (COLUMNNAME_SO_CreditLimit, SO_CreditLimit);
	}

	/** Get Credit Limit.
		@return Total outstanding invoice amounts allowed
	  */
	public BigDecimal getSO_CreditLimit () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_SO_CreditLimit);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set Search Key.
		@param Value 
		Search key for the record in the format required - must be unique
	  */
	public void setValue (String Value)
	{
		set_Value (COLUMNNAME_Value, Value);
	}

	/** Get Search Key.
		@return Search key for the record in the format required - must be unique
	  */
	public String getValue () 
	{
		return (String)get_Value(COLUMNNAME_Value);
	}
}