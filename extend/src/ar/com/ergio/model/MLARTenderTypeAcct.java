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

import org.compiere.model.MAccount;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;

public class MLARTenderTypeAcct extends X_LAR_TenderType_Acct
{
    /**
     *
     */
    private static final long serialVersionUID = 7681469337776739327L;

    /** Logger */
    private static CLogger log = CLogger.getCLogger(MLARTenderTypeAcct.class);

    public MLARTenderTypeAcct(Properties ctx, int LAR_TenderType_Acct_ID, String trxName)
    {
        super(ctx, LAR_TenderType_Acct_ID, trxName);
    }

    public MLARTenderTypeAcct(Properties ctx, ResultSet rs, String trxName)
    {
        super(ctx, rs, trxName);
    }

    /**
     * Recupera la configuracion para un TenderType, esquema contable y organizacion.
     * La prioridad es: organizacion especifica, luego organizacion global (0).
     *
     * @param ctx context
     * @param adOrgId organizacion del documento
     * @param cAcctSchemaId esquema contable
     * @param tenderType forma de pago
     * @param isSOTrx ventas/compras
     * @param trxName nombre de transaccion
     * @return configuracion o null si no existe
     */
    public static MLARTenderTypeAcct get(Properties ctx, int adOrgId, int cAcctSchemaId,
            String tenderType, boolean isSOTrx, String trxName)
    {
        final int adClientId = Env.getAD_Client_ID(ctx);
        final String sql =
                "SELECT *"
              + "  FROM LAR_TenderType_Acct"
              + " WHERE AD_Client_ID=?"
              + "   AND C_AcctSchema_ID=?"
              + "   AND TenderType=?"
              + "   AND IsSOTrx=?"
              + "   AND IsActive='Y'"
              + "   AND AD_Org_ID IN (?,0)"
              + " ORDER BY CASE WHEN AD_Org_ID=? THEN 0 ELSE 1 END";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            pstmt = DB.prepareStatement(sql, trxName);
            int idx = 1;
            pstmt.setInt(idx++, adClientId);
            pstmt.setInt(idx++, cAcctSchemaId);
            pstmt.setString(idx++, tenderType);
            pstmt.setString(idx++, isSOTrx ? "Y" : "N");
            pstmt.setInt(idx++, adOrgId);
            pstmt.setInt(idx++, adOrgId);
            rs = pstmt.executeQuery();
            if (rs.next())
                return new MLARTenderTypeAcct(ctx, rs, trxName);
        }
        catch (Exception e)
        {
            log.log(Level.SEVERE, "Error recuperando configuracion de TenderType", e);
        }
        finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }
        return null;
    }

    public MAccount getAvailableAccount()
    {
        int validCombinationId = getTT_Available_Acct();
        if (validCombinationId < 1)
            return null;
        return MAccount.get(getCtx(), validCombinationId);
    }

    public MAccount getInTransitAccount()
    {
        int validCombinationId = getTT_Intransit_Acct();
        if (validCombinationId < 1)
            return null;
        return MAccount.get(getCtx(), validCombinationId);
    }

    public MAccount getUnallocatedAccount()
    {
        int validCombinationId = getTT_Unallocated_Acct();
        if (validCombinationId < 1)
            return null;
        return MAccount.get(getCtx(), validCombinationId);
    }
}
