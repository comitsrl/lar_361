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
package ar.com.ergio.model;

import ar.com.ergio.model.FiscalDocumentPrint.Actions;


/**
 * Información del estado del Impresor de Documentos
 * fiscales (FiscalDocumentPrint).
 * @author Franco Bonafine
 * @date 22/02/2008
 *
 * @author Emiliano Pereyra
 *
 */
public interface FiscalDocumentListener {

	public static int AC_CHECK_STATUS = 1;
	public static int AC_CONNECT_PRINTER = 2;
	public static int AC_PRINT_DOCUMENT = 3;
	public static int AC_PROCESS_DOCUMENT = 4;
	public static int AC_EXECUTING_ACTION = 5;

	/**
	 * Informa el estado actual del controlador fiscal.
	 * @param source Impresor de documentos que generó la acción.
	 * @param cFiscal Controlador fiscal al que pertenece el estado.
	 * @param status Estado actual del controlador fiscal.
	 */
	public void statusReported(FiscalDocumentPrint source, MFiscalPrinter cFiscal, String status);

	/**
	 * Informa que se ha comenzado a ejecutar una acción en el
	 * impresor de documentos.
	 * @param source Impresor de documentos que generó la acción.
	 * @param action Acción que comenzo a ejecutarse.<br>
	 * <code>FiscalDocumentListener.AC_CHECK_STATUS</code><br>
	 * <code>FiscalDocumentListener.AC_CONNECT_PRINTER</code><br>
	 * <code>FiscalDocumentListener.AC_PRINT_DOCUMENT</code><br>
	 * <code>FiscalDocumentListener.AC_EXECUTING_ACTION</code><br>
	 */
	public void actionStarted(FiscalDocumentPrint source, int action);

	/**
	 * Informa que la impresión terminó a causa de un error. Se comunica
	 * el título y la descripción del error.
	 * @param source Impresor de documentos que terminó con error.
	 * @param errorTitle Título del error.
	 * @param errorDesc Descripción del error.
	 */
	public void errorOcurred(FiscalDocumentPrint source, String errorTitle, String errorDesc);

	/**
	 * Informa que la impresión del documento terminó correctamente sin errores.
	 * @param source Impresor de documentos.
	 */
	public void documentPrintEndedOk(FiscalDocumentPrint source);

	/**
	 * Informa que la acción del documento terminó.
	 * @param ok true si no hubo error, false caso contrario
	 * @param action acción realizada
	 */
	public void actionEnded(boolean ok, Actions action);

	/**
	 * Asigna la referencia al impresor de documentos fiscales
	 * @param fdp
	 */
	public void setFiscalDocumentPrint(FiscalDocumentPrint fdp);
}
