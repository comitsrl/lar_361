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
package ar.com.ergio.print.fiscal.msg;


public class MsgRepository {

	private static MsgSource msgSource = DefaultMsgSource.getInstance();

	private MsgRepository() {
		
	}

	/** 
	 * @return Retorna el mensaje identificado por la <code>key</code> 
	 */
	public static String get(String key) {
		return getMsgSource().get(key);
	}
	
	/**
	 * Crea un <code>FiscalMessage</code> obteniendo el título y la descripción
	 * del mensaje a partir de dos claves.
	 * @param code Código del mensaje fiscal.
	 * @param titleKey Clave del título del mensaje.
	 * @param descKey Clave de la descripción del mensaje.
	 * @param error El mensaje es un error o no.
	 * @return Retorna el <code>FiscalMessage</code>
	 */
	public static FiscalMessage getFiscalMsg(int code, String titleKey, String descKey, boolean error) {
		String title = getMsgSource().get(titleKey);
		String description = getMsgSource().get(descKey);
		return new FiscalMessage(code, title, description, error);
	}
	
	/**
	 * @return Returns the msgSource.
	 */
	public static MsgSource getMsgSource() {
		return msgSource;
	}

	/**
	 * @param msgSource The msgSource to set.
	 */
	public static void setMsgSource(MsgSource msgSource) {
		MsgRepository.msgSource = msgSource;
	}
}
