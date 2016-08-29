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
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.util.DB;
import org.compiere.util.Env;


public class MLARPlanPago extends X_LAR_Plan_Pago
{

	private static final long serialVersionUID = -244186475723308087L;

	/**
	 * Constructor Estandar.
	 * @param ctx
	 * @param LAR_Plan_Pago_ID
	 * @param trxName
	 */
	public MLARPlanPago(Properties ctx, int LAR_Plan_Pago_ID, String trxName)
	{
		super(ctx, LAR_Plan_Pago_ID, trxName);
	}

	/**
	 * ResultSet Constructor.
	 * @param ctx
	 * @param rs
	 * @param trxName
	 */
	public MLARPlanPago(Properties ctx, ResultSet rs, String trxName)
	{
		super(ctx, rs, trxName);
	}

	/**************************************************************************
	 * Before Save
	 * @param newRecord new
	 * @return save
	 */
	protected boolean beforeSave(boolean newRecord)
	{

		//Verifico que la cuota incial no sea igual a 0;
		if (getCuota_Inicial()==0)
		{
			log.saveError("", "El intervalo, no puede iniciarse en el número de cuota 0.");
			return false;
		}

		// Verifico que la cuota incial sea menor a la cuota final.
		if (getCuota_Inicial() > getCuota_Final())
		{
			log.saveError("", "La Cuota Inicial del intervalo, no debe ser menor a la Cuota Final");
			return false;
		}

		// Obtengo todos los planes de pago.
		final List<MLARPlanPago> lista = new ArrayList<MLARPlanPago>();
		final String sql = "SELECT *"
		                 + "  FROM LAR_Plan_Pago"
			             + " WHERE LAR_Medio_Pago_ID=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			pstmt = DB.prepareStatement(sql, get_TrxName());
			pstmt.setInt(1, getLAR_Medio_Pago_ID());
			rs = pstmt.executeQuery();

			while (rs.next())
				lista.add(new MLARPlanPago(getCtx(), rs, get_TrxName()));
		}
		catch (Exception e)
		{
			log.log(Level.SEVERE, "No se encontraron planes de pago.", e);
		}
		finally
		{
			DB.close(rs, pstmt);
			rs = null;
			pstmt = null;
		}

		// Chequeo que los numeros de cuota ingresados, no se encuentren
		// dentro del rango de cuotas de otro plan.
		for (MLARPlanPago planPago : lista)
		{
			if (getCuota_Inicial() >= planPago.getCuota_Inicial() &&
				getCuota_Inicial() <= planPago.getCuota_Final() &&
				getLAR_Plan_Pago_ID() != planPago.getLAR_Plan_Pago_ID())
			{
				log.saveError("","El número de Cuota Inicial, pertence al intervalo establecido, por un plan de pago existente.");
				return false;
			}
			else if (getCuota_Final() >= planPago.getCuota_Inicial() &&
			        getCuota_Final() <= planPago.getCuota_Final() &&
			        getLAR_Plan_Pago_ID() != planPago.getLAR_Plan_Pago_ID())
			{
				log.saveError("", "El número de Cuota Final, pertenece al intervalo establecido, por un plan de pago exitente.");
				return false;
			}
			else if (getCuota_Inicial() <= planPago.getCuota_Inicial() &&
			        getCuota_Final() >= planPago.getCuota_Final() &&
			        getLAR_Plan_Pago_ID() != planPago.getLAR_Plan_Pago_ID())
			{
			    log.saveError("", "El intervalo establecido, contiene cuotas que ya se encuentran"
			            + " comprendidas en el intervalo de otro Plan de Pago existente.");
			    return false;
			}
		}

        // Concatenar correctamente el name del plan de pago
        if (getDescuento().compareTo(Env.ZERO) < 0)
        {
            final String name = getCuota_Inicial() + " a " + getCuota_Final() + " Cuotas - Recargo "
                    + getDescuento().negate().doubleValue() + '%';
            set_Value("Name", name);
        }
        else
        {
            final String name = getCuota_Inicial() + " a " + getCuota_Final() + " Cuotas - Descuento "
                    + getDescuento().doubleValue() + '%';
            set_Value("Name", name);
        }

        return true;
	}// beforeSave
}
