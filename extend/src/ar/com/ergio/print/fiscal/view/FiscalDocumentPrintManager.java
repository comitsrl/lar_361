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

import java.util.logging.Level;

import javax.swing.JOptionPane;

import org.compiere.apps.SwingWorker;
import org.compiere.model.MDocType;
import org.compiere.model.PO;
import org.compiere.util.CLogger;
import org.compiere.util.Env;
import org.compiere.util.Msg;

import ar.com.ergio.model.FiscalDocumentPrint;
import ar.com.ergio.print.fiscal.view.AInfoFiscalPrinter.DialogActionListener;

/**
 *
 * @author Emiliano Pereyra - http://www.ergio.com.ar
 *
 */
public abstract class FiscalDocumentPrintManager
{
	/**	Logger */
	protected CLogger log = CLogger.getCLogger (getClass());

	/** Documento a imprimir */
	private PO document;

	private AInfoFiscalPrinter infoFiscalPrinter = new AInfoFiscalPrinter(null,
            "FiscalPrinterControlPanel", "", JOptionPane.INFORMATION_MESSAGE);

	private int m_WindowNo = 2;

	/**
	 *
	 * @param document
	 */
	public FiscalDocumentPrintManager(final PO document)
	{
	    this.document = document;
		createInfoFiscalPrinter();
	}

    /**
     *
     */
    public boolean print() {

        final SwingWorker worker = new SwingWorker() {
            @Override
            public Object construct()
            {
                boolean success = false;
                {
                    try {
                        final MDocType docType = new MDocType(document.getCtx(),
                                document.get_ValueAsInt("C_DocType_ID"), document.get_TrxName());
                        int lar_Fiscal_Printer_ID = docType.get_ValueAsInt("LAR_Fiscal_Printer_ID");

                        final FiscalDocumentPrint fdp = new FiscalDocumentPrint(lar_Fiscal_Printer_ID,
                                infoFiscalPrinter, infoFiscalPrinter);
                        log.info("fiscal document print created: " + fdp);

                        infoFiscalPrinter.setFiscalDocumentPrint(fdp);

                        success = printDocument(fdp);
                    } catch (Exception e) {
                        log.log(Level.SEVERE, "Error en la Impresi\u00f3n Fiscal", e);
                        success = false;
                    }
                }
                return Boolean.valueOf(success);
            }
			@Override
            public void finished() {
                boolean result = (Boolean) getValue();
                log.info("Finaliza impresi\u00f3n fiscal. Impreso correctamente?: " + result);
            }
        };

        worker.start();
        infoFiscalPrinter.setVisible(true); // Thread stops here until fiscal printing finished

        return (Boolean) worker.get();
    } // print

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
                voidDocument();
            }

            @Override
            public void actionReprintFinished() {}
        };

        // Fiscal Printing status window
        infoFiscalPrinter = new AInfoFiscalPrinter(dialogActionListener, m_WindowNo,
                Msg.parseTranslation(Env.getCtx(), "@PrintingFiscalDocument@"));
        log.info("info fiscal printer windows created");

        /* @fchiappano Se comentan botones de acción, obsoletos en el cambio de ejecución de la IF.
        infoFiscalPrinter.setReprintButtonActive(true);
        infoFiscalPrinter.setVoidButtonActive(true);
        infoFiscalPrinter.setOkButtonActive(false); */

    } //createInfoFiscalPrinter

    /**
     *
     * @param fdp
     * @param document
     * @return
     */
    protected abstract boolean printDocument(final FiscalDocumentPrint fdp);

    /**
     *
     */
    protected abstract void voidDocument();
}
