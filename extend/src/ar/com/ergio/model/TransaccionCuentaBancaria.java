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
import org.compiere.model.MSysConfig;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.compiere.util.KeyNamePair;

public class TransaccionCuentaBancaria
{
    /** Logger */
    private static CLogger log = CLogger.getCLogger(TransaccionCuentaBancaria.class);

    // @fchiappano Lista que contiene, los valores a retornar al usuario.
    private static List<KeyNamePair> m_informe;

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
            final int p_From_C_BankAccount_ID, final String p_Description,
            final int p_C_BPartner_ID, final Timestamp p_StatementDate, final Timestamp p_DateAcct,
            final Properties ctx, final String trxName)
    {
        // Contador de lineas tranferidas.
        int m_transferred = 0;

        final MBankStatement statement = new MBankStatement(ctx, p_BankStatement_ID, trxName);
        final MBankAccount mBankTo = new MBankAccount(ctx, statement.getBankAccount().get_ValueAsInt("CajaPrincipal_ID"), trxName);

        BigDecimal cashAmt = BigDecimal.ZERO;
        BigDecimal totalAmt = BigDecimal.ZERO;
        int p_C_Currency_ID = 0;
        int cash_transferred = 0;

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
                cash_transferred ++;
                continue;
            }
            // Transfer other payments
            crearPago(p_DateAcct, p_StatementDate, mBankTo.getC_BankAccount_ID(), paymentFrom, p_C_BPartner_ID, p_Description,
                    ctx, trxName, statement.getC_BankAccount().getAD_Org_ID());

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
            cashBankTo.setLAR_C_DoctType_ID(true, mBankTo.getAD_Org_ID());
            cashBankTo.saveEx();
            cashBankTo.processIt(MPayment.DOCACTION_Complete);
            cashBankTo.saveEx();
        }

        // debitarValores(statement, p_C_Currency_ID, p_C_BPartner_ID, totalAmt, ctx, trxName);

        // @fchiappano Marco el Statement original como transferido.
        statement.set_ValueOfColumn("Transferido", true);
        statement.saveEx();

        return m_transferred + cash_transferred;
    } // transferirMovimientosEntreCuentas

    /**
     * Transferir Valores a las Cuentas Bancarias correspondientes, según la forma de pago utilizada.
     * @param C_BankStatement_ID
     * @param ctx
     * @param trxName
     * @return
     */
    public static KeyNamePair[] transferirValoresPorFormaPago(final MBankStatement statement, final String p_Description,
            final int p_C_BPartner_ID, final Timestamp p_StatementDate, final Timestamp p_DateAcct,
            final Properties ctx, final String trxName)
    {
        m_informe = new ArrayList<KeyNamePair>();
        int p_BankStatement_ID = statement.getC_BankStatement_ID();
        int m_efectivoTransferido = 0;
        int m_chequeTransferido = 0;
        int m_debitoTransferido = 0;
        int m_creditoTransferido = 0;
        int m_depositoTransferido = 0;
        int m_chequeEmitido = 0;
        int m_billeteraDigital = 0;
        int tipoPago = 0;

        // Chequeo si hay tarjetas de Debito y si las mismas tienen una cuenta bancaria configurada.
        tipoPago = comprobarCuentasPorFormaPago(p_BankStatement_ID, "LAR_Tarjeta_Debito_ID");
        if (tipoPago > 0)
        {
            final MLARTarjetaCredito debito = new MLARTarjetaCredito(ctx, tipoPago, trxName);
            return setError(m_informe, "La tarjeta de debito " + debito.getDescription() + ", no posee una cuenta bancaria configurada.");
        }

        // Chequeo si hay tarjetas de Credito y si las mismas tienen una cuenta bancaria configurada.
        tipoPago = comprobarCuentasPorFormaPago(p_BankStatement_ID, "LAR_Tarjeta_Credito_ID");
        if (tipoPago > 0)
        {
            final MLARTarjetaCredito credito = new MLARTarjetaCredito(ctx, tipoPago, trxName);
            return setError(m_informe, "La tarjeta de credito " + credito.getDescription() + ", no posee una cuenta bancaria configurada.");
        }

        // Chequeo si hay Tipos de Deposito y si los mismos tienen una cuenta bancaria configurada.
        tipoPago = comprobarCuentasPorFormaPago(p_BankStatement_ID, "LAR_Deposito_Directo_ID");
        if (tipoPago > 0)
        {
            final MLARTarjetaCredito deposito = new MLARTarjetaCredito(ctx, tipoPago, trxName);
            return setError(m_informe, "El tipo de deposito directo " + deposito.getName() + ", no posee una cuenta bancaria configurada.");
        }

        // @fchiappano Chequear que haya configurada una cuenta para pago con billetera digital.
        tipoPago = comprobarCuentasPorFormaPago(p_BankStatement_ID, "LAR_Quick_Response_ID");
        if (tipoPago > 0)
        {
            final MLARTarjetaCredito billeteraDigital = new MLARTarjetaCredito(ctx, tipoPago, trxName);
            return setError(m_informe, "El tipo de billetera digital " + billeteraDigital.getName()
                    + ", no posee una cuenta bancaria configurada.");
        }

        // Valido que si es una caja de tipo VENTAS, tenga si o si una caja PRINCIPAL asignada.
        if (!statement.getBankAccount().get_ValueAsBoolean("EsCajaPrincipal")
                && statement.getBankAccount().get_ValueAsInt("CajaPrincipal_ID") == 0)
        {
            return setError(m_informe, "La caja de Ventas seleccionada, no posee una caja del tipo Principal/General asignada.");
        }

        BigDecimal cashAmt = BigDecimal.ZERO;
        int p_C_Currency_ID = 0;

        /* @fchiappano Se evita generar un nuevo cierre, ya que no es necesario para rastrear el cierre original.
        // Creo un nuevo Statement, para conciliar los pagos que debitan los valores de la caja.
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
            newStmt.set_ValueOfColumn("ScrutinizedCheckAmt", Env.ZERO);
            newStmt.set_ValueOfColumn("ScrutinizedCashAmt", Env.ZERO);
            newStmt.set_ValueOfColumn("ScrutinizedCreditCardAmt", Env.ZERO);
            newStmt.set_ValueOfColumn("ScrutinizedDirectDebitAmt", Env.ZERO);
        }
        // @fchiappano Marco el nuevo Statement como transferido.
        newStmt.set_ValueOfColumn("Transferido", true);
        newStmt.set_ValueOfColumn("LAR_CierreCaja_Origen_ID", statement.getC_BankStatement_ID());
        newStmt.setStatementDate(p_StatementDate);
        newStmt.saveEx(); */

        // Reccorro todas las lineas del statement para transferir a una nueva cuenta segun corresponda.
        for (MBankStatementLine linea : statement.getLines(true))
        {
            // Si la linea ya fue transferida, paso a la siguiente.
            if (linea.get_ValueAsBoolean("IsTransferred"))
                continue;

            // De la linea obtengo el pago
            final MPayment pago = (MPayment) linea.getC_Payment();

            // Si el pago/cobro, contenido en la linea, no esta en estado
            // completo o cerrado (por anulacion), se continua con la siguiente linea.
            if (!pago.getDocStatus().equals( MPayment.DOCSTATUS_Completed) && !pago.getDocStatus().equals(MPayment.DOCSTATUS_Closed))
                continue;

            MPayment paymentBankTo = null;

            // Tomo y guardo, la moneda utilizada en el pago para utilizarla posteriormente.
            p_C_Currency_ID = pago.getC_Currency_ID();

            final MBankAccount cuentaBancaria = new MBankAccount(ctx, statement.getC_BankAccount_ID(), trxName);

            if (cuentaBancaria.get_ValueAsInt("CajaPrincipal_ID") > 0)
            {
                if (pago.getTenderType().equals(MPayment.TENDERTYPE_Cash)
                        && MSysConfig.getValue("LAR_TransfiereEfectivo_En_CierreDeCajas", Env.getAD_Client_ID(ctx))
                                .equals("Y"))
                {
                    cashAmt = pago.get_ValueAsBoolean("IsReceipt") ? cashAmt.add(pago.getPayAmt()) : cashAmt.add(
                            pago.getPayAmt().negate());
                    linea.set_ValueOfColumn("IsTransferred", true);
                    linea.saveEx();
                    m_efectivoTransferido ++;
                    continue;
                }
                else if (pago.getTenderType().equals(MPayment.TENDERTYPE_Check) | pago.getTenderType().equals("Z")
                        && pago.get_ValueAsBoolean("IsReceipt") && pago.get_ValueAsBoolean("IsOnDrawer"))
                {

                    paymentBankTo = crearPago(p_DateAcct, p_StatementDate,
                            cuentaBancaria.get_ValueAsInt("CajaPrincipal_ID"), pago, p_C_BPartner_ID, p_Description,
                            ctx, trxName, statement.getC_BankAccount().getAD_Org_ID());

                    // Desmarco el pago como en cartera.
                    pago.set_ValueOfColumn("IsOnDrawer", false);
                    pago.saveEx();

                    m_chequeTransferido ++;
                }
            }
            if (pago.getTenderType().equals(MPayment.TENDERTYPE_CreditCard))
            {
                paymentBankTo = crearPago(pago.getDateAcct(), pago.getDateTrx(),
                        getCuentaPorFormaPago("LAR_Tarjeta_Credito_ID", pago.get_ValueAsInt("LAR_Tarjeta_Credito_ID")),
                        pago, p_C_BPartner_ID, p_Description, ctx, trxName, statement.getC_BankAccount().getAD_Org_ID());

                m_creditoTransferido++;
            }
            else if (pago.getTenderType().equals(MPayment.TENDERTYPE_DirectDebit))
            {
                paymentBankTo = crearPago(pago.getDateAcct(), pago.getDateTrx(),
                        getCuentaPorFormaPago("LAR_Tarjeta_Debito_ID", pago.get_ValueAsInt("LAR_Tarjeta_Debito_ID")),
                        pago, p_C_BPartner_ID, p_Description, ctx, trxName, statement.getC_BankAccount().getAD_Org_ID());

                m_debitoTransferido++;
            }
            else if (pago.getTenderType().equals(MPayment.TENDERTYPE_DirectDeposit))
            {
                paymentBankTo = crearPago(
                        pago.getDateAcct(),
                        pago.getDateTrx(),
                        getCuentaPorFormaPago("LAR_Deposito_Directo_ID", pago.get_ValueAsInt("LAR_Deposito_Directo_ID")),
                        pago, p_C_BPartner_ID, p_Description, ctx, trxName, statement.getC_BankAccount().getAD_Org_ID());

                m_depositoTransferido++;
            }
            else if (pago.getTenderType().equals(MPayment.TENDERTYPE_Check) &&
                    !pago.isReceipt() && pago.get_ValueAsInt("LAR_Cheque_Emitido_ID") > 0)
            {
                paymentBankTo = crearPago(pago.getDateAcct(), pago.getDateTrx(),
                        getCuentaPorFormaPago("LAR_Cheque_Emitido_ID", pago.get_ValueAsInt("LAR_Cheque_Emitido_ID")),
                        pago, p_C_BPartner_ID, p_Description, ctx, trxName, statement.getC_BankAccount().getAD_Org_ID());

                m_chequeEmitido ++;
            }
            // @fchiappano Transferir movimiento con billetera digital
            else if (pago.getTenderType().equals("Q"))
            {
                paymentBankTo = crearPago(pago.getDateAcct(), pago.getDateTrx(),
                        getCuentaPorFormaPago("LAR_Quick_Response_ID", pago.get_ValueAsInt("LAR_Quick_Response_ID")),
                        pago, p_C_BPartner_ID, p_Description, ctx, trxName,
                        statement.getC_BankAccount().getAD_Org_ID());

                m_billeteraDigital ++;
            }
            // Guardo y completo el cobro en la caja destino.
            if (paymentBankTo != null)
            {
                paymentBankTo.saveEx();
                paymentBankTo.processIt(MPayment.DOCACTION_Complete);
                paymentBankTo.saveEx();

                // @fchiappano debitar valor de la caja.
                String mensaje = debitarValores(statement, p_C_BPartner_ID, ctx, trxName, pago);

                if (mensaje != null)
                    return setError(m_informe, mensaje);
            }
            // @fchiappano Si no se genero el cobro transferencia, verificar que no haya errores.
            else if (m_informe.size() > 0)
                return m_informe.toArray(new KeyNamePair[m_informe.size()]);
        }

        if (cashAmt.compareTo(BigDecimal.ZERO) > 0)
        {
            final MPayment cashBankTo = new MPayment(ctx, 0, trxName);
            final MBankAccount cuentaBancaria = new MBankAccount(ctx, statement.getC_BankAccount_ID(), trxName);
            cashBankTo.setC_BankAccount_ID(cuentaBancaria.get_ValueAsInt("CajaPrincipal_ID"));
            cashBankTo.setDateAcct(p_DateAcct);
            cashBankTo.setDateTrx(p_StatementDate);
            cashBankTo.setTenderType(MPayment.TENDERTYPE_Cash);
            cashBankTo.setDescription(p_Description);
            cashBankTo.setC_BPartner_ID(p_C_BPartner_ID);
            cashBankTo.setC_Currency_ID(p_C_Currency_ID);
            cashBankTo.setPayAmt(cashAmt);
            cashBankTo.setPosted(true);
            cashBankTo.setOverUnderAmt(Env.ZERO);
            if (!cashBankTo.setLAR_C_DoctType_ID(true, cuentaBancaria.getAD_Org_ID()))
                return setError(m_informe, "No fue posible, recuperar un tipo de documento valido para cobros.");
            cashBankTo.setIsReceipt(true);
            cashBankTo.saveEx();
            cashBankTo.processIt(MPayment.DOCACTION_Complete);
            cashBankTo.saveEx();

            // Creo el pago, que debita todo el efectivo transferido.
            String mensaje = debitarValores(statement, p_C_BPartner_ID, ctx, trxName, cashBankTo);

            if (mensaje != null)
                return setError(m_informe, mensaje);

            // @fchiappano vincular el mov. de transferencia en efectivo, al cierre de caja.
            statement.set_ValueOfColumn("CobroEfectivo_ID", cashBankTo.getC_Payment_ID());

            // Sumo el cashAmt al totalAmt para debitar el total de los valores posteriormente.
            // totalAmt = totalAmt.add(cashAmt);
        }

        if (m_chequeTransferido > 0 || m_creditoTransferido > 0 || m_debitoTransferido > 0 || m_depositoTransferido > 0
                || m_efectivoTransferido > 0 || m_chequeEmitido > 0)
        {
            statement.set_ValueOfColumn("Transferido", true);
            statement.saveEx();

            /* @fchiappano Se evita generar un nuevo cierre, ya que no es necesario para rastrear el cierre original.
            // process new statement
            newStmt.processIt(MBankStatement.DOCACTION_Complete);
            newStmt.saveEx(); */
        }

        m_informe.add(new KeyNamePair(m_chequeTransferido + m_creditoTransferido + m_debitoTransferido
                + m_depositoTransferido + m_efectivoTransferido + m_chequeEmitido, "Total"));
        m_informe.add(new KeyNamePair(m_efectivoTransferido, "Efectivo"));
        m_informe.add(new KeyNamePair(m_chequeTransferido, "Cheques"));
        m_informe.add(new KeyNamePair(m_creditoTransferido, "Tarjetas de Credito"));
        m_informe.add(new KeyNamePair(m_debitoTransferido, "Tarjetas de Debito"));
        m_informe.add(new KeyNamePair(m_depositoTransferido, "Depositos Directos"));
        m_informe.add(new KeyNamePair(m_billeteraDigital, "Billetera Digital"));
        m_informe.add(new KeyNamePair(m_chequeEmitido, "Cheques Emitidos"));

        return m_informe.toArray(new KeyNamePair[m_informe.size()]);
    } // transferirValoresPorFormaPago

    /**
     * Obtener la cuenta bancaria configurada, según la forma de pago.
     * @param ctx
     * @param trxName
     * @return
     */
    private static int getCuentaPorFormaPago(final String nombreColumna, final int tipoPago_ID)
    {
        int cuenta = 0;

        // Busco las cuentas bancarias segun la forma de pago.
        String sql = "SELECT C_BankAccount_ID"
                   + "  FROM LAR_TenderType_BankAccount"
                   + " WHERE " + nombreColumna + "=?";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            pstmt = DB.prepareStatement(sql, null);
            pstmt.setInt(1, tipoPago_ID);
            rs = pstmt.executeQuery();
            if (rs.next())
                cuenta = rs.getInt("C_BankAccount_ID");
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
        return cuenta;
    } // getCuentaPorFormaPago

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
    private static MPayment crearPago(final Timestamp p_DateAcct, final Timestamp p_StatementDate,
            final int bankAccount_ID, final MPayment paymentFrom, final int p_C_BPartner_ID,
            final String p_Description, final Properties ctx, final String trxName, final int ad_Org_ID)
    {
        final MPayment payment = new MPayment(ctx, 0, trxName);
        MPayment.copyValues(paymentFrom, payment);
        final MBankAccount destino = new MBankAccount(ctx, bankAccount_ID, trxName);
        payment.set_ValueOfColumn("LAR_PaymentHeader_ID", null);
        payment.setC_BankAccount_ID(bankAccount_ID);
        payment.setDateAcct(p_DateAcct);
        payment.setDateTrx(p_StatementDate);
        payment.setDescription(p_Description);
        payment.setC_BPartner_ID(p_C_BPartner_ID);
        payment.setPosted(true);

        if (!payment.setLAR_C_DoctType_ID(paymentFrom.isReceipt(),
                destino.get_ValueAsBoolean("IsDrawer") ? destino.getAD_Org_ID() : ad_Org_ID))
        {
            setError(m_informe, "No fue posible recuperar un tipo de documento valido para Movimientos de Transferencias.");
            return null;
        }
        payment.set_ValueOfColumn("LAR_PaymentSource_ID", paymentFrom.getC_Payment_ID());

        return payment;
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
    private static String debitarValores(final MBankStatement statement, final int p_C_BPartner_ID,
            final Properties ctx, final String trxName, final MPayment cobro)
    {
        // Pago que debita los valores transferidos de la cuenta.
        final MPayment paymentBankFrom = new MPayment(ctx, 0, trxName);
        MPayment.copyValues(cobro, paymentBankFrom);
        paymentBankFrom.set_ValueOfColumn("LAR_PaymentHeader_ID", null);
        paymentBankFrom.setC_BankAccount_ID(statement.getC_BankAccount_ID());
        paymentBankFrom.setDateAcct(statement.getStatementDate());
        paymentBankFrom.setDateTrx(statement.getStatementDate());
        paymentBankFrom.setDescription("Pago en concepto de Transferencia de valores.");
        paymentBankFrom.setC_BPartner_ID(p_C_BPartner_ID);
        if (!cobro.isReceipt())
            paymentBankFrom.setPayAmt(cobro.getPayAmt().negate());
        paymentBankFrom.setIsReconciled(true);
        paymentBankFrom.setPosted(true);
        paymentBankFrom.set_ValueOfColumn("LAR_PaymentSource_ID", cobro.getC_Payment_ID());

        if (!paymentBankFrom.setLAR_C_DoctType_ID(false, statement.getC_BankAccount().getAD_Org_ID()))
            return "No fue posible recuperar un tipo de documento valido para pagos.";

        paymentBankFrom.saveEx();
        paymentBankFrom.processIt(MPayment.DOCACTION_Complete);
        paymentBankFrom.saveEx();

        // Setear el pago como IsReconciled.
        setReconciled(paymentBankFrom.getC_Payment_ID(), trxName);

        return null;

        /* @fchiappano Se evita generar un nuevo cierre, ya que no es necesario para rastrear el cierre original.
        final MBankStatementLine newLine = new MBankStatementLine(newStmt);
        newLine.setC_Currency_ID(paymentBankFrom.getC_Currency_ID());
        newLine.setC_Payment_ID(paymentBankFrom.getC_Payment_ID());
        newLine.setLine(10);
        newLine.set_ValueOfColumn("IsTransferred", true);
        newLine.set_ValueOfColumn("TrxAmt", paymentBankFrom.getPayAmt().negate());
        newLine.set_ValueOfColumn("StmtAmt", paymentBankFrom.getPayAmt().negate());
        newLine.saveEx(); */
    } // debitarValores

    /**
     * Comprobar, si alguna forma de pago no posee cuenta bancaria configurada.
     * 
     * @param c_BankStatement_ID
     * @param nombreColumna
     * @return 0 si la configuracion esta correcta; formaPago_ID si es que la
     *         forma de pago no posee una cuenta bancaria configurada.
     */
    private static int comprobarCuentasPorFormaPago(final int c_BankStatement_ID, final String nombreColumna)
    {
        String sql = "SELECT DISTINCT(p." + nombreColumna + ")"
                   + "  FROM C_BankStatementLine sl JOIN C_Payment p ON sl.C_Payment_ID = p.C_Payment_ID"
                   + " WHERE sl.C_BankStatement_ID=?";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            pstmt = DB.prepareStatement(sql, null);
            pstmt.setInt(1, c_BankStatement_ID);
            rs = pstmt.executeQuery();

            while (rs.next())
            {
                if (rs.getInt(1) != 0)
                {
                    final int tipoPago_ID = rs.getInt(1);
                    PreparedStatement pstmt2 = null;
                    ResultSet rs2 = null;

                    sql = "SELECT LAR_TenderType_BankAccount_ID"
                        + "  FROM LAR_TenderType_BankAccount"
                        + " WHERE " + nombreColumna + "=?";

                    pstmt = DB.prepareStatement(sql, null);
                    pstmt.setInt(1, tipoPago_ID);
                    rs2 = pstmt.executeQuery();

                    if (!rs2.next())
                        return tipoPago_ID;

                    DB.close(rs2, pstmt2);
                }
            }
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

        return 0;
    } // comprobarCuentasPorFormaPago

    /**
     * Guardar mensaje de error.
     * @return 
     */
    private static KeyNamePair[] setError(List<KeyNamePair> lista, final String mensaje)
    {
        lista.add(new KeyNamePair(0, "Error"));
        lista.add(new KeyNamePair(0, mensaje));
        return lista.toArray(new KeyNamePair[lista.size()]);
    } // setError

    /**
     * Setear por base de datos, isReconciled = true, para evitar las validaciones en el validador de LAR.
     * @param c_Payment_ID
     * @param trxName
     */
    private static void setReconciled(final int c_Payment_ID, final String trxName)
    {
        String sql = "UPDATE C_Payment SET isReconciled = 'Y' WHERE C_Payment_ID = " + c_Payment_ID;
        DB.executeUpdate(sql, trxName);
    } // setReconciled

} // TransaccionCuentaBancaria
