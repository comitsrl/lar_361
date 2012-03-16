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

import java.util.Properties;

import org.compiere.model.MDocType;

public class LAR_MDocType extends MDocType
{

    private static final long serialVersionUID = 2743629631578930469L;

    /* Columns added to C_DocType table */
    private static final String COLUMNNAME_LAR_Fiscal_Printer_ID = "LAR_Fiscal_Printer_ID";
    private static final String COLUMNNAME_isFiscal = "IsFiscal";
    private static final String COLUMNNAME_isFiscalDocument = "IsFiscalDocument";
    private static final String COLUMNNAME_isElectronic = "IsElectronic";
    private static final String COLUMNNAME_docSubtypecae = "DocSubtypeCAE";
    private static final String COLUMNNAME_docSubtypeinv = "DocSubtypeINV";
    private static final String COLUMNNAME_fiscalDocument = "FiscalDocument";

    public LAR_MDocType(Properties ctx, int C_DocType_ID, String trxName)
    {
        super(ctx, C_DocType_ID, trxName);
        // TODO Auto-generated constructor stub
    }

    public boolean isFiscal()
    {
        Object oo = get_Value(COLUMNNAME_isFiscal);
        if (oo != null) {
            if (oo instanceof Boolean) {
                return ((Boolean) oo).booleanValue();
            }
            return "Y".equals(oo);
        }
        return false;
    }

    public void setIsFiscal(boolean isFiscal)
    {
        set_Value(COLUMNNAME_isFiscal, Boolean.valueOf(isFiscal));
    }

    public int getLAR_Fiscal_Printer_ID()
    {
        Integer ii = (Integer) get_Value(COLUMNNAME_LAR_Fiscal_Printer_ID);
        if (ii == null) {
            return 0;
        }
        return ii.intValue();
    }

    public boolean isFiscalDocument()
    {
        Object oo = get_Value(COLUMNNAME_isFiscalDocument);
        if (oo != null) {
            if (oo instanceof Boolean) {
                return ((Boolean) oo).booleanValue();
            }
            return "Y".equals(oo);
        }
        return false;
    }

    public boolean isElectronic()
    {
        Object oo = get_Value(COLUMNNAME_isElectronic);
        if (oo != null) {
            if (oo instanceof Boolean) {
                return ((Boolean) oo).booleanValue();
            }
            return "Y".equals(oo);
        }
        return false;
    }

    /** DocSubtypeCAE AD_Reference_ID=3000002 */
    public static final int DOCSUBTYPECAE_AD_Reference_ID=3000002;
    /** Invoice A = 01 */
    public static final String DOCSUBTYPECAE_InvoiceA = "01";
    /** Debit Note A = 02 */
    public static final String DOCSUBTYPECAE_DebitNoteA = "02";
    /** Credit Note A = 03 */
    public static final String DOCSUBTYPECAE_CreditNoteA = "03";
    /** Receipt A = 04 */
    public static final String DOCSUBTYPECAE_ReceiptA = "04";
    /** Cash Sale Note = 05 */
    public static final String DOCSUBTYPECAE_CashSaleNote = "05";
    /** Invoice B = 06 */
    public static final String DOCSUBTYPECAE_InvoiceB = "06";
    /** Debit Note B = 07 */
    public static final String DOCSUBTYPECAE_DebitNoteB = "07";
    /** Credit Note B = 08 */
    public static final String DOCSUBTYPECAE_CreditNoteB = "08";
    /** Receipt B = 09 */
    public static final String DOCSUBTYPECAE_ReceiptB = "09";
    /** Cash Sale Note B = 10 */
    public static final String DOCSUBTYPECAE_CashSaleNoteB = "10";

    public String getDocSubtypecae()
    {
        return (String) get_Value(COLUMNNAME_docSubtypecae);
    }

    /** DocSubtypeINV AD_Reference_ID=3000000 */
    public static final int DOCSUBTYPEINV_AD_Reference_ID=3000000;
    /** Electronic = EL */
    public static final String DOCSUBTYPEINV_Electronic = "EL";
    /** Fiscal Form = FF */
    public static final String DOCSUBTYPEINV_FiscalForm = "FF";
    /** No Fiscal = NF */
    public static final String DOCSUBTYPEINV_NoFiscal = "NF";
    /** Fiscal = SF */
    public static final String DOCSUBTYPEINV_Fiscal = "SF";
    
    public String getDocSubtypeinv()
    {
        return (String) get_Value(COLUMNNAME_docSubtypeinv);
    }
    
    /** FiscalDocument AD_Reference_ID=3000001 */
    public static final int FISCALDOCUMENT_AD_Reference_ID=3000001;
    /** Invoice = F */
    public static final String FISCALDOCUMENT_Invoice = "F";
    /** Debit Note = D */
    public static final String FISCALDOCUMENT_DebitNote = "D";
    /** Credit Note = C */
    public static final String FISCALDOCUMENT_CreditNote = "C";

    public String getFiscalDocument()
    {
        return (String)get_Value(COLUMNNAME_fiscalDocument);
    }
}
