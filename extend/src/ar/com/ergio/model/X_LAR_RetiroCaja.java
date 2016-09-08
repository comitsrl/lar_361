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

/** Generated Model for LAR_RetiroCaja
 *  @author Adempiere (generated) 
 *  @version 361.Final (6410:0234094) | LAR 2.1.2 - $Id$ */
public class X_LAR_RetiroCaja extends PO implements I_LAR_RetiroCaja, I_Persistent 
{

	/**
	 *
	 */
	private static final long serialVersionUID = 20160905L;

    /** Standard Constructor */
    public X_LAR_RetiroCaja (Properties ctx, int LAR_RetiroCaja_ID, String trxName)
    {
      super (ctx, LAR_RetiroCaja_ID, trxName);
      /** if (LAR_RetiroCaja_ID == 0)
        {
			setC_BankAccountFrom_ID (0);
			setC_Currency_ID (0);
			setC_DocType_ID (0);
// 1000159
			setDocAction (null);
// CO
			setDocStatus (null);
// DR
			setLAR_ConceptoCaja_ID (0);
			setLAR_RetiroCaja_ID (0);
			setMonto (Env.ZERO);
			setProcessed (false);
			setRetiro (false);
			setTransferencia (false);
        } */
    }

    /** Load Constructor */
    public X_LAR_RetiroCaja (Properties ctx, ResultSet rs, String trxName)
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
      StringBuffer sb = new StringBuffer ("X_LAR_RetiroCaja[")
        .append(get_ID()).append("]");
      return sb.toString();
    }

	public I_C_BankAccount getC_BankAccountFrom() throws RuntimeException
    {
		return (I_C_BankAccount)MTable.get(getCtx(), I_C_BankAccount.Table_Name)
			.getPO(getC_BankAccountFrom_ID(), get_TrxName());	}

	/** Set Caja Origen.
		@param C_BankAccountFrom_ID Caja Origen	  */
	public void setC_BankAccountFrom_ID (int C_BankAccountFrom_ID)
	{
		if (C_BankAccountFrom_ID < 1) 
			set_Value (COLUMNNAME_C_BankAccountFrom_ID, null);
		else 
			set_Value (COLUMNNAME_C_BankAccountFrom_ID, Integer.valueOf(C_BankAccountFrom_ID));
	}

	/** Get Caja Origen.
		@return Caja Origen	  */
	public int getC_BankAccountFrom_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_BankAccountFrom_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public I_C_BankAccount getC_BankAccountTo() throws RuntimeException
    {
		return (I_C_BankAccount)MTable.get(getCtx(), I_C_BankAccount.Table_Name)
			.getPO(getC_BankAccountTo_ID(), get_TrxName());	}

	/** Set Caja Destino.
		@param C_BankAccountTo_ID Caja Destino	  */
	public void setC_BankAccountTo_ID (int C_BankAccountTo_ID)
	{
		if (C_BankAccountTo_ID < 1) 
			set_Value (COLUMNNAME_C_BankAccountTo_ID, null);
		else 
			set_Value (COLUMNNAME_C_BankAccountTo_ID, Integer.valueOf(C_BankAccountTo_ID));
	}

	/** Get Caja Destino.
		@return Caja Destino	  */
	public int getC_BankAccountTo_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_BankAccountTo_ID);
		if (ii == null)
			 return 0;
		return ii.intValue();
	}

	public I_C_Currency getC_Currency() throws RuntimeException
    {
		return (I_C_Currency)MTable.get(getCtx(), I_C_Currency.Table_Name)
			.getPO(getC_Currency_ID(), get_TrxName());	}

	/** Set Currency.
		@param C_Currency_ID 
		The Currency for this record
	  */
	public void setC_Currency_ID (int C_Currency_ID)
	{
		if (C_Currency_ID < 1) 
			set_Value (COLUMNNAME_C_Currency_ID, null);
		else 
			set_Value (COLUMNNAME_C_Currency_ID, Integer.valueOf(C_Currency_ID));
	}

	/** Get Currency.
		@return The Currency for this record
	  */
	public int getC_Currency_ID () 
	{
		Integer ii = (Integer)get_Value(COLUMNNAME_C_Currency_ID);
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
			set_ValueNoCheck (COLUMNNAME_C_DocType_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_C_DocType_ID, Integer.valueOf(C_DocType_ID));
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

		set_ValueNoCheck (COLUMNNAME_DocStatus, DocStatus);
	}

	/** Get Document Status.
		@return The current status of the document
	  */
	public String getDocStatus () 
	{
		return (String)get_Value(COLUMNNAME_DocStatus);
	}

	//public ar.com.ergio.model.I_LAR_ConceptoCaja getLAR_ConceptoCaja() throws RuntimeException
    //{
		//return (ar.com.ergio.model.I_LAR_ConceptoCaja)MTable.get(getCtx(), ar.com.ergio.model.I_LAR_ConceptoCaja.Table_Name)
			//.getPO(getLAR_ConceptoCaja_ID(), get_TrxName());	}

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

	/** Set Retiros de Caja.
		@param LAR_RetiroCaja_ID Retiros de Caja	  */
	public void setLAR_RetiroCaja_ID (int LAR_RetiroCaja_ID)
	{
		if (LAR_RetiroCaja_ID < 1) 
			set_ValueNoCheck (COLUMNNAME_LAR_RetiroCaja_ID, null);
		else 
			set_ValueNoCheck (COLUMNNAME_LAR_RetiroCaja_ID, Integer.valueOf(LAR_RetiroCaja_ID));
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

	/** Set Processed.
		@param Processed 
		The document has been processed
	  */
	public void setProcessed (boolean Processed)
	{
		set_Value (COLUMNNAME_Processed, Boolean.valueOf(Processed));
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

	/** Set Process Now.
		@param Processing Process Now	  */
	public void setProcessing (boolean Processing)
	{
		set_Value (COLUMNNAME_Processing, Boolean.valueOf(Processing));
	}

	/** Get Process Now.
		@return Process Now	  */
	public boolean isProcessing () 
	{
		Object oo = get_Value(COLUMNNAME_Processing);
		if (oo != null) 
		{
			 if (oo instanceof Boolean) 
				 return ((Boolean)oo).booleanValue(); 
			return "Y".equals(oo);
		}
		return false;
	}

	/** Set Retiro.
		@param Retiro Retiro	  */
	public void setRetiro (boolean Retiro)
	{
		set_Value (COLUMNNAME_Retiro, Boolean.valueOf(Retiro));
	}

	/** Get Retiro.
		@return Retiro	  */
	public boolean isRetiro () 
	{
		Object oo = get_Value(COLUMNNAME_Retiro);
		if (oo != null) 
		{
			 if (oo instanceof Boolean) 
				 return ((Boolean)oo).booleanValue(); 
			return "Y".equals(oo);
		}
		return false;
	}

	/** Set SearchPayments.
		@param SearchPayments SearchPayments	  */
	public void setSearchPayments (String SearchPayments)
	{
		set_Value (COLUMNNAME_SearchPayments, SearchPayments);
	}

	/** Get SearchPayments.
		@return SearchPayments	  */
	public String getSearchPayments () 
	{
		return (String)get_Value(COLUMNNAME_SearchPayments);
	}

	/** Set Transferencia.
		@param Transferencia Transferencia	  */
	public void setTransferencia (boolean Transferencia)
	{
		set_Value (COLUMNNAME_Transferencia, Boolean.valueOf(Transferencia));
	}

	/** Get Transferencia.
		@return Transferencia	  */
	public boolean isTransferencia () 
	{
		Object oo = get_Value(COLUMNNAME_Transferencia);
		if (oo != null) 
		{
			 if (oo instanceof Boolean) 
				 return ((Boolean)oo).booleanValue(); 
			return "Y".equals(oo);
		}
		return false;
	}
}