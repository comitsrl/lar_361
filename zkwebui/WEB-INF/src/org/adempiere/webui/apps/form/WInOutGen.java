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

import java.util.ArrayList;
import java.util.logging.Level;

import org.adempiere.webui.component.Label;
import org.adempiere.webui.component.Listbox;
import org.adempiere.webui.component.ListboxFactory;
import org.adempiere.webui.component.Row;
import org.adempiere.webui.editor.WSearchEditor;
import org.adempiere.webui.editor.WTableDirEditor;
import org.adempiere.webui.event.ValueChangeEvent;
import org.adempiere.webui.event.ValueChangeListener;
import org.adempiere.webui.panel.ADForm;
import org.adempiere.webui.panel.IFormController;
import org.compiere.apps.form.InOutGen;
import org.compiere.model.MLookup;
import org.compiere.model.MLookupFactory;
import org.compiere.model.MOrder;
import org.compiere.model.MRMA;
import org.compiere.process.DocAction;
import org.compiere.util.CLogger;
import org.compiere.util.DisplayType;
import org.compiere.util.Env;
import org.compiere.util.KeyNamePair;
import org.compiere.util.Msg;
import org.zkoss.zk.ui.WrongValueException;
import org.zkoss.zk.ui.event.Event;
import org.zkoss.zk.ui.event.EventListener;
import org.zkoss.zul.Space;

/**
 * Generate Shipment (manual) view class
 * 
 */
public class WInOutGen extends InOutGen implements IFormController, EventListener, ValueChangeListener
{
	private WGenForm form;
	
	/**	Logger			*/
	private static CLogger log = CLogger.getCLogger(WInOutGen.class);
	//
	private Label lWarehouse = new Label();
	private WTableDirEditor fWarehouse;
	private Label lBPartner = new Label();
	private WSearchEditor fBPartner;
	private Label     lDocType = new Label();
	private Listbox  cmbDocType = ListboxFactory.newDropdownListbox();
	private Label   lDocAction = new Label();
	private WTableDirEditor docAction;

    // @fchiappano Nuevo campo deposito de transaccion (desde donde efectivamente se va
    // descontar la mercaderia).
    private Label lWarehouseTransaccion = new Label();
    private WTableDirEditor fWarehouseTransaccion;

	public WInOutGen()
	{
		log.info("");
		
		form = new WGenForm(this);
		Env.setContext(Env.getCtx(), form.getWindowNo(), "IsSOTrx", "Y");
		
		try
		{
			super.dynInit();
			dynInit();
			zkInit();
			
			form.postQueryEvent();
		}
		catch(Exception ex)
		{
			log.log(Level.SEVERE, "init", ex);
		}
	}	//	init
	
	/**
	 *	Static Init.
	 *  <pre>
	 *  selPanel (tabbed)
	 *      fOrg, fBPartner
	 *      scrollPane & miniTable
	 *  genPanel
	 *      info
	 *  </pre>
	 *  @throws Exception
	 */
	void zkInit() throws Exception
	{
		lBPartner.setText(Msg.translate(Env.getCtx(), "C_BPartner_ID"));
		
		Row row = form.getParameterPanel().newRows().newRow();
		row.appendChild(lWarehouse.rightAlign());
		row.appendChild(fWarehouse.getComponent());
		row.appendChild(new Space());
		row.appendChild(lBPartner.rightAlign());
		row.appendChild(fBPartner.getComponent());
		row.appendChild(new Space());
		
		row = new Row();
		form.getParameterPanel().getRows().appendChild(row);
        row.appendChild(lWarehouseTransaccion.rightAlign());
        row.appendChild(fWarehouseTransaccion.getComponent());
		row.appendChild(new Space());
		row.appendChild(lDocAction.rightAlign());
		row.appendChild(docAction.getComponent());
		row.appendChild(new Space());

        row = new Row();
        form.getParameterPanel().getRows().appendChild(row);
        row.appendChild(lDocType.rightAlign());
        row.appendChild(cmbDocType);
	}	//	jbInit

	/**
	 *	Fill Picks.
	 *		Column_ID from C_Order
	 *  @throws Exception if Lookups cannot be initialized
	 */
	public void dynInit() throws Exception
	{
		//	C_OrderLine.M_Warehouse_ID
		MLookup orgL = MLookupFactory.get (Env.getCtx(), form.getWindowNo(), 0, 2223, DisplayType.TableDir);
		fWarehouse = new WTableDirEditor ("M_Warehouse_ID", true, false, true, orgL);
		lWarehouse.setText(Msg.translate(Env.getCtx(), "M_Warehouse_ID"));
		fWarehouse.addValueChangeListener(this);
		fWarehouse.setValue(Env.getContextAsInt(Env.getCtx(), "#M_Warehouse_ID"));
		setM_Warehouse_ID(fWarehouse.getValue());
		//      Document Action Prepared/ Completed
		lDocAction.setText(Msg.translate(Env.getCtx(), "DocAction"));
		MLookup docActionL = MLookupFactory.get(Env.getCtx(), form.getWindowNo(), 4324 /* M_InOut.DocAction */,
				DisplayType.List, Env.getLanguage(Env.getCtx()), "DocAction", 135 /* _Document Action */,
				false, "AD_Ref_List.Value IN ('CO','PR')");
		docAction = new WTableDirEditor("DocAction", true, false, true,docActionL);
		docAction.setValue(DocAction.ACTION_Complete);
		docAction.addValueChangeListener(this);
		//	C_Order.C_BPartner_ID
		MLookup bpL = MLookupFactory.get (Env.getCtx(), form.getWindowNo(), 0, 2762, DisplayType.Search);
		fBPartner = new WSearchEditor("C_BPartner_ID", false, false, true, bpL);
		lBPartner.setText(Msg.translate(Env.getCtx(), "C_BPartner_ID"));
		fBPartner.addValueChangeListener(this);
		//Document Type Sales Order/Vendor RMA
		lDocType.setText(Msg.translate(Env.getCtx(), "C_DocType_ID"));
		cmbDocType.addItem(new KeyNamePair(MOrder.Table_ID, Msg.translate(Env.getCtx(), "Order")));
		cmbDocType.addItem(new KeyNamePair(MRMA.Table_ID, Msg.translate(Env.getCtx(), "VendorRMA")));
		cmbDocType.addActionListener(this);
		cmbDocType.setSelectedIndex(0);

        // @fchiappano Campo Deposito de Transacción (deposito que se utilizara en el remito).
		// Columna: M_InOut.M_WhareHouse_ID
        MLookup warehouseL = MLookupFactory.get(Env.getCtx(), form.getWindowNo(), 0, 3798, DisplayType.TableDir);
        fWarehouseTransaccion = new WTableDirEditor("M_WarehouseTransaccion_ID", true, false, true, warehouseL);
        lWarehouseTransaccion.setText("Deposito de Transacción");
        fWarehouseTransaccion.addValueChangeListener(this);
        fWarehouseTransaccion.setValue(Env.getContextAsInt(Env.getCtx(), "#M_Warehouse_ID"));
        setM_WarehouseTransaccion_ID(fWarehouseTransaccion.getValue());

		form.getStatusBar().setStatusLine(Msg.getMsg(Env.getCtx(), "InOutGenerateSel"));//@@
	}	//	fillPicks
    
	/**
	 *  Query Info
	 */
	public void executeQuery()
	{
		KeyNamePair docTypeKNPair = cmbDocType.getSelectedItem().toKeyNamePair();
		executeQuery(docTypeKNPair, form.getMiniTable());
		form.getMiniTable().repaint();
		form.invalidate();
	}   //  executeQuery

	/**
	 *	Action Listener
	 *  @param e event
	 */
	public void onEvent(Event e)
	{
		log.info("Cmd=" + e.getTarget().getId());
		//
		if(cmbDocType.equals(e.getTarget()))
		{
		    form.postQueryEvent();
		    return;
		}
		
		//
		validate();
	}	//	actionPerformed
	
	public void validate()
	{
		if (isSelectionActive() && getM_Warehouse_ID() <= 0)
		{
			throw new WrongValueException(fWarehouse.getComponent(), Msg.translate(Env.getCtx(), "FillMandatory"));
		}

		form.saveSelection();
		
		ArrayList<Integer> selection = getSelection();
		if (selection != null
			&& selection.size() > 0
			&& isSelectionActive() )	//	on selection tab
		{
			form.generate();
		}
		else
		{
			form.dispose();
		}
	}

	/**
	 *	Value Change Listener - requery
	 *  @param e event
	 */
	public void valueChange(ValueChangeEvent e)
	{
		log.info(e.getPropertyName() + "=" + e.getNewValue());
		if (e.getPropertyName().equals("M_Warehouse_ID"))
			setM_Warehouse_ID(e.getNewValue());
        if (e.getPropertyName().equals("M_WarehouseTransaccion_ID"))
            setM_WarehouseTransaccion_ID(e.getNewValue());
		if (e.getPropertyName().equals("C_BPartner_ID"))
		{
			m_C_BPartner_ID = e.getNewValue();
			fBPartner.setValue(m_C_BPartner_ID);	//	display value
		}
		form.postQueryEvent();
	}	//	vetoableChange
	
	/**************************************************************************
	 *	Generate Shipments
	 */
	public String generate()
	{
		KeyNamePair docTypeKNPair = (KeyNamePair)cmbDocType.getSelectedItem().toKeyNamePair();
		String docActionSelected = (String)docAction.getValue();	
		return generate(form.getStatusBar(), docTypeKNPair, docActionSelected);
	}	//	generateShipments
	
	public ADForm getForm()
	{
		return form;
	}
}