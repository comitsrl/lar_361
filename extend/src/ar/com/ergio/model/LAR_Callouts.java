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

import javax.swing.JFrame;

import org.compiere.apps.ADialog;
import org.compiere.apps.ProcessCtl;
import org.compiere.model.CalloutEngine;
import org.compiere.model.GridField;
import org.compiere.model.GridTab;
import org.compiere.model.MPInstance;
import org.compiere.model.MPInstancePara;
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

        if (!ADialog.ask(windowNo, Env.getWindow(windowNo), "CopyLinesFromInvoice?"))
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
}
