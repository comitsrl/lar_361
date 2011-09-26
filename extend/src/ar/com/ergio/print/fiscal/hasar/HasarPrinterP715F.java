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
import java.util.Map;

import ar.com.ergio.print.fiscal.FiscalPacket;
import ar.com.ergio.print.fiscal.comm.FiscalComm;
import ar.com.ergio.print.fiscal.document.Customer;
import ar.com.ergio.print.fiscal.exception.FiscalPrinterIOException;
import ar.com.ergio.print.fiscal.exception.FiscalPrinterStatusError;
import ar.com.ergio.print.fiscal.msg.FiscalMessage;
import ar.com.ergio.print.fiscal.msg.MsgRepository;

/**
 * @author Cuspide Computacion
 *
 */
public class HasarPrinterP715F extends HasarFiscalPrinter {

	/**
	 * 
	 */
	public HasarPrinterP715F() {
		super();
	}

	/**
	 * @param fiscalComm
	 */
	public HasarPrinterP715F(FiscalComm fiscalComm) {
		super(fiscalComm);
	}

	public String formatAmount(BigDecimal amount) {
		amount = amount.setScale(2, BigDecimal.ROUND_HALF_UP);
		return amount.toString();
	}

	public String formatQuantity(BigDecimal quantity) {
		return quantity.toString();
	}
	
	@Override
	protected FiscalPacket loadCustomerData(Customer customer) throws FiscalPrinterStatusError, FiscalPrinterIOException {
		// Este modelo no soporta el tipo de identificacion SIN_CALIFICADOR
		// ni el nº de identificacion nulo.
		
		// Se asume DNI 0
		if (traduceIdentificationType(customer.getIdentificationType()).equals(SIN_CALIFICADOR)) {
			customer.setIdentificationType(Customer.DNI);
		}
		String idNumber = customer.getIdentificationNumber();
		if (idNumber == null || idNumber.length() <1) {
			customer.setIdentificationNumber("0");
		}
		
		return super.loadCustomerData(customer);
	}

	@Override
	public FiscalPacket cmdPrintLineItem(String description, BigDecimal quantity, BigDecimal price, BigDecimal ivaPercent, boolean substract, BigDecimal internalTaxes, boolean basePrice, Integer display) {
		// Force display 0 and maxlength 20 to comply with model docs.
		return cmdPrintLineItem(description, quantity, price, ivaPercent, substract, internalTaxes, basePrice, 0, 15);
	}
	
	protected Map<Integer, FiscalMessage> getPrinterStatusMsgs() {
		// This model doesn't have money drawer, the status pointing its absence is not an error.		
		Map<Integer,FiscalMessage> st = super.getPrinterStatusMsgs();
		st.remove(PST_MONEY_DRAWER_CLOSED);
		st.put(PST_MONEY_DRAWER_CLOSED, MsgRepository.getFiscalMsg(PST_MONEY_DRAWER_CLOSED, "PstMoneyDrawerClosedTitle", "PstMoneyDrawerClosedDesc", false));
		
		
		return st;
	}

	
	
	@Override
	public FiscalPacket cmdPrintFiscalText(String text, Integer display) {
		// El parámetro display no tiene utilidad en este modelo.
		// Siempre se asigna a 0.
		return super.cmdPrintFiscalText(text, 0);
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
		// Este modelo no acepta el parámetro de copias.
		FiscalPacket cmd = createFiscalPacket(CMD_CLOSE_FISCAL_RECEIPT);
		return cmd; 
	}
	
	@Override
	public FiscalPacket cmdCloseDNFH(Integer copies) {
		// Este modelo no acepta el parámetro de copias.
		FiscalPacket cmd = createFiscalPacket(CMD_CLOSE_DNFH);
		return cmd; 
	}
	
	public FiscalPacket cmdSetCustomerData(String name, String customerDocNumber, String ivaResponsibility, String docType, String location) {
		FiscalPacket cmd = super.cmdSetCustomerData(name, customerDocNumber, ivaResponsibility, docType, location);
		cmd.setText(5, location, 40, true);
		return cmd;
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
