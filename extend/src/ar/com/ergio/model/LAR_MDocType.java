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
    private static final String COLUMNNAME_isFiscal = "isfiscal";
    private static final String COLUMNNAME_isFiscalDocument = "isfiscaldocument";
    private static final String COLUMNNAME_isElectronic = "iselectronic";
    private static final String COLUMNNAME_docSubtypecae = "docsubtypecae";
    private static final String COLUMNNAME_docSubtypeinv = "docsubtypeinv";
    private static final String COLUMNNAME_fiscalDocument = "fiscaldocument";

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

    /** docsubtypecae AD_Reference_ID=1000008 */
    public static final int DOCSUBTYPECAE_AD_Reference_ID=1000008;
    /** Facturas A = 01 */
    public static final String DOCSUBTYPECAE_FacturasA = "01";
    /** Notas de Debito A = 02 */
    public static final String DOCSUBTYPECAE_NotasDeDebitoA = "02";
    /** Notas de Credito A = 03 */
    public static final String DOCSUBTYPECAE_NotasDeCreditoA = "03";
    /** Recibos A = 04 */
    public static final String DOCSUBTYPECAE_RecibosA = "04";
    /** Notas de Venta al Contado A = 05 */
    public static final String DOCSUBTYPECAE_NotasDeVentaAlContadoA = "05";
    /** Facturas B = 06 */
    public static final String DOCSUBTYPECAE_FacturasB = "06";
    /** Notas de Debito B = 07 */
    public static final String DOCSUBTYPECAE_NotasDeDebitoB = "07";
    /** Notas de Credito B = 08 */
    public static final String DOCSUBTYPECAE_NotasDeCreditoB = "08";
    /** Recibos B = 09 */
    public static final String DOCSUBTYPECAE_RecibosB = "09";
    /** Notas de Venta al Contado B = 10 */
    public static final String DOCSUBTYPECAE_NotasDeVentaAlContadoB = "10";

    public String getDocSubtypecae()
    {
        return (String) get_Value(COLUMNNAME_docSubtypecae);
    }

    /** docsubtypeinv AD_Reference_ID=1000007 */
    public static final int DOCSUBTYPEINV_AD_Reference_ID=1000007;
    /** Electronico = EL */
    public static final String DOCSUBTYPEINV_Electronico = "EL";
    /** Impreso Fiscal = IF */
    public static final String DOCSUBTYPEINV_ImpresoFiscal = "IF";
    /** No Fiscal = NF */
    public static final String DOCSUBTYPEINV_NoFiscal = "NF";
    /** Fiscal = SF */
    public static final String DOCSUBTYPEINV_Fiscal = "SF";
    
    public String getDocSubtypeinv()
    {
        return (String) get_Value(COLUMNNAME_docSubtypeinv);
    }
    
    /** fiscaldocument AD_Reference_ID=1000009 */
    public static final int FISCALDOCUMENT_AD_Reference_ID=1000009;
    /** Nota de Debito = D */
    public static final String FISCALDOCUMENT_NotaDeDebito = "D";
    /** Nota de Credito = C */
    public static final String FISCALDOCUMENT_NotaDeCredito = "C";
    /** Factura = F */
    public static final String FISCALDOCUMENT_Factura = "F";

    public String getFiscalDocument()
    {
        return (String)get_Value(COLUMNNAME_fiscalDocument);
    }
}
