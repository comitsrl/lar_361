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

/** Generated Model for LAR_RetiroCajaLine
 *  @author Adempiere (generated) 
 *  @version 361.Final (6410:0234094) | LAR 2.1.2 - $Id$ */
public class X_LAR_RetiroCajaLine extends PO implements I_LAR_RetiroCajaLine, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20160905L;

    /** Standard Constructor */
    public X_LAR_RetiroCajaLine (Properties ctx, int LAR_RetiroCajaLine_ID, String trxName)
    {
      super (ctx, LAR_RetiroCajaLine_ID, trxName);
      /** if (LAR_RetiroCajaLine_ID == 0)
        {
			setLAR_RetiroCaja_ID (0);
			setLAR_RetiroCajaLine_ID (0);
			setMonto (Env.ZERO);
			setTenderType (null);
        } */
    }

    /** Load Constructor */
    public X_LAR_RetiroCajaLine (Properties ctx, ResultSet rs, String trxName)
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
      StringBuffer sb = new StringBuffer ("X_LAR_RetiroCajaLine[")
        .append(get_ID()).append("]");
      return sb.toString();
    }

	/** Set Account No.
		@param AccountNo 
		Account Number
	  */
	public void setAccountNo (String AccountNo)
	{
		set_Value (COLUMNNAME_AccountNo, AccountNo);
	}

	/** Get Account No.
		@return Account Number
	  */
	public String getAccountNo () 
	{
		return (String)get_Value(COLUMNNAME_AccountNo);
	}

	/** Set Account Name.
		@param A_Name 
		Name on Credit Card or Account holder
	  */
	public void setA_Name (String A_Name)
	{
		set_Value (COLUMNNAME_A_Name, A_Name);
	}

	/** Get Account Name.
		@return Name on Credit Card or Account holder
	  */
	public String getA_Name () 
	{
		return (String)get_Value(COLUMNNAME_A_Name);
	}

	/** Set Check No.
		@param CheckNo 
		Check Number
	  */
	public void setCheckNo (String CheckNo)
	{
		set_Value (COLUMNNAME_CheckNo, CheckNo);
	}

	/** Get Check No.
		@return Check Number
	  */
	public String getCheckNo () 
	{
		return (String)get_Value(COLUMNNAME_CheckNo);
	}

	public I_C_Payment getCobro() throws RuntimeException
    {
		return (I_C_Payment)MTable.get(getCtx(), I_C_Payment.Table_Name)
			.getPO(getCobro_ID(), get_TrxName());	}

	/** Set Cobro Caja Destino.
		@param Cobro_ID Cobro Caja Destino	  */
	public void setCobro_ID (int Cobro_ID)
	{
		if (Cobro_ID < 1) 
			set_Value (COLUMNNAME_Cobro_ID, null);
		else 
			set_Value (COLUMNNAME_Cobro_ID, Integer.valueOf(Cobro_ID));
	}

	/** Get Cobro Caja Destino.
		@return Cobro Caja Destino	  */
	public int getCobro_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_Cobro_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public ar.com.ergio.model.I_LAR_RetiroCaja getLAR_RetiroCaja() throws RuntimeException
    {
		return (ar.com.ergio.model.I_LAR_RetiroCaja)MTable.get(getCtx(), ar.com.ergio.model.I_LAR_RetiroCaja.Table_Name)
			.getPO(getLAR_RetiroCaja_ID(), get_TrxName());	}

	/** Set Retiros de Caja.
		@param LAR_RetiroCaja_ID Retiros de Caja	  */
	public void setLAR_RetiroCaja_ID (int LAR_RetiroCaja_ID)
	{
		if (LAR_RetiroCaja_ID < 1) 
			set_Value (COLUMNNAME_LAR_RetiroCaja_ID, null);
		else 
			set_Value (COLUMNNAME_LAR_RetiroCaja_ID, Integer.valueOf(LAR_RetiroCaja_ID));
	}

	/** Get Retiros de Caja.
		@return Retiros de Caja	  */
	public int getLAR_RetiroCaja_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_RetiroCaja_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set LAR_RetiroCajaLine.
		@param LAR_RetiroCajaLine_ID LAR_RetiroCajaLine	  */
	public void setLAR_RetiroCajaLine_ID (int LAR_RetiroCajaLine_ID)
	{
		if (LAR_RetiroCajaLine_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LAR_RetiroCajaLine_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LAR_RetiroCajaLine_ID, Integer.valueOf(LAR_RetiroCajaLine_ID));
	}

	/** Get LAR_RetiroCajaLine.
		@return LAR_RetiroCajaLine	  */
	public int getLAR_RetiroCajaLine_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_RetiroCajaLine_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Monto.
		@param Monto Monto	  */
	public void setMonto (BigDecimal Monto)
	{
		set_Value (COLUMNNAME_Monto, Monto);
	}

	/** Get Monto.
		@return Monto	  */
	public BigDecimal getMonto () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_Monto);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	public I_C_Payment getPago() throws RuntimeException
    {
		return (I_C_Payment)MTable.get(getCtx(), I_C_Payment.Table_Name)
			.getPO(getPago_ID(), get_TrxName());	}

	/** Set Pago Caja Origen.
		@param Pago_ID Pago Caja Origen	  */
	public void setPago_ID (int Pago_ID)
	{
		if (Pago_ID < 1) 
			set_Value (COLUMNNAME_Pago_ID, null);
		else 
			set_Value (COLUMNNAME_Pago_ID, Integer.valueOf(Pago_ID));
	}

	/** Get Pago Caja Origen.
		@return Pago Caja Origen	  */
	public int getPago_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_Pago_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Routing No.
		@param RoutingNo 
		Bank Routing Number
	  */
	public void setRoutingNo (String RoutingNo)
	{
		set_Value (COLUMNNAME_RoutingNo, RoutingNo);
	}

	/** Get Routing No.
		@return Bank Routing Number
	  */
	public String getRoutingNo () 
	{
		return (String)get_Value(COLUMNNAME_RoutingNo);
	}

	/** TenderType AD_Reference_ID=214 */
	public static final int TENDERTYPE_AD_Reference_ID=214;
	/** Credit Card = C */
	public static final String TENDERTYPE_CreditCard = "C";
	/** Check = K */
	public static final String TENDERTYPE_Check = "K";
	/** Direct Deposit = A */
	public static final String TENDERTYPE_DirectDeposit = "A";
	/** Direct Debit = D */
	public static final String TENDERTYPE_DirectDebit = "D";
	/** Account = T */
	public static final String TENDERTYPE_Account = "T";
	/** Cash = X */
	public static final String TENDERTYPE_Cash = "X";
	/** CtaCte Contra Reembolso = Y */
	public static final String TENDERTYPE_CtaCteContraReembolso = "Y";
	/** Cheque Tercero = Z */
	public static final String TENDERTYPE_ChequeTercero = "Z";
	/** Contra Reembolso Efectivo = N */
	public static final String TENDERTYPE_ContraReembolsoEfectivo = "N";
	/** Contra Reembolso Cheque Propio = O */
	public static final String TENDERTYPE_ContraReembolsoChequePropio = "O";
	/** Set Tender type.
		@param TenderType 
		Method of Payment
	  */
	public void setTenderType (String TenderType)
	{

		set_Value (COLUMNNAME_TenderType, TenderType);
	}

	/** Get Tender type.
		@return Method of Payment
	  */
	public String getTenderType () 
	{
		return (String)get_Value(COLUMNNAME_TenderType);
	}
}