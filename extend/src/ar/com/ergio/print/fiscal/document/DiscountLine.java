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
 * Línea de descuento o recargo. El signo del <code>amount</code> de la línea
 * indica si la línea es un descuento (signo negativo) o si la línea es un recargo
 * (signo positivo).
 *
 * @author Franco Bonafine
 * @date 12/02/2008
 *
 * @contributor Emiliano Pereyra - http://www.ergio.com.ar
 */
public class DiscountLine implements Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	/** Descripción de la línea de descuento / recargo */
	private String description;
	/** Monto del descuento / recargo */
	private BigDecimal amount;
	/** The object is discount or not */
	private boolean isDiscount;
	/** El monto tiene el IVA incluído o no */
	private boolean amountIncludeIva = true;
	/** Tasa de impuesto */
	private BigDecimal taxRate = null;

	/**
     * @param description
     * @param amount
     * @param amountIncludeIva
     */
    public DiscountLine(String description, BigDecimal amount, boolean amountIncludeIva)
    {
        this(description, amount, true, amountIncludeIva, null);
    }

	/**
	 * @param description
	 * @param amount
	 * @param isDiscount
	 * @param amountIncludeIva
	 */
	public DiscountLine(String description, BigDecimal amount, boolean isDiscount, boolean amountIncludeIva)
	{
	    this(description, amount, isDiscount, amountIncludeIva, null);
	}

	/**
	 * @param description
	 * @param amount
	 * @param isDiscount
	 * @param amountIncludeIva
	 * @param taxRate
	 */
	public DiscountLine(String description, BigDecimal amount, boolean isDiscount,
			boolean amountIncludeIva, BigDecimal taxRate)
	{
		super();
		this.description = description;
		this.amount = amount;
		this.isDiscount = isDiscount;
		this.amountIncludeIva = amountIncludeIva;
		this.taxRate = taxRate;
	}

	/**
	 * @return Returns the amount.
	 */
	public BigDecimal getAmount() {
		return amount;
	}

	/**
	 * @return Retorna el monto en valor absoluto.
	 */
	public BigDecimal getAbsAmount() {
		return amount.abs();
	}

	/**
	 * @param amount
	 *            The amount to set.
	 */
	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	/**
	 * @return Returns the amountIncludeIva.
	 */
	public boolean isAmountIncludeIva() {
		return amountIncludeIva;
	}

	/**
	 * @param amountIncludeIva
	 *            The amountIncludeIva to set.
	 */
	public void setAmountIncludeIva(boolean amountIncludeIva) {
		this.amountIncludeIva = amountIncludeIva;
	}

	/**
	 * @return Returns the description.
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description
	 *            The description to set.
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * Validación de la línea de descuento.
	 * @throws DocumentException cuando la línea del descuento contiene
	 * errores que producirán estados de error en la impresora fiscal.
	 */
	public void validate() throws DocumentException {
		// Validar descripción.
		Document.validateText(getDescription(), "DiscountDescriptionInvalid");
	}

	/**
	 * @return el valor de taxRate
	 */
	public BigDecimal getTaxRate() {
		return taxRate;
	}

	/**
	 * @param taxRate el valor de taxRate a asignar
	 */
	public void setTaxRate(BigDecimal taxRate) {
		this.taxRate = taxRate;
	}

	/**
	 * Retrieves if this instance is a discount or not
	 */
	public boolean isDiscount()
	{
	    return isDiscount;
	}
}
