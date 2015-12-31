/******************************************************************************
* Product: Adempiere ERP & CRM Smart Business Solution *
* Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved. *
* This program is free software; you can redistribute it and/or modify it *
* under the terms version 2 of the GNU General Public License as published *
* by the Free Software Foundation. This program is distributed in the hope *
* that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
* warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. *
* See the GNU General Public License for more details. *
* You should have received a copy of the GNU General Public License along *
* with this program; if not, write to the Free Software Foundation, Inc., *
* 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA. *
* For the text or an alternative of this public license, you may reach us *
* ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA *
* or via info@compiere.org or http://www.compiere.org/license.html *
*****************************************************************************/
package ar.com.ergio.model;

import java.awt.Cursor;
import java.util.Properties;
import java.util.logging.Level;

import javax.swing.JFrame;

import org.compiere.apps.ADialog;
import org.compiere.apps.ProcessCtl;
import org.compiere.model.CalloutEngine;
import org.compiere.model.GridField;
import org.compiere.model.GridTab;
import org.compiere.model.MInvoice;
import org.compiere.model.MInvoiceLine;
import org.compiere.model.MOrder;
import org.compiere.model.MOrderLine;
import org.compiere.model.MOrderTax;
import org.compiere.model.MPInstance;
import org.compiere.model.MPInstancePara;
import org.compiere.model.PO;
import org.compiere.process.ProcessInfo;
import org.compiere.util.ASyncProcess;
import org.compiere.util.AdempiereSystemError;
import org.compiere.util.Env;
import org.compiere.util.Msg;

/**
 * Callouts for Localization Argentina
 *
 * @author Emiliano Gonzalez - Ergio=energia+evolucion - http://www.ergio.com.ar
 * @version $Id: LAR_Callouts.java,v 1.0 2011/11/04 egonzalez Exp $
 **/
public class LAR_Callouts extends CalloutEngine
{

    public String normalizeCuit(Properties ctx, int windowNo, GridTab mTab, GridField mField,
            Object value) throws AdempiereSystemError
    {
        String localValue = ((String) mTab.getValue("TaxID")).replaceAll("[^0123456789]", "");
        mTab.setValue("TaxID", localValue);
        return "";
    }

    public String normalizeIibb(Properties ctx, int windowNo, GridTab mTab, GridField mField,
            Object value) throws AdempiereSystemError
    {
        mTab.setValue("DUNS", ((String) mTab.getValue("DUNS")).replaceAll("[^0123456789]", ""));
        return "";
    }

    /**
     * Callout used in Source_Invoice_ID field (C_Invoice table), in order to copy
     * lines of source invoice
     */
    public String copyLines(final Properties ctx, final int windowNo, final GridTab mTab, final GridField mField,
            Object value) throws AdempiereSystemError
    {
        Integer Source_Invoice_ID = (Integer)value;
        if (Source_Invoice_ID == null || Source_Invoice_ID.intValue() == 0)
            return "";

        if (!ADialog.ask(windowNo, Env.getWindow(windowNo), "¿Copiar las líneas desde la Factura?"))
            return "";

        // Config CopyFromInvoice process (AD_Process_ID=210)
        int AD_Process_ID = 210;
        int C_Invoice_ID = (Integer) mTab.getValue("C_Invoice_ID");
        MPInstance instance = new MPInstance(Env.getCtx(), AD_Process_ID, 0);
        if (!instance.save())
            return Msg.getMsg(Env.getCtx(), "ProcessNoInstance");
        ProcessInfo pi = new ProcessInfo ("", AD_Process_ID);
        pi.setRecord_ID(C_Invoice_ID);
        pi.setAD_PInstance_ID (instance.getAD_PInstance_ID());

        //  Add Parameters
        MPInstancePara param = new MPInstancePara(instance, 10);
        param.setParameter("C_Invoice_ID", Source_Invoice_ID);
        if (!param.save())
            return Msg.getMsg(Env.getCtx(), "ParameterMissing");

        // TODO - Creates a dummy asyc control process thread (review)
        final ASyncProcess asyncProcess = new ASyncProcess()
        {
            private JFrame component = Env.getWindow(windowNo);
            /**
             * {@inheritDoc}
             */
            public void lockUI (ProcessInfo pi)
            {
                component.setCursor(Cursor.getPredefinedCursor(Cursor.WAIT_CURSOR));
                component.setEnabled(false);
            }   //  lockUI

            /**
             * {@inheritDoc}
             */
            public void unlockUI (ProcessInfo pi)
            {
                component.setEnabled(true);
                component.setCursor(Cursor.getDefaultCursor());
            }   //  unlockUI

            /**
             * {@inheritDoc}
             */
            public boolean isUILocked()
            {
                return component.isEnabled();
            }   //  isUILocked

            /**
             * {@inheritDoc}
             */
            public void executeASync (ProcessInfo pi) {}
        };

        // Execute process
        ProcessCtl worker = new ProcessCtl(asyncProcess, windowNo, pi, null);
        worker.run();
        return "";
    } // copyLines

    /**
     * Callout usado en la columna Source_Invoice_ID (tabla C_Order)
     * Copia las líneas desde la factura origen
     * Funcionalidad específica para órdenes de Nota de Crédito
     */
    public String copiaLineasDesdeFacturaOrigen (final Properties ctx, final int windowNo, final GridTab mTab, final GridField mField,
            Object value) throws AdempiereSystemError
    {
        Integer Source_Invoice_ID = (Integer) value;
        if (Source_Invoice_ID == null || Source_Invoice_ID.intValue() == 0)
            return "";

        if (!ADialog.ask(windowNo, Env.getWindow(windowNo), "¿Copiar las líneas desde la Factura?"))
            return "";

        if (!mTab.dataSave(false))
        {
            mTab.setValue("Source_Invoice_ID", null);
            return "";
        }
        MInvoice factura = new MInvoice(ctx, Source_Invoice_ID, null);
        mTab.dataRefreshAll();
        Integer order_ID = (Integer) mTab.getValue("C_Order_ID");
        MOrder orden = new MOrder(ctx, order_ID, null);
        mTab.dataSave(false);

        this.copiarLineasDesdeFactura(factura, orden, false);
        mTab.dataRefreshAll();
        return "";
    } // copiaLineasDesdeFacturaOrigen

    /**
     * Copia las líneas desde una Factura hacia una Orden
     *
     * @param invoice
     *        Factura
     * @param copyASI
     *        Copiar los atributos de la línea, el conjunto de atributos
     * @return Número de líneas copiadas
     */
    private final int copiarLineasDesdeFactura (MInvoice factura, MOrder orden, boolean copyASI)
    {
        if (factura == null)
            return 0;
        MInvoiceLine[] fromLines = factura.getLines();
        int count = 0;
        for (int i = 0; i < fromLines.length; i++)
        {
            MOrderLine line = new MOrderLine(orden);
            PO.copyValues(fromLines[i], line);
            line.set_ValueOfColumn("AD_Client_ID", orden.getAD_Client_ID());
            line.setAD_Org_ID(orden.getAD_Org_ID());
            line.setC_Order_ID(orden.getC_Order_ID());
            //
            line.setQtyDelivered(Env.ZERO);
            line.setQtyInvoiced(Env.ZERO);
            line.setQtyReserved(Env.ZERO);
            line.setDateDelivered(null);
            line.setDateInvoiced(null);
            //
            line.setOrder(orden);
            line.setC_OrderLine_ID(new Integer(0)); // new

            if (!copyASI)
            {
                line.setM_AttributeSetInstance_ID(0);
                line.setS_ResourceAssignment_ID(0);
            } else
            {
                line.setM_AttributeSetInstance_ID(fromLines[i].getM_AttributeSetInstance_ID());
                line.setS_ResourceAssignment_ID(fromLines[i].getS_ResourceAssignment_ID());
            }
            // No copiar líneas vinculadas
            line.setLink_OrderLine_ID(0);
            line.setQtyOrdered(fromLines[i].getQtyEntered());
            line.setProcessed(false);
            line.saveEx();
            count++;
        }
        if (fromLines.length != count)
            log.log(Level.SEVERE, "Diferencia de Líneas - Origen" + fromLines.length
                    + " <> Grabadas=" + count);
        return count;
    } // copiarLineasdesdeFactura
}
