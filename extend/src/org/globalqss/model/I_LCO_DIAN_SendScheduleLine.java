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
package org.globalqss.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import org.compiere.model.*;
import org.compiere.util.KeyNamePair;

/** Generated Interface for LCO_DIAN_SendScheduleLine
 *  @author Adempiere (generated) 
 *  @version Release 3.6.0LTS
 */
public interface I_LCO_DIAN_SendScheduleLine 
{

    /** TableName=LCO_DIAN_SendScheduleLine */
    public static final String Table_Name = "LCO_DIAN_SendScheduleLine";

    /** AD_Table_ID=1000009 */
    public static final int Table_ID = MTable.getTable_ID(Table_Name);

    KeyNamePair Model = new KeyNamePair(Table_ID, Table_Name);

    /** AccessLevel = 2 - Client 
     */
    BigDecimal accessLevel = BigDecimal.valueOf(2);

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

    /** Column name AttributeNm1 */
    public static final String COLUMNNAME_AttributeNm1 = "AttributeNm1";

	/** Set Attribute Name 1.
	  * Name of the Attribute
	  */
	public void setAttributeNm1 (String AttributeNm1);

	/** Get Attribute Name 1.
	  * Name of the Attribute
	  */
	public String getAttributeNm1();

    /** Column name AttributeNm10 */
    public static final String COLUMNNAME_AttributeNm10 = "AttributeNm10";

	/** Set Attribute Name 10.
	  * Name of the Attribute 10
	  */
	public void setAttributeNm10 (String AttributeNm10);

	/** Get Attribute Name 10.
	  * Name of the Attribute 10
	  */
	public String getAttributeNm10();

    /** Column name AttributeNm2 */
    public static final String COLUMNNAME_AttributeNm2 = "AttributeNm2";

	/** Set Attribute Name 2.
	  * Name of the Attribute 2
	  */
	public void setAttributeNm2 (String AttributeNm2);

	/** Get Attribute Name 2.
	  * Name of the Attribute 2
	  */
	public String getAttributeNm2();

    /** Column name AttributeNm3 */
    public static final String COLUMNNAME_AttributeNm3 = "AttributeNm3";

	/** Set Attribute Name 3.
	  * Name of the Attribute 3
	  */
	public void setAttributeNm3 (String AttributeNm3);

	/** Get Attribute Name 3.
	  * Name of the Attribute 3
	  */
	public String getAttributeNm3();

    /** Column name AttributeNm4 */
    public static final String COLUMNNAME_AttributeNm4 = "AttributeNm4";

	/** Set Attribute Name 4.
	  * Name of the Attribute 4
	  */
	public void setAttributeNm4 (String AttributeNm4);

	/** Get Attribute Name 4.
	  * Name of the Attribute 4
	  */
	public String getAttributeNm4();

    /** Column name AttributeNm5 */
    public static final String COLUMNNAME_AttributeNm5 = "AttributeNm5";

	/** Set Attribute Name 5.
	  * Name of the Attribute 5
	  */
	public void setAttributeNm5 (String AttributeNm5);

	/** Get Attribute Name 5.
	  * Name of the Attribute 5
	  */
	public String getAttributeNm5();

    /** Column name AttributeNm6 */
    public static final String COLUMNNAME_AttributeNm6 = "AttributeNm6";

	/** Set Attribute Name 6.
	  * Name of the Attribute 6
	  */
	public void setAttributeNm6 (String AttributeNm6);

	/** Get Attribute Name 6.
	  * Name of the Attribute 6
	  */
	public String getAttributeNm6();

    /** Column name AttributeNm7 */
    public static final String COLUMNNAME_AttributeNm7 = "AttributeNm7";

	/** Set Attribute Name 7.
	  * Name of the Attribute 7
	  */
	public void setAttributeNm7 (String AttributeNm7);

	/** Get Attribute Name 7.
	  * Name of the Attribute 7
	  */
	public String getAttributeNm7();

    /** Column name AttributeNm8 */
    public static final String COLUMNNAME_AttributeNm8 = "AttributeNm8";

	/** Set Attribute Name 8.
	  * Name of the Attribute 8
	  */
	public void setAttributeNm8 (String AttributeNm8);

	/** Get Attribute Name 8.
	  * Name of the Attribute 8
	  */
	public String getAttributeNm8();

    /** Column name AttributeNm9 */
    public static final String COLUMNNAME_AttributeNm9 = "AttributeNm9";

	/** Set Attribute Name 9.
	  * Name of the Attribute 9
	  */
	public void setAttributeNm9 (String AttributeNm9);

	/** Get Attribute Name 9.
	  * Name of the Attribute 9
	  */
	public String getAttributeNm9();

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

    /** Column name C_BPartner_Location_ID */
    public static final String COLUMNNAME_C_BPartner_Location_ID = "C_BPartner_Location_ID";

	/** Set Partner Location.
	  * Identifies the (ship to) address for this Business Partner
	  */
	public void setC_BPartner_Location_ID (int C_BPartner_Location_ID);

	/** Get Partner Location.
	  * Identifies the (ship to) address for this Business Partner
	  */
	public int getC_BPartner_Location_ID();

	public I_C_BPartner_Location getC_BPartner_Location() throws RuntimeException;

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

    /** Column name FieldAmt1 */
    public static final String COLUMNNAME_FieldAmt1 = "FieldAmt1";

	/** Set Field Amt 1	  */
	public void setFieldAmt1 (BigDecimal FieldAmt1);

	/** Get Field Amt 1	  */
	public BigDecimal getFieldAmt1();

    /** Column name FieldAmt10 */
    public static final String COLUMNNAME_FieldAmt10 = "FieldAmt10";

	/** Set Field Amt 10	  */
	public void setFieldAmt10 (BigDecimal FieldAmt10);

	/** Get Field Amt 10	  */
	public BigDecimal getFieldAmt10();

    /** Column name FieldAmt2 */
    public static final String COLUMNNAME_FieldAmt2 = "FieldAmt2";

	/** Set Field Amt 2	  */
	public void setFieldAmt2 (BigDecimal FieldAmt2);

	/** Get Field Amt 2	  */
	public BigDecimal getFieldAmt2();

    /** Column name FieldAmt3 */
    public static final String COLUMNNAME_FieldAmt3 = "FieldAmt3";

	/** Set Field Amt 3	  */
	public void setFieldAmt3 (BigDecimal FieldAmt3);

	/** Get Field Amt 3	  */
	public BigDecimal getFieldAmt3();

    /** Column name FieldAmt4 */
    public static final String COLUMNNAME_FieldAmt4 = "FieldAmt4";

	/** Set Field Amt 4	  */
	public void setFieldAmt4 (BigDecimal FieldAmt4);

	/** Get Field Amt 4	  */
	public BigDecimal getFieldAmt4();

    /** Column name FieldAmt5 */
    public static final String COLUMNNAME_FieldAmt5 = "FieldAmt5";

	/** Set Field Amt 5	  */
	public void setFieldAmt5 (BigDecimal FieldAmt5);

	/** Get Field Amt 5	  */
	public BigDecimal getFieldAmt5();

    /** Column name FieldAmt6 */
    public static final String COLUMNNAME_FieldAmt6 = "FieldAmt6";

	/** Set Field Amt 6	  */
	public void setFieldAmt6 (BigDecimal FieldAmt6);

	/** Get Field Amt 6	  */
	public BigDecimal getFieldAmt6();

    /** Column name FieldAmt7 */
    public static final String COLUMNNAME_FieldAmt7 = "FieldAmt7";

	/** Set Field Amt 7	  */
	public void setFieldAmt7 (BigDecimal FieldAmt7);

	/** Get Field Amt 7	  */
	public BigDecimal getFieldAmt7();

    /** Column name FieldAmt8 */
    public static final String COLUMNNAME_FieldAmt8 = "FieldAmt8";

	/** Set Field Amt 8	  */
	public void setFieldAmt8 (BigDecimal FieldAmt8);

	/** Get Field Amt 8	  */
	public BigDecimal getFieldAmt8();

    /** Column name FieldAmt9 */
    public static final String COLUMNNAME_FieldAmt9 = "FieldAmt9";

	/** Set Field Amt 9	  */
	public void setFieldAmt9 (BigDecimal FieldAmt9);

	/** Get Field Amt 9	  */
	public BigDecimal getFieldAmt9();

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

    /** Column name LCO_DIAN_Concept_ID */
    public static final String COLUMNNAME_LCO_DIAN_Concept_ID = "LCO_DIAN_Concept_ID";

	/** Set DIAN Concept	  */
	public void setLCO_DIAN_Concept_ID (int LCO_DIAN_Concept_ID);

	/** Get DIAN Concept	  */
	public int getLCO_DIAN_Concept_ID();

	public org.globalqss.model.I_LCO_DIAN_Concept getLCO_DIAN_Concept() throws RuntimeException;

    /** Column name LCO_DIAN_SendSchedule_ID */
    public static final String COLUMNNAME_LCO_DIAN_SendSchedule_ID = "LCO_DIAN_SendSchedule_ID";

	/** Set DIAN Send Schedule	  */
	public void setLCO_DIAN_SendSchedule_ID (int LCO_DIAN_SendSchedule_ID);

	/** Get DIAN Send Schedule	  */
	public int getLCO_DIAN_SendSchedule_ID();

	public org.globalqss.model.I_LCO_DIAN_SendSchedule getLCO_DIAN_SendSchedule() throws RuntimeException;

    /** Column name LCO_DIAN_SendScheduleLine_ID */
    public static final String COLUMNNAME_LCO_DIAN_SendScheduleLine_ID = "LCO_DIAN_SendScheduleLine_ID";

	/** Set DIAN Send Schedule Line	  */
	public void setLCO_DIAN_SendScheduleLine_ID (int LCO_DIAN_SendScheduleLine_ID);

	/** Get DIAN Send Schedule Line	  */
	public int getLCO_DIAN_SendScheduleLine_ID();

    /** Column name LCO_DIAN_XML_Header_ID */
    public static final String COLUMNNAME_LCO_DIAN_XML_Header_ID = "LCO_DIAN_XML_Header_ID";

	/** Set DIAN XML Header	  */
	public void setLCO_DIAN_XML_Header_ID (int LCO_DIAN_XML_Header_ID);

	/** Get DIAN XML Header	  */
	public int getLCO_DIAN_XML_Header_ID();

	public org.globalqss.model.I_LCO_DIAN_XML_Header getLCO_DIAN_XML_Header() throws RuntimeException;

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
