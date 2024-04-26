/******************************************************************************
 * Copyright (C) 2008 Low Heng Sin  All Rights Reserved.                      *
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

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;

import org.adempiere.webui.util.Callback;
import org.adempiere.webui.AdempiereWebUI;
import org.adempiere.webui.apps.AEnv;
import org.adempiere.webui.component.Button;
import org.adempiere.webui.component.ListItem;
import org.adempiere.webui.component.Listbox;
import org.adempiere.webui.component.Panel;
import org.adempiere.webui.component.Textbox;
import org.adempiere.webui.component.Urlbox;
import org.adempiere.webui.component.Window;
import org.adempiere.webui.event.DialogEvents;
import org.adempiere.webui.window.FDialog;
import org.compiere.model.MAttachment;
import org.compiere.model.MAttachmentEntry;
import org.compiere.util.CLogger;
import org.compiere.util.Env;
import org.compiere.util.Msg;
import org.compiere.util.ValueNamePair;
import org.zkoss.util.media.AMedia;
import org.zkoss.util.media.Media;
import org.zkoss.zk.au.out.AuScript;
import org.zkoss.zk.au.out.AuEcho;
import org.zkoss.zk.ui.Page;
import org.zkoss.zk.ui.Executions;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zk.ui.event.Events;
import org.zkoss.zk.ui.event.UploadEvent;
import org.zkoss.zk.ui.util.Clients;
import org.zkoss.zul.Borderlayout;
import org.zkoss.zul.Center;
import org.zkoss.zul.North;
import org.zkoss.zul.South;
import org.zkoss.zul.Div;
import org.zkoss.zul.Filedownload;
import org.zkoss.zul.Fileupload;
import org.zkoss.zul.Hbox;
import org.zkoss.zul.Iframe;
import org.zkoss.zul.Timer;

/**
 * 
 * @author Low Heng Sin
 *
 */
@SuppressWarnings("deprecation")
public class WAttachment extends Window implements EventListener<Event>
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2923895336573554570L;

	private static CLogger log = CLogger.getCLogger(WAttachment.class);

	/**	Window No				*/
	private int	m_WindowNo;
	
	/** Attachment				*/
	private MAttachment	m_attachment;
	
	/** Change					*/
	private boolean m_change = false;

	private Iframe preview = new Iframe();

	private Textbox text = new Textbox();

	private Listbox cbContent = new Listbox();

	private Button bDelete = new Button();
	private Button bSave = new Button();
	private Button bDeleteAll = new Button();
	private Button bLoad = new Button();
	private Button bCancel = new Button();
	private Button bOk = new Button();
	private Button bRefresh = new Button();

    // @fchiappano Boton Adjuntar URL.
    private Button bLoadURL = new Button();

    // @fchiappano Campo que mostrara la URL en la ventana.
    private Urlbox urlBox = new Urlbox();
    private Panel urlPanel = new Panel();

    // @fchiappano Campo de texto que mostrara la info del adjunto, si el mismo
    // no se puede previsualizar.
    private Textbox infoAttachment = new Textbox();

	private Panel previewPanel = new Panel();

	private Borderlayout mainPanel = new Borderlayout();

	private Hbox toolBar = new Hbox();	
	
	private Hbox confirmPanel = new Hbox();

	private int displayIndex;

	public WAttachment(	int WindowNo, int AD_Attachment_ID,
			int AD_Table_ID, int Record_ID, String trxName)
	{
		this(WindowNo, AD_Attachment_ID, AD_Table_ID, Record_ID, trxName, (EventListener<Event>)null);
	}

	/**
	*	Constructor.
	*	loads Attachment, if ID <> 0
	*  @param WindowNo window no
	*  @param AD_Attachment_ID attachment
	*  @param AD_Table_ID table
	*  @param Record_ID record key
	*  @param trxName transaction
	*/
	
	public WAttachment(	int WindowNo, int AD_Attachment_ID,
				int AD_Table_ID, int Record_ID, String trxName, EventListener<Event> eventListener)
	{
		super();
		
		log.config("ID=" + AD_Attachment_ID + ", Table=" + AD_Table_ID + ", Record=" + Record_ID);

		m_WindowNo = WindowNo;
		if (eventListener != null) 
		{
			this.addEventListener(DialogEvents.ON_WINDOW_CLOSE, eventListener);
		}

		try
		{
			staticInit();
		}
		catch (Exception ex)
		{
			log.log(Level.SEVERE, "", ex);
		}
		
		//	Create Model
		
		if (AD_Attachment_ID == 0)
			m_attachment = new MAttachment (Env.getCtx(), AD_Table_ID, Record_ID, trxName);
		else
			m_attachment = new MAttachment (Env.getCtx(), AD_Attachment_ID, trxName);
		
		loadAttachments();

		try
		{
			setAttribute(Window.MODE_KEY, Window.MODE_HIGHLIGHTED);			
			AEnv.showWindow(this);
			displayData(0, true);
			String script = "setTimeout(\"zk.Widget.$('"+ preview.getUuid() + "').$n().src = zk.Widget.$('" +
					preview.getUuid() + "').$n().src\", 1000)";
			Clients.response(new AuScript(null, script));
			
			//enter modal
			doHighlighted();
		}
		catch (Exception e)
		{
		}
		
	} // WAttachment

	/**
	 *	Static setup.
	 *  <pre>
	 *  - northPanel
	 *      - toolBar
	 *      - title
	 *  - centerPane [split]
	 * 		- previewPanel (left)
	 *  	- text (right)
	 *  - confirmPanel
	 *  </pre>
	 *  @throws Exception
	 */
	
	void staticInit() throws Exception
	{
		this.setMaximizable(true);
		this.setWidth("700px");
		this.setHeight("600px");
		this.setTitle("Attachment");
		this.setClosable(true);
		this.setSizable(true);
		this.setBorder("normal");
		this.appendChild(mainPanel);
		mainPanel.setHeight("100%");
		mainPanel.setWidth("100%");		
		
		North northPanel = new North();
		northPanel.setCollapsible(false);
		northPanel.setSplittable(false);
		
		cbContent.setMold("select");
		cbContent.setRows(0);
		cbContent.addEventListener(Events.ON_SELECT, this);
		
		toolBar.appendChild(bLoad);
        toolBar.appendChild(bLoadURL);
		toolBar.appendChild(bDelete);
		toolBar.appendChild(bSave);
		toolBar.appendChild(cbContent);
		
		mainPanel.appendChild(northPanel);
		Div div = new Div();
		div.appendChild(toolBar);
		text.setRows(3);
		text.setWidth("100%");
		div.appendChild(text);
		northPanel.appendChild(div);
		
		bSave.setEnabled(false);
		bSave.setImage("/images/Export24.png");
		bSave.setTooltiptext(Msg.getMsg(Env.getCtx(), "AttachmentSave"));
		bSave.addEventListener(Events.ON_CLICK, this);

		bLoad.setImage("/images/Import24.png");
		bLoad.setTooltiptext(Msg.getMsg(Env.getCtx(), "Load"));
		bLoad.setUpload("true");
		bLoad.addEventListener(Events.ON_UPLOAD, this);

		bDelete.setImage("/images/Delete24.png");
		bDelete.setTooltiptext(Msg.getMsg(Env.getCtx(), "Delete"));
		bDelete.addEventListener(Events.ON_CLICK, this);

        // @fchiappano Boton adjuntar URL.
        bLoadURL.setImage("/images/Online24.png");
        bLoadURL.setTooltiptext(Msg.getMsg(Env.getCtx(), "Load") + " URL");
        bLoadURL.addEventListener(Events.ON_CLICK, this);

        // @fchiappano agregar panel y campo URL.
        urlBox.setVisible(false);
        urlBox.setButtonImage("/images/Online10.png");
        urlBox.getButton().setTarget("_blank");
        urlBox.getButton().addActionListener(this);
        urlPanel.appendChild(urlBox);
        urlBox.setHeight("100%");
        urlBox.setWidth("100%");
        urlBox.getTextbox().setReadonly(true);

        previewPanel.appendChild(urlBox);
		previewPanel.appendChild(preview);
		preview.setHeight("100%");
		preview.setWidth("100%");

        // @fchiappano agregar el campo de informacion al panel de
        // previsualización.
        infoAttachment.setHeight("100%");
        infoAttachment.setWidth("100%");
        infoAttachment.setReadonly(true);
        previewPanel.appendChild(infoAttachment);

		Center centerPane = new Center();
		centerPane.setAutoscroll(true);
		mainPanel.appendChild(centerPane);
//        centerPane.appendChild(urlBox);
		centerPane.appendChild(previewPanel);
		previewPanel.setVflex("1");
		previewPanel.setHflex("1");
		
		South southPane = new South();
		mainPanel.appendChild(southPane);
		southPane.appendChild(confirmPanel);
		southPane.setHeight("30px");
		
		bCancel.setImage("/images/Cancel24.png");
		bCancel.addEventListener(Events.ON_CLICK, this);

		bOk.setImage("/images/Ok24.png");
		bOk.addEventListener(Events.ON_CLICK, this);
		
		bDeleteAll.setImage("/images/Delete24.png");
		bDeleteAll.addEventListener(Events.ON_CLICK, this);
		
		bRefresh.setImage("/images/Refresh24.png");
		bRefresh.addEventListener(Events.ON_CLICK, this);
		
		confirmPanel.appendChild(bDeleteAll);
		confirmPanel.appendChild(bRefresh);
		confirmPanel.appendChild(bCancel);
		confirmPanel.appendChild(bOk);
		
		this.addEventListener(Events.ON_UPLOAD, this);
	}
	
	/**
	 * 	Dispose
	 */
	
	public void dispose ()
	{
		preview = null;
		this.detach();
	} // dispose
	
	/**
	 *	Load Attachments
	 */
	
	private void loadAttachments()
	{
		log.config("");
		
		//	Set Text/Description
		
		String sText = m_attachment.getTextMsg();
		
		if (sText == null)
			text .setText("");
		else
			text.setText(sText);

		//	Set Combo
		
		int size = m_attachment.getEntryCount();
		
		for (int i = 0; i < size; i++)
			cbContent.appendItem(m_attachment.getEntryName(i), m_attachment.getEntryName(i));
		
		if (size > 0)
		{
			cbContent.setSelectedIndex(0);					
		}		
		
	} // loadAttachment
	
	/**
	 *  Display gif or jpg in gifPanel
	 * 	@param index index
	 */
	
	private void displayData (int index, boolean immediate)
	{
		//	Reset UI		
		preview.setSrc(null);

		bDelete.setEnabled(false);
		bSave.setEnabled(false);
		
		displayIndex = index;

		if (immediate)
			displaySelected();
		else
			Clients.response(new AuEcho(this, "displaySelected", null));
	}   //  displayData

	/**
	 * Use to refresh preview frame, don't call directly.
	 */
	public void displaySelected() {
		MAttachmentEntry entry = m_attachment.getEntry(displayIndex); 
		log.config("Index=" + displayIndex + " - " + entry);
		if (entry != null && entry.getData() != null)
		{
			bSave.setEnabled(true);
			bDelete.setEnabled(true);
			
			log.config(entry.toStringX());

            // @fchiappano Verificar si se trata de una URL, recuperando el
            // sufijo correspondiente en el nombre.
            boolean esURL = false;
            String[] nombre = entry.getName().split("_");
            if (nombre[nombre.length - 1].equals("URL"))
                esURL = true;

            // @fchiappano Ocultar todos los campos de previsualización.
            preview.setVisible(false);
            infoAttachment.setVisible(false);
            urlBox.setVisible(false);

			try
			{
			    // @fchiappano si es una URL, mostrar el campo WURLEditor
                if (esURL)
                {
                    urlBox.setVisible(true);
                    urlBox.setText(new String(entry.getData()));
                }
                else
                {
                    // @fchiappano Solo si es una imagen o un PDF, desplegar la
                    // visualización en pantalla.
                    if (entry.isPDF() || entry.isGraphic())
                    {
                        AMedia media = new AMedia(entry.getName(), null, entry.getContentType(), entry.getData());

                        preview.setContent(media);
                        preview.invalidate();
                        preview.setVisible(true);
                    }
                    else
                    {
                        infoAttachment.setText(entry.toStringX());
                        infoAttachment.setVisible(true);
                    }
                }
			}
			catch (Exception e)
			{
				log.log(Level.SEVERE, "attachment", e);
			}
		}
	}
	
	/**
	 * 	Get File Name with index
	 *	@param index index
	 *	@return file name or null
	 */
	
	private String getFileName (int index)
	{
		String fileName = null;
	
		if (cbContent.getItemCount() > index)
		{
			ListItem listitem = cbContent.getItemAtIndex(index);
			fileName = (String)listitem.getValue();
		}
		
		return fileName;
	}	//	getFileName

	/**
	 *	Action Listener
	 *  @param e event
	 */
	
	public void onEvent(Event e)
	{
		//	Save and Close
		
		if (e instanceof UploadEvent)
		{
			preview.setVisible(false);
			UploadEvent ue = (UploadEvent) e;
			processUploadMedia(ue.getMedia());
		}
		else if (e.getTarget() == bOk)
		{
			String newText = text.getText();
			
			if (newText == null)
				newText = "";
			
			String oldText = m_attachment.getTextMsg();
			
			if (oldText == null)
				oldText = "";
			
			if (!m_change)
				m_change = !newText.equals(oldText);
			
			if (newText.length() > 0 || m_attachment.getEntryCount() > 0)
			{
				if (m_change)
				{
					m_attachment.setBinaryData(new byte[0]); // ATTENTION! HEAVY HACK HERE... Else it will not save :(
					m_attachment.setTextMsg(text.getText());
					m_attachment.saveEx();
				}
			}
			else
				m_attachment.delete(true);
			
			dispose();
		}
	
		//	Cancel
		
		else if (e.getTarget() == bCancel)
		{
			dispose();
		}
		
		//	Delete Attachment
		
		else if (e.getTarget() == bDeleteAll)
		{
			deleteAttachment();
			dispose();
		}
		
		//	Delete individual entry and Return
		
		else if (e.getTarget() == bDelete)
			deleteAttachmentEntry();
		
		//	Show Data
		
		else if (e.getTarget() == cbContent)
			displayData (cbContent.getSelectedIndex(), false);
		

        // @fchiappano Cargar Url.
        else if (e.getTarget() == bLoadURL)
            loadURL();

        // @fchiappano Accion del boton del URLBox.
        else if (e.getTarget() == urlBox.getButton())
        {
            String urlString = urlBox.getText();

            if (urlString != null && !urlString.equals(""))
                Executions.getCurrent().sendRedirect(urlString, "_blank");
        }

		//	Open Attachment
		
		else if (e.getTarget() == bSave)
			saveAttachmentToFile();
		
		else if (e.getTarget() == bRefresh)
			displayData(displayIndex, true);
		else if (e.getTarget() instanceof Timer)
			displayData(displayIndex, true);
		else if (e instanceof UploadEvent) 
		{
			UploadEvent ue = (UploadEvent) e;
			processUploadMedia(ue.getMedia());
		}
		
	}	//	onEvent
	
			
	private void processUploadMedia(Media media) {
		if (media != null)
		{
//				pdfViewer.setContent(media);
			;
		}
		else 
		{
			preview.setVisible(true);
			preview.invalidate();
			return;
		}
		
		
	
		String fileName = media.getName(); 
		log.config(fileName);
		int cnt = m_attachment.getEntryCount();
		
		//update		
		for (int i = 0; i < cnt; i++) 
		{
			if (m_attachment.getEntryName(i).equals(fileName))
			{
				m_attachment.updateEntry(i, getMediaData(media));
				cbContent.setSelectedIndex(i);
				displayData(cbContent.getSelectedIndex(), false);
				m_change = true;
				return;
			}
		}
		
		//new		
		if (m_attachment.addEntry(fileName, getMediaData(media)))
		{
			cbContent.appendItem(media.getName(), media.getName());
			cbContent.setSelectedIndex(cbContent.getItemCount()-1);
			displayData(cbContent.getSelectedIndex(), false);
			m_change = true;
		}
	}

	private byte[] getMediaData(Media media) {
		byte[] bytes = null;
		
		if (media.inMemory())
			bytes = media.getByteData();
		else {			
			InputStream is = media.getStreamData();
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			byte[] buf = new byte[ 1000 ];
			int byteread = 0;
			try {
				while (( byteread=is.read(buf) )!=-1)
					baos.write(buf,0,byteread);
			} catch (IOException e) {
				log.log(Level.SEVERE, e.getLocalizedMessage(), e);
				throw new IllegalStateException(e.getLocalizedMessage());
			}
			bytes = baos.toByteArray();
		}
						
		return bytes;
	}

	/**
	 *	Delete entire Attachment
	 */
	private void deleteAttachment()
	{
		log.info("");
		
		FDialog.ask(m_WindowNo, this, "AttachmentDelete?", new Callback<Boolean>() {
			
			@Override
			public void onCallback(Boolean result) 
			{
				if (result)
				{
					m_attachment.delete(true);
				}					
			}
		});	
	}	//	deleteAttachment

	/**
	 *	Delete Attachment Entry
	 */
	
	private void deleteAttachmentEntry()
	{
		log.info("");
		
		final int index = cbContent.getSelectedIndex();
		String fileName = getFileName(index);
		
		if (fileName == null)
			return;

		FDialog.ask(m_WindowNo, this, "AttachmentDeleteEntry?", new Callback<Boolean>() {

			@Override
			public void onCallback(Boolean result) 
			{
				if (result)
				{
					if (m_attachment.deleteEntry(index))
						cbContent.removeItemAt(index);

					m_change = true;
				}				
			}
		});	
	}	//	deleteAttachment

	/**
	 *	Save Attachment to File
	 */
	
	private void saveAttachmentToFile()
	{
		int index = cbContent.getSelectedIndex();
		log.info("index=" + index);
	
		if (m_attachment.getEntryCount() < index)
			return;

		MAttachmentEntry entry = m_attachment.getEntry(index);
		if (entry != null && entry.getData() != null)
		{
			try
			{
				AMedia media = new AMedia(entry.getName(), null, entry.getContentType(), entry.getData());
				Filedownload.save(media);
			}
			catch (Exception e)
			{
				log.log(Level.SEVERE, "attachment", e);
			}
		}
	}	//	saveAttachmentToFile

    /**
     * Lectura de URL a Adjuntar.
     *
     * @author fchiappano
     */
    private void loadURL()
    {
        log.info("");

        preview.setVisible(false);

        ValueNamePair url = null;

        try
        {
            url = URLPanel.showDialog("Por favor, ingrese un nombre/descripción y una dirección URL.", "Adjuntar URL");

            if (url == null)
            {
                preview.setVisible(true);
                preview.invalidate();
                return;
            }
        }
        catch (InterruptedException e)
        {
            log.log(Level.WARNING, e.getLocalizedMessage(), e);
        }

        String urlName = url.getName();
        String urlValue = url.getValue();

        // @fchiappano si la url ingresada, no tiene el protocolo, agregarlo.
        if (urlValue.indexOf("://") < 0)
        {
            urlValue = "http://" + urlValue;
        }

        log.config(urlName);
        int cnt = m_attachment.getEntryCount();

        // @fchiappano Actualizar URL Existente.
        for (int i = 0; i < cnt; i++)
        {
            if (m_attachment.getEntryName(i).equals(urlName))
            {
                m_attachment.updateEntry(i, urlValue.getBytes());
                cbContent.setSelectedIndex(i);
                displayData(cbContent.getSelectedIndex(), false);
                m_change = true;
                return;
            }
        }

        // @fchiappano agregar sufijo URL antes de agregar el adjunto.
        urlName = urlName + "_URL";

        // @fchiappano Crear un nuevo adjunto.
        if (m_attachment.addEntry(urlName, urlValue.getBytes()))
        {
            cbContent.appendItem(urlName, urlName);
            cbContent.setSelectedIndex(cbContent.getItemCount() - 1);
            displayData(cbContent.getSelectedIndex(), false);
            m_change = true;
        }
    } // loadURL

} // WAttachment
