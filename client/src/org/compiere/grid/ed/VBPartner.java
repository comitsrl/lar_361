/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved.                *
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
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
package org.compiere.grid.ed;

import java.awt.BorderLayout;
import java.awt.Frame;
import java.awt.GridBagConstraints;
import java.awt.GridBagLayout;
import java.awt.Insets;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.FocusAdapter;
import java.awt.event.FocusEvent;
import java.util.List;
import java.util.logging.Level;

import javax.swing.Box;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JComboBox;
import javax.swing.JComponent;

import org.adempiere.plaf.AdempierePLAF;
import org.compiere.apps.ADialog;
import org.compiere.apps.AEnv;
import org.compiere.apps.ConfirmPanel;
import org.compiere.model.MBPartner;
import org.compiere.model.MBPartnerLocation;
import org.compiere.model.MLocation;
import org.compiere.model.MLocationLookup;
import org.compiere.model.MLookup;
import org.compiere.model.MLookupFactory;
import org.compiere.model.MRole;
import org.compiere.swing.CComboBox;
import org.compiere.swing.CDialog;
import org.compiere.swing.CLabel;
import org.compiere.swing.CPanel;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.DisplayType;
import org.compiere.util.Env;
import org.compiere.util.KeyNamePair;
import org.compiere.util.Msg;
import org.compiere.util.ValueNamePair;

import ar.com.ergio.util.LAR_Utils;

/**
 *	Business Partner Editor.
 *	Set BPartner: loadBPartner
 *	Get result: getC_BPartner_ID
 *
 *  @author 	Jorg Janke
 *  @version 	$Id: VBPartner.java,v 1.2 2006/07/30 00:51:28 jjanke Exp $
 *  @contributor Emiliano Pereyra - http://www.ergio.com.ar
 */
public final class VBPartner extends CDialog implements ActionListener
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -4130643780412193122L;


	/**
	 *	Constructor.
	 *	Requires call loadBPartner
	 * 	@param frame	parent
	 * 	@param WindowNo	Window No
	 */
	public VBPartner(Frame frame, int WindowNo)
	{
		super(frame, Msg.translate(Env.getCtx(), "C_BPartner_ID"), true);
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
		//
		AEnv.positionCenterWindow(frame, this);
	}	//	VBPartner

	private int 			m_WindowNo;
	/** The Partner				*/
	private MBPartner		m_partner = null;
	/** The Location			*/
	private MBPartnerLocation	m_pLocation = null;
	/** The User				*/
	//private MUser			m_user = null;
	/** Read Only				*/
	private boolean			m_readOnly = false;

	
	private Insets			m_labelInsets = new Insets(2,15,2,0);		// 	top,left,bottom,right
	private Insets			m_fieldInsets = new Insets(2,5,2,10);		// 	top,left,bottom,right
	private GridBagConstraints m_gbc = new GridBagConstraints();
	private int				m_line;
	private Object[]		m_categoriaIva, m_tipoIIBB, m_tipoDocumento;
	/**	Logger			*/
	private static CLogger log = CLogger.getCLogger(VBPartner.class);
	//
	private VString	fCUIT, fName, fName2, fNroIIBB, fPhone, fFax, fPhone2, fEMail;
	private VLocation 		fAddress;
	private JComboBox 		fCategoriaIva, fTipoIIBB, fListaPrecio, fCondVenta;
	//
	private CPanel mainPanel = new CPanel();
	private BorderLayout mainLayout = new BorderLayout();
	private CPanel centerPanel = new CPanel();
	private CPanel southPanel = new CPanel();
	private GridBagLayout centerLayout = new GridBagLayout();
	private ConfirmPanel confirmPanel = new ConfirmPanel(true);
	private BorderLayout southLayout = new BorderLayout();

	
	/**
	 *	Static Init
	 * 	@throws Exception
	 */
	void jbInit() throws Exception
	{
		mainPanel.setLayout(mainLayout);
		southPanel.setLayout(southLayout);
		centerPanel.setLayout(centerLayout);
		mainLayout.setVgap(5);
		getContentPane().add(mainPanel);
		mainPanel.add(centerPanel, BorderLayout.CENTER);
		mainPanel.add(southPanel, BorderLayout.SOUTH);
		southPanel.add(confirmPanel, BorderLayout.CENTER);
		//
		confirmPanel.addActionListener(this);
	}	//	jbInit

	/**
	 *	Dynamic Init
	 */
	private void initBPartner()
	{
		//	Get Data
		m_categoriaIva = fillCategoriaIva();
		m_tipoIIBB = fillTipoIIBB();
		m_tipoDocumento = fillTipoDocumento();

		//	Display
		m_gbc.anchor = GridBagConstraints.NORTHWEST;
		m_gbc.gridx = 0;
		m_gbc.gridy = 0;
		m_gbc.gridwidth = 1;
		m_gbc.weightx = 0;
		m_gbc.weighty = 0;
		m_gbc.fill = GridBagConstraints.HORIZONTAL;
		m_gbc.ipadx = 0;
		m_gbc.ipady = 0;
		m_line = 0;

        //  Categoría de Iva
        fCategoriaIva = new JComboBox (m_categoriaIva);
        createLine (fCategoriaIva, "LCO_TaxPayerType_ID", false);
        //	CUIT
		fCUIT = new VString("TaxId", false, false, true, 30, 60, "", null);
		fCUIT.addFocusListener(new CheckDuplicateCuitListener());
		createLine (fCUIT, "CUIT/DNI", false);

		//	Name
		fName = new VString("Name", true, false, true, 30, 60, "", null);
		fName.addActionListener(this);
		createLine (fName, "Raz\u00f3n Social", false);
		//	Name2
		fName2 = new VString("Name2", true, false, true, 30, 60, "", null);
		createLine (fName2, "Nombre Comercial", false);

		// Tipo de IIBB
		fTipoIIBB = new JComboBox(m_tipoIIBB);
		fTipoIIBB.setSelectedIndex(6); // "Sin documentacion" por defecto
		createLine (fTipoIIBB, "LCO_ISIC_ID", false);
		// Nro de IIBB
		fNroIIBB = new VString("DUNS", false, false, true, 30, 40, "", null);
		createLine (fNroIIBB, "DUNS", false);

		// Lista de Precios
		// @fchiappano Campo Lista de precios
        final int m_PriceList_Column_ID = 3789; // C_Order.M_PriceList_ID
        final MLookup lookupPriceList = MLookupFactory.get(Env.getCtx(), 0, 0, m_PriceList_Column_ID, DisplayType.Table);
        final List<Object> ccs = lookupPriceList.getData(false, false, true, true);
        final DefaultComboBoxModel ccsModel = new DefaultComboBoxModel(ccs.toArray());
        fListaPrecio = new CComboBox(ccsModel);
        createLine(fListaPrecio, "Lista de Precios", false);

        // @fchiappano Condición de Venta.
        final int m_CondVenta_Column_ID = 3084; // C_BPartner.PaymentRule
        final MLookup lookupCondVenta = MLookupFactory.get(Env.getCtx(), 0, 0, m_CondVenta_Column_ID, DisplayType.List);
        final List<Object> ccs_CondVenta = lookupCondVenta.getData(false, false, true, true);
        final DefaultComboBoxModel ccsModel_CondVenta = new DefaultComboBoxModel(ccs_CondVenta.toArray());
        fCondVenta = new CComboBox(ccsModel_CondVenta);
        createLine(fCondVenta, "Cond. de Venta", false);

		// Email
		// @emmie - Se agregó el campo a la tabla y ventana de BPs
		fEMail = new VString("EMail", false, false, true, 30, 40, "", null);
		createLine (fEMail, "Correo electr\u00f3nico", false);
		
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
		fAddress = new VLocation ("C_Location_ID", false, ro, true, new MLocationLookup (Env.getCtx(), m_WindowNo));
		fAddress.setValue (null);
		createLine (fAddress, "C_Location_ID", true);
		//	Phone
		fPhone = new VString("Phone", false, false, true, 30, 40, "", null);
		createLine (fPhone, "Phone", false);
		//	Phone2
		fPhone2 = new VString("Phone2", false, false, true, 30, 40, "", null);
		createLine (fPhone2, "Phone2", false);
		//	Fax
		fFax = new VString("Fax", false, false, true, 30, 40, "", null);
		createLine (fFax, "Fax", false);
		//
		fName.setBackground(AdempierePLAF.getFieldBackground_Mandatory());
		fAddress.setBackground(AdempierePLAF.getFieldBackground_Mandatory());
	}	//	initBPartner

	/**
	 * 	Create Line
	 * 	@param field 	field
	 * 	@param title	label value
	 * 	@param addSpace	add more space
	 * 	@return label
	 */
	private CLabel createLine (JComponent field, String title, boolean addSpace)
	{
		if (addSpace)
		{
			m_gbc.gridy = m_line++;
			m_gbc.gridx = 1;
			m_gbc.insets = m_fieldInsets;
			centerPanel.add (Box.createHorizontalStrut(6), m_gbc);
		}

		//	Line
		m_gbc.gridy = m_line++;

		//	Label
		m_gbc.gridx = 0;
		m_gbc.insets = m_labelInsets;
		m_gbc.fill = GridBagConstraints.HORIZONTAL;
		CLabel label = new CLabel(Msg.translate(Env.getCtx(), title));
		centerPanel.add(label, m_gbc);

		//	Field
		m_gbc.gridx = 1;
		m_gbc.insets = m_fieldInsets;
		m_gbc.fill = GridBagConstraints.HORIZONTAL;
		centerPanel.add(field, m_gbc);
		if (m_readOnly)
			field.setEnabled(false);
		return label;
	}	//	createLine

    /**
     * Recupera las categorias de IVA
     * @return KeyNamePair arreglo de categorías
     */
    private Object[] fillCategoriaIva()
    {
        String sql = "SELECT LCO_TaxPayerType_ID, Name FROM LCO_TaxPayerType WHERE IsActive='Y' ORDER BY 2";
        sql = MRole.getDefault().addAccessSQL(sql, "LCO_TaxPayerType", MRole.SQL_NOTQUALIFIED, MRole.SQL_RO);
        return DB.getKeyNamePairs(sql, true);
    } // fillCategoriaIva

    /**
     * Recupera los tipos de IIBB
     * @return KeyNamePair arreglo de tipos de IIBB
     */
    private Object[] fillTipoIIBB()
    {
        String sql = "SELECT LCO_ISIC_ID, Name FROM LCO_ISIC WHERE IsActive='Y' ORDER BY 2";
        sql = MRole.getDefault().addAccessSQL(sql, "LCO_ISIC", MRole.SQL_NOTQUALIFIED, MRole.SQL_RO);
        return DB.getKeyNamePairs(sql, true);
    } // fillTipoIIBB

    /**
     * Recupera los tipos de documentos
     * @return KeyNamePair arreglo de tipos de documento
     */
    private Object[] fillTipoDocumento()
    {
        String sql = "SELECT LCO_TaxIdType_ID, Name FROM LCO_TaxIdType WHERE IsActive='Y' ORDER BY 2";
        sql = MRole.getDefault().addAccessSQL(sql, "LCO_TaxIdType", MRole.SQL_NOTQUALIFIED, MRole.SQL_RO);
        return DB.getKeyNamePairs(sql, true);
    } // fillTipoDocumento

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
     * Busca un tipo de IIBB
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
     * Busca un tipo de documento
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
			ADialog.error(m_WindowNo, this, "BPartnerNotFound");
			return false;
		}

		//	BPartner - Load values
		fCUIT.setText(m_partner.getTaxID());
		fCategoriaIva.setSelectedItem(getCategoriaIva(m_partner.get_ValueAsInt("LCO_TaxPayerType_ID")));
		fName.setText(m_partner.getName());
		fName2.setText(m_partner.getName2());
		fTipoIIBB.setSelectedItem(getTipoIIBB(m_partner.get_ValueAsInt("LCO_ISIC_ID")));
		fNroIIBB.setText(m_partner.getDUNS());
		fEMail.setText(m_partner.get_ValueAsString("EMail"));

		//	Contact - Load values
		m_pLocation = m_partner.getLocation(
			Env.getContextAsInt(Env.getCtx(), m_WindowNo, "C_BPartner_Location_ID"));
		if (m_pLocation != null)
		{
			int location = m_pLocation.getC_Location_ID();
			fAddress.setValue (new Integer(location));
			//
			fPhone.setText(m_pLocation.getPhone());
			fPhone2.setText(m_pLocation.getPhone2());
			fFax.setText(m_pLocation.getFax());
		}
		return true;
	}	//	loadBPartner


	/**
	 *	Action Listener
	 * 	@param e event
	 */
	public void actionPerformed(ActionEvent e)
	{
		if (m_readOnly)
			dispose();
		//	OK pressed
		else if (e.getActionCommand().equals(ConfirmPanel.A_OK) 
			&& actionSave())
			dispose();
		//	Cancel pressed
		else if (e.getActionCommand().equals(ConfirmPanel.A_CANCEL))
			dispose();
	}	//	actionPerformed

	/**
	 * Verifica la consistencia de la categoría de IVA y el Nro de CUIT
	 */
	private boolean checkBPartnerData()
	{
	    // Si no es consumidor final, el cuit no puede ser 0
	    KeyNamePair p = (KeyNamePair)fCategoriaIva.getSelectedItem();
        if (p != null && p.getKey() < 0)
        {
            ADialog.error(m_WindowNo, this, "Tiene que seleccionar una categor\u00eda de IVA");
            return false;
        }
        else if (p != null && !p.getName().equals("ConsumidorFinal"))
        {
            if (fCUIT.getText() == null && fCUIT.getText().equals(""))
            {
                ADialog.error(m_WindowNo, this, "Tiene que ingresar el CUIT");
                return false;
            }
            else if (!LAR_Utils.validateCUIT(fCUIT.getText()))
            {
                ADialog.error(m_WindowNo, this, "El CUIT es inv\u00e1lido");
                return false;
            }
        }
        else
        // Si es consumidor final y el cuit está vacío, se asigna el por defecto
        {
            if (fCUIT.getText() == null || fCUIT.getText().equals(""))
                fCUIT.setText("00000000");
        }

        // @fchiappano Chequear el ingreso de lista de precio y condicion de venta.
        KeyNamePair listaPrecios = (KeyNamePair) fListaPrecio.getSelectedItem();
        if (listaPrecios == null || listaPrecios.getKey() < 0)
        {
            ADialog.error(m_WindowNo, this, "Debe seleccionar una Lista de Precios.");
            return false;
        }

        ValueNamePair condVenta = (ValueNamePair) fCondVenta.getSelectedItem();
        if (condVenta == null || condVenta.getValue().equals(""))
        {
            ADialog.error(m_WindowNo, this, "Debe seleccionar una Condición de Venta.");
            return false;
        }

        return true;
	} // checkBPartnerData

	/**
	 *	Save.
	 *	Checks mandatory fields and saves Partner, Contact and Location
	 * 	@return true if saved
	 */
	private boolean actionSave()
	{
		log.config("");

		//  Chequea la consistencia de la categoria de IVA y el CUIT
		if (!checkBPartnerData())
		    return false;

		//	Check Mandatory fields
		if (fName.getText().equals(""))
		{
			fName.setBackground(AdempierePLAF.getFieldBackground_Error());
			return false;
		}
		else
			fName.setBackground(AdempierePLAF.getFieldBackground_Mandatory());
		if (fAddress.getC_Location_ID() == 0)
		{
			fAddress.setBackground(AdempierePLAF.getFieldBackground_Error());
			return false;
		}
		else
			fAddress.setBackground(AdempierePLAF.getFieldBackground_Mandatory());

		//	***** Business Partner *****
		if (m_partner == null)
		{
			int AD_Client_ID = Env.getAD_Client_ID(Env.getCtx());
			m_partner = MBPartner.getTemplate(Env.getCtx(), AD_Client_ID);
			m_partner.setAD_Org_ID(0); // @fchiappano Organización * por defecto.
			boolean isSOTrx = !"N".equals(Env.getContext(Env.getCtx(), m_WindowNo, "IsSOTrx"));
			m_partner.setIsCustomer (isSOTrx);
			m_partner.setIsVendor (!isSOTrx);
		}
		/*	Check Value
		String value = fCUIT.getText();
		if (value == null || value.length() == 0)
		{
			//	get Table Documet No
			value = DB.getDocumentNo (Env.getAD_Client_ID(Env.getCtx()), "C_BPartner", null, m_partner);
			fCUIT.setText(value);
		}
		*/
		m_partner.setTaxID(fCUIT.getText());
		//
		m_partner.setName(fName.getText());
		m_partner.setName2(fName2.getText());
        KeyNamePair p = (KeyNamePair)fCategoriaIva.getSelectedItem();
        if (p != null && p.getKey() > 0)
        {
            m_partner.set_ValueOfColumn("LCO_TaxPayerType_ID", p.getKey());

            // Determina el Calificador de Documento, necesario para el Controlador Fiscal
            // Consumidor Final ==> DNI  -  RI,RM,EX,NC ==> CUIT
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

        p = (KeyNamePair)fTipoIIBB.getSelectedItem();
        if (p != null && p.getKey() > 0)
            m_partner.set_ValueOfColumn("LCO_ISIC_ID", p.getKey());
        else
            m_partner.set_ValueOfColumn("LCO_ISIC_ID", null);

        m_partner.setDUNS(fNroIIBB.getText());
        m_partner.set_ValueOfColumn("EMail", fEMail.getText());

        KeyNamePair listaPrecio = (KeyNamePair) fListaPrecio.getSelectedItem();
        if (listaPrecio != null && listaPrecio.getKey() > 0)
            m_partner.setM_PriceList_ID(listaPrecio.getKey());

        ValueNamePair condVenta = (ValueNamePair) fCondVenta.getSelectedItem();
        if (condVenta != null && !condVenta.getValue().equals(""))
            m_partner.setPaymentRule(condVenta.getValue());

        if (m_partner.save())
			log.fine("C_BPartner_ID=" + m_partner.getC_BPartner_ID());
		else
		{
			ADialog.error(m_WindowNo, this, "BPartnerNotSaved");
			return false;
		}
		
		//	***** Business Partner - Location *****
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
			ADialog.error(m_WindowNo, this, "BPartnerNotSaved", Msg.translate(Env.getCtx(), "C_BPartner_Location_ID"));
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

	/**
	 * Alerta sobre CUIT duplicado al perder el foco del campo
	 */
	private class CheckDuplicateCuitListener extends FocusAdapter
	{
	    @Override
	    public void focusLost(FocusEvent e)
	    {
	        // Solo realiza el chequeo en el "alta" de la operación, no en la "actualización"
	        if (m_partner == null && LAR_Utils.checkDuplicateCUIT(fCUIT.getText(), 0))
                ADialog.warn(m_WindowNo, VBPartner.this, "El CUIT/DNI ingresado ya existe");
	    }
	} // CheckDuplicateCuitListener

}	//	VBPartner
