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

/** Generated Model for LAR_TenderType_BankAccount
 *  @author Adempiere (generated) 
 *  @version 361.Final (6410:0234094) | LAR 2.1.1 - $Id$ */
public class X_LAR_TenderType_BankAccount extends PO implements I_LAR_TenderType_BankAccount, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20160616L;

    /** Standard Constructor */
    public X_LAR_TenderType_BankAccount (Properties ctx, int LAR_TenderType_BankAccount_ID, String trxName)
    {
      super (ctx, LAR_TenderType_BankAccount_ID, trxName);
      /** if (LAR_TenderType_BankAccount_ID == 0)
        {
			setC_BankAccount_ID (0);
			setLAR_TenderType_BankAccount_ID (0);
			setTenderType (null);
        } */
    }

    /** Load Constructor */
    public X_LAR_TenderType_BankAccount (Properties ctx, ResultSet rs, String trxName)
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
      StringBuffer sb = new StringBuffer ("X_LAR_TenderType_BankAccount[")
        .append(get_ID()).append("]");
      return sb.toString();
    }

	public I_C_BankAccount getC_BankAccount() throws RuntimeException
    {
		return (I_C_BankAccount)MTable.get(getCtx(), I_C_BankAccount.Table_Name)
			.getPO(getC_BankAccount_ID(), get_TrxName());	}

	/** Set Bank Account.
		@param C_BankAccount_ID 
		Account at the Bank
	  */
	public void setC_BankAccount_ID (int C_BankAccount_ID)
	{
		if (C_BankAccount_ID < 1) 
			set_Value (COLUMNNAME_C_BankAccount_ID, null);
		else 
			set_Value (COLUMNNAME_C_BankAccount_ID, Integer.valueOf(C_BankAccount_ID));
	}

	/** Get Bank Account.
		@return Account at the Bank
	  */
	public int getC_BankAccount_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_BankAccount_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** CreditCardType AD_Reference_ID=149 */
	public static final int CREDITCARDTYPE_AD_Reference_ID=149;
	/** Amex = A */
	public static final String CREDITCARDTYPE_Amex = "A";
	/** MasterCard = M */
	public static final String CREDITCARDTYPE_MasterCard = "M";
	/** Visa = V */
	public static final String CREDITCARDTYPE_Visa = "V";
	/** ATM = C */
	public static final String CREDITCARDTYPE_ATM = "C";
	/** Diners = D */
	public static final String CREDITCARDTYPE_Diners = "D";
	/** Discover = N */
	public static final String CREDITCARDTYPE_Discover = "N";
	/** Purchase Card = P */
	public static final String CREDITCARDTYPE_PurchaseCard = "P";
	/** Cabal = E */
	public static final String CREDITCARDTYPE_Cabal = "E";
	/** Actual = R */
	public static final String CREDITCARDTYPE_Actual = "R";
	/** Credicom = G */
	public static final String CREDITCARDTYPE_Credicom = "G";
	/** Confiable = I */
	public static final String CREDITCARDTYPE_Confiable = "I";
	/** Crediguia = O */
	public static final String CREDITCARDTYPE_Crediguia = "O";
	/** Carta Automática = L */
	public static final String CREDITCARDTYPE_CartaAutomática = "L";
	/** NyC = U */
	public static final String CREDITCARDTYPE_NyC = "U";
	/** CoopPlus = X */
	public static final String CREDITCARDTYPE_CoopPlus = "X";
	/** Naranja = J */
	public static final String CREDITCARDTYPE_Naranja = "J";
	/** Nevada = Y */
	public static final String CREDITCARDTYPE_Nevada = "Y";
	/** Nativa = Z */
	public static final String CREDITCARDTYPE_Nativa = "Z";
	/** Nativa Mastercard = T */
	public static final String CREDITCARDTYPE_NativaMastercard = "T";
	/** Otra = W */
	public static final String CREDITCARDTYPE_Otra = "W";
	/** Set Credit Card.
		@param CreditCardType 
		Credit Card (Visa, MC, AmEx)
	  */
	public void setCreditCardType (String CreditCardType)
	{

		set_Value (COLUMNNAME_CreditCardType, CreditCardType);
	}

	/** Get Credit Card.
		@return Credit Card (Visa, MC, AmEx)
	  */
	public String getCreditCardType () 
	{
		return (String)get_Value(COLUMNNAME_CreditCardType);
	}

	/** DebitCardType AD_Reference_ID=3000036 */
	public static final int DEBITCARDTYPE_AD_Reference_ID=3000036;
	/** Visa = V */
	public static final String DEBITCARDTYPE_Visa = "V";
	/** Cabal = E */
	public static final String DEBITCARDTYPE_Cabal = "E";
	/** Confiable = I */
	public static final String DEBITCARDTYPE_Confiable = "I";
	/** Nativa = Z */
	public static final String DEBITCARDTYPE_Nativa = "Z";
	/** Maestro = N */
	public static final String DEBITCARDTYPE_Maestro = "N";
	/** Set DebitCardType.
		@param DebitCardType DebitCardType	  */
	public void setDebitCardType (String DebitCardType)
	{

		set_Value (COLUMNNAME_DebitCardType, DebitCardType);
	}

	/** Get DebitCardType.
		@return DebitCardType	  */
	public String getDebitCardType () 
	{
		return (String)get_Value(COLUMNNAME_DebitCardType);
	}

	/** Set LAR_TenderType_BankAccount.
		@param LAR_TenderType_BankAccount_ID LAR_TenderType_BankAccount	  */
	public void setLAR_TenderType_BankAccount_ID (int LAR_TenderType_BankAccount_ID)
	{
		if (LAR_TenderType_BankAccount_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LAR_TenderType_BankAccount_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LAR_TenderType_BankAccount_ID, Integer.valueOf(LAR_TenderType_BankAccount_ID));
	}

	/** Get LAR_TenderType_BankAccount.
		@return LAR_TenderType_BankAccount	  */
	public int getLAR_TenderType_BankAccount_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_TenderType_BankAccount_ID);
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