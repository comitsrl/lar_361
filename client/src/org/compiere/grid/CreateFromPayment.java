/******************************************************************************
 * Copyright (C) 2009 Low Heng Sin                                            *
 * Copyright (C) 2009 Idalica Corporation                                     *
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
package org.compiere.grid;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Vector;
import java.util.logging.Level;

import org.compiere.minigrid.IMiniTable;
import org.compiere.model.GridTab;
import org.compiere.model.MPayment;
import org.compiere.model.PO;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.compiere.util.KeyNamePair;
import org.compiere.util.Msg;

import ar.com.ergio.model.MLARPaymentHeader;
import ar.com.ergio.model.MLARRetiroCaja;
import ar.com.ergio.model.X_LAR_RetiroCajaLine;

/**
 * Ventana de creación de lineas, a partir de la selección de pagos/cobros.
 *
 * @author fchiappano
 */
public abstract class CreateFromPayment extends CreateFrom
{
    /**
     * Protected Constructor
     *
     * @param mTab MTab
     */
    public CreateFromPayment(GridTab mTab)
    {
        super(mTab);
        log.info(mTab.toString());
    } // CreateFromPayment

    /**
     * Dynamic Init
     *
     * @return true if initialized
     */
    public boolean dynInit() throws Exception
    {
        log.config("");
        setTitle(Msg.translate(Env.getCtx(), getGridTab().getKeyColumnName()) + " ... " + Msg.translate(Env.getCtx(), "CreateFrom"));

        return true;
    } // dynInit

    /**************************************************************************
     * Construct SQL Where Clause and define parameters (setParameters needs to
     * set parameters) Includes first AND
     *
     * @return sql where clause
     */
    public String getSQLWhere(String documentNo, String name, Object dateFrom, Object dateTo, Object amtFrom,
            Object amtTo, String routingNo, String checkNo)
    {
        StringBuffer sql = new StringBuffer("WHERE ");

        if (getGridTab().getAD_Table_ID() == MLARRetiroCaja.Table_ID)
            sql.append(getRetiroWhereClause());
        else if (getGridTab().getAD_Table_ID() == MLARPaymentHeader.Table_ID)
            sql.append(getPaymentHeaderWhereClause());

        if (documentNo.length() > 0)
            sql.append(" AND UPPER(p.DocumentNo) LIKE ?");
        //
        if (name.length() > 0)
            sql.append(" AND UPPER(p.A_Name) LIKE ?");
        //
        if (dateFrom != null || dateTo != null)
        {
            Timestamp from = (Timestamp) dateFrom;
            Timestamp to = (Timestamp) dateTo;
            if (from == null && to != null)
                sql.append(" AND TRUNC(p.DateTrx) <= ?");
            else if (from != null && to == null)
                sql.append(" AND TRUNC(p.DateTrx) >= ?");
            else if (from != null && to != null)
                sql.append(" AND TRUNC(p.DateTrx) BETWEEN ? AND ?");
        }
        //
        if (amtFrom != null || amtTo != null)
        {
            BigDecimal from = (BigDecimal) amtFrom;
            BigDecimal to = (BigDecimal) amtTo;
            if (from == null && to != null)
                sql.append(" AND p.PayAmt <= ?");
            else if (from != null && to == null)
                sql.append(" AND p.PayAmt >= ?");
            else if (from != null && to != null)
                sql.append(" AND p.PayAmt BETWEEN ? AND ?");
        }

        if (routingNo.length() > 0)
            sql.append(" AND UPPER(p.RoutingNo) LIKE ?");

        if (checkNo.length() > 0)
            sql.append(" AND p.CheckNo LIKE ?");

        log.fine(sql.toString());
        return sql.toString();
    } // getSQLWhere

    /**
     * Set Parameters for Query. (as defined in getSQLWhere)
     *
     * @param pstmt statement
     * @param forCount for counting records
     * @throws SQLException
     */
    void setParameters(PreparedStatement pstmt, boolean forCount, String documentNo, String name, Object dateFrom,
            Object dateTo, Object amtFrom, Object amtTo, String routingNo, String checkNo) throws SQLException
    {
        int index = 1;

        if (documentNo.length() > 0)
            pstmt.setString(index++, getSQLText(documentNo));
        //
        if (name.length() > 0)
            pstmt.setString(index++, getSQLText(name));
        //
        if (dateFrom != null || dateTo != null)
        {
            Timestamp from = (Timestamp) dateFrom;
            Timestamp to = (Timestamp) dateTo;
            log.fine("Date From=" + from + ", To=" + to);
            if (from == null && to != null)
                pstmt.setTimestamp(index++, to);
            else if (from != null && to == null)
                pstmt.setTimestamp(index++, from);
            else if (from != null && to != null)
            {
                pstmt.setTimestamp(index++, from);
                pstmt.setTimestamp(index++, to);
            }
        }
        //
        if (amtFrom != null || amtTo != null)
        {
            BigDecimal from = (BigDecimal) amtFrom;
            BigDecimal to = (BigDecimal) amtTo;
            log.fine("Amt From=" + from + ", To=" + to);
            if (from == null && to != null)
                pstmt.setBigDecimal(index++, to);
            else if (from != null && to == null)
                pstmt.setBigDecimal(index++, from);
            else if (from != null && to != null)
            {
                pstmt.setBigDecimal(index++, from);
                pstmt.setBigDecimal(index++, to);
            }
        }

        if (routingNo.length() > 0)
            pstmt.setString(index++, getSQLText(routingNo));

        if (checkNo.length() > 0)
            pstmt.setString(index++, getSQLText(checkNo));

    } // setParameters

    /**
     * Get SQL WHERE parameter
     *
     * @param f field
     * @return Upper case text with % at the end
     */
    private String getSQLText(String text)
    {
        String s = text.toUpperCase();
        if (!s.endsWith("%"))
            s += "%";
        log.fine("String=" + s);
        return s;
    } // getSQLText

    protected Vector<Vector<Object>> getPaymentData(String documentNo, String name, Object dateFrom, Object dateTo,
            Object amtFrom, Object amtTo, String routingNo, String checkNo)
    {
        Vector<Vector<Object>> data = new Vector<Vector<Object>>();

        String sql = "SELECT ba.C_BankAccount_ID, ba.Name, p.A_Name, p.DateTrx, p.C_Payment_ID, p.DocumentNo, p.RoutingNo,"
                   +       " p.CheckNo, p.IsReceipt, c.C_Currency_ID, c.ISO_Code, p.PayAmt,"
                   +       " currencyConvert(p.PayAmt, p.C_Currency_ID, ba.C_Currency_ID, pa.DateAcct, p.C_ConversionType_ID, p.AD_Client_ID, p.AD_Org_ID),"
                   +       " p.IsAllocated, pa.Fecha_Venc_Cheque"
                   +  " FROM C_Payment_v p"
                   +  " JOIN C_Payment pa ON p.C_Payment_ID = pa.C_Payment_ID"
                   +  " JOIN C_BankAccount ba ON (p.C_BankAccount_ID = ba.C_BankAccount_ID)"
                   +  " JOIN C_Currency c ON (p.C_Currency_ID = c.C_Currency_ID) ";

        sql = sql + getSQLWhere(documentNo, name, dateFrom, dateTo, amtFrom, amtTo, routingNo, checkNo) + " ORDER BY p.DateTrx";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            pstmt = DB.prepareStatement(sql.toString(), null);
            setParameters(pstmt, false, documentNo, name, dateFrom, dateTo, amtFrom, amtTo, routingNo, checkNo);
            rs = pstmt.executeQuery();
            while (rs.next())
            {
                Vector<Object> line = new Vector<Object>(6);
                line.add(new Boolean(false)); // 0-Selection
                line.add(rs.getString(3)); // 1- Nombre
                line.add(rs.getTimestamp(15)); // 2- Fecha Vencimiento.
                line.add(rs.getString(7)); // 3-Banco-Sucursal
                line.add(rs.getString(8)); // 4-CheckNo
                line.add(rs.getBigDecimal(12)); // 5-Total del Pago
                line.add(rs.getBigDecimal(13)); // 6-Convertido
                KeyNamePair pp = new KeyNamePair(rs.getInt(10), rs.getString(11));
                line.add(pp); // 7-Moneda
                line.add(rs.getTimestamp(4)); // 8- DateTrx
                line.add(rs.getString(9).equals("Y")); // 9-Es Recibo.
                pp = new KeyNamePair(rs.getInt(5), rs.getString(6));
                line.add(pp); // 10-C_Payment_ID
                pp = new KeyNamePair(rs.getInt(1), rs.getString(2));
                line.add(pp); // 11-C_BankAccout_ID
                line.add(rs.getString(14).equals("Y")); // 12- Asignado
                data.add(line);
            }
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

        return data;
    } // getPaymentData

    public void info()
    {

    }

    protected void configureMiniTable(IMiniTable miniTable)
    {
        miniTable.setColumnClass(0, Boolean.class, false); // 0-Seleccion
        miniTable.setColumnClass(1, String.class, true); // 1-Nombre
        miniTable.setColumnClass(2, Timestamp.class, true); // 2-Fecha Vencimiento
        miniTable.setColumnClass(3, String.class, true); // 3-Banco-Sucursal
        miniTable.setColumnClass(4, String.class, true); // 4-Nro de Cheque
        miniTable.setColumnClass(5, BigDecimal.class, true); // 5-Total del pago
        miniTable.setColumnClass(6, BigDecimal.class, true); // 6-Convertido,
        miniTable.setColumnClass(7, String.class, true); // 7-Moneda
        miniTable.setColumnClass(8, Timestamp.class, true); // 8-Fecha Transacción
        miniTable.setColumnClass(9, Boolean.class, true); // 9-Es Cobro
        miniTable.setColumnClass(10, String.class, true); // 10-Nro Documento
        miniTable.setColumnClass(11, String.class, true); // 11- Cuenta Bancaria / Caja.
        miniTable.setColumnClass(12, Boolean.class, true); // 12-Asignado
        // Table UI
        miniTable.autoSize();
    } // configureMiniTable

    protected Vector<String> getOISColumnNames()
    {
        // Header Info
        Vector<String> columnNames = new Vector<String>(12);
        columnNames.add(Msg.getMsg(Env.getCtx(), "Select"));
        columnNames.add(Msg.getElement(Env.getCtx(), "A_Name"));
        columnNames.add("Venc. Cheque");
        columnNames.add("Banco - Sucursal");
        columnNames.add(Msg.translate(Env.getCtx(), "CheckNo"));
        columnNames.add(Msg.translate(Env.getCtx(), "PayAmt"));
        columnNames.add(Msg.translate(Env.getCtx(), "ConvertedAmount"));
        columnNames.add(Msg.translate(Env.getCtx(), "C_Currency_ID"));
        columnNames.add(Msg.translate(Env.getCtx(), "DateTrx"));
        columnNames.add(Msg.translate(Env.getCtx(), "IsReceipt"));
        columnNames.add(Msg.translate(Env.getCtx(), "DocumentNo"));
        columnNames.add(Msg.translate(Env.getCtx(), "C_BankAccount_ID"));
        columnNames.add(Msg.translate(Env.getCtx(), "IsAllocated"));

        return columnNames;
    } // getOISColumnNames

    /**
     * Save Statement - Insert Data
     *
     * @return true if saved
     */
    public boolean save(IMiniTable miniTable, String trxName)
    {
        // @fchiappano Determinar desde que tabla se esta ejecutando la ventana.
        if (getGridTab().getAD_Table_ID() == MLARRetiroCaja.Table_ID)
            return saveRetiroCaja(miniTable, trxName);
        else if (getGridTab().getAD_Table_ID() == MLARPaymentHeader.Table_ID)
            return savePaymentHeader(miniTable, trxName);

        return true;
    } // save

    /**
     * Metodo encargado de realizar las acciones sobre la tabla LAR_RetiroCaja.
     *
     * @author fchiappano
     * @return confirmcioón.
     */
    private boolean saveRetiroCaja(IMiniTable miniTable, String trxName)
    {
        // @fchiappano Instanciar el Retiro de caja sobre el que se crearan las
        // lineas.
        int lar_RetiroCaja_ID = ((Integer) getGridTab().getValue("LAR_RetiroCaja_ID")).intValue();
        MLARRetiroCaja rc = new MLARRetiroCaja(Env.getCtx(), lar_RetiroCaja_ID, trxName);
        log.config(rc.toString());

        // @fchiappano Recorrer las lineas seleccionadas.
        for (int i = 0; i < miniTable.getRowCount(); i++)
        {
            if (((Boolean) miniTable.getValueAt(i, 0)).booleanValue())
            {
                String a_Name = (String) miniTable.getValueAt(i, 1); // 1-A_Name
                Timestamp trxDate = (Timestamp) miniTable.getValueAt(i, 8); // 8-DateTrx
                KeyNamePair pp = (KeyNamePair) miniTable.getValueAt(i, 10); // 10-C_Payment_ID
                int c_Payment_ID = pp.getKey();
                String routingNo = (String) miniTable.getValueAt(i, 3); // 3-RoutingNo
                String checkNo = (String) miniTable.getValueAt(i, 4); // 4-CheckNo
                pp = (KeyNamePair) miniTable.getValueAt(i, 7); // 7-Currency
                int c_Currency_ID = pp.getKey();
                BigDecimal trxAmt = (BigDecimal) miniTable.getValueAt(i, 6); // 6-Conv-Amt

                log.fine("Line Date=" + trxDate + ", Payment=" + c_Payment_ID + ", Currency=" + c_Currency_ID + ", Amt="
                        + trxAmt);
                final X_LAR_RetiroCajaLine lineaRetiro = new X_LAR_RetiroCajaLine(Env.getCtx(), 0, trxName);
                final MPayment payment = new MPayment(Env.getCtx(), c_Payment_ID, trxName);

                lineaRetiro.setLAR_RetiroCaja_ID(rc.getLAR_RetiroCaja_ID());
                lineaRetiro.set_ValueOfColumn("C_Payment_ID", c_Payment_ID);
                lineaRetiro.setMonto(trxAmt);
                lineaRetiro.setRoutingNo(routingNo);
                lineaRetiro.setAccountNo(payment.getAccountNo());
                lineaRetiro.setCheckNo(checkNo);
                lineaRetiro.setA_Name(a_Name);
                lineaRetiro.setTenderType("Z");

                if (!lineaRetiro.save())
                    log.log(Level.SEVERE, "Line not created #" + i);
            } // Linea seleccinada
        } // For lineas

        return true;
    } // saveRetiroCaja

    /**
     * Metodo encargado de realizar las acciones sobre la tabla LAR_PaymentHeader.
     *
     * @author fchiappano
     * @return confirmcioón.
     */
    private boolean savePaymentHeader(IMiniTable miniTable, String trxName)
    {
        // @fchiappano Instanciar la cabecera de pago, sobre el que se crearan las lineas.
        int lar_PaymentHeader_ID = ((Integer) getGridTab().getValue("LAR_PaymentHeader_ID")).intValue();
        MLARPaymentHeader header = new MLARPaymentHeader(Env.getCtx(), lar_PaymentHeader_ID, trxName);
        log.config(header.toString());

        // @fchiappano Recorrer las lineas seleccionadas.
        for (int i = 0; i < miniTable.getRowCount(); i++)
        {
            if (((Boolean) miniTable.getValueAt(i, 0)).booleanValue())
            {
                Timestamp trxDate = (Timestamp) miniTable.getValueAt(i, 8); // 3-DateTrx
                KeyNamePair pp = (KeyNamePair) miniTable.getValueAt(i, 10); // 4-C_Payment_ID
                int c_Payment_ID = pp.getKey();
                pp = (KeyNamePair) miniTable.getValueAt(i, 7); // 7-Currency
                int c_Currency_ID = pp.getKey();
                BigDecimal trxAmt = (BigDecimal) miniTable.getValueAt(i, 6); // 9-Conv-Amt

                log.fine("Line Date=" + trxDate + ", Payment=" + c_Payment_ID + ", Currency=" + c_Currency_ID + ", Amt="
                        + trxAmt);
                final MPayment receipt = new MPayment(Env.getCtx(), c_Payment_ID, trxName);

                MPayment pay = new MPayment(Env.getCtx(), 0, trxName);
                PO.copyValues(receipt, pay);
                pay.set_CustomColumn("LAR_PaymentHeader_ID", header.getLAR_PaymentHeader_ID());
                pay.set_CustomColumn("LAR_PaymentSource_ID", receipt.getC_Payment_ID());
                pay.setC_DocType_ID(header.getC_DocType_ID());
                pay.setDocumentNo(header.getDocumentNo());
                pay.setDocStatus(header.getDocStatus());
                pay.setDateTrx(header.getDateTrx());
                pay.setDateAcct(header.getDateTrx());
                pay.setErrorMessage("");
                pay.setC_BPartner_ID(header.getC_BPartner_ID());
                pay.setC_BankAccount_ID(header.getC_BankAccount_ID());
                pay.setIsReceipt(header.isReceipt());
//              pay.setProcessed(header.isProcessed());
                pay.setProcessed(false);
                pay.setIsActive(header.isActive());
                pay.setPosted(false);
                //Marcos Zúñiga 
                pay.setC_Invoice_ID(header.getC_Invoice_ID());
                //Marcos Zúñiga
                pay.setC_Order_ID(0);
                pay.setIsApproved(false);
                pay.setIsAllocated(false);
                pay.setIsDelayedCapture(false);
                pay.setIsOnline(false);
                pay.setIsPrepayment(false);
                pay.setIsReconciled(false);
                pay.setOProcessing("N");
                pay.setOrig_TrxID("");
                pay.setPONum("");
                pay.setRef_Payment_ID(0);
                pay.setReversal_ID(0);
                pay.setReplication(false);
                pay.setTrxType(MPayment.TRXTYPE_Sales);
                pay.setUser1_ID(0);
                pay.setUser2_ID(0);
                pay.setVoiceAuthCode("");
                pay.setOverUnderAmt(Env.ZERO);
                pay.setWriteOffAmt(Env.ZERO);
                pay.setIsOverUnderPayment(false);
                pay.setTenderType("Z"); // Cheque de Terceros

                receipt.setIsReconciled(false);

                if (!pay.save() || !receipt.save())
                {
                    log.log(Level.SEVERE, "Line not created #" + i);
                    return false;
                }
            } // Linea seleccinada
        } // For lineas

        return true;
    } // savePaymentHeader

    /**
     * Medoto que define la clausula where (estatica), a utilizar para la tabla LAR_RetiroCaja.
     * @author fchiappano
     * @return clausula where.
     */
    private String getRetiroWhereClause()
    {
        String usedDocs = "" // Consulta que devuelve el ID de los documentos (recibos) que ya
                             // fueron transferidos en algún pago, siempre y cuando ese pago no haya sido cancelado
                        + "SELECT distinct(REC.c_payment_id)"
                        +  " FROM c_payment PAY"
                        +  " JOIN c_payment REC ON REC.c_payment_id = PAY.lar_paymentsource_id"
                        +   " AND REC.docstatus IN ('CO', 'CL')"
                        +   " AND REC.IsReceipt = 'Y'"
                        +   " AND PAY.docstatus IN ('CO', 'CL')";

        String noDuplicado = " SELECT COALESCE (rcl.C_Payment_ID, 0)"
                           +   " FROM LAR_RetiroCajaLine rcl"
                           +   " JOIN LAR_RetiroCaja rc ON rcl.LAR_RetiroCaja_ID = rc.LAR_RetiroCaja_ID AND rc.DocStatus = 'DR'";

        StringBuilder whereSQL = new StringBuilder();
        whereSQL.append(" p.IsReceipt = 'Y'");
        whereSQL.append(" AND p.IsOnDrawer = 'Y'");
        whereSQL.append(" AND p.Docstatus IN ('CO','CL')");
        whereSQL.append(" AND p.TenderType IN ('K', 'Z')");
        whereSQL.append(" AND p.IsActive = 'Y'");
        whereSQL.append(" AND p.C_Payment_ID NOT IN (" + usedDocs + ")");
        whereSQL.append(" AND p.C_Payment_ID NOT IN (" + noDuplicado + ")");
        whereSQL.append(" AND p.C_BankAccount_ID = " + getGridTab().getValue("C_BankAccountFrom_ID"));

        return whereSQL.toString();
    } // getRepartoWhereClause

    /**
     * Medoto que define la clausula where (estatica), a utilizar para la tabla LAR_PaymentHeader.
     *
     * @author fchiappano
     * @return clausula where.
     */
    private String getPaymentHeaderWhereClause()
    {
        String usedDocs = "" // Consulta que devuelve el ID de los documentos (recibos) que ya
                             // fueron transferidos en algún pago, siempre y cuando ese pago no haya sido cancelado
                        + "SELECT distinct(REC.c_payment_id)" 
                        +  " FROM c_payment PAY"
                        + " INNER JOIN c_payment REC ON REC.c_payment_id = PAY.lar_paymentsource_id" 
                        +   " AND REC.Processed='Y'"
                        +   " AND REC.isReceipt='Y'"
                        +   " AND PAY.docstatus NOT IN('IN', 'RE', 'VO')";

        StringBuilder whereSQL = new StringBuilder();
        whereSQL.append(" p.IsOnDrawer='Y'");
        whereSQL.append(" AND p.C_BankAccount_ID = " + getGridTab().getValue("C_BankAccount_ID"));
        whereSQL.append(" AND p.isReceipt = 'Y'");
        whereSQL.append(" AND p.Docstatus IN ('CO','CL')");
        whereSQL.append(" AND p.TenderType IN ('K', 'Z')");
        whereSQL.append(" AND p.C_Payment_ID NOT IN (" + usedDocs + ")");

        return whereSQL.toString();
    } // getPaymentHeaderWhereClause

} // CreateFromPayment