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
package ar.com.ergio.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import org.compiere.model.*;
import org.compiere.util.KeyNamePair;

/** Generated Interface for LAR_RetiroCaja
 *  @author Adempiere (generated) 
 *  @version 361.Final (6410:0234094) | LAR 2.1.2
 */
public interface I_LAR_RetiroCaja 
{

    /** TableName=LAR_RetiroCaja */
    public static final String Table_Name = "LAR_RetiroCaja";

    /** AD_Table_ID=3000081 */
    public static final int Table_ID = MTable.getTable_ID(Table_Name);

    KeyNamePair Model = new KeyNamePair(Table_ID, Table_Name);

    /** AccessLevel = 3 - Client - Org 
     */
    BigDecimal accessLevel = BigDecimal.valueOf(3);

    /** Load Meta Data */

    /** Column name AD_Client_ID */
    public static final String COLUMNNAME_AD_Client_ID = "AD_Client_ID";

	/** Get Client.
	  * Client/Tenant for this installation.
	  */
	public int getAD_Client_ID();

    /** Column name AD_Org_ID */
    public static final String COLUMNNAME_AD_Org_ID = "AD_Org_ID";

	/** Set Organization.
	  * Organizational entity within client
	  */
	public void setAD_Org_ID (int AD_Org_ID);

	/** Get Organization.
	  * Organizational entity within client
	  */
	public int getAD_Org_ID();

    /** Column name C_BankAccountFrom_ID */
    public static final String COLUMNNAME_C_BankAccountFrom_ID = "C_BankAccountFrom_ID";

	/** Set Caja Origen	  */
	public void setC_BankAccountFrom_ID (int C_BankAccountFrom_ID);

	/** Get Caja Origen	  */
	public int getC_BankAccountFrom_ID();

	public I_C_BankAccount getC_BankAccountFrom() throws RuntimeException;

    /** Column name C_BankAccountTo_ID */
    public static final String COLUMNNAME_C_BankAccountTo_ID = "C_BankAccountTo_ID";

	/** Set Caja Destino	  */
	public void setC_BankAccountTo_ID (int C_BankAccountTo_ID);

	/** Get Caja Destino	  */
	public int getC_BankAccountTo_ID();

	public I_C_BankAccount getC_BankAccountTo() throws RuntimeException;

    /** Column name C_Currency_ID */
    public static final String COLUMNNAME_C_Currency_ID = "C_Currency_ID";

	/** Set Currency.
	  * The Currency for this record
	  */
	public void setC_Currency_ID (int C_Currency_ID);

	/** Get Currency.
	  * The Currency for this record
	  */
	public int getC_Currency_ID();

	public I_C_Currency getC_Currency() throws RuntimeException;

    /** Column name C_DocType_ID */
    public static final String COLUMNNAME_C_DocType_ID = "C_DocType_ID";

	/** Set Document Type.
	  * Document type or rules
	  */
	public void setC_DocType_ID (int C_DocType_ID);

	/** Get Document Type.
	  * Document type or rules
	  */
	public int getC_DocType_ID();

	public I_C_DocType getC_DocType() throws RuntimeException;

    /** Column name Created */
    public static final String COLUMNNAME_Created = "Created";

	/** Get Created.
	  * Date this record was created
	  */
	public Timestamp getCreated();

    /** Column name CreatedBy */
    public static final String COLUMNNAME_CreatedBy = "CreatedBy";

	/** Get Created By.
	  * User who created this records
	  */
	public int getCreatedBy();

    /** Column name Description */
    public static final String COLUMNNAME_Description = "Description";

	/** Set Description.
	  * Optional short description of the record
	  */
	public void setDescription (String Description);

	/** Get Description.
	  * Optional short description of the record
	  */
	public String getDescription();

    /** Column name DocAction */
    public static final String COLUMNNAME_DocAction = "DocAction";

	/** Set Document Action.
	  * The targeted status of the document
	  */
	public void setDocAction (String DocAction);

	/** Get Document Action.
	  * The targeted status of the document
	  */
	public String getDocAction();

    /** Column name DocStatus */
    public static final String COLUMNNAME_DocStatus = "DocStatus";

	/** Set Document Status.
	  * The current status of the document
	  */
	public void setDocStatus (String DocStatus);

	/** Get Document Status.
	  * The current status of the document
	  */
	public String getDocStatus();

    /** Column name IsActive */
    public static final String COLUMNNAME_IsActive = "IsActive";

	/** Set Active.
	  * The record is active in the system
	  */
	public void setIsActive (boolean IsActive);

	/** Get Active.
	  * The record is active in the system
	  */
	public boolean isActive();

    /** Column name LAR_ConceptoCaja_ID */
    public static final String COLUMNNAME_LAR_ConceptoCaja_ID = "LAR_ConceptoCaja_ID";

	/** Set Conceptos de Caja	  */
	public void setLAR_ConceptoCaja_ID (int LAR_ConceptoCaja_ID);

	/** Get Conceptos de Caja	  */
	public int getLAR_ConceptoCaja_ID();

	//public ar.com.ergio.model.I_LAR_ConceptoCaja getLAR_ConceptoCaja() throws RuntimeException;

    /** Column name LAR_RetiroCaja_ID */
    public static final String COLUMNNAME_LAR_RetiroCaja_ID = "LAR_RetiroCaja_ID";

	/** Set Retiros de Caja	  */
	public void setLAR_RetiroCaja_ID (int LAR_RetiroCaja_ID);

	/** Get Retiros de Caja	  */
	public int getLAR_RetiroCaja_ID();

    /** Column name Monto */
    public static final String COLUMNNAME_Monto = "Monto";

	/** Set Monto	  */
	public void setMonto (BigDecimal Monto);

	/** Get Monto	  */
	public BigDecimal getMonto();

    /** Column name Processed */
    public static final String COLUMNNAME_Processed = "Processed";

	/** Set Processed.
	  * The document has been processed
	  */
	public void setProcessed (boolean Processed);

	/** Get Processed.
	  * The document has been processed
	  */
	public boolean isProcessed();

    /** Column name Processing */
    public static final String COLUMNNAME_Processing = "Processing";

	/** Set Process Now	  */
	public void setProcessing (boolean Processing);

	/** Get Process Now	  */
	public boolean isProcessing();

    /** Column name Retiro */
    public static final String COLUMNNAME_Retiro = "Retiro";

	/** Set Retiro	  */
	public void setRetiro (boolean Retiro);

	/** Get Retiro	  */
	public boolean isRetiro();

    /** Column name SearchPayments */
    public static final String COLUMNNAME_SearchPayments = "SearchPayments";

	/** Set SearchPayments	  */
	public void setSearchPayments (String SearchPayments);

	/** Get SearchPayments	  */
	public String getSearchPayments();

    /** Column name Transferencia */
    public static final String COLUMNNAME_Transferencia = "Transferencia";

	/** Set Transferencia	  */
	public void setTransferencia (boolean Transferencia);

	/** Get Transferencia	  */
	public boolean isTransferencia();

    /** Column name Updated */
    public static final String COLUMNNAME_Updated = "Updated";

	/** Get Updated.
	  * Date this record was updated
	  */
	public Timestamp getUpdated();

    /** Column name UpdatedBy */
    public static final String COLUMNNAME_UpdatedBy = "UpdatedBy";

	/** Get Updated By.
	  * User who updated this records
	  */
	public int getUpdatedBy();
}
