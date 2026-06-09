/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 *****************************************************************************/
package ar.com.ergio.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import org.compiere.model.I_C_BPartner;
import org.compiere.model.MTable;
import org.compiere.util.KeyNamePair;

public interface I_LAR_CardSettlement_Hdr {

    String Table_Name = "LAR_CardSettlement_Hdr";
    int Table_ID = MTable.getTable_ID(Table_Name);
    KeyNamePair Model = new KeyNamePair(Table_ID, Table_Name);
    BigDecimal accessLevel = BigDecimal.valueOf(3);

    String COLUMNNAME_LAR_CardSettlement_Hdr_ID = "LAR_CardSettlement_Hdr_ID";
    String COLUMNNAME_AD_Client_ID = "AD_Client_ID";
    String COLUMNNAME_AD_Org_ID = "AD_Org_ID";
    String COLUMNNAME_IsActive = "IsActive";
    String COLUMNNAME_Created = "Created";
    String COLUMNNAME_CreatedBy = "CreatedBy";
    String COLUMNNAME_Updated = "Updated";
    String COLUMNNAME_UpdatedBy = "UpdatedBy";
    String COLUMNNAME_DocumentNo = "DocumentNo";
    String COLUMNNAME_DocStatus = "DocStatus";
    String COLUMNNAME_DocAction = "DocAction";
    String COLUMNNAME_Processing = "Processing";
    String COLUMNNAME_Processed = "Processed";
    String COLUMNNAME_DateDoc = "DateDoc";
    String COLUMNNAME_DateAcct = "DateAcct";
    String COLUMNNAME_C_BPartner_ID = "C_BPartner_ID";
    String COLUMNNAME_OperationType = "OperationType";
    String COLUMNNAME_TotalAmt = "TotalAmt";
    String COLUMNNAME_Description = "Description";
    String COLUMNNAME_ProcessMsg = "ProcessMsg";

    int getAD_Client_ID();
    void setAD_Org_ID(int AD_Org_ID);
    int getAD_Org_ID();
    void setIsActive(boolean IsActive);
    boolean isActive();
    Timestamp getCreated();
    int getCreatedBy();
    Timestamp getUpdated();
    int getUpdatedBy();

    void setLAR_CardSettlement_Hdr_ID(int LAR_CardSettlement_Hdr_ID);
    int getLAR_CardSettlement_Hdr_ID();

    void setDocumentNo(String documentNo);
    String getDocumentNo();

    void setDocStatus(String docStatus);
    String getDocStatus();

    void setDocAction(String docAction);
    String getDocAction();

    void setProcessing(boolean processing);
    boolean isProcessing();

    void setProcessed(boolean processed);
    boolean isProcessed();

    void setDateDoc(Timestamp dateDoc);
    Timestamp getDateDoc();

    void setDateAcct(Timestamp dateAcct);
    Timestamp getDateAcct();

    void setC_BPartner_ID(int C_BPartner_ID);
    int getC_BPartner_ID();
    I_C_BPartner getC_BPartner() throws RuntimeException;

    void setOperationType(String operationType);
    String getOperationType();

    void setTotalAmt(BigDecimal totalAmt);
    BigDecimal getTotalAmt();

    void setDescription(String description);
    String getDescription();

    void setProcessMsg(String processMsg);
    String getProcessMsg();
}
