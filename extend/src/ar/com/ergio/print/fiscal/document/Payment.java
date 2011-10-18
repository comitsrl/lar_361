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

import java.io.Serializable;
import java.math.BigDecimal;

import ar.com.ergio.print.fiscal.exception.DocumentException;

/**
 * Clase que representa un pago para un documento. El monto del mismo no puede
 * ser negativo.
 * @author Franco Bonafine
 * @date 11/02/2008
 */
public class Payment implements Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	/** Monto del pago */
	private BigDecimal amount;
	/** Descripción del medio de pago */
	private String description;

	public Payment() {
		super();
	}

	/**
	 * @param amount
	 * @param description
	 */
	public Payment(BigDecimal amount, String description) {
		super();
		this.amount = amount;
		this.description = description;
	}

	/**
	 * @return Returns the amount.
	 */
	public BigDecimal getAmount() {
		return amount;
	}

	/**
	 * @param amount The amount to set.
	 */
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	/**
	 * @return Returns the description.
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description The description to set.
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * Validación del pago.
	 * @throws DocumentException cuando el pago contiene datos no válidos
	 * que podrían generar estados de error al enviarlos a la impresora
	 * fiscal.
	 */
	public void validate() throws DocumentException {
		// Validar monto mayor que 0.
		Document.validateNumber(getAmount(), ">", BigDecimal.ZERO, "InvalidPaymentAmount");

		// Validar descripción.
		Document.validateText(getDescription(),"InvalidPaymentDescription");
	}
}
