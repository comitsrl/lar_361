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

import java.math.BigDecimal;
import java.util.logging.Level;

import org.compiere.model.MDocType;
import org.compiere.model.MInvoice;
import org.compiere.model.MOrder;
import org.compiere.model.MOrderLine;
import org.compiere.model.MStorage;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereUserError;
import org.compiere.util.Env;

/**
 * Proceso que descarta las cantidades pendientes de entrega de una Orden Asociada a una Factura de Ventas.
 *
 * @author fchiappano
 */
public class LAR_DescartarPendienteEntrega extends SvrProcess
{
    private int c_Invoice_ID = 0;

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
            else
                log.log(Level.SEVERE, "prepare - Unknown Parameter: " + name);
        }

        c_Invoice_ID = getRecord_ID();
    } // prepare

    /**
     * Perform process.
     *
     * @return Message
     * @throws Exception if not successful
     */
    protected String doIt() throws Exception
    {
        MInvoice invoice = new MInvoice(getCtx(), c_Invoice_ID, get_TrxName());

        String docBaseType = invoice.getC_DocType().getDocBaseType();

        // @fchiappano si se trata una NC, utilizo la factura origen para dar de baja la mercaderia.
        if (docBaseType.equals(MDocType.DOCBASETYPE_ARCreditMemo))
            invoice = new MInvoice(getCtx(), invoice.get_ValueAsInt("Source_Invoice_ID"), get_TrxName());

        int c_Order_ID = invoice.getC_Order_ID();

        if (c_Order_ID <= 0)
            throw new AdempiereUserError("La Factura o Factura Origen (en caso de tratarse de una Nota de Credito), no posee una Orden de Venta asociada.");

        MOrder orden = new MOrder(getCtx(), c_Order_ID, docBaseType);

        for (MOrderLine linea : orden.getLines())
        {
            BigDecimal pendiente = linea.getQtyReserved();

            if (pendiente.compareTo(Env.ZERO) > 0)
            {
                linea.setQtyDelivered(linea.getQtyOrdered());
                linea.set_ValueOfColumn("Cant_Reparto", Env.ZERO);
                linea.setQtyReserved(Env.ZERO);

                // @fchiappano restar la mercaderia, de la cantidad reservada en la M_Storage.
                MStorage storage = MStorage.getCreate(Env.getCtx(),
                        MStorage.getM_Locator_ID(linea.getM_Warehouse_ID(), linea.getM_Product_ID(),
                                linea.getM_AttributeSetInstance_ID(), Env.ZERO, get_TrxName()),
                        linea.getM_Product_ID(), linea.getM_AttributeSetInstance_ID(), get_TrxName());
                storage.setQtyReserved(storage.getQtyReserved().subtract(pendiente));
                storage.saveEx();
            }

            if (!linea.save(get_TrxName()))
                throw new AdempiereUserError("No fue posible actualizar la Orden de Venta. Verifique que se cuente con una versión de lista de precios activa para la fecha "
                        + orden.getDateOrdered());
        }

        return "@OK@ Cantidades pendientes de entrega, descartadas!";
    } // doIt

} // LAR_DescartarPendienteEntrega