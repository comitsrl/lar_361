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
package ar.com.ergio.print.fiscal.comm;

import java.io.IOException;

import ar.com.ergio.print.fiscal.FiscalPacket;

/**
 * Define la interfaz para la comunicación con el dispositivo fiscal.
 * @author Franco Bonafine
 * @date 04/02/2008
 */
public interface FiscalComm {

	/**
	 * Conecta la interfaz de comunicación con el dispositivo fiscal.
	 * @throws IOException si ocurre un error en la comunicación con el
	 * dispositivo.
	 */
	public void connect() throws IOException;
	
	/**
	 * @return Verdadero si la interfaz de comunicación está conectada
	 * con el dispositivo.
	 */
	public boolean isConnected();
	
	
	/**
	 * Cierra la conexión de la interfaz de comunicación.
	 * No realiza ninguna acción si la interfaz ya se encuentra desconectada. 
	 */
	public void close() throws IOException;
	
	/** 
	 * Ejecuta un comando fiscal.
	 * @throws IllegalArgumentException si request == response. 
	 */
	public void execute(FiscalPacket request, FiscalPacket response) throws IOException;
}
