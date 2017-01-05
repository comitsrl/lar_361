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

/** Generated Interface for LAR_Plan_Pago
 *  @author Adempiere (generated) 
 *  @version 361.Final (6410:0234094) | LAR 2.0.0
 */
public interface I_LAR_Plan_Pago 
{

    /** TableName=LAR_Plan_Pago */
    public static final String Table_Name = "LAR_Plan_Pago";

    /** AD_Table_ID=3000033 */
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

    /** Column name Cuota_Final */
    public static final String COLUMNNAME_Cuota_Final = "Cuota_Final";

	/** Set Cuota Final	  */
	public void setCuota_Final (int Cuota_Final);

	/** Get Cuota Final	  */
	public int getCuota_Final();

    /** Column name Cuota_Inicial */
    public static final String COLUMNNAME_Cuota_Inicial = "Cuota_Inicial";

	/** Set Cuota Inicial	  */
	public void setCuota_Inicial (int Cuota_Inicial);

	/** Get Cuota Inicial	  */
	public int getCuota_Inicial();

    /** Column name Descuento */
    public static final String COLUMNNAME_Descuento = "Descuento";

	/** Set Descuento	  */
	public void setDescuento (BigDecimal Descuento);

	/** Get Descuento	  */
	public BigDecimal getDescuento();

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

    /** Column name LAR_Medio_Pago_ID */
    public static final String COLUMNNAME_LAR_Medio_Pago_ID = "LAR_Medio_Pago_ID";

	/** Set LAR_Medio_Pago	  */
	public void setLAR_Medio_Pago_ID (int LAR_Medio_Pago_ID);

	/** Get LAR_Medio_Pago	  */
	public int getLAR_Medio_Pago_ID();

	public ar.com.ergio.model.I_LAR_Medio_Pago getLAR_Medio_Pago() throws RuntimeException;

    /** Column name LAR_Plan_Pago_ID */
    public static final String COLUMNNAME_LAR_Plan_Pago_ID = "LAR_Plan_Pago_ID";

	/** Set LAR_Plan_Pago	  */
	public void setLAR_Plan_Pago_ID (int LAR_Plan_Pago_ID);

	/** Get LAR_Plan_Pago	  */
	public int getLAR_Plan_Pago_ID();

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
