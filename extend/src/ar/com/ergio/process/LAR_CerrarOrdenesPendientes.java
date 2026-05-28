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
import java.util.Calendar;
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
 * Cierra ordenes completas que permanecen pendientes de entrega/recepcion
 * y/o facturacion dentro de un rango de fechas.
 *
 * @author fchiappano - www.comit.com.ar
 */
public class LAR_CerrarOrdenesPendientes extends SvrProcess
{
    private Timestamp p_DateFrom;
    private Timestamp p_DateTo;
    private boolean p_IsSOTrx = false;
    private int p_C_DocType_ID = 0;
    private boolean p_SoloPendienteEntrega = false;
    private boolean p_SoloPendienteFacturacion = false;

    @Override
    protected void prepare()
    {
        ProcessInfoParameter[] params = getParameter();
        for (int i = 0; i < params.length; i++)
        {
            ProcessInfoParameter param = params[i];
            String name = param.getParameterName();

            if (param.getParameter() == null)
                ;
            else if ("DateFrom".equals(name))
                p_DateFrom = normalizeStartOfDay((Timestamp) param.getParameter());
            else if ("DateTo".equals(name))
                p_DateTo = normalizeStartOfDay((Timestamp) param.getParameter());
            else if ("IsSOTrx".equals(name))
                p_IsSOTrx = param.getParameterAsBoolean();
            else if ("C_DocType_ID".equals(name))
                p_C_DocType_ID = param.getParameterAsInt();
            else if ("SoloPendienteEntrega".equals(name))
                p_SoloPendienteEntrega = param.getParameterAsBoolean();
            else if ("SoloPendienteFacturacion".equals(name))
                p_SoloPendienteFacturacion = param.getParameterAsBoolean();
            else
                log.log(Level.SEVERE, "Parametro desconocido: " + name);
        }
    }

    @Override
    protected String doIt() throws Exception
    {
        validateParameters();

        List<MOrder> orders = getOrdersToClose();
        if (orders.isEmpty())
            return "@OK@ No se encontraron ordenes pendientes para cerrar con los filtros indicados.";

        List<String> closedDocuments = new ArrayList<String>();
        List<String> errorDocuments = new ArrayList<String>();
        for (int i = 0; i < orders.size(); i++)
        {
            MOrder order = orders.get(i);
            if (closeOrder(order))
                closedDocuments.add(order.getDocumentNo());
            else
                errorDocuments.add(order.getDocumentNo());
        }

        return buildResultMessage(closedDocuments, errorDocuments);
    }

    private void validateParameters() throws AdempiereUserError
    {
        if (p_DateFrom == null)
            throw new AdempiereUserError("Debe indicar la Fecha Desde.");
        if (p_DateTo == null)
            throw new AdempiereUserError("Debe indicar la Fecha Hasta.");
        if (p_DateFrom.after(p_DateTo))
            throw new AdempiereUserError("La Fecha Desde no puede ser mayor a la Fecha Hasta.");
        if (p_SoloPendienteEntrega && p_SoloPendienteFacturacion)
            throw new AdempiereUserError("Solo puede seleccionar una de las opciones de pendientes.");
    }

    private List<MOrder> getOrdersToClose() throws AdempiereUserError
    {
        List<MOrder> orders = new ArrayList<MOrder>();
        StringBuilder sql = new StringBuilder();
        sql.append("SELECT o.C_Order_ID");
        sql.append(" FROM C_Order o");
        sql.append(" WHERE o.AD_Client_ID = ?");
        sql.append(" AND o.DocStatus = ?");
        sql.append(" AND o.IsSOTrx = ?");
        sql.append(" AND o.DateOrdered >= ?");
        sql.append(" AND o.DateOrdered <= ?");

        if (p_C_DocType_ID > 0)
            sql.append(" AND o.C_DocTypeTarget_ID = ?");

        String pendingDeliveryClause = getPendingDeliveryClause();
        String pendingInvoiceClause = getPendingInvoiceClause();
        if (p_SoloPendienteEntrega)
            sql.append(" AND ").append(pendingDeliveryClause);
        else if (p_SoloPendienteFacturacion)
            sql.append(" AND ").append(pendingInvoiceClause);
        else
            sql.append(" AND (").append(pendingDeliveryClause).append(" OR ").append(pendingInvoiceClause).append(")");

        sql.append(" ORDER BY o.DocumentNo");

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int index = 1;
        try
        {
            pstmt = DB.prepareStatement(sql.toString(), get_TrxName());
            pstmt.setInt(index++, getAD_Client_ID());
            pstmt.setString(index++, MOrder.DOCSTATUS_Completed);
            pstmt.setString(index++, p_IsSOTrx ? "Y" : "N");
            pstmt.setTimestamp(index++, p_DateFrom);
            pstmt.setTimestamp(index++, getDateToExclusive(p_DateTo));
            if (p_C_DocType_ID > 0)
                pstmt.setInt(index++, p_C_DocType_ID);

            rs = pstmt.executeQuery();
            while (rs.next())
                orders.add(new MOrder(getCtx(), rs.getInt(1), get_TrxName()));
        }
        catch (SQLException e)
        {
            log.log(Level.SEVERE, sql.toString(), e);
            throw new AdempiereUserError("No se pudieron recuperar las ordenes a cerrar.");
        }
        finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }

        return orders;
    }

    private String getPendingDeliveryClause()
    {
        return "(EXISTS (SELECT 1 FROM C_OrderLine ol "
                + "WHERE ol.C_Order_ID = o.C_Order_ID "
                + "AND ol.QtyOrdered > COALESCE(ol.QtyDelivered, 0)))";
    }

    private String getPendingInvoiceClause()
    {
        return "(EXISTS (SELECT 1 FROM C_OrderLine ol "
                + "WHERE ol.C_Order_ID = o.C_Order_ID "
                + "AND ol.QtyOrdered > COALESCE(ol.QtyInvoiced, 0)))";
    }

    private boolean closeOrder(MOrder order)
    {
        MPriceListVersion priceListVersion = null;
        MPriceList priceList = (MPriceList) order.getM_PriceList();
        if (priceList != null && priceList.getPriceListVersion(order.getDateOrdered()) == null)
            priceListVersion = getPriceListVersion(order);

        try
        {
            if (priceListVersion != null)
            {
                priceListVersion.setIsActive(true);
                priceListVersion.saveEx(get_TrxName());
            }

            if (!order.processIt(DocAction.ACTION_Close) || !order.save(get_TrxName()))
            {
                log.warning("No se pudo cerrar la orden " + order.getDocumentNo() + ": " + order.getProcessMsg());
                return false;
            }
            
            return true;
        }
        catch (Exception e)
        {
            log.log(Level.WARNING, "No se pudo cerrar la orden " + order.getDocumentNo(), e);
            return false;
        }
        finally
        {
            if (priceListVersion != null)
            {
                priceListVersion.setIsActive(false);
                priceListVersion.saveEx(get_TrxName());
            }
        }
    }

    private String buildResultMessage(List<String> closedDocuments, List<String> errorDocuments)
    {
        StringBuilder msg = new StringBuilder(errorDocuments.isEmpty() ? "@OK@" : "@Error@");
        if (errorDocuments.isEmpty())
            msg.append(" Se cerraron ").append(closedDocuments.size()).append(" ordenes.");
        else
            msg.append(" El proceso finalizo con errores.");

        msg.append("<br>Ordenes cerradas (").append(closedDocuments.size()).append("):");
        if (closedDocuments.isEmpty())
            msg.append("<br>Ninguna");
        else
            for (int i = 0; i < closedDocuments.size(); i++)
                msg.append("<br>").append(closedDocuments.get(i));

        msg.append("<br>Ordenes a revisar por errores (").append(errorDocuments.size()).append("):");
        if (errorDocuments.isEmpty())
            msg.append("<br>Ninguna");
        else
            for (int i = 0; i < errorDocuments.size(); i++)
                msg.append("<br>").append(errorDocuments.get(i));

        return msg.toString();
    }

    private MPriceListVersion getPriceListVersion(MOrder order)
    {
        String sql = "SELECT plv.M_PriceList_Version_ID"
                + " FROM M_PriceList_Version plv"
                + " WHERE plv.IsActive = 'N'"
                + " AND plv.ValidFrom <= ?"
                + " AND plv.M_PriceList_ID = ?"
                + " ORDER BY plv.ValidFrom DESC";
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            pstmt = DB.prepareStatement(sql, get_TrxName());
            pstmt.setTimestamp(1, order.getDateOrdered());
            pstmt.setInt(2, order.getM_PriceList_ID());
            rs = pstmt.executeQuery();
            if (rs.next())
                return new MPriceListVersion(getCtx(), rs.getInt(1), get_TrxName());
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
        return null;
    }

    private Timestamp normalizeStartOfDay(Timestamp timestamp)
    {
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(timestamp.getTime());
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return new Timestamp(cal.getTimeInMillis());
    }

    private Timestamp getDateToExclusive(Timestamp timestamp)
    {
        Calendar cal = Calendar.getInstance();
        cal.setTimeInMillis(timestamp.getTime());
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        cal.add(Calendar.DATE, 1);
        return new Timestamp(cal.getTimeInMillis());
    }
}
