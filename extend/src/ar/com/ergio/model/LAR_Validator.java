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
package ar.com.ergio.model;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.logging.Level;

import org.compiere.acct.Doc;
import org.compiere.acct.DocTax;
import org.compiere.acct.Fact;
import org.compiere.acct.FactLine;
import org.compiere.model.MAcctSchema;
import org.compiere.model.MAllocationHdr;
import org.compiere.model.MAllocationLine;
import org.compiere.model.MBPartner;
import org.compiere.model.MClient;
import org.compiere.model.MDocType;
import org.compiere.model.MInvoice;
import org.compiere.model.MOrder;
import org.compiere.model.MOrderLine;
import org.compiere.model.MOrderTax;
import org.compiere.model.MOrgInfo;
import org.compiere.model.MPOS;
import org.compiere.model.MPayment;
import org.compiere.model.MSequence;
import org.compiere.model.MTax;
import org.compiere.model.ModelValidationEngine;
import org.compiere.model.ModelValidator;
import org.compiere.model.PO;
import org.compiere.model.Query;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.compiere.util.Msg;

import static ar.com.ergio.model.LAR_TaxPayerType.RESPONSABLE_INSCRIPTO;
import ar.com.ergio.util.LAR_Utils;

/**
 *  Validator for Localization Argentina
 *
 *  @author Emiliano Gonzalez - Ergio=energia+evolucion - http://www.ergio.com.ar
 *  @version $Id: LAR_Validator.java,v 1.0 2011/11/04  egonzalez Exp $
 */
 public class LAR_Validator implements ModelValidator {

     /**
      *  Constructor.
      *  The class is instantiated when logging in and client is selected/known
      */
     public LAR_Validator()
     {
         super();
     }   //  LAR_Validator

     /** Logger          */
     private static CLogger log = CLogger.getCLogger(LAR_Validator.class);
     /** Client          */
     private int     m_AD_Client_ID = -1;

     /**
      *  Initialize Validation
      *  @param engine validation engine
      *  @param client client
      */
     public void initialize (ModelValidationEngine engine, MClient client)
     {
         //client = null for global validator
         if (client != null) {
             m_AD_Client_ID = client.getAD_Client_ID();
             log.info(client.toString());
         }
         else  {
             log.info("Initializing global validator: "+this.toString());
         }

         //  Tables to be monitored
         engine.addModelChange(MBPartner.Table_Name, this);
         engine.addModelChange(MOrderLine.Table_Name, this);
         engine.addModelChange(MOrder.Table_Name, this);
         engine.addModelChange(MPayment.Table_Name, this);
         engine.addModelChange(MInvoice.Table_Name, this);

         // Documents to be monitored
         engine.addDocValidate(MPayment.Table_Name, this);
         engine.addDocValidate(MInvoice.Table_Name, this);
         engine.addDocValidate(MAllocationHdr.Table_Name, this);
     }   //  initialize

    /**
     * Model Change of a monitored Table. Called after
     * PO.beforeSave/PO.beforeDelete when you called addModelChange for the
     * table
     *
     * @param po
     *            persistent object
     * @param type
     *            TYPE_
     * @return error message or null
     * @exception Exception
     *                if the recipient wishes the change to be not accept.
     */
     public String modelChange(final PO po, int type) throws Exception
     {
         log.info(po.get_TableName() + " Type: " + type);
         String msg;
         // Changes on BPartners
         if (po.get_TableName().equals(MBPartner.Table_Name) && type == TYPE_BEFORE_CHANGE)
         {
             MBPartner bp = (MBPartner) po;
             LAR_TaxPayerType taxPayerType = LAR_TaxPayerType.getTaxPayerType(bp);
             if (!taxPayerType.equals(LAR_TaxPayerType.CONSUMIDOR_FINAL)) {
                 // Check CUIT number
                 String cuit = bp.get_ValueAsString("TaxID");
                 if (!LAR_Utils.validateCUIT(cuit)) {
                     return "ERROR: CUIT invalido";
                 }

                 // Check IIBB number
                 msg = checkIIBBNumber(bp);
                 if (msg != null) {
                     return msg;
                 }
             }
         }
         // Changes on OrderLines
         if (po.get_TableName().equals(MOrderLine.Table_Name) &&
                 (type == TYPE_AFTER_NEW || type == TYPE_AFTER_DELETE || type == TYPE_AFTER_CHANGE))
         {
             MOrderLine ol = (MOrderLine) po;

             int c_BPartner_ID = ol.getC_BPartner_ID();
             MBPartner bp = new MBPartner(ol.getCtx(), c_BPartner_ID, ol.get_TrxName());
             msg = calculatePerceptionLine(bp, ol, type);
             if (msg != null) {
                 return msg;
             }
         }
        // Changes on Order
        if (po.get_TableName().equals(MOrder.Table_Name) && type == TYPE_BEFORE_DELETE)
        {
            MOrder order = (MOrder) po;
            msg = deletePerceptionLine(order);
            if (msg != null) {
                return msg;
            }
        }
        // Creates withholding on payments
        if (po.get_TableName().equals(MPayment.Table_Name)
                && (type == TYPE_AFTER_NEW || type == TYPE_AFTER_CHANGE))
        {
            MPayment payment = (MPayment) po;
            int c_BPartner_ID = payment.getC_BPartner_ID();
            MBPartner bp = new MBPartner(payment.getCtx(), c_BPartner_ID, payment.get_TrxName());
            msg = calculateWithholdingOnPayment(bp, payment, type);
            if (msg != null) {
                return msg;
            }
        }
        // Delete withholding related to deleted payment
        if (po.get_TableName().equals(MPayment.Table_Name) && type == TYPE_BEFORE_DELETE)
        {
            MPayment payment = (MPayment) po;
            msg = deleteWithholdingOnPayment(payment);
            if (msg != null) {
                return msg;
            }
        }
        // Determine letter for sales invoices (from PosOrders)
        if (po.get_TableName().equals(MInvoice.Table_Name) && type == TYPE_AFTER_NEW)
        {
            MInvoice invoice = (MInvoice) po;
            msg = changeDocTypeForInvoice(invoice);
            if (msg != null) {
                return msg;
            }
        }

        //german wagner custom
    	//{
    		if
    			(po.get_TableName().equals(MPayment.Table_Name) &&
    					(	type == ModelValidator.TYPE_BEFORE_NEW || type == ModelValidator.TYPE_BEFORE_CHANGE))
    		{
    			MPayment pay = (MPayment) po;
    			Integer source = (Integer) pay.get_Value("LAR_PaymentSource_ID");

    			if((source==null)||(source <=0))
    				return null;

    			msg=setReconcilied(source, "Y", pay.get_TrxName());
    			if(msg!=null)
    				return msg;
    			// Marcos Zúñiga -Excludes payment source from drawer
    			msg=setIsOnDrawer(source, "N", pay.get_TrxName());
    			if(msg!=null)
    				return msg;

    			msg=setReconcilied(pay.getC_Payment_ID(),"Y", pay.get_TrxName());
    			if(msg!=null)
    				return msg;

    		}

    		if
    		(po.get_TableName().equals(MPayment.Table_Name) && (type == ModelValidator.TYPE_BEFORE_DELETE ))
    		{
    			MPayment pay = (MPayment) po;
    			Integer source = (Integer) pay.get_Value("LAR_PaymentSource_ID");

    			if((source==null)||(source <=0))
    				return null;

    			msg=setReconcilied(source, "N", pay.get_TrxName());
    			if(msg!=null)
    				return msg;
    			// Marcos Zúñiga
    			msg=setIsOnDrawer(source, "Y", pay.get_TrxName());
    			if(msg!=null)
    				return msg;
    		}
    	//}
        return null;
     }

    private String changeDocTypeForInvoice(final MInvoice invoice)
    {
        if (invoice.isSOTrx() && !invoice.isReversal())
        {
            log.info("Changing doctype for " + invoice);
            final MBPartner bp = new MBPartner(invoice.getCtx(), invoice.getC_BPartner_ID(), invoice.get_TrxName());
            int ad_Client_ID = Env.getAD_Client_ID(invoice.getCtx());
            int ad_Org_ID = Env.getAD_Org_ID(invoice.getCtx());
            final MOrgInfo orgInfo = MOrgInfo.get(invoice.getCtx(), ad_Org_ID, invoice.get_TrxName());
            int lco_TaxPayerType_Vendor_ID = orgInfo.get_ValueAsInt("LCO_TaxPayerType_ID");
            int lco_TaxPayerType_Customer_ID = bp.get_ValueAsInt("LCO_TaxPayerType_ID");
            int c_POS_ID = Env.getContextAsInt(invoice.getCtx(),Env.POS_ID) != 0 ? Env.getContextAsInt(invoice.getCtx(),Env.POS_ID)
                    : invoice.get_ValueAsInt("C_POS_ID");

            // Check vendor taxpayertype
            if (lco_TaxPayerType_Vendor_ID == 0) {
                return "VendorTaxPayerTypeNotFound";
            }
            // Check customer taxpayertype
            if (lco_TaxPayerType_Customer_ID == 0) {
                return "CustomerTaxPayerTypeNotFound";
            }
            // Check posnumber
            if (c_POS_ID == 0) {
                return "PosConfigNotFound";
            }

            // Determines document letter to bill
            // Vendor > AD_Org | Customer > BPartner
            String sql = "SELECT L.LAR_DocumentLetter_ID"
                       + "  FROM LAR_DocumentLetter L"
                       + "  JOIN LAR_LetterRule R ON R.LAR_DocumentLetter_ID = L.LAR_DocumentLetter_ID"
                       + " WHERE R.LCO_TaxPayerType_Vendor_ID=?"
                       + "   AND R.LCO_TaxPayerType_Customer_ID=?";

            int lar_DocumentLetter_ID = DB.getSQLValue(invoice.get_TrxName(), sql,
                    lco_TaxPayerType_Vendor_ID, lco_TaxPayerType_Customer_ID);

            // Check document letter config
            if (lar_DocumentLetter_ID == 0) {
                return "LetterRuleNotFount";
            }

            // Retrieve and asign proper doctype to invoice
            StringBuilder whereClause = new StringBuilder("AD_Client_ID=?")
                                                  .append(" AND AD_Org_ID=?")
                                                  .append(" AND IsActive=?")
                                                  .append(" AND DocBaseType=?")
                                                  .append(" AND FiscalDocument=?") // 'F' > Invoice
                                                  .append(" AND LAR_DocumentLetter_ID=?")
                                                  .append(" AND C_POS_ID=?");
            Object[] params = new Object[]{ad_Client_ID, ad_Org_ID, "Y", MDocType.DOCBASETYPE_ARInvoice,
                                           LAR_MDocType.FISCALDOCUMENT_Invoice, lar_DocumentLetter_ID, c_POS_ID};
            MDocType docType = new Query(invoice.getCtx(), MDocType.Table_Name, whereClause.toString(), invoice.get_TrxName())
                    .setParameters(params)
                    .firstOnly();
            // Check retrieved doctype
            if (docType == null) {
                return "DocTypeNotFound";
            }

            /*
             * TODO - Revisar esta forma de determinación del origen de una factura
             *        (desde el POS o desde ventana de Facturas)
             *
             * Si la factura fue generada desde una POS Order, se asume que provino
             * del POS y se le cambia el tipo de documento destino por el obtenido
             * a partir del BP y la Letra.
             */
            MOrder order = new MOrder(invoice.getCtx(), invoice.getC_Order_ID(), invoice.get_TrxName());
            MDocType dt = new MDocType(invoice.getCtx(), order.getC_DocTypeTarget_ID(), invoice.get_TrxName());
            if (dt.getDocSubTypeSO() != null && dt.getDocSubTypeSO().equals(MDocType.DOCSUBTYPESO_POSOrder))
                invoice.setC_DocTypeTarget_ID(docType.getC_DocType_ID());

            invoice.set_ValueOfColumn("LAR_DocumentLetter_ID", lar_DocumentLetter_ID);
            invoice.set_ValueOfColumn("C_POS_ID", c_POS_ID);
            if (!invoice.save()) {
                return "CannotChangeInvoiceDocType";
            }
        }
        return null;
    }

     /**
      *  Validate Document.
      *  Called as first step of DocAction.prepareIt
      *  when you called addDocValidate for the table.
      *  Note that totals, etc. may not be correct.
      *  @param po persistent object
      *  @param timing see TIMING_ constants
      *  @return error message or null
      */
     public String docValidate(final PO po, int timing)
     {
         log.info(po.get_TableName() + " Timing: "+timing);
         String msg;

         // create withholding certificate on complete payment
         if (po.get_TableName().equals(MPayment.Table_Name) && timing == TIMING_AFTER_COMPLETE)
         {
             MPayment payment = (MPayment) po;
             msg = createWithholdingCertificate(payment, timing);
             if (msg != null) {
                 return msg;
             }
         }
         // deactivate the withholding and its certificate when payment is voided
         if (po.get_TableName().equals(MPayment.Table_Name)
                 && (timing == TIMING_AFTER_VOID || timing == TIMING_AFTER_REVERSECORRECT))
         {
             MPayment payment  = (MPayment) po;
             msg = deactivateWithholding(payment, timing);
             if (msg != null) {
                 return msg;
             }
         }
         // Determine documentNo for voided invoices
         if (po.get_TableName().equals(MInvoice.Table_Name) &&
                 (timing == TIMING_AFTER_REVERSECORRECT || timing == TIMING_AFTER_VOID))
         {
             msg = changeVoidDocumentNo(po);
             if (msg != null) {
                 return msg;
             }
         }
         // before posting the allocation - post the payment withholdings vs writeoff amount
         if (po.get_TableName().equals(MAllocationHdr.Table_Name) && timing == TIMING_BEFORE_POST) {
             msg = accountingForWithholdingOnPayment((MAllocationHdr) po);
             if (msg != null)
                 return msg;
         }

         return null;
     }   //  docValidate


     /**
      *  User Login.
      *  Called when preferences are set
      *  @param AD_Org_ID org
      *  @param AD_Role_ID role
      *  @param AD_User_ID user
      *  @return error message or null
      */
     public String login (int AD_Org_ID, int AD_Role_ID, int AD_User_ID)
     {
         log.info("AD_User_ID=" + AD_User_ID);
         return null;
     }   //  login

     /**
      *  Get Client to be monitored
      *  @return AD_Client_ID client
      */
     public int getAD_Client_ID()
     {
         return m_AD_Client_ID;
     }   //  getAD_Client_ID

     private String checkIIBBNumber(final MBPartner bp)
     {
         String msg = null;
         String nroIIBB = (bp.get_ValueAsString("DUNS")).replace("-", "").trim();
         String sqlTipoIIBB = "SELECT value FROM lco_isic WHERE lco_isic_id = ?";
         String tipoIIBB = DB.getSQLValueString(bp.get_TrxName(), sqlTipoIIBB, bp.get_ValueAsInt("LCO_ISIC_ID"));

         if ((tipoIIBB == null)
                 || (tipoIIBB.equals("D") && nroIIBB.length() != 8)
                 || (tipoIIBB.equals("CM") && nroIIBB.length() != 10)) {

             msg = "ERROR: número de IIBB invalido";
         }
         return msg;
     }

    private String calculatePerceptionLine(final MBPartner bp, final MOrderLine line, int type)
    {
        if (type == TYPE_AFTER_NEW || type == TYPE_AFTER_DELETE
                || (type == TYPE_AFTER_CHANGE
                    && (line.is_ValueChanged("LineNetAmt")
                        || line.is_ValueChanged("M_Product_ID")
                        || line.is_ValueChanged("IsActive")
                        || line.is_ValueChanged("C_Tax_ID")
                        || line.is_ValueChanged("C_BPartner_ID")
                        )
                    )
           )
        {
            // Check if withholding on sales is needed
            final MPOS pos = MPOS.get(Env.getCtx(), Env.getContextAsInt(Env.getCtx(),Env.POS_ID));
            if (!pos.get_ValueAsBoolean("IsGenerateWithholdingOnSale")) {
                return null;
            }
            final MOrder order = line.getParent();
            // Check if is a sales transaction
            if (!order.isSOTrx())
                return null;
            final WithholdingConfig wc = new WithholdingConfig(bp, order.isSOTrx());
            log.info("Withholding conf >> " + wc);

            // Calculates subtotal and perception amounts
            BigDecimal subtotal = BigDecimal.ZERO;
            BigDecimal taxAmt = BigDecimal.ZERO;
            if (RESPONSABLE_INSCRIPTO.equals(LAR_TaxPayerType.getTaxPayerType(bp))) {
                for (MOrderTax tax : order.getTaxes(true)) {
                    taxAmt = taxAmt.add(tax.getTaxAmt());
                }
                subtotal = order.getGrandTotal().subtract(taxAmt);
            } else {
                subtotal = order.getGrandTotal();
            }

            BigDecimal perceptionAmt =  subtotal.multiply(wc.getAliquot()).setScale(2, BigDecimal.ROUND_HALF_UP);

            // Create order perception
            MLAROrderPerception perception = MLAROrderPerception.get(order, order.get_TrxName());
            perception.setC_Order_ID(order.get_ID());
            perception.setC_Tax_ID(wc.getC_Tax_ID());
            perception.setLCO_WithholdingRule_ID(wc.getWithholdingRule_ID());
            perception.setLCO_WithholdingType_ID(wc.getWithholdingType_ID());
            perception.setTaxAmt(perceptionAmt);
            perception.setTaxBaseAmt(subtotal);
            perception.setIsTaxIncluded(false);
            if (!perception.save()) {
                return "Can not create preception";
            }
            // Update order amounts
            if (!order.save()) {
                return "Can not update order amounts";
            }
        }
        return null;
    }

    private String deletePerceptionLine(final MOrder order)
    {
        // Check if is a sales transaction
        if (!order.isSOTrx())
            return null;
        // Check if withholding on sales is needed
        final MPOS pos = MPOS.get(Env.getCtx(), Env.getContextAsInt(Env.getCtx(),Env.POS_ID));
        if (!pos.get_ValueAsBoolean("IsGenerateWithholdingOnSale")) {
            return null;
        }
        int c_Order_ID = order.get_ID();
        log.info("Delete perceptions for order " + c_Order_ID);
        String sql = "DELETE FROM LAR_OrderPerception WHERE C_ORDER_ID=?";
        PreparedStatement pstmt = null;
        try {
            pstmt = DB.prepareStatement(sql, order.get_TrxName());
            pstmt.setInt(1, c_Order_ID);
            pstmt.executeUpdate();
        } catch (Exception e) {
            log.log(Level.SEVERE, sql, e);
            return e.getMessage();
        } finally {
            DB.close(pstmt);
            pstmt = null;
        }
        return null;
    }

    private String deleteWithholdingOnPayment(final MPayment payment)
    {
        if (!payment.isReceipt()) // Only process AP payments
        {
            int c_Payment_ID = payment.get_ID();
            log.info("Delete withholding for payment " + c_Payment_ID);
            String sql = "";
            PreparedStatement pstmt = null;
            try {
                sql = "DELETE FROM LAR_PaymentWithholding WHERE C_Payment_ID=?";
                pstmt = DB.prepareStatement(sql, payment.get_TrxName());
                pstmt.setInt(1, c_Payment_ID);
                pstmt.executeUpdate();

                sql = "UPDATE C_Payment"
                    + "   SET WriteOffAmt=?"
                    + "     , WithholdingAmt=?"
                    + "     , WithholdingPercent=?"
                    + " WHERE C_Payment_ID=?";
                pstmt = DB.prepareStatement(sql, payment.get_TrxName());
                pstmt.setBigDecimal(1, BigDecimal.ZERO);
                pstmt.setBigDecimal(2, BigDecimal.ZERO);
                pstmt.setBigDecimal(3, BigDecimal.ZERO);
                pstmt.setInt(4, payment.get_ID());
                pstmt.executeUpdate();
            } catch (Exception e) {
                log.log(Level.SEVERE, sql, e);
                return e.getMessage();
            } finally {
                DB.close(pstmt);
                pstmt = null;
            }
        }
        return null;
    }

    private String calculateWithholdingOnPayment(MBPartner bp, MPayment payment, int type)
    {
        // TODO - improve this way to avoid process reversal payments
        if (payment.getDescription() != null
                && payment.getDescription().contains("{->")
                && payment.getDescription().endsWith(")")) {
            // do nothing - is reversal payment
        }
        else if (type == TYPE_AFTER_NEW || (type == TYPE_AFTER_CHANGE && payment.is_ValueChanged("PayAmt")))
        {
            log.info("C_Payment_ID: " + payment.get_ID());
            if (!payment.isReceipt()) // Only process AP payments
            {
                final WithholdingConfig wc = new WithholdingConfig(bp, false);
                log.info("Withholding conf >> " + wc);

                // if payment amt is greater than the limit, create a withholding
                if (wc.isCalcFromPayment())
                {
                    if (payment.getPayAmt().compareTo(wc.getPaymentThresholdMin()) >= 0)
                    {
                        // create withholding
                        BigDecimal taxAmt = payment.getPayAmt().multiply(wc.getAliquot())
                                .setScale(2, BigDecimal.ROUND_HALF_EVEN);

                        MLARPaymentWithholding pwh = MLARPaymentWithholding.get(payment);
                        pwh.setC_Payment_ID(payment.get_ID());
                        pwh.setC_Invoice_ID(payment.getC_Invoice_ID());
                        pwh.setC_Tax_ID(wc.getC_Tax_ID());
                        pwh.setLCO_WithholdingRule_ID(wc.getWithholdingRule_ID());
                        pwh.setLCO_WithholdingType_ID(wc.getWithholdingType_ID());
                        pwh.setDateAcct(payment.getDateAcct());
                        pwh.setDateTrx(payment.getDateTrx());
                        pwh.setPercent(wc.getAliquot());
                        pwh.setProcessed(false);
                        pwh.setTaxAmt(taxAmt);
                        pwh.setTaxBaseAmt(payment.getPayAmt());
                        if (!pwh.save()) {
                            return "Can not create withholding on payment";
                        }

                        // update payment amounts (with sql in order to avoid circular events)
                        // TODO - Review WriteOffAmt for withholding on invoices (IVA)
                        // NewPayAmt = PayAmt - taxAmt
                        String sql = "UPDATE C_Payment"
                                   + "   SET WriteOffAmt=?"
                                   + "     , PayAmt=?"
                                   + "     , WithholdingAmt=?"
                                   + "     , WithholdingPercent=?"
                                   + " WHERE C_Payment_ID=?";

                        PreparedStatement pstmt = null;
                        try {
                            pstmt = DB.prepareStatement(sql, payment.get_TrxName());
                            pstmt.setBigDecimal(1, taxAmt);
                            pstmt.setBigDecimal(2, payment.getPayAmt().subtract(taxAmt));
                            pstmt.setBigDecimal(3, taxAmt);
                            // save aliquot as percentage
                            pstmt.setBigDecimal(4, wc.getAliquot().multiply(BigDecimal.valueOf(100L)));
                            pstmt.setInt(5, payment.get_ID());
                            pstmt.executeUpdate();
                        } catch (Exception e) {
                            log.log(Level.SEVERE, sql, e);
                            return e.getMessage();
                        } finally {
                            DB.close(pstmt);
                            pstmt = null;
                        }
                    } else {
                        // if exists a withholding, deleted
                        deleteWithholdingOnPayment(payment);
                    }
                }
            }
        }
        return null;
    }

    private String createWithholdingCertificate(final MPayment payment, int timing)
    {
        // TODO - improve this way to avoid process reversal payments
        if (payment.getDescription() != null
                && payment.getDescription().contains("{->")
                && payment.getDescription().endsWith(")")) {
            // do nothing - is reversal payment
        }
        else if (timing == TIMING_AFTER_COMPLETE)
        {
            log.info("C_Payment_ID: " + payment.get_ID());
            if (!payment.isReceipt()) // Only process AP payments
            {
                final MBPartner bp = new MBPartner(payment.getCtx(), payment.getC_BPartner_ID(), payment.get_TrxName());
                final WithholdingConfig wc = new WithholdingConfig(bp, false);

                if (wc.isCalcFromPayment())
                {
                    if (payment.getPayAmt().compareTo(wc.getPaymentThresholdMin()) >= 0) {
                        X_LAR_WithholdingCertificate whc = new X_LAR_WithholdingCertificate(payment.getCtx(), 0,
                                payment.get_TrxName());
                        whc.setC_DocType_ID(wc.getC_DocType_ID());
                        whc.setC_Payment_ID(payment.get_ID());
                        whc.setC_Invoice_ID(payment.getC_Invoice_ID());
                        whc.setC_DocTypeTarget_ID(wc.getC_DocType_ID());
                        whc.setDocumentNo(payment.getDocumentNo());
                        if (!whc.save()) {
                            return "Can not create a withholding certificate";
                        }
                    }
                }
            }
        }
        return null;
    }

    private String deactivateWithholding(final MPayment payment, int timing)
    {
        // TODO - improve this way to avoid process reversal payments
        if (payment.getDescription() != null
                && payment.getDescription().contains("{->")
                && payment.getDescription().endsWith(")")) {
            // do nothing - is reversal payment
        }
        else if (timing == TIMING_AFTER_VOID || timing == TIMING_AFTER_REVERSECORRECT)
        {
            log.info("C_Payment_ID: " + payment.get_ID());
            if(payment.isReceipt())
                return null;
            MLARPaymentWithholding pwh = MLARPaymentWithholding.get(payment);
            pwh.setIsActive(false);
            if (!pwh.save()) {
                return "Can not deactivate payment withholding";
            }
            MLARWithholdingCertificate whc = MLARWithholdingCertificate.get(payment);
            whc.setIsActive(false);
            if (!whc.save()) {
                return "Can not deactivate payment withholding";
            }
        }
        return null;
    }

    /**
     * Change DocumentNo in order to avoid modified sequence for given document
     */
    // TODO - Improve and add this behavior to ADempiere and make it configurable (ideal)
    private String changeVoidDocumentNo(final PO po)
    {
        // fix documentno for reverse invoices
        if (po.get_TableName().equals(MInvoice.Table_Name))
        {
            final MInvoice invoice = (MInvoice) po;
            if (invoice.isSOTrx() && invoice.getReversal_ID() != 0)
            {
                final MInvoice revInvoice = new MInvoice(invoice.getCtx(), invoice.getReversal_ID(), invoice.get_TrxName());
                log.info("Change DocumentNo of " + revInvoice);

                int AD_Sequence_ID = invoice.getC_DocType().getDefiniteSequence_ID();
                final MSequence seq = new MSequence(invoice.getCtx(), AD_Sequence_ID, invoice.get_TrxName());
                String newDocumentNo = Msg.translate(invoice.getCtx(), "Voided") + "-" + invoice.getDocumentNo();

                revInvoice.setDocumentNo(newDocumentNo);
                if (!revInvoice.save())
                    return "AccessCannotUpdate"; // TODO - Improve this message, addding new one

                invoice.setDescription("(" + newDocumentNo + "<-)");
                if (!invoice.save())
                    return "AccessCannotUpdate"; // TODO - Improve this message, addding new one

                seq.setCurrentNext(seq.getCurrentNext() - 1);
                if (!seq.save())
                    return "SequenceDocNotFound"; // TODO - Improve this message, addding new one
            }
        }
        return null;
    }

    /**
     * Process acounting for withholding on sales payment
     */
    private String accountingForWithholdingOnPayment(final MAllocationHdr ah)
    {
        // Only process sales payments
        if (!Env.isSOTrx(Env.getCtx()))
            return null;

        final Doc doc = ah.getDoc();
        final List<Fact> facts = doc.getFacts();

        // One fact per acctschema
        for (int i = 0; i < facts.size(); i++)
        {
            Fact fact = facts.get(i);
            MAcctSchema as = fact.getAcctSchema();

            MAllocationLine[] allocLines = ah.getLines(false);
            for (int j = 0; j < allocLines.length; j++)
            {
                MAllocationLine al = allocLines[j];
                doc.setC_BPartner_ID(al.getC_BPartner_ID()); // TODO is this line necesary?
                int c_Payment_ID = al.getC_Payment_ID();
                if (c_Payment_ID <= 0)
                    continue;
                MPayment payment = new MPayment(ah.getCtx(), c_Payment_ID, ah.get_TrxName());
                if (payment == null || payment.getC_Payment_ID() == 0)
                    continue;

                // Determine if is an withholding or not
                int c_TaxWithholding_ID = payment.get_ValueAsInt("C_TaxWithholding_ID");
                if (c_TaxWithholding_ID <= 0)
                    continue;
                if (payment.getWriteOffAmt().compareTo(Env.ZERO) <= 0)
                    continue;

                // Iterates over factlines, searching one with writeoff account
                // in order to change it to the retrieved from processed payment
                final FactLine[] factlines = fact.getLines();
                for (int ifl = 0; ifl < factlines.length; ifl++)
                {
                    final FactLine fl = factlines[ifl];
                    // if factline account is WriteOff, change it
                    if (fl.getAccount().equals(doc.getAccount(Doc.ACCTTYPE_WriteOff, as)))
                    {
                        // Creates factline with proper account (using c_taxwithholding_id from processed payment)
                        final BigDecimal withholdingAmt = payment.getWriteOffAmt();
                        final MTax tw = new MTax(ah.getCtx(), c_TaxWithholding_ID, ah.get_TrxName());
                        final DocTax taxLine = new DocTax(c_TaxWithholding_ID, tw.getName(), tw.getRate(), Env.ZERO,
                                withholdingAmt, tw.isSalesTax());

                        final FactLine newFactLine = fact.createLine(null, taxLine.getAccount(DocTax.ACCTTYPE_TaxCredit, as),
                                as.getC_Currency_ID(), withholdingAmt, null);
                        if (newFactLine != null)
                            newFactLine.setC_Tax_ID(c_TaxWithholding_ID);

                        // Removes factline with writeoff account from fact
                        log.info(String.format("Replace factline: %s -> %s", fl, newFactLine));
                        fact.remove(fl);
                    }
                }
            }
        }
        return null;
    }

     /**
      * Encapsulates configuration parameters for withholdings
      */
     // TODO - Allow retrive individual configuration, depending withholding type
     //        and using config values defined into lco tables (see LCO_Validator)
     private class WithholdingConfig
     {
         private boolean isCalcFromPayment;
         private BigDecimal aliquot = BigDecimal.ZERO;
         private BigDecimal paymentThresholdMin = BigDecimal.ZERO;
         private int lco_WithholdingRule_ID;
         private int lco_WithholdingType_ID;
         private int c_Tax_ID;
         private int c_DocType_ID;
         private boolean isSOTrx;

         private String sql =
                   "SELECT X.Rate/100 AS Rate"
                 + "     , R.LCO_WithholdingRule_ID"
                 + "     , C.LCO_WithholdingType_ID"
                 + "     , X.C_Tax_ID"
                 + "     , F.IsCalcFromPayment"
                 + "     , F.PaymentThresholdMin"
                 + "     , F.C_DocType_ID"
                 + "  FROM C_BPartner B"
                 + "  JOIN LCO_WithholdingRule R ON R.LCO_BP_ISIC_ID = B.LCO_ISIC_ID"
                 + "       AND R.LCO_BP_TaxPayerType_ID = B.LCO_TaxPayerType_ID"
                 + "  JOIN LCO_WithholdingRuleConf F ON F.LCO_WithholdingType_ID = R.LCO_WithholdingType_ID"
                 + "  JOIN LCO_WithholdingCalc C ON C.LCO_WithholdingCalc_ID = R.LCO_WithholdingCalc_ID"
                 + "  JOIN LCO_WithholdingType T ON T.LCO_WithholdingType_ID = R.LCO_WithholdingType_ID"
                 + "  JOIN C_Tax X on X.C_Tax_ID = C.C_Tax_ID"
                 + " WHERE B.C_BPartner_ID=?"
                 + "   AND T.IsSOTrx=?"
                 + "   AND F.IsActive='Y'";


         private WithholdingConfig(final MBPartner bp, boolean isSOTrx)
         {
             this.isSOTrx = isSOTrx;
             retrieveConfig(bp);
         }

         private int getWithholdingRule_ID()
         {
             return lco_WithholdingRule_ID;
         }

         private int getWithholdingType_ID()
         {
             return lco_WithholdingType_ID;
         }

         private int getC_Tax_ID()
         {
             return c_Tax_ID;
         }

         private BigDecimal getAliquot()
         {
             return isSOTrx ? aliquot.negate() : aliquot;
         }

         private BigDecimal getPaymentThresholdMin()
         {
             return paymentThresholdMin;
         }

         private boolean isCalcFromPayment()
         {
             return isCalcFromPayment;
         }

         private int getC_DocType_ID()
         {
             return c_DocType_ID;
         }

         /**
          * Retrieve perception configuration variables for a given bpartner.
          *
          * @param bp bpartner
          */
         private void retrieveConfig(final MBPartner bp)
         {
             PreparedStatement pstmt = null;
             ResultSet rs = null;
             try {
                 pstmt = DB.prepareStatement(sql, bp.get_TrxName());
                 pstmt.setInt(1, bp.getC_BPartner_ID());
                 pstmt.setString(2, isSOTrx ? "Y" : "N");
                 rs = pstmt.executeQuery();
                 if (rs.next()) {
                     aliquot = rs.getBigDecimal(1).setScale(4, BigDecimal.ROUND_HALF_EVEN);
                     lco_WithholdingRule_ID = rs.getInt(2);
                     lco_WithholdingType_ID = rs.getInt(3);
                     c_Tax_ID = rs.getInt(4);
                     isCalcFromPayment = rs.getString(5).equals("Y");
                     paymentThresholdMin = rs.getBigDecimal(6);
                     c_DocType_ID = rs.getInt(7);
                 }
             } catch (Exception e) {
                 log.log(Level.SEVERE, sql, e);
             } finally {
                 DB.close(rs, pstmt);
                 rs = null;
                 pstmt = null;
             }
         } // retrieveConfig

         @Override
         public String toString()
         {
             StringBuilder sb = new StringBuilder("WithholdingConfig[");
             sb.append("Aliquot=").append(aliquot);
             sb.append(",IsSOTrx=").append(isSOTrx);
             sb.append(",IsCalcFromPayment=").append(isCalcFromPayment);
             sb.append(",C_DocType_ID=").append(c_DocType_ID);
             sb.append(",C_Tax_ID=").append(c_Tax_ID);
             sb.append("]");
             return sb.toString();
         }
     } // WithholndigConfig

	 	/**
	 	 * german wagner
	 	 * @param payID
	 	 * @param value valor en que se seteara el campo isreconcilied
	 	 * @param trxName
	 	 * @return
	 	 */
	 	private String setReconcilied(Integer payID, String value, String trxName)
	 	{
	 		String sql="UPDATE C_Payment SET isReconciled='"+value+"' WHERE C_Payment_ID="+payID;

	 		int result = DB.executeUpdate(sql, trxName);
	 		if(result<0)
	 			return "ERROR al setear los pagos como reconciliados";

	 		return null;
	 	}
	 	//Marcos Zúñiga -begin

	 	/**
	 	 * Marcos Zúñiga
	 	 * @param payID
	 	 * @param Value to be set on IsOnDrawer
	 	 * @param trxName
	 	 * @return
	 	 */
	 	private String setIsOnDrawer(Integer payID, String value, String trxName)
	 	{
	 		String sql="UPDATE C_Payment SET IsOnDrawer='"+value+"' WHERE C_Payment_ID="+payID;

	 		int result = DB.executeUpdate(sql, trxName);
	 		if(result<0)
	 			return "ERROR al excluir los pagos Cartera";

	 		return null;
	 	}
	 	//Marcos Zúñiga -end
 }   //  LAR_Validator
