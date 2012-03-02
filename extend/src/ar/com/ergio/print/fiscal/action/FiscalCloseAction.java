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
package ar.com.ergio.print.fiscal.action;

import org.compiere.util.Env;
import org.compiere.util.Msg;

/**
 * Fiscal close action
 *
 * @author Comunidad de Desarrollo OpenXpertya *Basado en Codigo Original
 *         Modificado, Revisado y Optimizado de:
 * @author Emiliano Pereyra
 */
public class FiscalCloseAction extends FiscalPrinterAction
{

	/** Tipo de cierre */
	private String closetype;

	// Mensajes

	private String MSG_FISCAL_CLOSE_ERROR = Msg.getMsg(Env.getCtx(), "FiscalCloseError");
	private String MSG_FISCAL_CLOSE_TYPE = Msg.getMsg(Env.getCtx(), "FiscalCloseType");
	private String MSG_FISCAL_CONTROLLER = Msg.getElement(Env.getCtx(), "C_Controlador_Fiscal_ID");
	private String MSG_FISCAL_CLOSE_ERROR_MANDATORY_DATA = Msg.getMsg(Env.getCtx(), "MandatoryDataFiscalCloseError");

	// Constructores

	/**
	 * {@inheritDoc}
	 */
    public FiscalCloseAction(String trxName, int LAR_Fiscal_Printer_ID)
    {
	super(trxName, LAR_Fiscal_Printer_ID);
    }

    /**
     * Creates an close fiscal action
     *
     * @param trxName
     *            transaction name
     * @param closeType
     *            close type action
     * @param LAR_Fiscal_Printer_ID
     *            fiscal printer configuration id
     */
    public FiscalCloseAction(String trxName, String closeType, int LAR_Fiscal_Printer_ID)
    {
	this(trxName, LAR_Fiscal_Printer_ID);
	setClosetype(closeType);
	setControladorFiscalID(LAR_Fiscal_Printer_ID);
    }

	@Override
	public boolean execute() {
		// Validaciones de datos obligatorios
		StringBuffer mandatoryMsg = new StringBuffer();
		// Tipo de cierre fiscal
		if(getControladorFiscalID() == 0){
			mandatoryMsg.append(MSG_FISCAL_CLOSE_TYPE);
			mandatoryMsg.append(" , ");
		}
		// Controlador fiscal
		if(getClosetype() == null || getClosetype().length() == 0){
			mandatoryMsg.append(MSG_FISCAL_CONTROLLER);
			mandatoryMsg.append(" , ");
		}
		// Si mensaje de error tiene algo, entonces muestro error
		if(mandatoryMsg.length() > 0){
			StringBuffer errorMsg = new StringBuffer();
			errorMsg.append(MSG_FISCAL_CLOSE_ERROR_MANDATORY_DATA).append("\n");
			errorMsg.append(mandatoryMsg.substring(0, mandatoryMsg.lastIndexOf(",")-1));
			setErrorMsg(MSG_FISCAL_CLOSE_ERROR);
			setErrorDesc(errorMsg.toString());
			return false;
		}

		try {
	    if(!getFiscalDocumentPrint().fiscalClose(getClosetype())) {
		setErrorMsg(getFiscalDocumentPrint().getErrorMsg());
		return false;
	    }
	} catch (Exception e) {
	    setErrorMsg(e.getMessage());
	}
		return true; //emmie
	}


	// Getters y Setters


	public void setClosetype(String closetype) {
		this.closetype = closetype;
	}

	public String getClosetype() {
		return closetype;
	}

}
