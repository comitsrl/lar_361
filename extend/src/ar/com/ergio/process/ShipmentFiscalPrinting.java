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
package ar.com.ergio.process;

import org.compiere.model.MInOut;
import org.compiere.process.SvrProcess;

import ar.com.ergio.print.fiscal.view.ShipmentFiscalDocumentPrintManager;
import ar.com.ergio.util.LAR_Utils;

/**
 * Impresión fiscal de un remito (documento no fiscal)
 *
 * @author Emiliano Pereyra - http://www.ergio.com.ar
 *
 */
public class ShipmentFiscalPrinting extends SvrProcess
{
    /** Current shipment id */
    private int p_M_InOut_ID;
    /** Process result message */
    private String m_ResultMsg = "";
    /** Current shipment model object */
    private MInOut shipment;

    @Override
    protected void prepare()
    {
        p_M_InOut_ID = getRecord_ID();
        shipment = new MInOut(getCtx(), p_M_InOut_ID, get_TrxName());
    }

    @Override
    protected String doIt() throws Exception
    {
        log.info(String.format("Processing shipment %s", shipment));
        // Check if invoice exists and has proper doctype
        if (shipment != null && LAR_Utils.isFiscalDocType(shipment.getC_DocType_ID()))
        {
            final ShipmentFiscalDocumentPrintManager process = new ShipmentFiscalDocumentPrintManager(shipment);
            process.print();
        }
        return m_ResultMsg;
    }

}
