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

/** Generated Model for LAR_Escala_Ret_Ganancias
 *  @author Adempiere (generated) 
 *  @version 361.Final (6410:0234094) | LAR 2.1.2 - $Id$ */
public class X_LAR_Escala_Ret_Ganancias extends PO implements I_LAR_Escala_Ret_Ganancias, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20170113L;

    /** Standard Constructor */
    public X_LAR_Escala_Ret_Ganancias (Properties ctx, int LAR_Escala_Ret_Ganancias_ID, String trxName)
    {
      super (ctx, LAR_Escala_Ret_Ganancias_ID, trxName);
      /** if (LAR_Escala_Ret_Ganancias_ID == 0)
        {
			setAlicuota (Env.ZERO);
			setLAR_Escala_Ret_Ganancias_ID (0);
			setName (null);
			setValue (null);
        } */
    }

    /** Load Constructor */
    public X_LAR_Escala_Ret_Ganancias (Properties ctx, ResultSet rs, String trxName)
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
      StringBuffer sb = new StringBuffer ("X_LAR_Escala_Ret_Ganancias[")
        .append(get_ID()).append("]");
      return sb.toString();
    }

	/** Set Alicuota.
		@param Alicuota Alicuota	  */
	public void setAlicuota (BigDecimal Alicuota)
	{
		set_Value (COLUMNNAME_Alicuota, Alicuota);
	}

	/** Get Alicuota.
		@return Alicuota	  */
	public BigDecimal getAlicuota () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_Alicuota);
		if (bd == null)
			 return Env.ZERO;
		return bd;
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

	/** Set Importe_Desde.
		@param Importe_Desde Importe_Desde	  */
	public void setImporte_Desde (BigDecimal Importe_Desde)
	{
		set_Value (COLUMNNAME_Importe_Desde, Importe_Desde);
	}

	/** Get Importe_Desde.
		@return Importe_Desde	  */
	public BigDecimal getImporte_Desde () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_Importe_Desde);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set Importe_Fijo.
		@param Importe_Fijo Importe_Fijo	  */
	public void setImporte_Fijo (BigDecimal Importe_Fijo)
	{
		set_Value (COLUMNNAME_Importe_Fijo, Importe_Fijo);
	}

	/** Get Importe_Fijo.
		@return Importe_Fijo	  */
	public BigDecimal getImporte_Fijo () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_Importe_Fijo);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set Importe_Hasta.
		@param Importe_Hasta Importe_Hasta	  */
	public void setImporte_Hasta (BigDecimal Importe_Hasta)
	{
		set_Value (COLUMNNAME_Importe_Hasta, Importe_Hasta);
	}

	/** Get Importe_Hasta.
		@return Importe_Hasta	  */
	public BigDecimal getImporte_Hasta () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_Importe_Hasta);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set Importe_No_Sujeto.
		@param Importe_No_Sujeto Importe_No_Sujeto	  */
	public void setImporte_No_Sujeto (BigDecimal Importe_No_Sujeto)
	{
		set_Value (COLUMNNAME_Importe_No_Sujeto, Importe_No_Sujeto);
	}

	/** Get Importe_No_Sujeto.
		@return Importe_No_Sujeto	  */
	public BigDecimal getImporte_No_Sujeto () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_Importe_No_Sujeto);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set Escala Retencion Ganancias.
		@param LAR_Escala_Ret_Ganancias_ID Escala Retencion Ganancias	  */
	public void setLAR_Escala_Ret_Ganancias_ID (int LAR_Escala_Ret_Ganancias_ID)
	{
		if (LAR_Escala_Ret_Ganancias_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LAR_Escala_Ret_Ganancias_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LAR_Escala_Ret_Ganancias_ID, Integer.valueOf(LAR_Escala_Ret_Ganancias_ID));
	}

	/** Get Escala Retencion Ganancias.
		@return Escala Retencion Ganancias	  */
	public int getLAR_Escala_Ret_Ganancias_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_Escala_Ret_Ganancias_ID);
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