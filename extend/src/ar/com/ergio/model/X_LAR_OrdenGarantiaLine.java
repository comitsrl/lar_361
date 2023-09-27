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

/** Generated Model for LAR_OrdenGarantiaLine
 *  @author Adempiere (generated) 
 *  @version 361.Final (6410:0234094) | LAR 2.13.18 - $Id$ */
public class X_LAR_OrdenGarantiaLine extends PO implements I_LAR_OrdenGarantiaLine, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20230825L;

    /** Standard Constructor */
    public X_LAR_OrdenGarantiaLine (Properties ctx, int LAR_OrdenGarantiaLine_ID, String trxName)
    {
      super (ctx, LAR_OrdenGarantiaLine_ID, trxName);
      /** if (LAR_OrdenGarantiaLine_ID == 0)
        {
			setCantidad (Env.ZERO);
			setC_OrderLine_ID (0);
			setC_UOM_ID (0);
			setLAR_OrdenGarantia_ID (0);
			setLAR_OrdenGarantiaLine_ID (0);
			setLine (0);
// @SQL=SELECT COALESCE(MAX(Line),0)+10 AS DefaultValue FROM LAR_OrdenGarantiaLine WHERE LAR_OrdenGarantia_ID=@LAR_OrdenGarantia_ID@
        } */
    }

    /** Load Constructor */
    public X_LAR_OrdenGarantiaLine (Properties ctx, ResultSet rs, String trxName)
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
      StringBuffer sb = new StringBuffer ("X_LAR_OrdenGarantiaLine[")
        .append(get_ID()).append("]");
      return sb.toString();
    }

	/** Set Cantidad.
		@param Cantidad Cantidad	  */
	public void setCantidad (BigDecimal Cantidad)
	{
		set_Value (COLUMNNAME_Cantidad, Cantidad);
	}

	/** Get Cantidad.
		@return Cantidad	  */
	public BigDecimal getCantidad () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_Cantidad);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	public I_C_OrderLine getC_OrderLine() throws RuntimeException
    {
		return (I_C_OrderLine)MTable.get(getCtx(), I_C_OrderLine.Table_Name)
			.getPO(getC_OrderLine_ID(), get_TrxName());	}

	/** Set Sales Order Line.
		@param C_OrderLine_ID 
		Sales Order Line
	  */
	public void setC_OrderLine_ID (int C_OrderLine_ID)
	{
		if (C_OrderLine_ID < 1) 
			set_Value (COLUMNNAME_C_OrderLine_ID, null);
		else 
			set_Value (COLUMNNAME_C_OrderLine_ID, Integer.valueOf(C_OrderLine_ID));
	}

	/** Get Sales Order Line.
		@return Sales Order Line
	  */
	public int getC_OrderLine_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_OrderLine_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public I_C_UOM getC_UOM() throws RuntimeException
    {
		return (I_C_UOM)MTable.get(getCtx(), I_C_UOM.Table_Name)
			.getPO(getC_UOM_ID(), get_TrxName());	}

	/** Set UOM.
		@param C_UOM_ID 
		Unit of Measure
	  */
	public void setC_UOM_ID (int C_UOM_ID)
	{
		if (C_UOM_ID < 1) 
			set_Value (COLUMNNAME_C_UOM_ID, null);
		else 
			set_Value (COLUMNNAME_C_UOM_ID, Integer.valueOf(C_UOM_ID));
	}

	/** Get UOM.
		@return Unit of Measure
	  */
	public int getC_UOM_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_UOM_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
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

	public ar.com.ergio.model.I_LAR_OrdenGarantia getLAR_OrdenGarantia() throws RuntimeException
    {
		return (ar.com.ergio.model.I_LAR_OrdenGarantia)MTable.get(getCtx(), ar.com.ergio.model.I_LAR_OrdenGarantia.Table_Name)
			.getPO(getLAR_OrdenGarantia_ID(), get_TrxName());	}

	/** Set Ordenes de Garantía.
		@param LAR_OrdenGarantia_ID Ordenes de Garantía	  */
	public void setLAR_OrdenGarantia_ID (int LAR_OrdenGarantia_ID)
	{
		if (LAR_OrdenGarantia_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LAR_OrdenGarantia_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LAR_OrdenGarantia_ID, Integer.valueOf(LAR_OrdenGarantia_ID));
	}

	/** Get Ordenes de Garantía.
		@return Ordenes de Garantía	  */
	public int getLAR_OrdenGarantia_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_OrdenGarantia_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Línea de OG.
		@param LAR_OrdenGarantiaLine_ID Línea de OG	  */
	public void setLAR_OrdenGarantiaLine_ID (int LAR_OrdenGarantiaLine_ID)
	{
		if (LAR_OrdenGarantiaLine_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LAR_OrdenGarantiaLine_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LAR_OrdenGarantiaLine_ID, Integer.valueOf(LAR_OrdenGarantiaLine_ID));
	}

	/** Get Línea de OG.
		@return Línea de OG	  */
	public int getLAR_OrdenGarantiaLine_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_OrdenGarantiaLine_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Line No.
		@param Line 
		Unique line for this document
	  */
	public void setLine (int Line)
	{
		set_Value (COLUMNNAME_Line, Integer.valueOf(Line));
	}

	/** Get Line No.
		@return Unique line for this document
	  */
	public int getLine () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_Line);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public I_M_Product getM_Product() throws RuntimeException
    {
		return (I_M_Product)MTable.get(getCtx(), I_M_Product.Table_Name)
			.getPO(getM_Product_ID(), get_TrxName());	}

	/** Set Product.
		@param M_Product_ID 
		Product, Service, Item
	  */
	public void setM_Product_ID (int M_Product_ID)
	{
		if (M_Product_ID < 1) 
			set_Value (COLUMNNAME_M_Product_ID, null);
		else 
			set_Value (COLUMNNAME_M_Product_ID, Integer.valueOf(M_Product_ID));
	}

	/** Get Product.
		@return Product, Service, Item
	  */
	public int getM_Product_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_M_Product_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public I_M_RMALine getM_RMALine() throws RuntimeException
    {
		return (I_M_RMALine)MTable.get(getCtx(), I_M_RMALine.Table_Name)
			.getPO(getM_RMALine_ID(), get_TrxName());	}

	/** Set RMA Line.
		@param M_RMALine_ID 
		Return Material Authorization Line
	  */
	public void setM_RMALine_ID (int M_RMALine_ID)
	{
		if (M_RMALine_ID < 1) 
			set_Value (COLUMNNAME_M_RMALine_ID, null);
		else 
			set_Value (COLUMNNAME_M_RMALine_ID, Integer.valueOf(M_RMALine_ID));
	}

	/** Get RMA Line.
		@return Return Material Authorization Line
	  */
	public int getM_RMALine_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_M_RMALine_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}
}