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

import org.compiere.model.MBPartner;
import org.compiere.model.MClient;
import org.compiere.model.MOrder;
import org.compiere.model.MOrderLine;
import org.compiere.model.MOrderTax;
import org.compiere.model.ModelValidationEngine;
import org.compiere.model.ModelValidator;
import org.compiere.model.PO;
import org.compiere.util.CLogger;
import org.compiere.util.DB;

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
     public String modelChange (PO po, int type) throws Exception
     {
         log.info(po.get_TableName() + " Type: " + type);
         String msg;

         if (po.get_TableName().equals(MBPartner.Table_Name) && type == ModelValidator.TYPE_BEFORE_CHANGE) {
             MBPartner bp = (MBPartner) po;
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

         if (po.get_TableName().equals(MOrderLine.Table_Name) &&
                 (type == ModelValidator.TYPE_AFTER_NEW ||
                  type == ModelValidator.TYPE_AFTER_CHANGE)
                 ) {
             MOrderLine ol = (MOrderLine) po;

             int c_BPartner_ID = ol.getParent().getC_BPartner_ID();
             MBPartner bp = new MBPartner(ol.getCtx(), c_BPartner_ID, ol.get_TrxName());
             msg = calculatePerceptionLine(bp, ol.getParent());
             if (msg != null) {
                 return msg;
             }
         }
        // Changes on OrderLines
        if (po.get_TableName().equals(MOrder.Table_Name) && type == ModelValidator.TYPE_BEFORE_DELETE) {
            MOrder order = (MOrder) po;
            msg = deletePerceptionLine(order);
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
     public String docValidate (PO po, int timing)
     {
         log.info(po.get_TableName() + " Timing: "+timing);
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

     private String calculatePerceptionLine(final MBPartner bp, final MOrder order)
     {
        final PerceptionConfig config = new PerceptionConfig(bp, order);
        log.info("Perception >> " + config);

        // Create order perception
        MLAROrderPerception perception = MLAROrderPerception.get(order, order.get_TrxName());
        perception.setC_Order_ID(order.get_ID());
        perception.setC_Tax_ID(config.getTax_ID());
        perception.setLCO_WithholdingRule_ID(config.getWithholdingRule_ID());
        perception.setLCO_WithholdingType_ID(config.getWithholdingType_ID());
        perception.setTaxAmt(config.getTaxAmount());
        perception.setTaxBaseAmt(config.getSubTotal());
        perception.setIsTaxIncluded(false);
        if (!perception.save()) {
            return "Can not create preception";
        }
        // Update order amounts
        if (!order.save()) {
            return "Can not update order amounts";
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

     /**
      * Encapsulates configuration parameters for perception
      */
     private class PerceptionConfig
     {
         // TODO - try to avoid this hardcode value
         private final int C_TAXCATEGORY_ID = 1000002; // Perception Tax Category

         private BigDecimal aliquot = BigDecimal.ZERO;
         private BigDecimal subtotal;
         private LAR_TaxPayerType taxPayerType;
         private MOrder order;
         private int lco_WithholdingRule_ID;
         private int lco_WithholdingType_ID;
         private int c_Tax_ID;

         private String sql =
                   "SELECT x.rate/100 AS rate"
                 + "     , r.lco_withholdingrule_id "
                 + "     , c.lco_withholdingtype_id"
                 + "     , x.c_tax_id "
                 + "  FROM C_BPartner bp "
                 + "  JOIN LCO_WithholdingRule r ON r.lco_bp_isic_id = bp.lco_isic_id "
                 + "       AND r.lco_bp_taxpayertype_id = bp.lco_taxpayertype_id"
                 + "  JOIN LCO_WithholdingCalc c ON c.lco_withholdingcalc_id = r.lco_withholdingcalc_id "
                 + "  JOIN C_Tax x on x.c_tax_id = c.c_tax_id " + " WHERE bp.c_bpartner_id = ? "
                 + "   AND x.c_taxcategory_id = ?";


         private PerceptionConfig(final MBPartner bp, final MOrder order)
         {
             this.order = order;
             this.taxPayerType = LAR_TaxPayerType.getTaxPayerType(bp);
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

         /**
          * Returns perception amount depending a tax payer type of a given bpartner.
          *
          * @return perception amount
          */
         private BigDecimal getTaxAmount()
         {
             return getSubTotal().multiply(aliquot).setScale(2, BigDecimal.ROUND_HALF_UP);
         }

         /**
          * Returns order subtotal amount depending a tax payer type of a given bpartner.
          *
          * @return order subtotal amount
          */
         private BigDecimal getSubTotal()
         {
             if (subtotal == null) {
                 BigDecimal taxAmt = BigDecimal.ZERO;

                 switch (taxPayerType) {
                 case RESPONSABLE_INSCRIPTO:
                     for (MOrderTax tax : order.getTaxes(true)) {
                         taxAmt = taxAmt.add(tax.getTaxAmt());
                     }
                     subtotal = order.getGrandTotal().subtract(taxAmt);
                     break;
                 default:
                     subtotal = order.getGrandTotal();
                 }
             }
             return subtotal;
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
                 pstmt.setInt(2, C_TAXCATEGORY_ID);
                 rs = pstmt.executeQuery();
                 if (rs.next()) {
                     aliquot = rs.getBigDecimal(1).negate();
                     lco_WithholdingRule_ID = rs.getInt(2);
                     lco_WithholdingType_ID = rs.getInt(3);
                     c_Tax_ID = rs.getInt(4);
                 }
             } catch (Exception e) {
                 log.log(Level.SEVERE, sql, e);
             } finally {
                 DB.close(rs, pstmt);
                 rs = null;
                 pstmt = null;
             }
         } // calculate

         @Override
         public String toString()
         {
             StringBuilder sb = new StringBuilder("PerceptionConfig[");
             sb.append("Aliquot=").append(aliquot);
             sb.append(",Rule=").append(getWithholdingRule_ID());
             sb.append(",Type=").append(getWithholdingType_ID());
             sb.append(",Tax=").append(getTax_ID());
             sb.append(",Amt=").append(getTaxAmount());
             sb.append(",PayerType=").append(taxPayerType);
             sb.append("]");
             return sb.toString();
         }
     } // PerceptionConfig

 }   //  LAR_Validator