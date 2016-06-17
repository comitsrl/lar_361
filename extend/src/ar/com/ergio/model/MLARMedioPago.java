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
package ar.com.ergio.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.util.DB;


public class MLARMedioPago extends X_LAR_Medio_Pago
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -6852422316210577820L;

	/**
	 * Constructor Estandar.
	 * 
	 * @param ctx
	 * @param LAR_Medio_Pago_ID
	 * @param trxName
	 */
	public MLARMedioPago(Properties ctx, int LAR_Medio_Pago_ID, String trxName)
	{
		super(ctx, LAR_Medio_Pago_ID, trxName);
	}

	/**
	 * ResultSet Constructor.
	 *
	 * @param ctx
	 * @param rs
	 * @param trxName
	 */
	public MLARMedioPago(Properties ctx, ResultSet rs, String trxName)
	{
		super(ctx, rs, trxName);
	}

	/**************************************************************************
	 * Before Save
	 *
	 * @param newRecord new
	 * @return save
	 */
	protected boolean beforeSave(boolean newRecord)
	{
		//Si el medio de Pago es Tarjeta de Credito,
		//chequeo que se haya seleccionado una Tarjeta de lista.
		if (getTenderType().equals("C"))
		{
			if (getLAR_Tarjeta_Credito_ID()==0)
			{
				log.saveError("", "Por favor, seleccione una Tarjeta de Crédito de la lista.");
				return false;
			}
		}

		// Obtengo los medios de pago que tengan la tarjeta de credito
		// seleccionada.
		final String sql = "SELECT *"
		                 + " FROM LAR_Medio_Pago"
		                 + " WHERE LAR_Tarjeta_Credito_ID=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			pstmt = DB.prepareStatement(sql, get_TrxName());
			pstmt.setInt(1, getLAR_Tarjeta_Credito_ID());
			rs = pstmt.executeQuery();

			// Si el rs tiene resultados, quiere decir que ya existe un medio de pago con la
			// tarjeta de credito seleccionada
			if (rs.next())
			{
			    log.saveError("","La Tarjeta de Crédito seleccionada, ya se encuentra asignada a otro Medio de Pago.");
			    return false;
			}
		}
		catch (Exception e)
		{
			log.log(Level.SEVERE, "No se encontraron medios de pago.", e);
		}
		finally
		{
			DB.close(rs, pstmt);
			rs = null;
			pstmt = null;
		}

		return true;

	}// beforeSave
}
