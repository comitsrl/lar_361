/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved.                *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
package org.compiere.model;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.util.DB;
import org.compiere.util.Env;
import org.compiere.util.Msg;

import ar.com.ergio.model.MLARPaymentHeader;
import ar.com.ergio.util.LAR_Utils;

/**
 * Payment Callouts. org.compiere.model.CalloutPayment.*
 * 
 * @author Jorg Janke
 * @version $Id: CalloutPayment.java,v 1.3 2006/07/30 00:51:03 jjanke Exp $
 * @author Teo Sarca, SC ARHIPAC SERVICE SRL <li>BF [ 1803316 ] CalloutPayment: use
 *         C_Order.Bill_BPartner_ID
 * @author j2garcia - GlobalQSS <li>BF [ 2021745 ] Cannot assign project to payment with charge
 * @author Carlos Ruiz - GlobalQSS <li>BF [ 1933948 ] CalloutPayment working just with Draft
 *         Status
 */
public class CalloutPayment extends CalloutEngine
{

    /**
     * Payment_Invoice. when Invoice selected - set C_Currency_ID - C_BPartner_ID - DiscountAmt
     * = C_Invoice_Discount (ID, DateTrx) - PayAmt = invoiceOpen (ID) - Discount - WriteOffAmt
     * = 0
     * 
     * @param ctx
     *        context
     * @param WindowNo
     *        current Window No
     * @param mTab
     *        Grid Tab
     * @param mField
     *        Grid Field
     * @param value
     *        New Value
     * @return null or error message
     */
    public String invoice(Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value)
    {
        // german custom
        // {
        Object o = mTab.getValue("LAR_PaymentSource_ID");
        boolean ofpi = false;
        if ((o != null) && (new Integer(o.toString()) > 0))
            ofpi = true;
        BigDecimal payAmt = (BigDecimal) mTab.getValue("PayAmt");
        GridField oup = mTab.getField("IsOverUnderPayment");
        // } end german custom
        Integer C_Invoice_ID = (Integer) value;
        if (isCalloutActive() // assuming it is resetting value
                || C_Invoice_ID == null || C_Invoice_ID.intValue() == 0)
            return "";
        mTab.setValue("C_Order_ID", null);
        mTab.setValue("C_Charge_ID", null);
        mTab.setValue("IsPrepayment", Boolean.FALSE);
        //
        mTab.setValue("DiscountAmt", Env.ZERO);
        mTab.setValue("WriteOffAmt", Env.ZERO);
        // mTab.setValue ("IsOverUnderPayment", Boolean.FALSE);
        mTab.setValue("OverUnderAmt", Env.ZERO);
        int C_InvoicePaySchedule_ID = 0;
        if (Env.getContextAsInt(ctx, WindowNo, Env.TAB_INFO, "C_Invoice_ID") == C_Invoice_ID
                .intValue()
                && Env.getContextAsInt(ctx, WindowNo, Env.TAB_INFO, "C_InvoicePaySchedule_ID") != 0)
        {
            C_InvoicePaySchedule_ID = Env.getContextAsInt(ctx, WindowNo, Env.TAB_INFO,
                    "C_InvoicePaySchedule_ID");
        }
        // Payment Date
        Timestamp ts = (Timestamp) mTab.getValue("DateTrx");
        if (ts == null)
            ts = new Timestamp(System.currentTimeMillis());
        //
        String sql = "SELECT C_BPartner_ID,C_Currency_ID," // 1..2
                + " invoiceOpen(C_Invoice_ID, ?)," // 3 #1
                + " invoiceDiscount(C_Invoice_ID,?,?), IsSOTrx " // 4..5 #2/3
                + "FROM C_Invoice WHERE C_Invoice_ID=?"; // #4
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            pstmt = DB.prepareStatement(sql, null);
            pstmt.setInt(1, C_InvoicePaySchedule_ID);
            pstmt.setTimestamp(2, ts);
            pstmt.setInt(3, C_InvoicePaySchedule_ID);
            pstmt.setInt(4, C_Invoice_ID.intValue());
            rs = pstmt.executeQuery();
            if (rs.next())
            {
                if (!ofpi)// German custom
                    mTab.setValue("C_BPartner_ID", new Integer(rs.getInt(1)));
                int C_Currency_ID = rs.getInt(2); // Set Invoice Currency
                if (!ofpi)// German custom
                    mTab.setValue("C_Currency_ID", new Integer(C_Currency_ID));
                //
                BigDecimal InvoiceOpen = rs.getBigDecimal(3); // Set Invoice

                // @emmie custom
                // Avoid null pointer exception when not working on a Header
                int LAR_PaymentHeader_ID = 0;
                if (mTab.getValue("LAR_PaymentHeader_ID") != null)
                    LAR_PaymentHeader_ID = (Integer) mTab.getValue("LAR_PaymentHeader_ID");
                if (InvoiceOpen != null && LAR_PaymentHeader_ID != 0)
                {
                    // Retrieve existing payments and writeoff for this invoice
                    sql = "SELECT COALESCE(Sum(PayAmt),0) + COALESCE(Sum(WriteOffAmt),0)"
                            + "  FROM C_Payment WHERE LAR_PaymentHeader_ID = ?";

                    BigDecimal existsAmt = DB.getSQLValueBD(null, sql, LAR_PaymentHeader_ID);
                    if (existsAmt != null && existsAmt.compareTo(InvoiceOpen) == 0)
                        return Msg.translate(Env.getCtx(), "PaymentNotAllowed");
                    if (existsAmt != null && existsAmt.compareTo(Env.ZERO) > 0)
                        InvoiceOpen = InvoiceOpen.subtract(existsAmt);
                }
                // @emmie custom

                // OPen Amount
                if (InvoiceOpen == null)
                    InvoiceOpen = Env.ZERO;
                BigDecimal DiscountAmt = rs.getBigDecimal(4); // Set Discount
                // Amt
                if (DiscountAmt == null)
                    DiscountAmt = Env.ZERO;
                if (!ofpi)// German custom
                    mTab.setValue("PayAmt", InvoiceOpen.subtract(DiscountAmt));

                /*
                 * @mzuniga - Se evita que se genere un "falso" OverUnderPayment cuando se
                 * trabaja con PaymentTerm
                 * if(InvoiceOpen.subtract(DiscountAmt).compareTo(payAmt)!=0) //German custom {
                 * //German custom mTab.setValue ("IsOverUnderPayment" , Boolean.TRUE);
                 * //German custom amounts(ctx, WindowNo, mTab, oup, Boolean.TRUE,
                 * oup.getValue());//German custom } //German custom
                 */

                mTab.setValue("DiscountAmt", DiscountAmt);
                // reset as dependent fields get reset
                Env.setContext(ctx, WindowNo, "C_Invoice_ID", C_Invoice_ID.toString());
                mTab.setValue("C_Invoice_ID", C_Invoice_ID);
            }
        } catch (SQLException e)
        {
            log.log(Level.SEVERE, sql, e);
            return e.getLocalizedMessage();
        } finally
        {
            DB.close(rs, pstmt);
        }
        return docType(ctx, WindowNo, mTab, mField, value);
    } // invoice

    /**
     * Payment_Order. when Waiting Payment Order selected - set C_Currency_ID - C_BPartner_ID -
     * DiscountAmt = C_Invoice_Discount (ID, DateTrx) - PayAmt = invoiceOpen (ID) - Discount -
     * WriteOffAmt = 0
     * 
     * @param ctx
     *        context
     * @param WindowNo
     *        current Window No
     * @param mTab
     *        Grid Tab
     * @param mField
     *        Grid Field
     * @param value
     *        New Value
     * @return null or error message
     */
    public String order(Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value)
    {
        // German custom
        // {
        Object o = mTab.getValue("LAR_PaymentSource_ID");
        boolean ofpi = false;
        if ((o != null) && (new Integer(o.toString()) > 0))
            ofpi = true;
        BigDecimal payAmt = (BigDecimal) mTab.getValue("PayAmt");

        GridField oup = mTab.getField("IsOverUnderPayment");
        // }
        Integer C_Order_ID = (Integer) value;
        if (isCalloutActive() // assuming it is resetting value
                || C_Order_ID == null || C_Order_ID.intValue() == 0)
            return "";
        mTab.setValue("C_Invoice_ID", null);
        mTab.setValue("C_Charge_ID", null);
        mTab.setValue("IsPrepayment", Boolean.TRUE);
        //
        mTab.setValue("DiscountAmt", Env.ZERO);
        mTab.setValue("WriteOffAmt", Env.ZERO);
        mTab.setValue("IsOverUnderPayment", Boolean.FALSE);
        mTab.setValue("OverUnderAmt", Env.ZERO);
        // Payment Date
        Timestamp ts = (Timestamp) mTab.getValue("DateTrx");
        if (ts == null)
            ts = new Timestamp(System.currentTimeMillis());
        //
        String sql = "SELECT COALESCE(Bill_BPartner_ID, C_BPartner_ID) as C_BPartner_ID "
                + ", C_Currency_ID " + ", GrandTotal " + "FROM C_Order WHERE C_Order_ID=?"; // #1
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            pstmt = DB.prepareStatement(sql, null);
            pstmt.setInt(1, C_Order_ID.intValue());
            rs = pstmt.executeQuery();
            if (rs.next())
            {
                if (!ofpi)// German custom
                    mTab.setValue("C_BPartner_ID", new Integer(rs.getInt(1)));
                int C_Currency_ID = rs.getInt(2); // Set Order Currency
                if (!ofpi)// German custom
                    mTab.setValue("C_Currency_ID", new Integer(C_Currency_ID));
                //
                BigDecimal GrandTotal = rs.getBigDecimal(3); // Set Pay
                // Amount
                if (GrandTotal == null)
                    GrandTotal = Env.ZERO;
                if (!ofpi)// German custom
                    mTab.setValue("PayAmt", GrandTotal);

                if (GrandTotal.compareTo(payAmt) != 0) // German custom
                { // German custom
                    mTab.setValue("IsOverUnderPayment", Boolean.TRUE); // German custom
                    amounts(ctx, WindowNo, mTab, oup, Boolean.TRUE, oup.getValue());// German
                                                                                    // custom
                } // German custom
            }
        } catch (SQLException e)
        {
            log.log(Level.SEVERE, sql, e);
            return e.getLocalizedMessage();
        } finally
        {
            DB.close(rs, pstmt);
        }
        return docType(ctx, WindowNo, mTab, mField, value);
    } // order

    // 2008/07/18 Globalqss [ 2021745 ]
    // Deleted project method

    /**
     * Payment_Charge. - reset - C_BPartner_ID, Invoice, Order, Project, Discount, WriteOff
     * 
     * @param ctx
     *        context
     * @param WindowNo
     *        current Window No
     * @param mTab
     *        Grid Tab
     * @param mField
     *        Grid Field
     * @param value
     *        New Value
     * @return null or error message
     */
    public String charge(Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value)
    {
        Integer C_Charge_ID = (Integer) value;
        if (isCalloutActive() // assuming it is resetting value
                || C_Charge_ID == null || C_Charge_ID.intValue() == 0)
            return "";
        mTab.setValue("C_Invoice_ID", null);
        mTab.setValue("C_Order_ID", null);
        // 2008/07/18 Globalqss [ 2021745 ]
        // mTab.setValue ("C_Project_ID", null);
        mTab.setValue("IsPrepayment", Boolean.FALSE);
        //
        mTab.setValue("DiscountAmt", Env.ZERO);
        mTab.setValue("WriteOffAmt", Env.ZERO);
        mTab.setValue("IsOverUnderPayment", Boolean.FALSE);
        mTab.setValue("OverUnderAmt", Env.ZERO);
        return "";
    } // charge

    /**
     * Payment_Document Type. Verify that Document Type (AP/AR) and Invoice (SO/PO) are in sync
     * 
     * @param ctx
     *        context
     * @param WindowNo
     *        current Window No
     * @param mTab
     *        Grid Tab
     * @param mField
     *        Grid Field
     * @param value
     *        New Value
     * @return null or error message
     */
    public String docType(Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value)
    {
        int C_Invoice_ID = Env.getContextAsInt(ctx, WindowNo, "C_Invoice_ID");
        int C_Order_ID = Env.getContextAsInt(ctx, WindowNo, "C_Order_ID");
        int C_DocType_ID = Env.getContextAsInt(ctx, WindowNo, "C_DocType_ID");
        log.fine("Payment_DocType - C_Invoice_ID=" + C_Invoice_ID + ", C_DocType_ID="
                + C_DocType_ID);
        MDocType dt = null;
        if (C_DocType_ID != 0)
        {
            dt = MDocType.get(ctx, C_DocType_ID);
            Env.setContext(ctx, WindowNo, "IsSOTrx", dt.isSOTrx() ? "Y" : "N");
        }
        // Invoice
        if (C_Invoice_ID != 0)
        {
            MInvoice inv = new MInvoice(ctx, C_Invoice_ID, null);
            if (dt != null)
            {
                if (inv.isSOTrx() != dt.isSOTrx())
                    return "PaymentDocTypeInvoiceInconsistent";
            }
        }
        // globalqss - Allow prepayment to Purchase Orders
        // Order Waiting Payment (can only be SO)
        // if (C_Order_ID != 0 && dt != null && !dt.isSOTrx())
        // return "PaymentDocTypeInvoiceInconsistent";
        // Order
        if (C_Order_ID != 0)
        {
            MOrder ord = new MOrder(ctx, C_Order_ID, null);
            if (dt != null)
            {
                if (ord.isSOTrx() != dt.isSOTrx())
                    return "PaymentDocTypeInvoiceInconsistent";
            }
        }
        return "";
    } // docType

    /**
     * Payment_Amounts. Change of: - IsOverUnderPayment -> set OverUnderAmt to 0 -
     * C_Currency_ID, C_ConvesionRate_ID -> convert all - PayAmt, DiscountAmt, WriteOffAmt,
     * OverUnderAmt -> PayAmt make sure that add up to InvoiceOpenAmt
     * 
     * @param ctx
     *        context
     * @param WindowNo
     *        current Window No
     * @param mTab
     *        Grid Tab
     * @param mField
     *        Grid Field
     * @param value
     *        New Value
     * @param oldValue
     *        Old Value
     * @return null or error message
     */
    public String amounts(Properties ctx, int WindowNo, GridTab mTab, GridField mField,
            Object value, Object oldValue)
    {
        if (isCalloutActive()) // assuming it is resetting value
            return "";

        // german custom
        // {
        Object o = mTab.getValue("LAR_PaymentSource_ID");
        boolean ofpi = false;
        if ((o != null) && (new Integer(o.toString()) > 0))
            ofpi = true;
        // } end german custom

        int C_Invoice_ID = Env.getContextAsInt(ctx, WindowNo, "C_Invoice_ID");
        int LAR_PaymentHeader_ID = Env.getContextAsInt(ctx, WindowNo, "LAR_PaymentHeader_ID");
        // New Payment
        if (Env.getContextAsInt(ctx, WindowNo, "C_Payment_ID") == 0
                && Env.getContextAsInt(ctx, WindowNo, "C_BPartner_ID") == 0 && C_Invoice_ID == 0)
            return "";

        // Varias Facturas -> Varios Pagos/Cobros
        // Sugerir el monto del pago/cobro teniendo en cuenta las facturas
        // y los pagos/cobros cargados bajo la cabecera
        if ((Env.getContextAsInt(ctx, WindowNo, "C_Payment_ID") == 0)
                && (mTab.getValue("PayAmt").equals(Env.ZERO)))
        {
            // Recuperar información de las facturas
            List<MPaymentAllocate> invoices = getInvoices(ctx, LAR_PaymentHeader_ID);

            String sql = "";
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            if (!invoices.isEmpty())
            {
                MPaymentAllocate[] facturas = invoices
                        .toArray(new MPaymentAllocate[invoices.size()]);
                BigDecimal sumaFacturas = Env.ZERO;
                BigDecimal sumaDescuento = Env.ZERO;
                int c_Currency_ID = 0;
                // Recorrer facturas
                for (int i = 0; i < facturas.length; i++)
                {
                    // @fchiappano Obtengo la moneda de la factura, para
                    // determinar posteriormente si el monto sugerido necesita conversión.
                    c_Currency_ID = facturas[i].getC_Invoice().getC_Currency_ID();

                    // @fchiappano. Obtengo el C_InvoicePaySchedule_ID para calcular el importe impago.
                    int c_InvoicePaySchedule_ID = facturas[i].get_ValueAsInt("C_InvoicePaySchedule_ID");

                    sql = "SELECT" + " invoiceOpen(C_Invoice_ID,?)" // 1
                            + " FROM C_Invoice WHERE C_Invoice_ID=?"; // 2

                    try
                    {
                        pstmt = DB.prepareStatement(sql, null);
                        pstmt.setInt(1, c_InvoicePaySchedule_ID);
                        pstmt.setInt(2, facturas[i].getC_Invoice_ID());
                        rs = pstmt.executeQuery();
                        if (rs.next())
                        {
                            BigDecimal InvoiceOpenAmt = rs.getBigDecimal(1); // Importe Impago
                            if (InvoiceOpenAmt == null)
                                InvoiceOpenAmt = Env.ZERO;

                            sumaFacturas = sumaFacturas.add(InvoiceOpenAmt);
                            sumaDescuento = facturas[i].getDiscountAmt();
                        }
                    } catch (SQLException e)
                    {
                        log.log(Level.SEVERE, sql, e);
                        return e.getLocalizedMessage();
                    } finally
                    {
                        DB.close(rs, pstmt);
                        rs = null;
                        pstmt = null;
                    }
                } // Recorrer facturas

                // Recorrer Pagos/Cobros
                List<MPayment> payments = getPayments(ctx, LAR_PaymentHeader_ID);

                MPayment[] pagos = payments.toArray(new MPayment[payments.size()]);
                BigDecimal sumaPagos = Env.ZERO;
                // Recorrer Pagos
                for (int p = 0; p < pagos.length; p++)
                    sumaPagos = sumaPagos.add(pagos[p].getPayAmt().add(pagos[p].getWriteOffAmt()));

                // @fchiappano Determinar si se debe convertir el monto sugerido.
                if (c_Currency_ID > 0 && c_Currency_ID != LAR_Utils.getMonedaPredeterminada(ctx, Env.getAD_Client_ID(ctx), mTab.getTrxInfo()))
                {
                    // @fchiappano Obtener tasa de cambio.
                    MLARPaymentHeader header = new MLARPaymentHeader(ctx, LAR_PaymentHeader_ID, mTab.getTrxInfo());
                    BigDecimal tasaCambio = (BigDecimal) header.get_Value("TasaDeCambio");

                    if (tasaCambio != null)
                    {
                        sumaFacturas = sumaFacturas.multiply(tasaCambio).setScale(2, RoundingMode.HALF_UP);
                        sumaDescuento = sumaDescuento.multiply(tasaCambio).setScale(2, RoundingMode.HALF_UP);
                    }
                    else
                        return "No se logro recuperar, una tasa de cambio.";
                }

                mTab.setValue("PayAmt", sumaFacturas.subtract(sumaPagos).subtract(sumaDescuento));
                mTab.setValue("OverUnderAmt", Env.ZERO);
                return "";
            }
        } // Varias Facturas -> Varios Pagos/Cobros

        // Changed Column
        String colName = mField.getColumnName();
        if (colName.equals("IsOverUnderPayment") // Set Over/Under Amt to
                // Zero
                || !"Y".equals(Env.getContext(ctx, WindowNo, "IsOverUnderPayment")))
            mTab.setValue("OverUnderAmt", Env.ZERO);
        int C_InvoicePaySchedule_ID = 0;
        if (Env.getContextAsInt(ctx, WindowNo, Env.TAB_INFO, "C_Invoice_ID") == C_Invoice_ID
                && Env.getContextAsInt(ctx, WindowNo, Env.TAB_INFO, "C_InvoicePaySchedule_ID") != 0)
        {
            C_InvoicePaySchedule_ID = Env.getContextAsInt(ctx, WindowNo, Env.TAB_INFO,
                    "C_InvoicePaySchedule_ID");
        }
        // Get Open Amount & Invoice Currency
        BigDecimal InvoiceOpenAmt = Env.ZERO;
        int C_Currency_Invoice_ID = 0;
        if (C_Invoice_ID != 0)
        {
            Timestamp ts = (Timestamp) mTab.getValue("DateTrx");
            if (ts == null)
                ts = new Timestamp(System.currentTimeMillis());
            String sql = "SELECT C_BPartner_ID,C_Currency_ID," // 1..2
                    + " invoiceOpen(C_Invoice_ID,?)," // 3 #1
                    + " invoiceDiscount(C_Invoice_ID,?,?), IsSOTrx " // 4..5 #2/3
                    + "FROM C_Invoice WHERE C_Invoice_ID=?"; // #4
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try
            {
                pstmt = DB.prepareStatement(sql, null);
                pstmt.setInt(1, C_InvoicePaySchedule_ID);
                pstmt.setTimestamp(2, ts);
                pstmt.setInt(3, C_InvoicePaySchedule_ID);
                pstmt.setInt(4, C_Invoice_ID);
                rs = pstmt.executeQuery();
                if (rs.next())
                {
                    C_Currency_Invoice_ID = rs.getInt(2);
                    InvoiceOpenAmt = rs.getBigDecimal(3); // Set Invoice Open
                    // Amount
                    if (InvoiceOpenAmt == null)
                        InvoiceOpenAmt = Env.ZERO;
                }
            } catch (SQLException e)
            {
                log.log(Level.SEVERE, sql, e);
                return e.getLocalizedMessage();
            } finally
            {
                DB.close(rs, pstmt);
                rs = null;
                pstmt = null;
            }
        } // get Invoice Info
        log.fine("Open=" + InvoiceOpenAmt + ", C_Invoice_ID=" + C_Invoice_ID + ", C_Currency_ID="
                + C_Currency_Invoice_ID);
        // Get Info from Tab
        BigDecimal PayAmt = (BigDecimal) mTab.getValue("PayAmt");
        BigDecimal DiscountAmt = (BigDecimal) mTab.getValue("DiscountAmt");
        BigDecimal WriteOffAmt = (BigDecimal) mTab.getValue("WriteOffAmt");
        BigDecimal OverUnderAmt = (BigDecimal) mTab.getValue("OverUnderAmt");
        // @marcos custom
        PayAmt = PayAmt == null ? BigDecimal.ZERO : PayAmt;
        DiscountAmt = DiscountAmt == null ? BigDecimal.ZERO : DiscountAmt;
        WriteOffAmt = WriteOffAmt == null ? BigDecimal.ZERO : WriteOffAmt;
        OverUnderAmt = OverUnderAmt == null ? BigDecimal.ZERO : OverUnderAmt;
        // @marcos custom
        log.fine("Pay=" + PayAmt + ", Discount=" + DiscountAmt + ", WriteOff=" + WriteOffAmt
                + ", OverUnderAmt=" + OverUnderAmt);
        // Get Currency Info
        int C_Currency_ID = ((Integer) mTab.getValue("C_Currency_ID")).intValue();
        MCurrency currency = MCurrency.get(ctx, C_Currency_ID);
        Timestamp ConvDate = (Timestamp) mTab.getValue("DateTrx");
        int C_ConversionType_ID = 0;
        Integer ii = (Integer) mTab.getValue("C_ConversionType_ID");
        if (ii != null)
            C_ConversionType_ID = ii.intValue();
        int AD_Client_ID = Env.getContextAsInt(ctx, WindowNo, "AD_Client_ID");
        int AD_Org_ID = Env.getContextAsInt(ctx, WindowNo, "AD_Org_ID");
        // Get Currency Rate
        BigDecimal CurrencyRate = Env.ONE;
        if ((C_Currency_ID > 0 && C_Currency_Invoice_ID > 0 && C_Currency_ID != C_Currency_Invoice_ID)
                || colName.equals("C_Currency_ID") || colName.equals("C_ConversionType_ID"))
        {
            log.fine("InvCurrency=" + C_Currency_Invoice_ID + ", PayCurrency=" + C_Currency_ID
                    + ", Date=" + ConvDate + ", Type=" + C_ConversionType_ID);
            CurrencyRate = MConversionRate.getRate(C_Currency_Invoice_ID, C_Currency_ID, ConvDate,
                    C_ConversionType_ID, AD_Client_ID, AD_Org_ID);
            if (CurrencyRate == null || CurrencyRate.compareTo(Env.ZERO) == 0)
            {
                // mTab.setValue("C_Currency_ID", new
                // Integer(C_Currency_Invoice_ID)); // does not work
                if (C_Currency_Invoice_ID == 0)
                    return ""; // no error message when no invoice is selected
                return "NoCurrencyConversion";
            }
            //
            InvoiceOpenAmt = InvoiceOpenAmt.multiply(CurrencyRate).setScale(
                    currency.getStdPrecision(), BigDecimal.ROUND_HALF_UP);
            log.fine("Rate=" + CurrencyRate + ", InvoiceOpenAmt=" + InvoiceOpenAmt);
        }
        // Currency Changed - convert all
        if (colName.equals("C_Currency_ID") || colName.equals("C_ConversionType_ID"))
        {
            PayAmt = PayAmt.multiply(CurrencyRate).setScale(currency.getStdPrecision(),
                    BigDecimal.ROUND_HALF_UP);
            mTab.setValue("PayAmt", PayAmt);
            DiscountAmt = DiscountAmt.multiply(CurrencyRate).setScale(currency.getStdPrecision(),
                    BigDecimal.ROUND_HALF_UP);
            mTab.setValue("DiscountAmt", DiscountAmt);
            WriteOffAmt = WriteOffAmt.multiply(CurrencyRate).setScale(currency.getStdPrecision(),
                    BigDecimal.ROUND_HALF_UP);
            mTab.setValue("WriteOffAmt", WriteOffAmt);
            OverUnderAmt = OverUnderAmt.multiply(CurrencyRate).setScale(currency.getStdPrecision(),
                    BigDecimal.ROUND_HALF_UP);
            mTab.setValue("OverUnderAmt", OverUnderAmt);
        }
        // No Invoice - Set Discount, Witeoff, Under/Over to 0
        else if (C_Invoice_ID == 0 && LAR_PaymentHeader_ID == 0)
        {
            if (Env.ZERO.compareTo(DiscountAmt) != 0)
                mTab.setValue("DiscountAmt", Env.ZERO);
            if (Env.ZERO.compareTo(WriteOffAmt) != 0)
                mTab.setValue("WriteOffAmt", Env.ZERO);
            if (Env.ZERO.compareTo(OverUnderAmt) != 0)
                mTab.setValue("OverUnderAmt", Env.ZERO);
        } else
        {
            // Check if there are Invoices under the Header
            String sql = "SELECT (C_Invoice_ID)"
                    + "  FROM C_PaymentAllocate WHERE LAR_PaymentHeader_ID = ?";

            BigDecimal existsAmt = DB.getSQLValueBD(null, sql, LAR_PaymentHeader_ID);
            if (existsAmt == null && LAR_PaymentHeader_ID != 0
                    && mTab.getValueAsBoolean("EsRetencionSufrida"))
                return Msg.translate(Env.getCtx(),
                        "No Existen Facturas cargadas para aplicar la retención");
            else
            {
                boolean processed = mTab.getValueAsBoolean(MPayment.COLUMNNAME_Processed);

                // @fchiappano Obtengo todas las facturas asignadas a la cabecera
                final List<MPaymentAllocate> facturas = getInvoices(ctx, LAR_PaymentHeader_ID);

                if (colName.equals("PayAmt") && !processed && !facturas.isEmpty())
                {
                    int pagoNro = 0;
                    BigDecimal resto = Env.ZERO;
                    BigDecimal saldoImpago = Env.ZERO;
                    BigDecimal descuento = Env.ZERO;
                    List<MPayment> pagos = getPayments(ctx, LAR_PaymentHeader_ID);
                    for (MPaymentAllocate factura : facturas)
                    {
                        saldoImpago = factura.getAmount();
                        for (int x = pagoNro; x < pagos.size(); x++)
                        {
                            MPayment pago = pagos.get(x);

                            // Si el pago, es el que se modifico actualmente y
                            // no hay resto, tomo el valor de la grilla.
                            if (Env.getContextAsInt(ctx, WindowNo, "C_Payment_ID") == pago.getC_Payment_ID()
                                    && resto.compareTo(Env.ZERO) == 0)
                            {
                                resto = PayAmt;
                                descuento = Env.ZERO;
                            }
                            // Si no hay resto sobrante del pago, tomo el payAmt.
                            else if (resto.compareTo(Env.ZERO) == 0)
                            {
                                resto = pago.getPayAmt();
                                descuento = Env.ZERO;
                            }


                            if (resto.compareTo(saldoImpago) >= 0)
                            {
                                resto = resto.subtract(saldoImpago);
                                saldoImpago = Env.ZERO;
                                pagoNro = x;
                                descuento = descuento.add(factura.getDiscountAmt());
                            }
                            else
                            {
                                saldoImpago = saldoImpago.subtract(resto);
                                pagoNro = x + 1;
                                resto = Env.ZERO;
                            }

                            if (Env.getContextAsInt(ctx, WindowNo, "C_Payment_ID") == pago.getC_Payment_ID())
                                mTab.setValue("DiscountAmt", descuento);
                            else
                            {
                                pago.setDiscountAmt(descuento);
                                pago.saveEx();
                            }

                            // Si la factura fue pagada en su totalidad, paso a la siguiente.
                            if (saldoImpago.compareTo(Env.ZERO) == 0)
                                break;
                        }
                        // Si es un nuevo pago, calculo el descuento obteniendo el payAmt
                        // y seteo el descuento directamente en la MTab de la ventana.
                        if (Env.getContextAsInt(ctx, WindowNo, "C_Payment_ID") == 0)
                        {
                            if (resto.compareTo(Env.ZERO) == 0)
                            {
                                resto = PayAmt;
                                mTab.setValue("DiscountAmt", Env.ZERO);
                            }

                            if (resto.compareTo(saldoImpago) >= 0)
                            {
                                resto = resto.subtract(saldoImpago);
                                saldoImpago = Env.ZERO;
                                mTab.setValue("DiscountAmt", ((BigDecimal) mTab.getValue("DiscountAmt")).add(
                                        factura.getDiscountAmt()));
                            }
                            else
                            {
                                saldoImpago = saldoImpago.subtract(resto);
                                resto = Env.ZERO;
                            }

                            // Si la factura quedo saldada, termino el proceso.
                            if (resto.compareTo(Env.ZERO) == 0)
                                break;
                        }
                    }
                }
                else if (colName.equals("PayAmt") && (!processed) && (C_Invoice_ID != 0)
                        && "Y".equals(Env.getContext(ctx, WindowNo, "IsOverUnderPayment")))
                {
                    OverUnderAmt = InvoiceOpenAmt.subtract(PayAmt).subtract(DiscountAmt)
                            .subtract(WriteOffAmt);
                    mTab.setValue("OverUnderAmt", OverUnderAmt);
                } else if (colName.equals("PayAmt") && (!processed) && (C_Invoice_ID != 0))
                {
                    WriteOffAmt = InvoiceOpenAmt.subtract(PayAmt).subtract(DiscountAmt)
                            .subtract(OverUnderAmt);
                    mTab.setValue("WriteOffAmt", WriteOffAmt);
                } else if (colName.equals("IsOverUnderPayment") && (!processed) && (C_Invoice_ID != 0))
                {
                    boolean overUnderPaymentActive = "Y".equals(Env.getContext(ctx, WindowNo,
                            "IsOverUnderPayment"));
                    if (overUnderPaymentActive)
                    {
                        OverUnderAmt = InvoiceOpenAmt.subtract(PayAmt).subtract(DiscountAmt);
                        mTab.setValue("WriteOffAmt", Env.ZERO);
                        mTab.setValue("OverUnderAmt", OverUnderAmt);
                    } else
                    {
                        WriteOffAmt = InvoiceOpenAmt.subtract(PayAmt).subtract(DiscountAmt);
                        mTab.setValue("WriteOffAmt", WriteOffAmt);
                        mTab.setValue("OverUnderAmt", Env.ZERO);
                    }
                }
                // Added Lines By Goodwill (02-03-2006)
                // Reason: we must make the callout is called just when docstatus is
                // draft
                // Old Code : else // calculate PayAmt
                // New Code :
                else if ((!processed)) // calculate
                // PayAmt
                // End By Goodwill
                {
                    if ((!ofpi) && (C_Invoice_ID != 0))// german custom
                    { // german custom
                      // @mzuniga No se resta el sub/sobre Pago
                        PayAmt = InvoiceOpenAmt.subtract(DiscountAmt).subtract(WriteOffAmt);
                        mTab.setValue("PayAmt", PayAmt);
                    } // german custom
                      // german custom
                      // {
                    else if (C_Invoice_ID != 0)
                    {
                        boolean overUnderPaymentActive = "Y".equals(Env.getContext(ctx, WindowNo,
                                "IsOverUnderPayment"));
                        if (overUnderPaymentActive)
                        {
                            OverUnderAmt = InvoiceOpenAmt.subtract(PayAmt).subtract(DiscountAmt)
                                    .subtract(WriteOffAmt);
                            mTab.setValue("OverUnderAmt", OverUnderAmt);
                        } else
                        {
                            WriteOffAmt = InvoiceOpenAmt.subtract(PayAmt).subtract(DiscountAmt);
                            mTab.setValue("WriteOffAmt", WriteOffAmt);
                            mTab.setValue("OverUnderAmt", Env.ZERO);
                        }
                    }
                    // } end german custom
                }
            }
        }
        return "";
    } // amounts

    /**
     * Cobros Retenciones. Si cambia: EsretenciónSufrida -> Configura PayAmt a 0 .Se evita
     * generar un OverUnderPayment si el PayAmt no es 0 (Cero) y el cobro es una retención.
     *
     * @param ctx
     *        context
     * @param WindowNo
     *        current Window No
     * @param mTab
     *        Grid Tab
     * @param mField
     *        Grid Field
     * @param value
     *        New Value
     * @return null or error message
     */
    public String esretencionsufrida(Properties ctx, int WindowNo, GridTab mTab, GridField mField,
            Object value)
    {
        if (isCalloutActive())
            return "";
        int C_Payment_ID = Env.getContextAsInt(ctx, WindowNo, "C_Payment_ID");
        String EsRetencionSufrida = Env.getContext(ctx, WindowNo, "EsRetencionSufrida");

        log.fine("Payment_EsRetencionSufrida - C_Payment_ID=" + C_Payment_ID
                + ", EsRetencionSufrida=" + EsRetencionSufrida);

        if (EsRetencionSufrida.equals("Y"))
        {
            mTab.setValue("PayAmt", Env.ZERO);
            mTab.setValue("OverUnderAmt", Env.ZERO);
        }
        else
        {
            mTab.setValue("WriteOffAmt", Env.ZERO);
            mTab.setValue("OverUnderAmt", Env.ZERO.subtract((BigDecimal) mTab.getValue("PayAmt")));
            mTab.setValue("C_TaxWithholding_ID", null);
            mTab.setValue("WithholdingCertNo", "" );
        }
        return "";
    } // esretencionsufrida

    /**
     * Blanquear campos particulares de cada TT, al seleccionar otra opción.
     * @author fchiappano
     *
     * @param ctx
     * @param WindowNo
     * @param mTab
     * @param mField
     * @param value
     * @return null o mensaje de error
     */
    public String tenderType(Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value)
    {
        if (isCalloutActive())
            return "";

        String colName = mField.getColumnName();
        if (colName.equals("TenderType"))
        {
            String tenderType = (String) value;

            // @fchiappano solo para recibos/cobros, si se trata de un cheque
            // propio, copiar el nombre del SdN en el campo nombre del cheque.
            int c_BPartner_ID = (Integer) mTab.getValue("C_BPartner_ID");
            if (Env.getContext(ctx, WindowNo, "IsSOTrx").equals("Y") && c_BPartner_ID > 0)
            {
                String sql = "SELECT Name FROM C_BPartner WHERE C_BPartner_ID = ?";
                String name = DB.getSQLValueString(null, sql, c_BPartner_ID);

                if (tenderType.equals(MPayment.TENDERTYPE_Check))
                    mTab.setValue("A_Name", name);
                else if (mTab.get_ValueAsString("A_Name").equals(name))
                    mTab.setValue("A_Name", "");
            }

            if (tenderType.equals(MPayment.TENDERTYPE_CreditCard))
            {
                mTab.setValue("LAR_Tarjeta_Debito_ID", null);
                mTab.setValue("LAR_Deposito_Directo_ID", null);
                mTab.setValue("LAR_Cheque_Emitido_ID", null);
            }
            else if (tenderType.equals(MPayment.TENDERTYPE_DirectDebit))
            {
                mTab.setValue("LAR_Tarjeta_Credito_ID", null);
                mTab.setValue("LAR_Deposito_Directo_ID", null);
                mTab.setValue("LAR_Cheque_Emitido_ID", null);
            }
            else if (tenderType.equals(MPayment.TENDERTYPE_DirectDeposit))
            {
                mTab.setValue("LAR_Tarjeta_Credito_ID", null);
                mTab.setValue("LAR_Tarjeta_Debito_ID", null);
                mTab.setValue("LAR_Cheque_Emitido_ID", null);
            }
            else if (tenderType.equals(MPayment.TENDERTYPE_Check))
            {
                mTab.setValue("LAR_Tarjeta_Credito_ID", null);
                mTab.setValue("LAR_Tarjeta_Debito_ID", null);
                mTab.setValue("LAR_Deposito_Directo_ID", null);
            }
            else
            {
                mTab.setValue("LAR_Tarjeta_Credito_ID", null);
                mTab.setValue("LAR_Tarjeta_Debito_ID", null);
                mTab.setValue("LAR_Deposito_Directo_ID", null);
                mTab.setValue("LAR_Cheque_Emitido_ID", null);
            }
        }

        return "";
    } // tenderType

    /**
     * Si cambia el SdN, se debe actualizar el Tipo de Cambio.
     * @author fchiappano
     *
     * @param ctx context
     * @param WindowNo current Window No
     * @param mTab Grid Tab
     * @param mField Grid Field
     * @param value New Value
     * @return null or error message
     */
    public String conversionType(Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value)
    {
        int lar_PaymentHeader_ID = Env.getContextAsInt(ctx, WindowNo, "LAR_PaymentHeader_ID");
        List<MPaymentAllocate> invoices = getInvoices(ctx, lar_PaymentHeader_ID);

        // @fchiappano Validar que se haya cargado el socio del negocio y alguna factura.
        if (invoices.size() > 0 && mTab.getValue("C_BPartner_ID") != null)
        {
            MBPartner partner = new MBPartner(ctx, (Integer) mTab.getValue("C_BPartner_ID"), mTab.getTrxInfo());
            int c_Currency_ID = invoices.get(0).getC_Invoice().getC_Currency_ID();
            // Si la moneda de la factura, es distinta de la predeterminada, busco el tipo de conversion.
            if (c_Currency_ID != LAR_Utils.getMonedaPredeterminada(ctx, Env.getAD_Client_ID(ctx), mTab.getTrxInfo()))
            {
                int c_ConversionType_ID = partner.get_ValueAsInt("C_ConversionType_ID");

                if (c_ConversionType_ID > 0)
                    mTab.setValue("C_ConversionType_ID", c_ConversionType_ID);
                else
                    return "El Socio del Negocio, no posee un tipo de cambio asignado.";
            }
        }
        return "";
    } // conversionType

    /**
     * Obtener las facturas asignadas a la cabecera de pago.
     * @return
     */
    private List<MPaymentAllocate> getInvoices(final Properties ctx, final int LAR_PaymentHeader_ID)
    {
        // Recuperar información de las facturas
        List<MPaymentAllocate> invoices = new ArrayList<MPaymentAllocate>();

        String sql = "SELECT *"
                   + "  FROM C_PaymentAllocate"
                   + " WHERE LAR_PaymentHeader_ID = ?"
                   + " ORDER BY C_PaymentAllocate_ID";

        PreparedStatement pstmt;
        pstmt = DB.prepareStatement(sql, null);
        ResultSet rs = null;

        try
        {
            pstmt.setInt(1, LAR_PaymentHeader_ID);
            rs = pstmt.executeQuery();
            while (rs.next())
                invoices.add(new MPaymentAllocate(ctx, rs, null));

        }
        catch (SQLException e)
        {
            log.log(Level.SEVERE, sql, e);
        }
        finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }

        return invoices;
    } // getInvoices

    /**
     * Obtener todos los pagos de la cabecera.
     * @param ctx
     * @param LAR_PaymentHeader_ID
     * @return
     */
    private List<MPayment> getPayments(final Properties ctx, final int LAR_PaymentHeader_ID)
    {
        List<MPayment> payments = new ArrayList<MPayment>();

        String sql = "SELECT *"
                   + "  FROM C_Payment"
                   + " WHERE LAR_PaymentHeader_ID = ?"
                   + " ORDER BY C_Payment_ID";

        PreparedStatement pstmt;
        pstmt = DB.prepareStatement(sql, null);
        ResultSet rs = null;
        try
        {
            pstmt.setInt(1, LAR_PaymentHeader_ID);
            rs = pstmt.executeQuery();
            while (rs.next())
                payments.add(new MPayment(ctx, rs, null));

        } catch (SQLException e)
        {
            log.log(Level.SEVERE, sql, e);
        } finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }

        return payments;
    } // getPayments

} // CalloutPayment
