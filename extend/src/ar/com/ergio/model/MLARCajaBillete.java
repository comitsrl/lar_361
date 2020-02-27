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
import java.sql.ResultSet;
import java.util.Properties;

import org.compiere.model.MBankStatement;
import org.compiere.util.DB;
import org.compiere.util.Env;

import ar.com.ergio.util.LAR_Utils;

/**
 * Modelo de clase, para discriminación de billetes en cierre de cajas.
 * @author fchiappano
 *
 */
public class MLARCajaBillete extends X_LAR_Caja_Billete
{

    /**
     *
     */
    private static final long serialVersionUID = 6121678328755790764L;

    /**
     * Standard constuctor.
     *
     * @param ctx
     * @param LAR_RetiroCaja_ID
     * @param trxName
     */
    public MLARCajaBillete(Properties ctx, int LAR_Caja_Billete_ID, String trxName)
    {
        super(ctx, LAR_Caja_Billete_ID, trxName);
    } // MLARCajaBillete

    /**
     * ResultSet constuctor.
     *
     * @param ctx
     * @param rs
     * @param trxName
     */
    public MLARCajaBillete(Properties ctx, ResultSet rs, String trxName)
    {
        super(ctx, rs, trxName);
    } // MLARCajaBillete

    /**
     * After Save
     *
     * @param newRecord new
     * @param success success
     * @return true if can be saved
     */
    protected boolean afterSave(boolean newRecord, boolean success)
    {
        // @fchiappano Calcular el total de efectivo, para el cierre de cajas.
        String sql = "SELECT SUM (Valor * Cantidad)"
                   +  " FROM LAR_Caja_Billete"
                   + " WHERE C_BankStatement_ID = ? AND LAR_Caja_Billete_ID != ?";

        BigDecimal totalEfectivo = DB.getSQLValueBD(get_TrxName(), sql, getC_BankStatement_ID(), getLAR_Caja_Billete_ID());

        if (totalEfectivo == null)
            totalEfectivo = Env.ZERO;

        totalEfectivo = totalEfectivo.add(getValor().multiply(new BigDecimal(getCantidad())));
        totalEfectivo.setScale(LAR_Utils.getMonedaPredeterminada(p_ctx, getAD_Client_ID(), get_TrxName()), RoundingMode.HALF_UP);

        MBankStatement cierreCaja = (MBankStatement) getC_BankStatement();
        cierreCaja.set_ValueOfColumn("ScrutinizedCashAmt", totalEfectivo);
        cierreCaja.saveEx();

        return true;
    } // afterSave

    /**
     * After Delete
     *
     * @param success success
     * @return deleted
     */
    protected boolean afterDelete(boolean success)
    {
        BigDecimal totalLinea = getValor().multiply(new BigDecimal(getCantidad()));

        MBankStatement cierreCaja = (MBankStatement) getC_BankStatement();

        BigDecimal totalEfectivo = ((BigDecimal) cierreCaja.get_Value("ScrutinizedCashAmt")).subtract(totalLinea);
        cierreCaja.set_ValueOfColumn("ScrutinizedCashAmt", totalEfectivo);
        cierreCaja.saveEx();

        return true;
    } // afterDelete

} // MLARCajaBillete
