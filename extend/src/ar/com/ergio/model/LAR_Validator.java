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
import java.util.logging.Level;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.model.MBPartner;
import org.compiere.model.MClient;
import org.compiere.model.MOrder;
import org.compiere.model.MOrderLine;
import org.compiere.model.MOrderTax;
import org.compiere.model.MPayment;
import org.compiere.model.ModelValidationEngine;
import org.compiere.model.ModelValidator;
import org.compiere.model.PO;
import org.compiere.util.CLogger;
import org.compiere.util.DB;

import static ar.com.ergio.model.LAR_TaxPayerType.RESPONSABLE_INSCRIPTO;
import ar.com.ergio.util.LAR_Utils;

/**
 *  Validator for Localization Argentina
 *
 *  @author Emiliano Gonzalez - Ergio=energia+evolucion - http://www.ergio.com.ar
 *  @version $Id: LAR_Validator.java,v 1.0 2011/11/04  egonzalez Exp $
 */
 public class LAR_Validator implements ModelValidator {
     // TODO - try to avoid this hardcode value
     private static final int PERCEPCION_ID = 1000002; // Perception Tax Category
     private static final int RETENCION_ID = 1000003; // Withholding Tax Category

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

         // Documents to be monitored
         engine.addDocValidate(MPayment.Table_Name, this);

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

             int c_BPartner_ID = ol.getParent().getC_BPartner_ID();
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
                        )
                    )
           )
        {
            MOrder order = line.getParent();
            final WithholdingConfig wc = new WithholdingConfig(bp, PERCEPCION_ID);
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
            perception.setC_Tax_ID(wc.getTax_ID());
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
            final WithholdingConfig wc = new WithholdingConfig(bp, RETENCION_ID);
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
            log.info("Payment: " + payment.get_ID());
            MBPartner bp = new MBPartner(payment.getCtx(), payment.getC_BPartner_ID(), payment.get_TrxName());
            WithholdingConfig wc = new WithholdingConfig(bp, RETENCION_ID);

            if (wc.isCalcFromPayment())
            {
                if (payment.getPayAmt().compareTo(wc.getPaymentThresholdMin()) >= 0)
                {
                    X_LAR_WithholdingCertificate whc = new X_LAR_WithholdingCertificate(
                            payment.getCtx(), 0, payment.get_TrxName());
                    whc.setC_DocType_ID(payment.getC_DocType_ID());
                    whc.setC_Payment_ID(payment.get_ID());
                    whc.setC_Invoice_ID(payment.getC_Invoice_ID());
                    whc.setC_DocTypeTarget_ID(payment.getC_DocType_ID());
                    whc.setDocumentNo(payment.getDocumentNo());
                    if (!whc.save()) {
                        return "Can not create a withholding certificate";
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
            log.info("Payment: " + payment.get_ID());

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
      * Encapsulates configuration parameters for withholdings
      */
     // TODO - Allow retrive individual configuration, depending withholding type
     //        and using config values defined into lco tables (see LCO_Validator)
     private class WithholdingConfig
     {
         private int c_TaxCategory_ID;
         private boolean isCalcFromPayment;
         private BigDecimal aliquot = BigDecimal.ZERO;
         private BigDecimal paymentThresholdMin = BigDecimal.ZERO;
         private int lco_WithholdingRule_ID;
         private int lco_WithholdingType_ID;
         private int c_Tax_ID;

         private String sql =
                   "SELECT x.rate/100 AS rate"
                 + "     , r.lco_withholdingrule_id "
                 + "     , c.lco_withholdingtype_id"
                 + "     , x.c_tax_id "
                 + "     , c.iscalcfrompayment"
                 + "     , c.paymentthresholdmin"
                 + "  FROM C_BPartner bp "
                 + "  JOIN LCO_WithholdingRule r ON r.lco_bp_isic_id = bp.lco_isic_id "
                 + "       AND r.lco_bp_taxpayertype_id = bp.lco_taxpayertype_id"
                 + "  JOIN LCO_WithholdingCalc c ON c.lco_withholdingcalc_id = r.lco_withholdingcalc_id "
                 + "  JOIN C_Tax x on x.c_tax_id = c.c_tax_id " + " WHERE bp.c_bpartner_id = ? "
                 + "   AND x.c_taxcategory_id = ?";


         private WithholdingConfig(final MBPartner bp, int c_TaxCategory_ID)
         {
             this.c_TaxCategory_ID = c_TaxCategory_ID;
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

         private int getTax_ID()
         {
             return c_Tax_ID;
         }

         private BigDecimal getAliquot()
         {
             // TODO - Review the way to calculate aliquot
             return c_TaxCategory_ID == PERCEPCION_ID ? aliquot.negate() : aliquot;
         }

         private BigDecimal getPaymentThresholdMin()
         {
             return paymentThresholdMin;
         }

         private boolean isCalcFromPayment()
         {
             return isCalcFromPayment;
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
                 pstmt.setInt(2, c_TaxCategory_ID);
                 rs = pstmt.executeQuery();
                 if (rs.next()) {
                     aliquot = rs.getBigDecimal(1).setScale(4, BigDecimal.ROUND_HALF_EVEN);
                     lco_WithholdingRule_ID = rs.getInt(2);
                     lco_WithholdingType_ID = rs.getInt(3);
                     c_Tax_ID = rs.getInt(4);
                     isCalcFromPayment = rs.getString(5).equals("Y");
                     paymentThresholdMin = rs.getBigDecimal(6);
                 } else {
                     throw new AdempiereException("Withholding configuration not found");
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
             sb.append(",Rule=").append(getWithholdingRule_ID());
             sb.append(",Type=").append(getWithholdingType_ID());
             sb.append(",Tax=").append(getTax_ID());
             sb.append("]");
             return sb.toString();
         }
     } // WithholndigConfig

 }   //  LAR_Validator
