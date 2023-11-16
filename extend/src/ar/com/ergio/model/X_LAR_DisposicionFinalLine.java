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

/** Generated Model for LAR_DisposicionFinalLine
 *  @author Adempiere (generated) 
 *  @version 361.Final (6410:0234094) | LAR 2.13.20 - $Id$ */
public class X_LAR_DisposicionFinalLine extends PO implements I_LAR_DisposicionFinalLine, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20231031L;

    /** Standard Constructor */
    public X_LAR_DisposicionFinalLine (Properties ctx, int LAR_DisposicionFinalLine_ID, String trxName)
    {
      super (ctx, LAR_DisposicionFinalLine_ID, trxName);
      /** if (LAR_DisposicionFinalLine_ID == 0)
        {
			setCantidad (Env.ZERO);
			setC_UOM_ID (0);
// @#C_UOM_ID@
			setLAR_DisposicionFinal_ID (0);
			setLAR_DisposicionFinalLine_ID (0);
			setLine (0);
// @SQL=SELECT COALESCE(MAX(Line),0)+10 AS DefaultValue FROM LAR_DisposicionFinalLine WHERE LAR_DisposicionFinal_ID=@LAR_DisposicionFinal_ID@
			setM_Product_ID (0);
        } */
    }

    /** Load Constructor */
    public X_LAR_DisposicionFinalLine (Properties ctx, ResultSet rs, String trxName)
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
      StringBuffer sb = new StringBuffer ("X_LAR_DisposicionFinalLine[")
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

	public ar.com.ergio.model.I_LAR_DisposicionFinal getLAR_DisposicionFinal() throws RuntimeException
    {
		return (ar.com.ergio.model.I_LAR_DisposicionFinal)MTable.get(getCtx(), ar.com.ergio.model.I_LAR_DisposicionFinal.Table_Name)
			.getPO(getLAR_DisposicionFinal_ID(), get_TrxName());	}

	/** Set Disposición Final.
		@param LAR_DisposicionFinal_ID Disposición Final	  */
	public void setLAR_DisposicionFinal_ID (int LAR_DisposicionFinal_ID)
	{
		if (LAR_DisposicionFinal_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LAR_DisposicionFinal_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LAR_DisposicionFinal_ID, Integer.valueOf(LAR_DisposicionFinal_ID));
	}

	/** Get Disposición Final.
		@return Disposición Final	  */
	public int getLAR_DisposicionFinal_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_DisposicionFinal_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Línea DF.
		@param LAR_DisposicionFinalLine_ID Línea DF	  */
	public void setLAR_DisposicionFinalLine_ID (int LAR_DisposicionFinalLine_ID)
	{
		if (LAR_DisposicionFinalLine_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LAR_DisposicionFinalLine_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LAR_DisposicionFinalLine_ID, Integer.valueOf(LAR_DisposicionFinalLine_ID));
	}

	/** Get Línea DF.
		@return Línea DF	  */
	public int getLAR_DisposicionFinalLine_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_DisposicionFinalLine_ID);
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
}