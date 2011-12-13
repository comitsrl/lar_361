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

import org.compiere.model.MOrder;
import org.compiere.util.CLogger;
import org.compiere.util.DB;

/**
 *
 * @author Emiliano Pereyra
 *
 */
public class MLAROrderPerception extends X_LAR_OrderPerception
{

    private static final long serialVersionUID = 3909984925720898559L;
    /** Logger          */
    private static CLogger log = CLogger.getCLogger(MLAROrderPerception.class);

    /**
     * Standard Constructor
     *
     * @param ctx context
     * @param LAR_OrderPerception_ID id for order perception record
     * @param trxName transaction
     */
    public MLAROrderPerception(Properties ctx, int LAR_OrderPerception_ID, String trxName)
    {
        super(ctx, LAR_OrderPerception_ID, trxName);
    }

    /**
     * Load Constructor
     *
     * @param ctx context
     * @param rs result set
     * @param trxName transaction
     */
    public MLAROrderPerception(Properties ctx, ResultSet rs, String trxName)
    {
        super(ctx, rs, trxName);
    }

    /**
     *
     * @param order
     * @param trxName
     * @return
     */
    public static MLAROrderPerception get(final MOrder order, final String trxName)
    {
        MLAROrderPerception retValue = null;
        if (order == null || order.getC_Order_ID() == 0) {
            log.info("No Order");
            return null;
        }

        String sql = "SELECT * FROM LAR_OrderPerception WHERE C_Order_ID=?";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = DB.prepareStatement(sql, trxName);
            pstmt.setInt(1, order.getC_Order_ID());
            rs = pstmt.executeQuery();
            if (rs.next())
                retValue = new MLAROrderPerception(order.getCtx(), rs, trxName);
            rs.close();
            pstmt.close();
            pstmt = null;
        } catch (Exception e) {
            log.log(Level.SEVERE, "No perceptions for order", e);
        } finally {
            DB.close(rs, pstmt);
            rs = null; pstmt = null;
        }

        if (retValue != null) {
            retValue.set_TrxName(trxName);
            return retValue;
        }

        // Create new one
        retValue = new MLAROrderPerception(order.getCtx(), 0, trxName);
        retValue.setIsTaxIncluded(false);
        log.info("(new)" + retValue);
        return retValue;
    }
}
