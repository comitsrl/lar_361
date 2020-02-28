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

/** Generated Model for LAR_Caja_Billete
 *  @author Adempiere (generated) 
 *  @version 361.Final (6410:0234094) | LAR 2.7.26 - $Id$ */
public class X_LAR_Caja_Billete extends PO implements I_LAR_Caja_Billete, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20200227L;

    /** Standard Constructor */
    public X_LAR_Caja_Billete (Properties ctx, int LAR_Caja_Billete_ID, String trxName)
    {
      super (ctx, LAR_Caja_Billete_ID, trxName);
      /** if (LAR_Caja_Billete_ID == 0)
        {
			setCantidad (0);
			setC_BankStatement_ID (0);
			setLAR_Caja_Billete_ID (0);
			setValor (Env.ZERO);
        } */
    }

    /** Load Constructor */
    public X_LAR_Caja_Billete (Properties ctx, ResultSet rs, String trxName)
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
      StringBuffer sb = new StringBuffer ("X_LAR_Caja_Billete[")
        .append(get_ID()).append("]");
      return sb.toString();
    }

	/** Set Cantidad.
		@param Cantidad Cantidad	  */
	public void setCantidad (int Cantidad)
	{
		set_Value (COLUMNNAME_Cantidad, Integer.valueOf(Cantidad));
	}

	/** Get Cantidad.
		@return Cantidad	  */
	public int getCantidad () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_Cantidad);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public I_C_BankStatement getC_BankStatement() throws RuntimeException
    {
		return (I_C_BankStatement)MTable.get(getCtx(), I_C_BankStatement.Table_Name)
			.getPO(getC_BankStatement_ID(), get_TrxName());	}

	/** Set Bank Statement.
		@param C_BankStatement_ID 
		Bank Statement of account
	  */
	public void setC_BankStatement_ID (int C_BankStatement_ID)
	{
		if (C_BankStatement_ID < 1) 
			set_Value (COLUMNNAME_C_BankStatement_ID, null);
		else 
			set_Value (COLUMNNAME_C_BankStatement_ID, Integer.valueOf(C_BankStatement_ID));
	}

	/** Get Bank Statement.
		@return Bank Statement of account
	  */
	public int getC_BankStatement_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_BankStatement_ID);
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

	/** Set Billete.
		@param LAR_Caja_Billete_ID Billete	  */
	public void setLAR_Caja_Billete_ID (int LAR_Caja_Billete_ID)
	{
		if (LAR_Caja_Billete_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LAR_Caja_Billete_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LAR_Caja_Billete_ID, Integer.valueOf(LAR_Caja_Billete_ID));
	}

	/** Get Billete.
		@return Billete	  */
	public int getLAR_Caja_Billete_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_Caja_Billete_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Valor.
		@param Valor Valor	  */
	public void setValor (BigDecimal Valor)
	{
		set_Value (COLUMNNAME_Valor, Valor);
	}

	/** Get Valor.
		@return Valor	  */
	public BigDecimal getValor () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_Valor);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}
}