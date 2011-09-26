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
package ar.com.ergio.print.fiscal.hasar;

import java.math.BigDecimal;

import ar.com.ergio.print.fiscal.FiscalPacket;
import ar.com.ergio.print.fiscal.comm.FiscalComm;

public class HasarPrinterP322F extends HasarFiscalPrinter {

	public HasarPrinterP322F() {
		super();
	}

	/**
	 * @param fiscalComm
	 */
	public HasarPrinterP322F(FiscalComm fiscalComm) {
		super(fiscalComm);
	}

	public String formatAmount(BigDecimal amount) {
		amount = amount.setScale(4, BigDecimal.ROUND_HALF_UP);
		return amount.toString();
	}

	public String formatQuantity(BigDecimal quantity) {
		return quantity.toString();
	}
	
	@Override
	public FiscalPacket cmdSetGeneralConfiguration(boolean printConfigReport, boolean loadDefaultData, BigDecimal finalConsumerLimit, BigDecimal ticketInvoiceLimit, BigDecimal ivaNonInscript, Integer copies, Boolean printChange, Boolean printLabels, String ticketCutType, Boolean printFramework, Boolean reprintDocuments, String balanceText, Boolean paperSound, String paperSize) {
		return super.cmdSetGeneralConfiguration(printConfigReport, loadDefaultData,
				finalConsumerLimit, BigDecimal.ZERO, ivaNonInscript, copies,
				false, false, null, printFramework,
				reprintDocuments, balanceText, paperSound, paperSize);
	}
	
	@Override
	public FiscalPacket cmdPrintFiscalText(String text, Integer display) {
		// El parámetro display no tiene utilidad en este modelo.
		// Siempre se asigna a 0.
		return super.cmdPrintFiscalText(text, 0);
	}
	
	@Override
	public FiscalPacket cmdPrintLineItem(String description, BigDecimal quantity, BigDecimal price, BigDecimal ivaPercent, boolean substract, BigDecimal internalTaxes, boolean basePrice, Integer display) {
		// El parámetro display no tiene utilidad en este modelo.
		// Siempre se asigna a 0.
		return super.cmdPrintLineItem(description, quantity, price, ivaPercent,
				substract, internalTaxes, basePrice, 0);
	}

	@Override
	public FiscalPacket cmdLastItemDiscount(String description, BigDecimal amount, boolean substract, boolean baseAmount, Integer display) {
		// El parámetro display no tiene utilidad en este modelo.
		// Siempre se asigna a 0.
		return super.cmdLastItemDiscount(description, amount, substract, baseAmount, 0);
	}

	@Override
	public FiscalPacket cmdSubtotal(boolean print, Integer display) {
		// El parámetro display no tiene utilidad en este modelo.
		// Siempre se asigna a 0.
		return super.cmdSubtotal(print, 0);
	}

	@Override
	public FiscalPacket cmdTotalTender(String description, BigDecimal amount, boolean cancel, Integer display) {
		// El parámetro display no tiene utilidad en este modelo.
		// Siempre se asigna a 0.
		return super.cmdTotalTender(description, amount, cancel, 0);
	}
	
	@Override
	public FiscalPacket cmdCloseFiscalReceipt(Integer copies) {
		// Por defecto se anula el parámetro de copias aunque en
		// la versión 2.01 de este modelo se permite el parámetro
		// Se debería validar la versión del controlador para decidir
		// si permitirlo o no.
		FiscalPacket cmd = createFiscalPacket(CMD_CLOSE_FISCAL_RECEIPT);
		return cmd; 
	}

	@Override
	public FiscalPacket cmdCloseDNFH(Integer copies) {
		// Por defecto se anula el parámetro de copias aunque en
		// la versión 2.01 de este modelo se permite el parámetro
		// Se debería validar la versión del controlador para decidir
		// si permitirlo o no.
		FiscalPacket cmd = createFiscalPacket(CMD_CLOSE_DNFH);
		return cmd; 
	}
	
	@Override
	protected String getCAINumber(FiscalPacket response) {
		// Validar la versión del modelo.
		// El número del CAI solo es retornado en la versión 2.01
		// de este modelo.
		try {
			return response.getString(5);	
		} catch(Exception e) {
			return null;
		}
	}
	
	@Override
	protected FiscalPacket cmdReturnRecharge(String description,
			BigDecimal amount, BigDecimal ivaPercent, boolean subtract,
			BigDecimal internalTaxes, boolean baseAmount, Integer display,
			String operation, int descMaxLength) {
		// El parámetro display no tiene utilidad en este modelo.
		// Siempre se asigna a 0.
		return super.cmdReturnRecharge(description, amount, ivaPercent, subtract,
				internalTaxes, baseAmount, 0, operation, descMaxLength);
	}

	@Override
	public FiscalPacket cmdGeneralDiscount(String description,
			BigDecimal amount, boolean substract, boolean baseAmount,
			Integer display) {
		// El parámetro display no tiene utilidad en este modelo.
		// Siempre se asigna a 0.
		return super.cmdGeneralDiscount(description, amount, substract, baseAmount,
				0);
	}
}
