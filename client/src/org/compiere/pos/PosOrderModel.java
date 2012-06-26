/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2006 Adempiere, Inc. All Rights Reserved.               *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 *****************************************************************************/
package org.compiere.pos;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import org.compiere.model.MBPartner;
import org.compiere.model.MOrder;
import org.compiere.model.MOrderLine;
import org.compiere.model.MOrderTax;
import org.compiere.model.MPOS;
import org.compiere.model.MPayment;
import org.compiere.model.MPaymentProcessor;
import org.compiere.model.MProduct;
import org.compiere.model.MProductPricing;
import org.compiere.model.MStorage;
import org.compiere.process.DocAction;
import org.compiere.util.Env;
import org.compiere.util.Msg;
import org.compiere.util.ValueNamePair;

import ar.com.ergio.model.MLAROrderPerception;
import ar.com.ergio.model.MLARPaymentHeader;

/**
 * Wrapper for standard order
 * @author Paul Bowden - Adaxa Pty Ltd
 *
 * @contributor Emiliano Pereyra - http://www.ergio.com.ar
 */
public class PosOrderModel extends MOrder {

	private static final long serialVersionUID = 5253837037827124425L;
	//LAR payment terms.
	private static final int PAYMENTTERMS_Account = 3000000;
	private static final int PAYMENTTERMS_Cash = 3000001;

	private MPOS m_pos;
	private List<MPayment> payments = new ArrayList<MPayment>();
	private MLARPaymentHeader paymentHeader;
	private boolean isPaidFromAccount = false;

	public PosOrderModel(Properties ctx, int C_Order_ID, String trxName, MPOS pos) {
		super(ctx, C_Order_ID, trxName);
		set_TrxName(trxName);
		m_pos = pos;
	}

	/**
	 * Get/create Order
	 *
	 * @return order or null
	 */
	public static PosOrderModel createOrder(MPOS pos, MBPartner partner, String trxName) {

		PosOrderModel order = new PosOrderModel(Env.getCtx(), 0, trxName, pos);
		order.setAD_Org_ID(pos.getAD_Org_ID());
		order.setIsSOTrx(true);
		order.setC_POS_ID(pos.getC_POS_ID());
		if (pos.getC_DocType_ID() != 0)
			order.setC_DocTypeTarget_ID(pos.getC_DocType_ID());
		else
			order.setC_DocTypeTarget_ID(MOrder.DocSubTypeSO_POS);
        int m_PriceList_ID = pos.getM_PriceList_ID();
        if (partner != null)
            m_PriceList_ID = partner.getM_PriceList_ID();
		if (partner == null || partner.get_ID() == 0)
			partner = pos.getBPartner();
		if (partner == null || partner.get_ID() == 0) {
			throw new AdempierePOSException("No BPartner for order");
		}
		order.setBPartner(partner);
		//
		order.setM_PriceList_ID(m_PriceList_ID);
		order.setM_Warehouse_ID(pos.getM_Warehouse_ID());
		order.setSalesRep_ID(pos.getSalesRep_ID());
		if (!order.save())
		{
			order = null;
			throw new AdempierePOSException("Save order failed");
		}

		return order;
	} //	createOrder


	/**
	 * @author Community Development OpenXpertya
	 *         *Based on Modified Original Code, Revised and Optimized:
	 *         *Copyright ConSerTi
	 */
	public void setBPartner(MBPartner partner)
	{
		if (getDocStatus().equals("DR") || getDocStatus().equals("IP"))
		{
			if (partner == null || partner.get_ID() == 0) {
				throw new AdempierePOSException("no BPartner");
			}
			else
			{
				log.info("BPartner - " + partner);
				super.setBPartner(partner);
				MOrderLine[] lineas = getLines();
				for (int i = 0; i < lineas.length; i++)
				{
					lineas[i].setC_BPartner_ID(partner.getC_BPartner_ID());
					lineas[i].setTax();
					lineas[i].save();
				}
				saveEx();
			}
		}
	}

	/**
	 * Create new Line
	 *
	 * @return line or null
	 */
	public MOrderLine createLine(MProduct product, BigDecimal qtyOrdered,
			BigDecimal priceActual, int WindowNo) {

		if (!(getDocStatus().equals("DR") || getDocStatus().equals("IP"))) {
		    return null;
		}

		String stockMsg = checkStockAvailable(product, qtyOrdered, WindowNo);
		if (stockMsg != null) {
		    throw new AdempierePOSException(stockMsg);
		}

        String creditMsg = checkCreditAvailable(product, Env.ONE);
        if (creditMsg != null) {
            throw new AdempierePOSException(creditMsg);
        }

		//add new line or increase qty

		// catch Exceptions at order.getLines()
		int numLines = 0;
		MOrderLine[] lines = null;
		try
		{
			lines = getLines(null,"Line");
			numLines = lines.length;
			for (int i = 0; i < numLines; i++)
			{
				if (lines[i].getM_Product_ID() == product.getM_Product_ID())
				{
					//increase qty
					BigDecimal current = lines[i].getQtyEntered();
					BigDecimal toadd = qtyOrdered;
					BigDecimal total = current.add(toadd);
					lines[i].setQty(total);
					lines[i].setPrice(); //	sets List/limit
					if ( priceActual.compareTo(Env.ZERO) > 0 )
						lines[i].setPrice(priceActual);
					lines[i].save();
					return lines[i];
				}
			}
		}
		catch (Exception e)
		{
			log.severe("Order lines cannot be created - " + e.getMessage());
		}

        //create new line
		MOrderLine line = new MOrderLine(this);
		line.setProduct(product);
		line.setQty(qtyOrdered);

		line.setPrice(); //	sets List/limit
		if ( priceActual.compareTo(Env.ZERO) > 0 )
			line.setPrice(priceActual);
		line.save();
		return line;

	} //	createLine


	/**
	 * Delete order from database
	 *
	 * @author Comunidad de Desarrollo OpenXpertya
     *         Basado en Codigo Original Modificado, Revisado y Optimizado de:
     *         Copyright (c) ConSerTi
	 */
	public boolean deleteOrder () {
		if (getDocStatus().equals("DR") || getDocStatus().equals("IP"))
			{
				MOrderLine[] lines = getLines();
				if (lines != null)
				{
					int numLines = lines.length;
					if (numLines > 0)
						for (int i = numLines - 1; i >= 0; i--)
						{
							if (lines[i] != null)
								deleteLine(lines[i].getC_OrderLine_ID());
						}
				}

				MOrderTax[] taxs = getTaxes(true);
				if (taxs != null)
				{
					int numTax = taxs.length;
					if (numTax > 0)
						for (int i = taxs.length - 1; i >= 0; i--)
						{
							if (taxs[i] != null)
								taxs[i].delete(true);
							taxs[i].save();
							taxs[i] = null;
						}
				}

				getLines(true, null);		// requery order
				setDocStatus("VO"); //delete(true); red1 -- should not delete but void the order
				setDocAction("--"); // emmie
				setProcessed(true); //red1 -- to avoid been in history during query
				save();
				return true;
			}
		return false;
	} //	deleteOrder

	/**
	 * to erase the lines from order
	 * @return true if deleted
	 */
	public void deleteLine (int C_OrderLine_ID) {
		if ( C_OrderLine_ID != -1 )
		{
			for ( MOrderLine line : getLines(true, "M_Product_ID") )
			{
				if ( line.getC_OrderLine_ID() == C_OrderLine_ID )
				{
					line.delete(true);
					line.save();
				}
			}
		}
	} //	deleteLine

	/**
	 * 	Process Order
	 *  @author Comunidad de Desarrollo OpenXpertya
	 *         *Basado en Codigo Original Modificado, Revisado y Optimizado de:
	 *         *Copyright (c) ConSerTi
	 */
	public boolean processOrder()
	{
		//Returning orderCompleted to check for order completeness
		boolean orderCompleted = false;
		// check if order completed OK
		if (getDocStatus().equals("DR") || getDocStatus().equals("IP") )
		{
			setDocAction(DocAction.ACTION_Complete);
			try
			{
				if (processIt(DocAction.ACTION_Complete) )
				{
					save();
				}
				else
				{
					log.info( "Process Order FAILED");
				}
			}
			catch (Exception e)
			{
				log.severe("Order can not be completed - " + e.getMessage());
			}
			finally
			{ // When order failed convert it back to draft so it can be processed
				if( getDocStatus().equals("IN") )
				{
					setDocStatus("DR");
				}
				else if( getDocStatus().equals("CO") )
				{
					orderCompleted = true;
					log.info( "SubCheckout - processOrder OK");
				}
				else
				{
					log.info( "SubCheckout - processOrder - unrecognized DocStatus");
				}
			} // try-finally

		}

		return orderCompleted;
	}	// processOrder

	public BigDecimal getTaxAmt()	{
		BigDecimal taxAmt = Env.ZERO;
		for (MOrderTax tax : getTaxes(true))
		{
			taxAmt = taxAmt.add(tax.getTaxAmt());
		}
		taxAmt = taxAmt.add(getPerceptionAmt());// TODO - Think about perceptions as "other tax"
		return taxAmt;
	}

	public BigDecimal getSubtotal() {
		return getGrandTotal().subtract(getTaxAmt());
	}

	@Override
	public BigDecimal getGrandTotal()
	{
	    return super.getGrandTotal().add(getPerceptionAmt());
	}

	public BigDecimal getPaidAmt()
	{
	    if (isPaidFromAccount)
	        return getGrandTotal();
	    BigDecimal amt = BigDecimal.ZERO;
	    for (final MPayment p : payments) {
	        amt = amt.add(p.getPayAmt());
	    }
	    return amt;
	}

	private BigDecimal getPerceptionAmt()
	{
	    MLAROrderPerception perception = MLAROrderPerception.get(this, get_TrxName());
	    return perception == null ? BigDecimal.ZERO : perception.getTaxAmt();
	}

	public boolean payCash(BigDecimal amt)
	{
		MPayment payment = createPayment(MPayment.TENDERTYPE_Cash);
		payment.setC_CashBook_ID(m_pos.getC_CashBook_ID());
		payment.setAmount(getC_Currency_ID(), amt);
		payment.setC_BankAccount_ID(m_pos.getC_BankAccount_ID());
		setPaymentRule(MOrder.PAYMENTRULE_Cash);
        setC_PaymentTerm_ID(PAYMENTTERMS_Cash);
        payment.saveEx();
        payments.add(payment);
        return true;
	} // payCash

	public boolean payCheck(BigDecimal amt, String accountNo, String routingNo, String checkNo, String accountName)
	{
		MPayment payment = createPayment(MPayment.TENDERTYPE_Check);
		payment.setAmount(getC_Currency_ID(), amt);
		payment.setC_BankAccount_ID(m_pos.getC_BankAccount_ID());
		payment.setAccountNo(accountNo);
		payment.setRoutingNo(routingNo);
		payment.setCheckNo(checkNo);
		payment.setA_Name(accountName);
		setPaymentRule(MOrder.PAYMENTRULE_Check);
        setC_PaymentTerm_ID(PAYMENTTERMS_Cash);
        set_ValueOfColumn("IsOnDrawer", true);
        payment.saveEx();
        payments.add(payment);
        return true;
	} // payCheck

	public boolean payCreditCard(BigDecimal amt, String accountName, int month, int year,
			String cardNo, String cvc, String cardtype)
	{

		MPayment payment = createPayment(MPayment.TENDERTYPE_CreditCard);
		payment.setAmount(getC_Currency_ID(), amt);
		payment.setC_BankAccount_ID(m_pos.getC_BankAccount_ID());
		payment.setCreditCard(MPayment.TRXTYPE_Sales, cardtype,
				cardNo, cvc, month, year);
		payment.setA_Name(accountName);
		setPaymentRule(MOrder.PAYMENTRULE_CreditCard);
        setC_PaymentTerm_ID(PAYMENTTERMS_Cash);
		payment.saveEx();
        payments.add(payment);
		return true;
	} // payCheck

	private MPayment createPayment(String tenderType)
	{
	    if (paymentHeader == null)
	    {
	        paymentHeader = new MLARPaymentHeader(getCtx(), 0, get_TrxName());
	        paymentHeader.setAD_Org_ID(m_pos.getAD_Org_ID());
	        paymentHeader.setC_DocType_ID(m_pos.get_ValueAsInt("C_Payment_DocType_ID"));
	        paymentHeader.setC_BPartner_ID(getC_BPartner_ID());
	        paymentHeader.setDateTrx(Env.getContextAsDate(getCtx(), "#Date"));
	        paymentHeader.setDocStatus(DocAction.STATUS_Drafted);
	        paymentHeader.setIsReceipt(true);
	        paymentHeader.saveEx();
	    }
		MPayment payment = new MPayment(getCtx(), 0, get_TrxName());
		payment.setAD_Org_ID(m_pos.getAD_Org_ID());
		payment.setTenderType(tenderType);
		payment.setC_Order_ID(getC_Order_ID());
		//payment.setIsReceipt(true);
		//payment.setC_BPartner_ID(getC_BPartner_ID());
		payment.set_ValueOfColumn("LAR_PaymentHeader_ID", paymentHeader.getLAR_PaymentHeader_ID());
		return payment;
	}

	MPayment[] getPayments()
	{
	    return payments.toArray(new MPayment[payments.size()]);
	}

    boolean processPayments()
    {
        // FIXME - Improve MLARPaymentHeader processes and convetions!!
        if (isPaidFromAccount)
            return true;
        return paymentHeader.processIt(DocAction.ACTION_Complete);
    }

    void clearPayments()
    {
        payments.clear();
        paymentHeader = null;
        isPaidFromAccount = false;
    }

	void setPaidFromAccount()
	{
	    isPaidFromAccount = true;
	    setC_PaymentTerm_ID(PAYMENTTERMS_Account);
	    saveEx();
	}

    public void reload() {
		load( get_TrxName());
		getLines(true, "");
	}

	/**
	 * Duplicated from MPayment
	 * 	Get Accepted Credit Cards for amount
	 *	@param amt trx amount
	 *	@return credit cards
	 */
	public ValueNamePair[] getCreditCards (BigDecimal amt)
	{
		try
		{
			MPaymentProcessor[] m_mPaymentProcessors = MPaymentProcessor.find (getCtx (), null, null,
					getAD_Client_ID (), getAD_Org_ID(), getC_Currency_ID (), amt, get_TrxName());
			//
			HashMap<String,ValueNamePair> map = new HashMap<String,ValueNamePair>(); //	to eliminate duplicates
			for (int i = 0; i < m_mPaymentProcessors.length; i++)
			{
				if (m_mPaymentProcessors[i].isAcceptAMEX ())
					map.put (MPayment.CREDITCARDTYPE_Amex, getCreditCardPair (MPayment.CREDITCARDTYPE_Amex));
				if (m_mPaymentProcessors[i].isAcceptDiners ())
					map.put (MPayment.CREDITCARDTYPE_Diners, getCreditCardPair (MPayment.CREDITCARDTYPE_Diners));
				if (m_mPaymentProcessors[i].isAcceptDiscover ())
					map.put (MPayment.CREDITCARDTYPE_Discover, getCreditCardPair (MPayment.CREDITCARDTYPE_Discover));
				if (m_mPaymentProcessors[i].isAcceptMC ())
					map.put (MPayment.CREDITCARDTYPE_MasterCard, getCreditCardPair (MPayment.CREDITCARDTYPE_MasterCard));
				if (m_mPaymentProcessors[i].isAcceptCorporate ())
					map.put (MPayment.CREDITCARDTYPE_PurchaseCard, getCreditCardPair (MPayment.CREDITCARDTYPE_PurchaseCard));
				if (m_mPaymentProcessors[i].isAcceptVisa ())
					map.put (MPayment.CREDITCARDTYPE_Visa, getCreditCardPair (MPayment.CREDITCARDTYPE_Visa));
			} //	for all payment processors
			//
			ValueNamePair[] retValue = new ValueNamePair[map.size ()];
			map.values ().toArray (retValue);
			log.fine("getCreditCards - #" + retValue.length + " - Processors=" + m_mPaymentProcessors.length);
			return retValue;
		}
		catch (Exception ex)
		{
			ex.printStackTrace();
			return null;
		}
	}	//	getCreditCards

	/**
	 *
	 * Duplicated from MPayment
	 * 	Get Type and name pair
	 *	@param CreditCardType credit card Type
	 *	@return pair
	 */
	private ValueNamePair getCreditCardPair (String CreditCardType)
	{
		return new ValueNamePair (CreditCardType, getCreditCardName(CreditCardType));
	}	//	getCreditCardPair

	/**
	 *
	 * Duplicated from MPayment
	 *	Get Name of Credit Card
	 * 	@param CreditCardType credit card type
	 *	@return Name
	 */
	public String getCreditCardName(String CreditCardType)
	{
		if (CreditCardType == null)
			return "--";
		else if (MPayment.CREDITCARDTYPE_MasterCard.equals(CreditCardType))
			return "MasterCard";
		else if (MPayment.CREDITCARDTYPE_Visa.equals(CreditCardType))
			return "Visa";
		else if (MPayment.CREDITCARDTYPE_Amex.equals(CreditCardType))
			return "Amex";
		else if (MPayment.CREDITCARDTYPE_ATM.equals(CreditCardType))
			return "ATM";
		else if (MPayment.CREDITCARDTYPE_Diners.equals(CreditCardType))
			return "Diners";
		else if (MPayment.CREDITCARDTYPE_Discover.equals(CreditCardType))
			return "Discover";
		else if (MPayment.CREDITCARDTYPE_PurchaseCard.equals(CreditCardType))
			return "PurchaseCard";
		return "?" + CreditCardType + "?";
	}	//	getCreditCardName

	/**
	 * Performs stock validation according to product depending of its
	 * attributes set instance for it.
	 *
	 * @param product
	 * @param attributes
	 * @param count
	 * @return null or error stock message
	 */
    String checkStockAvailable(final MProduct product, final BigDecimal count, int windowNo)
    {
        boolean isSaleWithoutStock = m_pos.get_ValueAsBoolean("IsSaleWithoutStock");
        if (product.isStocked() && !isSaleWithoutStock) {
            // TODO - Review this id lookups (m_locator_id and m_attributesetinstance_id)
            int m_Locator_ID = Env.getContextAsInt(m_pos.getCtx(), windowNo, "M_Locator_ID");
            int m_AttributeSetInstance_ID = Env.getContextAsInt(m_pos.getCtx(), windowNo, "M_AttributeSetInstance_ID");
            String msg = String.format("Product=%s AttrSetInstance=%d Count=%d WindowNo=%d",
                    product, m_AttributeSetInstance_ID, count.intValue(), windowNo);
            log.info(msg);

            BigDecimal available = MStorage.getQtyAvailable(m_pos.getM_Warehouse_ID(), m_Locator_ID, product.get_ID(),
                    m_AttributeSetInstance_ID, get_TrxName());
            if (available == null) {
                available = Env.ZERO;
            }
            if (available.signum() == 0) {
               return Msg.translate(p_ctx, "NoQtyAvailable") + " 0";
            }
            else if (available.compareTo(count) < 0) {
                return Msg.translate(p_ctx, "InsufficientQtyAvailable") + " " +available.toString();
            }
        }
        return null;
    } // checkStockAvailable

    /**
     * Performs credit check from BPartner
     */
    String checkCreditAvailable(final MProduct product, final BigDecimal qty)
    {
        final MBPartner bp = new MBPartner(m_pos.getCtx(), getC_BPartner_ID(), get_TrxName());
        // Limit $0.00 means Unlimited
        if (bp.getSO_CreditLimit().compareTo(BigDecimal.ZERO) == 0)
            return null;

        BigDecimal productPrice = getProductPricing(product.getM_Product_ID()).getPriceStd().multiply(qty);
        BigDecimal creditUsed = bp.getSO_CreditUsed().add(productPrice);
        BigDecimal creditAvailable = bp.getSO_CreditLimit().subtract(creditUsed);
        boolean allowCreditExceeded = m_pos.get_ValueAsBoolean("IsAllowCreditExceeded");

        String msg = String.format("C_BPartner_ID=%d CreditUsed=%.2f ProductPrice=%.2f CreditAvailable=%.2f AllowCreditExceeded=%b",
                bp.getC_BPartner_ID(), bp.getSO_CreditUsed(), productPrice, creditAvailable, allowCreditExceeded);
        log.info(msg);

        if (allowCreditExceeded)
            return null;

        if (creditAvailable.compareTo(BigDecimal.ZERO) < 0)
            return Msg.translate(p_ctx, "CreditLimitOver") + String.format("\n Diferencia: %.2f", creditAvailable);

        return null;
    }

    /**
     *  Get and calculate Product Pricing
     */
    private MProductPricing getProductPricing (int M_Product_ID)
    {
        final MProductPricing m_productPrice = new MProductPricing (M_Product_ID, getC_BPartner_ID(), Env.ONE, true);
        m_productPrice.setM_PriceList_ID(m_pos.getM_PriceList_ID());
        m_productPrice.setPriceDate(getDateOrdered());
        //
        m_productPrice.calculatePrice();
        return m_productPrice;
    }   //  getProductPrice

} // PosOrderModel.class
