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

import ar.com.ergio.model.FiscalDocumentPrint;


public abstract class FiscalPrinterAction {

	// Variables de instancia
	
	/** Mensaje de error */
	
	private String errorMsg;
	
	/** Mensaje de descripción de error */
	
	private String errorDesc;
	
	/** Nombre de transacción a utilizar, en caso que utilice */
	
	private String trxName;
	
	/** Acceso a la impresora */
	
	private FiscalDocumentPrint fdp;
	
	// Constructores
	
	public FiscalPrinterAction(FiscalDocumentPrint fdp, String trxName){
		setFdp(fdp);
		setTrxName(trxName);
	}
	
	// Métodos abstractos
	
	/**
	 * Ejecuta la acción correspondiente
	 */
	public abstract boolean execute();
	
	// Getters y Setters
	
	protected void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorDesc(String errorDesc) {
		this.errorDesc = errorDesc;
	}

	public String getErrorDesc() {
		return errorDesc;
	}

	protected void setTrxName(String trxName) {
		this.trxName = trxName;
	}


	protected String getTrxName() {
		return trxName;
	}

	protected void setFdp(FiscalDocumentPrint fdp) {
		this.fdp = fdp;
	}

	protected FiscalDocumentPrint getFdp() {
		return fdp;
	}
}
