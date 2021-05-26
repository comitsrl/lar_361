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


import org.compiere.model.MInOut;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereUserError;

import ar.com.comit.remito.electronico.ProcesadorCOT;

/**
 * Proceso que solicitara el codigo COT.
 *
 * @author fchiappano
 */
public class LAR_SolicitarCOT extends SvrProcess
{
    // @fchiappano Procesador COT.
    private ProcesadorCOT procesador;
    /** Remito (Shipment)          */
    private int     p_M_InOut_ID = 0;

    @Override
    protected void prepare()
    {
        // Se recupera la clave primaria del Remito
        p_M_InOut_ID = getRecord_ID();
        log.info("M_InOut_ID=" + p_M_InOut_ID);
    } // prepare

    @Override
    protected String doIt() throws Exception
    {
        // @fchiappano instanciar el procesador que solicitara el COT.
        MInOut remito = new MInOut(getCtx(), p_M_InOut_ID, get_TrxName());
        procesador = new ProcesadorCOT(remito);
        String mensaje = procesador.solcitarCOT();

        if (mensaje != null && !mensaje.equals(""))
            throw new AdempiereUserError("Error al solicitar COT: " + mensaje);

        mensaje = "Solicitud COT realizada con exito";

        return mensaje;
    } // doIt

} // LAR_SolicitarCOT
