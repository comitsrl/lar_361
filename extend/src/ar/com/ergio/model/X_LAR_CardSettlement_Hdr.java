/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 *****************************************************************************/
package ar.com.ergio.model;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Properties;

import org.compiere.model.I_C_BPartner;
import org.compiere.model.I_Persistent;
import org.compiere.model.MTable;
import org.compiere.model.PO;
import org.compiere.model.POInfo;
import org.compiere.util.Env;

public class X_LAR_CardSettlement_Hdr extends PO implements I_LAR_CardSettlement_Hdr, I_Persistent {

    private static final long serialVersionUID = 20260608L;

    public X_LAR_CardSettlement_Hdr(Properties ctx, int LAR_CardSettlement_Hdr_ID, String trxName) {
        super(ctx, LAR_CardSettlement_Hdr_ID, trxName);
    }

    public X_LAR_CardSettlement_Hdr(Properties ctx, ResultSet rs, String trxName) {
        super(ctx, rs, trxName);
    }

    @Override
    protected int get_AccessLevel() {
        return accessLevel.intValue();
    }

    @Override
    protected POInfo initPO(Properties ctx) {
        return POInfo.getPOInfo(ctx, Table_ID, get_TrxName());
    }

    @Override
    public String toString() {
        return "X_LAR_CardSettlement_Hdr[" + get_ID() + "]";
    }

    @Override
    public void setLAR_CardSettlement_Hdr_ID(int LAR_CardSettlement_Hdr_ID) {
        if (LAR_CardSettlement_Hdr_ID < 1)
            set_ValueNoCheck(COLUMNNAME_LAR_CardSettlement_Hdr_ID, null);
        else
            set_ValueNoCheck(COLUMNNAME_LAR_CardSettlement_Hdr_ID, Integer.valueOf(LAR_CardSettlement_Hdr_ID));
    }

    @Override
    public int getLAR_CardSettlement_Hdr_ID() {
        Integer ii = (Integer) get_Value(COLUMNNAME_LAR_CardSettlement_Hdr_ID);
        return ii == null ? 0 : ii.intValue();
    }

    @Override
    public void setDocumentNo(String documentNo) {
        set_Value(COLUMNNAME_DocumentNo, documentNo);
    }

    @Override
    public String getDocumentNo() {
        return (String) get_Value(COLUMNNAME_DocumentNo);
    }

    @Override
    public void setDocStatus(String docStatus) {
        set_Value(COLUMNNAME_DocStatus, docStatus);
    }

    @Override
    public String getDocStatus() {
        return (String) get_Value(COLUMNNAME_DocStatus);
    }

    @Override
    public void setDocAction(String docAction) {
        set_Value(COLUMNNAME_DocAction, docAction);
    }

    @Override
    public String getDocAction() {
        return (String) get_Value(COLUMNNAME_DocAction);
    }

    @Override
    public void setProcessing(boolean processing) {
        set_Value(COLUMNNAME_Processing, Boolean.valueOf(processing));
    }

    @Override
    public boolean isProcessing() {
        Object value = get_Value(COLUMNNAME_Processing);
        if (value instanceof Boolean)
            return ((Boolean) value).booleanValue();
        return "Y".equals(value);
    }

    @Override
    public void setProcessed(boolean processed) {
        set_Value(COLUMNNAME_Processed, Boolean.valueOf(processed));
    }

    @Override
    public boolean isProcessed() {
        Object value = get_Value(COLUMNNAME_Processed);
        if (value instanceof Boolean)
            return ((Boolean) value).booleanValue();
        return "Y".equals(value);
    }

    @Override
    public void setDateDoc(Timestamp dateDoc) {
        set_Value(COLUMNNAME_DateDoc, dateDoc);
    }

    @Override
    public Timestamp getDateDoc() {
        return (Timestamp) get_Value(COLUMNNAME_DateDoc);
    }

    @Override
    public void setDateAcct(Timestamp dateAcct) {
        set_Value(COLUMNNAME_DateAcct, dateAcct);
    }

    @Override
    public Timestamp getDateAcct() {
        return (Timestamp) get_Value(COLUMNNAME_DateAcct);
    }

    @Override
    public void setC_BPartner_ID(int C_BPartner_ID) {
        if (C_BPartner_ID < 1)
            set_Value(COLUMNNAME_C_BPartner_ID, null);
        else
            set_Value(COLUMNNAME_C_BPartner_ID, Integer.valueOf(C_BPartner_ID));
    }

    @Override
    public int getC_BPartner_ID() {
        Integer ii = (Integer) get_Value(COLUMNNAME_C_BPartner_ID);
        return ii == null ? 0 : ii.intValue();
    }

    @Override
    public I_C_BPartner getC_BPartner() throws RuntimeException {
        return (I_C_BPartner) MTable.get(getCtx(), I_C_BPartner.Table_Name).getPO(getC_BPartner_ID(), get_TrxName());
    }

    @Override
    public void setOperationType(String operationType) {
        set_Value(COLUMNNAME_OperationType, operationType);
    }

    @Override
    public String getOperationType() {
        return (String) get_Value(COLUMNNAME_OperationType);
    }

    @Override
    public void setTotalAmt(BigDecimal totalAmt) {
        set_Value(COLUMNNAME_TotalAmt, totalAmt);
    }

    @Override
    public BigDecimal getTotalAmt() {
        BigDecimal bd = (BigDecimal) get_Value(COLUMNNAME_TotalAmt);
        return bd == null ? Env.ZERO : bd;
    }

    @Override
    public void setDescription(String description) {
        set_Value(COLUMNNAME_Description, description);
    }

    @Override
    public String getDescription() {
        return (String) get_Value(COLUMNNAME_Description);
    }

    @Override
    public void setProcessMsg(String processMsg) {
        set_Value(COLUMNNAME_ProcessMsg, processMsg);
    }

    @Override
    public String getProcessMsg() {
        return (String) get_Value(COLUMNNAME_ProcessMsg);
    }
}
