/******************************************************************************
 * Copyright (C) 2009 Low Heng Sin                                            *
 * Copyright (C) 2009 Idalica Corporation                                     *
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
package org.compiere.grid;

import java.awt.BorderLayout;
import java.awt.Cursor;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Vector;
import java.util.logging.Level;

import javax.swing.table.DefaultTableModel;

import org.compiere.apps.ADialog;
import org.compiere.apps.AEnv;
import org.compiere.apps.ConfirmPanel;
import org.compiere.grid.ed.VCheckBox;
import org.compiere.grid.ed.VDate;
import org.compiere.grid.ed.VNumber;
import org.compiere.model.GridTab;
import org.compiere.model.SystemIDs;
import org.compiere.swing.CButton;
import org.compiere.swing.CLabel;
import org.compiere.swing.CPanel;
import org.compiere.swing.CTextField;
import org.compiere.util.CLogger;
import org.compiere.util.DisplayType;
import org.compiere.util.Env;
import org.compiere.util.Msg;
import org.compiere.util.Trx;
import org.compiere.util.TrxRunnable;

/**
 * Ventana de creación de lineas, a partir de la selección de pagos/cobros.
 *
 * @author fchiappano
 */
public class VCreateFromPaymentUI extends CreateFromPayment implements ActionListener, SystemIDs
{
    private static final long serialVersionUID = 1L;

    private VCreateFromDialog dialog;

    public VCreateFromPaymentUI(GridTab mTab)
    {
        super(mTab);
        log.info(getGridTab().toString());

        dialog = new VCreateFromDialog(this, getGridTab().getWindowNo(), true);

        // @fchiappano Delegar la acción del boton ok y cancel.
        dialog.getConfirmPanel().addActionListener(this);

        p_WindowNo = getGridTab().getWindowNo();

        try
        {
            if (!dynInit())
                return;
            jbInit();

            setInitOK(true);
        }
        catch (Exception e)
        {
            log.log(Level.SEVERE, "", e);
            setInitOK(false);
        }
        AEnv.positionCenterWindow(Env.getWindow(p_WindowNo), dialog);
    } // VCreateFromPaymentUI

    /** Window No */
    private int p_WindowNo;

    /** Logger */
    private CLogger log = CLogger.getCLogger(getClass());

    private CLabel documentNoLabel = new CLabel(Msg.translate(Env.getCtx(), "DocumentNo"));
    protected CTextField documentNoField = new CTextField(10);

    private CLabel nameLabel = new CLabel(Msg.translate(Env.getCtx(), "A_Name"));
    protected CTextField nameField = new CTextField(20);

    private CLabel routingNoLabel = new CLabel(Msg.translate(Env.getCtx(), "RoutingNo"));
    protected CTextField routingNoField = new CTextField(20);

    private CLabel checkNoLabel = new CLabel(Msg.translate(Env.getCtx(), "CheckNo"));
    protected CTextField checkNoField = new CTextField(20);

    private CLabel amtFromLabel = new CLabel(Msg.translate(Env.getCtx(), "PayAmt"));
    protected VNumber amtFromField = new VNumber("AmtFrom", false, false, true, DisplayType.Amount,
            Msg.translate(Env.getCtx(), "AmtFrom"));
    private CLabel amtToLabel = new CLabel("-");
    protected VNumber amtToField = new VNumber("AmtTo", false, false, true, DisplayType.Amount,
            Msg.translate(Env.getCtx(), "AmtTo"));

    private CLabel dateFromLabel = new CLabel(Msg.translate(Env.getCtx(), "DateTrx"));
    protected VDate dateFromField = new VDate("DateFrom", false, false, true, DisplayType.Date,
            Msg.translate(Env.getCtx(), "DateFrom"));
    private CLabel dateToLabel = new CLabel("-");
    protected VDate dateToField = new VDate("DateTo", false, false, true, DisplayType.Date,
            Msg.translate(Env.getCtx(), "DateTo"));

    // @fchiappano Filtros para e-cheqs
    private VCheckBox eCheq = new VCheckBox("EsElectronico", false, false, true,
            Msg.translate(Env.getCtx(), "EsElectronico"), "", false);
    private CLabel fechaVencLabel = new CLabel(Msg.translate(Env.getCtx(), "Fecha_Venc_Cheque"));
    protected VDate fechaVencField = new VDate("Fecha_Venc_Cheque", false, false, true, DisplayType.Date,
            Msg.translate(Env.getCtx(), "Fecha_Venc_Cheque"));

    /**
     * Dynamic Init
     * 
     * @throws Exception
     *             if Lookups cannot be initialized
     * @return true if initialized
     */
    public boolean dynInit() throws Exception
    {
        log.config("");

        super.dynInit();

        // Refresh button
        CButton refreshButton = ConfirmPanel.createRefreshButton(false);
        refreshButton.setMargin(new Insets(1, 10, 0, 10));
        refreshButton.setDefaultCapable(true);
        refreshButton.addActionListener(this);
        dialog.getConfirmPanel().addButton(refreshButton);
        dialog.getRootPane().setDefaultButton(refreshButton);
        dialog.setTitle(getTitle());

        loadPayments();

        return true;
    } // dynInit

    /**
     * Static Init.
     * 
     * <pre>
     *  parameterPanel
     *      parameterBankPanel
     *      parameterStdPanel
     *          bPartner/order/invoice/shopment/licator Label/Field
     *  dataPane
     *  southPanel
     *      confirmPanel
     *      statusBar
     * </pre>
     * 
     * @throws Exception
     */
    private void jbInit() throws Exception
    {
        documentNoLabel.setLabelFor(documentNoField);
        nameLabel.setLabelFor(nameField);
        routingNoLabel.setLabelFor(routingNoField);
        checkNoLabel.setLabelFor(checkNoField);

        dateFromLabel.setLabelFor(dateFromField);
        dateFromField.setToolTipText(Msg.translate(Env.getCtx(), "DateFrom"));
        dateToLabel.setLabelFor(dateToField);
        dateToField.setToolTipText(Msg.translate(Env.getCtx(), "DateTo"));
        amtFromLabel.setLabelFor(amtFromField);
        amtFromField.setToolTipText(Msg.translate(Env.getCtx(), "AmtFrom"));
        amtToLabel.setLabelFor(amtToField);
        amtToField.setToolTipText(Msg.translate(Env.getCtx(), "AmtTo"));

        eCheq.setSelected(false);
        fechaVencLabel.setLabelFor(fechaVencField);
        fechaVencField.setToolTipText(Msg.translate(Env.getCtx(), "Fecha_Venc_Cheque"));

        CPanel parameterPanel = dialog.getParameterPanel();
        parameterPanel.setLayout(new BorderLayout());

        CPanel parameterBankPanel = new CPanel();
        parameterBankPanel.setLayout(new GridBagLayout());
        parameterPanel.add(parameterBankPanel, BorderLayout.CENTER);

        // @fchiappano PRIMERA LINEA - PRIMER COLUMNA
        parameterBankPanel.add(documentNoLabel, new GridBagConstraints(0, 0, 1, 1, 0.0, 0.0, GridBagConstraints.EAST,
                GridBagConstraints.NONE, new Insets(5, 5, 5, 5), 0, 0));
        if (documentNoField != null)
            parameterBankPanel.add(documentNoField, new GridBagConstraints(1, 0, 1, 1, 0.0, 0.0,
                    GridBagConstraints.WEST, GridBagConstraints.HORIZONTAL, new Insets(5, 0, 5, 5), 0, 0));

        // @fchiappano SEGUNDA LINEA - PRIMER COLUMNA
        parameterBankPanel.add(routingNoLabel, new GridBagConstraints(0, 1, 1, 1, 0.0, 0.0, GridBagConstraints.EAST,
                GridBagConstraints.NONE, new Insets(5, 5, 5, 5), 0, 0));
        if (routingNoField != null)
            parameterBankPanel.add(routingNoField, new GridBagConstraints(1, 1, 1, 1, 0.0, 0.0,
                    GridBagConstraints.WEST, GridBagConstraints.HORIZONTAL, new Insets(5, 0, 5, 5), 0, 0));

        // @fchiappano TERCER LINEA - PRIMERA COLUMNA.
        parameterBankPanel.add(checkNoLabel, new GridBagConstraints(0, 2, 1, 1, 0.0, 0.0, GridBagConstraints.EAST,
                GridBagConstraints.NONE, new Insets(5, 5, 5, 5), 0, 0));
        if (checkNoField != null)
            parameterBankPanel.add(checkNoField, new GridBagConstraints(1, 2, 1, 1, 0.0, 0.0,
                    GridBagConstraints.WEST, GridBagConstraints.HORIZONTAL, new Insets(5, 0, 5, 5), 0, 0));

        // @fchiappano CUARTA LINEA - PRIMERA COLUMNA.
        parameterBankPanel.add(eCheq, new GridBagConstraints(1, 3, 1, 1, 0.0, 0.0, GridBagConstraints.WEST,
                GridBagConstraints.HORIZONTAL, new Insets(5, 0, 5, 5), 0, 0));

        // @fchiappano PRIMERA LINEA - SEGUNDA COLUMNA
        parameterBankPanel.add(nameLabel, new GridBagConstraints(2, 0, 1, 1, 0.0, 0.0, GridBagConstraints.EAST,
                GridBagConstraints.NONE, new Insets(5, 5, 5, 5), 0, 0));
        parameterBankPanel.add(nameField, new GridBagConstraints(3, 0, 1, 1, 0.0, 0.0, GridBagConstraints.WEST,
                GridBagConstraints.HORIZONTAL, new Insets(5, 0, 5, 5), 0, 0));

        // @fchiappano SEGUNDA LINEA - SEGUNDA COLUMNA
        parameterBankPanel.add(dateFromLabel, new GridBagConstraints(2, 1, 1, 1, 0.0, 0.0, GridBagConstraints.EAST,
                GridBagConstraints.NONE, new Insets(5, 5, 5, 5), 0, 0));
        parameterBankPanel.add(dateFromField, new GridBagConstraints(3, 1, 1, 1, 0.0, 0.0, GridBagConstraints.WEST,
                GridBagConstraints.HORIZONTAL, new Insets(5, 0, 5, 5), 0, 0));
        // @fchiappano SEGUNDA LINEA - TERCERA COLUMNA
        parameterBankPanel.add(dateToLabel, new GridBagConstraints(4, 1, 1, 1, 0.0, 0.0, GridBagConstraints.EAST,
                GridBagConstraints.NONE, new Insets(5, 5, 5, 5), 0, 0));
        parameterBankPanel.add(dateToField, new GridBagConstraints(5, 1, 1, 1, 0.0, 0.0, GridBagConstraints.WEST,
                GridBagConstraints.HORIZONTAL, new Insets(5, 0, 5, 5), 0, 0));

        // @fchiapano TERCER LINEA - SEGUNDA COLUMNA
        parameterBankPanel.add(amtFromLabel, new GridBagConstraints(2, 2, 1, 1, 0.0, 0.0, GridBagConstraints.EAST,
                GridBagConstraints.NONE, new Insets(5, 5, 5, 5), 0, 0));
        parameterBankPanel.add(amtFromField, new GridBagConstraints(3, 2, 1, 1, 0.0, 0.0,
                GridBagConstraints.WEST, GridBagConstraints.HORIZONTAL, new Insets(5, 0, 5, 5), 0, 0));

        // @fchiappano CUARTA LINEA - SEGUNDA COLUMNA
        parameterBankPanel.add(fechaVencLabel, new GridBagConstraints(2, 3, 1, 1, 0.0, 0.0, GridBagConstraints.EAST,
                GridBagConstraints.NONE, new Insets(5, 5, 5, 5), 0, 0));
        parameterBankPanel.add(fechaVencField, new GridBagConstraints(3, 3, 1, 1, 0.0, 0.0,
                GridBagConstraints.WEST, GridBagConstraints.HORIZONTAL, new Insets(5, 0, 5, 5), 0, 0));

        // @fchiappano TERCER LINEA - TERCER COLUMNA
        parameterBankPanel.add(amtToLabel, new GridBagConstraints(4, 2, 1, 1, 0.0, 0.0, GridBagConstraints.EAST,
                GridBagConstraints.NONE, new Insets(5, 5, 5, 5), 0, 0));
        parameterBankPanel.add(amtToField, new GridBagConstraints(5, 2, 1, 1, 0.0, 0.0,
                GridBagConstraints.WEST, GridBagConstraints.HORIZONTAL, new Insets(5, 0, 5, 5), 0, 0));

    } // jbInit

    /*************************************************************************/

    /**
     * Action Listener
     * 
     * @param e
     *            event
     */
    public void actionPerformed(ActionEvent e)
    {
        log.config("Action=" + e.getActionCommand());

        if (e.getActionCommand().equals(ConfirmPanel.A_OK))
        {
            try
            {
                Trx.run(new TrxRunnable()
                {
                    public void run(String trxName)
                    {
                        // @fchiappano No cerrar la ventana.
                        dialog.save(trxName);
                        // dialog.dispose();

                    }
                });

                // @fchiappano volver a ejecutar la consulta a DB, para
                // continuar con la carga de cheques
                loadPayments();
                dialog.tableChanged(null);
            }
            catch (Exception ex)
            {
                ADialog.error(getGridTab().getWindowNo(), dialog, "Error", ex.getLocalizedMessage());
            }
        }
        // Cancel
        else if (e.getActionCommand().equals(ConfirmPanel.A_CANCEL))
        {
            dialog.dispose();
        }

        // Object source = e.getSource();
        else if (e.getActionCommand().equals(ConfirmPanel.A_REFRESH))
        {
            Cursor.getPredefinedCursor(Cursor.WAIT_CURSOR);
            loadPayments();
            dialog.tableChanged(null);
            Cursor.getPredefinedCursor(Cursor.DEFAULT_CURSOR);
        }
    } // actionPerformed

    protected void loadPayments()
    {
        loadTableOIS(getPaymentData(documentNoField.getText(), nameField.getText(), dateFromField.getValue(),
                dateToField.getValue(), amtFromField.getValue(), amtToField.getValue(), routingNoField.getText(),
                checkNoField.getText(), eCheq.isSelected(), fechaVencField.getValue()));
    } // loadPayments

    protected void loadTableOIS(Vector<?> data)
    {
        // Remove previous listeners
        dialog.getMiniTable().getModel().removeTableModelListener(dialog);
        // Set Model
        DefaultTableModel model = new DefaultTableModel(data, getOISColumnNames());
        model.addTableModelListener(dialog);
        dialog.getMiniTable().setModel(model);
        //

        configureMiniTable(dialog.getMiniTable());
    } // loadTableOIS

    /**
     * List total amount
     */
    public void info()
    {
        DecimalFormat format = DisplayType.getNumberFormat(DisplayType.Amount);

        BigDecimal total = new BigDecimal(0.0);
        int rows = dialog.getMiniTable().getRowCount();
        int count = 0;
        for (int i = 0; i < rows; i++)
        {
            if (((Boolean) dialog.getMiniTable().getValueAt(i, 0)).booleanValue())
            {
                total = total.add((BigDecimal) dialog.getMiniTable().getValueAt(i, 6));
                count++;
            }
        }
        dialog.setStatusLine(count, Msg.getMsg(Env.getCtx(), "Sum") + "  " + format.format(total));
    } // infoPayment

    public void showWindow()
    {
        dialog.setVisible(true);
    }

    public void closeWindow()
    {
        dialog.dispose();
    }
} // VCreateFromPaymentUI
