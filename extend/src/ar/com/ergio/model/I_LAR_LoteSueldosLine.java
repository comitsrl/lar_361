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

/** Generated Interface for LAR_LoteSueldosLine
 *  @author Adempiere (generated) 
 *  @version 362.2 (e8f23fb40) | LAR 2.15.9
 */
public interface I_LAR_LoteSueldosLine 
{

    /** TableName=LAR_LoteSueldosLine */
    public static final String Table_Name = "LAR_LoteSueldosLine";

    /** AD_Table_ID=3000279 */
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

    /** Column name C_BankAccount_ID */
    public static final String COLUMNNAME_C_BankAccount_ID = "C_BankAccount_ID";

	/** Set Bank Account.
	  * Account at the Bank
	  */
	public void setC_BankAccount_ID (int C_BankAccount_ID);

	/** Get Bank Account.
	  * Account at the Bank
	  */
	public int getC_BankAccount_ID();

	public I_C_BankAccount getC_BankAccount() throws RuntimeException;

    /** Column name C_BPartner_ID */
    public static final String COLUMNNAME_C_BPartner_ID = "C_BPartner_ID";

	/** Set Business Partner .
	  * Identifies a Business Partner
	  */
	public void setC_BPartner_ID (int C_BPartner_ID);

	/** Get Business Partner .
	  * Identifies a Business Partner
	  */
	public int getC_BPartner_ID();

	public I_C_BPartner getC_BPartner() throws RuntimeException;

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

    /** Column name C_Remuneration_ID */
    public static final String COLUMNNAME_C_Remuneration_ID = "C_Remuneration_ID";

	/** Set Remuneration.
	  * Wage or Salary
	  */
	public void setC_Remuneration_ID (int C_Remuneration_ID);

	/** Get Remuneration.
	  * Wage or Salary
	  */
	public int getC_Remuneration_ID();

	public I_C_Remuneration getC_Remuneration() throws RuntimeException;

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

    /** Column name ImporteMiles */
    public static final String COLUMNNAME_ImporteMiles = "ImporteMiles";

	/** Set ImporteMiles	  */
	public void setImporteMiles (BigDecimal ImporteMiles);

	/** Get ImporteMiles	  */
	public BigDecimal getImporteMiles();

    /** Column name ImportePpal */
    public static final String COLUMNNAME_ImportePpal = "ImportePpal";

	/** Set ImportePpal	  */
	public void setImportePpal (BigDecimal ImportePpal);

	/** Get ImportePpal	  */
	public BigDecimal getImportePpal();

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

    /** Column name LAR_Deposito_Directo_ID */
    public static final String COLUMNNAME_LAR_Deposito_Directo_ID = "LAR_Deposito_Directo_ID";

	/** Set Tipo de Depósito Directo	  */
	public void setLAR_Deposito_Directo_ID (int LAR_Deposito_Directo_ID);

	/** Get Tipo de Depósito Directo	  */
	public int getLAR_Deposito_Directo_ID();

	public ar.com.ergio.model.I_LAR_Tarjeta_Credito getLAR_Deposito_Directo() throws RuntimeException;

    /** Column name LAR_LoteSueldos_ID */
    public static final String COLUMNNAME_LAR_LoteSueldos_ID = "LAR_LoteSueldos_ID";

	/** Set Cabecera Lote de Sueldos	  */
	public void setLAR_LoteSueldos_ID (int LAR_LoteSueldos_ID);

	/** Get Cabecera Lote de Sueldos	  */
	public int getLAR_LoteSueldos_ID();

	public ar.com.ergio.model.I_LAR_LoteSueldos getLAR_LoteSueldos() throws RuntimeException;

    /** Column name LAR_LoteSueldosLine_ID */
    public static final String COLUMNNAME_LAR_LoteSueldosLine_ID = "LAR_LoteSueldosLine_ID";

	/** Set Detalle de Sueldos	  */
	public void setLAR_LoteSueldosLine_ID (int LAR_LoteSueldosLine_ID);

	/** Get Detalle de Sueldos	  */
	public int getLAR_LoteSueldosLine_ID();

    /** Column name LAR_PaymentHeader_ID */
    public static final String COLUMNNAME_LAR_PaymentHeader_ID = "LAR_PaymentHeader_ID";

	/** Set Cabecera de Pago/Cobro	  */
	public void setLAR_PaymentHeader_ID (int LAR_PaymentHeader_ID);

	/** Get Cabecera de Pago/Cobro	  */
	public int getLAR_PaymentHeader_ID();

	public ar.com.ergio.model.I_LAR_PaymentHeader getLAR_PaymentHeader() throws RuntimeException;

    /** Column name Lar_PaymentHeaderMiles_ID */
    public static final String COLUMNNAME_Lar_PaymentHeaderMiles_ID = "Lar_PaymentHeaderMiles_ID";

	/** Set Lar_PaymentHeaderMiles_ID	  */
	public void setLar_PaymentHeaderMiles_ID (int Lar_PaymentHeaderMiles_ID);

	/** Get Lar_PaymentHeaderMiles_ID	  */
	public int getLar_PaymentHeaderMiles_ID();

	public ar.com.ergio.model.I_LAR_PaymentHeader getLar_PaymentHeaderMiles() throws RuntimeException;

    /** Column name TenderType */
    public static final String COLUMNNAME_TenderType = "TenderType";

	/** Set Tender type.
	  * Method of Payment
	  */
	public void setTenderType (String TenderType);

	/** Get Tender type.
	  * Method of Payment
	  */
	public String getTenderType();

    /** Column name TenderTypeMiles */
    public static final String COLUMNNAME_TenderTypeMiles = "TenderTypeMiles";

	/** Set TenderTypeMiles	  */
	public void setTenderTypeMiles (String TenderTypeMiles);

	/** Get TenderTypeMiles	  */
	public String getTenderTypeMiles();

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
