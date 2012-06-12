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

import org.compiere.apps.AppsAction;
import org.compiere.model.MInvoice;
import org.compiere.model.MOrder;
import org.compiere.model.MPOS;
import org.compiere.print.ReportCtl;
import org.compiere.print.ReportEngine;
import org.compiere.swing.CButton;
import org.compiere.swing.CPanel;
import org.compiere.util.CLogger;
import org.compiere.util.Env;

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
            final MInvoice invoice = p_posPanel.m_order.getInvoices()[0];
            int C_DocType_ID = invoice.getC_DocType_ID();
            if (LAR_Utils.isFiscalDocType(C_DocType_ID))
            {
                // LAR Fiscal Printing
                if (!p_posPanel.printFiscalTicket(invoice)) {
                    log.log(Level.SEVERE, "Error in Fiscal Printing Ticket");
                    return;
                }
            }
            else // Print document in tradicinal way
            {
                p_posPanel.newOrder();
                log.info("Printing tradicional document for " + invoice);
                ReportCtl.startDocumentPrint(ReportEngine.INVOICE, invoice.getC_Invoice_ID(), null, Env.getWindowNo(this), false);
                p_posPanel.stopGlassPane();
            }
		}
	}

}	//	PosSubPanel
