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
package org.compiere.model;

import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Properties;

/** Generated Model for C_DocType_CAI
 *  @author Adempiere (generated) 
 *  @version 361.Final (6410:0234094) | LAR 2.9.13 - $Id$ */
public class X_C_DocType_CAI extends PO implements I_C_DocType_CAI, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20210427L;

    /** Standard Constructor */
    public X_C_DocType_CAI (Properties ctx, int C_DocType_CAI_ID, String trxName)
    {
      super (ctx, C_DocType_CAI_ID, trxName);
      /** if (C_DocType_CAI_ID == 0)
        {
			setCAI (null);
			setCantidad_Autorizada (0);
			setC_DocType_CAI_ID (0);
			setC_DocType_ID (0);
			setfecha_vencimiento (new Timestamp( System.currentTimeMillis() ));
			setNro_Desde (0);
			setNro_Hasta (0);
        } */
    }

    /** Load Constructor */
    public X_C_DocType_CAI (Properties ctx, ResultSet rs, String trxName)
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
      StringBuffer sb = new StringBuffer ("X_C_DocType_CAI[")
        .append(get_ID()).append("]");
      return sb.toString();
    }

	/** Set CAI.
		@param CAI CAI	  */
	public void setCAI (String CAI)
	{
		set_Value (COLUMNNAME_CAI, CAI);
	}

	/** Get CAI.
		@return CAI	  */
	public String getCAI () 
	{
		return (String)get_Value(COLUMNNAME_CAI);
	}

	/** Set Cantidad_Autorizada.
		@param Cantidad_Autorizada Cantidad_Autorizada	  */
	public void setCantidad_Autorizada (int Cantidad_Autorizada)
	{
		set_Value (COLUMNNAME_Cantidad_Autorizada, Integer.valueOf(Cantidad_Autorizada));
	}

	/** Get Cantidad_Autorizada.
		@return Cantidad_Autorizada	  */
	public int getCantidad_Autorizada () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_Cantidad_Autorizada);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Autorizaciones CAI.
		@param C_DocType_CAI_ID Autorizaciones CAI	  */
	public void setC_DocType_CAI_ID (int C_DocType_CAI_ID)
	{
		if (C_DocType_CAI_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_C_DocType_CAI_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_C_DocType_CAI_ID, Integer.valueOf(C_DocType_CAI_ID));
	}

	/** Get Autorizaciones CAI.
		@return Autorizaciones CAI	  */
	public int getC_DocType_CAI_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_DocType_CAI_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public I_C_DocType getC_DocType() throws RuntimeException
    {
		return (I_C_DocType)MTable.get(getCtx(), I_C_DocType.Table_Name)
			.getPO(getC_DocType_ID(), get_TrxName());	}

	/** Set Document Type.
		@param C_DocType_ID 
		Document type or rules
	  */
	public void setC_DocType_ID (int C_DocType_ID)
	{
		if (C_DocType_ID < 0) 
			set_Value (COLUMNNAME_C_DocType_ID, null);
		else 
			set_Value (COLUMNNAME_C_DocType_ID, Integer.valueOf(C_DocType_ID));
	}

	/** Get Document Type.
		@return Document type or rules
	  */
	public int getC_DocType_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_DocType_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set fecha_vencimiento.
		@param fecha_vencimiento fecha_vencimiento	  */
	public void setfecha_vencimiento (Timestamp fecha_vencimiento)
	{
		set_Value (COLUMNNAME_fecha_vencimiento, fecha_vencimiento);
	}

	/** Get fecha_vencimiento.
		@return fecha_vencimiento	  */
	public Timestamp getfecha_vencimiento () 
	{
		return (Timestamp)get_Value(COLUMNNAME_fecha_vencimiento);
	}

	/** Set Nro_Desde.
		@param Nro_Desde Nro_Desde	  */
	public void setNro_Desde (int Nro_Desde)
	{
		set_Value (COLUMNNAME_Nro_Desde, Integer.valueOf(Nro_Desde));
	}

	/** Get Nro_Desde.
		@return Nro_Desde	  */
	public int getNro_Desde () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_Nro_Desde);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Nro_Hasta.
		@param Nro_Hasta Nro_Hasta	  */
	public void setNro_Hasta (int Nro_Hasta)
	{
		set_Value (COLUMNNAME_Nro_Hasta, Integer.valueOf(Nro_Hasta));
	}

	/** Get Nro_Hasta.
		@return Nro_Hasta	  */
	public int getNro_Hasta () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_Nro_Hasta);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}
}