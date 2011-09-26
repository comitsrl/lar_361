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
package ar.com.ergio.print.fiscal.exception;

import ar.com.ergio.print.fiscal.document.Document;
import ar.com.ergio.print.fiscal.msg.MsgRepository;

public class DocumentException extends Exception {

    private static final long serialVersionUID = -6346053666329730577L;
    private Document document;

	/**
	 * @param msg
	 */
	public DocumentException(String msg) {
		super(MsgRepository.get(msg));
	}

	/**
	 * @param msg
	 * @param document
	 */
	public DocumentException(String msg, Document document) {
		this(msg);
		this.document = document;
	}

	/**
	 * @return Returns the document.
	 */
	public Document getDocument() {
		return document;
	}

	/**
	 * @param document The document to set.
	 */
	public void setDocument(Document document) {
		this.document = document;
	}
	
}
