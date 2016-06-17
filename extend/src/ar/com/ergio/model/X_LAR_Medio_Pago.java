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

/** Generated Model for LAR_Medio_Pago
 *  @author Adempiere (generated) 
 *  @version 361.Final (6410:0234094) | LAR 2.0.0 | Yacopino 2.0.0 - $Id$ */
public class X_LAR_Medio_Pago extends PO implements I_LAR_Medio_Pago, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20150626L;

    /** Standard Constructor */
    public X_LAR_Medio_Pago (Properties ctx, int LAR_Medio_Pago_ID, String trxName)
    {
      super (ctx, LAR_Medio_Pago_ID, trxName);
      /** if (LAR_Medio_Pago_ID == 0)
        {
			setLAR_Medio_Pago_ID (0);
			setTenderType (null);
        } */
    }

    /** Load Constructor */
    public X_LAR_Medio_Pago (Properties ctx, ResultSet rs, String trxName)
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
      StringBuffer sb = new StringBuffer ("X_LAR_Medio_Pago[")
        .append(get_ID()).append("]");
      return sb.toString();
    }

	/** Set LAR_Medio_Pago.
		@param LAR_Medio_Pago_ID LAR_Medio_Pago	  */
	public void setLAR_Medio_Pago_ID (int LAR_Medio_Pago_ID)
	{
		if (LAR_Medio_Pago_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LAR_Medio_Pago_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LAR_Medio_Pago_ID, Integer.valueOf(LAR_Medio_Pago_ID));
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

	public ar.com.ergio.model.I_LAR_Tarjeta_Credito getLAR_Tarjeta_Credito() throws RuntimeException
    {
		return (ar.com.ergio.model.I_LAR_Tarjeta_Credito)MTable.get(getCtx(), ar.com.ergio.model.I_LAR_Tarjeta_Credito.Table_Name)
			.getPO(getLAR_Tarjeta_Credito_ID(), get_TrxName());	}

	/** Set Tarjeta de Crédito.
		@param LAR_Tarjeta_Credito_ID Tarjeta de Crédito	  */
	public void setLAR_Tarjeta_Credito_ID (int LAR_Tarjeta_Credito_ID)
	{
		if (LAR_Tarjeta_Credito_ID < 1) 
			set_Value (COLUMNNAME_LAR_Tarjeta_Credito_ID, null);
		else 
			set_Value (COLUMNNAME_LAR_Tarjeta_Credito_ID, Integer.valueOf(LAR_Tarjeta_Credito_ID));
	}

	/** Get Tarjeta de Crédito.
		@return Tarjeta de Crédito	  */
	public int getLAR_Tarjeta_Credito_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_Tarjeta_Credito_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
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