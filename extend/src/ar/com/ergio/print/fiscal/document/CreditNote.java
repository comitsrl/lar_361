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

import ar.com.ergio.print.fiscal.exception.DocumentException;

public class CreditNote extends Document {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8150087561653272447L;
	/** Número del comprobante original por el cual se generó la nota
	 * de crédito */
	private String originalDocumentNo;

	/**
	 * @return Returns the originalDocumentNo.
	 */
	public String getOriginalDocumentNo() {
		return originalDocumentNo;
	}

	/**
	 * @param originalDocumentNo The originalDocumentNo to set.
	 */
	public void setOriginalDocumentNo(String originalDocumentNo) {
		this.originalDocumentNo = originalDocumentNo;
	}

	@Override
	public String getDocumentType() {
		return DT_CREDIT_NOTE;
	}

	@Override
	public void validate() throws DocumentException {
		super.validate();
		
		// Validar que exista el número de documento original.
		Document.validateText(getOriginalDocumentNo(),"InvalidOriginalDocNumber");
		
		// Validar cantidad de líneas mayor que 0.
		if(getLines().isEmpty()) 
			throw createDocumentException("InvalidDocumentLinesCount", this);
	}
}
