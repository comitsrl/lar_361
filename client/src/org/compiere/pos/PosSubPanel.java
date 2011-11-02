/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2006 Adempiere, Inc. All Rights Reserved.               *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 *****************************************************************************/

package org.compiere.pos;

import java.awt.Dimension;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Properties;
import java.util.logging.Level;

import javax.swing.KeyStroke;

import org.compiere.apps.ADialog;
import org.compiere.apps.AppsAction;
import org.compiere.apps.SwingWorker;
import org.compiere.model.MDocType;
import org.compiere.model.MInvoice;
import org.compiere.model.MOrder;
import org.compiere.model.MPOS;
import org.compiere.print.ReportCtl;
import org.compiere.print.ReportEngine;
import org.compiere.swing.CButton;
import org.compiere.swing.CPanel;
import org.compiere.util.CLogger;
import org.compiere.util.Env;
import org.compiere.util.Msg;

import ar.com.ergio.model.FiscalDocumentPrint;
import ar.com.ergio.print.fiscal.view.AInfoFiscalPrinter;
import ar.com.ergio.print.fiscal.view.AInfoFiscalPrinter.DialogActionListener;
import ar.com.ergio.util.LAR_Utils;

/**
 *	POS Sub Panel Base Class.
 *  @author Comunidad de Desarrollo OpenXpertya
 *         *Basado en Codigo Original Modificado, Revisado y Optimizado de:
 *         *Copyright (c) Jorg Janke
 *
 */
public abstract class PosSubPanel extends CPanel implements ActionListener
{

    private static final long serialVersionUID = -158167614949876569L;
    private static final CLogger log = CLogger.getCLogger(PosSubPanel.class);

	/**
	 * 	Constructor
	 *	@param posPanel POS Panel
	 */
	public PosSubPanel (PosBasePanel posPanel)
	{
		super();
		p_posPanel = posPanel;
		p_pos = posPanel.p_pos;
		init();
	}	//	PosSubPanel

	/** POS Panel							*/
	protected PosBasePanel 				p_posPanel;
	/**	Underlying POS Model				*/
	protected MPOS					p_pos;
	/** Context								*/
	protected Properties			p_ctx = Env.getCtx();

	protected static CButton 		f_cashPayment;

	/** Button Width = 50			*/
	private static final int	WIDTH = 50;
	/** Button Height = 50			*/
	private static final int	HEIGHT = 50;

	/**
	 * 	Initialize
	 */
	protected abstract void init();

	/**
	 * 	Dispose - Free Resources
	 */
	public void dispose()
	{
		p_pos = null;
	}	//	dispose


	/**
	 * 	Create Action Button
	 *	@param action action
	 *	@return button
	 */
	protected CButton createButtonAction (String action, KeyStroke accelerator)
	{
		AppsAction act = new AppsAction(action, accelerator, false);
		act.setDelegate(this);
		CButton button = (CButton)act.getButton();
		button.setPreferredSize(new Dimension(WIDTH, HEIGHT));
		button.setMinimumSize(getPreferredSize());
		button.setMaximumSize(getPreferredSize());
		button.setFocusable(false);
		return button;
	}	//	getButtonAction

	/**
	 * 	Create Standard Button
	 *	@param text text
	 *	@return button
	 */
	protected CButton createButton (String text)
	{
	//	if (text.indexOf("<html>") == -1)
	//		text = "<html><h4>" + text + "</h4></html>";
		CButton button = new CButton(text);
		button.addActionListener(this);
		button.setPreferredSize(new Dimension(WIDTH, HEIGHT));
		button.setMinimumSize(getPreferredSize());
		button.setMaximumSize(getPreferredSize());
		button.setFocusable(false);
		return button;
	}	//	getButton

	/**
	 * 	Action Listener
	 *	@param e event
	 */
	public void actionPerformed (ActionEvent e)
	{
	}	//	actionPerformed
	/**
	 * 	Print Ticket
	 *  @author Comunidad de Desarrollo OpenXpertya
	 *  *Basado en Codigo Original Modificado, Revisado y Optimizado de:
	 *  *Copyright (c) ConSerTi
	 */
	public void printTicket()
	{
		if ( p_posPanel.m_order == null )
			return;

		final MOrder order = p_posPanel.m_order;

		if (order != null)
		{
			try
			{
                // TODO: to incorporate work from Posterita

                // LAR Fiscal Printing
                final MInvoice invoice = p_posPanel.m_order.getInvoices()[0];
                final FiscalPrintWorker worker = new FiscalPrintWorker(invoice);
                // TODO - Add some feedback to user (cursor, glasspane, something...)
                worker.start();

                // print standard document
                ReportCtl.startDocumentPrint(ReportEngine.ORDER, order.getC_Order_ID(), null, Env.getWindowNo(this), true);

			}
			catch (Exception e)
			{
				log.log(Level.SEVERE, "Error Printing Ticket", e);
			}
		}
	}

	/**********************************************************************************************
	 *                            LAR Fiscal Printing Implementation
     **********************************************************************************************/

    /** Fiscal printing action listener */
    private final DialogActionListener dialogActionListener = new DialogActionListener()
    {

        @Override
        public void actionVoidPerformed()
        {
            // Anulación de los documentos.
            voidDocuments();
        }

        @Override
        public void actionReprintFinished()
        {
            // Al finalizar una reimpresión de ticket, se
            // reestablece la interfaz para un nuevo pedido
            p_posPanel.newOrder();
            // getFrame().setBusy(false);
            // mNormal();
        }
    };

    /** Fiscal Printing status window */
    private final AInfoFiscalPrinter infoFiscalPrinter = new AInfoFiscalPrinter(dialogActionListener,
            Env.createWindowNo(this),
            Msg.parseTranslation(Env.getCtx(), "@PrintingFiscalDocument@"));


    /**
     * Thread that perform fiscal print operation
     */
    private final class FiscalPrintWorker extends SwingWorker
    {
        private final MInvoice invoice;

        private FiscalPrintWorker(final MInvoice invoice)
        {
            this.invoice = invoice;
        }

        @Override
        public Object construct()
        {
            int c_DocType_ID = invoice.getC_DocType_ID();
            boolean success = LAR_Utils.isFiscalDocType(c_DocType_ID);
            if (success) {
                try {
                    MDocType docType = new MDocType(p_ctx, c_DocType_ID, null);
                    int lar_Fiscal_Printer_ID = docType.get_ValueAsInt("LAR_Fiscal_Printer_ID");
                    FiscalDocumentPrint fdp = new FiscalDocumentPrint(lar_Fiscal_Printer_ID,
                            infoFiscalPrinter);
                    fdp.printDocument(invoice);
                } catch (Exception e) {
                    log.log(Level.SEVERE, "Fiscal printing error", e);
                    success = false;
                }
            }
            return Boolean.valueOf(success);
        }
        @Override
        public void finished() {
            boolean success = (Boolean) getValue();
//            boolean fiscalPrintError = errorMsg != null && errorMsg.equals(FISCAL_PRINT_ERROR);
            if(success) {
                p_posPanel.newOrder();
//            } else if (!fiscalPrintError) {
//                if(errorDesc == null)
//                    errorMsg(errorMsg);
//                else
//                    errorMsg(errorMsg, errorDesc);
//                //waitingDialog.doNotWait();
//                //waitingDialog.setVisible(false);
//                //getFrame().setEnabled(true);
//            }
//            if (!fiscalPrintError) {
//                getFrame().setBusy(false);
//                mNormal();
            }
        }
    }

    /**
     * Invoca la anulación de los documentos generados debido a un error en la
     * impresión fiscal
     */
    private void voidDocuments()
    {
        SwingWorker worker = new SwingWorker()
        {
            private String errorMsg = null;

            @Override
            public Object construct()
            {
                // --- LY code ---
//                try {
//                    InvoiceGlobalVoiding voidingProcess = new InvoiceGlobalVoiding(
//                            invoice.getC_Invoice_ID(), getCtx(), trxName);
//                    voidingProcess.start();
//                } catch (AdempierePOSException e) {
//                    errorMsg = e.getMessage();
//                }

                // TODO - Assume that a pos order has only one invoice
                final MInvoice invoice = p_posPanel.m_order.getInvoices()[0];
                boolean success = invoice.voidIt();
                if (!success) {
                    errorMsg = Msg.parseTranslation(Env.getCtx(), "@ErrorVoidingInvoice@");
                }
                return Boolean.valueOf(success);
            }

            @Override
            public void finished()
            {
                boolean success = (Boolean) getValue();
                if (!success) {
                    int windowNo = Env.createWindowNo(PosSubPanel.this);
                    ADialog.error(windowNo, PosSubPanel.this, errorMsg);

                    if (ADialog.ask(windowNo, PosSubPanel.this,
                            Msg.parseTranslation(p_ctx, "@RetryVoidInvoice@"))) {
                        // Re intenta anular los documentos.
                        voidDocuments();
                    } else {
                        p_posPanel.newOrder();
                        //getFrame().setBusy(false);
                        //mNormal();
                    }
                } else {
                    p_posPanel.newOrder();
//                    getFrame().setBusy(false);
//                    mNormal();
//                    getStatusBar().setStatusLine(MSG_VOID_INVOICE_OK);
                }
            }
        }; // new SwingWorker

//        String waitMsg = getMsg("VoidingInvoice") + ", " + getMsg("PleaseWait");
//        getFrame().setBusyMessage(waitMsg);
//        getFrame().setBusyTimer(4);
//        getFrame().setBusy(true);
        worker.start();
    }
}	//	PosSubPanel
