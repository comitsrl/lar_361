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

import java.sql.ResultSet;
import java.util.List;
import java.util.Properties;

import org.compiere.model.MLookup;
import org.compiere.model.MLookupFactory;
import org.compiere.util.DB;
import org.compiere.util.DisplayType;
import org.compiere.util.Env;
import org.compiere.util.ValueNamePair;

public class MLARTarjetaCredito extends X_LAR_Tarjeta_Credito
{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3139247137969726393L;

	/**
	 * Constructor Estandar.
	 * @param ctx
	 * @param LAR_Tarjeta_Credito_ID
	 * @param trxName
	 */
	public MLARTarjetaCredito(Properties ctx, int LAR_Tarjeta_Credito_ID, String trxName)
	{
		super(ctx, LAR_Tarjeta_Credito_ID, trxName);
	}

	/**
	 * Constructor ResultSet.
	 * @param ctx
	 * @param rs
	 * @param trxName
	 */
	public MLARTarjetaCredito(Properties ctx, ResultSet rs, String trxName)
	{
		super(ctx, rs, trxName);
	}

	/******************************************************************
	 * Before Save
	 * @param newRecord new
	 * @return save
	 */
	protected boolean beforeSave(boolean newRecord)
	{
        /* @fchiappano se comenta codigo, ya que se deja de utilizar la referencia de tarjetas de credito.
        final int AD_Column_ID = 3001185;
        final MLookup lookup = MLookupFactory.get(Env.getCtx(), 0, 0, AD_Column_ID, DisplayType.List);
        final List<Object> tiposTarjetas = lookup.getData(true, false, true, true);
        String tipoName = "";
        for (Object tipo : tiposTarjetas)
        {
            if (((ValueNamePair) tipo).getValue().equals(get_Value("CreditCardType")))
                tipoName = ((ValueNamePair) tipo).getName();
        }

        final String descripcion = getName() + " " + tipoName;
        set_Value("Description", descripcion);
        */

	    // @fchiappano Validar que se haya seleccionado un tipo de forma de pago.
        if (!get_ValueAsBoolean("EsCredito") && !get_ValueAsBoolean("EsDebito") && !get_ValueAsBoolean("EsDeposito")
                && !get_ValueAsBoolean("EsChequeEmitido") && !get_ValueAsBoolean("EsQR"))
        {
            log.saveError("", "Por favor, seleccione un Tipo de Forma de Pago (Credito, Debito, Deposito, QR, etc).");
            return false;
        }

        // @fchiappano Si la descrición (Nombre interno) esta vacia, setearle el
        // nombre.
        if (getDescription() == null || getDescription().equals(""))
        {
            final int AD_Column_ID = 3004457;
            final MLookup lookup = MLookupFactory.get(Env.getCtx(), 0, 0, AD_Column_ID, DisplayType.List);
            final List<Object> tiposTrx = lookup.getData(true, false, true, true);
            String tipoName = "";
            for (Object tipo : tiposTrx)
            {
                if (((ValueNamePair) tipo).getValue().equals(get_Value("SOPOType")))
                    tipoName = ((ValueNamePair) tipo).getName();
            }

            int terminalPostnet_ID = get_ValueAsInt("LAR_TerminalPostnet_ID");
            String terminalName = "";
            if (terminalPostnet_ID > 0)
            {
                String sql = "SELECT NroEstablecimiento FROM LAR_TerminalPostnet WHERE LAR_TerminalPostnet_ID = ?";
                terminalName = DB.getSQLValueString(get_TrxName(), sql, terminalPostnet_ID);
            }

            setDescription(getName() + "_" + tipoName.toUpperCase() + " (" + terminalName + ")");
        }

        return true;
	}//beforeSave
}
