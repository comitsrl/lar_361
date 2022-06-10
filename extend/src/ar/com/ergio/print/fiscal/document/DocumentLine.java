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
import ar.com.ergio.print.fiscal.msg.MsgRepository;

public class DocumentLine implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/** Descripción de la línea. */
	private String description;
    /** Unidad de Medida de la línea. */
    private String unidMedida;
	/** Cantidad del ítem. */
	private BigDecimal quantity;
	/** Precio unitario del ítem. */
	private BigDecimal unitPrice;
	/** Porcentaje de aplicación del IVA. */
	private BigDecimal ivaRate;
	/** Precio incluye IVA o no */
	private boolean priceIncludeIva = true;
	/** Línea de descuento asociada a esta línea de documento */
	private DiscountLine discount;
	/** Número de línea */
	private int lineNumber;
    /** Coeficiente k de Impuestos Internos */
    private BigDecimal impuestosInternos;
    /** Imorte Impuestos Internos */
    private BigDecimal importeImpuestosInternos;
    /** Cantidad de unidades por Bulto */
    private String unitsperpack;

	public DocumentLine() {
	
	}
	
	public DocumentLine(int lineNumber, String description, BigDecimal quantity, BigDecimal unitPrice, BigDecimal ivaPercent, boolean priceIncludeIva) {
		super();
		this.description = description;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
		this.ivaRate = ivaPercent;
		this.priceIncludeIva = priceIncludeIva;
		this.lineNumber = lineNumber;
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

    public String getUnidMedida()
    {
        return unidMedida;
    }

    public void setUnidMedida(String unidMedida)
    {
        this.unidMedida = unidMedida;
    }

    public String getUnitsperPack()
    {
        return unitsperpack;
    }

    public void setUnitsperPack(String unitsperpack)
    {
        this.unitsperpack = unitsperpack;
    }
	/**
	 * @return Returns the ivaRate.
	 */
	public BigDecimal getIvaRate() {
		return ivaRate;
	}

	/**
	 * @param ivaRate
	 *            The ivaRate to set.
	 */
	public void setIvaRate(BigDecimal ivaRate) {
		this.ivaRate = ivaRate;
	}

	/**
	 * @return Returns the priceIncludeIva.
	 */
	public boolean isPriceIncludeIva() {
		return priceIncludeIva;
	}

	/**
	 * @param priceIncludeIva
	 *            The priceIncludeIva to set.
	 */
	public void setPriceIncludeIva(boolean priceIncludeIva) {
		this.priceIncludeIva = priceIncludeIva;
	}

	/**
	 * @return Returns the quantity.
	 */
	public BigDecimal getQuantity() {
		return quantity;
	}

	/**
	 * @param quantity
	 *            The quantity to set.
	 */
	public void setQuantity(BigDecimal quantity) {
		this.quantity = quantity;
	}

	/**
	 * @return Returns the substract.
	 */
	public boolean isSubstract() {
		return getSubtotal().compareTo(BigDecimal.ZERO) < 0;
	}

	/**
	 * @return Returns the unitPrice.
	 */
	public BigDecimal getUnitPrice() {
		return unitPrice;
	}

	/**
	 * @return El precio unitario en valor absoluto.
	 */
	public BigDecimal getAbsUnitPrice() {
		return getUnitPrice().abs();
	}
	
	/**
	 * @param unitPrice
	 *            The unitPrice to set.
	 */
	public void setUnitPrice(BigDecimal unitPrice) {
		this.unitPrice = unitPrice;
	}

	/**
	 * @return Returns the discount.
	 */
	public DiscountLine getDiscount() {
		return discount;
	}

	/**
	 * @param discount The discount to set.
	 */
	public void setDiscount(DiscountLine discount) {
		this.discount = discount;
	}
	
	/**
	 * Asigna un descuento o recargo a la línea del documeto.
	 * @param description Descripción del descuento / recargo.
	 * @param amount Monto del descuento / recargo.
	 * @param amountIncludeIva Indica si el descuento contiene el IVA.
	 */
	public void setDiscount(String description, BigDecimal amount, Boolean amountIncludeIva) {
		setDiscount(new DiscountLine(description, amount, amountIncludeIva));
	}
	
	/**
	 * Aplica un descuento a partir de un porcentaje.
	 * @param description Descripción del descuento.
	 * @param percent Porcentaje del precio total de la línea.
	 */
	public void setDiscount(String description, BigDecimal percent) {
		BigDecimal amount = getSubtotal().abs().multiply(percent).divide(new BigDecimal(100), BigDecimal.ROUND_HALF_UP);
		setDiscount(description, amount.negate(), isPriceIncludeIva());
	}
	
	/**
	 * @return Retorna el subtotal de la línea. No contabiliza el deescuento / recargo.
	 */
	public BigDecimal getSubtotal() {
		BigDecimal ivaAmt = BigDecimal.ZERO;
        // @fchiappano Correccion de calculo de neto de linea.
        BigDecimal subtotal = getUnitPrice().multiply(getQuantity());

        if (hasDiscount())
            subtotal = subtotal.subtract(getDiscount().getAmount());

		if(!isPriceIncludeIva()) {
			ivaAmt = subtotal.multiply(getIvaRate()).divide(new BigDecimal(100), BigDecimal.ROUND_HALF_UP);
		}
		return subtotal.add(ivaAmt);
	}
	
	/**
	 * @return Retorna el monto total de la línea contabilizando el descuento / recargo. 
	 */
	public BigDecimal getLineTotal() {
		BigDecimal lineTotal = getSubtotal();
		// @fchiappano los descuentos en ADempiere son sobre el neto, con lo
        // cual este codigo se pasa al getSubTotal()

		/*if(hasDiscount())
			lineTotal = lineTotal.add(getDiscount().getAmount());*/
		return lineTotal;
	}
	
	/**
	 * @return Indica si la línea del documento tiene un descuento / recargo
	 * asociado.
	 */
	public boolean hasDiscount() {
		return getDiscount() != null;
	}

    /**
     * @return Indica si la línea del documento tiene un impuestos internos
     */
    public boolean tieneImpuestosInternos() {
        return getImporteImpuestosInternos().compareTo(BigDecimal.ZERO) != 0;
    }

	/**
	 * Validación de la línea de documento.
	 * @throws DocumentException cuando la línea del documento contiene
	 * errores que producirán estados de error en la impresora fiscal.
	 */
	public void validate() throws DocumentException {
		// Validar cantidad mayor que 0.
		Document.validateNumber(getQuantity(), ">", BigDecimal.ZERO,
				createErrorMsg("LineQuantityInvalid"));
		
		// Validar precio unitario distinto que 0.
		Document.validateNumber(getUnitPrice(), "!=", BigDecimal.ZERO,
				createErrorMsg("LineUnitPriceInvalid"));

		// Validar descripción.
		Document.validateText(getDescription(), createErrorMsg("LineDescriptionInvalid"));
		
		// Si tiene descuento se realiza la validación del mismo.
		if(hasDiscount())
			getDiscount().validate();
	}

	/**
	 * @return Returns the lineNumber.
	 */
	public int getLineNumber() {
		return lineNumber;
	}

	/**
	 * @param lineNumber The lineNumber to set.
	 */
	public void setLineNumber(int number) {
		this.lineNumber = number;
	}
	
	/**
	 * Crea un mensaje de error informativo incluyendo el número de línea.
	 * @param errorMsg Mensaje de error original.
	 * @return Mensaje nuevo ya parseado por el repositori de mensajes.
	 */
	protected String createErrorMsg(String errorMsg) {
		return MsgRepository.get(errorMsg) + 
			   " (" + MsgRepository.get("Line") + " " + getLineNumber() + ")";
	}

    /**
     * @return el valor del coeficiente k que utiliza el
     * controlador fiscal para calcular los Impuestos Internos.
     */
    public BigDecimal getImpuestosInternos() {
        return impuestosInternos;
    }

    /**
     * Setea el valor del coeficiente k que utiliza
     * el controlador fiscal para calcular los Impuestos Internos.
     * @param impuestosInternos
     */
    public void setImpuestosInternos(BigDecimal impuestosInternos) {
        this.impuestosInternos = impuestosInternos;
    }

    /**
     * @return el valor de los Impuestos Internos.
     */
    public BigDecimal getImporteImpuestosInternos() {
        return importeImpuestosInternos;
    }

    /**
     * Setea el valor de los Impuestos Internos.
     * @param impuestosInternos
     */
    public void setImporteImpuestosInternos(BigDecimal importeImpuestosInternos) {
        this.importeImpuestosInternos = importeImpuestosInternos;
    }

    @Override
    public String toString()
    {
        StringBuffer sb = new StringBuffer("DocumentLine[")
                .append("desc=").append(description)
                .append(",qty=").append(quantity)
                .append(",unitPrice=").append(unitPrice)
                .append(",ivaRate=").append(ivaRate)
                .append(",includeIva=").append(priceIncludeIva)
                .append(",ln=").append(lineNumber)
                .append(",k=").append(impuestosInternos)
                .append(",iii=").append(importeImpuestosInternos)
                .append(",discount=").append(discount)
                .append("]");
        return sb.toString();
    }
}
