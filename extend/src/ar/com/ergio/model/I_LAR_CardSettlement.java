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

import java.math.BigDecimal;
import java.sql.Timestamp;

import org.compiere.model.I_C_AllocationHdr;
import org.compiere.model.I_C_BPartner;
import org.compiere.model.I_C_BankAccount;
import org.compiere.model.I_C_Payment;
import org.compiere.model.MTable;
import org.compiere.util.KeyNamePair;

public interface I_LAR_CardSettlement {

    String Table_Name = "LAR_CardSettlement";
    int Table_ID = MTable.getTable_ID(Table_Name);
    KeyNamePair Model = new KeyNamePair(Table_ID, Table_Name);
    BigDecimal accessLevel = BigDecimal.valueOf(3);

    String COLUMNNAME_LAR_CardSettlement_ID = "LAR_CardSettlement_ID";
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
    String COLUMNNAME_Amount = "Amount";
    String COLUMNNAME_Description = "Description";
    String COLUMNNAME_Compensation_C_BankAccount_ID = "Compensation_C_BankAccount_ID";
    String COLUMNNAME_Drawer_C_BankAccount_ID = "Drawer_C_BankAccount_ID";
    String COLUMNNAME_From_C_BankAccount_ID = "From_C_BankAccount_ID";
    String COLUMNNAME_To_C_BankAccount_ID = "To_C_BankAccount_ID";
    String COLUMNNAME_RoutingNo = "RoutingNo";
    String COLUMNNAME_AccountNo = "AccountNo";
    String COLUMNNAME_CheckNo = "CheckNo";
    String COLUMNNAME_Fecha_Venc_Cheque = "Fecha_Venc_Cheque";
    String COLUMNNAME_A_Name = "A_Name";
    String COLUMNNAME_Receipt_C_Payment_ID = "Receipt_C_Payment_ID";
    String COLUMNNAME_Payment_C_Payment_ID = "Payment_C_Payment_ID";
    String COLUMNNAME_C_AllocationHdr_ID = "C_AllocationHdr_ID";
    String COLUMNNAME_ProcessMsg = "ProcessMsg";

    String DOCACTION_Complete = "CO";
    String DOCACTION_Void = "VO";
    String DOCACTION_None = "--";
    String DOCACTION_Prepare = "PR";
    String DOCACTION_Reverse_Correct = "RC";

    String DOCSTATUS_Drafted = "DR";
    String DOCSTATUS_InProgress = "IP";
    String DOCSTATUS_Completed = "CO";
    String DOCSTATUS_Voided = "VO";
    String DOCSTATUS_Reversed = "RE";

    String OPERATIONTYPE_Check = "C";
    String OPERATIONTYPE_Transfer = "T";

    int getAD_Client_ID();
    void setAD_Org_ID(int AD_Org_ID);
    int getAD_Org_ID();
    void setIsActive(boolean IsActive);
    boolean isActive();
    Timestamp getCreated();
    int getCreatedBy();
    Timestamp getUpdated();
    int getUpdatedBy();

    void setLAR_CardSettlement_ID(int LAR_CardSettlement_ID);
    int getLAR_CardSettlement_ID();

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

    void setAmount(BigDecimal amount);
    BigDecimal getAmount();

    void setDescription(String description);
    String getDescription();

    void setCompensation_C_BankAccount_ID(int C_BankAccount_ID);
    int getCompensation_C_BankAccount_ID();
    I_C_BankAccount getCompensation_C_BankAccount() throws RuntimeException;

    void setDrawer_C_BankAccount_ID(int C_BankAccount_ID);
    int getDrawer_C_BankAccount_ID();
    I_C_BankAccount getDrawer_C_BankAccount() throws RuntimeException;

    void setFrom_C_BankAccount_ID(int C_BankAccount_ID);
    int getFrom_C_BankAccount_ID();
    I_C_BankAccount getFrom_C_BankAccount() throws RuntimeException;

    void setTo_C_BankAccount_ID(int C_BankAccount_ID);
    int getTo_C_BankAccount_ID();
    I_C_BankAccount getTo_C_BankAccount() throws RuntimeException;

    void setRoutingNo(String routingNo);
    String getRoutingNo();

    void setAccountNo(String accountNo);
    String getAccountNo();

    void setCheckNo(String checkNo);
    String getCheckNo();

    void setFecha_Venc_Cheque(Timestamp Fecha_Venc_Cheque);
    Timestamp getFecha_Venc_Cheque();

    void setA_Name(String aName);
    String getA_Name();

    void setReceipt_C_Payment_ID(int C_Payment_ID);
    int getReceipt_C_Payment_ID();
    I_C_Payment getReceipt_C_Payment() throws RuntimeException;

    void setPayment_C_Payment_ID(int C_Payment_ID);
    int getPayment_C_Payment_ID();
    I_C_Payment getPayment_C_Payment() throws RuntimeException;

    void setC_AllocationHdr_ID(int C_AllocationHdr_ID);
    int getC_AllocationHdr_ID();
    I_C_AllocationHdr getC_AllocationHdr() throws RuntimeException;

    void setProcessMsg(String processMsg);
    String getProcessMsg();
}
