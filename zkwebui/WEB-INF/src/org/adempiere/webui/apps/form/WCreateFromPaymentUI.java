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
package org.adempiere.webui.apps.form;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.Vector;
import java.util.logging.Level;

import org.adempiere.webui.apps.AEnv;
import org.adempiere.webui.component.Button;
import org.adempiere.webui.component.ConfirmPanel;
import org.adempiere.webui.component.Grid;
import org.adempiere.webui.component.GridFactory;
import org.adempiere.webui.component.Label;
import org.adempiere.webui.component.ListModelTable;
import org.adempiere.webui.component.Panel;
import org.adempiere.webui.component.Row;
import org.adempiere.webui.component.Rows;
import org.adempiere.webui.editor.WDateEditor;
import org.adempiere.webui.editor.WNumberEditor;
import org.adempiere.webui.editor.WStringEditor;
import org.compiere.grid.CreateFromPayment;
import org.compiere.model.GridTab;
import org.compiere.model.SystemIDs;
import org.compiere.util.CLogger;
import org.compiere.util.DisplayType;
import org.compiere.util.Env;
import org.compiere.util.Msg;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zk.ui.event.Events;
import org.zkoss.zul.Borderlayout;
import org.zkoss.zul.Center;
import org.zkoss.zul.Hbox;

/**
 * Clase de implementación grafica para la WebUI, de la ventana
 * CreateFromPayment.
 *
 * @author fchiappano
 *
 * @implNote La registración de esta implementación CreateFrom, se realiza en la
 *           clase LoginPanel, para evitar problemas de dependencias en la
 *           generación del zkcustomization.jar.
 */
public class WCreateFromPaymentUI extends CreateFromPayment implements EventListener<Event>, SystemIDs
{
    private static final long serialVersionUID = 1L;

    private WCreateFromWindow window;

    public WCreateFromPaymentUI(GridTab tab)
    {
        super(tab);
        log.info(getGridTab().toString());

        window = new WCreateFromWindow(this, getGridTab().getWindowNo());

        try
        {
            if (!dynInit())
                return;
            zkInit();
            setInitOK(true);
        }
        catch (Exception e)
        {
            log.log(Level.SEVERE, "", e);
            setInitOK(false);
        }
        AEnv.showWindow(window);
    } // WCreateFromPayment

    /** Logger */
    private CLogger log = CLogger.getCLogger(getClass());

    protected Label documentNoLabel = new Label(Msg.translate(Env.getCtx(), "DocumentNo"));
    protected WStringEditor documentNoField = new WStringEditor();

    protected Label nameLabel = new Label(Msg.translate(Env.getCtx(), "A_Name"));
    protected WStringEditor nameField = new WStringEditor();

    protected Label routingNoLabel = new Label(Msg.translate(Env.getCtx(), "RoutingNo"));
    protected WStringEditor routingNoField = new WStringEditor();

    protected Label checkNoLabel = new Label(Msg.translate(Env.getCtx(), "CheckNo"));
    protected WStringEditor checkNoField = new WStringEditor();

    protected Label amtFromLabel = new Label(Msg.translate(Env.getCtx(), "PayAmt"));
    protected WNumberEditor amtFromField = new WNumberEditor("AmtFrom", false, false, true, DisplayType.Amount,
            Msg.translate(Env.getCtx(), "AmtFrom"));
    protected Label amtToLabel = new Label("-");
    protected WNumberEditor amtToField = new WNumberEditor("AmtTo", false, false, true, DisplayType.Amount,
            Msg.translate(Env.getCtx(), "AmtTo"));

    protected Label dateFromLabel = new Label(Msg.translate(Env.getCtx(), "DateTrx"));
    protected WDateEditor dateFromField = new WDateEditor("DateFrom", false, false, true,
            Msg.translate(Env.getCtx(), "DateFrom"));
    protected Label dateToLabel = new Label("-");
    protected WDateEditor dateToField = new WDateEditor("DateTo", false, false, true,
            Msg.translate(Env.getCtx(), "DateTo"));

    /**
     * Dynamic Init
     *
     * @throws Exception if Lookups cannot be initialized
     * @return true if initialized
     */
    public boolean dynInit() throws Exception
    {
        log.config("");

        super.dynInit();

        // Refresh button
        Button refreshButton = window.getConfirmPanel().createButton(ConfirmPanel.A_REFRESH);
        refreshButton.addEventListener(Events.ON_CLICK, this);
        window.getConfirmPanel().addButton(refreshButton);
        window.setTitle(getTitle());

        loadBankAccount();

        return true;
    } // dynInit

    protected void zkInit() throws Exception
    {
        dateFromField.getComponent().setTooltiptext(Msg.translate(Env.getCtx(), "DateFrom"));
        dateToField.getComponent().setTooltiptext(Msg.translate(Env.getCtx(), "DateTo"));

        amtFromField.getComponent().setTooltiptext(Msg.translate(Env.getCtx(), "AmtFrom"));
        amtToField.getComponent().setTooltiptext(Msg.translate(Env.getCtx(), "AmtTo"));

        Borderlayout parameterLayout = new Borderlayout();
        parameterLayout.setHeight("130px");
        parameterLayout.setWidth("100%");
        Panel parameterPanel = window.getParameterPanel();
        parameterPanel.appendChild(parameterLayout);

        Grid parameterBankLayout = GridFactory.newGridLayout();
        Panel parameterBankPanel = new Panel();
        parameterBankPanel.appendChild(parameterBankLayout);

        Center center = new Center();
        parameterLayout.appendChild(center);
        center.appendChild(parameterBankPanel);

        // @fchiappano Primera Linea de parametros.
        Rows rows = (Rows) parameterBankLayout.newRows();
        Row row = rows.newRow();
        row.appendChild(documentNoLabel.rightAlign());
        row.appendChild(documentNoField.getComponent());
        row.appendChild(nameLabel.rightAlign());
        row.appendChild(nameField.getComponent());

        // @fchiappano Segunda Linea de parametros.
        row = rows.newRow();
        row.appendChild(routingNoLabel.rightAlign());
        row.appendChild(routingNoField.getComponent());
        row.appendChild(dateFromLabel.rightAlign());
        Hbox hbox = new Hbox();
        hbox.appendChild(dateFromField.getComponent());
        hbox.appendChild(dateToLabel.rightAlign());
        hbox.appendChild(dateToField.getComponent());
        row.appendChild(hbox);

        // @fchiappano Tercera Linea de Parametros.
        row = rows.newRow();
        row.appendChild(checkNoLabel.rightAlign());
        row.appendChild(checkNoField.getComponent());
        row.appendChild(amtFromLabel.rightAlign());
        hbox = new Hbox();
        hbox.appendChild(amtFromField.getComponent());
        hbox.appendChild(amtToLabel.rightAlign());
        hbox.appendChild(amtToField.getComponent());
        row.appendChild(hbox);
    } // zkInit

    /**
     * Action Listener
     * 
     * @param e
     *            event
     * @throws Exception
     */
    public void onEvent(Event e) throws Exception
    {
        log.config("Action=" + e.getTarget().getId());
        if (e.getTarget().equals(window.getConfirmPanel().getButton(ConfirmPanel.A_REFRESH)))
        {
            loadBankAccount();
            window.tableChanged(null);
        }
    } // onEvent

    protected void loadBankAccount()
    {
        loadTableOIS(getPaymentData(documentNoField.getValue().toString(), nameField.getValue().toString(),
                dateFromField.getValue(), dateToField.getValue(), amtFromField.getValue(), amtToField.getValue(),
                routingNoField.getValue().toString(), checkNoField.getValue().toString()));
    } // loadBankAccount

    protected void loadTableOIS(Vector<?> data)
    {
        window.getWListbox().clear();

        // Remove previous listeners
        window.getWListbox().getModel().removeTableModelListener(window);
        // Set Model
        ListModelTable model = new ListModelTable(data);
        model.addTableModelListener(window);
        window.getWListbox().setData(model, getOISColumnNames());
        //

        configureMiniTable(window.getWListbox());
    } // loadTableOIS

    /**
     * List total amount
     */
    public void info()
    {
        DecimalFormat format = DisplayType.getNumberFormat(DisplayType.Amount);

        BigDecimal total = new BigDecimal(0.0);
        int rows = window.getWListbox().getRowCount();
        int count = 0;
        for (int i = 0; i < rows; i++)
        {
            if (((Boolean) window.getWListbox().getValueAt(i, 0)).booleanValue())
            {
                total = total.add((BigDecimal) window.getWListbox().getValueAt(i, 6));
                count++;
            }
        }
        window.setStatusLine(count, Msg.getMsg(Env.getCtx(), "Sum") + "  " + format.format(total));
    } // infoPayment

    public void showWindow()
    {
        window.setVisible(true);
    } // showWindow

    public void closeWindow()
    {
        window.dispose();
    } // closeWindow

	@Override
	public Object getWindow() {
		return window;
	}

} // WCreateFromPayment
