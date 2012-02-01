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

import org.compiere.model.MPayment;
import org.compiere.util.CLogger;
import org.compiere.util.DB;

/**
 * Payment Withholding Model
 *
 * @author Emiliano Pereyra - http://www.ergio.com.ar
 *
 */
public class MLARPaymentWithholding extends X_LAR_PaymentWithholding
{
    private static final long serialVersionUID = 2402696932419765632L;

    /** Logger */
    private static CLogger log = CLogger.getCLogger(MLARPaymentWithholding.class);

    public MLARPaymentWithholding(Properties ctx, int LAR_PaymentWithholding_ID, String trxName)
    {
        super(ctx, LAR_PaymentWithholding_ID, trxName);
        // TODO Auto-generated constructor stub
    }

    public MLARPaymentWithholding(Properties ctx, ResultSet rs, String trxName)
    {
        super(ctx, rs, trxName);
    }

    /**
     *
     * @param order
     * @param trxName
     * @return
     */
    public static MLARPaymentWithholding get(final MPayment payment)
    {
        MLARPaymentWithholding retValue = null;
        if (payment == null || payment.getC_Payment_ID() == 0) {
            log.info("No Payment");
            return null;
        }

        String sql = "SELECT * FROM LAR_PaymentWithholding WHERE C_Payment_ID=?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = DB.prepareStatement(sql, payment.get_TrxName());
            pstmt.setInt(1, payment.getC_Payment_ID());
            rs = pstmt.executeQuery();
            if (rs.next())
                retValue = new MLARPaymentWithholding(payment.getCtx(), rs, payment.get_TrxName());
            rs.close();
            pstmt.close();
            pstmt = null;
        } catch (Exception e) {
            log.log(Level.SEVERE, "No withholding for payment", e);
        } finally {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }

        if (retValue != null) {
            retValue.set_TrxName(payment.get_TrxName());
            return retValue;
        }

        // Create new one
        retValue = new MLARPaymentWithholding(payment.getCtx(), 0, payment.get_TrxName());
        log.info("(new)" + retValue);
        return retValue;
    } // get
}
