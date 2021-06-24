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

import java.util.logging.Level;

import org.compiere.apps.ProcessCtl;
import org.compiere.model.MInvoice;
import org.compiere.model.MPInstance;
import org.compiere.model.MPInstancePara;
import org.compiere.process.ProcessInfo;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereUserError;
import org.compiere.util.Env;
import org.compiere.util.Msg;
import org.compiere.util.Trx;

/**
 * Proceso que se encargara de copiar las lineas desde la factura origen (en
 * remplazo de la anterior implementación a travez de un callout)..
 *
 * @author fchiappano
 */
public class LAR_CopiarLineasFacturaOrigen extends SvrProcess
{
    /** The Record                      */
    private int     p_Record_ID = 0;

    @Override
    protected void prepare()
    {
        final ProcessInfoParameter[] para = getParameter();
        for (int i = 0; i < para.length; i++)
        {
            String name = para[i].getParameterName();
            if (para[i].getParameter() == null)
                ;
            else
                log.log(Level.SEVERE, "Par\u00e1metro desconocido: " + name);
        }
        p_Record_ID = getRecord_ID();
    } // prepare

    @Override
    protected String doIt() throws Exception
    {
        MInvoice invoice = new MInvoice(getCtx(), p_Record_ID, get_TrxName());

        int source_Invoice_ID = invoice.get_ValueAsInt("Source_Invoice_ID");
        if (source_Invoice_ID <= 0)
            throw new AdempiereUserError("Se debe seleccionar una Factura Origen primero.");

        // @fchiappano Si la moneda de la NC o ND difiere de la factura origen,
        // pisarla.
        MInvoice facturaOrigen = new MInvoice(getCtx(), source_Invoice_ID, get_TrxName());
        if (facturaOrigen.getC_Currency_ID() != invoice.getC_Currency_ID())
        {
            invoice.setC_Currency_ID(facturaOrigen.getC_Currency_ID());
            invoice.saveEx(get_TrxName());
        }

        // Config CopyFromInvoice process (AD_Process_ID=210)
        int AD_Process_ID = 210;
        MPInstance instance = new MPInstance(Env.getCtx(), AD_Process_ID, 0);
        if (!instance.save())
            throw new AdempiereUserError(Msg.getMsg(Env.getCtx(), "ProcessNoInstance"));
        ProcessInfo pi = new ProcessInfo("", AD_Process_ID);
        pi.setRecord_ID(invoice.getC_Invoice_ID());
        pi.setAD_PInstance_ID(instance.getAD_PInstance_ID());

        // Add Parameters
        MPInstancePara param = new MPInstancePara(instance, 10);
        param.setParameter("C_Invoice_ID", source_Invoice_ID);
        if (!param.save())
            return Msg.getMsg(Env.getCtx(), "ParameterMissing");

        // Execute process
        ProcessCtl worker = new ProcessCtl(null, 0, pi, Trx.get(get_TrxName(), false));
        worker.run();

        return "Líneas copiadas con exito.";
    } // doIt

} // LAR_CopiarLineasFacturaOrigen
