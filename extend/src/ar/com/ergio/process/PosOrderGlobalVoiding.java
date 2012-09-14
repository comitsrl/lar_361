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
package ar.com.ergio.process;

import java.util.logging.Level;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.model.MInvoice;
import org.compiere.model.MOrder;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;

import ar.com.ergio.model.MLARPaymentHeader;

/**
 * Proceso de anulación global de documentos fiscales involucrados en
 * una operación de venta.
 *
 * @author Emiliano Pereyra - http://www.ergio.com.ar
 *
 */
public class PosOrderGlobalVoiding extends SvrProcess
{
    /** Current invoice id */
    private int p_C_Order_ID;
    /** Process result message */
    private StringBuilder m_processMsg;

    @Override
    protected void prepare()
    {
        ProcessInfoParameter[] para = getParameter();
        for (int i = 0; i < para.length; i++)
        {
            log.fine("prepare - " + para[i]);
            String name = para[i].getParameterName();
            if (para[i].getParameter() == null && para[i].getParameter_To() == null)
                ;
            else if (name.equals("C_Order_ID"))
                p_C_Order_ID = para[i].getParameterAsInt();
            else
                log.log(Level.SEVERE, "Unknown Parameter: " + name);
        }
    } // prepare

    @Override
    protected String doIt() throws Exception
    {
        log.info("C_Order_ID=" + p_C_Order_ID);
        m_processMsg = new StringBuilder();

        final MOrder order = new MOrder(getCtx(), p_C_Order_ID, get_TrxName());

        // Primero recupera las facturas asociadas a la orden
        // (previo a anulación de orden, porque sino se recuperarían también las anuladas)
        final MInvoice[] invoices = order.getInvoices();
        for (int i = 0; i < invoices.length; i++)
        {
            int c_Invoice_ID = invoices[i].getC_Invoice_ID();

            // Recupera y anula la cabecera de cobros/pagos asociada a la factura
            final MLARPaymentHeader header = MLARPaymentHeader.getFromInvoice(getCtx(), c_Invoice_ID, get_TrxName());
            if (header == null)
                throw new AdempiereException("Factura sin cabecera de pago relacionada");

            String headerType = invoices[i].isSOTrx() ? "Cabecera de cobro" : "Cabecera de pago";

            if (header.processIt(MLARPaymentHeader.ACTION_Void))
            {
                header.save(get_TrxName());
                m_processMsg.append(headerType).append(" anulada correctamente");
            }
            else
                m_processMsg.append(headerType).append(": ").append(order.getProcessMsg());
        }

        // Anula la orden y sus documentos asociados: remitos, facturas
        // e imputaciones de pago.
        if (order.processIt(MOrder.ACTION_Void))
        {
            order.save(get_TrxName());
            m_processMsg.append(", @C_Order_ID@ anulada correctamente");
        }
        else
            m_processMsg.append(", @C_Order_ID@: ").append(order.getProcessMsg());


        return m_processMsg.toString();
    } // doIt
}
