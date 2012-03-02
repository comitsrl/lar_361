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
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;

import ar.com.ergio.model.FiscalDocumentPrint;
import ar.com.ergio.print.fiscal.action.FiscalCloseAction;
import ar.com.ergio.print.fiscal.action.FiscalPrinterAction;
import ar.com.ergio.print.fiscal.view.AInfoFiscalPrinter;

/**
 * Close fiscal printer
 *
 * @author Emiliano Pereyra - http://www.ergio.com.ar
 *
 */
public class FiscalPrinterClosing extends SvrProcess
{
    /** Current close type */
    private String closeType;
    /** Current fiscal printer id */
    private int lar_Fiscal_Printer_ID;
    /** Fiscal printer action */
    private FiscalPrinterAction currentAction;
    /** Process result message */
    private String resultMsg;
    /** Fiscal control dialog */
    private AInfoFiscalPrinter infoFiscalPrinter = new AInfoFiscalPrinter(null,
            "FiscalPrinterControlPanel", "", JOptionPane.INFORMATION_MESSAGE);

    @Override
    protected void prepare()
    {
        ProcessInfoParameter[] para = getParameter();
        for (int i = 0; i < para.length; i++) {
            String name = para[i].getParameterName();
            if (para[i].getParameter() == null)
                ;
            else if (name.equals("CloseType"))
                closeType = para[i].getParameter().toString();
            else if (name.equals("LAR_Fiscal_Printer_ID"))
                lar_Fiscal_Printer_ID = para[i].getParameterAsInt();
            else
                log.log(Level.SEVERE, "Unknown Parameter: " + name);
        }
    }

    @Override
    protected String doIt() throws Exception
    {
        String msg = String.format("CloseType=%s FiscalPrinter=%d", closeType, lar_Fiscal_Printer_ID);
        log.info(msg);

        try {
            final FiscalDocumentPrint fdp = new FiscalDocumentPrint(lar_Fiscal_Printer_ID);
            fdp.addDocumentPrintListener(infoFiscalPrinter);
            fdp.setPrinterEventListener(infoFiscalPrinter);
            infoFiscalPrinter.setFiscalDocumentPrint(fdp);
            currentAction = new FiscalCloseAction(null, closeType, lar_Fiscal_Printer_ID);
            executeAction();
        } catch (Exception e) {
            log.log(Level.SEVERE, e.getLocalizedMessage(), e);
        }
        return resultMsg;
    }

    private void executeAction()
    {
        SwingWorker worker = new SwingWorker()
        {
            @Override
            public Object construct()
            {
                resultMsg = null;
                if (!currentAction.execute()) {
                    resultMsg = currentAction.getErrorMsg() + ": " + currentAction.getErrorDesc();
                }
                return resultMsg == null;
            }

            @Override
            public void finished()
            {
                boolean success = (Boolean) getValue();
                if (success) {
                    resultMsg = "OK";
                }
                infoFiscalPrinter.setVisible(false);
            }
        };
        worker.start();
        infoFiscalPrinter.setVisible(true);
    }
}
