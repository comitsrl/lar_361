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

/** Generated Model for LAR_TenderType_Acct
 *  @author Adempiere (generated) 
 *  @version 361.Final (6410:0234094) | LAR 2.7.26 - $Id$ */
public class X_LAR_TenderType_Acct extends PO implements I_LAR_TenderType_Acct, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20240522L;

    /** Standard Constructor */
    public X_LAR_TenderType_Acct (Properties ctx, int LAR_TenderType_Acct_ID, String trxName)
    {
      super (ctx, LAR_TenderType_Acct_ID, trxName);
      /** if (LAR_TenderType_Acct_ID == 0)
        {
			setC_AcctSchema_ID (0);
			setIsSOTrx (false);
			setLAR_TenderType_Acct_ID (0);
			setTenderType (null);
        } */
    }

    /** Load Constructor */
    public X_LAR_TenderType_Acct (Properties ctx, ResultSet rs, String trxName)
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
      StringBuffer sb = new StringBuffer ("X_LAR_TenderType_Acct[")
        .append(get_ID()).append("]");
      return sb.toString();
    }

	public I_C_AcctSchema getC_AcctSchema() throws RuntimeException
    {
		return (I_C_AcctSchema)MTable.get(getCtx(), I_C_AcctSchema.Table_Name)
			.getPO(getC_AcctSchema_ID(), get_TrxName());	}

	/** Set Accounting Schema.
		@param C_AcctSchema_ID 
		Rules for accounting
	  */
	public void setC_AcctSchema_ID (int C_AcctSchema_ID)
	{
		if (C_AcctSchema_ID < 1) 
			set_Value (COLUMNNAME_C_AcctSchema_ID, null);
		else 
			set_Value (COLUMNNAME_C_AcctSchema_ID, Integer.valueOf(C_AcctSchema_ID));
	}

	/** Get Accounting Schema.
		@return Rules for accounting
	  */
	public int getC_AcctSchema_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_AcctSchema_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Sales Transaction.
		@param IsSOTrx 
		This is a Sales Transaction
	  */
	public void setIsSOTrx (boolean IsSOTrx)
	{
		set_Value (COLUMNNAME_IsSOTrx, Boolean.valueOf(IsSOTrx));
	}

	/** Get Sales Transaction.
		@return This is a Sales Transaction
	  */
	public boolean isSOTrx () 
	{
		Object oo = get_Value(COLUMNNAME_IsSOTrx);
		if (oo != null) 
		{
			if (oo instanceof Boolean) 
				return ((Boolean)oo).booleanValue(); 
			return "Y".equals(oo);
		}
		return false;
	}

	/** Set LAR_TenderType_Acct.
		@param LAR_TenderType_Acct_ID LAR_TenderType_Acct	  */
	public void setLAR_TenderType_Acct_ID (int LAR_TenderType_Acct_ID)
	{
		if (LAR_TenderType_Acct_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LAR_TenderType_Acct_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LAR_TenderType_Acct_ID, Integer.valueOf(LAR_TenderType_Acct_ID));
	}

	/** Get LAR_TenderType_Acct.
		@return LAR_TenderType_Acct	  */
	public int getLAR_TenderType_Acct_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_TenderType_Acct_ID);
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

	/** Set Available Account.
		@param TT_Available_Acct 
		Account for available funds
	  */
	public void setTT_Available_Acct (int TT_Available_Acct)
	{
		if (TT_Available_Acct < 1) 
			set_Value (COLUMNNAME_TT_Available_Acct, null);
		else 
			set_Value (COLUMNNAME_TT_Available_Acct, Integer.valueOf(TT_Available_Acct));
	}

	/** Get Available Account.
		@return Account for available funds
	  */
	public int getTT_Available_Acct () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_TT_Available_Acct);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public I_C_ValidCombination getTT_Available_A() throws RuntimeException
    {
		return (I_C_ValidCombination)MTable.get(getCtx(), I_C_ValidCombination.Table_Name)
			.getPO(getTT_Available_Acct(), get_TrxName());	}

	/** Set In Transit Account.
		@param TT_Intransit_Acct 
		Account for funds in transit
	  */
	public void setTT_Intransit_Acct (int TT_Intransit_Acct)
	{
		if (TT_Intransit_Acct < 1) 
			set_Value (COLUMNNAME_TT_Intransit_Acct, null);
		else 
			set_Value (COLUMNNAME_TT_Intransit_Acct, Integer.valueOf(TT_Intransit_Acct));
	}

	/** Get In Transit Account.
		@return Account for funds in transit
	  */
	public int getTT_Intransit_Acct () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_TT_Intransit_Acct);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public I_C_ValidCombination getTT_Intransit_A() throws RuntimeException
    {
		return (I_C_ValidCombination)MTable.get(getCtx(), I_C_ValidCombination.Table_Name)
			.getPO(getTT_Intransit_Acct(), get_TrxName());	}

	/** Set Unallocated Account.
		@param TT_Unallocated_Acct 
		Account for unallocated funds
	  */
	public void setTT_Unallocated_Acct (int TT_Unallocated_Acct)
	{
		if (TT_Unallocated_Acct < 1) 
			set_Value (COLUMNNAME_TT_Unallocated_Acct, null);
		else 
			set_Value (COLUMNNAME_TT_Unallocated_Acct, Integer.valueOf(TT_Unallocated_Acct));
	}

	/** Get Unallocated Account.
		@return Account for unallocated funds
	  */
	public int getTT_Unallocated_Acct () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_TT_Unallocated_Acct);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public I_C_ValidCombination getTT_Unallocated_A() throws RuntimeException
    {
		return (I_C_ValidCombination)MTable.get(getCtx(), I_C_ValidCombination.Table_Name)
			.getPO(getTT_Unallocated_Acct(), get_TrxName());	}
}  
