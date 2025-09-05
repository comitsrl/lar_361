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

package ar.com.ergio.model;

import java.io.File;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.model.MDocType;
import org.compiere.model.MPayment;
import org.compiere.model.Query;
import org.compiere.process.DocAction;
import org.compiere.process.DocOptions;
import org.compiere.process.DocumentEngine;
import org.compiere.util.CLogger;
import org.compiere.util.DB;

public class MLARLoteSueldos extends X_LAR_LoteSueldos implements DocAction, DocOptions {

    private static final long serialVersionUID = 1L;
    public static final int ARS_CURRENCY_ID = 118; // Constante para ARS
    private String m_processMsg;
    private boolean m_justPrepared = false;
    private boolean isApproved = false;
    private static final CLogger log = CLogger.getCLogger(MLARLoteSueldos.class);

    // --- Constructores requeridos por X_LAR_LoteSueldos ---
    public MLARLoteSueldos(Properties ctx, int LAR_LoteSueldos_ID, String trxName) {
        super(ctx, LAR_LoteSueldos_ID, trxName);
    }

    public MLARLoteSueldos(Properties ctx, ResultSet rs, String trxName) {
        super(ctx, rs, trxName);
    }

    // --- Manejo de estados de documento ---
    @Override
    public boolean processIt(String action) throws Exception {
        m_processMsg = null;
        DocumentEngine engine = new DocumentEngine(this, getDocStatus());
        return engine.processIt(action, getDocAction());
    }

    @Override
    public boolean invalidateIt() {
        log.info("invalidateIt - " + toString());
        setDocAction(DocAction.ACTION_Prepare);
        return true;
    }

    @Override
    public String prepareIt() {
        log.info("prepareIt - " + toString());
        m_processMsg = null;
        m_justPrepared = true;
        // Validaciones de negocio previas a completar
        if (((BigDecimal) getLoteImporte()).signum() <= 0) {
            m_processMsg = "El lote no tiene importe válido";
            return DocAction.STATUS_Invalid;
        }
        // Validar periodo abierto si aplica
        // MPeriod.testPeriodOpen(getCtx(), getDateTrx(), getC_DocType_ID(), getAD_Org_ID());
        if (!DocAction.ACTION_Complete.equals(getDocAction()))
            setDocAction(DocAction.ACTION_Complete);
        return DocAction.STATUS_InProgress;
    }

    @Override
    public boolean approveIt() {
        log.info("approveIt - " + toString());
        setIsApproved(true);
        return true;
    }

    @Override
    public boolean rejectIt() {
        log.info("rejectIt - " + toString());
        setIsApproved(false);
        return true;
    }

    private void setIsApproved(boolean b) {
        this.isApproved = b;
    }

    @Override
    public String completeIt() {
        log.info("completeIt - " + toString());
        // Before Complete validation
        m_processMsg = org.compiere.model.ModelValidationEngine.get().fireDocValidate(this, org.compiere.model.ModelValidator.TIMING_BEFORE_COMPLETE);
        if (m_processMsg != null)
            return DocAction.STATUS_Invalid;
        if (!m_justPrepared) {
            String status = prepareIt();
            if (!DocAction.STATUS_InProgress.equals(status)) {
                return status;
            }
        }
        m_processMsg = null;
        // Implicit approval
        if (!isApproved) {
            approveIt();
        }
        try {
            for (MLARLoteSueldosLine line : getLines()) {
                // Procesar Importe Principal
                if (line.getImportePpal() != null && line.getImportePpal().signum() > 0)
                {
                    int orgID = getAD_Org_ID();
                    int docTypeID = getDocTypeRRHH(false); // Tipo de documento RRHH de la organización principal
                    if (docTypeID == 0) {
                        throw new Exception("No se encontró Tipo de Documento RRHH para la organización ID: " + orgID);
                    }
                    int caja = getC_BankAccount_ID();
                    MLARPaymentHeader headerPpal = new MLARPaymentHeader(getCtx(), 0, get_TrxName());
                    headerPpal.setAD_Org_ID(orgID);
                    headerPpal.setC_DocType_ID(docTypeID);
                    headerPpal.setC_BPartner_ID(line.getC_BPartner_ID());
                    headerPpal.setDateTrx(getDateTrx());
                    headerPpal.setDocStatus(DOCSTATUS_Drafted);
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    String fechaFormateada = sdf.format(this.getDateTrx());
                    headerPpal.set_ValueOfColumn("Description", "Lote " + fechaFormateada + " - Pago Principal");
                    headerPpal.setIsReceipt(false);
                    headerPpal.setC_BankAccount_ID(caja);
                    headerPpal.set_ValueOfColumn("LAR_ConceptoCaja_ID", getLAR_ConceptoCaja_ID());
                    headerPpal.saveEx();
                    MPayment paymentPpal = new MPayment(getCtx(), 0, get_TrxName());
                    paymentPpal.setAD_Org_ID(orgID);
                    paymentPpal.setC_DocType_ID(docTypeID);
                    paymentPpal.setC_BPartner_ID(line.getC_BPartner_ID());
                    paymentPpal.setC_BankAccount_ID(line.getC_BankAccount_ID());
                    paymentPpal.setTenderType(line.getTenderType());
                    if (line.getLAR_Deposito_Directo_ID() > 0)
                        paymentPpal.set_ValueOfColumn("LAR_Deposito_Directo_ID", line.getLAR_Deposito_Directo_ID());
                    paymentPpal.setPayAmt(line.getImportePpal());
                    paymentPpal.setDateTrx(getDateTrx());
                    paymentPpal.setDateAcct(getDateTrx());
                    paymentPpal.setC_Currency_ID(ARS_CURRENCY_ID); // Usar ARS
                    paymentPpal.set_ValueOfColumn("LAR_PaymentHeader_ID", headerPpal.getLAR_PaymentHeader_ID());
                    int c_Charge_ID = 0;
                    if (getLAR_ConceptoCaja_ID() > 0) {
                        c_Charge_ID = DB.getSQLValueEx(get_TrxName(),
                            "SELECT C_Charge_ID FROM LAR_ConceptoCaja WHERE LAR_ConceptoCaja_ID=?",
                            getLAR_ConceptoCaja_ID());
                        if (c_Charge_ID > 0)
                            paymentPpal.setC_Charge_ID(c_Charge_ID);
                    }
                    paymentPpal.setIsReceipt(false);
                    paymentPpal.saveEx();
                    line.setLAR_PaymentHeader_ID(headerPpal.get_ID());
                    line.saveEx();
                    // Completar el header si el estado de pagos es Completed
                    if (getDocStatusPagos().equals(DOCSTATUS_Completed))
                    {
                        headerPpal.completeIt();
                        headerPpal.saveEx();
                    }
                }
                // Procesar Importe Miles
                if (line.getImporteMiles() != null && line.getImporteMiles().signum() > 0) 
                {
                    int orgID = getAD_Org_ID();
                    int docTypeID = getDocTypeRRHH(true); // Tipo de documento RRHH de la organización Miles
                    MLARPaymentHeader headerMiles = new MLARPaymentHeader(getCtx(), 0, get_TrxName());
                    headerMiles.setAD_Org_ID(orgID);
                    headerMiles.setC_DocType_ID(docTypeID);
                    headerMiles.setC_BPartner_ID(line.getC_BPartner_ID());
                    headerMiles.setDateTrx(getDateTrx());
                    headerMiles.setDocStatus(DOCSTATUS_Drafted);
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    String fechaFormateada = sdf.format(this.getDateTrx());
                    headerMiles.set_ValueOfColumn("Description", "Lote " + fechaFormateada + " - Pago Miles");
                    headerMiles.setIsReceipt(false);
                    headerMiles.setC_BankAccount_ID(line.getC_BankAccount_ID());
                    headerMiles.saveEx();
                    // Completar el header Miles si el estado de pagos es Completed
                    if (getDocStatusPagos().equals(DOCSTATUS_Completed)) {
                        headerMiles.completeIt();
                        headerMiles.saveEx();
                    }
                    MPayment paymentMiles = new MPayment(getCtx(), 0, get_TrxName());
                    paymentMiles.setAD_Org_ID(orgID);
                    paymentMiles.setC_DocType_ID(docTypeID);
                    paymentMiles.setC_BPartner_ID(line.getC_BPartner_ID());
                    paymentMiles.setC_BankAccount_ID(line.getC_BankAccount_ID());
                    paymentMiles.setTenderType(line.getTenderTypeMiles());
                    if (line.getLAR_Deposito_Directo_ID() > 0)
                        paymentMiles.set_ValueOfColumn("LAR_Deposito_Directo_ID", line.getLAR_Deposito_Directo_ID());
                    paymentMiles.setPayAmt(line.getImporteMiles());
                    paymentMiles.setDateTrx(getDateTrx());
                    paymentMiles.setDateAcct(getDateTrx());
                    paymentMiles.setC_Currency_ID(ARS_CURRENCY_ID); // Usar ARS
                    paymentMiles.set_ValueOfColumn("LAR_PaymentHeader_ID", headerMiles.getLAR_PaymentHeader_ID());
                    int c_Charge_ID = 0;
                    if (getLAR_ConceptoCaja_ID() > 0) {
                        c_Charge_ID = DB.getSQLValueEx(get_TrxName(),
                            "SELECT C_Charge_ID FROM LAR_ConceptoCaja WHERE LAR_ConceptoCaja_ID=?",
                            getLAR_ConceptoCaja_ID());
                        if (c_Charge_ID > 0)
                            paymentMiles.setC_Charge_ID(c_Charge_ID);
                    }
                    paymentMiles.setIsReceipt(false);
                    paymentMiles.saveEx();
                    line.setLar_PaymentHeaderMiles_ID(headerMiles.get_ID());
                    line.saveEx();
                    // Completar el header si el estado de pagos es Completed
                    if (getDocStatusPagos().equals(DOCSTATUS_Completed))
                    {
                        headerMiles.completeIt();
                        headerMiles.saveEx();
                    }
                }
                // Marcar línea como procesada
                line.set_ValueOfColumn("Processed", true);
                line.saveEx();
            }
        } catch (Exception e) {
            log.log(Level.SEVERE, "Error generando pagos", e);
            m_processMsg = e.getMessage();
            return DocAction.STATUS_Invalid;
        }
        // After Complete validation
        m_processMsg = org.compiere.model.ModelValidationEngine.get().fireDocValidate(this, org.compiere.model.ModelValidator.TIMING_AFTER_COMPLETE);
        if (m_processMsg != null)
            return DocAction.STATUS_Invalid;
        setProcessed(true);
        setDocAction(DocAction.ACTION_Void);
        return DocAction.STATUS_Completed;
    }

    @Override
    public boolean voidIt() {
        log.info("voidIt - " + toString());
        // Before Void validation
        m_processMsg = org.compiere.model.ModelValidationEngine.get().fireDocValidate(this, org.compiere.model.ModelValidator.TIMING_BEFORE_VOID);
        if (m_processMsg != null)
            return false;
        if (DocAction.STATUS_Closed.equals(getDocStatus()) ||
            DocAction.STATUS_Reversed.equals(getDocStatus()) ||
            DocAction.STATUS_Voided.equals(getDocStatus())) {
            m_processMsg = "Documento ya cerrado o anulado";
            setDocAction(DocAction.ACTION_None);
            return false;
        }
        boolean error = false;
        StringBuilder anulacionMsg = new StringBuilder();
        for (MLARLoteSueldosLine line : getLines()) {
            if (line.getLAR_PaymentHeader_ID() > 0) {
                MLARPaymentHeader header = new MLARPaymentHeader(getCtx(), line.getLAR_PaymentHeader_ID(), get_TrxName());
                if (header.get_ID() > 0 && header instanceof DocAction) {
                    boolean ok = ((DocAction) header).voidIt();
                    if (!ok) {
                        error = true;
                        anulacionMsg.append("Error anulando Pago Principal ID: ").append(header.getDocumentNo()).append(". ");
                    }
                }
            }
            if (line.getLar_PaymentHeaderMiles_ID() > 0) {
                MLARPaymentHeader headerMiles = new MLARPaymentHeader(getCtx(), line.getLar_PaymentHeaderMiles_ID(), get_TrxName());
                if (headerMiles.get_ID() > 0 && headerMiles instanceof DocAction) {
                    boolean ok = ((DocAction) headerMiles).voidIt();
                    if (!ok) {
                        error = true;
                        anulacionMsg.append("Error anulando Pago Miles ID: ").append(headerMiles.getDocumentNo()).append(". ");
                    }
                }
            }
        }
        addDescription("Anulado");
        setIsPaid(true);
        setProcessed(true);
        setDocStatus(DocAction.STATUS_Voided);
        setDocAction(DocAction.ACTION_None);
        // After Void validation
        m_processMsg = org.compiere.model.ModelValidationEngine.get().fireDocValidate(this, org.compiere.model.ModelValidator.TIMING_AFTER_VOID);
        if (m_processMsg != null)
            return false;
        if (error) {
            m_processMsg = anulacionMsg.toString();
            return false;
        }
        return true;
    }

    @Override
    public boolean closeIt() {
        log.info("closeIt - " + toString());
        setProcessed(true);
        setDocStatus(DocAction.STATUS_Closed);
        setDocAction(DocAction.ACTION_None);
        return true;
    }

    @Override
    public boolean reverseCorrectIt() {
        log.info("reverseCorrectIt - " + toString());
        // Lógica de reversa contable si aplica
        m_processMsg = "No implementado";
        return false;
    }

    @Override
    public boolean reverseAccrualIt() {
        log.info("reverseAccrualIt - " + toString());
        m_processMsg = "No implementado";
        return false;
    }

    @Override
    public boolean reActivateIt() {
        log.info("reActivateIt - " + toString());
        setProcessed(false);
        setDocAction(DocAction.ACTION_Complete);
        setDocStatus(DocAction.STATUS_InProgress);
        return true;
    }

    @Override
    public String getSummary() {
        StringBuilder sb = new StringBuilder();
        sb.append(getDocumentNo());
        MDocType dt = MDocType.get(getCtx(), getC_DocType_ID());
        sb.append(": ").append(dt.getName());
        sb.append(" - ").append(getLoteImporte());
        if (getDescription() != null && getDescription().length() > 0)
            sb.append(" - ").append(getDescription());
        return sb.toString();
    }

    @Override
    public String getProcessMsg() {
        return m_processMsg;
    }

    @Override
    public int getDoc_User_ID() {
        return getUpdatedBy();
    }

    @Override
    public BigDecimal getApprovalAmt() {
        return (BigDecimal) getLoteImporte();
    }

    // --- Métodos auxiliares y de información ---
    public void addDescription(String description) {
        String desc = getDescription();
        if (desc == null)
            setDescription(description);
        else
            setDescription(desc + " | " + description);
    }

    public boolean isPaid() {
        // Implementar lógica real si aplica
        return true;
    }

    public void setIsPaid(boolean paid) {
        // Implementar lógica real si aplica
    }

    /** Devuelve las líneas del lote */
    public MLARLoteSueldosLine[] getLines() {
        // Use Query to fetch related lines
        String whereClause = "LAR_LoteSueldos_ID=?";
        return new org.compiere.model.Query(getCtx(), "LAR_LoteSueldosLine", whereClause, get_TrxName())
                .setParameters(getLAR_LoteSueldos_ID())
                .list().toArray(new MLARLoteSueldosLine[0]);
    }

    @Override
    public String getDocumentInfo() {
        return getSummary();
    }

    @Override
    public File createPDF() {
        // Placeholder: should implement PDF generation logic
        return null;
    }

    public boolean unlockIt()
    {
        log.info("unlockIt - " + toString());
        setProcessing(false);
        return true;
    }   //  unlockIt

    @Override
    public int getC_Currency_ID()
    {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int customizeValidActions(String docStatus, Object processing, String orderType, String isSOTrx, int AD_Table_ID,
            String[] docAction, String[] options, int index)
    {
        // Este método permite agregar las acciones necesarias para
        // operar con el documento "cabecera"
        if (AD_Table_ID == Table_ID)
        {
            //  Complete
            if (docStatus.equals(DocumentEngine.STATUS_Completed))
                options[index++] = DocumentEngine.ACTION_Void;
        }
        return index;
    }

    @Override
    public String toString()
    {
        StringBuffer sb = new StringBuffer ("MLARLoteSueldos[");
        sb.append(get_ID()).append("-").append(getDocumentNo())
            .append(",DocStatus=").append(getDocStatus())
            .append ("]");
        return sb.toString ();
    }

    /**
     * Recupera el tipo de documento RRHH según la organización del lote
     * 
     * @param esMiles
     *            Si es true, busca el tipo de documento para la organización
     *            Miles (parent_org_id), si es false para la principal.
     * @return C_DocType_ID encontrado, o 0 si no existe.
     */
    public int getDocTypeRRHH(boolean esMiles) {
        int orgID = getAD_Org_ID();
        if (esMiles) {
            // Buscar la organización Miles relacionada (parent_org_id en ad_orginfo)
            String sqlPrincOrg = "SELECT AD_Org_ID FROM AD_OrgInfo WHERE AD_OrgPrincipal_ID=?";
            int milesOrgID = DB.getSQLValueEx(get_TrxName(), sqlPrincOrg, orgID);
            if (milesOrgID > 0) {
                orgID = milesOrgID;
            } else {
                // No se encontró organización Miles, retornar 0
                return 0;
            }
        }
        // Buscar el tipo de documento con EsDocumentoRRHH='Y' y la organización correspondiente
        String whereClause = "AD_Org_ID=? AND esdocumentorrhh='Y' AND IsActive='Y'";
        Query query = new Query(getCtx(), "C_DocType", whereClause, get_TrxName())
            .setParameters(orgID)
            .setOrderBy("C_DocType_ID");
        MDocType docType = query.first();
        return docType != null ? docType.get_ID() : 0;
    }
}
