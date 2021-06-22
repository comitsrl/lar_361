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

import org.compiere.model.MInvoice;
import org.compiere.model.MInvoiceLine;
import org.compiere.model.MOrder;
import org.compiere.model.MOrderLine;
import org.compiere.model.PO;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereUserError;
import org.compiere.util.Env;

/**
 * Proceso que se encargara de copiar las lineas desde la factura origen, en la
 * Orden de Nota de Crédito (en remplazo de la anterior implementación a travez
 * de un callout).
 *
 * @author fchiappano
 */
public class LAR_CopiarLineasFacturaOrigenON extends SvrProcess
{
    /** The Record                      */
    private int     p_Record_ID = 0;
    private boolean copyASI = false;

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
        MOrder ordenNC = new MOrder(getCtx(), p_Record_ID, get_TrxName());

        int source_Invoice_ID = ordenNC.get_ValueAsInt("Source_Invoice_ID");
        if (source_Invoice_ID <= 0)
            throw new AdempiereUserError("Se debe seleccionar una Factura Origen primero.");

        MInvoice factura = new MInvoice(getCtx(), source_Invoice_ID, get_TrxName());

        MInvoiceLine[] fromLines = factura.getLines();
        int count = 0;
        for (int i = 0; i < fromLines.length; i++)
        {
            MOrderLine line = new MOrderLine(ordenNC);
            PO.copyValues(fromLines[i], line);
            line.set_ValueOfColumn("AD_Client_ID", ordenNC.getAD_Client_ID());
            line.setAD_Org_ID(ordenNC.getAD_Org_ID());
            line.setC_Order_ID(ordenNC.getC_Order_ID());
            //
            line.setQtyDelivered(Env.ZERO);
            line.setQtyInvoiced(Env.ZERO);
            line.setQtyReserved(Env.ZERO);
            line.setDateDelivered(null);
            line.setDateInvoiced(null);
            //
            line.setOrder(ordenNC);
            line.setC_OrderLine_ID(new Integer(0)); // new

            if (!copyASI)
            {
                line.setM_AttributeSetInstance_ID(0);
                line.setS_ResourceAssignment_ID(0);
            }
            else
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
            throw new AdempiereUserError("Diferencia de Líneas - Origen" + fromLines.length + " <> Grabadas=" + count);

        return "Líneas copiadas con exito.";
    } // doIt

} // LAR_CopiarLineasFacturaOrigenON
