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

import java.util.logging.Level;

import javax.swing.JOptionPane;

import org.compiere.apps.SwingWorker;
import org.compiere.model.MDocType;
import org.compiere.model.MInvoice;
import org.compiere.process.SvrProcess;
import org.compiere.util.Env;
import org.compiere.util.Msg;

import ar.com.ergio.model.FiscalDocumentPrint;
import ar.com.ergio.print.fiscal.view.AInfoFiscalPrinter;
import ar.com.ergio.print.fiscal.view.AInfoFiscalPrinter.DialogActionListener;
import ar.com.ergio.util.LAR_Utils;

/**
 * Print fiscal ticket for an invoice
 *
 * @author Emiliano Pereyra - http://www.ergio.com.ar
 *
 */
public class InvoiceFiscalPrinting extends SvrProcess
{
    /** Current invoice id */
    private int p_C_Invoice_ID;
    /** Process result message */
    private String m_ResultMsg = "";
    /** Current invoice model object */
    private MInvoice invoice;
    /** Fiscal control dialog */
    private AInfoFiscalPrinter infoFiscalPrinter = new AInfoFiscalPrinter(null,
            "FiscalPrinterControlPanel", "", JOptionPane.INFORMATION_MESSAGE);
    private int m_WindowNo = 2;

    @Override
    protected void prepare()
    {
        p_C_Invoice_ID = getRecord_ID();
        invoice = new MInvoice(getCtx(), p_C_Invoice_ID, get_TrxName());
    }

    ///////////////////////////////////////////////////////////////////////////
    // TODO - Abstract Fiscal Printing behavior in order to avoid
    //        duplicate code with PosBasePanel class
    ///////////////////////////////////////////////////////////////////////////
    @Override
    protected String doIt() throws Exception
    {
        log.info(String.format("Processing invoice %s", invoice));
        // Check if invoice exists and has proper doctype
        if (invoice != null && LAR_Utils.isFiscalDocType(invoice.getC_DocType_ID()))
        {
            createInfoFiscalPrinter();
            printFiscalTicket();
        }
        return m_ResultMsg;
    }

    /**
     * Print invoice into fiscal printer
     *
     * @return true if invoice was printed ok, false otherwise.
     */
    private boolean printFiscalTicket() {

        final SwingWorker worker = new SwingWorker() {
            @Override
            public Object construct()
            {
                boolean success = false;
                {
                    try {
                        final MDocType docType = new MDocType(getCtx(), invoice.getC_DocType_ID(), get_TrxName());
                        int lar_Fiscal_Printer_ID = docType.get_ValueAsInt("LAR_Fiscal_Printer_ID");
                        log.info("doc type asociated " + docType);

                        final FiscalDocumentPrint fdp = new FiscalDocumentPrint(lar_Fiscal_Printer_ID,
                                infoFiscalPrinter, infoFiscalPrinter);
                        log.info("fiscal document print created: " + fdp);

                        infoFiscalPrinter.setFiscalDocumentPrint(fdp);
                        success = fdp.printDocument(invoice);
                    } catch (Exception e) {
                        log.log(Level.SEVERE, "Fiscal printing error", e);
                        success = false;
                    }
                }
                return Boolean.valueOf(success);
            }
            @Override
            public void finished() {
                boolean result = (Boolean) getValue();
                log.info("Finish fiscal printing thread. Printed Ok?: " + result);
                m_ResultMsg = result ? "@Printed@ OK" : "@Printed@ Fail";
            }
        };
        worker.start();
        infoFiscalPrinter.setVisible(true); // Thread stops here until fiscal printing finished

        return (Boolean) worker.get();
    } // printFiscalTicket

    /**
     * Creates fiscal control window
     */
    private void createInfoFiscalPrinter()
    {
        // Fiscal printing action listener
        final DialogActionListener dialogActionListener = new DialogActionListener()
        {
            @Override
            public void actionVoidPerformed()
            {
                invoice.processIt(MInvoice.DOCACTION_Void);
                invoice.saveEx();
            }

            @Override
            public void actionReprintFinished() {}
        };

        // Fiscal Printing status window
        infoFiscalPrinter = new AInfoFiscalPrinter(dialogActionListener, m_WindowNo,
                Msg.parseTranslation(Env.getCtx(), "@PrintingFiscalDocument@"));
        log.info("info fiscal printer windows created");

        infoFiscalPrinter.setReprintButtonActive(true);
        infoFiscalPrinter.setVoidButtonActive(true);
        infoFiscalPrinter.setOkButtonActive(false);
    } //createInfoFiscalPrinter
}
