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

import java.util.ArrayList;
import java.util.logging.Level;

import org.compiere.model.MColumn;
import org.compiere.model.MInvoice;
import org.compiere.model.MProduct;
import org.compiere.util.CLogger;

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
     * @param mInvoice
     *            invoice to process
     * @return the letter from a given invoice
     */
    public static String getLetter(final MInvoice mInvoice)
    {
        return String.valueOf(mInvoice.getDocumentNo().charAt(0));
    }

    /**
     * Calculates the point of sale from a given invoice using its document
     * number.
     *
     * @param mInvoice
     *            invoice to process
     * @return the point of sale from a given invoice
     */
    public static String getPosNumber(final MInvoice mInvoice)
    {
        return mInvoice.getDocumentNo().substring(1,5);
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
                numbers[i] = Integer.parseInt(cuit.substring(i, i + 1));
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
}
