/******************************************************************************
 * Product: Posterita Ajax UI 												  *
 * Copyright (C) 2007 Posterita Ltd.  All Rights Reserved.                    *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * Posterita Ltd., 3, Draper Avenue, Quatre Bornes, Mauritius                 *
 * or via info@posterita.org or http://www.posterita.org/                     *
 *****************************************************************************/

package org.adempiere.webui.panel;

import java.util.Properties;

import org.adempiere.webui.LayoutUtils;
import org.adempiere.webui.apps.AEnv;
import org.adempiere.webui.component.Button;
import org.adempiere.webui.component.Label;
import org.adempiere.webui.component.Panel;
import org.adempiere.webui.component.Textbox;
import org.adempiere.webui.component.Window;
import org.compiere.util.Env;
import org.compiere.util.Msg;
import org.compiere.util.Util;
import org.compiere.util.ValueNamePair;
import org.zkoss.zhtml.Text;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zk.ui.event.Events;
import org.zkoss.zul.Hbox;
import org.zkoss.zul.Image;
import org.zkoss.zul.Separator;

/**
 * Ventana de carga de URLs.
 *
 * @author Franco Chiappano
 */

public class URLPanel extends Window implements EventListener
{
    /**
     * generated serial version ID
     */
    private static final long serialVersionUID = -4957498533838144942L;
    private static final String MESSAGE_PANEL_STYLE = "text-align:left; word-break: break-all; overflow: auto; max-height: 350pt; min-width: 230pt; max-width: 450pt;";
    private String msg = new String("");
    private String imgSrc = new String("~./zul/img/msgbox/info-btn.png");

    private Text lblMsg = new Text();

    private Button btnOk = new Button();
    private Button btnCancel = new Button();

    private Image img = new Image();

    private ValueNamePair returnValue;

    // @fchiappano variable necesarias para agregar el componente tipo lista.
    private Label lNombre;
    private Textbox f_Nombre;
    private Label lUrl;
    private Textbox f_Url;

    public URLPanel()
    {
        super();
    } // URLPanel

    private void init()
    {
        Properties ctx = Env.getCtx();
        lblMsg.setValue(msg);

        btnOk.setLabel(Util.cleanAmp(Msg.getMsg(ctx, "OK")));
        btnOk.setImage("/images/Ok16.png");
        btnOk.addEventListener(Events.ON_CLICK, this);
        LayoutUtils.addSclass("action-text-button", btnOk);

        btnCancel.setLabel(Util.cleanAmp(Msg.getMsg(ctx, "Cancel")));
        btnCancel.setImage("/images/Cancel16.png");
        btnCancel.addEventListener(Events.ON_CLICK, this);
        LayoutUtils.addSclass("action-text-button", btnCancel);

        Panel pnlMessage = new Panel();
        pnlMessage.setStyle(MESSAGE_PANEL_STYLE);
        pnlMessage.appendChild(lblMsg);

        Hbox pnlImage = new Hbox();

        img.setSrc(imgSrc);

        pnlImage.setWidth("72px");
        pnlImage.setAlign("center");
        pnlImage.setPack("center");
        pnlImage.appendChild(img);

        Hbox north = new Hbox();
        north.setAlign("center");
        north.setStyle("margin: 10pt 10pt 20pt 10pt;"); // trbl
        this.appendChild(north);
        north.appendChild(pnlImage);
        north.appendChild(pnlMessage);

        // @fchiappano Primera linea del sub panel (Campo Nombre).
        lNombre = new Label(Msg.translate(Env.getCtx(), "Name"));
        f_Nombre = new Textbox();
        f_Nombre.setWidth("100%");
        Hbox nombreBox = new Hbox();
        nombreBox.setPack("end");
        nombreBox.setWidth("550px");
        nombreBox.appendChild(lNombre);
        nombreBox.appendChild(f_Nombre);
        nombreBox.setStyle("margin: 10pt 10pt 10pt 10pt;");
        this.appendChild(nombreBox);

        // @fchiappano Segunda linea del sub panel (Campo URL).
        lUrl = new Label(Msg.translate(Env.getCtx(), "URL"));
        f_Url = new Textbox();
        f_Url.setWidth("100%");
        Hbox urlBox = new Hbox();
        urlBox.setPack("end");
        urlBox.setWidth("550px");
        urlBox.appendChild(lUrl);
        urlBox.appendChild(f_Url);
        urlBox.setStyle("margin: 10pt 10pt 10pt 10pt;");
        this.appendChild(urlBox);

        Hbox pnlButtons = new Hbox();
        pnlButtons.setHeight("52px");
        pnlButtons.setAlign("center");
        pnlButtons.setPack("end");
        pnlButtons.appendChild(btnOk);
        pnlButtons.appendChild(btnCancel);

        Separator separator = new Separator();
        separator.setWidth("100%");
        separator.setBar(true);
        this.appendChild(separator);

        Hbox south = new Hbox();
        south.setPack("end");
        south.setWidth("100%");
        this.appendChild(south);
        south.appendChild(pnlButtons);

        this.setBorder("normal");
        this.setContentStyle("background-color:#ffffff;");
        this.setPosition("left, top");
    } // init

    public ValueNamePair show(String message, String title)
    {
        this.msg = message;

        init();

        this.setTitle(title);
        this.setPosition("center");
        this.setClosable(true);
        if (Events.inEventListener())
            this.setAttribute(Window.MODE_KEY, Window.MODE_MODAL);
        else
            this.setAttribute(Window.MODE_KEY, Window.MODE_HIGHLIGHTED);
        this.setSizable(true);

        this.setVisible(true);
        AEnv.showCenterScreen(this);

        return returnValue;
    } // show

    public static ValueNamePair showDialog(String message, String title) throws InterruptedException
    {
        URLPanel msg = new URLPanel();

        return msg.show(message, title);
    } // showDialog

    public void onEvent(Event event) throws Exception
    {
        if (event == null)
            return;

        if (event.getTarget() == btnOk)
        {
            String value = f_Url.getText();
            String name = f_Nombre.getText();

            if (name != null && !name.equals("") && value != null && !value.equals(""))
                returnValue = new ValueNamePair(value, name);
            else
                returnValue = null;
        }
        else if (event.getTarget() == btnCancel)
        {
            returnValue = null;
        }

        this.detach();
    } // onEvent

} // URLPanel
