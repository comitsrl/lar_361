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
import java.awt.Dimension;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.InputMethodEvent;
import java.awt.event.InputMethodListener;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.MessageFormat;
import java.text.NumberFormat;
import java.util.Locale;

import javax.swing.border.TitledBorder;

import org.compiere.apps.AEnv;
import org.compiere.grid.ed.VNumber;
import org.compiere.model.MCash;
import org.compiere.model.MCashBook;
import org.compiere.model.MCashLine;
import org.compiere.model.MInvoice;
import org.compiere.model.MQuery;
import org.compiere.swing.CButton;
import org.compiere.swing.CLabel;
import org.compiere.swing.CPanel;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.DisplayType;
import org.compiere.util.Env;
import org.compiere.util.Language;
import org.compiere.util.Msg;
import org.compiere.util.TimeUtil;

/**
 *  @author Comunidad de Desarrollo OpenXpertya
 *         *Basado en Codigo Original Modificado, Revisado y Optimizado de:
 *         *Jose A.Gonzalez, Conserti.
 *
 *  @version $Id: CashSubFunctions.java,v 0.9 $
 *
 *  @contributor $Id: Consultoria y Soporte en Redes y Tecnologias de la Informacion S.L.
 *
 *  @contributor Emiliano Pereyra - http://www.ergio.com.ar
 *
 */

public class CashSubFunctions extends PosQuery implements ActionListener, InputMethodListener
{
	/**
	 *
	 */
	private static final long serialVersionUID = -7496311215470523905L;

	/**
	 * 	Constructor
	 */
	public CashSubFunctions (PosBasePanel posPanel)
	{
		super(posPanel);
	}	//	PosQueryProduct

	private CButton f_initialChange = null;
	private CButton f_inputsOutputs = null;
	private CButton f_tickets = null;
	private CButton f_closingCash = null;
	private CButton f_cashScrutiny = null;
	private CButton f_pos = null;
	private CPanel buttonPanel;

	// for initial change
	private CPanel cInitial;
	private CLabel l_PreviousChange = null;
	private VNumber v_PreviousChange;
	private CLabel l_change = null;
	private VNumber v_change;
	private CButton f_change = null;

	// for cash scrutiny
	private CPanel cScrutiny;
	private CLabel l_previousBalance = null;
	private VNumber v_previousBalance;
	private CLabel l_ActualBalance = null;
	private VNumber v_ActualBalance;
	private CLabel l_difference = null;
	private VNumber v_difference;
	private CButton f_calculateDifference = null;

	private CPanel 			panel;
	// LAR improvements
    private Locale locale = Language.getLoginLanguage().getLocale();
    private NumberFormat nf = NumberFormat.getInstance(locale);

	/**	Logger			*/
	private static CLogger log = CLogger.getCLogger(SubCheckout.class);

	/**
	 * 	Set up Panel
	 */
	protected void init()
	{
		CPanel main = new CPanel();
		main.setLayout(new BorderLayout(2,6));
		main.setPreferredSize(new Dimension(400,600));
		getContentPane().add(main);
		//	North
		panel = new CPanel(new GridBagLayout());
		main.add (panel, BorderLayout.CENTER);
		panel.setBorder(new TitledBorder(Msg.getMsg(p_ctx, "Cash Functions")));
		GridBagConstraints gbc = new GridBagConstraints();
		//
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.anchor = GridBagConstraints.CENTER;
		gbc.weightx = .3;
		gbc.weighty = 0.05;


		//********************  Main buttons **********************************

		f_initialChange = createButtonAction("InitialChange", null);
		f_initialChange.setMaximumSize(new Dimension(160,35));
		f_initialChange.setMinimumSize(new Dimension(160,35));
		f_initialChange.setPreferredSize(new Dimension(160,35));
		panel.add (f_initialChange, gbc);
		//
		f_closingCash = createButtonAction("CashClosing", null);
		f_closingCash.setPreferredSize(new Dimension(160,35));
		f_closingCash.setMaximumSize(new Dimension(160,35));
		f_closingCash.setMinimumSize(new Dimension(160,35));
		gbc.gridy = 1;
		panel.add (f_closingCash, gbc);
		//
		f_cashScrutiny = createButtonAction("CashScrutiny", null);
		f_cashScrutiny.setPreferredSize(new Dimension(160,35));
		f_cashScrutiny.setMaximumSize(new Dimension(160,35));
		f_cashScrutiny.setMinimumSize(new Dimension(160,35));
		gbc.gridy = 2;
		panel.add (f_cashScrutiny, gbc);
		//
		f_inputsOutputs = createButtonAction("InputsOutputs", null);
		f_inputsOutputs.setPreferredSize(new Dimension(160,35));
		f_inputsOutputs.setMaximumSize(new Dimension(160,35));
		f_inputsOutputs.setMinimumSize(new Dimension(160,35));
		gbc.gridy = 3;
		panel.add (f_inputsOutputs, gbc);
		//
		f_tickets = createButtonAction("Tickets", null);
		f_tickets.setPreferredSize(new Dimension(160,35));
		f_tickets.setMaximumSize(new Dimension(160,35));
		f_tickets.setMinimumSize(new Dimension(160,35));
		gbc.gridy = 4;
		panel.add (f_tickets, gbc);
		//
		f_pos = createButtonAction("End", null);
		f_pos.setPreferredSize(new Dimension(160,35));
		f_pos.setMaximumSize(new Dimension(160,35));
		f_pos.setMinimumSize(new Dimension(160,35));
		gbc.gridy = 5;
		panel.add (f_pos, gbc);

		//*************************** Panel to put buttons *************************
		gbc.gridx = 1;
		gbc.anchor = GridBagConstraints.WEST;
		gbc.gridy = 0;
		gbc.gridheight = 5;

		buttonPanel = new CPanel(new GridBagLayout());
		buttonPanel.setBorder(new TitledBorder(""));
		buttonPanel.setMaximumSize(new Dimension(300,400));
		buttonPanel.setMinimumSize(new Dimension(300,400));
		buttonPanel.setPreferredSize(new Dimension(300,400));
		panel.add (buttonPanel, gbc);

		//*************************** Panel for initial change *************************
		gbc.gridx = 1;
		gbc.anchor = GridBagConstraints.WEST;
		gbc.gridy = 0;
		gbc.gridheight = 5;
		cInitial = new CPanel(new GridBagLayout());
		cInitial.setBorder(new TitledBorder(Msg.getMsg(p_ctx, "InitialChange")));
		cInitial.setVisible(false);
		panel.add (cInitial, gbc);
		GridBagConstraints gbc0 = new GridBagConstraints();
		gbc0.anchor = GridBagConstraints.CENTER;
		//
		gbc0.gridx = 0;
		gbc0.gridy = 0;
		l_PreviousChange = new CLabel(Msg.getMsg(p_ctx, "PreviousChange"));
		cInitial.add (l_PreviousChange, gbc0);

		gbc0.gridx = 1;
		v_PreviousChange = new VNumber("PreviousChange", false, true, false, DisplayType.Amount, "PreviousChange");
		v_PreviousChange.setColumns(10, 25);
		cInitial.add(v_PreviousChange, gbc0);
		v_PreviousChange.setValue(Env.ZERO);
		//
		gbc0.gridx = 0;
		gbc0.gridy = 1;
		l_change = new CLabel(Msg.getMsg(p_ctx, "InitialChange"));
		cInitial.add (l_change, gbc0);

		gbc0.gridx = 1;
		v_change = new VNumber("Change", false, false, true, DisplayType.Amount, "Change");
		v_change.setColumns(10, 25);
		cInitial.add(v_change, gbc0);
		v_change.setValue(Env.ZERO);

		gbc0.gridy = 2;
		gbc0.gridx = 0;
		gbc0.gridwidth = 2;
		//gbc0.fill = GridBagConstraints.HORIZONTAL;
		f_change = createButtonAction("SaveChange", null);
		f_change.setText("Save Change");
		f_change.setPreferredSize(new Dimension(160,35));
		f_change.setMaximumSize(new Dimension(160,35));
		f_change.setMinimumSize(new Dimension(160,35));
		cInitial.add (f_change, gbc0);

		cInitial.setMaximumSize(new Dimension(300,400));
		cInitial.setMinimumSize(new Dimension(300,400));
		cInitial.setPreferredSize(new Dimension(300,400));


		//******************************  Panel for cash scrutiniy ************************
		gbc.gridx = 1;
		gbc.anchor = GridBagConstraints.WEST;
		gbc.gridy = 0;
		gbc.gridheight = 5;

	//	gbc.weightx = .7;

		cScrutiny = new CPanel(new GridBagLayout());
		cScrutiny.setBorder(new TitledBorder(Msg.getMsg(p_ctx, "CashScrutiny")));
		cScrutiny.setVisible(false);
		panel.add (cScrutiny, gbc);
		GridBagConstraints gbc1 = new GridBagConstraints();
		gbc1.anchor = GridBagConstraints.CENTER;

		//
		gbc1.gridx = 0;
		gbc1.gridy = 0;
		l_previousBalance = new CLabel(Msg.getMsg(p_ctx, "PreviousBalance"));
		cScrutiny.add (l_previousBalance, gbc1);

		gbc1.gridx = 1;
		v_previousBalance = new VNumber("PreviousBalance", false, true, false, DisplayType.Amount, "PreviousBalance");
		v_previousBalance.setColumns(10, 25);
		cScrutiny.add(v_previousBalance, gbc1);
		v_previousBalance.setValue(Env.ZERO);

		//
		gbc1.gridx = 0;
		gbc1.gridy = 1;
		l_ActualBalance = new CLabel("Actual Balance");
		cScrutiny.add (l_ActualBalance, gbc1);

		gbc1.gridx = 1;
		v_ActualBalance = new VNumber("ActualBalance", false, false, true, DisplayType.Amount, "ActualBalance");
		v_ActualBalance.setColumns(10, 25);
		v_ActualBalance.addActionListener(this);
		v_ActualBalance.addInputMethodListener(this);
		cScrutiny.add(v_ActualBalance, gbc1);
		v_ActualBalance.setValue(Env.ZERO);

		//
		gbc1.gridx = 0;
		gbc1.gridy = 2;
		l_difference = new CLabel(Msg.getMsg(p_ctx, "Difference"));
		cScrutiny.add (l_difference, gbc1);

		gbc1.gridx = 1;
		v_difference = new VNumber("Difference", false, true, false, DisplayType.Amount, "Difference");
		v_difference.setColumns(10, 25);
		cScrutiny.add(v_difference, gbc1);
		v_difference.setValue(Env.ZERO);

		//
		gbc1.gridx = 0;
		gbc1.gridy = 4;
		gbc1.gridwidth = 2;
		gbc1.fill = GridBagConstraints.HORIZONTAL;
		f_calculateDifference = createButtonAction("AnnotateDifference", null);
		f_calculateDifference.setText("Annotate Difference");
		f_calculateDifference.setPreferredSize(new Dimension(160,35));
		f_calculateDifference.setMaximumSize(new Dimension(160,35));
		f_calculateDifference.setMinimumSize(new Dimension(160,35));
		cScrutiny.add (f_calculateDifference, gbc1);

		cScrutiny.setMaximumSize(new Dimension(300,400));
		cScrutiny.setMinimumSize(new Dimension(300,400));
		cScrutiny.setPreferredSize(new Dimension(400,400));
	}	//	init


	/**
	 * 	Dispose
	 */
	public void dispose()
	{
		removeAll();
		panel = null;
		centerScroll = null;
		confirm = null;
		setVisible(false);
		super.dispose();
	}	//	dispose

	/**
	 * 	Action Listener
	 *	@param e event
	 */
	public void actionPerformed (ActionEvent e)
	{
		String action = e.getActionCommand();
		if (action == null || action.length() == 0)
			return;
		log.info("actionPerformed: " + action);

		//	to display panel with initial change
		if (action.equals("InitialChange"))
		{
			cmd_displayInitialChange();
		}
		//  to display panel with cash closing
		else if (action.equals("CashClosing"))
		{
		    dispose();
			Timestamp today = TimeUtil.getDay(System.currentTimeMillis());

			MCash cash = MCash.get(p_ctx, p_pos.getC_CashBook_ID(), today, null);

			MQuery query = new MQuery(MCash.Table_Name);
			query.addRestriction("C_Cash_ID", MQuery.EQUAL, cash.getC_Cash_ID());
			AEnv.zoom(query);
		}
		//	to open window with inputs and outputs of cash
		else if (action.equals("InputsOutputs"))
		{
		    dispose();
			Timestamp today = TimeUtil.getDay(System.currentTimeMillis());

			MCash cash = MCash.get(p_ctx, p_pos.getC_CashBook_ID(), today, null);

			AEnv.zoom(MCash.Table_ID, cash.getC_Cash_ID());
		}
		else if (action.equals("Tickets"))
		{
		    cmd_displayTickets();
		}
		//	Cash (Payment)
		else if (action.equals("CashScrutiny"))
		{
			cmd_displayCashScrutiny();
		}
		else if (action.equals("End"))
		{
			dispose();
		}
		else if (action.equals("SaveChange"))
		{
			cmd_saveChange();
		}
		else if (action.equals("AnnotateDifference"))
		{
			cmd_calculateDifference();
			cmd_annotateDifference();
		}
		else if (e.getSource() == v_ActualBalance)
			cmd_calculateDifference();

	}	//	actionPerformed

	/**
	 * Desplegar panel de Cambio Inicial
	 *
	 * @author Comunidad de Desarrollo OpenXpertya
	 *         *Basado en Codigo Original Modificado, Revisado y Optimizado de:
	 *         *Copyright (c) ConSerTi
	 */
	private void cmd_displayInitialChange()
	{
        if (cScrutiny.isVisible())
            cScrutiny.setVisible(false);
        if (buttonPanel.isVisible())
            buttonPanel.setVisible(false);
        cInitial.setVisible(true);

		Timestamp today = TimeUtil.getDay(System.currentTimeMillis());

		MCash cash = MCash.get(p_ctx, p_pos.getC_CashBook_ID(), today, null);

		if (cash != null)
		{
			v_PreviousChange.setValue(cash.getEndingBalance());
			v_change.setValue(cash.getEndingBalance());
		}
		else
			log.severe("No Cash");
	}

	/**
	 * Desplegar panel de Scrutiny de caja
	 *
	 * @author Comunidad de Desarrollo OpenXpertya
	 *         *Basado en Codigo Original Modificado, Revisado y Optimizado de:
 	 *         *Copyright (c) ConSerTi
	 */
	private void cmd_displayCashScrutiny()
	{
		if (cInitial.isVisible())
			cInitial.setVisible(false);
		if (buttonPanel.isVisible())
			buttonPanel.setVisible(false);
		cScrutiny.setVisible(true);

		// calculate total until the moment and shows it in scrutiny panel
		Timestamp today = TimeUtil.getDay(System.currentTimeMillis());

		MCash cash = MCash.get(p_ctx, p_pos.getC_CashBook_ID(), today, null);

		v_previousBalance.setValue(cash.getEndingBalance());

	}

	private void cmd_displayTickets()
	{
	    String sql = "SELECT C_DocTypeInvoice_ID FROM C_DocType WHERE C_DocType_ID=?";
	    int c_DocTypeInvoice_ID = DB.getSQLValue(null, sql, p_pos.getC_DocType_ID());
        MQuery query = new MQuery(MInvoice.Table_Name);
        query.addRestriction("C_DocType_ID", MQuery.EQUAL, c_DocTypeInvoice_ID);
        AEnv.zoom(query);
        dispose();
	}
	/**
	 * Save the initial change of the cash
	 *
	 * @author Comunidad de Desarrollo OpenXpertya
	 *         *Basado en Codigo Original Modificado, Revisado y Optimizado de:
	 *         *Copyright (c) ConSerTi
	 */
	private void cmd_saveChange()
	{
		Timestamp today = TimeUtil.getDay(System.currentTimeMillis());

		MCash cash = MCash.get(p_ctx, p_pos.getC_CashBook_ID(), today, null);

		BigDecimal initialChange = (BigDecimal)v_change.getValue();

		if (cash != null && cash.get_ID() != 0 && initialChange.compareTo(cash.getEndingBalance()) != 0)
		{
		    // Prepare localized message with arguments > "Initial Change Before: {0} Now {1}"
            MessageFormat mf = new MessageFormat(Msg.getMsg(p_ctx, "InitialChangeBefore"), locale);
            Object[] args = {nf.format(cash.getEndingBalance()), nf.format(initialChange) }; // {0}, {1}
            String description = mf.format(args);

			MCashLine cl = new MCashLine (cash);
			cl.setCashType(MCashLine.CASHTYPE_Difference);
			cl.setAmount(initialChange.subtract(cash.getEndingBalance()));
			cl.setDescription(description);
			cl.save();
		}
		v_PreviousChange.setValue(initialChange);
	}

	/**
	 * Calculate difference between previous balance and actual
	 * for cash scrutiny
	 *
	 * @author Comunidad de Desarrollo OpenXpertya
	 *         *Basado en Codigo Original Modificado, Revisado y Optimizado de:
	 *         *Copyright (c) ConSerTi
	 */
	private void cmd_calculateDifference()
	{
		// calculate difference between scrutiny of previous and actual balance
		BigDecimal previousValue, actualValue;

		Timestamp today = TimeUtil.getDay(System.currentTimeMillis());
		MCash cash = MCash.get(p_ctx, p_pos.getC_CashBook_ID(), today, null);
		v_previousBalance.setValue(cash.getEndingBalance());
		previousValue = cash.getEndingBalance();

		actualValue = (BigDecimal)v_ActualBalance.getValue();

		v_difference.setValue(actualValue.subtract(previousValue));
	}

	/**
	 * Annotate the difference between previous balance and actual
	 * from cash scrutiny in the cash book
	 *
	 * @author Comunidad de Desarrollo OpenXpertya
	 *         *Basado en Codigo Original Modificado, Revisado y Optimizado de:
	 *         *Copyright (c) ConSerTi
	 */
	private void cmd_annotateDifference()
	{
		// calculate difference from scrutiny between previous and actual balance
		BigDecimal previousValue, actualValue, difference;
		previousValue = (BigDecimal)v_previousBalance.getValue();
		actualValue = (BigDecimal)v_ActualBalance.getValue();

		difference = actualValue.subtract(previousValue);

		MCashBook cashBook = new MCashBook(p_ctx, p_pos.getC_CashBook_ID(), null);
		Timestamp today = TimeUtil.getDay(System.currentTimeMillis());

		MCash cash = MCash.get(p_ctx, cashBook.getC_CashBook_ID(), today, null);

		if (cash != null && cash.get_ID() != 0 && difference.compareTo(cash.getStatementDifference()) != 0)
		{
            // Prepare localized message with arguments > "Cash Scrutiny -> Before: {0} Now {1}"
            MessageFormat mf = new MessageFormat(Msg.getMsg(p_ctx, "CashScrutinyBefore"), locale);
            Object[] args = {nf.format(previousValue), nf.format(actualValue) }; // {0}, {1}
            String description = mf.format(args);

            MCashLine cl = new MCashLine (cash);
			cl.setCashType(MCashLine.CASHTYPE_Difference);
			cl.setAmount(difference);
			cl.setDescription(description);
			cl.save();
		}
		cash = MCash.get(p_ctx, p_pos.getC_CashBook_ID(), today, null);
		v_previousBalance.setValue(cash.getEndingBalance());
		v_ActualBalance.setValue(Env.ZERO);
		v_difference.setValue(Env.ZERO);
	}


	/**
	 * calculate difference in cash scrutiny every time the cursor moves
	 */
	public void caretPositionChanged(InputMethodEvent event)
	{
		cmd_calculateDifference();
	}


	/**
	 * calculate difference between cash scrutiniy each time the actual balance text changes
	 */
	public void inputMethodTextChanged(InputMethodEvent event)
	{
		cmd_calculateDifference();
	}


	@Override
	protected void close() {
	}


	@Override
	protected void enableButtons() {
	}


	@Override
	public void reset() {
	}

}	//	CashSubFunctions
