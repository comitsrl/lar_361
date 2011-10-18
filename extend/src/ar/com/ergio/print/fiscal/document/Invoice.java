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
package ar.com.ergio.print.fiscal.document;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import ar.com.ergio.print.fiscal.exception.DocumentException;
import ar.com.ergio.print.fiscal.msg.MsgRepository;

public class Invoice extends Document {

	/**
	 *
	 */
	private static final long serialVersionUID = 1702265732103996574L;

	private static BigDecimal maxAmountCF = new BigDecimal(1000);

	/** Número del CAI*/
	private String caiNumber;
	/** Número del remito asociado a la factura */
	private String packingSlipNumber;
	/** Lista de pagos realizados */
	private List<Payment> payments;
	/** Indica si la factura a consumidor final no supera el monto
	 * máximo permitido sin identificación del cliente */
	private boolean validCFInvoice;

	public Invoice() {
		super();
		payments = new ArrayList<Payment>();
	}

	/**
	 * @return Returns the packingSlipNumber.
	 */
	public String getPackingSlipNumber() {
		return packingSlipNumber;
	}

	/**
	 * @param packingSlipNumber The packingSlipNumber to set.
	 */
	public void setPackingSlipNumber(String packingSlipNumber) {
		this.packingSlipNumber = packingSlipNumber;
	}

	/**
	 * @return Retorna verdadero si la factura tiene un
	 * número de remito asociado.
	 */
	public boolean hasPackingSlipNumber() {
		return getPackingSlipNumber() != null && !getPackingSlipNumber().equals("");
	}

	/**
	 * @return Returns the caiNumber.
	 */
	public String getCAINumber() {
		return caiNumber;
	}

	/**
	 * @param caiNumber The caiNumber to set.
	 */
	public void setCAINumber(String caiNumber) {
		this.caiNumber = caiNumber;
	}

	/**
	 * @return Indica si la factura tiene asignado o no un número de CAI.
	 */
	public boolean hasCAINumber() {
		return getCAINumber() != null && !getCAINumber().equals("");
	}

	@Override
	public String getDocumentType() {
		return DT_INVOICE;
	}

	@Override
	public void validate() throws DocumentException {
		super.validate();

		// Validar cantidad de líneas mayor que 0.
        if (getLines().isEmpty()) {
            throw createDocumentException("InvalidDocumentLinesCount", this);
        }

		// Validar que si la factura es a CONSUMIDOR FINAL el monto acumulado
		// de las lineas no supere el límite definido. Si lo supera, se deben
		// ingresar los datos del comprador.
		validateInvoiceCFLimit();

		// Se validan los pagos.
		for (Payment payment : getPayments()) {
			payment.validate();
		}
	}

	private void validateInvoiceCFLimit() throws DocumentException {
		// Esta validación debe hacerse línea por línea y ni bien se detecte
		// que el acumulado supera el máximo se debe disparar un error dado
		// que es así como se ejecutan los comandos en la impresora fiscal
		// y la misma no puede predecir si luego de una linea de X monto va a
		// venir un descuento (el cual haría que el total de la factura
		// sea válido).
		Customer c = getCustomer();
		boolean validName = c.getName() != null && !c.getName().trim().equals("");
		boolean validLocation = c.getLocation() != null && !c.getLocation().trim().equals("");
		boolean validIdNumber = c.getIdentificationNumber() != null && !c.getIdentificationNumber().trim().equals("");
		boolean customerDataValid = validName && validLocation && validIdNumber;

		// Se asume que la factura será válida.
		setValidCFInvoice(true);

		if(getCustomer().getIvaResponsibility() == Customer.CONSUMIDOR_FINAL && !customerDataValid) {
			BigDecimal total = BigDecimal.ZERO;
			boolean amountValid = true;
			// Por cada línea...
			for (DocumentLine docLine : getLines()) {
                // Se suma al total (sin descuentos / recargos).
                total = total.add(docLine.getSubtotal());
                // Se pregunta si sigue siendo válido el monto.
                if (total.compareTo(getMaxAmountCF()) > 0) {
                    amountValid = false;
                    // Si sigue siendo válido
                } else {
                    // Se obtiene el monto del descuento / recargo.
                    BigDecimal discountAmt = (docLine.hasDiscount() ?
                            docLine.getDiscount().getAmount() : BigDecimal.ZERO);
                    total = total.add(discountAmt);
                    // Y se válida nuevamente el total.
                    if (total.compareTo(getMaxAmountCF()) > 0) {
                        amountValid = false;
                    }
                }
				// Si no fue válido en alguno de los casos, se dispara la excepcion
				if(!amountValid) {
					// Se arma el mensaje de respuesta.
					StringBuffer msg = new StringBuffer();
					msg.append(MsgRepository.get("InvalidCFInvoiceAmount"));
					msg.append(" ($" + getMaxAmountCF() + "). ");
					msg.append(MsgRepository.get("CompleteCustomerFields") + ": ");
                    if (!validName) {
                        msg.append(MsgRepository.get("Name") + (!validLocation ? "," : ""));
                    }
                    if (!validLocation) {
                        msg.append(MsgRepository.get("Location") + (!validIdNumber ? "," : ""));
                    }
                    if (!validIdNumber) {
                        msg.append(MsgRepository.get("IdentificationNumber"));
                    }
					throw Document.createDocumentException(msg.toString(),this);
				}
			}
		}
	}

	/**
	 * Agrega un pago al documento.
	 * @param payment Pago a agregar.
	 */
	public void addPayment(Payment payment) {
		payments.add(payment);
	}

	/**
	 * Elimina un pago del documento en caso de existir.
	 * @param payment Pago a eliminar.
	 */
	public void removePayment(Payment payment) {
		payments.remove(payment);
	}

	/**
	 * @return Returns the payments.
	 */
	public List<Payment> getPayments() {
		return payments;
	}

	/**
	 * @return Retorna verdadero en caso de que el documento tenga asignado
	 * algun pago.
	 */
	public boolean hasPayments() {
		return !getPayments().isEmpty();
	}

	/**
	 * @return Returns the maxAmountCF.
	 */
	public static BigDecimal getMaxAmountCF() {
		return maxAmountCF;
	}

	/**
	 * @param maxAmountCF The maxAmountCF to set.
	 */
	public static void setMaxAmountCF(BigDecimal maxAmountCF) {
		Invoice.maxAmountCF = maxAmountCF;
	}

	/**
	 * @return Returns the validCFInvoice.
	 */
	public boolean isValidCFInvoice() {
		return validCFInvoice;
	}

	/**
	 * @param validCFInvoice The validCFInvoice to set.
	 */
	protected void setValidCFInvoice(boolean validCFInvoice) {
		this.validCFInvoice = validCFInvoice;
	}
}
