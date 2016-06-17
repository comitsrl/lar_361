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

/** Generated Model for LAR_Plan_Pago
 *  @author Adempiere (generated) 
 *  @version 361.Final (6410:0234094) | LAR 2.0.0 - $Id$ */
public class X_LAR_Plan_Pago extends PO implements I_LAR_Plan_Pago, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20150702L;

    /** Standard Constructor */
    public X_LAR_Plan_Pago (Properties ctx, int LAR_Plan_Pago_ID, String trxName)
    {
      super (ctx, LAR_Plan_Pago_ID, trxName);
      /** if (LAR_Plan_Pago_ID == 0)
        {
			setCuota_Final (0);
			setCuota_Inicial (0);
			setDescuento (Env.ZERO);
			setLAR_Medio_Pago_ID (0);
			setLAR_Plan_Pago_ID (0);
        } */
    }

    /** Load Constructor */
    public X_LAR_Plan_Pago (Properties ctx, ResultSet rs, String trxName)
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
      StringBuffer sb = new StringBuffer ("X_LAR_Plan_Pago[")
        .append(get_ID()).append("]");
      return sb.toString();
    }

	/** Set Cuota Final.
		@param Cuota_Final Cuota Final	  */
	public void setCuota_Final (int Cuota_Final)
	{
		set_Value (COLUMNNAME_Cuota_Final, Integer.valueOf(Cuota_Final));
	}

	/** Get Cuota Final.
		@return Cuota Final	  */
	public int getCuota_Final () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_Cuota_Final);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Cuota Inicial.
		@param Cuota_Inicial Cuota Inicial	  */
	public void setCuota_Inicial (int Cuota_Inicial)
	{
		set_Value (COLUMNNAME_Cuota_Inicial, Integer.valueOf(Cuota_Inicial));
	}

	/** Get Cuota Inicial.
		@return Cuota Inicial	  */
	public int getCuota_Inicial () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_Cuota_Inicial);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Descuento.
		@param Descuento Descuento	  */
	public void setDescuento (BigDecimal Descuento)
	{
		set_Value (COLUMNNAME_Descuento, Descuento);
	}

	/** Get Descuento.
		@return Descuento	  */
	public BigDecimal getDescuento () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_Descuento);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	public ar.com.ergio.model.I_LAR_Medio_Pago getLAR_Medio_Pago() throws RuntimeException
    {
		return (ar.com.ergio.model.I_LAR_Medio_Pago)MTable.get(getCtx(), ar.com.ergio.model.I_LAR_Medio_Pago.Table_Name)
			.getPO(getLAR_Medio_Pago_ID(), get_TrxName());	}

	/** Set LAR_Medio_Pago.
		@param LAR_Medio_Pago_ID LAR_Medio_Pago	  */
	public void setLAR_Medio_Pago_ID (int LAR_Medio_Pago_ID)
	{
		if (LAR_Medio_Pago_ID < 1) 
			set_Value (COLUMNNAME_LAR_Medio_Pago_ID, null);
		else 
			set_Value (COLUMNNAME_LAR_Medio_Pago_ID, Integer.valueOf(LAR_Medio_Pago_ID));
	}

	/** Get LAR_Medio_Pago.
		@return LAR_Medio_Pago	  */
	public int getLAR_Medio_Pago_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_Medio_Pago_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set LAR_Plan_Pago.
		@param LAR_Plan_Pago_ID LAR_Plan_Pago	  */
	public void setLAR_Plan_Pago_ID (int LAR_Plan_Pago_ID)
	{
		if (LAR_Plan_Pago_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LAR_Plan_Pago_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LAR_Plan_Pago_ID, Integer.valueOf(LAR_Plan_Pago_ID));
	}

	/** Get LAR_Plan_Pago.
		@return LAR_Plan_Pago	  */
	public int getLAR_Plan_Pago_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_Plan_Pago_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}
}