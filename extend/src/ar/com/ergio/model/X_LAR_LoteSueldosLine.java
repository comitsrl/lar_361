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

/** Generated Model for LAR_LoteSueldosLine
 *  @author Adempiere (generated) 
 *  @version 362.2 (e8f23fb40) | LAR 2.15.9 - $Id$ */
public class X_LAR_LoteSueldosLine extends PO implements I_LAR_LoteSueldosLine, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20250822L;

    /** Standard Constructor */
    public X_LAR_LoteSueldosLine (Properties ctx, int LAR_LoteSueldosLine_ID, String trxName)
    {
      super (ctx, LAR_LoteSueldosLine_ID, trxName);
      /** if (LAR_LoteSueldosLine_ID == 0)
        {
			setC_Remuneration_ID (0);
			setLAR_LoteSueldos_ID (0);
			setLAR_LoteSueldosLine_ID (0);
			setTenderType (null);
// A
			setTenderTypeMiles (null);
// X
        } */
    }

    /** Load Constructor */
    public X_LAR_LoteSueldosLine (Properties ctx, ResultSet rs, String trxName)
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
      StringBuffer sb = new StringBuffer ("X_LAR_LoteSueldosLine[")
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

	public I_C_BPartner getC_BPartner() throws RuntimeException
    {
		return (I_C_BPartner)MTable.get(getCtx(), I_C_BPartner.Table_Name)
			.getPO(getC_BPartner_ID(), get_TrxName());	}

	/** Set Business Partner .
		@param C_BPartner_ID 
		Identifies a Business Partner
	  */
	public void setC_BPartner_ID (int C_BPartner_ID)
	{
		if (C_BPartner_ID < 1) 
			set_Value (COLUMNNAME_C_BPartner_ID, null);
		else 
			set_Value (COLUMNNAME_C_BPartner_ID, Integer.valueOf(C_BPartner_ID));
	}

	/** Get Business Partner .
		@return Identifies a Business Partner
	  */
	public int getC_BPartner_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_BPartner_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public I_C_Remuneration getC_Remuneration() throws RuntimeException
    {
		return (I_C_Remuneration)MTable.get(getCtx(), I_C_Remuneration.Table_Name)
			.getPO(getC_Remuneration_ID(), get_TrxName());	}

	/** Set Remuneration.
		@param C_Remuneration_ID 
		Wage or Salary
	  */
	public void setC_Remuneration_ID (int C_Remuneration_ID)
	{
		if (C_Remuneration_ID < 1) 
			set_Value (COLUMNNAME_C_Remuneration_ID, null);
		else 
			set_Value (COLUMNNAME_C_Remuneration_ID, Integer.valueOf(C_Remuneration_ID));
	}

	/** Get Remuneration.
		@return Wage or Salary
	  */
	public int getC_Remuneration_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_Remuneration_ID);
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

	/** Set ImporteMiles.
		@param ImporteMiles ImporteMiles	  */
	public void setImporteMiles (BigDecimal ImporteMiles)
	{
		set_Value (COLUMNNAME_ImporteMiles, ImporteMiles);
	}

	/** Get ImporteMiles.
		@return ImporteMiles	  */
	public BigDecimal getImporteMiles () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_ImporteMiles);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set ImportePpal.
		@param ImportePpal ImportePpal	  */
	public void setImportePpal (BigDecimal ImportePpal)
	{
		set_Value (COLUMNNAME_ImportePpal, ImportePpal);
	}

	/** Get ImportePpal.
		@return ImportePpal	  */
	public BigDecimal getImportePpal () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_ImportePpal);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	public ar.com.ergio.model.I_LAR_Tarjeta_Credito getLAR_Deposito_Directo() throws RuntimeException
    {
		return (ar.com.ergio.model.I_LAR_Tarjeta_Credito)MTable.get(getCtx(), ar.com.ergio.model.I_LAR_Tarjeta_Credito.Table_Name)
			.getPO(getLAR_Deposito_Directo_ID(), get_TrxName());	}

	/** Set Tipo de Depósito Directo.
		@param LAR_Deposito_Directo_ID Tipo de Depósito Directo	  */
	public void setLAR_Deposito_Directo_ID (int LAR_Deposito_Directo_ID)
	{
		if (LAR_Deposito_Directo_ID < 1) 
			set_Value (COLUMNNAME_LAR_Deposito_Directo_ID, null);
		else 
			set_Value (COLUMNNAME_LAR_Deposito_Directo_ID, Integer.valueOf(LAR_Deposito_Directo_ID));
	}

	/** Get Tipo de Depósito Directo.
		@return Tipo de Depósito Directo	  */
	public int getLAR_Deposito_Directo_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_Deposito_Directo_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public ar.com.ergio.model.I_LAR_LoteSueldos getLAR_LoteSueldos() throws RuntimeException
    {
		return (ar.com.ergio.model.I_LAR_LoteSueldos)MTable.get(getCtx(), ar.com.ergio.model.I_LAR_LoteSueldos.Table_Name)
			.getPO(getLAR_LoteSueldos_ID(), get_TrxName());	}

	/** Set Cabecera Lote de Sueldos.
		@param LAR_LoteSueldos_ID Cabecera Lote de Sueldos	  */
	public void setLAR_LoteSueldos_ID (int LAR_LoteSueldos_ID)
	{
		if (LAR_LoteSueldos_ID < 1) 
			set_Value (COLUMNNAME_LAR_LoteSueldos_ID, null);
		else 
			set_Value (COLUMNNAME_LAR_LoteSueldos_ID, Integer.valueOf(LAR_LoteSueldos_ID));
	}

	/** Get Cabecera Lote de Sueldos.
		@return Cabecera Lote de Sueldos	  */
	public int getLAR_LoteSueldos_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_LoteSueldos_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	/** Set Detalle de Sueldos.
		@param LAR_LoteSueldosLine_ID Detalle de Sueldos	  */
	public void setLAR_LoteSueldosLine_ID (int LAR_LoteSueldosLine_ID)
	{
		if (LAR_LoteSueldosLine_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LAR_LoteSueldosLine_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LAR_LoteSueldosLine_ID, Integer.valueOf(LAR_LoteSueldosLine_ID));
	}

	/** Get Detalle de Sueldos.
		@return Detalle de Sueldos	  */
	public int getLAR_LoteSueldosLine_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_LoteSueldosLine_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public ar.com.ergio.model.I_LAR_PaymentHeader getLAR_PaymentHeader() throws RuntimeException
    {
		return (ar.com.ergio.model.I_LAR_PaymentHeader)MTable.get(getCtx(), ar.com.ergio.model.I_LAR_PaymentHeader.Table_Name)
			.getPO(getLAR_PaymentHeader_ID(), get_TrxName());	}

	/** Set Cabecera de Pago/Cobro.
		@param LAR_PaymentHeader_ID Cabecera de Pago/Cobro	  */
	public void setLAR_PaymentHeader_ID (int LAR_PaymentHeader_ID)
	{
		if (LAR_PaymentHeader_ID < 1) 
			set_Value (COLUMNNAME_LAR_PaymentHeader_ID, null);
		else 
			set_Value (COLUMNNAME_LAR_PaymentHeader_ID, Integer.valueOf(LAR_PaymentHeader_ID));
	}

	/** Get Cabecera de Pago/Cobro.
		@return Cabecera de Pago/Cobro	  */
	public int getLAR_PaymentHeader_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_PaymentHeader_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public ar.com.ergio.model.I_LAR_PaymentHeader getLar_PaymentHeaderMiles() throws RuntimeException
    {
		return (ar.com.ergio.model.I_LAR_PaymentHeader)MTable.get(getCtx(), ar.com.ergio.model.I_LAR_PaymentHeader.Table_Name)
			.getPO(getLar_PaymentHeaderMiles_ID(), get_TrxName());	}

	/** Set Lar_PaymentHeaderMiles_ID.
		@param Lar_PaymentHeaderMiles_ID Lar_PaymentHeaderMiles_ID	  */
	public void setLar_PaymentHeaderMiles_ID (int Lar_PaymentHeaderMiles_ID)
	{
		if (Lar_PaymentHeaderMiles_ID < 1) 
			set_Value (COLUMNNAME_Lar_PaymentHeaderMiles_ID, null);
		else 
			set_Value (COLUMNNAME_Lar_PaymentHeaderMiles_ID, Integer.valueOf(Lar_PaymentHeaderMiles_ID));
	}

	/** Get Lar_PaymentHeaderMiles_ID.
		@return Lar_PaymentHeaderMiles_ID	  */
	public int getLar_PaymentHeaderMiles_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_Lar_PaymentHeaderMiles_ID);
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
	/** Contra Reembolso Contado = N */
	public static final String TENDERTYPE_ContraReembolsoContado = "N";
	/** Contra Reembolso Cheque Propio = O */
	public static final String TENDERTYPE_ContraReembolsoChequePropio = "O";
	/** Nota de Crédito = R */
	public static final String TENDERTYPE_NotaDeCrédito = "R";
	/** Billetera Digital = Q */
	public static final String TENDERTYPE_BilleteraDigital = "Q";
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

	/** TenderTypeMiles AD_Reference_ID=214 */
	public static final int TENDERTYPEMILES_AD_Reference_ID=214;
	/** Credit Card = C */
	public static final String TENDERTYPEMILES_CreditCard = "C";
	/** Check = K */
	public static final String TENDERTYPEMILES_Check = "K";
	/** Direct Deposit = A */
	public static final String TENDERTYPEMILES_DirectDeposit = "A";
	/** Direct Debit = D */
	public static final String TENDERTYPEMILES_DirectDebit = "D";
	/** Account = T */
	public static final String TENDERTYPEMILES_Account = "T";
	/** Cash = X */
	public static final String TENDERTYPEMILES_Cash = "X";
	/** CtaCte Contra Reembolso = Y */
	public static final String TENDERTYPEMILES_CtaCteContraReembolso = "Y";
	/** Cheque Tercero = Z */
	public static final String TENDERTYPEMILES_ChequeTercero = "Z";
	/** Contra Reembolso Contado = N */
	public static final String TENDERTYPEMILES_ContraReembolsoContado = "N";
	/** Contra Reembolso Cheque Propio = O */
	public static final String TENDERTYPEMILES_ContraReembolsoChequePropio = "O";
	/** Nota de Crédito = R */
	public static final String TENDERTYPEMILES_NotaDeCrédito = "R";
	/** Billetera Digital = Q */
	public static final String TENDERTYPEMILES_BilleteraDigital = "Q";
	/** Set TenderTypeMiles.
		@param TenderTypeMiles TenderTypeMiles	  */
	public void setTenderTypeMiles (String TenderTypeMiles)
	{

		set_Value (COLUMNNAME_TenderTypeMiles, TenderTypeMiles);
	}

	/** Get TenderTypeMiles.
		@return TenderTypeMiles	  */
	public String getTenderTypeMiles () 
	{
		return (String)get_Value(COLUMNNAME_TenderTypeMiles);
	}

    public BigDecimal getAmount()
    {
        // TODO Auto-generated method stub
        return null;
    }
}