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
package ar.com.ergio.model;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.Properties;

import org.compiere.model.CalloutEngine;
import org.compiere.model.GridField;
import org.compiere.model.GridTab;
import org.compiere.model.MInvoice;
import org.compiere.model.MOrder;
import org.compiere.model.MOrderLine;
import org.compiere.util.DB;
import org.compiere.util.Env;


/**
 *	Orden de Garantia Callouts
 *
 *  @author Franco Chiappano - www.comit.com.ar
 */
public class CalloutOrdenGarantia extends CalloutEngine
{
	/**
	 * 	C_Order - Order Defaults.
	 *	@param ctx
	 *	@param WindowNo
	 *	@param mTab
	 *	@param mField
	 *	@param value
	 *	@return error message or ""
	 */
	public String order (Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value)
	{
		Integer C_Order_ID = (Integer)value;
		if (C_Order_ID == null || C_Order_ID.intValue() == 0)
			return "";
		//	No Callout Active to fire dependent values
		if (isCalloutActive())	//	prevent recursive
			return "";

		//	Get Details
		MOrder order = new MOrder (ctx, C_Order_ID.intValue(), null);
		if (order.get_ID() != 0)
		{
			mTab.setValue("C_BPartner_ID", new Integer(order.getC_BPartner_ID()));

			int invoice_ID = order.getC_Invoice_ID();

			if (invoice_ID <= 0)
			    return "La Orden de Venta seleccionada, aún no fue facturada.";
			else
			    mTab.setValue("C_Invoice_ID", invoice_ID);
		}
		return "";
	}	//	order

	/**
     *  C_Invoice - Invoice Defaults.
     *  @param ctx
     *  @param WindowNo
     *  @param mTab
     *  @param mField
     *  @param value
     *  @return error message or ""
     */
    public String invoice (Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value)
    {
        Integer C_Invoice_ID = (Integer)value;
        if (C_Invoice_ID == null || C_Invoice_ID.intValue() == 0)
            return "";
        //  No Callout Active to fire dependent values
        if (isCalloutActive())  //  prevent recursive
            return "";

        //  Get Details
        MInvoice invoice = new MInvoice (ctx, C_Invoice_ID.intValue(), null);
        if (invoice.get_ID() != 0)
        {
            mTab.setValue("C_BPartner_ID", new Integer(invoice.getC_BPartner_ID()));

            int order_ID = invoice.getC_Order_ID();

            if (order_ID <= 0)
                return "La factura seleccionada, no posee una Orden de Venta Asociada.";
            else
                mTab.setValue("C_Order_ID", order_ID);
        }
        return "";
    }   //  invoice

	/**************************************************************************
	 * 	OrderLine Callout
	 *	@param ctx context
	 *	@param WindowNo window no
	 *	@param mTab tab model
	 *	@param mField field model
	 *	@param value new value
	 *	@return error message or ""
	 */
	public String orderLine (Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value)
	{
		Integer C_OrderLine_ID = (Integer)value;
		if (C_OrderLine_ID == null || C_OrderLine_ID.intValue() == 0)
			return "";

		//	Get Details
		MOrderLine ol = new MOrderLine (ctx, C_OrderLine_ID.intValue(), null);
		if (ol.get_ID() != 0)
		{
            mTab.setValue("M_Product_ID", new Integer(ol.getM_Product_ID()));
            // mTab.setValue("M_AttributeSetInstance_ID", new Integer(ol.getM_AttributeSetInstance_ID()));
            mTab.setValue("C_UOM_ID", new Integer(ol.getC_UOM_ID()));
            BigDecimal MovementQty = ol.getQtyOrdered();
            mTab.setValue("Cantidad", MovementQty);
		}
		return "";
	}	//	orderLine

	/**
	 *	Orden Garantia Line - Quantity.
	 *	@param ctx context
	 *	@param WindowNo window no
	 *	@param mTab tab model
	 *	@param mField field model
	 *	@param value new value
	 *	@return error message or ""
	 */
    public String qty(Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value)
    {
        if (isCalloutActive() || value == null)
            return "";

        int M_Product_ID = Env.getContextAsInt(ctx, WindowNo, "M_Product_ID");
        // log.log(Level.WARNING,"qty - init - M_Product_ID=" + M_Product_ID);
        BigDecimal MovementQty = (BigDecimal) value;
        // @fchiappano Validar que no se este cambiando una cantidad mayor
        // a la cantidad facturada en la orden.
        Integer c_OrderLine_ID = (Integer) mTab.getValue("C_OrderLine_ID");
        if (c_OrderLine_ID != null && c_OrderLine_ID > 0)
        {
            String sql = "SELECT ol.QtyInvoiced" + " FROM C_OrderLine ol" + " WHERE ol.C_OrderLine_ID = ?";
            BigDecimal cantidadFacturada = DB.getSQLValueBD(null, sql, c_OrderLine_ID);
            if (cantidadFacturada.compareTo(MovementQty) < 0)
            {
                mTab.setValue("QtyEntered", cantidadFacturada);
                return "Cantidad ingresada (" + MovementQty.setScale(2, RoundingMode.HALF_UP)
                        + ") mayor a la cantidad facturada (" + cantidadFacturada.setScale(2, RoundingMode.HALF_UP)
                        + ").";
            }
        }
        //
        return "";
    } // qty

} // CalloutOrdenGarantia