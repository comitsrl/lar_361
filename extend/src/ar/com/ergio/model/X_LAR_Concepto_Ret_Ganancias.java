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

/** Generated Model for LAR_Concepto_Ret_Ganancias
 *  @author Adempiere (generated) 
 *  @version 361.Final (6410:0234094) | LAR 2.1.2 - $Id$ */
public class X_LAR_Concepto_Ret_Ganancias extends PO implements I_LAR_Concepto_Ret_Ganancias, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20170113L;

    /** Standard Constructor */
    public X_LAR_Concepto_Ret_Ganancias (Properties ctx, int LAR_Concepto_Ret_Ganancias_ID, String trxName)
    {
      super (ctx, LAR_Concepto_Ret_Ganancias_ID, trxName);
      /** if (LAR_Concepto_Ret_Ganancias_ID == 0)
        {
			setAlicuota_Inscripto (Env.ZERO);
			setAlicuota_No_Inscripto (Env.ZERO);
			setCalculo_Por_Escala (false);
			setLAR_Concepto_Ret_Ganancias_ID (0);
			setName (null);
			setValue (null);
        } */
    }

    /** Load Constructor */
    public X_LAR_Concepto_Ret_Ganancias (Properties ctx, ResultSet rs, String trxName)
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
      StringBuffer sb = new StringBuffer ("X_LAR_Concepto_Ret_Ganancias[")
        .append(get_ID()).append("]");
      return sb.toString();
    }

	/** Set Alicuota_Inscripto.
		@param Alicuota_Inscripto Alicuota_Inscripto	  */
	public void setAlicuota_Inscripto (BigDecimal Alicuota_Inscripto)
	{
		set_Value (COLUMNNAME_Alicuota_Inscripto, Alicuota_Inscripto);
	}

	/** Get Alicuota_Inscripto.
		@return Alicuota_Inscripto	  */
	public BigDecimal getAlicuota_Inscripto () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_Alicuota_Inscripto);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set Alicuota_No_Inscripto.
		@param Alicuota_No_Inscripto Alicuota_No_Inscripto	  */
	public void setAlicuota_No_Inscripto (BigDecimal Alicuota_No_Inscripto)
	{
		set_Value (COLUMNNAME_Alicuota_No_Inscripto, Alicuota_No_Inscripto);
	}

	/** Get Alicuota_No_Inscripto.
		@return Alicuota_No_Inscripto	  */
	public BigDecimal getAlicuota_No_Inscripto () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_Alicuota_No_Inscripto);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set Calculo_Por_Escala.
		@param Calculo_Por_Escala Calculo_Por_Escala	  */
	public void setCalculo_Por_Escala (boolean Calculo_Por_Escala)
	{
		set_Value (COLUMNNAME_Calculo_Por_Escala, Boolean.valueOf(Calculo_Por_Escala));
	}

	/** Get Calculo_Por_Escala.
		@return Calculo_Por_Escala	  */
	public boolean isCalculo_Por_Escala () 
	{
		Object oo = get_Value(COLUMNNAME_Calculo_Por_Escala);
		if (oo != null) 
		{
			 if (oo instanceof Boolean) 
				 return ((Boolean)oo).booleanValue(); 
			return "Y".equals(oo);
		}
		return false;
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

	/** Set Importe_No_Sujeto_Inscripto.
		@param Importe_No_Sujeto_Inscripto Importe_No_Sujeto_Inscripto	  */
	public void setImporte_No_Sujeto_Inscripto (BigDecimal Importe_No_Sujeto_Inscripto)
	{
		set_Value (COLUMNNAME_Importe_No_Sujeto_Inscripto, Importe_No_Sujeto_Inscripto);
	}

	/** Get Importe_No_Sujeto_Inscripto.
		@return Importe_No_Sujeto_Inscripto	  */
	public BigDecimal getImporte_No_Sujeto_Inscripto () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_Importe_No_Sujeto_Inscripto);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set Importe_No_Sujeto_No_Insc.
		@param Importe_No_Sujeto_No_Insc Importe_No_Sujeto_No_Insc	  */
	public void setImporte_No_Sujeto_No_Insc (BigDecimal Importe_No_Sujeto_No_Insc)
	{
		set_Value (COLUMNNAME_Importe_No_Sujeto_No_Insc, Importe_No_Sujeto_No_Insc);
	}

	/** Get Importe_No_Sujeto_No_Insc.
		@return Importe_No_Sujeto_No_Insc	  */
	public BigDecimal getImporte_No_Sujeto_No_Insc () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_Importe_No_Sujeto_No_Insc);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set Importe_Ret_Minima_Inscripto.
		@param Importe_Ret_Minima_Inscripto Importe_Ret_Minima_Inscripto	  */
	public void setImporte_Ret_Minima_Inscripto (BigDecimal Importe_Ret_Minima_Inscripto)
	{
		set_Value (COLUMNNAME_Importe_Ret_Minima_Inscripto, Importe_Ret_Minima_Inscripto);
	}

	/** Get Importe_Ret_Minima_Inscripto.
		@return Importe_Ret_Minima_Inscripto	  */
	public BigDecimal getImporte_Ret_Minima_Inscripto () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_Importe_Ret_Minima_Inscripto);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set Importe_Ret_Minima_No_Insc.
		@param Importe_Ret_Minima_No_Insc Importe_Ret_Minima_No_Insc	  */
	public void setImporte_Ret_Minima_No_Insc (BigDecimal Importe_Ret_Minima_No_Insc)
	{
		set_Value (COLUMNNAME_Importe_Ret_Minima_No_Insc, Importe_Ret_Minima_No_Insc);
	}

	/** Get Importe_Ret_Minima_No_Insc.
		@return Importe_Ret_Minima_No_Insc	  */
	public BigDecimal getImporte_Ret_Minima_No_Insc () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_Importe_Ret_Minima_No_Insc);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set Conceptos Retencion Ganancias.
		@param LAR_Concepto_Ret_Ganancias_ID Conceptos Retencion Ganancias	  */
	public void setLAR_Concepto_Ret_Ganancias_ID (int LAR_Concepto_Ret_Ganancias_ID)
	{
		if (LAR_Concepto_Ret_Ganancias_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LAR_Concepto_Ret_Ganancias_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LAR_Concepto_Ret_Ganancias_ID, Integer.valueOf(LAR_Concepto_Ret_Ganancias_ID));
	}

	/** Get Conceptos Retencion Ganancias.
		@return Conceptos Retencion Ganancias	  */
	public int getLAR_Concepto_Ret_Ganancias_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_Concepto_Ret_Ganancias_ID);
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