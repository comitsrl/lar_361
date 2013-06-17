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

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.util.CLogger;
import org.compiere.util.DB;

/**
 * Withholding Certificate Model
 *
 * @author Emiliano Pereyra - http://www.ergio.com.ar
 *
 */
public class MLARWithholdingCertificate extends X_LAR_WithholdingCertificate
{

    private static final long serialVersionUID = 1400526751267970390L;
    /** Logger */
    private static CLogger log = CLogger.getCLogger(MLARWithholdingCertificate.class);

    public MLARWithholdingCertificate(Properties ctx, int LAR_WithholdingCertificate_ID, String trxName)
    {
        super(ctx, LAR_WithholdingCertificate_ID, trxName);
        // TODO Auto-generated constructor stub
    }

    public MLARWithholdingCertificate(Properties ctx, ResultSet rs, String trxName)
    {
        super(ctx, rs, trxName);
    }

    /**
    * Recupera o crea una retención sobre el pago pasado como parámetro.
    *
    * @param header
    *        pago a partir del cual se busca la retención
    * @return Rentención existente relaciona al pago, o nuevo objeto retención para el pago
    *         dado.
    */
    public static MLARWithholdingCertificate get(final MLARPaymentHeader header)
    {
        MLARWithholdingCertificate retValue = null;
        if (header == null || header.getLAR_PaymentHeader_ID() == 0) {
            log.info("Sin cabecera de pago");
            return null;
        }

        String sql = "SELECT * FROM LAR_WithholdingCertificate WHERE LAR_PaymentHeader_ID=?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = DB.prepareStatement(sql, header.get_TrxName());
            pstmt.setInt(1, header.getLAR_PaymentHeader_ID());
            rs = pstmt.executeQuery();
            if (rs.next())
                retValue = new MLARWithholdingCertificate(header.getCtx(), rs, header.get_TrxName());
            rs.close();
            pstmt.close();
            pstmt = null;
        } catch (Exception e) {
            log.log(Level.SEVERE, "No existe retenci\u00f3n para la cabezera de pago", e);
        } finally {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }

        if (retValue != null) {
            retValue.set_TrxName(header.get_TrxName());
            return retValue;
        }

        // Create new one
        retValue = new MLARWithholdingCertificate(header.getCtx(), 0, header.get_TrxName());
        log.info("(new)" + retValue);
        return retValue;
    } // get
}