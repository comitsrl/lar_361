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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.model.MBankAccount;
import org.compiere.model.MBankStatement;
import org.compiere.model.MBankStatementLine;
import org.compiere.model.MPayment;
import org.compiere.model.MUser;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;

public class TransaccionCuentaBancaria
{
    /** Logger */
    private static CLogger log = CLogger.getCLogger(TransaccionCuentaBancaria.class);

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
            final int p_C_BPartner_ID, final Timestamp p_StatementDate, final Timestamp p_DateAcct,
            final Properties ctx, final String trxName)
    {
        // Contador de lineas tranferidas.
        int m_transferred = 0;

        final MBankStatement statement = new MBankStatement(ctx, p_BankStatement_ID, trxName);
        final MBankAccount mBankTo = new MBankAccount(ctx, p_To_C_BankAccount_ID, trxName);

        BigDecimal cashAmt = BigDecimal.ZERO;
        BigDecimal totalAmt = BigDecimal.ZERO;
        int p_C_Currency_ID = 0;

        // Iterates over conciliated payments
        for (final MBankStatementLine line : statement.getLines(true))
        {
            // @fchiappano Si la linea ya fue tranferida, se pasa a la
            // siguiente.
            if (line.get_ValueAsBoolean("IsTransferred"))
                continue;

            final MPayment paymentFrom = new MPayment(ctx, line.getC_Payment_ID(), trxName);
            totalAmt = totalAmt.add(paymentFrom.getPayAmt());
            // @fchiappano Tomo la moneda utilizada en el pago.
            p_C_Currency_ID = paymentFrom.getC_Currency_ID();

            // Accumulates cash amounts
            if (paymentFrom.getTenderType().equals(MPayment.TENDERTYPE_Cash))
            {
                cashAmt = cashAmt.add(paymentFrom.getPayAmt());
                line.set_ValueOfColumn("IsTransferred", true);
                line.saveEx();
                continue;
            }
            // Transfer other payments
            crearPago(p_DateAcct, p_StatementDate, p_To_C_BankAccount_ID, paymentFrom, p_C_BPartner_ID, p_Description,
                    ctx, trxName);

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

        debitarValores(statement, p_C_Currency_ID, totalAmt, ctx, trxName);

        // @fchiappano Marco el Statement original como transferido.
        statement.set_ValueOfColumn("Transferido", true);
        statement.saveEx();

        return m_transferred;
    } // transferirMovimientosEntreCuentas

    /**
     * Transferir Valores a las Cuentas Bancarias correspondientes, según la forma de pago utilizada.
     * @param C_BankStatement_ID
     * @param ctx
     * @param trxName
     * @return
     */
    public static int transferirValoresPorFormaPago(final int p_BankStatement_ID, final String p_Description,
            final int p_C_BPartner_ID, final Timestamp p_StatementDate, final Timestamp p_DateAcct,
            final Properties ctx, final String trxName)
    {
        int m_tansferred = 0;

        final MBankStatement statement = new MBankStatement(ctx, p_BankStatement_ID, trxName);

        // Obtengo la lista de cuentas bancarias.
        final List<X_LAR_TenderType_BankAccount> cuentasBancarias = getCuentasPorFormaPago(ctx, trxName);

        // Si la lista de cuentas esta vacia, quiere decir que no hay nada por transferir.
        if (cuentasBancarias == null)
            return 0;

        BigDecimal totalAmt = Env.ZERO;
        int p_C_Currency_ID = 0;

        // Reccorro todas las lineas del statement para transferir a una nueva cuenta segun corresponda.
        for (MBankStatementLine linea : statement.getLines(true))
        {
            // Si la linea ya fue transferida, paso a la siguiente.
            if (linea.get_ValueAsBoolean("IsTransferred"))
                continue;

            // De la linea obtengo el pago
            final MPayment pago = (MPayment) linea.getC_Payment();

            // Tomo y guardo, la moneda utilizada en el pago para utilizarla posteriormente.
            p_C_Currency_ID = pago.getC_Currency_ID();

            // Recorro las cuentas bancarias segun forma de pago, y comparo su tenderType con el del pago.
            for (X_LAR_TenderType_BankAccount cuenta : cuentasBancarias)
            {
                if (pago.getTenderType().equals(cuenta.getTenderType()))
                {
                    if (pago.getTenderType().equals("C") || pago.getTenderType().equals("D"))
                    {
                        if (pago.get_ValueAsInt("LAR_Tarjeta_Credito_ID") == cuenta.get_ValueAsInt("LAR_Tarjeta_Credito_ID"))
                        {
                            totalAmt = totalAmt.add(pago.getPayAmt());

                            // Creo el pago en concepto de transferencia.
                            crearPago(p_DateAcct, p_StatementDate, cuenta.getC_BankAccount_ID(), pago, p_C_BPartner_ID,
                                    p_Description, ctx, trxName);

                            // Cuento la linea como transferida.
                            m_tansferred ++;
                            linea.set_ValueOfColumn("IsTransferred", true);
                            linea.saveEx();
                        }
                    }
                    else
                    {
                        totalAmt = totalAmt.add(pago.getPayAmt());

                        crearPago(p_DateAcct, p_StatementDate, cuenta.getC_BankAccount_ID(), pago, p_C_BPartner_ID,
                                p_Description, ctx, trxName);

                        // Cuento la linea como transferida.
                        m_tansferred ++;
                        linea.set_ValueOfColumn("IsTransferred", true);
                        linea.saveEx();
                    }
                }
            }
        }

        if (m_tansferred > 0)
        {
            debitarValores(statement, p_C_Currency_ID, totalAmt, ctx, trxName);

            // Recorro todas las lineas del Statement original, y lo marco como transferido,
            // solo si todas sus lineas fueron transferidas.
            boolean transferido = true;
            for (MBankStatementLine linea : statement.getLines(true))
                if (!linea.get_ValueAsBoolean("IsTransferred"))
                    transferido = false;

            statement.set_ValueOfColumn("Transferido", transferido);
            statement.saveEx();
        }
        return m_tansferred;
    } // transferirValoresPorFormaPago

    /**
     * Obtener todas las cuentas bancarias, establecidas por forma de pago.
     * @param ctx
     * @param trxName
     * @return
     */
    private static List<X_LAR_TenderType_BankAccount> getCuentasPorFormaPago(final Properties ctx, final String trxName)
    {
        final List<X_LAR_TenderType_BankAccount> cuentas = new ArrayList<X_LAR_TenderType_BankAccount>();

        // Busco las cuentas bancarias segun la forma de pago.
        String sql = "SELECT LAR_TenderType_BankAccount_ID"
                   + "  FROM LAR_TenderType_BankAccount";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            pstmt = DB.prepareStatement(sql, null);
            rs = pstmt.executeQuery();
            while (rs.next())
                cuentas.add(new X_LAR_TenderType_BankAccount(ctx, rs.getInt(1), trxName));
        }
        catch (SQLException eSql)
        {
            log.log(Level.SEVERE, sql, eSql);
        }
        finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }
        return cuentas;
    } // getCuentasPorFormaPago

    /**
     * Crear un pago.
     *
     * @param p_DateAcct
     * @param p_StatementDate
     * @param bankAccount_ID
     * @param paymentFrom
     * @param p_C_BPartner_ID
     * @param p_C_Currency_ID
     * @param p_Description
     * @param ctx
     * @param trxName
     */
    private static void crearPago(final Timestamp p_DateAcct, final Timestamp p_StatementDate,
            final int bankAccount_ID, final MPayment paymentFrom, final int p_C_BPartner_ID,
            final String p_Description, final Properties ctx, final String trxName)
    {
        final MPayment payment = new MPayment(ctx, 0, trxName);
        payment.setC_BankAccount_ID(bankAccount_ID);
        payment.setDateAcct(p_DateAcct);
        payment.setDateTrx(p_StatementDate);
        payment.setTenderType(paymentFrom.getTenderType());
        payment.set_ValueOfColumn("LAR_Tarjeta_Credito_ID", paymentFrom.get_ValueAsInt("LAR_Tarjeta_Credito_ID"));
        payment.setDescription(p_Description);
        payment.setC_BPartner_ID(p_C_BPartner_ID);
        payment.setC_Currency_ID(paymentFrom.getC_Currency_ID());
        payment.setPayAmt(paymentFrom.getPayAmt());
        payment.setOverUnderAmt(Env.ZERO);
        payment.setC_DocType_ID(true);
        payment.saveEx();
        payment.processIt(MPayment.DOCACTION_Complete);
        payment.saveEx();
        payment.load(trxName);
    } // crearPago

    /**
     * Crear pago y nuevo Statement que debita los valores transferidos de la cuenta origen.
     *
     * @param statement
     * @param p_C_Currency_ID
     * @param totalAmt
     * @param ctx
     * @param trxName
     */
    private static void debitarValores(final MBankStatement statement, final int p_C_Currency_ID,
            final BigDecimal totalAmt, final Properties ctx, final String trxName)
    {
        // Pago que debita los valores transferidos de la cuenta.
        final MPayment paymentBankFrom = new MPayment(ctx, 0, trxName);
        paymentBankFrom.setC_BankAccount_ID(statement.getC_BankAccount_ID());
        paymentBankFrom.setDateAcct(new Timestamp(System.currentTimeMillis()));
        paymentBankFrom.setDateTrx(new Timestamp(System.currentTimeMillis()));
        paymentBankFrom.setTenderType(MPayment.TENDERTYPE_DirectDeposit);
        paymentBankFrom.setDescription("Pago en concepto de Transferencia de valores.");
        paymentBankFrom.setC_BPartner_ID(new MUser(ctx, Env.getAD_User_ID(ctx), trxName).getC_BPartner_ID());
        paymentBankFrom.setC_Currency_ID(p_C_Currency_ID);
        paymentBankFrom.setPayAmt(totalAmt);
        paymentBankFrom.setOverUnderAmt(Env.ZERO);
        paymentBankFrom.setIsReconciled(true);
        paymentBankFrom.setC_DocType_ID(false);
        paymentBankFrom.saveEx();
        paymentBankFrom.processIt(MPayment.DOCACTION_Complete);
        paymentBankFrom.saveEx();

        final MBankStatement newStmt = new MBankStatement(ctx, 0, trxName);
        newStmt.setC_BankAccount_ID(statement.getC_BankAccount_ID());
        newStmt.setName("Compensacion Transferencia");
        newStmt.setDocStatus(MBankStatement.DOCSTATUS_Drafted);
        // @fchiappano si el Statement original, Es un cierre de caja,
        // marco el nuevo Statement como cierre de caja tambien.
        if (statement.get_ValueAsBoolean("EsCierreCaja"))
        {
            newStmt.set_ValueOfColumn("EsCierreCaja", true);
            // Seteo el Saldo inicial en 0, para que no genere errores en
            // futuros calculos.
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
    } // debitarValores

} // TransaccionCuentaBancaria
