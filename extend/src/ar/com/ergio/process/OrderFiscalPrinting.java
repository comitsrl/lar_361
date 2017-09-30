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

import org.compiere.model.MDocType;
import org.compiere.model.MInvoice;
import org.compiere.model.MOrder;
import org.compiere.process.SvrProcess;

import ar.com.ergio.print.fiscal.view.InvoiceFiscalDocumentPrintManager;
import ar.com.ergio.util.LAR_Utils;

/**
 * Imprime el Ticket Fiscal para una factura
 * generada desde una orden
 *
 * @author Marcos Zúñiga - http://www.ergio.com.ar
 *
 */
public class OrderFiscalPrinting extends SvrProcess
{
    /** Current order id */
    private int p_C_Order_ID;
    /** Process result message */
    private String m_ResultMsg = "";
    /** Current order model object */
    private MOrder order;

    @Override
    protected void prepare()
    {
        p_C_Order_ID = getRecord_ID();
        order = new MOrder(getCtx(), p_C_Order_ID, get_TrxName());
    }

    @Override
    protected String doIt() throws Exception
    {
        log.info(String.format("Procesando orden %s", order));
        
        // Determina si la orden es POS o de Nota de Crédito para continuar con el proceso
        final MDocType dtTarget = new MDocType(getCtx(), order.getC_DocTypeTarget_ID(), get_TrxName());
        if (order.isSOTrx() && (dtTarget.getDocSubTypeSO().equals(MDocType.DOCSUBTYPESO_OnCreditOrder)
                || dtTarget.getDocSubTypeSO().equals(MDocType.DOCSUBTYPESO_POSOrder)))
        {
            final MInvoice invoice = new MInvoice(getCtx(), order.getC_Invoice_ID(), get_TrxName());

            // Verifica si la factura existe y si es del de tipo fiscal
            // para imprimirla o no en el controlador fiscal
            if (invoice != null && LAR_Utils.isFiscalDocType(invoice.getC_DocType_ID()))
            {
                final InvoiceFiscalDocumentPrintManager manager = new InvoiceFiscalDocumentPrintManager(invoice);
                manager.print();
            }
        }
        return m_ResultMsg;
    }
}
