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
import java.sql.Timestamp;
import java.util.Properties;
import org.compiere.model.*;
import org.compiere.util.Env;

/** Generated Model for LAR_LoteSueldos
 *  @author Adempiere (generated) 
 *  @version 362.2 (e8f23fb40) | LAR 2.15.9 - $Id$ */
public class X_LAR_LoteSueldos extends PO implements I_LAR_LoteSueldos, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20250822L;

    /** Standard Constructor */
    public X_LAR_LoteSueldos (Properties ctx, int LAR_LoteSueldos_ID, String trxName)
    {
      super (ctx, LAR_LoteSueldos_ID, trxName);
      /** if (LAR_LoteSueldos_ID == 0)
        {
			setLAR_LoteSueldos_ID (0);
			setTenderType (null);
// X
			setTenderTypeMiles (null);
        } */
    }

    /** Load Constructor */
    public X_LAR_LoteSueldos (Properties ctx, ResultSet rs, String trxName)
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
      StringBuffer sb = new StringBuffer ("X_LAR_LoteSueldos[")
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

	/** Set Transaction Date.
		@param DateTrx 
		Transaction Date
	  */
	public void setDateTrx (Timestamp DateTrx)
	{
		set_Value (COLUMNNAME_DateTrx, DateTrx);
	}

	/** Get Transaction Date.
		@return Transaction Date
	  */
	public Timestamp getDateTrx () 
	{
		return (Timestamp)get_Value(COLUMNNAME_DateTrx);
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

	/** DocAction AD_Reference_ID=135 */
	public static final int DOCACTION_AD_Reference_ID=135;
	/** Complete = CO */
	public static final String DOCACTION_Complete = "CO";
	/** Approve = AP */
	public static final String DOCACTION_Approve = "AP";
	/** Reject = RJ */
	public static final String DOCACTION_Reject = "RJ";
	/** Post = PO */
	public static final String DOCACTION_Post = "PO";
	/** Void = VO */
	public static final String DOCACTION_Void = "VO";
	/** Close = CL */
	public static final String DOCACTION_Close = "CL";
	/** Reverse - Correct = RC */
	public static final String DOCACTION_Reverse_Correct = "RC";
	/** Reverse - Accrual = RA */
	public static final String DOCACTION_Reverse_Accrual = "RA";
	/** Invalidate = IN */
	public static final String DOCACTION_Invalidate = "IN";
	/** Re-activate = RE */
	public static final String DOCACTION_Re_Activate = "RE";
	/** <None> = -- */
	public static final String DOCACTION_None = "--";
	/** Prepare = PR */
	public static final String DOCACTION_Prepare = "PR";
	/** Unlock = XL */
	public static final String DOCACTION_Unlock = "XL";
	/** Wait Complete = WC */
	public static final String DOCACTION_WaitComplete = "WC";
	/** Set Document Action.
		@param DocAction 
		The targeted status of the document
	  */
	public void setDocAction (String DocAction)
	{

		set_Value (COLUMNNAME_DocAction, DocAction);
	}

	/** Get Document Action.
		@return The targeted status of the document
	  */
	public String getDocAction () 
	{
		return (String)get_Value(COLUMNNAME_DocAction);
	}

	/** DocStatus AD_Reference_ID=131 */
	public static final int DOCSTATUS_AD_Reference_ID=131;
	/** Drafted = DR */
	public static final String DOCSTATUS_Drafted = "DR";
	/** Completed = CO */
	public static final String DOCSTATUS_Completed = "CO";
	/** Approved = AP */
	public static final String DOCSTATUS_Approved = "AP";
	/** Not Approved = NA */
	public static final String DOCSTATUS_NotApproved = "NA";
	/** Voided = VO */
	public static final String DOCSTATUS_Voided = "VO";
	/** Invalid = IN */
	public static final String DOCSTATUS_Invalid = "IN";
	/** Reversed = RE */
	public static final String DOCSTATUS_Reversed = "RE";
	/** Closed = CL */
	public static final String DOCSTATUS_Closed = "CL";
	/** Unknown = ?? */
	public static final String DOCSTATUS_Unknown = "??";
	/** In Progress = IP */
	public static final String DOCSTATUS_InProgress = "IP";
	/** Waiting Payment = WP */
	public static final String DOCSTATUS_WaitingPayment = "WP";
	/** Waiting Confirmation = WC */
	public static final String DOCSTATUS_WaitingConfirmation = "WC";
	/** Set Document Status.
		@param DocStatus 
		The current status of the document
	  */
	public void setDocStatus (String DocStatus)
	{

		set_Value (COLUMNNAME_DocStatus, DocStatus);
	}

	/** Get Document Status.
		@return The current status of the document
	  */
	public String getDocStatus () 
	{
		return (String)get_Value(COLUMNNAME_DocStatus);
	}

	/** DocStatusPagos AD_Reference_ID=131 */
	public static final int DOCSTATUSPAGOS_AD_Reference_ID=131;
	/** Drafted = DR */
	public static final String DOCSTATUSPAGOS_Drafted = "DR";
	/** Completed = CO */
	public static final String DOCSTATUSPAGOS_Completed = "CO";
	/** Approved = AP */
	public static final String DOCSTATUSPAGOS_Approved = "AP";
	/** Not Approved = NA */
	public static final String DOCSTATUSPAGOS_NotApproved = "NA";
	/** Voided = VO */
	public static final String DOCSTATUSPAGOS_Voided = "VO";
	/** Invalid = IN */
	public static final String DOCSTATUSPAGOS_Invalid = "IN";
	/** Reversed = RE */
	public static final String DOCSTATUSPAGOS_Reversed = "RE";
	/** Closed = CL */
	public static final String DOCSTATUSPAGOS_Closed = "CL";
	/** Unknown = ?? */
	public static final String DOCSTATUSPAGOS_Unknown = "??";
	/** In Progress = IP */
	public static final String DOCSTATUSPAGOS_InProgress = "IP";
	/** Waiting Payment = WP */
	public static final String DOCSTATUSPAGOS_WaitingPayment = "WP";
	/** Waiting Confirmation = WC */
	public static final String DOCSTATUSPAGOS_WaitingConfirmation = "WC";
	/** Set DocStatusPagos.
		@param DocStatusPagos DocStatusPagos	  */
	public void setDocStatusPagos (String DocStatusPagos)
	{

		set_Value (COLUMNNAME_DocStatusPagos, DocStatusPagos);
	}

	/** Get DocStatusPagos.
		@return DocStatusPagos	  */
	public String getDocStatusPagos () 
	{
		return (String)get_Value(COLUMNNAME_DocStatusPagos);
	}

	/** Set Document No.
		@param DocumentNo 
		Document sequence number of the document
	  */
	public void setDocumentNo (String DocumentNo)
	{
		set_Value (COLUMNNAME_DocumentNo, DocumentNo);
	}

	/** Get Document No.
		@return Document sequence number of the document
	  */
	public String getDocumentNo () 
	{
		return (String)get_Value(COLUMNNAME_DocumentNo);
	}

	/** Set GenerarArchivoExportacion.
		@param GenerarArchivoExportacion GenerarArchivoExportacion	  */
	public void setGenerarArchivoExportacion (String GenerarArchivoExportacion)
	{
		set_Value (COLUMNNAME_GenerarArchivoExportacion, GenerarArchivoExportacion);
	}

	/** Get GenerarArchivoExportacion.
		@return GenerarArchivoExportacion	  */
	public String getGenerarArchivoExportacion () 
	{
		return (String)get_Value(COLUMNNAME_GenerarArchivoExportacion);
	}

	/** Set Conceptos de Caja.
		@param LAR_ConceptoCaja_ID Conceptos de Caja	  */
	public void setLAR_ConceptoCaja_ID (int LAR_ConceptoCaja_ID)
	{
		if (LAR_ConceptoCaja_ID < 1) 
			set_Value (COLUMNNAME_LAR_ConceptoCaja_ID, null);
		else 
			set_Value (COLUMNNAME_LAR_ConceptoCaja_ID, Integer.valueOf(LAR_ConceptoCaja_ID));
	}

	/** Get Conceptos de Caja.
		@return Conceptos de Caja	  */
	public int getLAR_ConceptoCaja_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_LAR_ConceptoCaja_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
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

	/** Set Cabecera Lote de Sueldos.
		@param LAR_LoteSueldos_ID Cabecera Lote de Sueldos	  */
	public void setLAR_LoteSueldos_ID (int LAR_LoteSueldos_ID)
	{
		if (LAR_LoteSueldos_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LAR_LoteSueldos_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LAR_LoteSueldos_ID, Integer.valueOf(LAR_LoteSueldos_ID));
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

	/** Set LoteImporte.
		@param LoteImporte LoteImporte	  */
	public void setLoteImporte (BigDecimal LoteImporte)
	{
		set_Value (COLUMNNAME_LoteImporte, LoteImporte);
	}

	/** Get LoteImporte.
		@return LoteImporte	  */
	public BigDecimal getLoteImporte () 
	{
		BigDecimal bd = (BigDecimal)get_Value(COLUMNNAME_LoteImporte);
		if (bd == null)
			 return Env.ZERO;
		return bd;
	}

	/** Set Processed.
		@param Processed 
		The document has been processed
	  */
	public void setProcessed (boolean Processed)
	{
		set_Value (COLUMNNAME_Processed, Boolean.valueOf(Processed));
	}

    /** Set Process Now.
    @param Processing Process Now     */
public void setProcessing (boolean Processing)
{
    set_Value (COLUMNNAME_Processing, Boolean.valueOf(Processing));
}

	/** Get Processed.
		@return The document has been processed
	  */
	public boolean isProcessed () 
	{
		Object oo = get_Value(COLUMNNAME_Processed);
		if (oo != null) 
		{
			 if (oo instanceof Boolean) 
				 return ((Boolean)oo).booleanValue(); 
			return "Y".equals(oo);
		}
		return false;
	}

	/** Set RecuperarSueldos.
		@param RecuperarSueldos RecuperarSueldos	  */
	public void setRecuperarSueldos (String RecuperarSueldos)
	{
		set_Value (COLUMNNAME_RecuperarSueldos, RecuperarSueldos);
	}

	/** Get RecuperarSueldos.
		@return RecuperarSueldos	  */
	public String getRecuperarSueldos () 
	{
		return (String)get_Value(COLUMNNAME_RecuperarSueldos);
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
}