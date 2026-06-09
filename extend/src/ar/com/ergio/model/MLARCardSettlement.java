/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2007 ComPiere, Inc. All Rights Reserved.                *
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
package ar.com.ergio.model;

import java.io.File;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Properties;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.model.MAllocationHdr;
import org.compiere.model.MAllocationLine;
import org.compiere.model.MBankAccount;
import org.compiere.model.MPayment;
import org.compiere.model.MPeriod;
import org.compiere.model.Query;
import org.compiere.model.X_C_DocType;
import org.compiere.process.DocAction;
import org.compiere.process.DocOptions;
import org.compiere.process.DocumentEngine;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.compiere.util.Msg;

public class MLARCardSettlement extends X_LAR_CardSettlement implements DocAction, DocOptions {

    private static final long serialVersionUID = 20260530L;
    private static final String DOCSEQ_CHECK = "LAR_CardSettlement_Check";
    private static final String DOCSEQ_TRANSFER = "LAR_CardSettlement_Transfer";

    private String m_processMsg;
    private boolean m_justPrepared;
    private boolean m_processFromHeader;

    public MLARCardSettlement(Properties ctx, int LAR_CardSettlement_ID, String trxName) {
        super(ctx, LAR_CardSettlement_ID, trxName);
    }

    public MLARCardSettlement(Properties ctx, ResultSet rs, String trxName) {
        super(ctx, rs, trxName);
    }

    @Override
    protected boolean beforeSave(boolean newRecord) {
        MLARCardSettlementHdr header = getHeader();

        if (newRecord) {
            if (getDocumentNo() == null || getDocumentNo().trim().length() == 0)
                setDocumentNo(nextDocumentNo());
            if (getDocStatus() == null)
                setDocStatus(DOCSTATUS_Drafted);
            if (getDocAction() == null)
                setDocAction(DOCACTION_Complete);
            setProcessed(false);
            setProcessing(false);
        }

        if (header != null) {
            if (header.isProcessed()) {
                if (newRecord)
                    throw new AdempiereException("@Processed@");
                if (!isDocumentTransitionOnly())
                    throw new AdempiereException("@Processed@");
            }

            setAD_Org_ID(header.getAD_Org_ID());
            setDateDoc(header.getDateDoc());
            setDateAcct(header.getDateAcct());
            setC_BPartner_ID(header.getC_BPartner_ID());
            setOperationType(header.getOperationType());

            if (newRecord && getLine() <= 0)
                setLine(getNextLineNo());
        }

        if (getDateDoc() == null)
            setDateDoc(new Timestamp(System.currentTimeMillis()));
        if (getDateAcct() == null)
            setDateAcct(getDateDoc());

        return true;
    }

    @Override
    protected boolean afterSave(boolean newRecord, boolean success) {
        if (success)
            recalculateHeaderTotal();
        return success;
    }

    @Override
    protected boolean afterDelete(boolean success) {
        if (success)
            recalculateHeaderTotal();
        return success;
    }

    private String nextDocumentNo() {
        String sequenceName = OPERATIONTYPE_Transfer.equals(getOperationType()) ? DOCSEQ_TRANSFER : DOCSEQ_CHECK;
        return org.compiere.model.MSequence.getDocumentNo(getAD_Client_ID(), sequenceName, get_TrxName(), this);
    }

    public boolean completeFromHeader() {
        boolean oldValue = m_processFromHeader;
        m_processFromHeader = true;
        try {
            return processIt(DocAction.ACTION_Complete);
        } catch (Exception e) {
            throw new AdempiereException(e);
        } finally {
            m_processFromHeader = oldValue;
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

        if (getAmount().signum() <= 0) {
            m_processMsg = "@Amount@ @Invalid@";
            return DocAction.STATUS_Invalid;
        }
        if (getLAR_CardSettlement_Hdr_ID() > 0 && !m_processFromHeader) {
            m_processMsg = "@DocAction@ @Invalid@";
            return DocAction.STATUS_Invalid;
        }
        if (getC_BPartner_ID() <= 0) {
            m_processMsg = "@C_BPartner_ID@ @NotFound@";
            return DocAction.STATUS_Invalid;
        }
        if (getDateAcct() == null || !MPeriod.isOpen(getCtx(), getDateAcct(), X_C_DocType.DOCBASETYPE_APPayment, getAD_Org_ID())) {
            m_processMsg = "@PeriodClosed@";
            return DocAction.STATUS_Invalid;
        }

        if (OPERATIONTYPE_Check.equals(getOperationType())) {
            if (getCompensation_C_BankAccount_ID() <= 0) {
                m_processMsg = "@Compensation_C_BankAccount_ID@ @Mandatory@";
                return DocAction.STATUS_Invalid;
            }
            if (getDrawer_C_BankAccount_ID() <= 0) {
                m_processMsg = "@Drawer_C_BankAccount_ID@ @Mandatory@";
                return DocAction.STATUS_Invalid;
            }
            if (getFecha_Venc_Cheque() == null) {
                m_processMsg = "@Fecha_Venc_Cheque@ @Mandatory@";
                return DocAction.STATUS_Invalid;
            }
            MBankAccount compensationAccount = new MBankAccount(getCtx(), getCompensation_C_BankAccount_ID(), get_TrxName());
            MBankAccount drawerAccount = new MBankAccount(getCtx(), getDrawer_C_BankAccount_ID(), get_TrxName());
            String currencyError = getCurrencyValidationError(compensationAccount, drawerAccount,
                    "@Compensation_C_BankAccount_ID@", "@Drawer_C_BankAccount_ID@");
            if (currencyError != null) {
                m_processMsg = currencyError;
                return DocAction.STATUS_Invalid;
            }
        } else if (OPERATIONTYPE_Transfer.equals(getOperationType())) {
            if (getFrom_C_BankAccount_ID() <= 0) {
                m_processMsg = "@From_C_BankAccount_ID@ @Mandatory@";
                return DocAction.STATUS_Invalid;
            }
            if (getTo_C_BankAccount_ID() <= 0) {
                m_processMsg = "@To_C_BankAccount_ID@ @Mandatory@";
                return DocAction.STATUS_Invalid;
            }
            if (getFrom_C_BankAccount_ID() == getTo_C_BankAccount_ID()) {
                m_processMsg = "@C_BankAccount_ID@ @Invalid@";
                return DocAction.STATUS_Invalid;
            }
            MBankAccount fromAccount = new MBankAccount(getCtx(), getFrom_C_BankAccount_ID(), get_TrxName());
            MBankAccount toAccount = new MBankAccount(getCtx(), getTo_C_BankAccount_ID(), get_TrxName());
            String currencyError = getCurrencyValidationError(fromAccount, toAccount,
                    "@From_C_BankAccount_ID@", "@To_C_BankAccount_ID@");
            if (currencyError != null) {
                m_processMsg = currencyError;
                return DocAction.STATUS_Invalid;
            }
        } else {
            m_processMsg = "@OperationType@ @Invalid@";
            return DocAction.STATUS_Invalid;
        }

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

        try {
            if (OPERATIONTYPE_Check.equals(getOperationType()))
                completeCheck();
            else
                completeTransfer();
        } catch (Exception e) {
            m_processMsg = e.getMessage();
            return DocAction.STATUS_Invalid;
        }

        setProcessed(true);
        setProcessing(false);
        setDocAction(DocAction.ACTION_Void);
        return DocAction.STATUS_Completed;
    }

    private void completeCheck() {
        MBankAccount compensationAccount = new MBankAccount(getCtx(), getCompensation_C_BankAccount_ID(), get_TrxName());
        MBankAccount targetAccount = new MBankAccount(getCtx(), getDrawer_C_BankAccount_ID(), get_TrxName());
        validateCurrency(compensationAccount, targetAccount);

        MPayment receipt = createBasePayment(true, targetAccount, MPayment.TENDERTYPE_Check,
                buildPaymentDescription("Ingreso cheque"));
        if (getRoutingNo() != null && getRoutingNo().trim().length() > 0)
            receipt.setRoutingNo(getRoutingNo());
        if (getAccountNo() != null && getAccountNo().trim().length() > 0)
            receipt.setAccountNo(getAccountNo());
        if (getCheckNo() != null && getCheckNo().trim().length() > 0)
            receipt.setCheckNo(getCheckNo());
        if (getFecha_Venc_Cheque() != null)
            receipt.set_ValueOfColumn("Fecha_Venc_Cheque", getFecha_Venc_Cheque());
        if (getA_Name() != null && getA_Name().trim().length() > 0)
            receipt.setA_Name(getA_Name());
        receipt.set_ValueOfColumn("IsOnDrawer", Boolean.TRUE);
        completePayment(receipt);

        MPayment payment = createBasePayment(false, compensationAccount, MPayment.TENDERTYPE_DirectDeposit,
                buildPaymentDescription("Compensación cheque"));
        completePayment(payment);

        MAllocationHdr allocation = allocatePayments(receipt, payment);

        setReceipt_C_Payment_ID(receipt.getC_Payment_ID());
        setPayment_C_Payment_ID(payment.getC_Payment_ID());
        setC_AllocationHdr_ID(allocation.getC_AllocationHdr_ID());
        setProcessMsg("@C_Payment_ID@=" + receipt.getDocumentNo() + " / " + payment.getDocumentNo()
                + " - @C_AllocationHdr_ID@=" + allocation.getDocumentNo());
        saveEx();
    }

    private void completeTransfer() {
        MBankAccount fromAccount = new MBankAccount(getCtx(), getFrom_C_BankAccount_ID(), get_TrxName());
        MBankAccount toAccount = new MBankAccount(getCtx(), getTo_C_BankAccount_ID(), get_TrxName());
        validateCurrency(fromAccount, toAccount);

        MPayment payment = createBasePayment(false, fromAccount, MPayment.TENDERTYPE_DirectDeposit,
                buildPaymentDescription("Transferencia salida"));
        completePayment(payment);

        MPayment receipt = createBasePayment(true, toAccount, MPayment.TENDERTYPE_DirectDeposit,
                buildPaymentDescription("Transferencia ingreso"));
        completePayment(receipt);

        MAllocationHdr allocation = allocatePayments(receipt, payment);

        setReceipt_C_Payment_ID(receipt.getC_Payment_ID());
        setPayment_C_Payment_ID(payment.getC_Payment_ID());
        setC_AllocationHdr_ID(allocation.getC_AllocationHdr_ID());
        setProcessMsg("@C_Payment_ID@=" + receipt.getDocumentNo() + " / " + payment.getDocumentNo()
                + " - @C_AllocationHdr_ID@=" + allocation.getDocumentNo());
        saveEx();
    }

    private MPayment createBasePayment(boolean receipt, MBankAccount bankAccount, String tenderType, String description) {
        MPayment payment = new MPayment(getCtx(), 0, get_TrxName());
        payment.setAD_Org_ID(getAD_Org_ID());
        if (!payment.setLAR_C_DoctType_ID(receipt, getAD_Org_ID()))
            throw new AdempiereException("@C_DocType_ID@ @NotFound@");
        payment.setC_BPartner_ID(getC_BPartner_ID());
        payment.setC_BankAccount_ID(bankAccount.getC_BankAccount_ID());
        payment.setTenderType(tenderType);
        payment.setPayAmt(getAmount());
        payment.setDateTrx(getDateDoc());
        payment.setDateAcct(getDateAcct());
        payment.setC_Currency_ID(bankAccount.getC_Currency_ID());
        payment.setDescription(description);
        payment.setIsReceipt(receipt);
        return payment;
    }

    private void completePayment(MPayment payment) {
        payment.saveEx(get_TrxName());
        if (!payment.processIt(DocAction.ACTION_Complete))
            throw new AdempiereException(payment.getProcessMsg());
        payment.saveEx(get_TrxName());
    }

    private MAllocationHdr allocatePayments(MPayment receipt, MPayment payment) {
        MAllocationHdr alloc = new MAllocationHdr(getCtx(), false, getDateDoc(), receipt.getC_Currency_ID(),
                Msg.translate(getCtx(), "C_Payment_ID") + ": " + getDocumentNo(), get_TrxName());
        alloc.setAD_Org_ID(getAD_Org_ID());
        alloc.setDateAcct(getDateAcct());
        alloc.saveEx(get_TrxName());

        MAllocationLine receiptLine = new MAllocationLine(alloc, receipt.getPayAmt(true), Env.ZERO, Env.ZERO, Env.ZERO);
        receiptLine.setDocInfo(receipt.getC_BPartner_ID(), 0, 0);
        receiptLine.setPaymentInfo(receipt.getC_Payment_ID(), 0);
        receiptLine.saveEx(get_TrxName());

        MAllocationLine paymentLine = new MAllocationLine(alloc, payment.getPayAmt(true), Env.ZERO, Env.ZERO, Env.ZERO);
        paymentLine.setDocInfo(payment.getC_BPartner_ID(), 0, 0);
        paymentLine.setPaymentInfo(payment.getC_Payment_ID(), 0);
        paymentLine.saveEx(get_TrxName());

        if (!alloc.processIt(DocAction.ACTION_Complete))
            throw new AdempiereException(alloc.getProcessMsg());
        alloc.saveEx(get_TrxName());
        return alloc;
    }

    private void validateCurrency(MBankAccount source, MBankAccount target) {
        if (source.getC_Currency_ID() != target.getC_Currency_ID())
            throw new AdempiereException("@C_Currency_ID@ @Invalid@");
    }

    private String getCurrencyValidationError(MBankAccount source, MBankAccount target, String sourceLabel, String targetLabel) {
        if (source.getC_Currency_ID() <= 0 || target.getC_Currency_ID() <= 0)
            return "@C_Currency_ID@ @Invalid@";
        if (source.getC_Currency_ID() != target.getC_Currency_ID())
            return sourceLabel + " / " + targetLabel + ": @C_Currency_ID@ @Invalid@";
        return null;
    }

    private String buildPaymentDescription(String action) {
        StringBuilder description = new StringBuilder(action).append(" ").append(getDocumentNo());
        if (getDescription() != null && getDescription().trim().length() > 0)
            description.append(" - ").append(getDescription().trim());
        return description.toString();
    }

    public String validateVoidProcessMsg() {
        try {
            validateVoid();
            return null;
        } catch (AdempiereException e) {
            return e.getMessage();
        }
    }

    public void validateVoid() {
        validatePaymentCopies(getReceipt_C_Payment_ID());
        validatePaymentCopies(getPayment_C_Payment_ID());
    }

    @Override
    public boolean voidIt() {
        try {
            validateVoid();
            reverseGeneratedDocuments();
        } catch (Exception e) {
            m_processMsg = e.getMessage();
            return false;
        }

        setProcessed(true);
        setProcessing(false);
        setDocStatus(DocAction.STATUS_Voided);
        setDocAction(DocAction.ACTION_None);
        m_processMsg = "@Reversed@";
        setProcessMsg(m_processMsg);
        recalculateHeaderTotal();
        return true;
    }

    private void reverseGeneratedDocuments() {
        reversePayment(getReceipt_C_Payment_ID());
        reversePayment(getPayment_C_Payment_ID());

        if (getC_AllocationHdr_ID() > 0) {
            MAllocationHdr allocation = new MAllocationHdr(getCtx(), getC_AllocationHdr_ID(), get_TrxName());
            if (!DOCSTATUS_Reversed.equals(allocation.getDocStatus()) && !DOCSTATUS_Voided.equals(allocation.getDocStatus())) {
                allocation.setDocAction(DocAction.ACTION_Reverse_Correct);
                if (!allocation.processIt(DocAction.ACTION_Reverse_Correct))
                    throw new AdempiereException(allocation.getProcessMsg());
                allocation.saveEx(get_TrxName());
            }
        }
    }

    private void reversePayment(int paymentId) {
        if (paymentId <= 0)
            return;
        MPayment payment = new MPayment(getCtx(), paymentId, get_TrxName());
        if (DOCSTATUS_Reversed.equals(payment.getDocStatus()) || DOCSTATUS_Voided.equals(payment.getDocStatus()))
            return;
        payment.setDocAction(DocAction.ACTION_Void);
        if (!payment.processIt(DocAction.ACTION_Void))
            throw new AdempiereException(payment.getProcessMsg());
        payment.saveEx(get_TrxName());
    }

    private void validatePaymentCopies(int paymentId) {
        if (paymentId <= 0)
            return;

        for (Object row : new Query(getCtx(), MPayment.Table_Name,
                "LAR_PaymentSource_ID=? AND DocStatus IN ('CO','CL')", get_TrxName())
                        .setParameters(paymentId)
                        .list()) {
            MPayment paymentCopy = (MPayment) row;
            int bankStatementLineId = getBankStatementLineId(paymentCopy.getC_Payment_ID());
            if (bankStatementLineId > 0) {
                String sql = "SELECT stm.EsCierreCaja"
                        + " FROM C_BankStatementLine stml"
                        + " JOIN C_BankStatement stm ON stml.C_BankStatement_ID = stm.C_BankStatement_ID"
                        + " WHERE stm.DocStatus NOT IN ('VO')"
                        + " AND C_BankStatementLine_ID = ?";
                String esCierreCaja = DB.getSQLValueString(get_TrxName(), sql, bankStatementLineId);
                if ("N".equals(esCierreCaja))
                    throw new AdempiereException("No se puede anular el cobro, ya que el mismo fue conciliado en una cuenta bancaria.");
            }

            if (!paymentCopy.isReceipt() && !DOCSTATUS_Voided.equals(paymentCopy.getDocStatus())
                    && !DOCSTATUS_Reversed.equals(paymentCopy.getDocStatus())) {
                int paymentHeaderId = paymentCopy.get_ValueAsInt("LAR_PaymentHeader_ID");
                if (paymentHeaderId > 0) {
                    MLARPaymentHeader header = new MLARPaymentHeader(getCtx(), paymentHeaderId, get_TrxName());
                    throw new AdempiereException(
                            "No se puede anular el cobro seleccionado. El mismo está siendo utilizado en la Orden de Pago Nro: "
                                    + header.getDocumentNo());
                }
            }
        }
    }

    private int getBankStatementLineId(int paymentId) {
        String sql = "SELECT C_BankStatementLine_ID FROM C_BankStatementLine WHERE C_Payment_ID=?";
        int id = DB.getSQLValue(get_TrxName(), sql, paymentId);
        return id < 0 ? 0 : id;
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
        return getDocumentNo() + " - " + getAmount();
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
        return getAmount();
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
        int currencyId = 0;
        if (getTo_C_BankAccount_ID() > 0)
            currencyId = DB.getSQLValueEx(get_TrxName(), "SELECT C_Currency_ID FROM C_BankAccount WHERE C_BankAccount_ID=?",
                    getTo_C_BankAccount_ID());
        if (currencyId <= 0 && getFrom_C_BankAccount_ID() > 0)
            currencyId = DB.getSQLValueEx(get_TrxName(), "SELECT C_Currency_ID FROM C_BankAccount WHERE C_BankAccount_ID=?",
                    getFrom_C_BankAccount_ID());
        if (currencyId <= 0 && getCompensation_C_BankAccount_ID() > 0)
            currencyId = DB.getSQLValueEx(get_TrxName(), "SELECT C_Currency_ID FROM C_BankAccount WHERE C_BankAccount_ID=?",
                    getCompensation_C_BankAccount_ID());
        return currencyId;
    }

    @Override
    public int customizeValidActions(String docStatus, Object processing, String orderType, String isSOTrx,
            int AD_Table_ID, String[] docAction, String[] options, int index) {
        if (AD_Table_ID == Table_ID) {
            if ((DocumentEngine.STATUS_Drafted.equals(docStatus) || DocumentEngine.STATUS_InProgress.equals(docStatus))
                    && getLAR_CardSettlement_Hdr_ID() <= 0)
                options[index++] = DocumentEngine.ACTION_Complete;
            if (DocumentEngine.STATUS_Completed.equals(docStatus))
                options[index++] = DocumentEngine.ACTION_Void;
        }
        return index;
    }

    private MLARCardSettlementHdr getHeader() {
        if (getLAR_CardSettlement_Hdr_ID() <= 0)
            return null;
        return new MLARCardSettlementHdr(getCtx(), getLAR_CardSettlement_Hdr_ID(), get_TrxName());
    }

    private int getNextLineNo() {
        return DB.getSQLValueEx(get_TrxName(),
                "SELECT COALESCE(MAX(Line),0)+10 FROM LAR_CardSettlement WHERE LAR_CardSettlement_Hdr_ID=?",
                getLAR_CardSettlement_Hdr_ID());
    }

    private void recalculateHeaderTotal() {
        MLARCardSettlementHdr header = getHeader();
        if (header != null)
            header.recalculateTotalFromLines();
    }

    private boolean isDocumentTransitionOnly() {
        return !isBusinessFieldChanged();
    }

    private boolean isBusinessFieldChanged() {
        return is_ValueChanged(COLUMNNAME_AD_Org_ID)
                || is_ValueChanged(COLUMNNAME_DateDoc)
                || is_ValueChanged(COLUMNNAME_DateAcct)
                || is_ValueChanged(COLUMNNAME_C_BPartner_ID)
                || is_ValueChanged(COLUMNNAME_OperationType)
                || is_ValueChanged(COLUMNNAME_Amount)
                || is_ValueChanged(COLUMNNAME_Description)
                || is_ValueChanged(COLUMNNAME_Compensation_C_BankAccount_ID)
                || is_ValueChanged(COLUMNNAME_Drawer_C_BankAccount_ID)
                || is_ValueChanged(COLUMNNAME_From_C_BankAccount_ID)
                || is_ValueChanged(COLUMNNAME_To_C_BankAccount_ID)
                || is_ValueChanged(COLUMNNAME_RoutingNo)
                || is_ValueChanged(COLUMNNAME_AccountNo)
                || is_ValueChanged(COLUMNNAME_CheckNo)
                || is_ValueChanged(COLUMNNAME_Fecha_Venc_Cheque)
                || is_ValueChanged(COLUMNNAME_A_Name)
                || is_ValueChanged(COLUMNNAME_Line);
    }
}
