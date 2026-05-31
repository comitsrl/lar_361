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
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Properties;

import org.compiere.model.I_C_AllocationHdr;
import org.compiere.model.I_C_BPartner;
import org.compiere.model.I_C_BankAccount;
import org.compiere.model.I_C_Payment;
import org.compiere.model.I_Persistent;
import org.compiere.model.MTable;
import org.compiere.model.PO;
import org.compiere.model.POInfo;
import org.compiere.util.Env;

public class X_LAR_CardSettlement extends PO implements I_LAR_CardSettlement, I_Persistent {

    private static final long serialVersionUID = 20260530L;

    public X_LAR_CardSettlement(Properties ctx, int LAR_CardSettlement_ID, String trxName) {
        super(ctx, LAR_CardSettlement_ID, trxName);
    }

    public X_LAR_CardSettlement(Properties ctx, ResultSet rs, String trxName) {
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
        return "X_LAR_CardSettlement[" + get_ID() + "]";
    }

    @Override
    public void setLAR_CardSettlement_ID(int LAR_CardSettlement_ID) {
        if (LAR_CardSettlement_ID < 1)
            set_ValueNoCheck(COLUMNNAME_LAR_CardSettlement_ID, null);
        else
            set_ValueNoCheck(COLUMNNAME_LAR_CardSettlement_ID, Integer.valueOf(LAR_CardSettlement_ID));
    }

    @Override
    public int getLAR_CardSettlement_ID() {
        Integer ii = (Integer) get_Value(COLUMNNAME_LAR_CardSettlement_ID);
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
    public void setAmount(BigDecimal amount) {
        set_Value(COLUMNNAME_Amount, amount);
    }

    @Override
    public BigDecimal getAmount() {
        BigDecimal bd = (BigDecimal) get_Value(COLUMNNAME_Amount);
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
    public void setCompensation_C_BankAccount_ID(int C_BankAccount_ID) {
        if (C_BankAccount_ID < 1)
            set_Value(COLUMNNAME_Compensation_C_BankAccount_ID, null);
        else
            set_Value(COLUMNNAME_Compensation_C_BankAccount_ID, Integer.valueOf(C_BankAccount_ID));
    }

    @Override
    public int getCompensation_C_BankAccount_ID() {
        Integer ii = (Integer) get_Value(COLUMNNAME_Compensation_C_BankAccount_ID);
        return ii == null ? 0 : ii.intValue();
    }

    @Override
    public I_C_BankAccount getCompensation_C_BankAccount() throws RuntimeException {
        return (I_C_BankAccount) MTable.get(getCtx(), I_C_BankAccount.Table_Name)
                .getPO(getCompensation_C_BankAccount_ID(), get_TrxName());
    }

    @Override
    public void setFrom_C_BankAccount_ID(int C_BankAccount_ID) {
        if (C_BankAccount_ID < 1)
            set_Value(COLUMNNAME_From_C_BankAccount_ID, null);
        else
            set_Value(COLUMNNAME_From_C_BankAccount_ID, Integer.valueOf(C_BankAccount_ID));
    }

    @Override
    public int getFrom_C_BankAccount_ID() {
        Integer ii = (Integer) get_Value(COLUMNNAME_From_C_BankAccount_ID);
        return ii == null ? 0 : ii.intValue();
    }

    @Override
    public I_C_BankAccount getFrom_C_BankAccount() throws RuntimeException {
        return (I_C_BankAccount) MTable.get(getCtx(), I_C_BankAccount.Table_Name)
                .getPO(getFrom_C_BankAccount_ID(), get_TrxName());
    }

    @Override
    public void setTo_C_BankAccount_ID(int C_BankAccount_ID) {
        if (C_BankAccount_ID < 1)
            set_Value(COLUMNNAME_To_C_BankAccount_ID, null);
        else
            set_Value(COLUMNNAME_To_C_BankAccount_ID, Integer.valueOf(C_BankAccount_ID));
    }

    @Override
    public int getTo_C_BankAccount_ID() {
        Integer ii = (Integer) get_Value(COLUMNNAME_To_C_BankAccount_ID);
        return ii == null ? 0 : ii.intValue();
    }

    @Override
    public I_C_BankAccount getTo_C_BankAccount() throws RuntimeException {
        return (I_C_BankAccount) MTable.get(getCtx(), I_C_BankAccount.Table_Name)
                .getPO(getTo_C_BankAccount_ID(), get_TrxName());
    }

    @Override
    public void setRoutingNo(String routingNo) {
        set_Value(COLUMNNAME_RoutingNo, routingNo);
    }

    @Override
    public String getRoutingNo() {
        return (String) get_Value(COLUMNNAME_RoutingNo);
    }

    @Override
    public void setAccountNo(String accountNo) {
        set_Value(COLUMNNAME_AccountNo, accountNo);
    }

    @Override
    public String getAccountNo() {
        return (String) get_Value(COLUMNNAME_AccountNo);
    }

    @Override
    public void setCheckNo(String checkNo) {
        set_Value(COLUMNNAME_CheckNo, checkNo);
    }

    @Override
    public String getCheckNo() {
        return (String) get_Value(COLUMNNAME_CheckNo);
    }

    @Override
    public void setA_Name(String aName) {
        set_Value(COLUMNNAME_A_Name, aName);
    }

    @Override
    public String getA_Name() {
        return (String) get_Value(COLUMNNAME_A_Name);
    }

    @Override
    public void setReceipt_C_Payment_ID(int C_Payment_ID) {
        if (C_Payment_ID < 1)
            set_Value(COLUMNNAME_Receipt_C_Payment_ID, null);
        else
            set_Value(COLUMNNAME_Receipt_C_Payment_ID, Integer.valueOf(C_Payment_ID));
    }

    @Override
    public int getReceipt_C_Payment_ID() {
        Integer ii = (Integer) get_Value(COLUMNNAME_Receipt_C_Payment_ID);
        return ii == null ? 0 : ii.intValue();
    }

    @Override
    public I_C_Payment getReceipt_C_Payment() throws RuntimeException {
        return (I_C_Payment) MTable.get(getCtx(), I_C_Payment.Table_Name)
                .getPO(getReceipt_C_Payment_ID(), get_TrxName());
    }

    @Override
    public void setPayment_C_Payment_ID(int C_Payment_ID) {
        if (C_Payment_ID < 1)
            set_Value(COLUMNNAME_Payment_C_Payment_ID, null);
        else
            set_Value(COLUMNNAME_Payment_C_Payment_ID, Integer.valueOf(C_Payment_ID));
    }

    @Override
    public int getPayment_C_Payment_ID() {
        Integer ii = (Integer) get_Value(COLUMNNAME_Payment_C_Payment_ID);
        return ii == null ? 0 : ii.intValue();
    }

    @Override
    public I_C_Payment getPayment_C_Payment() throws RuntimeException {
        return (I_C_Payment) MTable.get(getCtx(), I_C_Payment.Table_Name)
                .getPO(getPayment_C_Payment_ID(), get_TrxName());
    }

    @Override
    public void setC_AllocationHdr_ID(int C_AllocationHdr_ID) {
        if (C_AllocationHdr_ID < 1)
            set_Value(COLUMNNAME_C_AllocationHdr_ID, null);
        else
            set_Value(COLUMNNAME_C_AllocationHdr_ID, Integer.valueOf(C_AllocationHdr_ID));
    }

    @Override
    public int getC_AllocationHdr_ID() {
        Integer ii = (Integer) get_Value(COLUMNNAME_C_AllocationHdr_ID);
        return ii == null ? 0 : ii.intValue();
    }

    @Override
    public I_C_AllocationHdr getC_AllocationHdr() throws RuntimeException {
        return (I_C_AllocationHdr) MTable.get(getCtx(), I_C_AllocationHdr.Table_Name)
                .getPO(getC_AllocationHdr_ID(), get_TrxName());
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
