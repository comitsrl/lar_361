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

import org.compiere.model.MInOutLine;
import org.compiere.model.MInvoice;
import org.compiere.model.MInvoiceLine;
import org.compiere.model.MOrder;
import org.compiere.model.MOrderLine;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereSystemError;
import org.compiere.util.Env;

/**
 * Proceso que libera Ordenes de Venta y Remitos asociados a la factura
 * seleccionada, de manera que se puedan volver a facturar.
 *
 * @author fchiappano
 */
public class LAR_LiberarOrdenesVenta extends SvrProcess
{
    private int p_C_Invoice_ID = 0;

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
            else if (name.equals("C_Invoice_ID"))
                p_C_Invoice_ID = para[i].getParameterAsInt();
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
    protected String doIt() throws AdempiereSystemError
    {
        MInvoice factura = new MInvoice(getCtx(), p_C_Invoice_ID, get_TrxName());

        MInvoiceLine[] lineas = factura.getLines();

        for (int x = 0; x < lineas.length; x ++)
        {
            MInvoiceLine linea = lineas[x];

            // @fchiappano Actualizar linea de Orden de Venta asociada a la linea de factura.
            if (linea.getC_OrderLine_ID() > 0)
            {
                MOrderLine lineaOV = (MOrderLine) linea.getC_OrderLine();
                lineaOV.setQtyInvoiced(Env.ZERO);

                if (!lineaOV.save(get_TrxName()))
                    return "@Error@ Error al actualizar línea de Orden de Venta. \n"
                            + " Orden de Venta: " + lineaOV.getC_Order().getDocumentNo() + " \n"
                            + " N° de Línea: " + lineaOV.getLine();

                // @fchiappano Actualizar la cabecera de la OV asociada a la factura.
                MOrder orden = (MOrder) lineaOV.getC_Order();
                orden.setIsInvoiced(false);

                if (!orden.save(get_TrxName()))
                {
                    return "@Error@ Error al actualizar cabecera de Orden de Venta. \n"
                            + " Orden de Venta: " + orden.getDocumentNo() + " \n";
                }
            }

            // @fchiappano Actualizar linea de Remito asociada a la linea de factura.
            if (linea.getM_InOutLine_ID() > 0)
            {
                MInOutLine lineaR = (MInOutLine) linea.getM_InOutLine();
                lineaR.setIsInvoiced(false);

                if (!lineaR.save(get_TrxName()))
                    return "@Error@ Error al actualizar línea de Remito. \n"
                            + " Remito: " + lineaR.getM_InOut().getDocumentNo() + " \n"
                            + " N° de Línea: " + lineaR.getLine();
            }
        }

        return "@OK@";
    } // doIt

} // LAR_LiberarOrdenesVenta