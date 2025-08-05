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
package ar.com.ergio.process;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

import org.compiere.model.MOrder;
import org.compiere.model.MPriceList;
import org.compiere.model.MPriceListVersion;
import org.compiere.process.DocAction;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereUserError;
import org.compiere.util.DB;

/**
 * Proceso que cerrara las Ordenes de Venta con Cantidades Reservadas (esta acción quita la mercaderia de reserva).
 *
 * @author fchiappano
 */
public class LAR_CerrarOVReservadas extends SvrProcess
{
    private Timestamp dateFrom;
    private Timestamp dateTo;
    private int ad_Org_ID = 0;
    private boolean negativas = false;
    private boolean entregadas = false;
    /**
     * Prepare - lectura de parametros.
     */
    protected void prepare()
    {
        ProcessInfoParameter[] para = getParameter();
        for (int i = 0; i < para.length; i++)
        {
            String name = para[i].getParameterName();
            if (para[i].getParameter() == null)
                ;
            else if (name.equals("AD_Org_ID"))
            {
                ad_Org_ID = para[i].getParameterAsInt();
            }
            else if (name.equals("DateFrom"))
            {
                dateFrom = (Timestamp) para[i].getParameter();
            }
            else if (name.equals("DateTo"))
            {
                dateTo = (Timestamp) para[i].getParameter();
            }
            else if (name.equals("Negativas"))
            {
                negativas = para[i].getParameterAsBoolean();
            }
            else if (name.equals("IsDelivered"))
            {
                entregadas = para[i].getParameterAsBoolean();
            }
            else
                log.log(Level.SEVERE, "prepare - Unknown Parameter: " + name);
        }
    } // prepare

    /**
     * Perform process.
     *
     * @return Message
     * @throws Exception if not successful
     */
    protected String doIt() throws Exception
    {
        List<MOrder> ordenes = new ArrayList<MOrder>();
        final StringBuilder sql = new StringBuilder("SELECT Distinct ON (o.DocumentNO) o.C_Order_ID");
                                          sql.append(" FROM C_OrderLine ol");
                                          sql.append(" JOIN C_Order o ON ol.C_Order_ID = o.C_Order_ID");
                                         sql.append(" WHERE o.IsSOTrx = 'Y' AND o.DocStatus = 'CO' AND o.AD_Client_ID = ?");

        if (ad_Org_ID > 0)
            sql.append(" AND o.AD_Org_ID = ?");
        if (negativas)
            sql.append(" AND ol.QtyReserved < 0");
        else
            sql.append(" AND ol.QtyReserved > 0");

        if (entregadas)
            sql.append(" AND o.IsDelivered = 'Y'");

        if (dateFrom != null)
            sql.append(" AND o.DateOrdered::DATE => ?");
        if (dateTo != null)
            sql.append(" AND o.DateOrdered::DATE <= ?");

        sql.append(" Order By o.Documentno");

        int parametro = 1;
        PreparedStatement pstmt;
        pstmt = DB.prepareStatement(sql.toString(), get_TrxName());
        ResultSet rs = null;

        try
        {
            pstmt.setInt(parametro++, getAD_Client_ID());

            if (ad_Org_ID > 0)
                pstmt.setInt(parametro++, ad_Org_ID);
            if (dateFrom != null)
                pstmt.setTimestamp(parametro++, dateFrom);
            if (dateTo != null)
                pstmt.setTimestamp(parametro++, dateTo);

            rs = pstmt.executeQuery();
            while (rs.next())
            {
                MOrder orden = new MOrder(getCtx(), rs.getInt(1), get_TrxName());
                // @fchiappano Chequear si la version de lista de precios esta
                // activa. En caso de no estarlo, activarla momentaneamente.
                MPriceListVersion plv = null;
                if (((MPriceList) orden.getM_PriceList()).getPriceListVersion(orden.getDateOrdered()) == null)
                    plv = getPriceListVersion(orden);

                if (plv != null)
                {
                    plv.setIsActive(true);
                    plv.saveEx(null);
                }

                if (!orden.processIt(DocAction.STATUS_Closed) || !orden.save(get_TrxName()))
                    throw new AdempiereUserError("No se pudo Cerrar la Orden " + orden.getDocumentNo() + ": " + orden.getProcessMsg());
                ordenes.add(orden);

                // @fchiappano volver a desactivar la plv.
                if (plv != null)
                {
                    plv.setIsActive(false);
                    plv.saveEx(null);
                }
            }
        }
        catch (SQLException e)
        {
            log.log(Level.SEVERE, sql.toString(), e);
            return null;
        }
        finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }

        
        // @fchiappano Recuperar los productos a los cuales se les ajusto la cantidad reservada.
        final StringBuilder resultado = new StringBuilder("@OK@ Se cerraron " + ordenes.size() + " Ordenes de Venta");
        resultado.append("<br>").append("Lista de Productos Actualizado: ");

        String sqlProduct = "SELECT Distinct ON (ol.M_Product_ID) p.Value, p.Name"
                          +  " FROM C_OrderLine ol"
                          +  " JOIN M_Product p ON ol.M_Product_ID = p.M_Product_ID"
                          +  " WHERE ol.C_Order_ID IN (";
        for (int x = 0; x < ordenes.size(); x++)
        {
            if (x == 0)
                sqlProduct += ordenes.get(x).getC_Order_ID();
            else
                sqlProduct += "," + ordenes.get(x).getC_Order_ID();
        }

        sqlProduct += ")";

        pstmt = null;
        pstmt = DB.prepareStatement(sqlProduct, get_TrxName());
        rs = null;

        try
        {
            rs = pstmt.executeQuery();
            while (rs.next())
            {
                resultado.append("<br>").append(rs.getString(1)).append(" - ").append(rs.getString(2));
            }
        }
        catch (SQLException e)
        {
            log.log(Level.SEVERE, sqlProduct, e);
            return null;
        }
        finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }

        return resultado.toString();
    } // doIt

    /**
     * Recupera la versión de la lista de precios
     * de la orden que concuerde con la fecha de esta
     * y que no esten activas.
     * @param order
     */
    private MPriceListVersion getPriceListVersion(MOrder order) 
    {
        String sql = "SELECT plv.M_PriceList_Version_ID"
                +  " FROM M_PriceList_Version plv"
                + " WHERE plv.IsActive = 'N'"
                +   " AND plv.ValidFrom <= ?"
                +   " AND plv.M_PriceList_ID = ?"
                + " ORDER BY plv.ValidFrom DESC";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = DB.prepareStatement(sql, get_TrxName());
            pstmt.setTimestamp(1, order.getDateOrdered());
            pstmt.setInt(2, order.getM_PriceList_ID());
            rs = pstmt.executeQuery();

            if (rs.next())
                return new MPriceListVersion(getCtx(), rs.getInt(1), get_TrxName());

        }
        catch (Exception e)
        {
            log.log(Level.SEVERE, sql, e);
        }
        finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }
        return null;
    } // getPriceListVersion

} // LAR_CerrarOVReservadas