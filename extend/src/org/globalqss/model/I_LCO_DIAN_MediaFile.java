/**********************************************************************
 * This file is part of Adempiere ERP Bazaar                          *
 * http://www.adempiere.org                                           *
 *                                                                    *
 * Copyright (C) Trifon Trifonov.                                     *
 * Copyright (C) Contributors                                         *
 *                                                                    *
 * This program is free software;
 you can redistribute it and/or      *
 * modify it under the terms of the GNU General Public License        *
 * as published by the Free Software Foundation;
 either version 2     *
 * of the License, or (at your option) any later version.             *
 *                                                                    *
 * This program is distributed in the hope that it will be useful,    *
 * but WITHOUT ANY WARRANTY;
 without even the implied warranty of     *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the       *
 * GNU General Public License for more details.                       *
 *                                                                    *
 * You should have received a copy of the GNU General Public License  *
 * along with this program;
 if not, write to the Free Software        *
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,         *
 * MA 02110-1301, USA.                                                *
 *                                                                    *
 * Contributors:                                                      *
 * - Trifon Trifonov (trifonnt@users.sourceforge.net)                 *
 *                                                                    *
 * Sponsors:                                                          *
 * - Company (http://www.site.com)                                    *
 **********************************************************************/
package org.globalqss.model;

import java.math.BigDecimal;
import org.compiere.model.*;
import org.compiere.util.KeyNamePair;

/** Generated Interface for LCO_DIAN_MediaFile
 *  @author Trifon Trifonov (generated) 
 *  @version Release 3.4.2s
 */
public interface I_LCO_DIAN_MediaFile 
{

    /** TableName=LCO_DIAN_MediaFile */
    public static final String Table_Name = "LCO_DIAN_MediaFile";

    /** AD_Table_ID=1000012 */
    public static final int Table_ID = MTable.getTable_ID(Table_Name);

    KeyNamePair Model = new KeyNamePair(Table_ID, Table_Name);

    /** AccessLevel = 2 - Client 
     */
    BigDecimal accessLevel = BigDecimal.valueOf(2);

    /** Load Meta Data */

    /** Column name Address1 */
    public static final String COLUMNNAME_Address1 = "Address1";

	/** Set Address 1.
	  * Address line 1 for this location
	  */
	public void setAddress1 (String Address1);

	/** Get Address 1.
	  * Address line 1 for this location
	  */
	public String getAddress1();

    /** Column name ConceptCode */
    public static final String COLUMNNAME_ConceptCode = "ConceptCode";

	/** Set Concept Code	  */
	public void setConceptCode (String ConceptCode);

	/** Get Concept Code	  */
	public String getConceptCode();

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

    /** Column name FirstName1 */
    public static final String COLUMNNAME_FirstName1 = "FirstName1";

	/** Set First Name 1	  */
	public void setFirstName1 (String FirstName1);

	/** Get First Name 1	  */
	public String getFirstName1();

    /** Column name FirstName2 */
    public static final String COLUMNNAME_FirstName2 = "FirstName2";

	/** Set First Name 2	  */
	public void setFirstName2 (String FirstName2);

	/** Get First Name 2	  */
	public String getFirstName2();

    /** Column name LastName1 */
    public static final String COLUMNNAME_LastName1 = "LastName1";

	/** Set Last Name 1	  */
	public void setLastName1 (String LastName1);

	/** Get Last Name 1	  */
	public String getLastName1();

    /** Column name LastName2 */
    public static final String COLUMNNAME_LastName2 = "LastName2";

	/** Set Last Name 2	  */
	public void setLastName2 (String LastName2);

	/** Get Last Name 2	  */
	public String getLastName2();

    /** Column name LCO_DANECityCode */
    public static final String COLUMNNAME_LCO_DANECityCode = "LCO_DANECityCode";

	/** Set DANE City Code	  */
	public void setLCO_DANECityCode (String LCO_DANECityCode);

	/** Get DANE City Code	  */
	public String getLCO_DANECityCode();

    /** Column name LCO_DANECountryCode */
    public static final String COLUMNNAME_LCO_DANECountryCode = "LCO_DANECountryCode";

	/** Set DANE Country Code	  */
	public void setLCO_DANECountryCode (String LCO_DANECountryCode);

	/** Get DANE Country Code	  */
	public String getLCO_DANECountryCode();

    /** Column name LCO_DANERegionCode */
    public static final String COLUMNNAME_LCO_DANERegionCode = "LCO_DANERegionCode";

	/** Set DANE Region Code	  */
	public void setLCO_DANERegionCode (String LCO_DANERegionCode);

	/** Get DANE Region Code	  */
	public String getLCO_DANERegionCode();

    /** Column name LCO_DIAN_MediaFile_ID */
    public static final String COLUMNNAME_LCO_DIAN_MediaFile_ID = "LCO_DIAN_MediaFile_ID";

	/** Set DIAN Media File	  */
	public void setLCO_DIAN_MediaFile_ID (int LCO_DIAN_MediaFile_ID);

	/** Get DIAN Media File	  */
	public int getLCO_DIAN_MediaFile_ID();

    /** Column name LCO_DIAN_SendSchedule_ID */
    public static final String COLUMNNAME_LCO_DIAN_SendSchedule_ID = "LCO_DIAN_SendSchedule_ID";

	/** Set DIAN Send Schedule	  */
	public void setLCO_DIAN_SendSchedule_ID (int LCO_DIAN_SendSchedule_ID);

	/** Get DIAN Send Schedule	  */
	public int getLCO_DIAN_SendSchedule_ID();

	public I_LCO_DIAN_SendSchedule getLCO_DIAN_SendSchedule() throws Exception;

    /** Column name Name2 */
    public static final String COLUMNNAME_Name2 = "Name2";

	/** Set Name 2.
	  * Additional Name
	  */
	public void setName2 (String Name2);

	/** Get Name 2.
	  * Additional Name
	  */
	public String getName2();

    /** Column name TaxID */
    public static final String COLUMNNAME_TaxID = "TaxID";

	/** Set Tax ID.
	  * Tax Identification
	  */
	public void setTaxID (String TaxID);

	/** Get Tax ID.
	  * Tax Identification
	  */
	public String getTaxID();

    /** Column name TaxIdDigit */
    public static final String COLUMNNAME_TaxIdDigit = "TaxIdDigit";

	/** Set Tax ID Digit	  */
	public void setTaxIdDigit (String TaxIdDigit);

	/** Get Tax ID Digit	  */
	public String getTaxIdDigit();
}
