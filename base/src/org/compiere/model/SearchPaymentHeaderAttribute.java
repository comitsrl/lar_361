/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved.                *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
package org.compiere.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.util.CLogger;
import org.compiere.util.DB;

/**
 * Obtener información relacionada al Header de los Pagos / Cobros.
 *
 * @author fchiappano
 */
public class SearchPaymentHeaderAttribute
{
    /**
     * Constructor para evitar instanciación.
     */
    private SearchPaymentHeaderAttribute() {}

    /** Logger                  */
    protected static CLogger       log = CLogger.getCLogger(SearchPaymentHeaderAttribute.class);

    /**
     * Obtener las facturas asignadas a la cabecera de pago.
     * @return
     */
    public static List<MPaymentAllocate> getInvoices(final Properties ctx, final int LAR_PaymentHeader_ID)
    {
        // Recuperar información de las facturas
        List<MPaymentAllocate> invoices = new ArrayList<MPaymentAllocate>();

        String sql = "SELECT *"
                   + "  FROM C_PaymentAllocate"
                   + " WHERE LAR_PaymentHeader_ID = ?"
                   + " ORDER BY C_PaymentAllocate_ID";

        PreparedStatement pstmt;
        pstmt = DB.prepareStatement(sql, null);
        ResultSet rs = null;

        try
        {
            pstmt.setInt(1, LAR_PaymentHeader_ID);
            rs = pstmt.executeQuery();
            while (rs.next())
                invoices.add(new MPaymentAllocate(ctx, rs, null));

        }
        catch (SQLException e)
        {
            log.log(Level.SEVERE, sql, e);
        }
        finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }

        return invoices;
    } // getInvoices

    /**
     * Obtener todos los pagos de la cabecera.
     * @param ctx
     * @param LAR_PaymentHeader_ID
     * @return
     */
    public static List<MPayment> getPayments(final Properties ctx, final int LAR_PaymentHeader_ID)
    {
        List<MPayment> payments = new ArrayList<MPayment>();

        String sql = "SELECT *"
                   + "  FROM C_Payment"
                   + " WHERE LAR_PaymentHeader_ID = ?"
                   + " ORDER BY C_Payment_ID";

        PreparedStatement pstmt;
        pstmt = DB.prepareStatement(sql, null);
        ResultSet rs = null;
        try
        {
            pstmt.setInt(1, LAR_PaymentHeader_ID);
            rs = pstmt.executeQuery();
            while (rs.next())
                payments.add(new MPayment(ctx, rs, null));

        } catch (SQLException e)
        {
            log.log(Level.SEVERE, sql, e);
        } finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }

        return payments;
    } // getPayments

} // SearchPaymentHeaderAttribute
