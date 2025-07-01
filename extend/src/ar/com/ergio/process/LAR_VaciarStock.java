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
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.model.MOrder;
import org.compiere.model.MOrderLine;
import org.compiere.model.MPriceListVersion;
import org.compiere.process.DocAction;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereUserError;
import org.compiere.util.DB;
import org.compiere.util.Env;

public class LAR_VaciarStock extends SvrProcess
{
	private int p_M_Warehouse_ID = 0;
	private int p_M_Product_ID = 0;
	private boolean p_AnularOrden = false;

	
	@Override
	protected void prepare() {
		ProcessInfoParameter[] para = getParameter(); // Devuelve un arreglo de parametros
        for (int i = 0; i < para.length; i++) // Recorre el arreglo de parámetros
        {
            String name = para[i].getParameterName(); //

            if (para[i].getParameter() == null)
                ;
            else if(name.equals("M_Warehouse_ID"))
            {
            	p_M_Warehouse_ID = para[i].getParameterAsInt();
            }
            else if(name.equals("M_Product_ID"))
            {
            	p_M_Product_ID = para[i].getParameterAsInt();
            }
            else if(name.equals("AnularOrden"))
            {
            	p_AnularOrden = para[i].getParameterAsBoolean();
            }
            else
            {
                log.log(Level.SEVERE, "Par\u00e1metro desconocido: " + name);
            }

        }
	} // prepare

	@Override
	protected String doIt() throws Exception 
	{
		List<MOrder> orders = recuperarOrdenes();
		/**
		 * Si esta marcado AnularOrden y existen ordenes con lineas
		 * asociadas al p_M_Product_ID con cantidad reservada > 0
		 * anulamos o cerramos y luego vaciamos el stock del producto. 
		 */
		if(p_AnularOrden)
		{
			if(!orders.isEmpty())
			{
				for (MOrder order : orders) 
					anularOrden(order);
			}
			vaciarStock();
		} 
		else
		{
			// Caso contrario y, si no hay ordenes, vaciamos stock.
			// Si las hay, informamos al usuario.
			if(orders.isEmpty())
			{
				vaciarStock();
			}
			else
			{
				return mostrarOrdenes(orders);
			}
		}
		return null;
	} // doIt
	
	/**
	 * Construimos un String con las Ordenes que debemos informar
	 * al usuario
	 * @param orders
	 * @return
	 */
	private String mostrarOrdenes(List<MOrder> orders) 
	{
		StringBuilder sb = new StringBuilder("Las siguientes Órdenes estan Procesadas y Reservan mercaderia para este producto:<br>");
		for(MOrder order: orders)
		{
			sb.append("- ").append(order.getDocumentNo()).append("<br>");
		}
		return sb.toString();
	}

	/*
	 * Setea QtyOnHand y QtyReserved en 0
	 * segun el producto y los m_locator_id asociados al deposito          
	 */
	private void vaciarStock() 
	{
		String sql = "UPDATE M_Storage"
				   +  " SET QtyOnHand = 0, QtyReserved = 0"
				   + " WHERE M_Product_ID = ? AND M_Locator_ID IN ("
				   + 	" SELECT M_Locator_ID"
				   + 	" FROM M_Locator"
				   +    " WHERE M_Warehouse_ID = ?)";
       Integer[] params = { p_M_Product_ID, p_M_Warehouse_ID };
       try
       {
           DB.executeUpdateEx(sql, params, get_TrxName());
       }
       catch(Exception e)
       {
    	   log.log(Level.SEVERE, "Error al vaciar stock", e);
    	   throw new AdempiereException("No se pudo vaciar el stock " + e.getMessage());
       }

	} // vaciarStock
	
	/**
	 * Recupera Ordenes:
	 * - de venta
	 * - con deposito del parametro
	 * - linea con p_M_Product_ID tiene QtyReserved > 0
	 */
	private List<MOrder> recuperarOrdenes()
	{
		List<MOrder> orders = new ArrayList<MOrder>();
		String sql = "SELECT DISTINCT o.* "
				+ "FROM C_Order o "
				+ "JOIN C_OrderLine ol ON o.C_Order_ID = ol.C_Order_ID "
				+ "WHERE o.IsSOTrx = 'Y' "
				+ "AND o.M_Warehouse_ID = ? "
				+ "AND ol.M_Product_ID = ? "
				+ "AND ol.QtyReserved > 0 ";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			pstmt = DB.prepareStatement(sql, get_TrxName());
			pstmt.setInt(1, p_M_Warehouse_ID);
			pstmt.setInt(2, p_M_Product_ID);
			rs = pstmt.executeQuery();
			while(rs.next())
				orders.add(new MOrder(getCtx(), rs, get_TrxName()));
		} catch (SQLException e)
		{
			log.log(Level.SEVERE, sql, e);
		} finally
		{
			DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
		}
		return orders;
	} // recuperaOrdenes
	
	/**
	 * Si la Orden esta completa la cerramos, esto pone la cantidad
	 * reservada en 0.
	 * Caso contrario la anulamos
	 * @param order
	 */
	private void anularOrden(MOrder order) throws AdempiereUserError
	{
		MPriceListVersion plv = getPriceListVersion(order);
		plv.setIsActive(true);
		plv.saveEx(get_TrxName());
		if(order.getDocStatus().equals(MOrder.DOCSTATUS_Completed))
		{
			if(!order.processIt(DocAction.ACTION_Close))
				throw new AdempiereUserError("No se pudo Cerrar la Orden" + order.getDocumentNo() + " " + order.getProcessMsg());
			order.addDescription("Cerrada por proceso de baja de Stock");
		}
		else if(order.getDocStatus().equals(MOrder.DOCSTATUS_Voided))
		{
			/**
			 * Si la orden esta anulada y tiene lineas con cantidad
			 * reservada > 0. Seteamos la cantidad en 0.
			 */
			List<MOrderLine> orderLines = getOrderLines(order);
			for(MOrderLine orderLine : orderLines)
			{
				if(orderLine.getQtyReserved().compareTo(Env.ZERO) == 1)
				{
					orderLine.setQtyReserved(Env.ZERO);
					orderLine.saveEx(get_TrxName());
				}
			}
		}
		else
		{
			if(!order.processIt(DocAction.ACTION_Void))
				throw new AdempiereUserError("No se pudo Anular la Orden" + order.getDocumentNo() + " " + order.getProcessMsg());
			order.addDescription("Anulada por proceso de baja de Stock");
		}
		plv.setIsActive(false);
		plv.save(get_TrxName());
		order.saveEx(get_TrxName());
	} // anularOrden
	
	/**
	 * Recupera las lineas de una Orden
	 * @param order
	 * @return
	 */
	private List<MOrderLine> getOrderLines(MOrder order)
	{
		List<MOrderLine> orderLines = new ArrayList<>();
		String sql = "SELECT C_OrderLine_ID"
				+ " FROM C_OrderLine"
				+ " WHERE C_Order_ID = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			pstmt = DB.prepareStatement(sql, get_TrxName());
			pstmt.setInt(1, order.getC_Order_ID());
			rs = pstmt.executeQuery();
			while(rs.next()) 
			{
				orderLines.add(new MOrderLine(getCtx(), rs.getInt(1), get_TrxName()));
			}
		}catch (Exception e)
		{
			log.log(Level.SEVERE, sql, e);
		}finally
		{
			DB.close(rs, pstmt);
			rs = null;
			pstmt = null;
		}
		return orderLines;
	}
	
	/**
	 * Recupera la versión de la lista de precios
	 * de la orden que concuerde con la fecha de esta
	 * y que no esten activas.
	 * @param order
	 */
	private MPriceListVersion getPriceListVersion(MOrder order) 
	{
		String sql = "SELECT plv.M_PriceList_Version_ID"
	            +  " FROM M_PriceList_Version plv"
	            + " WHERE plv.IsActive = 'N'"
	            +   " AND plv.ValidFrom <= ?"
	            +   " AND plv.M_PriceList_ID = ?"
	            + " ORDER BY plv.ValidFrom DESC";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = DB.prepareStatement(sql, get_TrxName());
			pstmt.setTimestamp(1, order.getDateOrdered());
			pstmt.setInt(2, order.getM_PriceList_ID());
			rs = pstmt.executeQuery();

			if (rs.next())
				return new MPriceListVersion(getCtx(), rs.getInt(1), get_TrxName());

		} catch (Exception e) {
			log.log(Level.SEVERE, sql, e);
		} finally {
			DB.close(rs, pstmt);
			rs = null;
			pstmt = null;
		}
		return null;
	} // getPriceListVersion
}
