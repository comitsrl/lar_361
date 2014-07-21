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

import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereUserError;

import ar.com.ergio.model.MLARPaymentHeader;

/**
 * Genera la retención sobre la cabecera de pago
 *
 * @author Emiliano Pereyra - http://www.ergio.com.ar
 */
public class LAR_GenerateWithholding extends SvrProcess
{
    /** The Record                      */
    private int     p_Record_ID = 0;

    @Override
    protected void prepare()
    {
        final ProcessInfoParameter[] para = getParameter();
        for (int i = 0; i < para.length; i++)
        {
            String name = para[i].getParameterName();
            if (para[i].getParameter() == null)
                ;
            else
                log.log(Level.SEVERE, "Par\u00e1metro desconocido: " + name);
        }
        p_Record_ID = getRecord_ID();
    } // prepare

    @Override
    protected String doIt() throws Exception
    {
        final MLARPaymentHeader header = new MLARPaymentHeader(getCtx(), p_Record_ID, get_TrxName());
        if (header.getLAR_PaymentHeader_ID() == 0)
            throw new AdempiereUserError("Sin Cabecera de Pago");

        if (!header.recalcPaymentWithholding())
            throw new AdempiereUserError("Error al calcular la retenci\u00f3n sobre la cabecera de pago");

        return "Retención Generada";
    } // doIt

} // LAR_GenerateWithholding
