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

import java.util.ArrayList;
import java.util.List;

import ar.com.ergio.print.fiscal.exception.DocumentException;

/**
 * Clase que representa un documento no fiscal a imprimir en una
 * impresora fiscal. Esta clase no es una subclase de {@link Document}
 * ya que simplemente contiene una lista de líneas {@link String}
 * que son enviadas una a una a la impresora fiscal.
 * @author Franco Bonafine
 * @date 13/04/2010
 */
public class NonFiscalDocument {

	/** Lista de líneas que se imprimen en el orden en que aparecen */
	private List<String> lines;

	/** Cantidad de copias que se imprimen */
	private int copies = 1;
	
	/**
	 * Constructor por defecto de la clase.
	 */
	public NonFiscalDocument() {
		super();
		lines = new ArrayList<String>();
	}

	/**
	 * @return the lines
	 */
	public List<String> getLines() {
		return lines;
	}

	/**
	 * Agrega una línea al final de la lista de líneas del documento
	 * @param line Línea a agregar
	 */
	public void addLine(String line) {
		getLines().add(line);
	}

	/**
	 * @return Devuelve la cantidad de líneas que contiene el documento
	 */
	public int linesCount() {
		return getLines().size();
	}
	
	/**
	 * Validación del documento.
	 * @throws DocumentException cuando el documento no puede enviarse 
	 * a imprimir dado que esta acción produciría un estado de error en la
	 * impresora fiscal.
	 */
	public void validate() throws DocumentException {
		// Validar cantidad de líneas mayor que 0.
		if(getLines().isEmpty()) 
			throw Document.createDocumentException("InvalidDocumentLinesCount");
	}

	/**
	 * @return the copies
	 */
	public int getCopies() {
		return copies;
	}

	/**
	 * @param copies the copies to set
	 */
	public void setCopies(int copies) {
		if (copies <= 0) {
			copies = 1;
		}
		this.copies = copies;
	}
	
	
}
