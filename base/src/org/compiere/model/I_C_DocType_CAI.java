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
package org.compiere.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import org.compiere.util.KeyNamePair;

/** Generated Interface for C_DocType_CAI
 *  @author Adempiere (generated) 
 *  @version 361.Final (6410:0234094) | LAR 2.9.13
 */
public interface I_C_DocType_CAI 
{

    /** TableName=C_DocType_CAI */
    public static final String Table_Name = "C_DocType_CAI";

    /** AD_Table_ID=3000139 */
    public static final int Table_ID = MTable.getTable_ID(Table_Name);

    KeyNamePair Model = new KeyNamePair(Table_ID, Table_Name);

    /** AccessLevel = 6 - System - Client 
     */
    BigDecimal accessLevel = BigDecimal.valueOf(6);

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

    /** Column name CAI */
    public static final String COLUMNNAME_CAI = "CAI";

	/** Set CAI	  */
	public void setCAI (String CAI);

	/** Get CAI	  */
	public String getCAI();

    /** Column name Cantidad_Autorizada */
    public static final String COLUMNNAME_Cantidad_Autorizada = "Cantidad_Autorizada";

	/** Set Cantidad_Autorizada	  */
	public void setCantidad_Autorizada (int Cantidad_Autorizada);

	/** Get Cantidad_Autorizada	  */
	public int getCantidad_Autorizada();

    /** Column name C_DocType_CAI_ID */
    public static final String COLUMNNAME_C_DocType_CAI_ID = "C_DocType_CAI_ID";

	/** Set Autorizaciones CAI	  */
	public void setC_DocType_CAI_ID (int C_DocType_CAI_ID);

	/** Get Autorizaciones CAI	  */
	public int getC_DocType_CAI_ID();

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

    /** Column name fecha_vencimiento */
    public static final String COLUMNNAME_fecha_vencimiento = "fecha_vencimiento";

	/** Set fecha_vencimiento	  */
	public void setfecha_vencimiento (Timestamp fecha_vencimiento);

	/** Get fecha_vencimiento	  */
	public Timestamp getfecha_vencimiento();

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

    /** Column name Nro_Desde */
    public static final String COLUMNNAME_Nro_Desde = "Nro_Desde";

	/** Set Nro_Desde	  */
	public void setNro_Desde (int Nro_Desde);

	/** Get Nro_Desde	  */
	public int getNro_Desde();

    /** Column name Nro_Hasta */
    public static final String COLUMNNAME_Nro_Hasta = "Nro_Hasta";

	/** Set Nro_Hasta	  */
	public void setNro_Hasta (int Nro_Hasta);

	/** Get Nro_Hasta	  */
	public int getNro_Hasta();

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
