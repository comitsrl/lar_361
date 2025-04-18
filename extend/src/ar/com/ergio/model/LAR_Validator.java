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
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.acct.Doc;
import org.compiere.acct.DocTax;
import org.compiere.acct.Fact;
import org.compiere.acct.FactLine;
import org.compiere.grid.VCreateFromFactory;
import org.compiere.grid.VCreateFromPaymentUI;
import org.compiere.model.MAcctSchema;
import org.compiere.model.MAllocationHdr;
import org.compiere.model.MAllocationLine;
import org.compiere.model.MBPartner;
import org.compiere.model.MClient;
import org.compiere.model.MDocType;
import org.compiere.model.MInOut;
import org.compiere.model.MInvoice;
import org.compiere.model.MOrder;
import org.compiere.model.MOrderLine;
import org.compiere.model.MPOS;
import org.compiere.model.MPayment;
import org.compiere.model.MPaymentAllocate;
import org.compiere.model.MSysConfig;
import org.compiere.model.MTax;
import org.compiere.model.ModelValidationEngine;
import org.compiere.model.ModelValidator;
import org.compiere.model.PO;
import org.compiere.pos.PosOrderModel;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.globalqss.model.X_LCO_TaxIdType;

import ar.com.ergio.util.LAR_Utils;

/**
 *  Validator for Localization Argentina
 *
 *  @author Emiliano Gonzalez - http://www.comit.com.ar
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
         // JDBC Driver Version
         String version = "<x.y>";
         Driver driver = null;
         try
         {
             driver = DriverManager.getDriver(DB.getConnectionRO().getMetaData().getURL());
             version = driver.getMajorVersion() + "." + driver.getMinorVersion();
         }
         catch (SQLException e)
         {
             log.log(Level.SEVERE, "No se pudo cargar el driver" + e, e);
         }
         log.info("Driver JDBC Version: " + version);

         //  Tables to be monitored
         engine.addModelChange(MBPartner.Table_Name, this);
         engine.addModelChange(MOrderLine.Table_Name, this);
         engine.addModelChange(MOrder.Table_Name, this);
         engine.addModelChange(MPayment.Table_Name, this);
         engine.addModelChange(MInvoice.Table_Name, this);
         engine.addModelChange(MLARPaymentHeader.Table_Name, this);
         engine.addModelChange(MInOut.Table_Name, this);
         // Se aregan las facturas dentro de una cabecera
         engine.addModelChange(MPaymentAllocate.Table_Name, this);

         // Documents to be monitored
         engine.addDocValidate(MPayment.Table_Name, this);
         engine.addDocValidate(MInvoice.Table_Name, this);
         engine.addDocValidate(MInOut.Table_Name, this);
         engine.addDocValidate(MAllocationHdr.Table_Name, this);
         engine.addDocValidate(MLARPaymentHeader.Table_Name, this);
         engine.addDocValidate(PosOrderModel.Table_Name, this);

        // @fchiappano Agegar las implementaciones de ventanas del tipo
        // CreateFrom, en el mapeo de tablas de Swing.
        VCreateFromFactory.registerClass(MLARRetiroCaja.Table_ID, VCreateFromPaymentUI.class);
        VCreateFromFactory.registerClass(MLARPaymentHeader.Table_ID, VCreateFromPaymentUI.class);
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
         if (po.get_TableName().equals(MBPartner.Table_Name) && (type == TYPE_BEFORE_CHANGE || type == TYPE_BEFORE_NEW))
         {
             MBPartner bp = (MBPartner) po;

             // @fchiappano Validar según el tipo de identificación y no según
             // la condicion de iva del sdn.
             int lco_TaxIDType_ID = bp.get_ValueAsInt("LCO_TaxIDType_ID");
             if (lco_TaxIDType_ID <= 0)
                 return "ERROR: En neceserario especificar un tipo de identificación valido.";

             String tipoIdentificacion = new X_LCO_TaxIdType(Env.getCtx(), lco_TaxIDType_ID, bp.get_TrxName())
                     .getName().toUpperCase();

             if (MSysConfig.getBooleanValue("LAR_ValidarCuitSdN", true, Env.getAD_Client_ID(Env.getCtx())))
             {
                 if (tipoIdentificacion.equals("CUIT") || tipoIdentificacion.equals("CUIL"))
                 {
                     // Check CUIT number
                     String cuit = bp.get_ValueAsString("TaxID");
                     if (!LAR_Utils.validateCUIT(cuit))
                     {
                         return "ERROR: CUIT/CUIL invalido";
                     }
                 }
                 // @fchiappano Validar largo del DNI.
                 else if (tipoIdentificacion.equals("DNI"))
                 {
                     String dni = bp.get_ValueAsString("TaxID");

                     if (dni != null && !dni.equals(""))
                     {
                         int cantCaracteres = dni.length();
                         if (cantCaracteres < 7 || cantCaracteres > 8)
                             return "ERROR: Cantidad de caracteres invalida para tipo de identificación DNI.";
                     }
                 }
             }

             String checkDuplicidad = MSysConfig.getValue("LAR_PermitirDuplicidadCuit/Dni", "N", Env.getAD_Client_ID(Env.getCtx()));
             if ((checkDuplicidad.equals("N") || (checkDuplicidad.equals("A") && type == TYPE_BEFORE_NEW)) &&
                     LAR_Utils.checkDuplicateCUIT(bp.getTaxID(), bp.getC_BPartner_ID()))
                 return "ERROR: CUIT/DNI Duplicado";
         }
         // Changes on OrderLines
         if (po.get_TableName().equals(MOrderLine.Table_Name) &&
                 (type == TYPE_AFTER_NEW || type == TYPE_AFTER_DELETE || type == TYPE_AFTER_CHANGE))
         {
             MOrderLine ol = (MOrderLine) po;

             int c_BPartner_ID = ol.getC_BPartner_ID();
             MBPartner bp = new MBPartner(ol.getCtx(), c_BPartner_ID, ol.get_TrxName());
             msg = LAR_CalcularPercepcion.calculateWhithholdingLine(bp, ol, type);
             if (msg != null) {
                 return msg;
             }
         }
        // Changes on Order
        if (po.get_TableName().equals(MOrder.Table_Name) && type == TYPE_BEFORE_DELETE)
        {
            MOrder order = (MOrder) po;
            msg = LAR_CalcularPercepcion.deleteWhithholdingLine(order);
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
/*
        // @fchiappano Pisar DocumentNo, si difiere con lo que devuelve el CF
        if (po.get_TableName().equals(MInvoice.Table_Name) && type == TYPE_BEFORE_CHANGE)
        {
            MInvoice invoice = (MInvoice) po;
            if (invoice.getDocStatus().equals(MInvoice.DOCSTATUS_Completed) && !invoice.get_ValueAsString("FiscalReceiptNumber").equals(""))
            {
                String documentoNo = invoice.getDocumentNo();
                String nroFactura = documentoNo.substring(documentoNo.length() -8, documentoNo.length());
                String fiscalreceiptnumber = "00000000" + invoice.get_ValueAsString("FiscalReceiptNumber");
                fiscalreceiptnumber = fiscalreceiptnumber.substring(fiscalreceiptnumber.length() -8, fiscalreceiptnumber.length());
                if (!nroFactura.equals(fiscalreceiptnumber))
                {
                    documentoNo = documentoNo.substring(0, documentoNo.length() -8) + fiscalreceiptnumber;
                    String sql = "SELECT COUNT(*) FROM C_Invoice WHERE DocumentNo = ?";
                    int cant_duplicados = DB.getSQLValue(invoice.get_TrxName(), sql, documentoNo);

                    // Si ya existe, una o mas facturas con el mismo documentNo, disparo el error.
                    if (cant_duplicados > 0)
                        anularOperación(invoice, documentoNo, fiscalreceiptnumber);
                    else
                        invoice.setDocumentNo(documentoNo);

                    // Corregir Secuencia.
                    MSequence.setFiscalDocTypeNextNroComprobante(invoice.getC_DocType().getDefiniteSequence_ID(),
                            Integer.parseInt(fiscalreceiptnumber) + 1, null);
                }
            }
        }*/

        // Despues de modificar un pago, se actualiza la retención y el total de al cabecera
        if (po.get_TableName().equals(MPayment.Table_Name) &&
                (type == TYPE_AFTER_NEW || type == TYPE_AFTER_CHANGE || type == TYPE_BEFORE_DELETE)
            )
        {
            msg = clearPaymentWithholdingFromPayments((MPayment) po, type);
            if (msg != null)
                return msg;

            msg = updatePaymentHeaderTotalAmt((MPayment) po, type);
            if (msg != null)
                return msg;
        }

        // Despues de modificar/agregar una factura se actualiza la retención y el total de la cabecera
        if (po.get_TableName().equals(MPaymentAllocate.Table_Name)
                && (type == TYPE_AFTER_NEW || type == TYPE_AFTER_CHANGE || type == TYPE_AFTER_DELETE))
        {
            msg = clearPaymentWithholdingFromPaymentAllocate((MPaymentAllocate) po, type);
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

                /* @fchiappano Se comenta codigo, ya que se define si debe quedar conciliado el pago/cobro,
                               en cada uno de los procesos que intervienen en la funcionalidad de cajas.
    			msg=setReconciled(pay.getC_Payment_ID(),"N", pay.get_TrxName());
    			if(msg!=null)
    				return msg;
                */
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

        // @fchiappano Verificar si el tipo de documento admite fecha futura.
        if ((po.get_TableName().equals(MOrder.Table_Name) || po.get_TableName().equals(MInvoice.Table_Name)
                || po.get_TableName().equals(MInOut.Table_Name))
                && (type == ModelValidator.TYPE_BEFORE_NEW || (type == ModelValidator.TYPE_BEFORE_CHANGE)))
        {
            boolean permiteFF = true;
            boolean esFechaFutura = false;
            boolean esNuevo = (type == ModelValidator.TYPE_BEFORE_NEW);

            // Ordenes
            if (po.get_TableName().equals(MOrder.Table_Name)
                    && (esNuevo || po.is_ValueChanged(MOrder.COLUMNNAME_DateOrdered)))
            {
                MOrder orden = (MOrder) po;
                permiteFF = ((MDocType) orden.getC_DocTypeTarget()).get_ValueAsBoolean("Permite_Fecha_Futura");
                esFechaFutura = orden.getDateOrdered().after(new Timestamp(System.currentTimeMillis()));
            }
            // Facturas
            else if (po.get_TableName().equals(MInvoice.Table_Name)
                    && (esNuevo || po.is_ValueChanged(MInvoice.COLUMNNAME_DateInvoiced)))
            {
                MInvoice invoice = (MInvoice) po;
                permiteFF = ((MDocType) invoice.getC_DocTypeTarget()).get_ValueAsBoolean("Permite_Fecha_Futura");
                esFechaFutura = invoice.getDateInvoiced().after(new Timestamp(System.currentTimeMillis()));
            }
            // Remitos
            else if (po.get_TableName().equals(MInOut.Table_Name)
                    && (esNuevo || po.is_ValueChanged(MInOut.COLUMNNAME_MovementDate)))
            {
                MInOut remito = (MInOut) po;
                permiteFF = ((MDocType) remito.getC_DocType()).get_ValueAsBoolean("Permite_Fecha_Futura");
                esFechaFutura = remito.getMovementDate().after(new Timestamp(System.currentTimeMillis()));
            }

            if (!permiteFF && esFechaFutura)
            {
                msg = "El tipo de documento seleccionado no admite fechas futuras.";
                return msg;
            }
        }

        return null;
     }

    private String changeDocTypeForInvoice(final MInvoice invoice)
    {
        if (invoice.isSOTrx() && !invoice.isReversal())
        {
            log.info("Changing doctype for " + invoice);
            final MBPartner bp = new MBPartner(invoice.getCtx(), invoice.getC_BPartner_ID(), invoice.get_TrxName());

            // @emmie: Funcionalidad de sincronización con SymmetricDS
            // Si la factura tiene la marca de "sincronizada", entonces se
            // mantiene esa organización
            int ad_Org_ID;
            if (invoice.get_ValueAsBoolean("Sincronizada") ||
                            // @fchiappano Si la factura proviene del pos, utilizar igualmente
                            // la org de la factura, por mas que no sea importada.
                            (invoice.getC_Order_ID() > 0 && invoice.getC_Order().getC_DocTypeTarget().getDocSubTypeSO().equals(MDocType.DOCSUBTYPESO_POSOrder)))
                ad_Org_ID = invoice.getAD_Org_ID();
            else
                // Utiliza la Organización del entorno, esto posibilita
                // determinar correctamente el
                // tipo de documento cuando se factura una orden creada en otra
                // organización
                ad_Org_ID = Env.getAD_Org_ID(bp.getCtx());

            /*
             * @emmie - Siempre se recupera el ID del POS desde la factura, ya que el mismo o se
             *          asigna en las ventanas correspondientes, o se asigna en el contructor de
             *          la orden cuando se crea una factura desde una orden (venta desde POS)
             */
            int c_POS_ID = invoice.get_ValueAsInt("C_POS_ID");

            // @emmie @mzuniga Se abstrae la forma de recuperar el tipo de documento
            // @mzuniga Se considera el tipo de documento base (NC o Factura)
            final MDocType docType;
            MDocType dt_orig = new MDocType(invoice.getCtx(), invoice.getC_DocTypeTarget_ID(), invoice.get_TrxName());
            if (invoice.getC_Order_ID() != 0 || invoice.getM_RMA_ID() != 0)
            {
            final FindInvoiceDocType findDocType = new FindInvoiceDocType(bp, c_POS_ID, ad_Org_ID, dt_orig.getDocBaseType());
            docType = findDocType.getDocType();
            }
            else
                docType = dt_orig;

            // Check retrieved doctype
            if (docType == null) {
                return "No se encontró el tipo de documento";
            }

            /*
             * Si la factura fue generada desde una POS Order, se asume que provino
             * del POS y se le cambia el tipo de documento destino por el obtenido
             * a partir del BP y la Letra.
             *
             * Algo similar sucede si la orden fue generada desde una Orden de Remito
             */
            MOrder order = new MOrder(invoice.getCtx(), invoice.getC_Order_ID(), invoice.get_TrxName());
            MDocType dt = new MDocType(invoice.getCtx(), order.getC_DocTypeTarget_ID(), invoice.get_TrxName());
            // Marcos Zúñiga : Se consideran también las Warehouse Orders (WP) y las On Credit Orders (WI)
            // @fchiappano Se toman en cuenta, las Ordenes de Devoluciones (Deben Generar Notas de Credito)
            if (invoice.getM_RMA_ID() > 0 || (dt.getDocSubTypeSO() != null
                    && (dt.getDocSubTypeSO().equals(MDocType.DOCSUBTYPESO_POSOrder)
                            || dt.getDocSubTypeSO().equals(MDocType.DOCSUBTYPESO_WarehouseOrder) || (dt
                            .getDocSubTypeSO().equals(MDocType.DOCSUBTYPESO_OnCreditOrder) || dt
                            .getDocSubTypeSO().equals(MDocType.DOCSUBTYPESO_StandardOrder)))))
                invoice.setC_DocTypeTarget_ID(docType.getC_DocType_ID());

            invoice.set_ValueOfColumn("LAR_DocumentLetter_ID", docType.get_ValueAsInt("LAR_DocumentLetter_ID"));
            if (!invoice.save()) {
                return "No se pudo cambiar el tipo de documento";
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
            msg = preparePaymentWithholding((MLARPaymentHeader) po);
            if (msg != null)
                return msg;
        }

        // Después de anular la cabecera, se borran los certificados de retención
        if (po.get_TableName().equals(MLARPaymentHeader.Table_Name) && timing == TIMING_AFTER_VOID)
        {
            msg = ((MLARPaymentHeader) po).BorrarCertificadosdeRetenciondelHeader();
            if (msg != null)
                return msg;
        }

        // Return source payment to drawer
        if ((po.get_TableName().equals(MPayment.Table_Name))
                && (timing == TIMING_AFTER_VOID || timing == TIMING_AFTER_REVERSECORRECT))
        {
            MPayment payment  = (MPayment) po;
            // @fchiappano Solo si se esta anulando un pago incluido en una
            // orden de pago, se vuelve a marcar el source como en cartera.
            if (!payment.isReceipt() && payment.get_ValueAsInt("LAR_PaymentHeader_ID") > 0)
            {
                Integer source = (Integer) payment.get_Value("LAR_PaymentSource_ID");
                msg = setIsOnDrawer(source, "Y", payment.get_TrxName());
                if (msg != null)
                {
                    return msg;
                }
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
         // Después de anular remitos, procesa numeración y ordenes relacionea
         if (po.get_TableName().equals(MInOut.Table_Name) &&
                 (timing == TIMING_AFTER_REVERSECORRECT || timing == TIMING_AFTER_VOID))
         {
             // Cambia el documentNo del remito
             msg = changeVoidDocumentNo(po);
             if (msg != null)
                 return msg;

             /* @fchiappano Se comenta codigo, ya que no es necesario anular la OV cuando se anula un remito,
              * por mas que la misma sea una WarehouseOrder.
             msg = voidWarehouseOrder((MInOut) po);
             if (msg != null)
                 return msg; */

         }
        // @fchiappano Despues de anular un cobro/pago (payment), agregar
        // prefijo y sufijo de anulación en nro de doc.
        if (po.get_TableName().equals(MPayment.Table_Name)
                && (timing == TIMING_AFTER_REVERSECORRECT || timing == TIMING_AFTER_VOID))
        {
            msg = changeVoidDocumentNo(po);
            if (msg != null)
                return msg;
        }
        // @fchiappano Despues de anular una orden agregar
        // prefijo y sufijo de anulación en nro de doc.
        if (po.get_TableName().equals(MOrder.Table_Name)
                && (timing == TIMING_AFTER_REVERSECORRECT || timing == TIMING_AFTER_VOID))
        {
            msg = changeVoidDocumentNo(po);
            if (msg != null)
                return msg;
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

    /**
     * Elimina los "Pagos Retención" y los Certificados de Retención
     * asociados a una cabecera.
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
                ||  header.is_ValueChanged(MLARPaymentHeader.COLUMNNAME_C_DocType_ID)
            )
        {
            BigDecimal curWithholdingAmt = header.getWithholdingAmt();
            // Solo se borran las retenciones si existen retenciones previas
            if (curWithholdingAmt.compareTo(Env.ZERO) != 0)
            {
                header.BorrarCertificadosdeRetenciondelHeader();
                header.BorrarPagosRetenciondelHeader();
                MLARPaymentHeader.updateHeaderWithholding(header.getLAR_PaymentHeader_ID(),
                    header.get_TrxName());
            }
        }
        return null;
    } // clearPaymentWithholdingFromHeader

    /**
     * Elimina las retenciones de la cabecera de pago cuando se modifican
     * los pagos asociados a la misma.
     *
     * @param payment pago asociado a la cabecera
     * @param type evento
     * @return mensaje de error o nulo
     */
    private String clearPaymentWithholdingFromPayments(final MPayment payment, int type)
    {
        // Solo se procesan pagos y con importe mayor a cero
        // Si el importe es 0 no debería borrar las retenciones
        // Si el importe es negativo es un pago reversión
        if (payment.isReceipt() || payment.getPayAmt().compareTo(Env.ZERO) <= 0)
            return null;
        // No se procesan los pagos "retención"
        // (Puede ser cualquier tipo de retención), se mantuvo el nombre
        // de la columna por consistencia, debería llamarse "EsRetenciónEfectuada"
        if (payment.get_ValueAsBoolean("EsRetencionIIBB"))
        {
            if (type == TYPE_BEFORE_DELETE)
            {
                // Recupera y borra el Certificado de Retención asociado al Pago Retención que se está borrando
                final int c_Payment_ID = payment.getC_Payment_ID();
                log.info("Borra el certificado de retenci\u00f3n asociado al pago: " + c_Payment_ID);
                String sql = "DELETE FROM LAR_PaymentWithholding WHERE C_Payment_ID=?";
                PreparedStatement pstmt = null;
                try
                {
                    pstmt = DB.prepareStatement(sql, payment.get_TrxName());
                    pstmt.setInt(1, c_Payment_ID);
                    pstmt.executeUpdate();
                } catch (Exception e)
                {
                    log.log(Level.SEVERE, sql, e);
                    return e.getMessage();
                } finally
                {
                    DB.close(pstmt);
                    pstmt = null;
                }
            }
            return null;
        }

        if (type == TYPE_AFTER_NEW
                || (type == TYPE_AFTER_CHANGE && (payment
                        .is_ValueChanged(MPayment.COLUMNNAME_PayAmt)
                // Unicamente se considera el cambio si el nuevo TT es Cheque de Terceros
                || (payment.is_ValueChanged(MPayment.COLUMNNAME_TenderType) && payment
                        .getTenderType().equals("Z")))) || type == TYPE_BEFORE_DELETE)
        {
            int lar_PaymentHeader_ID = payment.get_ValueAsInt("LAR_PaymentHeader_ID");
            if (lar_PaymentHeader_ID == 0)
                return null;

            final MLARPaymentHeader header = new MLARPaymentHeader(payment.getCtx(),
                    lar_PaymentHeader_ID, payment.get_TrxName());
            BigDecimal curWithholdingAmt = header.getWithholdingAmt();

            // Si existe retención calculada se borran los Certificados y Pagos Retención
            if (curWithholdingAmt.compareTo(Env.ZERO) != 0)
            {
                header.BorrarCertificadosdeRetenciondelHeader();
                header.BorrarPagosRetenciondelHeader();
                MLARPaymentHeader.updateHeaderWithholding(header.getLAR_PaymentHeader_ID(), header.get_TrxName());
            }
        }
        return null;
    } // clearPaymentWithholdingFromPayments

    /**
     * Elimina las retenciones de la cabecera de pago cuando se modifican
     * las facturas (registros en MPaymentAllocate) asociados a la misma.
     *
     * @param payAlloc Registro de PaymentAllocate asociado a la cabecera
     * @param type Evento
     * @return Mensaje de error o nulo
     */
    private String clearPaymentWithholdingFromPaymentAllocate(final MPaymentAllocate payAlloc, int type)
    {
        final int lar_PaymentHeader_ID = payAlloc.get_ValueAsInt("LAR_PaymentHeader_ID");
        
        // No se está trabajando en una cabecera
        if (lar_PaymentHeader_ID < 0)
            return null;

        final MLARPaymentHeader header = new MLARPaymentHeader(payAlloc.getCtx(),
                lar_PaymentHeader_ID, payAlloc.get_TrxName());
        // Solo se procesan cabeceras de pago
        if (header.isReceipt())
            return null;

        // Existe retención calculada
        final BigDecimal curWithholdingAmt = header.getWithholdingAmt();
        if ((curWithholdingAmt.compareTo(Env.ZERO) != 0
                && type == TYPE_AFTER_NEW)
                || type == TYPE_AFTER_DELETE
                // seleccionó otra factura
                || (type == TYPE_AFTER_CHANGE && (payAlloc
                        .is_ValueChanged(MPayment.COLUMNNAME_C_Invoice_ID))))
        {
            // Si existe retención calculada se borran los Certificados y Pagos Retención
            if (curWithholdingAmt.compareTo(Env.ZERO) != 0)
            {
                header.BorrarCertificadosdeRetenciondelHeader();
                header.BorrarPagosRetenciondelHeader();
                MLARPaymentHeader.updateHeaderWithholding(header.getLAR_PaymentHeader_ID(), header.get_TrxName());
            }
        }
        return null;
    } // clearPaymentWithholdingFromPaymentAllocate

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
        if (!header.isReceipt() && header.getWithholdingAmt().equals(Env.ZERO))
        {
            final MDocType dt = new MDocType(header.getCtx(), header.getC_DocType_ID(), header.get_TrxName());
            String genwh = dt.get_ValueAsString("GenerateWithholding");
            if (genwh != null) {

                if (genwh.equals("Y")) {
                    // Recupera la configuraciones
                    final MBPartner bp = new MBPartner(header.getCtx(), header.getC_BPartner_ID(), header.get_TrxName());
                    final WithholdingConfig[] configs = WithholdingConfig.getConfig(bp, dt.isSOTrx(),
                            header.get_TrxName(), null, header.getDateTrx(), null);
                    boolean generar = false;
                    for (final WithholdingConfig wc : configs)
                        if (wc.isCalcFromPayment())
                        {
                            generar = true;
                            break;
                        }
                    // tipo de documento configurado para obligar a la generación de retención
                    if (generar)
                        return "Retenci\u00f3n no generada, por favor genere la retenci\u00f3n antes de completar el documento";
                }

                if (genwh.equals("A")) {
                    // tipo de documento configurado para generar la retención automáticamente
                    // @fchiappano Generar mensaje de error de forma apropiada.
                    String mensaje = header.recalcPaymentWithholding(true);
                    if (mensaje != null && !mensaje.equals(""))
                        return "No se pudo generar la retenci\u00f3n sobre la cabecera de pago. \n" + mensaje;
                }
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
        final Properties ctx = po.getCtx();
        PO revPo = null;
        // MSequence seq = null;
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

            /* @fchiappano Se comenta codigo, ya no que es necesario actualizar la secuencia
             * al anular un documento (mucho menos restarle uno a la secuencia,
             * ya que se puede estar anulando un documento que no sea el ultimo generado).
            int ad_Sequence_ID = invoice.getC_DocType().getDefiniteSequence_ID();
            if (ad_Sequence_ID == 0)
                ad_Sequence_ID = invoice.getC_DocType().getDocNoSequence_ID();

            if (ad_Sequence_ID != 0)
                seq = new MSequence(ctx, ad_Sequence_ID, invoice.get_TrxName()); */

            // Redefine los nros de documento y las descripciones de las facturas
            String revDocumentNo = "Rev-" + invoice.getDocumentNo() + "-" + invoice.getC_Invoice_ID();
            String voidDocumentNo = "Anu-" + invoice.getDocumentNo() + "-" + invoice.getC_Invoice_ID();
            revInvoice.setDocumentNo(revDocumentNo);
            revInvoice.setDescription("(" + voidDocumentNo + "<-)");
            invoice.setDocumentNo(voidDocumentNo);
            invoice.setDescription("(" + revDocumentNo + "<-)");

            // Si la secuencia es automática, retrocede la numeración
            /* if (seq != null && seq.isAutoSequence())
                seq.setCurrentNext(seq.getCurrentNext() - 1); */
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

            /* @fchiappano Se comenta codigo, ya no que es necesario actualizar la secuencia
             * al anular un documento (mucho menos restarle uno a la secuencia,
             * ya que se puede estar anulando un documento que no sea el ultimo generado).
            int AD_Sequence_ID = shipment.getC_DocType().getDefiniteSequence_ID();
            if (AD_Sequence_ID == 0)
                AD_Sequence_ID = shipment.getC_DocType().getDocNoSequence_ID();

            if (AD_Sequence_ID != 0)
                seq = new MSequence(ctx, AD_Sequence_ID, shipment.get_TrxName()); */

            String revDocumentNo = "Rev-" + shipment.getDocumentNo() + "-" + shipment.getM_InOut_ID();
            String voidDocumentNo = "Anu-" + shipment.getDocumentNo() + "-" + shipment.getM_InOut_ID();
            revShipment.setDocumentNo(revDocumentNo);
            revShipment.setDescription("(" + voidDocumentNo + "<-)");
            shipment.setDocumentNo(voidDocumentNo);
            shipment.setDescription("(" + revDocumentNo + "<-)");

            // Si encontró una secuencia, y la misma es automática, retrocede la numeración
            /*if (seq != null && seq.isAutoSequence())
                seq.setCurrentNext(seq.getCurrentNext() - 1);*/
        }
        // @fchiappano Corrije el nro de documento del cobro/pago y su reverso asociado.
        if (po.get_TableName().equals(MPayment.Table_Name))
        {
            final MPayment payment = (MPayment) po;
            // Si no se tiene la referencia a la reversión, no se procesa
            if (payment.getReversal_ID() == 0)
                return null;

            revPo = new MPayment(ctx, payment.getReversal_ID(), payment.get_TrxName());
            final MPayment revPayment = (MPayment) revPo;
            log.info("Change DocumentNo of " + revPayment);

            // Intenta recuperar la secuencia "definitiva". Si no tiene, intenta
            // recupera la secuencia "normal". Si no tiene, no sea hace nada
            // debido
            // a que le documento NO tiene secuencia configurada

            /* @fchiappano Se comenta codigo, ya no que es necesario actualizar la secuencia
             * al anular un documento (mucho menos restarle uno a la secuencia,
             * ya que se puede estar anulando un documento que no sea el ultimo generado).
            int ad_Sequence_ID = payment.getC_DocType().getDefiniteSequence_ID();
            if (ad_Sequence_ID == 0)
                ad_Sequence_ID = payment.getC_DocType().getDocNoSequence_ID();

            if (ad_Sequence_ID != 0)
                seq = new MSequence(ctx, ad_Sequence_ID, payment.get_TrxName());*/

            // @fchiappano recuperar solo el nro de documento del cobro/pago.
            String documentno = payment.getDocumentNo().replaceAll("[^\\d.]", "");

            // Redefine los nros de documento y las descripciones
            String revDocumentNo = "Rev-" + documentno + "-" + payment.getC_Payment_ID();
            String voidDocumentNo = "Anu-" + documentno + "-" + payment.getC_Payment_ID();
            revPayment.setDocumentNo(revDocumentNo);
            revPayment.setDescription("(" + voidDocumentNo + "<-)");
            payment.setDocumentNo(voidDocumentNo);
            payment.setDescription("(" + revDocumentNo + "<-)");

            // Si la secuencia es automática, retrocede la numeración
            /*if (seq != null && seq.isAutoSequence())
                seq.setCurrentNext(seq.getCurrentNext() - 1);*/
        }
        // @fchiappano Corrije el nro de documento de la orden (no tiene reverso).
        if (po.get_TableName().equals(MOrder.Table_Name))
        {
            final MOrder order = (MOrder) po;

            // Intenta recuperar la secuencia "definitiva". Si no tiene, intenta
            // recupera la secuencia "normal". Si no tiene, no sea hace nada
            // debido
            // a que le documento NO tiene secuencia configurada

            /* @fchiappano Se comenta codigo, ya no que es necesario actualizar la secuencia
             * al anular un documento (mucho menos restarle uno a la secuencia,
             * ya que se puede estar anulando un documento que no sea el ultimo generado).
            int ad_Sequence_ID = order.getC_DocType().getDefiniteSequence_ID();
            if (ad_Sequence_ID == 0)
                ad_Sequence_ID = order.getC_DocType().getDocNoSequence_ID();

            if (ad_Sequence_ID != 0)
                seq = new MSequence(ctx, ad_Sequence_ID, order.get_TrxName());*/

            // @fchiappano recuperar solo el nro de documento del cobro/pago.
            String documentno = order.getDocumentNo().replaceAll("[^\\d.]", "");

            // Redefine los nros de documento y las descripciones
            String voidDocumentNo = "Anu-" + documentno + "-" + order.getC_Order_ID();
            order.setDocumentNo(voidDocumentNo);

            // Si la secuencia es automática, retrocede la numeración
            /*if (seq != null && seq.isAutoSequence())
                seq.setCurrentNext(seq.getCurrentNext() - 1);*/
        }
        // Guarda los cambios realizados sobre los nros de documento
        // y las reversiones de las secuencias.
        // (siempre y cuando hayan cambiado y no sean nulos)
        if (revPo != null && !revPo.save())
            return "Error al guardar el documento inverso";

        if (po.is_Changed() && !po.save())
            return "Error al guardar el documento anulado";

        /*if (seq != null && seq.is_Changed() && !seq.save())
            return "Error al guardar la secuencia";*/

        return null;
    }

    /**
     * Anula la orden de remito relacionada con el remito dado
     * (siempre y cuando el mismo tenga una orden de este tipo como origen)
     *
     * @param shipment remito a procesar
     * @return mensaje de error o null
     */
    private String voidWarehouseOrder(final MInOut shipment)
    {
        final String trx = shipment.get_TrxName();
        final MOrder order = new MOrder(Env.getCtx(), shipment.getC_Order_ID(), trx);
        final MDocType dt = new MDocType(Env.getCtx(), order.getC_DocType_ID(), trx);

        // @fchiappano si el remito proviene de una orden de garantia, no anular la orden de remito, ya que el remito esta totalmente disociado de la venta.
        if (shipment.get_ValueAsInt("LAR_OrdenGarantia_ID") > 0)
            return null;

        // Controla si el tipo de la orden es "Orden de Remito"
        // ("Orden de Remito" <=> "Warehouse Order")
        if (dt.getDocSubTypeSO() != null) // Se chequea que la irden tenga seteado un SubTipo de Doc OV
            if (dt.getDocSubTypeSO().equals(MDocType.DOCSUBTYPESO_WarehouseOrder))
            {
                if (order.processIt(MOrder.ACTION_Void))
                    order.saveEx(trx);
                else
                    return "Falló la anulaci\u00f3n de la Orden de Remito";
            }

        return null;
    } // voidWarehouseOrder

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