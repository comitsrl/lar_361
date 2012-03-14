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

/** Generated Interface for LAR_Fiscal_Printer
 *  @author Adempiere (generated)
 *  @version 360LTS.015
 */
public interface I_LAR_Fiscal_Printer
{

    /** TableName=LAR_Fiscal_Printer */
    public static final String Table_Name = "LAR_Fiscal_Printer";

    /** AD_Table_ID=3000001 */
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

    /** Column name Host */
    public static final String COLUMNNAME_Host = "Host";

	/** Set Host	  */
	public void setHost (String Host);

	/** Get Host	  */
	public String getHost();

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

    /** Column name IsRemote */
    public static final String COLUMNNAME_IsRemote = "IsRemote";

	/** Set IsRemote	  */
	public void setIsRemote (boolean IsRemote);

	/** Get IsRemote	  */
	public boolean isRemote();

    /** Column name LAR_Fiscal_Printer_ID */
    public static final String COLUMNNAME_LAR_Fiscal_Printer_ID = "LAR_Fiscal_Printer_ID";

	/** Set LAR_Fiscal_Printer	  */
	public void setLAR_Fiscal_Printer_ID (int LAR_Fiscal_Printer_ID);

	/** Get LAR_Fiscal_Printer	  */
	public int getLAR_Fiscal_Printer_ID();

    /** Column name LAR_Fiscal_Printer_Type_ID */
    public static final String COLUMNNAME_LAR_Fiscal_Printer_Type_ID = "LAR_Fiscal_Printer_Type_ID";

	/** Set LAR_Fiscal_Printer_Type	  */
	public void setLAR_Fiscal_Printer_Type_ID (int LAR_Fiscal_Printer_Type_ID);

	/** Get LAR_Fiscal_Printer_Type	  */
	public int getLAR_Fiscal_Printer_Type_ID();

	public ar.com.ergio.model.I_LAR_Fiscal_Printer_Type getLAR_Fiscal_Printer_Type() throws RuntimeException;

    /** Column name Name */
    public static final String COLUMNNAME_Name = "Name";

	/** Set Name.
	  * Alphanumeric identifier of the entity
	  */
	public void setName (String Name);

	/** Get Name.
	  * Alphanumeric identifier of the entity
	  */
	public String getName();

    /** Column name OnPrintProductFormat */
    public static final String COLUMNNAME_OnPrintProductFormat = "OnPrintProductFormat";

	/** Set OnPrintProductFormat	  */
	public void setOnPrintProductFormat (String OnPrintProductFormat);

	/** Get OnPrintProductFormat	  */
	public String getOnPrintProductFormat();

    /** Column name OnPrintUseProductReference */
    public static final String COLUMNNAME_OnPrintUseProductReference = "OnPrintUseProductReference";

	/** Set OnPrintUseProductReference	  */
	public void setOnPrintUseProductReference (boolean OnPrintUseProductReference);

	/** Get OnPrintUseProductReference	  */
	public boolean isOnPrintUseProductReference();

    /** Column name Operation_Date */
    public static final String COLUMNNAME_Operation_Date = "Operation_Date";

	/** Set Operation_Date	  */
	public void setOperation_Date (Timestamp Operation_Date);

	/** Get Operation_Date	  */
	public Timestamp getOperation_Date();

    /** Column name Port */
    public static final String COLUMNNAME_Port = "Port";

	/** Set Port	  */
	public void setPort (int Port);

	/** Get Port	  */
	public int getPort();

    /** Column name Status */
    public static final String COLUMNNAME_Status = "Status";

	/** Set Status.
	  * Status of the currently running check
	  */
	public void setStatus (String Status);

	/** Get Status.
	  * Status of the currently running check
	  */
	public String getStatus();

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
