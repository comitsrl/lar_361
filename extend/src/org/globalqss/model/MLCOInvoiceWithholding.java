/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved.                *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
package org.globalqss.model;

import java.sql.ResultSet;
import java.util.Properties;

import org.compiere.model.MInvoice;
import org.compiere.util.CLogger;

/**
 *	Invoice Withholding Model
 *	
 *  @author Carlos Ruiz - globalqss
 *  @version $Id: MLCOInvoiceWithholding.java,v 1.3 2007/08/10 11:44:05 globalqss Exp $
 */
public class MLCOInvoiceWithholding extends X_LCO_InvoiceWithholding
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3086189821486687908L;
	/**	Static Logger	*/
	private static CLogger	s_log	= CLogger.getCLogger (MLCOInvoiceWithholding.class);

	
	/**************************************************************************
	 * 	Default Constructor
	 *	@param ctx context
	 *	@param MLCOInvoiceWithholding_ID id
	 *	@param trxName transaction
	 */
	public MLCOInvoiceWithholding (Properties ctx, int MLCOInvoiceWithholding_ID, String trxName)
	{
		super(ctx, MLCOInvoiceWithholding_ID, trxName);
	}	//	MLCOInvoiceWithholding

	/**
	 * 	Load Constructor
	 *	@param ctx context
	 *	@param rs result set
	 *	@param trxName transaction
	 */
	public MLCOInvoiceWithholding(Properties ctx, ResultSet rs, String trxName)
	{
		super(ctx, rs, trxName);
	}	//	MLCOInvoiceWithholding

	/**************************************************************************
	 * 	Before Save
	 *	@param newRecord
	 *	@return true if save
	 */
	protected boolean beforeSave (boolean newRecord)
	{
		log.fine("New=" + newRecord);
		if (getLCO_WithholdingRule_ID() > 0) {

			// Fill isCalcOnPayment according to rule
			X_LCO_WithholdingRule wr = new X_LCO_WithholdingRule(getCtx(), getLCO_WithholdingRule_ID(), get_TrxName());
			X_LCO_WithholdingCalc wc = new X_LCO_WithholdingCalc(getCtx(), wr.getLCO_WithholdingCalc_ID(), get_TrxName());
			setIsCalcOnPayment( ! wc.isCalcOnInvoice() );

		} else {

			// Fill isCalcOnPayment according to isSOTrx on type
			X_LCO_WithholdingType wt = new X_LCO_WithholdingType (getCtx(), getLCO_WithholdingType_ID(), get_TrxName());
			// set on payment for sales, and on invoice for purchases
			setIsCalcOnPayment(wt.isSOTrx());

		}

		// Fill DateTrx and DateAcct for isCalcOnInvoice according to the invoice
		if (getC_AllocationLine_ID() <= 0) {
			MInvoice inv = new MInvoice(getCtx(), getC_Invoice_ID(), get_TrxName());
			setDateAcct(inv.getDateAcct());
			setDateTrx(inv.getDateInvoiced());
		}

		return true;
	}	//	beforeSave

	/**
	 * 	After Save
	 *	@param newRecord new
	 *	@param success success
	 *	@return saved
	 */
	protected boolean afterSave (boolean newRecord, boolean success)
	{
		if (!success)
			return success;
		
		return LCO_MInvoice.updateHeaderWithholding(getC_Invoice_ID(), get_TrxName());
	}	//	afterSave

	/**
	 * 	After Delete
	 *	@param success success
	 *	@return deleted
	 */
	protected boolean afterDelete (boolean success)
	{
		if (!success)
			return success;
		return LCO_MInvoice.updateHeaderWithholding(getC_Invoice_ID(), get_TrxName());
	}	//	afterDelete
	
}	//	MLCOInvoiceWithholding