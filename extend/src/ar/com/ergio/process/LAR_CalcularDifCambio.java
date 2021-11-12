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

import org.compiere.model.MPayment;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereSystemError;

import ar.com.ergio.model.MLARPaymentHeader;

/**
 * Proceso que calcula las diferencias de cambio, para cada una de las facturas
 * agregadas a una cabecera de Pago/Recibo.
 *
 * @author fchiappano
 */
public class LAR_CalcularDifCambio extends SvrProcess
{
    private int lar_PyamentHeader_ID = 0;

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

        lar_PyamentHeader_ID = getRecord_ID();
    } // prepare

    /**
     * Perform process.
     *
     * @return Message
     * @throws Exception if not successful
     */
    protected String doIt() throws AdempiereSystemError
    {
        MLARPaymentHeader header = new MLARPaymentHeader(getCtx(), lar_PyamentHeader_ID, get_TrxName());

        MPayment[] pays = header.getPayments(get_TrxName());

        if (pays == null || pays.length <= 0)
            return "@Error@ Ingrese al menos un detalle de Pago/Cobro";
        else
        {
            String msg = header.calcularAsignaciones(false, pays);
            if (msg != null)
                return "@Error@ " + msg;
        }

        return "@OK@";
    } // doIt

} // LAR_CalcularDifCambio