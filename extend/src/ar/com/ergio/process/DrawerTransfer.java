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
package ar.com.ergio.process;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

import org.compiere.model.MBankAccount;
import org.compiere.model.MBankStatement;
import org.compiere.model.MBankStatementLine;
import org.compiere.model.MPayment;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereUserError;
import org.compiere.util.DB;
import org.compiere.util.Env;

/**
 * Drawer transfer
 *
 * Based on BankTranfer contributed by Victor Perez.
 *
 * @author Emiliano Pereyra - http://www.ergio.com.ar
 *
 **/
public class DrawerTransfer extends SvrProcess
{
    private String p_DocumentNo = ""; // Document No
    private String p_Description = ""; // Description
    private int p_C_BPartner_ID = 0; // Business Partner to be used as bridge
    private int p_C_Currency_ID = 0; // Payment Currency

    private int p_From_C_BankAccount_ID = 0; // Bank Account From
    private int p_To_C_BankAccount_ID = 0; // Bank Account To
    private Timestamp p_StatementDate = null; // Date Statement
    private Timestamp p_DateAcct = null; // Date Account
    private int m_transferred = 0;

    /**
     * Prepare - e.g., get Parameters.
     */
    protected void prepare()
    {
        ProcessInfoParameter[] para = getParameter();
        for (int i = 0; i < para.length; i++) {
            String name = para[i].getParameterName();
            if (name.equals("From_C_BankAccount_ID"))
                p_From_C_BankAccount_ID = para[i].getParameterAsInt();
            else if (name.equals("To_C_BankAccount_ID"))
                p_To_C_BankAccount_ID = para[i].getParameterAsInt();
            else if (name.equals("C_Currency_ID"))
                p_C_Currency_ID = para[i].getParameterAsInt();
            else if (name.equals("Description"))
                p_Description = (String) para[i].getParameter();
            else if (name.equals("DocumentNo"))
                p_DocumentNo = (String)para[i].getParameter();
            else if (name.equals("StatementDate"))
                p_StatementDate = (Timestamp) para[i].getParameter();
            else if (name.equals("DateAcct"))
                p_DateAcct = (Timestamp) para[i].getParameter();
            else
                log.log(Level.SEVERE, "prepare - Unknown Parameter: " + name);
        }
    } // prepare

    /**
     * Perform process.
     *
     * @return Message (translated text)
     * @throws Exception
     *             if not successful
     */
    protected String doIt() throws Exception
    {
        String msg = String.format("From Bank=%d - To Bank=%d - DocumentNo=%s - Description=%s - Statement Date=%s - Date Account=%s",
                p_From_C_BankAccount_ID, p_To_C_BankAccount_ID, p_DocumentNo, p_Description, p_StatementDate, p_DateAcct);
        log.info(msg);

        if (p_To_C_BankAccount_ID == 0 || p_From_C_BankAccount_ID == 0)
            throw new IllegalArgumentException("Banks required");

        if (p_DocumentNo == null || p_DocumentNo.length() == 0)
            throw new IllegalArgumentException("Document No required");

        if (p_To_C_BankAccount_ID == p_From_C_BankAccount_ID)
            throw new AdempiereUserError("Banks From and To must be different");

        p_C_BPartner_ID = Env.getAD_User_ID(getCtx());
        if (p_C_BPartner_ID == 0)
            throw new AdempiereUserError ("Business Partner required");

        if (p_C_Currency_ID == 0)
            throw new AdempiereUserError("Currency required");

        // Login Date
        if (p_StatementDate == null)
            p_StatementDate = Env.getContextAsDate(getCtx(), "#Date");
        if (p_StatementDate == null)
            p_StatementDate = new Timestamp(System.currentTimeMillis());

        if (p_DateAcct == null)
            p_DateAcct = p_StatementDate;

        generateDrawerTransfer();
        return "@Transferred@ = " + m_transferred;
    } // doIt

    /**
     * Generate BankTransfer()
     *
     */
    private void generateDrawerTransfer()
    {
        final MBankAccount mBankFrom = new MBankAccount(getCtx(), p_From_C_BankAccount_ID, get_TrxName());
        final MBankAccount mBankTo = new MBankAccount(getCtx(), p_To_C_BankAccount_ID, get_TrxName());

        BigDecimal cashAmt = BigDecimal.ZERO;
        BigDecimal totalAmt = BigDecimal.ZERO;
        // Iterates over concialiates payments
        for (final MBankStatementLine line : getLines(mBankFrom))
        {
            final MPayment paymentFrom = new MPayment(getCtx(), line.getC_Payment_ID(), get_TrxName());
            totalAmt = totalAmt.add(paymentFrom.getPayAmt());
            // Accumulates cash amounts
            if (paymentFrom.getTenderType().equals(MPayment.TENDERTYPE_Cash)) 
            {
                cashAmt = cashAmt.add(paymentFrom.getPayAmt());
                line.set_ValueOfColumn("IsTransferred", true);
                line.saveEx();
                continue;
            }
            // Transfer other payments
            final MPayment paymentBankTo = new MPayment(getCtx(), 0, get_TrxName());
            paymentBankTo.setC_BankAccount_ID(mBankTo.getC_BankAccount_ID());
            paymentBankTo.setDocumentNo(p_DocumentNo);
            paymentBankTo.setDateAcct(p_DateAcct);
            paymentBankTo.setDateTrx(p_StatementDate);
            paymentBankTo.setTenderType(paymentFrom.getTenderType());
            paymentBankTo.setDescription(p_Description);
            paymentBankTo.setC_BPartner_ID(p_C_BPartner_ID);
            paymentBankTo.setC_Currency_ID(p_C_Currency_ID);
            paymentBankTo.setPayAmt(paymentFrom.getPayAmt());
            paymentBankTo.setOverUnderAmt(Env.ZERO);
            paymentBankTo.setC_DocType_ID(true);
            paymentBankTo.saveEx();
            paymentBankTo.processIt(MPayment.DOCACTION_Complete);
            paymentBankTo.saveEx();

            // Mark bank statement line as transferred
            line.set_ValueOfColumn("IsTransferred", true);
            line.saveEx();
            m_transferred++;
        }

        // Transfer an accumulated cash amount
        if (cashAmt.compareTo(BigDecimal.ZERO) > 0)
        {
            final MPayment cashBankTo = new MPayment(getCtx(), 0, get_TrxName());
            cashBankTo.setC_BankAccount_ID(mBankTo.getC_BankAccount_ID());
            cashBankTo.setDocumentNo(p_DocumentNo);
            cashBankTo.setDateAcct(p_DateAcct);
            cashBankTo.setDateTrx(p_StatementDate);
            cashBankTo.setTenderType(MPayment.TENDERTYPE_Cash);
            cashBankTo.setDescription(p_Description);
            cashBankTo.setC_BPartner_ID(p_C_BPartner_ID);
            cashBankTo.setC_Currency_ID(p_C_Currency_ID);
            cashBankTo.setPayAmt(cashAmt);
            cashBankTo.setOverUnderAmt(Env.ZERO);
            cashBankTo.setC_DocType_ID(true);
            cashBankTo.saveEx();
            cashBankTo.processIt(MPayment.DOCACTION_Complete);
            cashBankTo.saveEx();
            m_transferred++;
        }

        // Creates a debit for tranference total amount
        final MPayment paymentBankFrom = new MPayment(getCtx(), 0, get_TrxName());
        paymentBankFrom.setC_BankAccount_ID(mBankFrom.getC_BankAccount_ID());
        paymentBankFrom.setDocumentNo(p_DocumentNo);
        paymentBankFrom.setDateAcct(p_DateAcct);
        paymentBankFrom.setDateTrx(p_StatementDate);
        paymentBankFrom.setTenderType(MPayment.TENDERTYPE_DirectDeposit);
        paymentBankFrom.setDescription(p_Description);
        paymentBankFrom.setC_BPartner_ID(p_C_BPartner_ID);
        paymentBankFrom.setC_Currency_ID(p_C_Currency_ID);
        paymentBankFrom.setPayAmt(totalAmt);
        paymentBankFrom.setOverUnderAmt(Env.ZERO);
        paymentBankFrom.setIsReconciled(true);
        paymentBankFrom.setC_DocType_ID(false);
        paymentBankFrom.saveEx();
        paymentBankFrom.processIt(MPayment.DOCACTION_Complete);
        paymentBankFrom.saveEx();

        // Creates a bank statement and a bank statement line for balance transfer
        final MBankStatement newStmt = new MBankStatement(mBankFrom);
        newStmt.setName("Compensacion Transferencia");
        newStmt.setDocStatus(MBankStatement.DOCSTATUS_Drafted);
        newStmt.saveEx();
        final MBankStatementLine newLine = new MBankStatementLine(newStmt);
        newLine.setC_Currency_ID(p_C_Currency_ID);
        newLine.setC_Payment_ID(paymentBankFrom.getC_Payment_ID());
        newLine.setLine(10);
        newLine.set_ValueOfColumn("IsTransferred", true);
        newLine.set_ValueOfColumn("TrxAmt", totalAmt.negate());
        newLine.set_ValueOfColumn("StmtAmt", totalAmt.negate());
        newLine.saveEx();
        // process statement
        newStmt.processIt(MBankStatement.DOCACTION_Complete);
        newStmt.saveEx();
        return;
    } // generateDrawerTransfer

    /**
     * Retrieves untransferred lines from a given drawer (bank account)
     *
     * @param drawer bank account
     */
    private List<MBankStatementLine> getLines(final MBankAccount drawer)
    {
        final String sql =
                "SELECT L.* " +
                "  FROM C_BankStatementLine L" +
                "  JOIN C_BankStatement S ON S.C_BankStatement_ID=L.C_BankStatement_ID" +
                " WHERE L.AD_Client_ID=? " +
                "   AND L.AD_Org_ID=? " +
                "   AND L.IsActive='Y' " +
                "   AND S.C_BankAccount_ID=? " +
                "   AND L.IsTransferred='N'";

        final List<MBankStatementLine> list = new ArrayList<MBankStatementLine>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = DB.prepareStatement(sql, get_TrxName());
            pstmt.setInt(1, drawer.getAD_Client_ID());
            pstmt.setInt(2, drawer.getAD_Org_ID());
            pstmt.setInt(3, drawer.getC_BankAccount_ID());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(new MBankStatementLine(getCtx(), rs, get_TrxName()));
            }
        } catch (Exception e) {
            log.log(Level.SEVERE, sql, e);
        } finally {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }
        return list;
    } // getStatementsIDs

} // DrawerTransfer
