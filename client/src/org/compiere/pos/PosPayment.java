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

import java.awt.Component;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyEvent;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Locale;
import java.util.Properties;
import java.util.logging.Level;

import javax.swing.DefaultComboBoxModel;
import javax.swing.DefaultListCellRenderer;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JTextField;
import javax.swing.KeyStroke;
import javax.swing.ListCellRenderer;
import javax.swing.SwingUtilities;
import javax.swing.border.TitledBorder;

import net.miginfocom.swing.MigLayout;

import org.adempiere.plaf.AdempierePLAF;
import org.compiere.apps.ADialog;
import org.compiere.apps.AppsAction;
import org.compiere.model.MCurrency;
import org.compiere.model.MLookup;
import org.compiere.model.MLookupFactory;
import org.compiere.model.MPOS;
import org.compiere.model.MPOSKey;
import org.compiere.model.MPayment;
import org.compiere.model.MPaymentValidate;
import org.compiere.swing.CButton;
import org.compiere.swing.CComboBox;
import org.compiere.swing.CDialog;
import org.compiere.swing.CLabel;
import org.compiere.swing.CPanel;
import org.compiere.swing.CTextField;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.DisplayType;
import org.compiere.util.Env;
import org.compiere.util.KeyNamePair;
import org.compiere.util.Language;
import org.compiere.util.Msg;
import org.compiere.util.ValueNamePair;

public class PosPayment extends CDialog implements PosKeyListener, ActionListener
{

	private static final long serialVersionUID = 1961106531807910948L;

	// TODO - review this formatter (added by red1)
	//private NumberFormat formatter = new DecimalFormat("#0.00"); //red1 - parser to remove commas or dots separator for above '000s.
	private Locale locale = Language.getLoginLanguage().getLocale();
    private NumberFormat nf = NumberFormat.getInstance(locale);

    /** Logger          */
    private static CLogger log = CLogger.getCLogger(PosPayment.class);

    @Override
	public void actionPerformed(ActionEvent e) {

		if ( e.getSource().equals(fTenderAmt) || e.getSource().equals(fPayAmt) )
		{
			//red1 - remove commas from thousand value
			BigDecimal tender = Env.ZERO;
			BigDecimal pay = Env.ZERO;
		    try
		    {
		      tender = BigDecimal.valueOf(nf.parse(fTenderAmt.getText()).doubleValue());
		      pay =  BigDecimal.valueOf(nf.parse(fPayAmt.getText()).doubleValue());
 		    }
		    catch (ParseException n)
		    {
		      n.printStackTrace();
		    }
			if ( tender.compareTo(Env.ZERO) != 0 )
			{
				fReturnAmt.setValue(tender.subtract(pay));
			}
			return;
		}

		if ( e.getSource().equals(f_bProcess))
		{
			processPayment();
		}
		if ( e.getSource().equals(f_bCancel))
		{
			paid = false;
			dispose();
			return;
		}

		setTotals();
	}

	private void processPayment() {

		try {

			String tenderType = ((ValueNamePair) tenderTypePick.getValue()).getID();
            String tenderAmt = fTenderAmt.getText().equals("") ? "0" : fTenderAmt.getText();
			BigDecimal amt = BigDecimal.valueOf(nf.parse(tenderAmt).doubleValue());
			BigDecimal pay =  BigDecimal.valueOf(nf.parse(fPayAmt.getText()).doubleValue());
			if (amt.compareTo(BigDecimal.ZERO) <= 0)
			    return;
			if (amt.compareTo(pay) > 0)
			{
			    amt = pay;
			}
			if ( tenderType.equals(MPayment.TENDERTYPE_Cash) )
			{
				p_posPanel.m_order.payCash(amt);
                tenderTypePick.removeItem(accountKey);
			}
			else if ( tenderType.equals(MPayment.TENDERTYPE_Check) )
			{
				p_posPanel.m_order.payCheck(amt,fCheckAccountNo.getText(), fCheckRouteNo.getText(), fCheckNo.getText(),
				        fCheckAccountName.getText());
                tenderTypePick.removeItem(accountKey);
			}
			else if ( tenderType.equals(MPayment.TENDERTYPE_CreditCard) )
			{
				String error = null;
				error = MPaymentValidate.validateCreditCardExp(fCCardMonth.getText());
				if ( error != null && !error.isEmpty() )
				{
					ADialog.warn(0, p_posPanel, error);
					return;
				}
				int month = MPaymentValidate.getCreditCardExpMM(fCCardMonth.getText());
				int year = MPaymentValidate.getCreditCardExpYY(fCCardMonth.getText());

				String type = ((ValueNamePair) fCCardType.getSelectedItem()).getValue();
				error = MPaymentValidate.validateCreditCardNumber(fCCardNo.getText(), type);
				if ( error != null && !error.isEmpty() )
				{
					ADialog.warn(0, p_posPanel, error);
					return;
				}
				p_posPanel.m_order.payCreditCard(amt, fCCardName.getText(),
						month, year, fCCardNo.getText(), fCCardVC.getText(), type);
                tenderTypePick.removeItem(accountKey);
			}
			else if ( tenderType.equals(MPayment.TENDERTYPE_Account) )
			{
		        p_posPanel.m_order.setPaidFromAccount();
			}
			else
			{
				ADialog.warn(0, this, "Unsupported payment type");
			}
			//setTotals();
		}
		catch (Exception e )
		{
			ADialog.warn(0, this, "Payment processing failed: " + e.getMessage());
		}
	}

	private PosBasePanel p_posPanel;
	private MPOS p_pos;
	private Properties p_ctx;
	private PosOrderModel p_order;
	private CTextField fTotal = new CTextField(10);
	private CTextField fBalance = new CTextField(10);
	private CComboBox tenderTypePick = new CComboBox();
	private PosTextField fPayAmt;
	private CLabel lPayAmt;
	private CButton f_bProcess;
	private boolean paid = false;
	private BigDecimal balance = Env.ZERO;
	private PosTextField fCheckAccountNo;
	private PosTextField fCheckAccountName;
	private PosTextField fCheckNo;
	private PosTextField fCheckRouteNo;
	private PosTextField fCCardNo;
	private PosTextField fCCardName;
	private CComboBox fCCardType;
	private PosTextField fCCardMonth;
	private PosTextField fCCardVC;

	private CLabel lCheckNo;
	private CLabel lCheckAccountNo;
    private CLabel lCheckAccountName;
	private CLabel lCheckRouteNo;
	private CLabel lCCardNo;
	private CLabel lCCardName;
	private CLabel lCCardType;
	private CLabel lCCardMonth;
	private CLabel lCCardVC;
	private PosTextField fTenderAmt;
	private CLabel lTenderAmt;
	private PosTextField fReturnAmt;
	private CLabel lReturnAmt;
	private CButton f_bCancel;
	private CComboBox fCPaymentTerm = new CComboBox();
	private CLabel lCPaymentTerm;

    private ValueNamePair accountKey;

	public PosPayment(PosBasePanel posPanel) {
		super(Env.getFrame(posPanel),true);
		p_posPanel = posPanel;
		p_pos = posPanel.p_pos;
		p_ctx = p_pos.getCtx();
		p_order = p_posPanel.m_order;
		p_order.clearPayments();
		if ( p_order == null )
			dispose();

		init();
		pack();
		setLocationByPlatform(true);
	}

	private void init() {

		Font font = AdempierePLAF.getFont_Field().deriveFont(18f);

		//	North
		CPanel mainPanel = new CPanel(new MigLayout("hidemode 3",
				"[100:100:300, trailing]20[200:200:300,grow, trailing]"));
		getContentPane().add(mainPanel);

		mainPanel.setBorder(new TitledBorder(Msg.translate(p_ctx, "Payment")));
		CLabel gtLabel = new CLabel(Msg.translate(p_ctx, "GrandTotal"));
		mainPanel.add(gtLabel, "growx");
		mainPanel.add(fTotal, "wrap, growx");
		fTotal.setEditable(false);
		fTotal.setFont(font);
		fTotal.setHorizontalAlignment(JTextField.TRAILING);

		mainPanel.add(new CLabel(Msg.translate(p_ctx, "Balance")), "growx");
		mainPanel.add(fBalance, "wrap, growx");
		fBalance.setEditable(false);
		fBalance.setFont(font);
		fBalance.setHorizontalAlignment(JTextField.TRAILING);


		mainPanel.add(new CLabel(Msg.translate(p_ctx, "TenderType"), "growx"));
		// Payment type selection
		int AD_Column_ID = 8416; //C_Payment_v.TenderType
		MLookup lookup = MLookupFactory.get(Env.getCtx(), 0, 0, AD_Column_ID, DisplayType.List);
		ArrayList<Object> types = lookup.getData(true, false, true, true);

		DefaultComboBoxModel typeModel = new DefaultComboBoxModel(types.toArray());
		tenderTypePick.setModel(typeModel);
		// default to cash payment
		for (Object obj : types)
		{
			if ( obj instanceof ValueNamePair )
			{
				ValueNamePair key = (ValueNamePair) obj;
				if ( key.getID().equals("X")) { // Cash
					tenderTypePick.setSelectedItem(key);
				}

				if (!"CDKXT".contains(key.getID())) {
					tenderTypePick.removeItem(key);
				}

				if ( key.getID().equals("T")) { // Account
                    accountKey = key;
                }

			}
		}

		tenderTypePick.setFont(font);
		tenderTypePick.addActionListener(this);
		tenderTypePick.setName("tenderTypePick"); //red1 for ID purpuse during testing
		tenderTypePick.setRenderer(new ListCellRenderer() {
			protected DefaultListCellRenderer defaultRenderer = new DefaultListCellRenderer();

			public Component getListCellRendererComponent(JList list, Object value,
					int index, boolean isSelected, boolean cellHasFocus) {

				JLabel renderer = (JLabel) defaultRenderer
		        .getListCellRendererComponent(list, value, index, isSelected,
		            cellHasFocus);

				renderer.setPreferredSize(new Dimension(50, 50));
				renderer.setHorizontalAlignment(JLabel.CENTER);

				return renderer;

			}
		});

		mainPanel.add(tenderTypePick, "wrap, h 50!, growx");

        /**
         *  Load Payment Terms
         */
        String sql = "SELECT C_PaymentTerm_ID, Name "
                   + "  FROM C_PaymentTerm "
                   + " WHERE IsActive='Y' AND AD_Client_ID=? ORDER BY Name";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = DB.prepareStatement(sql, null);
            pstmt.setInt(1, Env.getAD_Client_ID(p_ctx));
            rs = pstmt.executeQuery();
            while (rs.next()) {
                int key = rs.getInt(1);
                String name = rs.getString(2);
                KeyNamePair pp = new KeyNamePair(key, name);
                fCPaymentTerm.addItem(pp);
            }
        } catch (SQLException e) {
            log.log(Level.SEVERE, sql, e);
        } finally {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }

        fCPaymentTerm.setFont(font);
        lCPaymentTerm = new CLabel(Msg.translate(p_ctx, "PaymentTerms"));
        mainPanel.add(lCPaymentTerm, "growx");
        mainPanel.add(fCPaymentTerm, "wrap, h 50!, growx");

        fPayAmt = new PosTextField(Msg.translate(p_ctx, "PayAmt"), p_posPanel, p_pos.getOSNP_KeyLayout_ID(),  DisplayType.getNumberFormat(DisplayType.Amount));
		lPayAmt = new CLabel(Msg.translate(p_ctx, "PayAmt"));
        mainPanel.add(lPayAmt, "growx");
		fPayAmt.setFont(font);
		fPayAmt.setEditable(false);
		fPayAmt.setHorizontalAlignment(JTextField.TRAILING);
		fPayAmt.addActionListener(this);
		mainPanel.add(fPayAmt, "wrap, growx");

		fTenderAmt = new PosTextField(Msg.translate(p_ctx, "AmountTendered"), p_posPanel, p_pos.getOSNP_KeyLayout_ID(),  DisplayType.getNumberFormat(DisplayType.Amount));
		lTenderAmt = new CLabel(Msg.translate(p_ctx, "AmountTendered"));
		mainPanel.add(lTenderAmt, "growx");
		fTenderAmt.addActionListener(this);
		fTenderAmt.setFont(font);
		fTenderAmt.setHorizontalAlignment(JTextField.TRAILING);
		mainPanel.add(fTenderAmt, "wrap, growx");

		fReturnAmt = new PosTextField(Msg.translate(p_ctx, "AmountReturned"), p_posPanel, p_pos.getOSNP_KeyLayout_ID(),  DisplayType.getNumberFormat(DisplayType.Amount));
		lReturnAmt = new CLabel(Msg.translate(p_ctx, "AmountReturned"));
		mainPanel.add(lReturnAmt, "growx");
		fReturnAmt.setFont(font);
		fReturnAmt.setHorizontalAlignment(JTextField.TRAILING);
		mainPanel.add(fReturnAmt, "wrap, growx");
		fReturnAmt.setEditable(false);

		fCheckRouteNo = new PosTextField(Msg.translate(p_ctx, "RoutingNo"), p_posPanel, p_pos.getOSNP_KeyLayout_ID());
		lCheckRouteNo = new CLabel(Msg.translate(p_ctx, "RoutingNo"));
		mainPanel.add(lCheckRouteNo, "growx");
		mainPanel.add(fCheckRouteNo, "wrap, growx");
		fCheckRouteNo.setFont(font);
		fCheckRouteNo.setHorizontalAlignment(JTextField.TRAILING);

		fCheckAccountNo = new PosTextField(Msg.translate(p_ctx, "AccountNo"), p_posPanel, p_pos.getOSNP_KeyLayout_ID(),  new DecimalFormat("#"));
		lCheckAccountNo = new CLabel(Msg.translate(p_ctx, "AccountNo"));
		mainPanel.add(lCheckAccountNo, "growx");
		mainPanel.add(fCheckAccountNo, "wrap, growx");
		fCheckAccountNo.setFont(font);
		fCheckAccountNo.setHorizontalAlignment(JTextField.TRAILING);

		fCheckNo = new PosTextField(Msg.translate(p_ctx, "CheckNo"), p_posPanel, p_pos.getOSNP_KeyLayout_ID(),  new DecimalFormat("#"));
		lCheckNo = new CLabel(Msg.translate(p_ctx, "CheckNo"));
		mainPanel.add(lCheckNo, "growx");
		mainPanel.add(fCheckNo, "wrap, growx");
		fCheckNo.setFont(font);
		fCheckNo.setHorizontalAlignment(JTextField.TRAILING);

        fCheckAccountName = new PosTextField(Msg.translate(p_ctx, "A_Name"), p_posPanel, p_pos.getOSNP_KeyLayout_ID());
        lCheckAccountName = new CLabel(Msg.translate(p_ctx, "A_Name"));
        mainPanel.add(lCheckAccountName, "growx");
        mainPanel.add(fCheckAccountName, "wrap, growx");
        fCheckAccountName.setFont(font);
        fCheckAccountName.setHorizontalAlignment(JTextField.TRAILING);

		/**
		 *	Load Credit Cards
		 */
		ValueNamePair[] ccs = p_order.getCreditCards((BigDecimal) fPayAmt.getValue());
		//	Set Selection
		fCCardType = new CComboBox(ccs);
		fCCardType.setName("cardType"); //red1 Id for testing
		fCCardType.setRenderer(new ListCellRenderer() {
			protected DefaultListCellRenderer defaultRenderer = new DefaultListCellRenderer();

			public Component getListCellRendererComponent(JList list, Object value,
					int index, boolean isSelected, boolean cellHasFocus) {

				JLabel renderer = (JLabel) defaultRenderer
		        .getListCellRendererComponent(list, value, index, isSelected,
		            cellHasFocus);

				renderer.setPreferredSize(new Dimension(50, 50));
				renderer.setHorizontalAlignment(JLabel.CENTER);

				return renderer;

			}
		});
		lCCardType = new CLabel(Msg.translate(p_ctx, "CreditCardType"));
		mainPanel.add(lCCardType, "growx");
		mainPanel.add(fCCardType, "h 50, wrap, growx");
		fCCardType.setFont(font);

		fCCardNo = new PosTextField(Msg.translate(p_ctx, "CreditCardNumber"), p_posPanel, p_pos.getOSNP_KeyLayout_ID(),  new DecimalFormat("#"));
		lCCardNo = new CLabel(Msg.translate(p_ctx, "CreditCardNumber"));
		fCCardNo.setName("cardNo");
		mainPanel.add(lCCardNo, "growx");
		mainPanel.add(fCCardNo, "wrap, growx");
		fCCardNo.setFont(font);
		fCCardNo.setHorizontalAlignment(JTextField.TRAILING);

		fCCardName = new PosTextField(Msg.translate(p_ctx, "Name"), p_posPanel, p_pos.getOSK_KeyLayout_ID());
		lCCardName = new CLabel(Msg.translate(p_ctx, "Name"));
		mainPanel.add(lCCardName, "growx");
		mainPanel.add(fCCardName, "wrap, growx");
		fCCardName.setFont(font);
		fCCardName.setHorizontalAlignment(JTextField.TRAILING);

		fCCardMonth = new PosTextField(Msg.translate(p_ctx, "Expires"), p_posPanel, p_pos.getOSNP_KeyLayout_ID());
		lCCardMonth = new CLabel(Msg.translate(p_ctx, "Expires"));
		fCCardMonth.setName("expiry");
		mainPanel.add(lCCardMonth, "growx");
		mainPanel.add(fCCardMonth, "wrap, w 75!");
		fCCardMonth.setFont(font);
		fCCardMonth.setHorizontalAlignment(JTextField.TRAILING);

		fCCardVC = new PosTextField(Msg.translate(p_ctx, "CVC"), p_posPanel, p_pos.getOSNP_KeyLayout_ID(),  new DecimalFormat("#"));
		lCCardVC = new CLabel(Msg.translate(p_ctx, "CVC"));
		mainPanel.add(lCCardVC, "growx");
		mainPanel.add(fCCardVC, "wrap, w 75!");
		fCCardVC.setFont(font);
		fCCardVC.setHorizontalAlignment(JTextField.TRAILING);

		AppsAction actCancel = new AppsAction("Cancel", KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0), false);
		actCancel.setDelegate(this);
		f_bCancel = (CButton)actCancel.getButton();
		f_bCancel.setFocusable(false);
		mainPanel.add (f_bCancel, "h 50!, w 50!, skip, split 2, trailing");

		AppsAction act = new AppsAction("Ok", KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0), false);
		act.setDelegate(this);
		f_bProcess = (CButton)act.getButton();
		f_bProcess.setFocusable(false);
		mainPanel.add (f_bProcess, "h 50!, w 50!");

		pack();

		setTotals();
	} // init

	private void setTotals()
	{
		String tenderType = ((ValueNamePair) tenderTypePick.getValue()).getID();
		boolean cash = MPayment.TENDERTYPE_Cash.equals(tenderType);
		boolean check = MPayment.TENDERTYPE_Check.equals(tenderType);
		boolean creditcard = MPayment.TENDERTYPE_CreditCard.equals(tenderType);
		boolean account = MPayment.TENDERTYPE_Account.equals(tenderType);

		fTenderAmt.setVisible(cash || check || creditcard);
		fReturnAmt.setVisible(cash);
		lTenderAmt.setVisible(cash || check || creditcard);
		lReturnAmt.setVisible(cash);

		fCheckAccountNo.setVisible(check);
		fCheckNo.setVisible(check);
		fCheckRouteNo.setVisible(check);
		fCheckAccountName.setVisible(check);
		lCheckAccountNo.setVisible(check);
		lCheckNo.setVisible(check);
		lCheckRouteNo.setVisible(check);
        lCheckAccountName.setVisible(check);

		fCCardMonth.setVisible(creditcard);
		fCCardName.setVisible(creditcard);
		fCCardNo.setVisible(creditcard);
		fCCardType.setVisible(creditcard);
		fCCardVC.setVisible(creditcard);
		lCCardMonth.setVisible(creditcard);
		lCCardName.setVisible(creditcard);
		lCCardNo.setVisible(creditcard);
		lCCardType.setVisible(creditcard);
		lCCardVC.setVisible(creditcard);

		fCPaymentTerm.setVisible(account);
		lCPaymentTerm.setVisible(account);
		fPayAmt.setVisible(!account);
		lPayAmt.setVisible(!account);

		fTotal.setValue(nf.format(p_order.getGrandTotal()));

		BigDecimal received = p_order.getPaidAmt();
		balance  = p_order.getGrandTotal().subtract(received);
		balance = balance.setScale(MCurrency.getStdPrecision(p_ctx, p_order.getC_Currency_ID()));
		log.info(String.format("TenderType=%s Received=%f Balace=%f", tenderType, received.doubleValue(), balance.doubleValue()));
		if (balance.compareTo(Env.ZERO) <= 0)
		{
			paid = true;

			if (balance.compareTo(Env.ZERO) < 0) {
			    ADialog.warn(0, this, Msg.getMsg(p_ctx, "Change") + ": " + balance);
			}
			dispose();
		}

		fBalance.setValue(nf.format(balance));
		fPayAmt.setValue(balance);
        fTenderAmt.setValue(balance);
		fTenderAmt.requestFocusInWindow();
		SwingUtilities.invokeLater(new Runnable() {

			public void run() {
				fTenderAmt.selectAll();
			}
		});

		pack();
	}

	public void keyReturned(MPOSKey key) {

		String text = key.getText();
		String payAmt = fPayAmt.getText();
		String selected = fPayAmt.getSelectedText();
		if ( selected != null && !selected.isEmpty() )
		{
			payAmt = payAmt.replaceAll(selected, "");
		}

		if ( text != null && !text.isEmpty() )
		{
			if ( text.equals(".") && payAmt.indexOf(".") == -1 )
			{
				fPayAmt.setText(payAmt + text);
				return;
			}
			try
			{
				Integer.parseInt(text);		// test if number
				fPayAmt.setText(payAmt + text);
			}
			catch (NumberFormatException e)
			{
				// ignore non-numbers
			}
		}
	}

	public static boolean pay(PosBasePanel posPanel) {

		PosPayment pay = new PosPayment(posPanel);
		pay.setVisible(true);

		return pay.isPaid();
	}

	private boolean isPaid() {
		return paid ;
	}
}
