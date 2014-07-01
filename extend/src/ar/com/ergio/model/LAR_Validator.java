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
import java.sql.SQLException;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.acct.Doc;
import org.compiere.acct.DocTax;
import org.compiere.acct.Fact;
import org.compiere.acct.FactLine;
import org.compiere.model.MAcctSchema;
import org.compiere.model.MAllocationHdr;
import org.compiere.model.MAllocationLine;
import org.compiere.model.MBPartner;
import org.compiere.model.MCharge;
import org.compiere.model.MClient;
import org.compiere.model.MDocType;
import org.compiere.model.MInOut;
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
import org.compiere.pos.PosOrderModel;
import org.compiere.process.DocAction;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;

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
         engine.addModelChange(MLARPaymentHeader.Table_Name, this);
         engine.addModelChange(MInOut.Table_Name, this);

         // Documents to be monitored
         engine.addDocValidate(MPayment.Table_Name, this);
         engine.addDocValidate(MInvoice.Table_Name, this);
         engine.addDocValidate(MInOut.Table_Name, this);
         engine.addDocValidate(MAllocationHdr.Table_Name, this);
         engine.addDocValidate(MLARPaymentHeader.Table_Name, this);
         engine.addDocValidate(PosOrderModel.Table_Name, this);
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

        // Sincroniza el nro de documento de los remitos "manuales"
        // con el asignado en su orden de remito origen
        if (po.get_TableName().equals(MInOut.Table_Name) && type == TYPE_BEFORE_NEW)
        {
            msg = changeShipmentDocumentNo((MInOut) po);
            if (msg != null)
                return msg;
        }

        // Elimina la retención sobre los pagos cuando se modifica el header
        if (po.get_TableName().equals(MLARPaymentHeader.Table_Name) && type == TYPE_AFTER_CHANGE)
        {
            msg = clearPaymentWithholdingFromHeader((MLARPaymentHeader) po);
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

        // Despues de modificar un pago, se actualiza la retención y el total de al cabecera
        if (po.get_TableName().equals(MPayment.Table_Name) &&
                (type == TYPE_AFTER_NEW || type == TYPE_AFTER_CHANGE || type == TYPE_AFTER_DELETE)
            )
        {
            msg = clearPaymentWithholdingFromPayments((MPayment) po, type);
            if (msg != null)
                return msg;

            msg = updatePaymentHeaderTotalAmt((MPayment) po, type);
            if (msg != null)
                return msg;
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

    			msg=setReconciled(source, "N", pay.get_TrxName());
    			if(msg!=null)
    				return msg;
    			// Marcos Zúñiga -Excludes payment source from drawer (when is not reversal payment)
    			if (pay.getReversal_ID() == 0)
    			{
    			msg=setIsOnDrawer(source, "N", pay.get_TrxName());
    			if(msg!=null)
    				return msg;
    			}
    			
    			msg=setReconciled(pay.getC_Payment_ID(),"N", pay.get_TrxName());
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

    			msg=setReconciled(source, "N", pay.get_TrxName());
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
            // Marcos Zúñiga : Se consideran también las Warehouse Orders (WP)
            if (dt.getDocSubTypeSO() != null && (dt.getDocSubTypeSO().equals(MDocType.DOCSUBTYPESO_POSOrder) || dt.getDocSubTypeSO().equals(MDocType.DOCSUBTYPESO_WarehouseOrder)))
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

        // Antes de preparar la cabecera, se verifica si la retención fue generada
        if (po.get_TableName().equals(MLARPaymentHeader.Table_Name) && timing == TIMING_BEFORE_PREPARE)
        {
            preparePaymentWithholding((MLARPaymentHeader) po);
        }

        // Después de completar crear el certificado de retención y actualiza las fechas
        if (po.get_TableName().equals(MLARPaymentHeader.Table_Name) && timing == TIMING_AFTER_COMPLETE)
        {
            msg = completePaymentWithholding((MLARPaymentHeader) po);
            if (msg != null)
                return msg;
        }

        // Después de anular la cabecera, se elimina certificado retención y se crea una inversa
        if (po.get_TableName().equals(MLARPaymentHeader.Table_Name) && timing == TIMING_AFTER_VOID)
        {
            msg = reversePaymentWithholding((MLARPaymentHeader) po);
            if (msg != null)
                return msg;
        }

        // Return source payment to drawer
        if ((po.get_TableName().equals(MPayment.Table_Name))
                && (timing == TIMING_AFTER_VOID || timing == TIMING_AFTER_REVERSECORRECT))
        {
            MPayment payment  = (MPayment) po;
            Integer source = (Integer) payment.get_Value("LAR_PaymentSource_ID");
            msg = setIsOnDrawer(source, "Y", payment.get_TrxName());
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
         // Determine documentNo for voided shipments
         if (po.get_TableName().equals(MInOut.Table_Name) &&
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

         // Antes de completar una Orde de Venta (POS), cambia el tipo de documento de la
         // misma, dependiendo el medio de pago
         if (po.get_TableName().equals(MOrder.Table_Name) && timing == TIMING_BEFORE_PREPARE)
         {
             msg = changeShipmentDocType((MOrder) po);
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
			BigDecimal taxAmt = BigDecimal.ZERO;
			BigDecimal gravado = BigDecimal.ZERO;
			BigDecimal perceptionAmt = BigDecimal.ZERO;
			for (MOrderTax tax : order.getTaxes(true)) {
				taxAmt = taxAmt.add(tax.getTaxAmt());
			}
			// Acumula la base imponible para calcular la Percepción de IIBB
			for (MOrderLine oline : order.getLines()) {
				if (oline.getM_Product().getC_TaxCategory_ID() == wc.getC_TaxCategory_ID()) {
					gravado = gravado.add(oline.getLineNetAmt());
				}
			}
			if (RESPONSABLE_INSCRIPTO.equals(LAR_TaxPayerType
					.getTaxPayerType(bp))) {
				perceptionAmt = gravado.multiply(wc.getAliquot()).setScale(2,
						BigDecimal.ROUND_HALF_UP);
			} else {
				perceptionAmt = gravado.add(taxAmt).multiply(wc.getAliquot())
						.setScale(2, BigDecimal.ROUND_HALF_UP);
			}

			// Create order perception
            MLAROrderPerception perception = MLAROrderPerception.get(order, order.get_TrxName());
            perception.setC_Order_ID(order.get_ID());
            perception.setC_Tax_ID(wc.getC_Tax_ID());
            perception.setLCO_WithholdingRule_ID(wc.getWithholdingRule_ID());
            perception.setLCO_WithholdingType_ID(wc.getWithholdingType_ID());
            perception.setTaxAmt(perceptionAmt);
            perception.setTaxBaseAmt(gravado);
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

    /**
     * Elimina la retención asociada a la cabecera de pago dada.
     * (basado en el cálculo de la LCO)
     *
     * @param header cabecera de pago a eliminar
     * @param type tipo de modificación
     * @return mensaje de error o nulo
     */
    private String clearPaymentWithholdingFromHeader(final MLARPaymentHeader header)
    {
        // Solo se procesan cabeceras de pago
        if (header.isReceipt())
            return null;

        if (header.is_ValueChanged(MLARPaymentHeader.COLUMNNAME_AD_Org_ID)
                ||  header.is_ValueChanged(MLARPaymentHeader.COLUMNNAME_C_BPartner_ID)
                ||  header.is_ValueChanged(MLARPaymentHeader.COLUMNNAME_C_Invoice_ID)
            )
        {
            boolean thereAreCalc;
            try {
                thereAreCalc = thereAreCalc(header);
            } catch (SQLException e) {
                String msg = "Error buscando las reglas de cálculo de retención sobre pagos";
                log.log(Level.SEVERE, msg, e);
                return msg;
            }
            // TODO - Debería eliminar el registro de retención? Creo que si, consultar con Marcos.
            BigDecimal curWithholdingAmt = header.getWithholdingAmt();
            if (thereAreCalc)
            {
                if (curWithholdingAmt != null)
                    header.setWithholdingAmt(null);
            }
            else
            {
                if (curWithholdingAmt == null)
                    header.setWithholdingAmt(Env.ZERO);
            }
        }
        return null;
    } // clearPaymentWithholdingFromHeader

    /**
     * Elimina la retenci\u00f3n de la cabecera de pago cuando se modifican
     * los pagos asociados a la misma.
     *
     * @param payment pago asociado a la cabecera
     * @param type evento
     * @return mensaje de error o nulo
     */
    private String clearPaymentWithholdingFromPayments(final MPayment payment, int type)
    {
        // Solo se procesan pagos
        if (payment.isReceipt())
            return null;
        // No se procesan los pagos "retención"
		if (payment.get_ValueAsBoolean("EsRetencionIIBB"))
			return null;

        if (type == TYPE_AFTER_NEW || type == TYPE_AFTER_DELETE
                || (type == TYPE_AFTER_CHANGE
                    && (    payment.is_ValueChanged(MPayment.COLUMNNAME_PayAmt)
                        ||  payment.is_ValueChanged(MPayment.COLUMNNAME_C_Invoice_ID)
                        ||  payment.is_ValueChanged(MPayment.COLUMNNAME_TenderType)
                        )
                    )
            )
        {
            boolean thereAreCalc;
            int lar_PaymentHeader_ID = payment.get_ValueAsInt("LAR_PaymentHeader_ID");
            if (lar_PaymentHeader_ID == 0)
                return null;

            final MLARPaymentHeader header = new MLARPaymentHeader(payment.getCtx(), lar_PaymentHeader_ID, payment.get_TrxName());

            try {
                thereAreCalc = thereAreCalc(header);
            } catch (SQLException e) {
                String msg = "Error buscando las reglas de cálculo de retención sobre pagos";
                log.log(Level.SEVERE, msg, e);
                return msg;
            }

            BigDecimal curWithholdingAmt = header.getWithholdingAmt();
            if (thereAreCalc)
            {
                if (curWithholdingAmt != null) {
                    if (!MLARPaymentHeader.setWithholdingAmtDirectly(header, null))
                        return "No se pudo actualizar la cabecera de pago vía setWithholdingAmtDirectly";
                }
            }
            else
            {
                if (curWithholdingAmt == null) {
                    if (!MLARPaymentHeader.setWithholdingAmtDirectly(header, Env.ZERO))
                        return "No se pudo actualizar la cabecera de pago vía setWithholdingAmtDirectly";
                }
            }
        }
        return null;
    } // clearPaymentWithholdingFromPayments

    /**
     * Actualiza el importe total de la cabecera de pago
     *
     * @param LAR_PaymentHeader_ID ID de la cabecera
     * @param type evento
     * @return mensaje de error o nulo
     */
    private String updatePaymentHeaderTotalAmt(final MPayment payment, int type)
    {
        // Solo se procesan pagos
        if (payment.isReceipt())
            return null;
        // No se procesan los pagos "retención"
		if (payment.get_ValueAsBoolean("EsRetencionIIBB"))
			return null;

        if (type == TYPE_AFTER_NEW || type == TYPE_AFTER_DELETE
                || (type == TYPE_AFTER_CHANGE
                    && (    payment.is_ValueChanged(MPayment.COLUMNNAME_PayAmt)
                        ||  payment.is_ValueChanged(MPayment.COLUMNNAME_C_Invoice_ID)
                        ||  payment.is_ValueChanged(MPayment.COLUMNNAME_TenderType)
                        )
                    )
            )
        {
            int lar_PaymentHeader_ID = payment.get_ValueAsInt("LAR_PaymentHeader_ID");
            if (lar_PaymentHeader_ID == 0)
                return null;

            String sql = "UPDATE LAR_PaymentHeader"
                       + "   SET PayHeaderTotalAmt="
                       + "         (SELECT COALESCE(SUM(PayAmt),0)"
                       + "            FROM C_Payment p"
                       + "           WHERE p.IsActive='Y'"
                       + "             AND LAR_PaymentHeader.LAR_PaymentHeader_ID=p.LAR_PaymentHeader_ID)"
                       + " WHERE LAR_PaymentHeader_ID=?";

            int no = DB.executeUpdate(sql, lar_PaymentHeader_ID, payment.get_TrxName());
            if (no != 1)
                return "Error al actualizar el total de la cabecera de pago";
        }
        return null;
    } // updatePaymentHeaderTotalAmt

    /**
     * Dependiendo de la configuración del tipo de documento, genera o exige
     * tener generada la retención sobre la cabecera de pago.
     *
     * @param header cabecera de pago
     * @return mensaje de error o nulo
     */
    private String preparePaymentWithholding(final MLARPaymentHeader header)
    {
        // Solo se procesan las cabeceras de pago
        // Nota: recupera la retención con el método generico para poder comparar con null
        //       y de esta forma, determinar de forma más apropiada si hay que generer o no retención
        if (!header.isReceipt() && header.get_Value("WithholdingAmt") == null)
        {
            final MDocType dt = new MDocType(header.getCtx(), header.getC_DocType_ID(), header.get_TrxName());
            String genwh = dt.get_ValueAsString("GenerateWithholding");
            if (genwh != null) {

                if (genwh.equals("Y")) {
                    // tipo de documento configurado para obligar a la generación de retención
                    return "Retenci\u00f3n no generada";
                }

                if (genwh.equals("A")) {
                    // tipo de documento configurado para generar la retención automáticamente
                    if (!header.recalcPaymentWithholding())
                        return "No se pudo generar la retenci\u00f3n sobre la cabecera de pago";
                }
            }
        }
        return null;
    }

    /**
     * Completa el procesamiento de la cabecera de pago.
     * Crea el certificado de retención, actualiza las fechas y la marca como procesada
     *
     * @param header cabecera de pago
     * @return mensaje de error o nulo
     */
    private String completePaymentWithholding(final MLARPaymentHeader header)
    {
        // TODO - Revisar este forma de fuerzar la relectura del header
        header.load(header.get_TrxName());
        // Solo se procesan las cabeceras de pago que tengan
        // importe de retención mayor a cero
        if (!header.isReceipt() && header.getWithholdingAmt() != null &&
                header.getWithholdingAmt().compareTo(Env.ZERO) > 0)
        {
            // Crea el pago con el importe de la retención
            final MPayment newPay = crearPagoRetencion(header);
            if (newPay == null)
                return "Error al crear el pago retenci\u00f3n (no existe cargo configurado)";
            if (!newPay.processIt(DocAction.ACTION_Complete))
                return "Error al procesar el pago retenci\u00f3n de la cabecera: " + newPay.getProcessMsg();
            if (!newPay.save(header.get_TrxName()))
                return "Error guardar el pago retenci\u00f3n de la cabecera";

            // Crea el certificado de retención
            MLARWithholdingCertificate whc = new MLARWithholdingCertificate(
                    header.getCtx(), 0, header.get_TrxName());
            whc.setC_DocType_ID(header.getC_DocType_ID());
            whc.setLAR_PaymentHeader_ID(header.get_ID());
            whc.setC_DocTypeTarget_ID(header.getC_DocType_ID());
            whc.setDocumentNo(header.getDocumentNo());
            if (!whc.save())
                return "No se pudo crear el certificado de retenci\u00f3n";

            // Actualiza las fechas, y marca la retención como procesada
            String sql = "UPDATE LAR_PaymentWithholding"
                       + "   SET DateAcct ="
                       + "          (SELECT DateTrx"
                       + "             FROM LAR_PaymentHeader H"
                       + "            WHERE H.LAR_PaymentHeader_ID = LAR_PaymentWithholding.LAR_PaymentHeader_ID)"
                       + "     , DateTrx ="
                       + "          (SELECT DateTrx"
                       + "             FROM LAR_PaymentHeader H"
                       + "            WHERE H.LAR_PaymentHeader_ID = LAR_PaymentWithholding.LAR_PaymentHeader_ID)"
                       + "     , Processed = 'Y'"
                       + " WHERE LAR_PaymentHeader_ID = ?";
            int no = DB.executeUpdate(sql, header.getLAR_PaymentHeader_ID(), header.get_TrxName());
            if (no != 1)
                return "Error en la actualización de fechas de la retenci\u00f3n";
        }
        return null;
    } // completePaymentWithholding

    /**
     * Crea el pago "retención" necesario para procesar la cabecera de pago
     *
     * @param header cabecera de pago
     * @return pago retencion
     */
    private MPayment crearPagoRetencion(final MLARPaymentHeader header)
    {
        final MDocType dt = new MDocType(header.getCtx(), header.getC_DocType_ID(), header.get_TrxName());
        int c_Charge_ID = dt.get_ValueAsInt("LAR_Withholding_Charge_ID");
        if (c_Charge_ID == 0)
            return null;

        // Se crea el "pago retención"
        final MPayment payment = new MPayment(header.getCtx(), 0, header.get_TrxName());
        payment.setC_DocType_ID(header.getC_DocType_ID());
        payment.setC_Currency_ID(header.getC_Currency_ID());
        payment.setC_BankAccount_ID(header.getC_BankAccount_ID());
        payment.setC_BPartner_ID(header.getC_BPartner_ID());
        payment.setAD_Org_ID(header.getAD_Org_ID());
        payment.setTrxType(MPayment.TRXTYPE_CreditPayment);
        payment.setIsAllocated(false);
        payment.setIsReconciled(true);
        payment.set_ValueOfColumn("EsRetencionIIBB", true);
        payment.set_ValueOfColumn("LAR_PaymentHeader_ID", header.getLAR_PaymentHeader_ID());
        payment.setTenderType(MPayment.TENDERTYPE_Cash);
        payment.setPayAmt(header.getWithholdingAmt());
        payment.setC_Charge_ID(c_Charge_ID);
        return payment;
    }

    /**
     * Revierte la retención sobre la cabecera de pago cuando esta es anulada.
     *
     * @param header cabecera de pago anulada
     * @return mensaje de error o nulo
     */
    private String reversePaymentWithholding(final MLARPaymentHeader header)
    {
        if (!header.isReceipt() && header.getWithholdingAmt() != null &&
                header.getWithholdingAmt().compareTo(Env.ZERO) > 0)
        {
            // Se crea la retención inversa
            final MLARPaymentWithholding pwh = MLARPaymentWithholding.get(header);
            final MLARPaymentWithholding pwhnew = new MLARPaymentWithholding(header.getCtx(), 0, header.get_TrxName());
            pwhnew.setLAR_PaymentHeader_ID(pwh.getLAR_PaymentHeader_ID());
            pwhnew.setC_Tax_ID(pwh.getC_Tax_ID());
            pwhnew.setLCO_WithholdingRule_ID(pwh.getLCO_WithholdingRule_ID());
            pwhnew.setLCO_WithholdingType_ID(pwh.getLCO_WithholdingType_ID());
            pwhnew.setDateAcct(pwh.getDateAcct());
            pwhnew.setDateTrx(pwh.getDateTrx());
            pwhnew.setPercent(pwh.getPercent());
            pwhnew.setProcessed(true);
            pwhnew.setTaxAmt(pwh.getTaxAmt());
            pwhnew.setTaxBaseAmt(pwh.getTaxBaseAmt().negate());
            if (!pwhnew.save())
                return "No se pudo guardar el la retenci\u00f3n inversa";

            // Se elimina el certificado de retención
            final MLARWithholdingCertificate cert = MLARWithholdingCertificate.get(header);
            if (!cert.delete(true, header.get_TrxName()))
                return "No se pudo eliminar el certificado de retenci\u00f3n de la cabecera anulada";
        }
        return null;
    } // reversePaymentWithholding

    /**
     * Determina si existe o no configuración activa para retenciones sobre pagos.
     *
     * @param header cabecera de pago
     * @return verdadero si existe al menos una configuración activa; falso en caso contrario
     * @throws SQLException
     */
    private boolean thereAreCalc(final MLARPaymentHeader header) throws SQLException
    {
        boolean thereAreCalc = false;
        String sql = "SELECT 1 FROM LCO_WithholdingType wt, LCO_WithholdingRuleConf wrc"
                   + " WHERE wt.LCO_WithholdingType_ID = wrc.LCO_WithholdingType_ID"
                   + "   AND wrc.IsCalcFromPayment = 'Y'";
        PreparedStatement pstmt = DB.prepareStatement(sql, header.get_TrxName());
        ResultSet rs = null;
        try {
            rs = pstmt.executeQuery();
            if (rs.next())
                thereAreCalc = true;
        } catch (SQLException e) {
            throw e;
        } finally {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }
        return thereAreCalc;
    }

    /**
     * Change DocumentNo in order to avoid modified sequence for given document
     */
    // TODO - Improve and add this behavior to ADempiere and make it configurable (ideal)
    private String changeVoidDocumentNo(final PO po)
    {
        final Properties ctx = po.getCtx();
        PO revPo = null;
        MSequence seq = null;
        // Corrije el nro de documento de la factura anulada y su reversa asociada
        if (po.get_TableName().equals(MInvoice.Table_Name))
        {
            final MInvoice invoice = (MInvoice) po;
            // Si no se tiene la referencia a la reversión, no se procesa
            if (invoice.getReversal_ID() == 0)
                return null;

            revPo = new MInvoice(ctx, invoice.getReversal_ID(), invoice.get_TrxName());
            final MInvoice revInvoice = (MInvoice) revPo;
            log.info("Change DocumentNo of " + revInvoice);

            // Intenta recuperar la secuencia "definitiva". Si no tiene, intenta
            // recupera la secuencia "normal". Si no tiene, no sea hace nada debido
            // a que le documento NO tiene secuencia configurada
            int ad_Sequence_ID = invoice.getC_DocType().getDefiniteSequence_ID();
            if (ad_Sequence_ID == 0)
                ad_Sequence_ID = invoice.getC_DocType().getDocNoSequence_ID();

            if (ad_Sequence_ID != 0)
                seq = new MSequence(ctx, ad_Sequence_ID, invoice.get_TrxName());

            // Redefine los nros de documento y las descripciones de las facturas
            String revDocumentNo = "Rev-" + invoice.getDocumentNo() + "-" + invoice.getC_Invoice_ID();
            String voidDocumentNo = "Anu-" + invoice.getDocumentNo() + "-" + invoice.getC_Invoice_ID();
            revInvoice.setDocumentNo(revDocumentNo);
            revInvoice.setDescription("(" + voidDocumentNo + "<-)");
            invoice.setDocumentNo(voidDocumentNo);
            invoice.setDescription("(" + revDocumentNo + "<-)");

            // Si la secuencia es automática, retrocede la numeración
            if (seq != null && seq.isAutoSequence())
                seq.setCurrentNext(seq.getCurrentNext() - 1);
        }
        // Corrije el nro de documento del remito anulado y su reverso asociado
        if (po.get_TableName().equals(MInOut.Table_Name))
        {
            final MInOut shipment = (MInOut) po;
            // Si no se tiene la referencia a la reversión, no se procesa
            if (shipment.getReversal_ID() == 0)
                return null;

            revPo = new MInOut(ctx, shipment.getReversal_ID(), shipment.get_TrxName());
            final MInOut revShipment = (MInOut) revPo;
            log.info("Change DocumentNo of " + revShipment);

            // Intenta recuperar la secuencia "definitiva". En caso que sea nula,
            // recupera la secuencia "normal"
            int AD_Sequence_ID = shipment.getC_DocType().getDefiniteSequence_ID();
            if (AD_Sequence_ID == 0)
                AD_Sequence_ID = shipment.getC_DocType().getDocNoSequence_ID();

            if (AD_Sequence_ID != 0)
                seq = new MSequence(ctx, AD_Sequence_ID, shipment.get_TrxName());

            // Redefine los nros de documento y las descripciones de los remitos
            int sufix = shipment.getM_InOut_ID() * shipment.getDocumentNo().hashCode();

            String revDocumentNo = "R-" + shipment.getDocumentNo() + "-" + Math.abs(sufix);
            String voidDocumentNo = "A-" + shipment.getDocumentNo() + "-" + Math.abs(sufix);
            revShipment.setDocumentNo(revDocumentNo);
            revShipment.setDescription("(" + voidDocumentNo + "<-)");
            shipment.setDocumentNo(voidDocumentNo);
            shipment.setDescription("(" + revDocumentNo + "<-)");

            // Si encontró una secuencia, y la misma es automática, retrocede la numeración
            if (seq != null && seq.isAutoSequence())
                seq.setCurrentNext(seq.getCurrentNext() - 1);
        }
        // Guarda los cambios realizados sobre los nros de documento
        // y las reversiones de las secuencias.
        // (siempre y cuando hayan cambiado y no sean nulos)
        if (revPo != null && !revPo.save())
            return "Error al guardar el documento inverso";

        if (po.is_Changed() && !po.save())
            return "Error al guardar el documento anulado";

        if (seq != null && seq.is_Changed() && !seq.save())
            return "Error al guardar la secuencia";

        return null;
    }

    /**
     * Process acounting for withholding on sales payment
     */
    private String accountingForWithholdingOnPayment(final MAllocationHdr ah)
    {
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

                // Se determina si se procesan cobros o pagos
                if (payment.isReceipt())
                {
                    //////////////////  PROCESA COBROS  //////////////////

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
                else
                {
                    //////////////////  PROCESA PAGOS  //////////////////

                    // Verifica si es un cargo corresponde a un pago retención
                    if (payment.getC_Charge_ID() != 0 && payment.get_ValueAsBoolean("EsRetencionIIBB"))
                    {
                        int c_Charge_ID = payment.get_ValueAsInt("C_Charge_ID");
                        // Recorre las lineas de asiento buscando el cargo
                        // para cambiarle la cuenta por la que corresponde.
                        final FactLine[] factlines = fact.getLines();
                        final MCharge ch = new MCharge(ah.getCtx(), c_Charge_ID, ah.get_TrxName());
                        for (int ifl = 0; ifl < factlines.length; ifl++)
                        {
                            final FactLine fl = factlines[ifl];
                            // Si es un asiento de cargo, se cambia la cuenta
                            if (fl.getAmtAcctDr().equals(ch.getChargeAmt()))
                            {
                                final BigDecimal chargeAmt = payment.getChargeAmt();
                                fl.setAccount(as, MCharge.getAccount(c_Charge_ID, as, chargeAmt));
                            }
                        }
                    }
                }
            }
        }
        return null;
    }

    /**
     * Si la orden POS fue pagada en CtaCte, se realiza el cambio del tipo de
     * documento de la misma:
     * <ul>
     *   <li>Contado -> PosOrderModel.C_DocTypeTarget_ID sin cambios
     *   <li>CtaCte -> PosOrderModel.C_DocTypeTarget_ID = MPOS.C_DocTypeOnCredit_ID
     * </ul>
     *
     * @param order Orden a procesar
     * @return null si el proceso fue correcto; caso contrario el mensaje de error
     */
    private String changeShipmentDocType(final MOrder order)
    {
        // Solo se procesan las ordenes POS
        if (order instanceof PosOrderModel)
        {
            final MPOS pos = new MPOS(order.getCtx(), order.getC_POS_ID(), order.get_TrxName());

            if (!pos.get_ValueAsBoolean("IsShipment") &&
                order.get_ValueAsBoolean("PrintShipment") &&
                order.getC_PaymentTerm_ID() == PosOrderModel.PAYMENTTERMS_Account)
            {
                // Se cambia el tipo de orden para la operación en ctacte
                order.setC_DocTypeTarget_ID(pos.get_ValueAsInt("C_DocTypeOnCredit_ID"));
                if (!order.save())
                    return "No se pudo realizar el cambio de tipo de documento de la orden pdv";
            }
        }
        return null;
    } // changeShipmentDocType

    /**
     * Cambia la numeración <i>solo</i> a los remitos que no estan
     * configurados para ser impresos en el controlador fiscal
     *
     * @param shipment remito
     * @return null si el cambio de nro fue correcto; caso contrario,
     *         mensaje de error
     */
    private String changeShipmentDocumentNo(final MInOut shipment)
    {
        if (!LAR_Utils.isFiscalDocType(shipment.getC_DocType_ID()))
        {
            final MOrder order = new MOrder(shipment.getCtx(), shipment.getC_Order_ID(), shipment.get_TrxName());
            shipment.setDocumentNo(order.getDocumentNo());
        }

        return null;
    } // changeShipmentDocumentNo

	 	/**
	 	 * german wagner
	 	 * @param payID
	 	 * @param value valor en que se seteara el campo isreconcilied
	 	 * @param trxName
	 	 * @return
	 	 */
	 	private String setReconciled(Integer payID, String value, String trxName)
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
	 			return "ERROR al modificar la condición del Cheque (Cartera)";

	 		return null;
	 	}
	 	//Marcos Zúñiga -end
 }   //  LAR_Validator
