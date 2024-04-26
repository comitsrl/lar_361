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

package org.adempiere.webui.grid;

import java.util.logging.Level;

import org.adempiere.webui.apps.AEnv;
import org.adempiere.webui.component.ConfirmPanel;
import org.adempiere.webui.component.Label;
import org.adempiere.webui.component.ListItem;
import org.adempiere.webui.component.Listbox;
import org.adempiere.webui.component.Textbox;
import org.adempiere.webui.component.VerticalBox;
import org.adempiere.webui.component.Window;
import org.adempiere.webui.editor.WLocationEditor;
import org.adempiere.webui.editor.WTableDirEditor;
import org.adempiere.webui.event.ValueChangeEvent;
import org.adempiere.webui.event.ValueChangeListener;
import org.adempiere.webui.window.FDialog;
import org.compiere.model.MBPartner;
import org.compiere.model.MBPartnerLocation;
import org.compiere.model.MLocation;
import org.compiere.model.MLocationLookup;
import org.compiere.model.MLookup;
import org.compiere.model.MLookupFactory;
import org.compiere.model.MRole;
import org.compiere.model.Query;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.DisplayType;
import org.compiere.util.Env;
import org.compiere.util.KeyNamePair;
import org.compiere.util.Msg;
import org.globalqss.model.X_LCO_ISIC;
import org.zkoss.zk.ui.Component;
import org.zkoss.zk.ui.WrongValueException;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zk.ui.event.Events;
import org.zkoss.zul.Hbox;
import org.zkoss.zul.Separator;

import ar.com.ergio.util.LAR_Utils;

/**
 * Business Partner : Based on VBPartner
 *
 * @author 	Niraj Sohun
 * 			Aug 15, 2007
 *
 */

public class WBPartner extends Window implements EventListener<Event>, ValueChangeListener
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 5842369060073088746L;

	private static CLogger log = CLogger.getCLogger(WBPartner.class);
	
	private int m_WindowNo;
	
	/** The Partner				*/
	private MBPartner m_partner = null;
	
	/** The Location			*/
	private MBPartnerLocation m_pLocation = null;
	
	/** Read Only				*/
	private boolean m_readOnly = false;

    // @fchiappano Lista de datos de los combosboxs
    private KeyNamePair[] m_categoriaIva, m_tipoIIBB, m_tipoDocumento;

    // @fchiappano Nuevos componentes agregados para implementación estandar de LAR.
    private Listbox fCategoriaIva;
    private Listbox fTipoIIBB;
    private Textbox fCUIT = new Textbox();
    private Textbox fNroIIBB = new Textbox();
    private WTableDirEditor fListaPrecio;
    private WTableDirEditor fCondVenta;

	private Textbox fName = new Textbox();
	private Textbox fName2 = new Textbox();
	private Textbox fEMail = new Textbox();
	private Textbox fPhone = new Textbox();
	private Textbox fPhone2 = new Textbox();
	private Textbox fFax = new Textbox();
	
	private WLocationEditor fAddress;/* = new WLocationDialog();*/
	
	private VerticalBox centerPanel = new VerticalBox();
	
	private ConfirmPanel confirmPanel = new ConfirmPanel(true, false, false, false, false, false);
	
	/**
	 *	Constructor.
	 *	Requires call loadBPartner
	 * 	@param frame	parent
	 * 	@param WindowNo	Window No
	 */
	
	public WBPartner(int WindowNo)
	{
		super();
		
		m_WindowNo = WindowNo;
		m_readOnly = !MRole.getDefault().canUpdate(
			Env.getAD_Client_ID(Env.getCtx()), Env.getAD_Org_ID(Env.getCtx()), 
			MBPartner.Table_ID, 0, false);
		log.info("R/O=" + m_readOnly);
		
		try
		{
			jbInit();
		}
		catch(Exception ex)
		{
			log.log(Level.SEVERE, ex.getMessage());
		}
		
		initBPartner();
		
	}	//	WBPartner
	
	/**
	 *	Static Init
	 * 	@throws Exception
	 */
	
	void jbInit() throws Exception
	{
		this.setWidth("350px");
		this.setBorder("normal");
		this.setClosable(true);
		this.setTitle("Socio del Negocio");
		this.appendChild(centerPanel);
		this.appendChild(confirmPanel);
		
		confirmPanel.addActionListener(Events.ON_CLICK, this);
	}
	
	/**
	 *	Dynamic Init
	 */
	private void initBPartner()
	{
        // @fchiappano recuperar data de los combos.
        m_categoriaIva = fillCategoriaIva();
        m_tipoIIBB = fillTipoIIBB();
        m_tipoDocumento = fillTipoDocumento();

        // @fchiappano Determinar si se trata de una trasacción de compras o ventas.
        boolean isSOTrx = !"N".equals(Env.getContext(Env.getCtx(), m_WindowNo, "IsSOTrx"));

        // @fchiappano Categoría de Iva
        fCategoriaIva = new Listbox(m_categoriaIva);
        fCategoriaIva.setMold("select");
        createLine(fCategoriaIva, "LCO_TaxPayerType_ID", false);

        // @fchiappano CUIT
        fCUIT.addEventListener(Events.ON_BLUR, this);
        createLine (fCUIT, "CUIT/DNI", false);

		//	Name
		fName.addEventListener(Events.ON_CLICK, this);
        createLine(fName, "Raz\u00f3n Social", false)/*.setFontBold(true)*/;

		//	Name2
        createLine(fName2, "Nombre Comercial", false);

        // @fchiappano Tipo de IIBB
        fTipoIIBB = new Listbox(m_tipoIIBB);
        fTipoIIBB.setMold("select");
        // @fchiappano setear el valor por defecto en el combo
        KeyNamePair defaultValue = getTipoIIBBDefault();
        if (defaultValue != null)
            fTipoIIBB.setSelectedKeyNamePair(defaultValue);
        createLine(fTipoIIBB, "LCO_ISIC_ID", false);

        // @fchiappano Si el navegador es firefox, forzar un estilo mas chico para los combos.
        if (AEnv.isFirefox2())
        {
            fCategoriaIva.setStyle("font-size:xx-small");
            fTipoIIBB.setStyle("font-size:xx-small");
        }

        // @fchiappano Nro de IIBB
        createLine(fNroIIBB, "DUNS", false);

        // @fchiappano Campo Lista de precios
        int m_PriceList_Column_ID = 0;
        if (isSOTrx)
            m_PriceList_Column_ID = 2930; // C_BPartner.M_PriceList_ID
        else
            m_PriceList_Column_ID = 2931; // C_BPartner.PO_PriceList_ID
        final MLookup lookupPriceList = MLookupFactory.get(Env.getCtx(), 0, 0, m_PriceList_Column_ID,
                DisplayType.Table);
        fListaPrecio = new WTableDirEditor("M_PriceList_ID", true, false, true, lookupPriceList);
        createLine(fListaPrecio.getComponent(), "Lista de Precios", false);

        // @fchiappano Condición de Venta.
        final int m_CondVenta_Column_ID = 3084; // C_BPartner.PaymentRule
        final MLookup lookupCondVenta = MLookupFactory.get(Env.getCtx(), 0, 0, m_CondVenta_Column_ID, DisplayType.List);
        fCondVenta = new WTableDirEditor("M_PriceList_ID", true, false, true, lookupCondVenta);
        createLine(fCondVenta.getComponent(), "Cond. de Venta", false);

		//	Email
		createLine (fEMail, "EMail", false);
		
		//	Location
		boolean ro = m_readOnly;
		
		if (!ro)
			ro = !MRole.getDefault().canUpdate(
				Env.getAD_Client_ID(Env.getCtx()), Env.getAD_Org_ID(Env.getCtx()), 
				MBPartnerLocation.Table_ID, 0, false);
		
		if (!ro)
			ro = !MRole.getDefault().canUpdate(
				Env.getAD_Client_ID(Env.getCtx()), Env.getAD_Org_ID(Env.getCtx()), 
				MLocation.Table_ID, 0, false);
		
		fAddress = new WLocationEditor("C_Location_ID", false, ro, true, 
				new MLocationLookup (Env.getCtx(), m_WindowNo));
		fAddress.addValueChangeListener(this);
		fAddress.setValue (null);
		createLine (fAddress.getComponent(), "C_Location_ID", true)/*.setFontBold(true)*/;
		
		//	Phone
		createLine (fPhone, "Phone", true);
		
		//	Phone2
		createLine (fPhone2, "Phone2", false);
		
		//	Fax
		createLine (fFax, "Fax", false);
	}	//	initBPartner

	/**
	 * 	Create Line
	 * 	@param field 	field
	 * 	@param title	label value
	 * 	@param addSpace	add more space
	 * 	@return label
	 */
	
	private Label createLine (Component field, String title, boolean addSpace)
	{
		Hbox hbox = new Hbox(); 
		
		hbox.setWidth("100%");
		hbox.setWidths("30%, 70%");
		
		Label label = new Label(Msg.translate(Env.getCtx(), title));
		hbox.appendChild(label);

		hbox.appendChild(field);
		
		centerPanel.appendChild(hbox);
		centerPanel.appendChild(new Separator());
		
		return label;
	}	//	createLine

	/**
	 *	Load BPartner
	 *  @param C_BPartner_ID - existing BPartner or 0 for new
	 * 	@return true if loaded
	 */
	
	public boolean loadBPartner (int C_BPartner_ID)
	{
		log.config("C_BPartner_ID=" + C_BPartner_ID);
		
		//  New bpartner
		if (C_BPartner_ID == 0)
		{
			m_partner = null;
			m_pLocation = null;
			return true;
		}

		m_partner = new MBPartner (Env.getCtx(), C_BPartner_ID, null);
		
		if (m_partner.get_ID() == 0)
		{
			FDialog.error(m_WindowNo, this, "BPartnerNotFound");
			return false;
		}

		// @fchiappano Leer valores del SdN.
        fCUIT.setText(m_partner.getTaxID());
        fCategoriaIva.setSelectedKeyNamePair(getCategoriaIva(m_partner.get_ValueAsInt("LCO_TaxPayerType_ID")));
        fName.setText(m_partner.getName());
        fName2.setText(m_partner.getName2());
        fTipoIIBB.setSelectedKeyNamePair(getTipoIIBB(m_partner.get_ValueAsInt("LCO_ISIC_ID")));
        fNroIIBB.setText(m_partner.getDUNS());
        fEMail.setText(m_partner.get_ValueAsString("EMail"));
        fListaPrecio.setValue(m_partner.getM_PriceList_ID());
        fCondVenta.setValue(m_partner.getPaymentRule());

		//	Contact - Load values
		m_pLocation = m_partner.getLocation(
			Env.getContextAsInt(Env.getCtx(), m_WindowNo, "C_BPartner_Location_ID"));
		
		if (m_pLocation != null)
		{
			int location = m_pLocation.getC_Location_ID();
			fAddress.setValue (new Integer(location));
			
			fPhone.setText(m_pLocation.getPhone());
			fPhone2.setText(m_pLocation.getPhone2());
			fFax.setText(m_pLocation.getFax());
		}

		return true;
	}	//	loadBPartner

	/**
	 *	Save.
	 *	Checks mandatory fields and saves Partner, Contact and Location
	 * 	@return true if saved
	 */
	
	private boolean actionSave()
	{
		log.config("");

        // Chequea la consistencia de la categoria de IVA y el CUIT
        if (!checkBPartnerData())
            return false;

		//	Check Mandatory fields
		if (fName.getText().equals(""))
		{
			throw new WrongValueException(fName, Msg.translate(Env.getCtx(), "FillMandatory"));
		}
			
		if (fAddress.getC_Location_ID() == 0)
		{
			throw new WrongValueException(fAddress.getComponent(), Msg.translate(Env.getCtx(), "FillMandatory"));
		}

        boolean isSOTrx = !"N".equals(Env.getContext(Env.getCtx(), m_WindowNo, "IsSOTrx"));

		//	***** Business Partner *****
		
		if (m_partner == null)
		{
			int AD_Client_ID = Env.getAD_Client_ID(Env.getCtx());
			m_partner = MBPartner.getTemplate(Env.getCtx(), AD_Client_ID);
            m_partner.setAD_Org_ID(0); // @fchiappano Organización * por defecto.
			m_partner.setIsCustomer (isSOTrx);
			m_partner.setIsVendor (!isSOTrx);
		}

        m_partner.setTaxID(fCUIT.getText());
        m_partner.setName(fName.getText());
        m_partner.setName2(fName2.getText());
        KeyNamePair p = fCategoriaIva.getSelectedItem().toKeyNamePair();
        if (p != null && p.getKey() > 0)
        {
            m_partner.set_ValueOfColumn("LCO_TaxPayerType_ID", p.getKey());

            // Determina el Calificador de Documento, necesario para el
            // Controlador Fiscal
            // Consumidor Final ==> DNI - RI,RM,EX,NC ==> CUIT
            KeyNamePair dni = getTipoDocumento("DNI");
            KeyNamePair cuit = getTipoDocumento("CUIT");
            if (p.getName().equals("ConsumidorFinal"))
            {
                if (dni != null && dni.getKey() > 0)
                    m_partner.set_ValueOfColumn("LCO_TaxIdType_ID", dni.getKey());
            }
            else
            {
                if (cuit != null && cuit.getKey() > 0)
                    m_partner.set_ValueOfColumn("LCO_TaxIdType_ID", cuit.getKey());
            }
        }
        else
            m_partner.set_ValueOfColumn("LCO_TaxPayerType_ID", null);

        p = fTipoIIBB.getSelectedItem().toKeyNamePair();
        if (p != null && p.getKey() > 0)
            m_partner.set_ValueOfColumn("LCO_ISIC_ID", p.getKey());

        m_partner.setDUNS(fNroIIBB.getText());
        m_partner.set_ValueOfColumn("EMail", fEMail.getText());

        String condVenta = (String) fCondVenta.getValue();
        if (condVenta != null && !condVenta.equals(""))
        {
            // @fchiappano Setear la lista de precios, en el campo que
            // corresponda según si se esta dando de alta un cliente o un proveedor.
            if (isSOTrx)
                m_partner.setPaymentRule(condVenta);
            else
                m_partner.setPaymentRulePO(condVenta);
        }

        Integer listaPrecio = (Integer) fListaPrecio.getValue();
        if (listaPrecio != null && listaPrecio > 0)
        {
            // @fchiappano Setear la lista de precios, en el campo que
            // corresponda según si se esta dando de alta un cliente o un proveedor.
            if (isSOTrx)
                m_partner.setM_PriceList_ID(listaPrecio);
            else
                m_partner.setPO_PriceList_ID(listaPrecio);
        }

        if (m_partner.save())
            log.fine("C_BPartner_ID=" + m_partner.getC_BPartner_ID());
        else
        {
            FDialog.error(m_WindowNo, this, "BPartnerNotSaved");
            return false;
        }

        // ***** Business Partner - Location *****
        if (m_pLocation == null)
            m_pLocation = new MBPartnerLocation(m_partner);
        m_pLocation.setC_Location_ID(fAddress.getC_Location_ID());
        //
        m_pLocation.setPhone(fPhone.getText());
        m_pLocation.setPhone2(fPhone2.getText());
        m_pLocation.setFax(fFax.getText());
        if (m_pLocation.save())
            log.fine("C_BPartner_Location_ID=" + m_pLocation.getC_BPartner_Location_ID());
        else
        {
            FDialog.error(m_WindowNo, this, "BPartnerNotSaved", Msg.translate(Env.getCtx(), "C_BPartner_Location_ID"));
            return false;
        }

		return true;
	}	//	actionSave

	/**
	 *	Returns BPartner ID
	 *	@return C_BPartner_ID (0 = not saved)
	 */
	
	public int getC_BPartner_ID()
	{
		if (m_partner == null)
			return 0;
		
		return m_partner.getC_BPartner_ID();
	}	//	getBPartner_ID

	public void onEvent(Event e) throws Exception 
	{
		if (m_readOnly)
			this.detach();

        // @fchiappano Validar duplicidad de CUIT.
        if (e.getTarget() == fCUIT)
        {
            // Solo realiza el chequeo en el "alta" de la operación, no en la
            // "actualización"
            if (m_partner == null && LAR_Utils.checkDuplicateCUIT(fCUIT.getText(), 0))
                FDialog.warn(m_WindowNo, WBPartner.this, "El CUIT/DNI ingresado ya existe", "");
        }

		//	OK pressed
		else if ((e.getTarget() == confirmPanel.getButton("Ok")) && actionSave())
			this.detach();
		
		//	Cancel pressed
		else if (e.getTarget() == confirmPanel.getButton("Cancel"))
			this.detach();
		
	}

    /**
     * Verifica la consistencia de la categoría de IVA y el Nro de CUIT
     */
    private boolean checkBPartnerData()
    {
        // Si no es consumidor final, el cuit no puede ser 0
        ListItem item = fCategoriaIva.getSelectedItem();
        if (item == null || ((Integer)item.getValue()) <= 0)
        {
            throw new WrongValueException(fCategoriaIva, Msg.translate(Env.getCtx(), "FillMandatory"));
        }

        KeyNamePair p = item.toKeyNamePair();
        if (p != null && !p.getName().equals("ConsumidorFinal"))
        {
            if (fCUIT.getText() == null && fCUIT.getText().equals(""))
            {
                FDialog.error(m_WindowNo, this, "Tiene que ingresar el CUIT");
                return false;
            }
            else if (!LAR_Utils.validateCUIT(fCUIT.getText()))
            {
                FDialog.error(m_WindowNo, this, "El CUIT es inv\u00e1lido");
                return false;
            }
        }
        else
        // Si es consumidor final y el cuit está vacío, se asigna el por defecto
        {
            if (fCUIT.getText() == null || fCUIT.getText().equals(""))
                fCUIT.setText("00000000");
        }

        // @fchiappano Chequear que se haya ingresado un tipo de IIBB.
        item = fTipoIIBB.getSelectedItem();
        if (item == null || ((Integer) item.getValue()) <= 0)
        {
            throw new WrongValueException(fTipoIIBB, Msg.translate(Env.getCtx(), "FillMandatory"));
        }

        // @fchiappano Chequear el ingreso de lista de precio y condicion de
        // venta.
        Integer listaPrecios = (Integer) fListaPrecio.getValue();
        if (listaPrecios == null || listaPrecios < 0)
        {
            throw new WrongValueException(fListaPrecio.getComponent(), Msg.translate(Env.getCtx(), "FillMandatory"));
        }

        String condVenta = (String) fCondVenta.getValue();
        if (condVenta == null || condVenta.equals(""))
        {
            throw new WrongValueException(fCondVenta.getComponent(), Msg.translate(Env.getCtx(), "FillMandatory"));
        }

        return true;
    } // checkBPartnerData

    /**
     * Recupera los tipos de documentos
     * @return KeyNamePair arreglo de tipos de documento
     */
    private KeyNamePair[] fillTipoDocumento()
    {
        String sql = "SELECT LCO_TaxIdType_ID, Name FROM LCO_TaxIdType WHERE IsActive='Y' ORDER BY 2";
        sql = MRole.getDefault().addAccessSQL(sql, "LCO_TaxIdType", MRole.SQL_NOTQUALIFIED, MRole.SQL_RO);
        return DB.getKeyNamePairs(sql, true);
    } // fillTipoDocumento

    /**
     * Recupera las categorias de IVA
     * @author fchiappano
     * @return KeyNamePair arreglo de categorías
     */
    private KeyNamePair[] fillCategoriaIva()
    {
        String sql = "SELECT LCO_TaxPayerType_ID, Name FROM LCO_TaxPayerType WHERE IsActive='Y' ORDER BY 2";
        sql = MRole.getDefault().addAccessSQL(sql, "LCO_TaxPayerType", MRole.SQL_NOTQUALIFIED, MRole.SQL_RO);
        return DB.getKeyNamePairs(sql, true);
    } // fillCategoriaIva

    /**
     * Recupera los tipos de IIBB
     * @author fchiappano
     * @return KeyNamePair arreglo de tipos de IIBB
     */
    private KeyNamePair[] fillTipoIIBB()
    {
        String sql = "SELECT LCO_ISIC_ID, Name FROM LCO_ISIC WHERE IsActive='Y' ORDER BY 2";
        sql = MRole.getDefault().addAccessSQL(sql, "LCO_ISIC", MRole.SQL_NOTQUALIFIED, MRole.SQL_RO);
        return DB.getKeyNamePairs(sql, true);
    } // fillTipoIIBB

    /**
     * Recuperar el Tipo de IIBB por defecto.
     * @author fchiappano
     * @return predeterminado o null
     */
    private KeyNamePair getTipoIIBBDefault()
    {
        String where = "IsActive = 'Y' AND IsDefault = 'Y' AND AD_Client_ID = ?";
        X_LCO_ISIC retValue = new Query(Env.getCtx(), X_LCO_ISIC.Table_Name, where, null)
                .setParameters(Env.getAD_Client_ID(Env.getCtx())).firstOnly();

        if (retValue != null && retValue.getLCO_ISIC_ID() > 0)
            return new KeyNamePair(retValue.getLCO_ISIC_ID(), retValue.getName());

        return null;
    } // getTipoIIBBDefault

    /**
     * Busca un tipo de IIBB
     *
     * @param key LCO_ISIC_ID
     * @return Categoría de IVA
     */
    private KeyNamePair getTipoIIBB(int key)
    {
        for (int i = 0; i < m_tipoIIBB.length; i++)
        {
            KeyNamePair p = (KeyNamePair) m_tipoIIBB[i];
            if (p.getKey() == key)
                return p;
        }
        return new KeyNamePair(-1, " ");
    } // getTipoIIBB

    /**
     * Busca una categoría de IVA
     * @param key LCO_TaxPayerType_ID
     * @return Categoría de IVA
     */
    private KeyNamePair getCategoriaIva(int key)
    {
        for (int i = 0; i < m_categoriaIva.length; i++)
        {
            KeyNamePair p = (KeyNamePair) m_categoriaIva[i];
            if (p.getKey() == key)
                return p;
        }
        return new KeyNamePair(-1, " ");
    } // getCategoriaIva

    /**
     * Busca un tipo de documento
     *
     * @param key Nombre del documento
     * @return tipo de documento
     */
    private KeyNamePair getTipoDocumento(String key)
    {
        for (int i = 0; i < m_tipoDocumento.length; i++)
        {
            KeyNamePair p = (KeyNamePair) m_tipoDocumento[i];
            if (p.getName().equals(key))
                return p;
        }
        return new KeyNamePair(-1, " ");
    } // getTipoDocumento

	public void valueChange(ValueChangeEvent evt)
	{
		
	}
}