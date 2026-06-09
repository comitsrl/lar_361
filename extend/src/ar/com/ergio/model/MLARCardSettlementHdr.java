/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 *****************************************************************************/
package ar.com.ergio.model;

import java.io.File;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.List;
import java.util.Properties;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.model.MPeriod;
import org.compiere.model.Query;
import org.compiere.model.X_C_DocType;
import org.compiere.process.DocAction;
import org.compiere.process.DocOptions;
import org.compiere.process.DocumentEngine;
import org.compiere.util.Env;

public class MLARCardSettlementHdr extends X_LAR_CardSettlement_Hdr implements DocAction, DocOptions {

    private static final long serialVersionUID = 20260608L;
    private static final String DOCSEQ_HEADER = "LAR_CardSettlement_Hdr_Doc";

    private String m_processMsg;
    private boolean m_justPrepared;
    private boolean m_recalculatingTotal;

    public MLARCardSettlementHdr(Properties ctx, int LAR_CardSettlement_Hdr_ID, String trxName) {
        super(ctx, LAR_CardSettlement_Hdr_ID, trxName);
    }

    public MLARCardSettlementHdr(Properties ctx, ResultSet rs, String trxName) {
        super(ctx, rs, trxName);
    }

    @Override
    protected boolean beforeSave(boolean newRecord) {
        if (newRecord) {
            if (getDocumentNo() == null || getDocumentNo().trim().length() == 0)
                setDocumentNo(org.compiere.model.MSequence.getDocumentNo(getAD_Client_ID(), DOCSEQ_HEADER, get_TrxName(), this));
            if (getDocStatus() == null)
                setDocStatus(MLARCardSettlement.DOCSTATUS_Drafted);
            if (getDocAction() == null)
                setDocAction(MLARCardSettlement.DOCACTION_Complete);
            setProcessed(false);
            setProcessing(false);
            setTotalAmt(Env.ZERO);
        }

        if (getDateDoc() == null)
            setDateDoc(new Timestamp(System.currentTimeMillis()));
        if (getDateAcct() == null)
            setDateAcct(getDateDoc());

        if (!newRecord && isProcessed()) {
            if (is_ValueChanged(COLUMNNAME_AD_Org_ID) || is_ValueChanged(COLUMNNAME_DateDoc)
                    || is_ValueChanged(COLUMNNAME_DateAcct) || is_ValueChanged(COLUMNNAME_C_BPartner_ID)
                    || is_ValueChanged(COLUMNNAME_OperationType) || is_ValueChanged(COLUMNNAME_Description))
                throw new AdempiereException("@Processed@");
        }

        return true;
    }

    @Override
    protected boolean afterSave(boolean newRecord, boolean success) {
        if (!success)
            return false;

        if (!m_recalculatingTotal && !isProcessed() && (newRecord || is_ValueChanged(COLUMNNAME_AD_Org_ID) || is_ValueChanged(COLUMNNAME_DateDoc)
                || is_ValueChanged(COLUMNNAME_DateAcct) || is_ValueChanged(COLUMNNAME_C_BPartner_ID)
                || is_ValueChanged(COLUMNNAME_OperationType))) {
            syncLinesFromHeader();
        }
        if (!m_recalculatingTotal)
            recalculateTotalFromLines();
        return true;
    }

    public List<MLARCardSettlement> getLines() {
        return new Query(getCtx(), I_LAR_CardSettlement.Table_Name,
                I_LAR_CardSettlement.COLUMNNAME_LAR_CardSettlement_Hdr_ID + "=?", get_TrxName())
                        .setParameters(getLAR_CardSettlement_Hdr_ID())
                        .setOrderBy(I_LAR_CardSettlement.COLUMNNAME_Line)
                        .list();
    }

    public void recalculateTotalFromLines() {
        BigDecimal total = Env.ZERO;
        for (MLARCardSettlement line : getLines()) {
            String status = line.getDocStatus();
            if (MLARCardSettlement.DOCSTATUS_Voided.equals(status) || MLARCardSettlement.DOCSTATUS_Reversed.equals(status))
                continue;
            total = total.add(line.getAmount());
        }
        if (total.compareTo(getTotalAmt()) == 0)
            return;
        m_recalculatingTotal = true;
        try {
            setTotalAmt(total);
            saveEx();
        } finally {
            m_recalculatingTotal = false;
        }
    }

    private void syncLinesFromHeader() {
        for (MLARCardSettlement line : getLines()) {
            if (line.isProcessed())
                continue;
            line.setAD_Org_ID(getAD_Org_ID());
            line.setDateDoc(getDateDoc());
            line.setDateAcct(getDateAcct());
            line.setC_BPartner_ID(getC_BPartner_ID());
            line.setOperationType(getOperationType());
            line.saveEx();
        }
    }

    @Override
    public boolean processIt(String action) throws Exception {
        m_processMsg = null;
        DocumentEngine engine = new DocumentEngine(this, getDocStatus());
        return engine.processIt(action, getDocAction());
    }

    @Override
    public boolean unlockIt() {
        setProcessing(false);
        return true;
    }

    @Override
    public boolean invalidateIt() {
        setDocAction(DocAction.ACTION_Prepare);
        return true;
    }

    @Override
    public String prepareIt() {
        m_processMsg = null;
        m_justPrepared = true;

        if (getC_BPartner_ID() <= 0) {
            m_processMsg = "@C_BPartner_ID@ @NotFound@";
            return DocAction.STATUS_Invalid;
        }
        if (getDateAcct() == null || !MPeriod.isOpen(getCtx(), getDateAcct(), X_C_DocType.DOCBASETYPE_APPayment, getAD_Org_ID())) {
            m_processMsg = "@PeriodClosed@";
            return DocAction.STATUS_Invalid;
        }

        List<MLARCardSettlement> lines = getLines();
        if (lines.isEmpty()) {
            m_processMsg = "@NoLines@";
            return DocAction.STATUS_Invalid;
        }

        BigDecimal total = Env.ZERO;
        for (MLARCardSettlement line : lines) {
            if (!getOperationType().equals(line.getOperationType())) {
                m_processMsg = "@OperationType@ @Invalid@";
                return DocAction.STATUS_Invalid;
            }
            total = total.add(line.getAmount());
        }
        setTotalAmt(total);

        if (!DocAction.ACTION_Complete.equals(getDocAction()))
            setDocAction(DocAction.ACTION_Complete);
        return DocAction.STATUS_InProgress;
    }

    @Override
    public boolean approveIt() {
        return true;
    }

    @Override
    public boolean rejectIt() {
        return true;
    }

    @Override
    public String completeIt() {
        if (!m_justPrepared) {
            String status = prepareIt();
            if (!DocAction.STATUS_InProgress.equals(status))
                return status;
        }

        for (MLARCardSettlement line : getLines()) {
            if (line.isProcessed())
                continue;
            if (!line.completeFromHeader())
                throw new AdempiereException(line.getProcessMsg());
            line.saveEx();
        }

        recalculateTotalFromLines();
        setProcessed(true);
        setProcessing(false);
        setDocAction(DocAction.ACTION_Void);
        setProcessMsg("@OK@");
        saveEx();
        return DocAction.STATUS_Completed;
    }

    @Override
    public boolean voidIt() {
        List<MLARCardSettlement> lines = getLines();

        for (MLARCardSettlement line : lines) {
            String status = line.getDocStatus();
            if (MLARCardSettlement.DOCSTATUS_Voided.equals(status) || MLARCardSettlement.DOCSTATUS_Reversed.equals(status))
                continue;
            String processMsg = line.validateVoidProcessMsg();
            if (processMsg != null)
                throw new AdempiereException("Línea " + line.getLine() + ": " + processMsg);
        }

        for (MLARCardSettlement line : lines) {
            String status = line.getDocStatus();
            if (MLARCardSettlement.DOCSTATUS_Voided.equals(status) || MLARCardSettlement.DOCSTATUS_Reversed.equals(status))
                continue;
            if (!line.voidIt())
                throw new AdempiereException(line.getProcessMsg());
            line.saveEx();
        }

        recalculateTotalFromLines();
        setProcessed(true);
        setProcessing(false);
        setDocStatus(DocAction.STATUS_Voided);
        setDocAction(DocAction.ACTION_None);
        setProcessMsg("@Reversed@");
        saveEx();
        return true;
    }

    @Override
    public boolean closeIt() {
        setDocAction(DocAction.ACTION_None);
        return true;
    }

    @Override
    public boolean reverseCorrectIt() {
        return voidIt();
    }

    @Override
    public boolean reverseAccrualIt() {
        return false;
    }

    @Override
    public boolean reActivateIt() {
        return false;
    }

    @Override
    public String getSummary() {
        return getDocumentNo() + " - " + getTotalAmt();
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
        return getTotalAmt();
    }

    @Override
    public String getDocumentInfo() {
        return getSummary();
    }

    @Override
    public File createPDF() {
        return null;
    }

    @Override
    public int getC_Currency_ID() {
        for (MLARCardSettlement line : getLines()) {
            int currencyId = line.getC_Currency_ID();
            if (currencyId > 0)
                return currencyId;
        }
        return 0;
    }

    @Override
    public int customizeValidActions(String docStatus, Object processing, String orderType, String isSOTrx,
            int AD_Table_ID, String[] docAction, String[] options, int index) {
        if (AD_Table_ID == Table_ID) {
            if (DocumentEngine.STATUS_Drafted.equals(docStatus) || DocumentEngine.STATUS_InProgress.equals(docStatus))
                options[index++] = DocumentEngine.ACTION_Complete;
            if (DocumentEngine.STATUS_Completed.equals(docStatus))
                options[index++] = DocumentEngine.ACTION_Void;
        }
        return index;
    }
}
