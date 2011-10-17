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


public abstract class FiscalPrinterAction
{

    /** Mensaje de error */
    private String errorMsg;

    /** Mensaje de descripción de error */
    private String errorDesc;

    /** Nombre de transacción a utilizar, en caso que utilice */
    private String trxName;

    private int m_LAR_Fiscal_Printer_ID;
    private FiscalDocumentPrint fdp;


    /**
     * Creates an close fiscal action
     *
     * @param trxName
     *            transaction name
     * @param m_LAR_Fiscal_Printer_ID
     *            fiscal printer configuration id
     */
    FiscalPrinterAction(String trxName, int LAR_Fiscal_Printer_ID)
    {
	// setFdp(fdp);
	setTrxName(trxName);
	setControladorFiscalID(LAR_Fiscal_Printer_ID);
    }

    // Métodos abstractos

    /**
     * Ejecuta la acción correspondiente
     */
    public abstract boolean execute();

    // Getters y Setters

    protected void setErrorMsg(String errorMsg)
    {
	this.errorMsg = errorMsg;
    }

    public String getErrorMsg()
    {
	return errorMsg;
    }

    public void setErrorDesc(String errorDesc)
    {
	this.errorDesc = errorDesc;
    }

    public String getErrorDesc()
    {
	return errorDesc;
    }

    protected void setTrxName(String trxName)
    {
	this.trxName = trxName;
    }

    protected String getTrxName()
    {
	return trxName;
    }

    public void setControladorFiscalID(int LAR_Fiscal_Printer_ID)
    {
	this.m_LAR_Fiscal_Printer_ID = LAR_Fiscal_Printer_ID;
    }

    public int getControladorFiscalID()
    {
	return m_LAR_Fiscal_Printer_ID;
    }


    FiscalDocumentPrint getFiscalDocumentPrint() throws Exception
    {
	if (fdp == null) {
	    fdp = new FiscalDocumentPrint(m_LAR_Fiscal_Printer_ID);
	}
	return fdp;
    }
//     protected void setFdp(FiscalDocumentPrint fdp) {
//     this.fdp = fdp;
//     }
}
