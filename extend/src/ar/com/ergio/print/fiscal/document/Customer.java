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

import ar.com.ergio.print.fiscal.exception.DocumentException;
import ar.com.ergio.util.LAR_Utils;

/**
 * Persona o cliente asignada a un documento fiscal.
 * @author Franco Bonafine
 * @date 11/02/2008
 */
public class Customer implements Serializable{

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;
	// Tipo de identificación
	/** C.U.I.T. */
	public static final int CUIT = 1;
	/** C.U.I.L. */
	public static final int CUIL = 2;
	/** Libreta de enrolamiento */
	public static final int LIBRETA_DE_ENROLAMIENTO = 3;
	/** Libreta cívica */
	public static final int LIBRETA_CIVICA = 4;
	/** Documento nacional de identidad */
	public static final int DNI = 5;
	/** Pasaporte */
	public static final int PASAPORTE = 6;
	/** Cédula de identidad */
	public static final int CEDULA = 7;
	/** Sin calificador */
	public static final int SIN_CALIFICADOR = 0;

	/** Responsabilidad frente al IVA: Responsable inscripto */
	public static final int RESPONSABLE_INSCRIPTO = 1;
	/** Responsabilidad frente al IVA: Responsable no inscripto */
	public static final int RESPONSABLE_NO_INSCRIPTO = 2;
	/** Responsabilidad frente al IVA: Exento */
	public static final int EXENTO = 3;
	/** Responsabilidad frente al IVA: No responsable */
	public static final int NO_RESPONSABLE = 4;
	/** Responsabilidad frente al IVA: Consumidor final */
	public static final int CONSUMIDOR_FINAL = 5;
	/** Responsabilidad frente al IVA: Responsable no inscripto, venta de bienes de uso */
	public static final int RESPONSABLE_NO_INSCRIPTO_BIENES_DE_USO = 6;
	/** Responsabilidad frente al IVA: Responsable monotributo */
	public static final int RESPONSABLE_MONOTRIBUTO = 7;
	/** Responsabilidad frente al IVA: Monotributista social */
	public static final int MONOTRIBUTISTA_SOCIAL = 8;
	/** Responsabilidad frente al IVA: Pequeño contribuyente eventual */
	public static final int PEQUENO_CONTRIBUYENTE_EVENTUAL = 9;
	/** Responsabilidad frente al IVA: Pequeño contribuyente eventual social */
	public static final int PEQUENO_CONTRIBUYENTE_EVENTUAL_SOCIAL = 10;
	/** Responsabilidad frente al IVA: No categorizado */
	public static final int NO_CATEGORIZADO = 0;

	/** Nombre y apellido del cliente */
	private String name = null;
	/** Tipo de identificación del cliente */
	private int identificationType = SIN_CALIFICADOR;
	/** Número de identificación del cliente */
	private String identificationNumber = null;
	/** Responsabilidad frente al IVA del cliente */
	private int ivaResponsibility = NO_CATEGORIZADO;
	/** Domicilio legal del cliente */
	private String location = null;

	public Customer(){
		super();
	}

	/**
	 * @param name Nombre y apellido.
	 * @param documentType Tipo de documento
	 * @param documentNumber Número de documento.
	 * @param ivaResponsibility Responsabilidad frente al IVA.
	 * @param location Domicilio comercial.
	 */
	public Customer(String name, int identificationType, String identificationNumber, int ivaResponsibility, String location) {
		super();
		this.name = name;
		this.identificationNumber = identificationNumber;
		this.ivaResponsibility = ivaResponsibility;
		this.identificationType = identificationType;
		this.location = location;
	}

	/**
	 * @return Returns the identificationNumber.
	 */
	public String getIdentificationNumber() {
		return identificationNumber;
	}

	/**
	 * @param identificationNumber The identificationNumber to set.
	 */
	public void setIdentificationNumber(String identificationNumber) {
		if (identificationNumber == null || identificationNumber.isEmpty()) {
			setIdentificationType(SIN_CALIFICADOR);
		}
		this.identificationNumber = identificationNumber;
	}

	/**
	 * @return Returns the identificationType.
	 */
	public int getIdentificationType() {
		return identificationType;
	}

	/**
	 * @param identificationType The identificationType to set.
	 */
	public void setIdentificationType(int identificationType) {
		this.identificationType = identificationType;
	}

	/**
	 * @return Returns the ivaResponsibility.
	 */
	public int getIvaResponsibility() {
		return ivaResponsibility;
	}

	/**
	 * @param ivaResponsibility The ivaResponsibility to set.
	 */
	public void setIvaResponsibility(int ivaResponsibility) {
		this.ivaResponsibility = ivaResponsibility;
	}

	/**
	 * @return Returns the location.
	 */
	public String getLocation() {
		return location;
	}

	/**
	 * @param location The location to set.
	 */
	public void setLocation(String location) {
		this.location = location;
	}

	/**
	 * @return Returns the name.
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name The name to set.
	 */
	public void setName(String name) {
		this.name = name;
	}

	/**
	 * Validación del cliente del documento.
	 * @throws DocumentException cuando los datos del cliente no son
	 * válidos para la impresión del documento.
	 */
	public void validate() throws DocumentException {
		int idType = getIdentificationType();
		int ivaRes = getIvaResponsibility();

		// Para categorías de IVA que no sea Consumidor Final y No Categorizado
		// el tipo de identificación debe ser CUIT.
        if (ivaRes != CONSUMIDOR_FINAL && ivaRes != NO_CATEGORIZADO && idType != CUIT) {
            throw Document.createDocumentException("IdentificationTypeMustBeCUIT");
        }

		// Si el cliente no tiene categoría de IVA entonces debe tener
		// algún tipo de identificación.
        if (ivaRes == NO_CATEGORIZADO && idType == SIN_CALIFICADOR) {
            throw Document.createDocumentException("CustomerIdentificationRequired");
        }

		// Si el documento no es a Consumidor Final se deben validar
		// la existencia del nombre, tipo de identificación, número de
		// identificación y domicilio comercial.
        if (ivaRes != CONSUMIDOR_FINAL) {
            Document.validateText(getName(), "CustomerNameRequired");
            Document.validateText(getLocation(), "CustomerLocationRequired");
            Document.validateText(getIdentificationNumber(), "CustomerIdNumberRequired");
        }

		// Si el tipo de identificación es CUIT o CUIL se valida el número
		// ingresado.
        if (idType == CUIT || idType == CUIL) {
            LAR_Utils.validateCUIT(identificationNumber);
        }
	}

//	/**
//	 * Validación del número de CUIT / CUIL.
//	 * @param number Número a validar.
//	 * @throws DocumentException cuando el número de CUIT / CUIL no es
//	 * válido.
//	 */
//	private void validateCUIT() throws DocumentException {
//		boolean res = false;
//		String number = getIdentificationNumber();
//
//		if (number != null && number.trim().length() != 0) {
//			number = number.trim();
//			try {
//				int[] magicValues = {5,4,3,2,7,6,5,4,3,2};
//				int[] values = new int[11];
//				int i;
//				int sum = 0;
//
//				number = number.replace("-", "");
//
//				if (number.length() == 11) {
//					for (i = 0; i < 11; i++)
//						values[i] = Integer.parseInt(number.substring(i, i+1));
//
//					int checkDigit = values[10];
//
//					for (i = 0; i < 10; i++)
//						sum = sum + values[i] * magicValues[i];
//
//					int dividend = sum / 11;
//					int product = dividend * 11;
//					int substraction = sum - product;
//					checkDigit = (substraction > 0) ? 11 - substraction : substraction;
//
//					res = (checkDigit == values[i]);
//				}
//
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//		}
//		if(!res)
//			throw Document.createDocumentException("InvalidCustomerCUIT");
//	}

	@Override
	public String toString()
	{
	    StringBuffer sb = new StringBuffer("Customer[")
	            .append("name=").append(name)
	            .append(",idNumber=").append(identificationNumber)
	            .append(",type=").append(identificationType)
	            .append(",iva=").append(ivaResponsibility)
	            .append(",loc=").append(location)
	            .append("]");
	    return sb.toString();
	}
}
