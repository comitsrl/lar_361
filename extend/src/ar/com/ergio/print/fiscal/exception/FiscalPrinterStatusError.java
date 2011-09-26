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
package ar.com.ergio.print.fiscal.exception;

import java.util.List;

import ar.com.ergio.print.fiscal.FiscalPacket;
import ar.com.ergio.print.fiscal.msg.FiscalMessage;
import ar.com.ergio.print.fiscal.msg.FiscalMessages;

/**
 * Existe un error en el estado reportado por la impresora fiscal.
 * @author Franco Bonafine
 * @date 06/02/2008
 */
public class FiscalPrinterStatusError extends FiscalPrinterIOException {

    private static final long serialVersionUID = -1574831031553119448L;
    private FiscalMessages statusMsgs = new FiscalMessages();
	
	public FiscalPrinterStatusError() {
		super();
	}

	/**
	 * @param request Petición ejecutada.
	 * @param response Respuesta recibida.
	 * @param statusMsgs Mensajes de estado devueltos por la impresora.
	 */
	public FiscalPrinterStatusError(FiscalPacket request, FiscalPacket response, FiscalMessages statusMsgs ) {
		super(buildErrorMsg(statusMsgs),request, response);
		this.statusMsgs = statusMsgs;
	}

	/**
	 * @return Returns the statusMsgs.
	 */
	public FiscalMessages getStatusMsgs() {
		return statusMsgs;
	}

	/**
	 * @return Retorna los mensajes de error contenidos en los mensajes de estado.
	 */
	public List<FiscalMessage> getErrorMsgs() {
		return getStatusMsgs().getErrorMsgs();
	}
	
	/**
	 * @return Retorna el mensaje de error que proviene del dispositivo.
	 * En caso de que el dispositivo no haya enviado mensaje alguno, retorna
	 * un <code>String</code> vacio <code>""</code>
	 */
	public String getDeviceErrorMsg() {
		String msg = "";
		try {
			if(getResponsePacket().getSize() >= 3)
				msg = getResponsePacket().getString(3) + ".";
		} catch (Exception e) {
			msg = "";
		}
		return msg;
	}
	
	private static String buildErrorMsg(FiscalMessages msgs) {
		String errorMsg = "";
		for (FiscalMessage msg : msgs.getErrorMsgs()) {
			errorMsg += msg; 
		}
		return errorMsg;
	}
}
