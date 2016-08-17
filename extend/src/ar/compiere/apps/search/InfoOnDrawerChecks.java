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
/** Generated Model - DO NOT CHANGE */
package ar.compiere.apps.search;

import java.awt.Frame;
import java.awt.event.MouseEvent;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import org.adempiere.plaf.AdempierePLAF;
import org.compiere.apps.ALayout;
import org.compiere.apps.ALayoutConstraint;
import org.compiere.apps.search.Info;
import org.compiere.apps.search.Info_Column;
import org.compiere.grid.ed.VCheckBox;
import org.compiere.grid.ed.VDate;
import org.compiere.grid.ed.VNumber;
import org.compiere.minigrid.IDColumn;
import org.compiere.model.MQuery;
import org.compiere.swing.CLabel;
import org.compiere.swing.CTextField;
import org.compiere.util.DisplayType;
import org.compiere.util.Env;
import org.compiere.util.Msg;
import org.compiere.util.Util;

/**
 *
 * @author German Wagner
 *
 */
public class InfoOnDrawerChecks extends Info
{
	/**
	 *
	 */
	private static final long serialVersionUID = -2917241055484901704L;

	public InfoOnDrawerChecks()
	{
		super(new Frame(), true, 0, "C_Payment", null, true, "");
	}

	/**
	 *  Detail Protected Constructor
	 *  @param frame parent frame
	 *  @param modal modal
	 *  @param WindowNo window no
	 *  @param value query value
	 *  @param multiSelection multiple selections
	 *  @param whereClause where clause
	 */
	protected InfoOnDrawerChecks(Frame frame, boolean modal, int WindowNo, String value,
		boolean multiSelection, String whereClause)
	{
		super (frame, modal, WindowNo, "p", "C_Payment_ID", multiSelection, whereClause);
		log.info( "Documentos en Cartera");
		setTitle("Documentos en Cartera");
		//
		try
		{
			statInit();
			p_loadedOK = initInfo ();
		}
		catch (Exception e)
		{
			return;
		}
		//
		int no = p_table.getRowCount();
		setStatusLine(Integer.toString(no) + " " + Msg.getMsg(Env.getCtx(), "SearchRows_EnterQuery"), false);
		setStatusDB(Integer.toString(no));
		if (value != null && value.length() > 0)
		{
			fDocumentNo.setValue(value);
			executeQuery();
		}
		//
		pack();
		//	Focus
		fCheckNo.requestFocus();
	}   //  InfoPayment

	//  Static Info
	private CLabel lDocumentNo = new CLabel(Msg.translate(Env.getCtx(), "DocumentNo"));
	private CTextField fDocumentNo = new CTextField(10);
	// Begin Marcos Zúñiga - Add new search fields
    private CLabel lRoutingNo = new CLabel(Msg.translate(Env.getCtx(), "RoutingNo"));
    private CTextField fRoutingNo = new CTextField(10);
    private CLabel lCheckNo = new CLabel(Msg.translate(Env.getCtx(), "CheckNo"));
    private CTextField fCheckNo = new CTextField(10);
	// End Marcos Zúñiga
//	private CLabel lOrg_ID = new CLabel(Msg.translate(Env.getCtx(), "AD_Org_ID"));
//	private VLookup fOrg_ID;
    // Begin Marcos Zúñiga
	private CLabel lA_Name = new CLabel(Msg.translate(Env.getCtx(), "A_Name"));
    private CTextField fA_Name = new CTextField(10);
    // End Marcos Zúñiga
	//
	private CLabel lDateFrom = new CLabel(Msg.translate(Env.getCtx(), "DateTrx"));
	private VDate fDateFrom = new VDate("DateFrom", false, false, true, DisplayType.Date, Msg.translate(Env.getCtx(), "DateFrom"));
	private CLabel lDateTo = new CLabel("-");
	private VDate fDateTo = new VDate("DateTo", false, false, true, DisplayType.Date, Msg.translate(Env.getCtx(), "DateTo"));
	private CLabel lAmtFrom = new CLabel(Msg.translate(Env.getCtx(), "PayAmt"));
	private VNumber fAmtFrom = new VNumber("AmtFrom", false, false, true, DisplayType.Amount, Msg.translate(Env.getCtx(), "AmtFrom"));
	private CLabel lAmtTo = new CLabel("-");
	private VNumber fAmtTo = new VNumber("AmtTo", false, false, true, DisplayType.Amount, Msg.translate(Env.getCtx(), "AmtTo"));
	private VCheckBox fIsReceipt = new VCheckBox ("IsReceipt", false, true, false, Msg.translate(Env.getCtx(), "IsReceipt"), "", false);

	/**  Array of Column Info    */
	private static final Info_Column[] s_paymentLayout = {
		new Info_Column(" ", "p.C_Payment_ID", IDColumn.class),
		new Info_Column(Msg.translate(Env.getCtx(), "C_BankAccount_ID"),
			"(SELECT b.Name || ' ' || ba.AccountNo FROM C_Bank b, C_BankAccount ba WHERE b.C_Bank_ID=ba.C_Bank_ID AND ba.C_BankAccount_ID=p.C_BankAccount_ID)", String.class),
		new Info_Column(Msg.translate(Env.getCtx(), "A_Name"),
			"p.A_Name", String.class), // Marcos Zúñiga - Show Account Name instead of C_Bpartner_ID
		new Info_Column(Msg.translate(Env.getCtx(), "DateTrx"),
			"p.DateTrx", Timestamp.class),
		new Info_Column(Msg.translate(Env.getCtx(), "DocumentNo"),
			"p.DocumentNo", String.class),
			// Begin Marcos Zúñiga
	    new Info_Column(Msg.translate(Env.getCtx(), "RoutingNo"),
            "p.RoutingNo", String.class),
	    new Info_Column(Msg.translate(Env.getCtx(), "CheckNo"),
	        "p.CheckNo", String.class),
	     // End Marcos Zúñiga
		new Info_Column(Msg.translate(Env.getCtx(), "IsReceipt"),
			"p.IsReceipt", Boolean.class),
		new Info_Column(Msg.translate(Env.getCtx(), "C_Currency_ID"),
			"(SELECT ISO_Code FROM C_Currency c WHERE c.C_Currency_ID=p.C_Currency_ID)", String.class),
		new Info_Column(Msg.translate(Env.getCtx(), "PayAmt"),
			"p.PayAmt",  BigDecimal.class),
		new Info_Column(Msg.translate(Env.getCtx(), "ConvertedAmount"),
			"currencyBase(p.PayAmt,p.C_Currency_ID,p.DateTrx, p.AD_Client_ID,p.AD_Org_ID)", BigDecimal.class),
		new Info_Column(Msg.translate(Env.getCtx(), "IsAllocated"),
			"p.IsAllocated",  Boolean.class),
	};
    private static final int CONVERTED_AMT = 10;
    private static final int SELECTION = 0;
    private BigDecimal sumaSeleccionados = Env.ZERO;

	/**
	 *	Static Setup - add fields to parameterPanel
	 *  @throws Exception if Lookups cannot be created
	 */
	private void statInit() throws Exception
	{
		lDocumentNo.setLabelFor(fDocumentNo);
		fDocumentNo.setBackground(AdempierePLAF.getInfoBackground());
		fDocumentNo.addActionListener(this);
        // Begin Marcos Zúñiga
        lRoutingNo.setLabelFor(fRoutingNo);
        fRoutingNo.setBackground(AdempierePLAF.getInfoBackground());
        fRoutingNo.addActionListener(this);
        lCheckNo.setLabelFor(fCheckNo);
        fCheckNo.setBackground(AdempierePLAF.getInfoBackground());
        fCheckNo.addActionListener(this);
        // End Marcos Zúñiga
		fIsReceipt.setSelected(!"N".equals(Env.getContext(Env.getCtx(), p_WindowNo, "IsSOTrx")));
		fIsReceipt.addActionListener(this);
        // Begin Marcos Zúñiga
		lA_Name.setLabelFor(fA_Name);
		fA_Name.setBackground(AdempierePLAF.getInfoBackground());
		fA_Name.addActionListener(this);
        // End Marcos Zúñiga
		lDateFrom.setLabelFor(fDateFrom);
		fDateFrom.setBackground(AdempierePLAF.getInfoBackground());
		fDateFrom.setToolTipText(Msg.translate(Env.getCtx(), "DateFrom"));
		lDateTo.setLabelFor(fDateTo);
		fDateTo.setBackground(AdempierePLAF.getInfoBackground());
		fDateTo.setToolTipText(Msg.translate(Env.getCtx(), "DateTo"));
		lAmtFrom.setLabelFor(fAmtFrom);
		fAmtFrom.setBackground(AdempierePLAF.getInfoBackground());
		fAmtFrom.setToolTipText(Msg.translate(Env.getCtx(), "AmtFrom"));
		lAmtTo.setLabelFor(fAmtTo);
		fAmtTo.setBackground(AdempierePLAF.getInfoBackground());
		fAmtTo.setToolTipText(Msg.translate(Env.getCtx(), "AmtTo"));
		//
		parameterPanel.setLayout(new ALayout());
		//  First Row
		parameterPanel.add(lDocumentNo, new ALayoutConstraint(0,0));
		parameterPanel.add(fDocumentNo, null);
		parameterPanel.add(lA_Name, null); // Marcos Zúñiga
		parameterPanel.add(fA_Name, null); // Marcos Zúñiga
		parameterPanel.add(fIsReceipt, new ALayoutConstraint(0,5));
		//  2nd Row
        parameterPanel.add(lRoutingNo, new ALayoutConstraint(1,0)); // Marcos Zúñiga
        parameterPanel.add(fRoutingNo, null); // Marcos Zúñiga
		parameterPanel.add(lDateFrom, new ALayoutConstraint(1,2));
		parameterPanel.add(fDateFrom, null);
		parameterPanel.add(lDateTo, null);
		parameterPanel.add(fDateTo, null);
		//  3rd Row
        parameterPanel.add(lCheckNo, new ALayoutConstraint(2,0)); // Marcos Zúñiga
        parameterPanel.add(fCheckNo, null); // Marcos Zúñiga
		parameterPanel.add(lAmtFrom, new ALayoutConstraint(2,2));
		parameterPanel.add(fAmtFrom, null);
		parameterPanel.add(lAmtTo, null);
		parameterPanel.add(fAmtTo, null);
	//	parameterPanel.add(lOrg_ID, null);
	//	parameterPanel.add(fOrg_ID, null);
		fIsReceipt.setEnabled(false);
	}	//	statInit

	/**
	 *	General Init
	 *	@return true, if success
	 */
	private boolean initInfo ()
	{
		//  prepare table
		StringBuffer where = new StringBuffer("p.IsActive='Y'");
		if (p_whereClause.length() > 0)
			where.append(" AND ").append(Util.replace(p_whereClause, "C_Payment.", "p."));
		prepareTable(s_paymentLayout,
			" C_Payment_v p",
			where.toString(),
			"2,3,4");
		//
	//	MPayment.setIsAllocated(Env.getCtx(), 0, null);
		return true;
	}	//	initInfo


	/**************************************************************************
	 *	Construct SQL Where Clause and define parameters
	 *  (setParameters needs to set parameters)
	 *  Includes first AND
	 *  @return SQL where clause
	 */
	protected String getSQLWhere()
	{
		StringBuffer sql = new StringBuffer();
		if (fDocumentNo.getText().length() > 0)
			sql.append(" AND UPPER(p.DocumentNo) LIKE ?");
        if (fRoutingNo.getText().length() > 0)
            sql.append(" AND UPPER(p.RoutingNo) LIKE ?"); // Marcos Zúñiga
        if (fCheckNo.getText().length() > 0)
            sql.append(" AND UPPER(p.CheckNo) LIKE ?"); // Marcos Zúñiga
        if (fA_Name.getText().length() > 0)
            sql.append(" AND UPPER(p.A_Name) LIKE ?"); // Marcos Zúñiga
		if (fDateFrom.getValue() != null || fDateTo.getValue() != null)
		{
			Timestamp from = (Timestamp)fDateFrom.getValue();
			Timestamp to = (Timestamp)fDateTo.getValue();
			if (from == null && to != null)
				sql.append(" AND TRUNC(p.DateTrx) <= ?");
			else if (from != null && to == null)
				sql.append(" AND TRUNC(p.DateTrx) >= ?");
			else if (from != null && to != null)
				sql.append(" AND TRUNC(p.DateTrx) BETWEEN ? AND ?");
		}
		//
		if (fAmtFrom.getValue() != null || fAmtTo.getValue() != null)
		{
			BigDecimal from = (BigDecimal)fAmtFrom.getValue();
			BigDecimal to = (BigDecimal)fAmtTo.getValue();
			if (from == null && to != null)
				sql.append(" AND p.PayAmt <= ?");
			else if (from != null && to == null)
				sql.append(" AND p.PayAmt >= ?");
			else if (from != null && to != null)
				sql.append(" AND p.PayAmt BETWEEN ? AND ?");
		}
		sql.append(" AND p.IsReceipt=?");

		// sql.append(" AND p.IsReconciled='N'");

		log.fine(sql.toString());
		return sql.toString();
	}	//	getSQLWhere

	/**
	 *  Set Parameters for Query.
	 *  (as defined in getSQLWhere)
	 *  @param pstmt statement
	 *  @param forCount for counting records
	 *  @throws SQLException
	 */
	protected void setParameters(PreparedStatement pstmt, boolean forCount) throws SQLException
	{
		int index = 1;
		if (fDocumentNo.getText().length() > 0)
			pstmt.setString(index++, getSQLText(fDocumentNo));
        if (fRoutingNo.getText().length() > 0)
            pstmt.setString(index++, getSQLText(fRoutingNo)); // Marcos Zúñiga
        if (fCheckNo.getText().length() > 0)
            pstmt.setString(index++, getSQLText(fCheckNo)); // Marcos Zúñiga
        if (fA_Name.getText().length() > 0)
            pstmt.setString(index++, getSQLText(fA_Name)); // Marcos Zúñiga
		//
		if (fDateFrom.getValue() != null || fDateTo.getValue() != null)
		{
			Timestamp from = (Timestamp)fDateFrom.getValue();
			Timestamp to = (Timestamp)fDateTo.getValue();
			log.fine("Date From=" + from + ", To=" + to);
			if (from == null && to != null)
				pstmt.setTimestamp(index++, to);
			else if (from != null && to == null)
				pstmt.setTimestamp(index++, from);
			else if (from != null && to != null)
			{
				pstmt.setTimestamp(index++, from);
				pstmt.setTimestamp(index++, to);
			}
		}
		//
		if (fAmtFrom.getValue() != null || fAmtTo.getValue() != null)
		{
			BigDecimal from = (BigDecimal)fAmtFrom.getValue();
			BigDecimal to = (BigDecimal)fAmtTo.getValue();
			log.fine("Amt From=" + from + ", To=" + to);
			if (from == null && to != null)
				pstmt.setBigDecimal(index++, to);
			else if (from != null && to == null)
				pstmt.setBigDecimal(index++, from);
			else if (from != null && to != null)
			{
				pstmt.setBigDecimal(index++, from);
				pstmt.setBigDecimal(index++, to);
			}
		}
		pstmt.setString(index++, fIsReceipt.isSelected() ? "Y" : "N");
	}   //  setParameters

	/**
	 *  Get SQL WHERE parameter
	 *  @param f field
	 *  @return Upper case text with % at the end
	 */
	private String getSQLText (CTextField f)
	{
		String s = f.getText().toUpperCase();
		if (!s.endsWith("%"))
			s += "%";
		log.fine( "String=" + s);
		return s;
	}   //  getSQLText

	/**
	 *	Zoom
	 */
	protected void zoom()
	{
		log.info( "InfoPayment.zoom");
		Integer C_Payment_ID = getSelectedRowKey();
		if (C_Payment_ID == null)
			return;
		MQuery query = new MQuery("C_Payment");
		query.addRestriction("C_Payment_ID", MQuery.EQUAL, C_Payment_ID);
		query.setRecordCount(1);
		int AD_WindowNo = getAD_Window_ID("C_Payment", fIsReceipt.isSelected());
		zoom (AD_WindowNo, query);
	}	//	zoom

	/**
	 *	Has Zoom
	 *  @return true
	 */
	protected boolean hasZoom()
	{
		return true;
	}	//	hasZoom


	public static Info create (Frame frame, boolean modal, int WindowNo, String tableName, String keyColumn, String value, boolean multiSelection, String whereClause)
	{
		return new InfoOnDrawerChecks(frame, modal, WindowNo, value, multiSelection, whereClause);
	}

    /**************************************************************************
   *  Mouse Clicked
   *  @param e event
   */
  @Override
  public void mouseClicked(MouseEvent e)
  {
      super.mouseClicked(e);
      // @mzuniga Suma el importe de los cheques
      // seleccionados y los muestra en la línea de status
      if (e.getClickCount() < 2 && p_table.getSelectedRow() != -1 && p_multiSelection)
      {
          int row = p_table.getSelectedRow();
          String sel = p_table.getValueAt(row, SELECTION).toString();
          int col = p_table.getSelectedColumn();
          if (sel.contains("Selected=true") && col == SELECTION )
          {
              Object valor = p_table.getValueAt(row, CONVERTED_AMT);
              sumaSeleccionados = sumaSeleccionados.add((BigDecimal) valor);
              setStatusLine("Suma cheques seleccionados = " + sumaSeleccionados.setScale(2), false);
          }
          else if (col == SELECTION)
          {
              Object valor = p_table.getValueAt(row, CONVERTED_AMT);
              sumaSeleccionados = sumaSeleccionados.subtract((BigDecimal) valor);
              setStatusLine("Suma cheques seleccionados = " + sumaSeleccionados.setScale(2), false);
          }
      }
  } // mouseClicked
}   //  InfoPayment
