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

import java.io.IOException;
import java.math.BigDecimal;

import ar.com.ergio.print.fiscal.comm.FiscalComm;
import ar.com.ergio.print.fiscal.document.CreditNote;
import ar.com.ergio.print.fiscal.document.DebitNote;
import ar.com.ergio.print.fiscal.document.Invoice;
import ar.com.ergio.print.fiscal.document.NonFiscalDocument;
import ar.com.ergio.print.fiscal.exception.DocumentException;
import ar.com.ergio.print.fiscal.exception.FiscalPrinterIOException;
import ar.com.ergio.print.fiscal.exception.FiscalPrinterStatusError;
import ar.com.ergio.print.fiscal.msg.FiscalMessages;

/**
 * Impresora fiscal. Interfaz publica para la comunicación con impresoras
 * fiscales. Cada clase que represente una impresora fiscal debe impementar
 * esta interfaz.
 * @author Franco Bonafine
 * @date 22/01/2008
 * @contributor Emiliano Pereyra - http://www.ergio.com.ar
 */
public interface FiscalPrinterDevice {

	/**
	 * Da formato de cantidad a un número.
	 * @param quantity: número a formatear.
	 * @return <code>String</code> que contiene la cantidad formateada.
	 */
	public String formatQuantity(BigDecimal quantity);

	/**
	 * Da formato de monto a un número.
	 * @param amount: número a formatear
	 * @return <code>String</code> que contiene el monto formateado.
	 */
	public String formatAmount(BigDecimal amount);

    /**
     * Da formato de monto a un número para las percepciones (nnnnnnnnn.nn)
     * @author Emiliano Pereyra
     * @param amount: número a formatear
     * @return <code>String</code> que contiene el monto formateado.
     */
    public String formatPerceptionAmount(BigDecimal amount);

    /**
	 * Formatea un texto.
	 * @param text: texto a formatear.
	 * @param maxLength: longitud máxima para el texto.
	 * @return <code>String</code> que contiene el texto formateado.
	 */
	public String formatText(String text, int maxLength);

	/**
	 * Formatea un número.
	 * @param number: número a formatear.
	 * @param integerPart: cantidad de dígitos para la parte entera.
	 * @param decimalPart: cantidad de dígitos para la parte decimal.
	 * @return <code>String</code> con el número formateado.
	 */
	public String formatNumber(BigDecimal number, int integerPart, int decimalPart);


	/**
	 * @return La interfaz de comunicación con el dispositivo fiscal.
	 */
	public FiscalComm getFiscalComm();


	/**
	 * Asigna la interfaz de comunicación con el dispositivo fiscal.
	 * @param fiscalComm interfaz de comunicación.
	 */
	public void setFiscalComm(FiscalComm fiscalComm);

	/**
	 * @return Retorna el conjunto de mensajes recibido de la impresora fiscal
	 * luego de cada ejecución de algún comando a la misma. En caso de que no
	 * existan mensajes retorna un <code>FiscalMessages</code> donde
	 * <code>isEmpty()</code> es verdadero.
	 */
	public FiscalMessages getMessages();

	/**
	 * Impresión de una factura.
	 * @param invoice Factura a imprimir.
	 * @throws FiscalPrinterStatusError cuando la impresora fiscal
	 * retorna un error en su estado a partir de la ejecución de algún comando.
	 * @throws FiscalPrinterIOException cuando se produce algún error
	 * inesperado en la comunicación con el dispositivo fiscal.
	 * @throws DocumentException cuando la factura contiene errores y no puede ser
	 * enviado a imprimir.
	 */
	public void printDocument(Invoice invoice) throws FiscalPrinterStatusError, FiscalPrinterIOException, DocumentException;

	/**
	 * Impresión de una nota de crédito.
	 * @param creditNote Nota de crédito a imprimir.
	 * @throws FiscalPrinterStatusError cuando la impresora fiscal
	 * retorna un error en su estado a partir de la ejecución de algún comando.
	 * @throws FiscalPrinterIOException cuando se produce algún error
	 * inesperado en la comunicación con el dispositivo fiscal.
	 * @throws DocumentException cuando la factura contiene errores y no puede ser
	 * enviado a imprimir.
	 */
	public void printDocument(CreditNote creditNote) throws FiscalPrinterStatusError, FiscalPrinterIOException, DocumentException;

	/**
	 * Impresión de una nota de débito.
	 * @param debitNote Nota de débito a imprimir.
	 * @throws FiscalPrinterStatusError cuando la impresora fiscal
	 * retorna un error en su estado a partir de la ejecución de algún comando.
	 * @throws FiscalPrinterIOException cuando se produce algún error
	 * inesperado en la comunicación con el dispositivo fiscal.
	 * @throws DocumentException cuando la factura contiene errores y no puede ser
	 * enviado a imprimir.
	 */
	public void printDocument(DebitNote debitNote) throws FiscalPrinterStatusError, FiscalPrinterIOException, DocumentException;

	/**
	 * Impresión de un documento no fiscal
	 * @param nonFiscalDocument Documento no fiscal a imprimir
	 * @throws FiscalPrinterStatusError cuando la impresora fiscal
	 * retorna un error en su estado a partir de la ejecución de algún comando.
	 * @throws FiscalPrinterIOException cuando se produce algún error
	 * inesperado en la comunicación con el dispositivo fiscal.
	 * @throws DocumentException cuando el documento no fiscal contiene errores y no
	 * puede ser enviado a imprimir.
	 */
	public void printDocument(NonFiscalDocument nonFiscalDocument) throws FiscalPrinterStatusError, FiscalPrinterIOException, DocumentException;

	/**
	 * Realiza el cierre fiscal.
	 * @param type tipo de cierre
	 * @throws FiscalPrinterStatusError
	 * @throws FiscalPrinterIOException
	 */
	public void fiscalClose(String type) throws FiscalPrinterStatusError, FiscalPrinterIOException;

	/**
	 * @return Retorna el número del comprobante creado ultimamente por la
	 * impresora.
	 */
	public String getLastDocumentNo();

	/**
	 * Conecta la impresora con el dispositivo fiscal. Aquí se debe efectivizar
	 * la conexión de la interfaz de comunicación con el dispositivo.
	 * Para efectuar cualquier operación con la impresora fiscal es necesario
	 * que primero se invoque a este método.
	 * @throws IOException Cuando se preduce algún error en el intento de conexión
	 * con el dispositivo.
	 */
	public void connect() throws IOException;

	/**
	 * Desconecta la impresora con el dispositivo fiscal. Luego de invocar este
	 * método no es posible realizar alguna operación con la impresora hasta que
	 * sea invocado nuevamente el método <code>FiscalPrinter.connect()</code>
	 * @throws IOException Cuando se produce algún error en el intento de
	 * desconexión con el dispositivo.
	 */
	public void close() throws IOException;

	/**
	 * Indica si en la impresora fiscal se encuentra un documento abierto
	 * actualmente.
	 * @return Verdadero en caso de que exista un documento abierto.
	 */
	public boolean hasDocumentOpened();

	/**
	 * @return Retorna el manejador de eventos de la impresora fiscal.
	 */
	public FiscalPrinterListener getEventListener();

	/**
	 * Asigna el manejador de eventos que dispara la impresora fiscal.
	 * @param eventListener Manejador de eventos a asignar.
	 */
	public void setEventListener(FiscalPrinterListener eventListener);

	public boolean isConnected();

	/**
	 * @return La cantidad de pagos permitidos para la impresión. Ciertas marcas
	 *         y modelos tienen una limitación en la cantidad de pagos que se
	 *         pueden imprimir con su descripción y su importe en el ticket o
	 *         factura.
	 */
	public int getAllowedPaymentQty();
}
