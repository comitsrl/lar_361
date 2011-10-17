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
package ar.com.ergio.print.fiscal;

import ar.com.ergio.print.fiscal.msg.FiscalMessages;

/**
 * Manejador de eventos que pueden ser lanzados por una impresora fiscal
 * @author Franco Bonafine
 * @date 06/02/2008
 *
 * @author Emiliano Pereyra
 */
public interface FiscalPrinterListener {

	/**
	 * Es invocado cuando se ha ejecutado satisfactoriamente un comando
	 * en la impresora fiscal.
	 * @param source Impresora fiscal en la que se ejecutó el comando.
	 * @param command Comando ejecutado.
	 * @param response Respuesta recibida desde la impresora.
	 */
	public void commandExecuted(FiscalPrinterDevice source, FiscalPacket command, FiscalPacket response);

	/**
	 * Es invocado cuando se produce un cambio de estado en la
	 * impresora fiscal.
	 * @param source Impresora fiscal en la que se ejecutó el comando.
	 * @param command Comando ejecutado.
	 * @param response Respuesta recibida desde la impresora.
	 * @param msgs Mensajes de estado de la impresora.
	 */
	public void statusChanged(FiscalPrinterDevice source, FiscalPacket command, FiscalPacket response, FiscalMessages msgs);

	/**
	 * Es invoicado cuando se finaliza correctamente la impresión
	 * del documento.
	 * @param source Impresora fiscal que realizó la impresión.
	 * @param msgs Mensajes de estado de la impresora fiscal.
	 */
	public void printEnded(FiscalPrinterDevice source, FiscalMessages msgs);
}
