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
package ar.com.ergio.util;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.model.MClient;
import org.compiere.model.MInvoice;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;

import ar.com.ergio.model.LAR_MDocType;

/**
 * Utility class for Argentine Localization.
 *
 * @author Emiliano Pereyra - Ergio
 *
 */
public final class LAR_Utils {

    /** Logger          */
    private static CLogger log = CLogger.getCLogger(LAR_Utils.class);

    private LAR_Utils(){}

    /**
     * Calculates the letter from a given invoice using its document number.
     *
     * @param invoice
     *            invoice to process
     * @return the letter from a given invoice
     */
    public static String getLetter(final MInvoice invoice)
    {
        String sql = "SELECT Letter FROM LAR_DocumentLetter WHERE LAR_DocumentLetter_ID=?";
        String letter = DB.getSQLValueString(invoice.get_TrxName(), sql,
                invoice.get_ValueAsInt("LAR_DocumentLetter_ID"));
        return letter;
    }

    /**
     * Calculates the point of sale from a given invoice using its document
     * number.
     *
     * @param invoice
     *            invoice to process
     * @return the point of sale from a given invoice
     */
    public static String getPosNumber(final MInvoice invoice)
    {
        String posNumber = "0000" + invoice.get_ValueAsInt("PosNumber");
        return posNumber.substring(posNumber.length() - 4);
    }

    /**
     * Validates a CUIT number
     *
     * @param cuit
     *            CUIT number
     * @return true if cuit number is valid; false otherwise
     */
    public static boolean validateCUIT(final String cuit)
    {
        boolean ret = false;

        if (cuit == null || cuit.trim().length() == 0) {
            return false;
        }

        String trimCuit = cuit.trim();

        try {
            int[] magicNumbers = { 5, 4, 3, 2, 7, 6, 5, 4, 3, 2 };
            int[] numbers = new int[11];
            int i;
            int sum = 0;

            trimCuit = trimCuit.replace("-", "");

            if (trimCuit.length() != 11) {
                return false;
            }

            for (i = 0; i < 11; i++) {
                numbers[i] = Integer.parseInt(trimCuit.substring(i, i + 1));
            }

            int verifDigit = numbers[10];

            for (i = 0; i < 10; i++) {
                sum = sum + numbers[i] * magicNumbers[i];
            }

            int div = sum / 11;
            int prod = div * 11;
            int diff = sum - prod;
            verifDigit = (diff > 0) ? 11 - diff : diff;

            ret = (verifDigit == numbers[i]);
        } catch (Exception e) {
            log.log(Level.SEVERE, "Error when validate CUIT", e);
        }
        return ret;
    }

    /**
     * Chequea la duplicidad de un número de CUIT
     * @param cuit
     * @return true si está duplicado; false caso contrario
     */
    public static boolean checkDuplicateCUIT(final String cuit, final int C_BPartner_ID)
    {
        int cant = 0;
        String sql = "SELECT COUNT(*) FROM C_BPartner WHERE taxid = ?";
        if (C_BPartner_ID > 0)
        {
            sql = sql + " AND C_BPartner_ID!=?";
            cant = DB.getSQLValue(null, sql, cuit, C_BPartner_ID);
        }
        else
            cant = DB.getSQLValue(null, sql, cuit);
        return cant > 0;
    } // checkDuplicateCUIT

    /**
     * Returns whether a document is fiscal or not
     *
     * @param C_docType_ID
     *            document type id
     * @return true if document is fiscal, false otherwise
     */
    public static boolean isFiscalDocType(int C_docType_ID)
    {
	boolean result = false;
	if (C_docType_ID != 0) {
	    LAR_MDocType docType = new LAR_MDocType(Env.getCtx(), C_docType_ID, null);
	    result = docType.isFiscal();
	}
	return result;
    }

    /**
     * Obtener la moneda predeterminada de la compañia.
     * @author fchiappano
     * @return C_Currency_ID
     */
    public static int getMonedaPredeterminada(final Properties p_ctx, final int ad_Client_ID, final String trxName)
    {
        MClient compañia = new MClient(p_ctx, ad_Client_ID, trxName);
        return compañia.getC_Currency_ID();
    } // getMonedaPredeterminada

    /**
     * Obtener tasa de cambio, para realizar la conversión de moneda.
     * @param c_Currency_ID
     * @param c_CurrencyOld_ID
     * @param c_ConversionType_ID
     * @param ad_Client_ID
     * @param ad_Org_ID
     * @param p_ctx
     * @param trxName
     * @return Tasa de Cambio
     */
    public static BigDecimal getTasaCambio(int c_Currency_ID, final int c_CurrencyOld_ID, final Timestamp fechaTasa,
            final int c_ConversionType_ID, final int ad_Client_ID, final int ad_Org_ID, final Properties p_ctx,
            final String trxName)
    {
        String sql = "";

        if (c_Currency_ID == LAR_Utils.getMonedaPredeterminada(p_ctx, ad_Client_ID, trxName))
        {
            c_Currency_ID = c_CurrencyOld_ID;
            sql = "SELECT MultiplyRate";
        }
        else
        {
            sql = "SELECT DivideRate";
        }

        sql = sql +  " FROM C_Conversion_Rate"
                  + " WHERE C_Currency_ID=?"
                  +   " AND C_Currency_ID_To=?"
                  +   " AND C_ConversionType_ID=?"
                  +   " AND ? BETWEEN ValidFrom AND ValidTo"
                  +   " AND AD_Client_ID IN (0,?)"
                  +   " AND AD_Org_ID IN (0,?)"
                  + " ORDER BY ValidFrom DESC, AD_Client_ID DESC, AD_Org_ID DESC";

        BigDecimal tasaCambio = DB.getSQLValueBD(trxName, sql, c_Currency_ID, LAR_Utils.getMonedaPredeterminada(p_ctx,
                ad_Client_ID, trxName), c_ConversionType_ID, fechaTasa, ad_Client_ID,
                ad_Org_ID);

        return tasaCambio;

    } // getTasaCambio

    /**
     * Recuperar el Tipo de Cambio predeterminado.
     *
     * @author fchiappano
     * @param ad_Client_ID
     * @param trxName
     * @return C_ConversionType_ID
     */
    public static int getTipoCambioPredeterminado(final int ad_Client_ID, final String trxName)
    {
        String sql = "SELECT C_ConversionType_ID"
                   +  " FROM C_ConversionType"
                   + " WHERE IsActive = 'Y'"
                   +   " AND IsDefault = 'Y'"
                   +   " AND AD_Client_ID = ?";

        return DB.getSQLValue(trxName, sql, ad_Client_ID);
    } // getTipoCambioPredeterminado

    /**
     * Quitar hora del timestamp.
     * @param ts
     * @return solo fecha.
     */
    public static Timestamp removeTime(Timestamp ts)
    {
        Calendar cal = Calendar.getInstance();
        cal.setTime(ts);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return new Timestamp(cal.getTimeInMillis());
    } // removeTime

    /**
     * Sumar tiempo a una fecha.
     * @param atributo
     * @param cantSuma
     * @param fecha
     * @return
     */
    public static Timestamp sumarTiempo(final int atributo, final int cantSuma, final Timestamp fecha)
    {
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(fecha.getTime());
        calendar.add(atributo, cantSuma);
        return new Timestamp(calendar.getTimeInMillis());
    } // sumarTiempo

} // LAR_Utils
