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

import java.awt.BorderLayout;
import java.awt.Cursor;
import java.awt.Dimension;
import java.awt.KeyboardFocusManager;
import java.awt.MouseInfo;
import java.awt.PointerInfo;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Properties;
import java.util.logging.Level;

import javax.swing.JFrame;
import javax.swing.JOptionPane;

import net.miginfocom.swing.MigLayout;

import org.compiere.apps.ADialog;
import org.compiere.apps.SwingWorker;
import org.compiere.apps.form.FormFrame;
import org.compiere.model.MDocType;
import org.compiere.model.MInvoice;
import org.compiere.model.MPOS;
import org.compiere.swing.CPanel;
import org.compiere.util.CLogger;
import org.compiere.util.Env;
import org.compiere.util.Msg;

import ar.com.ergio.model.FiscalDocumentPrint;
import ar.com.ergio.print.fiscal.view.AInfoFiscalPrinter;
import ar.com.ergio.print.fiscal.view.AInfoFiscalPrinter.DialogActionListener;
import ar.com.ergio.util.LAR_Utils;

/**
 *	Point of Sales Main Window.
 *
 *  @author Comunidad de Desarrollo OpenXpertya
 *         *Basado en Codigo Original Modificado, Revisado y Optimizado de:
 *         *Copyright (c) Jorg Janke
 *  @version $Id: PosPanel.java,v 1.10 2004/07/12 04:10:04 jjanke Exp $
 */
public class PosBasePanel extends CPanel
	//implements FormPanel
{

	/**
	 *
	 */
	private static final long serialVersionUID = -3010214392188209281L;
	// TODO - Review transaction usage
	private String trxName = null; //Trx.createTrxName("GUIPOSTesting_"); --red1 won't persist trx for recall in display
	//trxName for not committing test so tests does not impact DB.. temporary halt due to above issue.
	/**
	 * 	Constructor - see init
	 */
	public PosBasePanel()
	{
		super (new MigLayout(" fill","[560!]10[300:350:, fill]",""));
		originalKeyboardFocusManager = KeyboardFocusManager.getCurrentKeyboardFocusManager();
		m_focusMgr = new PosKeyboardFocusManager();
		KeyboardFocusManager.setCurrentKeyboardFocusManager(m_focusMgr);
	}	//	PosPanel

	/**	Window No			*/
	private int         	m_WindowNo = 0;
	/**	FormFrame			*/
	private FormFrame 		m_frame;
	/**	Logger				*/
	private CLogger			log = CLogger.getCLogger(getClass());
	/** Context				*/
	private Properties		m_ctx = Env.getCtx();
	/** Sales Rep 			*/
	private int				m_SalesRep_ID = 0;
	/** POS Model			*/
	protected MPOS			p_pos = null;
	/** Keyoard Focus Manager		*/
	private PosKeyboardFocusManager	m_focusMgr = null;

	/** Order Panel				*/
	protected SubOrder 		f_order;
	/** Current Line				*/
	protected SubCurrentLine 	f_curLine;
	/** Function Keys				*/
	protected SubFunctionKeys 	f_functionKeys;

	protected CashSubFunctions 	f_cashfunctions;

	private javax.swing.Timer logoutTimer;


	PosOrderModel m_order = null;

	//	Today's (login) date		*/
	private Timestamp			m_today = Env.getContextAsDate(m_ctx, "#Date");

	private KeyboardFocusManager originalKeyboardFocusManager;
	private boolean debug = true;
	private HashMap<Integer, POSKeyboard> keyboards = new HashMap<Integer, POSKeyboard>();
    /** LAR - fiscal printer control window */
	protected AInfoFiscalPrinter infoFiscalPrinter;
    private boolean printed = false;


	public String getTrxName(){
		return trxName;
	}
	/**
	 *	Initialize Panel
	 *  @param WindowNo window
	 *  @param frame parent frame
	 */
	public void init (int WindowNo, FormFrame frame)
	{
	    m_frame = frame;
	    m_frame.setJMenuBar(null);
		if ( debug )
			m_frame.setPreferredSize(new Dimension(1024,768));
		else
		{
			m_frame.setExtendedState(JFrame.MAXIMIZED_BOTH);
			m_frame.setResizable(false);
		}

		m_SalesRep_ID = Env.getAD_User_ID(m_ctx);
		log.info("init - SalesRep_ID=" + m_SalesRep_ID);
		m_WindowNo = WindowNo;
		//
		try
		{
			if (!dynInit())
			{
				dispose();
				frame.dispose();
				return;
			}
			m_frame.getContentPane().add(this, BorderLayout.CENTER);
		}
		catch(Exception e)
		{
			log.log(Level.SEVERE, "init", e);
		}
		log.config( "PosPanel.init - " + getPreferredSize());

		if ( p_pos.getAutoLogoutDelay() > 0 && logoutTimer == null )
		{
			logoutTimer = new javax.swing.Timer(1000, new ActionListener() {

				PointerInfo pi = null;
				long lastMouseMove  = System.currentTimeMillis();
				long lastKeyboardEvent = System.currentTimeMillis();

				@Override
				public void actionPerformed(ActionEvent e)
				{
					long now = e.getWhen();
					PointerInfo newPi = MouseInfo.getPointerInfo();
					// mouse moved
					if ( newPi != null && pi != null
							&& !pi.getLocation().equals(newPi.getLocation()) )
					{
						lastMouseMove = now;
					}
					pi = newPi;

					lastKeyboardEvent = m_focusMgr.getLastWhen();

					if ( p_pos.getAutoLogoutDelay()*1000 < now - Math.max(lastKeyboardEvent, lastMouseMove) )
					{
					//	new PosLogin(this);
					}
				}
			});
			logoutTimer.start();
		}
		m_focusMgr.start();

	}	//	init

	/**
	 * 	Dispose - Free Resources
	 */
	public void dispose()
	{
		keyboards.clear();
		keyboards = null;
		if ( logoutTimer != null )
			logoutTimer.stop();
		logoutTimer = null;

		if (m_focusMgr != null)
			m_focusMgr.stop();
		m_focusMgr = null;
		KeyboardFocusManager.setCurrentKeyboardFocusManager(originalKeyboardFocusManager);
		//
		if (f_order != null)
			f_order.dispose();
		f_order = null;
		if (f_curLine != null)
		{
			// if ( m_order != null )
			// 	m_order.deleteOrder();
			f_curLine.dispose();
		}
		f_curLine = null;
		if (f_functionKeys != null)
			f_functionKeys.dispose();
		f_functionKeys = null;

		if (f_cashfunctions != null)
			f_cashfunctions.dispose();
		f_cashfunctions = null;
		if (m_frame != null)
			m_frame.dispose();
		m_frame = null;
		m_ctx = null;
		infoFiscalPrinter = null;
	}	//	dispose


	/**************************************************************************
	 * 	Dynamic Init.
	 * 	PosPanel has a GridBagLayout.
	 * 	The Sub Panels return their position
	 */
	private boolean dynInit()
	{
		if (!setMPOS())
			return false;
		m_frame.setTitle("Adempiere POS: " + p_pos.getName());
		//	Create Sub Panels
		f_order = new SubOrder (this);
		add (f_order, "split 2, flowy, growx, spany");
		//
		f_curLine = new SubCurrentLine (this);
		add (f_curLine, "h 300, growx, growy, gaptop 10");

		f_functionKeys = new SubFunctionKeys (this);
		add (f_functionKeys, "aligny top, h 500, growx, growy, flowy, split 2");

		// LAR - Fiscal printer implementation
		createInfoFiscalPrinter();

		return true;
	}	//	dynInit

	/**
	 * 	Set MPOS
	 *	@return true if found/set
	 */
	private boolean setMPOS()
	{
		MPOS[] poss = null;
		if (m_SalesRep_ID == 100)	//	superUser
			poss = getPOSs (0);
		else
			poss = getPOSs (m_SalesRep_ID);
		//
		if (poss.length == 0)
		{
			ADialog.error(m_WindowNo, m_frame, "NoPOSForUser");
			return false;
		}
		else if (poss.length == 1)
		{
			p_pos = poss[0];
			return true;
		}

		//	Select POS
		String msg = Msg.getMsg(m_ctx, "SelectPOS");
		String title = Env.getHeader(m_ctx, m_WindowNo);
		Object selection = JOptionPane.showInputDialog(m_frame, msg, title,
			JOptionPane.QUESTION_MESSAGE, null, poss, poss[0]);
		if (selection != null)
		{
			p_pos = (MPOS)selection;
			return true;
		}
		return false;
	}	//	setMPOS

	/**
	 * 	Get POSs for specific Sales Rep or all
	 *	@param SalesRep_ID
	 *	@return array of POS
	 */
	private MPOS[] getPOSs (int SalesRep_ID)
	{
		String pass_field = "SalesRep_ID";
		int pass_ID = SalesRep_ID;
		if (SalesRep_ID==0)
			{
			pass_field = "AD_Client_ID";
			pass_ID = Env.getAD_Client_ID(m_ctx);
			}
		return MPOS.getAll(m_ctx, pass_field, pass_ID);
	}	//	getPOSs

	/**************************************************************************
	 * 	Get Today's date
	 *	@return date
	 */
	public Timestamp getToday()
	{
		return m_today;
	}	//	getToday

	/**
	 * 	New Order
	 *
	 */
	public void newOrder()
	{
		log.info( "PosPanel.newOrder");
		f_order.setC_BPartner_ID(0);
		m_order = null;
		// TODO - Review: avoid create an order with default BPartner
		//m_order = PosOrderModel.createOrder(p_pos, f_order.getBPartner(), trxName);
		f_curLine.newLine();
		f_order.f_Order_ID.requestFocusInWindow();
		updateInfo();
		// LAR - Fiscal printer implementation
        infoFiscalPrinter.setVisible(false);
        infoFiscalPrinter.clearDetail();
	}	//	newOrder

    /**
     * Loads an order into POS
     *
     * @param c_Order_ID order id
     */
    public void loadOrder(int c_Order_ID)
    {
        log.info(String.format("C_Order_ID: %d", c_Order_ID));
        m_order = new PosOrderModel(m_ctx, c_Order_ID, trxName, p_pos);
        updateInfo();
    } // loadOrder

	/**
	 * Get the number of the window for the function calls that it needs
	 *
	 * @return the window number
	 */
	public int getWindowNo()
	{
		return m_WindowNo;
	}

	/**
	 * Get the properties for the process calls that it needs
	 *
	 * @return getProperties m_ctx
	 */
	public Properties getCtx()
	{
		return m_ctx;
	}

	public void updateInfo()
	{
		// reload order
		if (m_order != null) {
			m_order.reload();
		}
		if (f_curLine != null) {
			f_curLine.updateTable(m_order);
		}
		if (f_order != null) {
			f_order.updateOrder();
		}
	}

	/**
	 * @param m_c_order_id
	 */
	public void setOldOrder(int m_c_order_id)
	{
		if ( m_order != null )
			m_order.deleteOrder();

		if ( m_c_order_id == 0 )
			m_order = null;
		else
			m_order = new PosOrderModel(m_ctx , m_c_order_id, trxName, p_pos);
		updateInfo();
	}

	/**
	 * @param m_c_order_id
	 */
	public void setOrder(int m_c_order_id)
	{
		if ( m_c_order_id == 0 )
			m_order = null;
		else
			m_order = new PosOrderModel(m_ctx , m_c_order_id, trxName, p_pos);
	}

	public POSKeyboard getKeyboard(int keyLayoutId) {
		if ( keyboards.containsKey(keyLayoutId) )
			return keyboards.get(keyLayoutId);
		else
		{
			POSKeyboard keyboard = new POSKeyboard(this, keyLayoutId);
			keyboards.put(keyLayoutId, keyboard);
			return keyboard;
		}
	}

    /**********************************************************************************************
     *                            LAR Fiscal Printing Implementation
     **********************************************************************************************/

	protected boolean printFiscalTicket() {
        final MInvoice invoice = m_order.getInvoices()[0];
        log.info("Printing ticket for " + invoice);

        final SwingWorker worker = new SwingWorker() {
            @Override
            public Object construct()
            {
                int c_DocType_ID = invoice.getC_DocType_ID();
                boolean success = LAR_Utils.isFiscalDocType(c_DocType_ID);
                if (success) {
                    try {
                        final MDocType docType = new MDocType(m_ctx, c_DocType_ID, null);
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
                log.info("Finish fiscal printing thread");
                printed = (Boolean) getValue();
//                boolean fiscalPrintError = errorMsg != null && errorMsg.equals(FISCAL_PRINT_ERROR);
                if (printed) {
                    newOrder();
//                } else if (!fiscalPrintError) {
//                    if(errorDesc == null)
//                        errorMsg(errorMsg);
//                    else
//                        errorMsg(errorMsg, errorDesc);
//                    //waitingDialog.doNotWait();
//                    //waitingDialog.setVisible(false);
//                    //getFrame().setEnabled(true);
//                }
//                if (!fiscalPrintError) {
//                    getFrame().setBusy(false);
//                    mNormal();
                    m_frame.setBusy(false);
                    m_frame.setCursor(Cursor.getDefaultCursor());
                }
            }
        };

        m_frame.setCursor(new Cursor(Cursor.WAIT_CURSOR));
        String waitMsg = Msg.getMsg(m_ctx, "PrintingTicket") + ", " + Msg.getMsg(m_ctx, "PleaseWait");
        m_frame.setBusyMessage(waitMsg);
        m_frame.setBusyTimer(4);
        m_frame.setBusy(true);

        worker.start();

        infoFiscalPrinter.setVisible(true); // Thread stops here until fiscal printing finished

        return isPrinted();

	} // printFiscalTicket

	private boolean isPrinted() {
	    return printed;
	}

    private void createInfoFiscalPrinter()
    {
        // Fiscal printing action listener
        final DialogActionListener dialogActionListener = new DialogActionListener()
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
                newOrder();
                m_frame.setBusy(false);
                m_frame.setCursor(Cursor.getDefaultCursor());
            }
        };

        // Fiscal Printing status window
        infoFiscalPrinter = new AInfoFiscalPrinter(dialogActionListener,
                getWindowNo(), Msg.parseTranslation(Env.getCtx(), "@PrintingFiscalDocument@"));
        log.info("info fiscal printer windows created");

        infoFiscalPrinter.setReprintButtonActive(true);
        infoFiscalPrinter.setVoidButtonActive(true);
        infoFiscalPrinter.setOkButtonActive(false);
    }

    /**
     * Invoca la anulación de los documentos generados debido a un error en la
     * impresión fiscal
     */
    void voidDocuments() // TODO - Review visibility for this method
    {
        SwingWorker worker = new SwingWorker()
        {
            private String errorMsg = null;

            @Override
            public Object construct()
            {
                // TODO - Assume that a pos order has only one invoice
                final MInvoice invoice = m_order.getInvoices()[0];
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
                    ADialog.error(getWindowNo(), PosBasePanel.this, errorMsg);

                    if (ADialog.ask(getWindowNo(), PosBasePanel.this,
                            Msg.parseTranslation(m_ctx, "@RetryVoidInvoice@"))) {
                        // Re intenta anular los documentos.
                        voidDocuments();
                    } else {
                        newOrder();
                        m_frame.setBusy(false);
                        m_frame.setCursor(Cursor.getDefaultCursor());
                    }
                } else {
                    newOrder();
                    m_frame.setBusy(false);
                    m_frame.setCursor(Cursor.getDefaultCursor());
//                    getStatusBar().setStatusLine(MSG_VOID_INVOICE_OK);
                }
            }
        }; // new SwingWorker

        String waitMsg = Msg.getMsg(m_ctx, "VoidingInvoice") + ", " + Msg.getMsg(m_ctx, "PleaseWait");
        m_frame.setBusyMessage(waitMsg);
        m_frame.setBusyTimer(4);
        m_frame.setBusy(true);
        worker.start();
    } // voidDocuments

}	//	PosPanel

