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
package ar.com.ergio.print.fiscal.view;

import org.compiere.model.MInOut;
import org.compiere.model.MOrder;
import org.compiere.model.MSequence;
import org.compiere.model.PO;
import org.compiere.process.DocAction;

import ar.com.ergio.model.FiscalDocumentPrint;

/**
 *
 * @author Emiliano Pereyra - http://www.ergio.com.ar
 *
 */
public class ShipmentFiscalDocumentPrintManager extends FiscalDocumentPrintManager
{
    private final MInOut shipment;

    public ShipmentFiscalDocumentPrintManager(final PO document)
    {
        super(document);
        shipment = (MInOut) document;
    }

    @Override
    protected boolean printDocument(final FiscalDocumentPrint fdp)
    {
        return fdp.printShipmentDocument(shipment);
    }

    @Override
    protected void voidDocument()
    {
        // Anula el remito
        shipment.processIt(DocAction.ACTION_Void);
        shipment.saveEx();

        // Retrocede la secuencia en 1
        int ad_Sequence_ID = shipment.getC_DocType().getDefiniteSequence_ID();
        final MSequence seq = new MSequence(shipment.getCtx(), ad_Sequence_ID, shipment.get_TrxName());
        seq.setCurrentNext(seq.getCurrentNext() - 1);
        seq.saveEx();
    }

}
