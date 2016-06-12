/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2006 Adempiere, Inc. All Rights Reserved.               *
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
import java.util.Properties;

import org.compiere.model.MBankAccount;
import org.compiere.model.MBankStatement;
import org.compiere.model.MBankStatementLine;
import org.compiere.model.MPayment;
import org.compiere.util.Env;

public class TransaccionCuentaBancaria
{
    /**
     * Constructor para evitar instanciación
     */
    private TransaccionCuentaBancaria() {}

    /**
     * Transferir todos los valores contemplados dentro de un Statement bancario,
     * de una cuenta origen a una cuenta destino.
     *
     * @param p_BankStatement_ID
     * @param p_From_C_BankAccount_ID
     * @param p_To_C_BankAccount_ID
     * @param p_Description
     * @param p_C_BPartner_ID
     * @param p_C_Currency_ID
     * @param p_StatementDate
     * @param p_DateAcct
     * @param ctx
     * @param trxName
     * @return Cantidad de lineas transferidas.
     */
    public static int transferirMovimientosEntreCuentas(final int p_BankStatement_ID,
            final int p_From_C_BankAccount_ID, final int p_To_C_BankAccount_ID, final String p_Description,
            final int p_C_BPartner_ID, final int p_C_Currency_ID, final Timestamp p_StatementDate,
            final Timestamp p_DateAcct, final Properties ctx, final String trxName)
    {
        // Contador de lineas tranferidas.
        int m_transferred = 0;

        final MBankStatement statement = new MBankStatement(ctx, p_BankStatement_ID, trxName);
        final MBankAccount mBankFrom = new MBankAccount(ctx, p_From_C_BankAccount_ID, trxName);
        final MBankAccount mBankTo = new MBankAccount(ctx, p_To_C_BankAccount_ID, trxName);

        BigDecimal cashAmt = BigDecimal.ZERO;
        BigDecimal totalAmt = BigDecimal.ZERO;
        // Iterates over conciliated payments
        for (final MBankStatementLine line : statement.getLines(true))
        {
            // @fchiappano Si la linea ya fue tranferida, se pasa a la
            // siguiente.
            if (line.get_ValueAsBoolean("IsTransferred"))
                continue;

            final MPayment paymentFrom = new MPayment(ctx, line.getC_Payment_ID(), trxName);
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
            final MPayment paymentBankTo = new MPayment(ctx, 0, trxName);
            paymentBankTo.setC_BankAccount_ID(mBankTo.getC_BankAccount_ID());
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
            final MPayment cashBankTo = new MPayment(ctx, 0, trxName);
            cashBankTo.setC_BankAccount_ID(mBankTo.getC_BankAccount_ID());
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

        // Creates a debit for transference total amount
        final MPayment paymentBankFrom = new MPayment(ctx, 0, trxName);
        paymentBankFrom.setC_BankAccount_ID(mBankFrom.getC_BankAccount_ID());
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
        // @fchiappano si el Statement original, Es un cierre de caja,
        // marco el nuevo Statement como cierre de caja tambien.
        if (statement.get_ValueAsBoolean("EsCierreCaja"))
        {
            newStmt.set_ValueOfColumn("EsCierreCaja", true);
            // Seteo el Saldo inicial en 0, para que no genere errores en futuros calculos.
            newStmt.set_ValueOfColumn("SaldoInicial", Env.ZERO);
        }
        // @fchiappano Marco el nuevo Statement como transferido.
        newStmt.set_ValueOfColumn("Transferido", true);
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

        // @fchiappano Marco el Statement original como transferido.
        statement.set_ValueOfColumn("Transferido", true);
        statement.saveEx();

        return m_transferred;
    } // transferirMovimientosEntreCuentas

} // TransaccionCuentaBancaria
