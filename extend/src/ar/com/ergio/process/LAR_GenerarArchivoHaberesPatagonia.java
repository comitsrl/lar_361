/****************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                      *
 * Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved.               *
 * This program is free software; you can redistribute it and/or modify it   *
 * under the terms version 2 of the GNU General Public License as published  *
 * by the Free Software Foundation. This program is distributed in the hope  *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied*
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.          *
 *****************************************************************************/
package ar.com.ergio.process;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.nio.charset.Charset;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.Normalizer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

import org.compiere.model.MAttachment;
import org.compiere.model.MAttachmentEntry;
import org.compiere.model.MTable;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereUserError;
import org.compiere.util.DB;
import org.compiere.util.Env;

import ar.com.ergio.model.I_LAR_LoteSueldos;
import ar.com.ergio.model.MLARLoteSueldos;

/**
 * Genera archivo TXT de acreditacion de haberes (layout Patagonia B.2)
 * y lo adjunta al lote de sueldos.
 */
public class LAR_GenerarArchivoHaberesPatagonia extends SvrProcess {

    private static final String TIPO_ARCHIVO = "PAT_SUELDOS";
    private static final Charset OUTPUT_CHARSET = Charset.forName("windows-1252");
    private static final String CRLF = "\r\n";

    private int pLoteSueldosID;
    private Timestamp pFechaPresentacion;
    private Timestamp pFechaAcreditacion;
    private int pNroEnvio = 1;

    @Override
    protected void prepare() {
        ProcessInfoParameter[] params = getParameter();
        for (int i = 0; i < params.length; i++) {
            ProcessInfoParameter param = params[i];
            String name = param.getParameterName();
            if (param.getParameter() == null) {
                continue;
            }

            if ("FechaAcreditacion".equalsIgnoreCase(name)
                    || "DateTrx".equalsIgnoreCase(name)
                    || "DatePromised".equalsIgnoreCase(name)) {
                pFechaAcreditacion = (Timestamp) param.getParameter();
            } else if ("FechaPresentacion".equalsIgnoreCase(name)
                    || "DateDoc".equalsIgnoreCase(name)) {
                pFechaPresentacion = (Timestamp) param.getParameter();
            } else if ("NroEnvio".equalsIgnoreCase(name)
                    || "NumeroEnvio".equalsIgnoreCase(name)
                    || "LAR_NroEnvio".equalsIgnoreCase(name)) {
                pNroEnvio = param.getParameterAsInt();
            } else {
                log.log(Level.SEVERE, "Unknown Parameter: " + name);
            }
        }

        pLoteSueldosID = getRecord_ID();
    }

    @Override
    protected String doIt() throws Exception {
        if (pLoteSueldosID <= 0) {
            throw new AdempiereUserError("No se encontró lote de sueldos para procesar");
        }
        if (pNroEnvio < 1 || pNroEnvio > 98) {
            throw new AdempiereUserError("Número de envío inválido (permitido: 01-98)");
        }

        MLARLoteSueldos lote = new MLARLoteSueldos(getCtx(), pLoteSueldosID, get_TrxName());
        if (lote.get_ID() <= 0) {
            throw new AdempiereUserError("No se encontró Lote de Sueldos ID=" + pLoteSueldosID);
        }

        if (pFechaPresentacion == null) {
            throw new AdempiereUserError("Debe informar Fecha de Presentación");
        }
        if (pFechaAcreditacion == null) {
            throw new AdempiereUserError("Debe informar Fecha de Acreditación");
        }

        String tipoLiquidacion = lote.get_ValueAsString("LAR_TipoLiquidacion");
        if (tipoLiquidacion == null || tipoLiquidacion.trim().length() == 0) {
            tipoLiquidacion = "001";
        }
        if (!"001".equals(tipoLiquidacion) && !"002".equals(tipoLiquidacion)) {
            throw new AdempiereUserError("Tipo de liquidación inválido para exportación: " + tipoLiquidacion);
        }

        HeaderData headerData = loadHeaderData(lote);
        List<DetailData> detailRows = loadDetailRows(lote, headerData.codigoDependencia, headerData.codigoBanco);

        if (detailRows.isEmpty()) {
            throw new AdempiereUserError("El lote no tiene líneas con importe principal mayor a cero para exportar");
        }
        if (detailRows.size() > 999) {
            throw new AdempiereUserError("El lote supera el máximo de 999 líneas de detalle");
        }

        BigDecimal totalImporte = Env.ZERO;
        for (int i = 0; i < detailRows.size(); i++) {
            totalImporte = totalImporte.add(detailRows.get(i).importe);
        }

        String concepto = resolveConcepto(tipoLiquidacion, lote.getDateTrx());
        updateLoteDescriptionWithConcept(lote, concepto);
        String fechaPresentacion = formatDate(pFechaPresentacion);
        String fechaAcreditacion = formatDate(pFechaAcreditacion);
        String nroEnvio = leftPad(String.valueOf(pNroEnvio), 2, '0');
        String nroEmpresa = leftPad(String.valueOf(headerData.nroEmpresa), 4, '0');
        String nroLote = "0001";

        StringBuilder fileContent = new StringBuilder();
        fileContent.append(buildHeaderGeneral(headerData.codigoBanco, fechaPresentacion, nroEnvio, nroEmpresa, totalImporte));
        fileContent.append(CRLF);
        fileContent.append(buildHeaderLote(nroLote, concepto, detailRows.size(), totalImporte, fechaAcreditacion, nroEnvio, nroEmpresa));
        fileContent.append(CRLF);

        for (int i = 0; i < detailRows.size(); i++) {
            fileContent.append(buildDetail(nroLote, detailRows.get(i), tipoLiquidacion, nroEmpresa));
            fileContent.append(CRLF);
        }

        String fileName = buildFileName(lote.getDocumentNo(), tipoLiquidacion, fechaAcreditacion, nroEnvio);
        int replacedEntries = attachReplacingSameKey(lote, fileName, fileContent.toString().getBytes(OUTPUT_CHARSET));

        return "Archivo generado: " + fileName
                + " | Registros: " + detailRows.size()
                + " | Importe: " + totalImporte
                + " | Adjuntos reemplazados: " + replacedEntries;
    }

    private HeaderData loadHeaderData(MLARLoteSueldos lote) throws AdempiereUserError {
        if (lote.getLAR_Deposito_Directo_ID() <= 0) {
            throw new AdempiereUserError("El lote no tiene Tipo de Depósito Directo informado");
        }

        // Importante: el banco del archivo se toma desde la configuracion de forma de pago
        // (LAR_TenderType_BankAccount) para Deposito Directo (TenderType='A'),
        // no desde LAR_LoteSueldos.C_BankAccount_ID (que puede ser caja).
        String sql = "SELECT b.LAR_NroEmpresa, ba.LAR_CodigoDependencia, COALESCE(b.RoutingNo,'') "
                + "FROM LAR_TenderType_BankAccount ttba "
                + "JOIN C_BankAccount ba ON ba.C_BankAccount_ID=ttba.C_BankAccount_ID "
                + "JOIN C_Bank b ON b.C_Bank_ID=ba.C_Bank_ID "
                + "WHERE ttba.IsActive='Y' "
                + "AND ttba.TenderType='A' "
                + "AND ttba.LAR_Deposito_Directo_ID=? "
                + "ORDER BY ttba.Updated DESC, ttba.LAR_TenderType_BankAccount_ID DESC";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = DB.prepareStatement(sql, get_TrxName());
            pstmt.setInt(1, lote.getLAR_Deposito_Directo_ID());
            rs = pstmt.executeQuery();
            if (!rs.next()) {
                throw new AdempiereUserError("No se encontró una Cuenta Bancaria por Forma de Pago activa "
                        + "para TenderType='A' y LAR_Deposito_Directo_ID=" + lote.getLAR_Deposito_Directo_ID());
            }

            int nroEmpresa = rs.getInt(1);
            String codigoDependencia = rs.getString(2);
            String routingNo = rs.getString(3);
            String codigoBanco = digitsOnly(routingNo);

            if (nroEmpresa < 1 || nroEmpresa > 8999) {
                throw new AdempiereUserError("Número de empresa inválido en banco: " + nroEmpresa);
            }
            if (codigoDependencia == null || !codigoDependencia.matches("^[0-9]{1,15}$")) {
                throw new AdempiereUserError("Código de dependencia inválido en cuenta bancaria del lote");
            }
            if (codigoBanco.length() == 0 || codigoBanco.length() > 3) {
                throw new AdempiereUserError("Código de banco inválido en C_Bank.RoutingNo (1-3 dígitos)");
            }

            HeaderData data = new HeaderData();
            data.nroEmpresa = nroEmpresa;
            data.codigoDependencia = codigoDependencia;
            data.codigoBanco = leftPad(codigoBanco, 3, '0');
            return data;
        } catch (AdempiereUserError e) {
            throw e;
        } catch (Exception e) {
            log.log(Level.SEVERE, sql, e);
            throw new AdempiereUserError("Error recuperando datos de banco/cuenta: " + e.getMessage());
        } finally {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }
    }

    private List<DetailData> loadDetailRows(MLARLoteSueldos lote, String codigoDependencia, String codigoBancoConvenio)
            throws AdempiereUserError {
        String sql = "SELECT l.LAR_LoteSueldosLine_ID, l.C_BPartner_ID, bp.Name, bp.TaxID, "
                + "COALESCE(l.ImportePpal,0), "
                + "bpa.AccountNo, bpa.BankAccountType, "
                + "COALESCE(bpa.RoutingNo,''), COALESCE(bpa.CreditCardNumber,''), COALESCE(bpa.C_BP_BankAccount_ID,0) "
                + "FROM LAR_LoteSueldosLine l "
                + "JOIN C_BPartner bp ON bp.C_BPartner_ID=l.C_BPartner_ID "
                + "LEFT JOIN C_BP_BankAccount bpa ON bpa.C_BP_BankAccount_ID = ("
                + "SELECT MAX(bpa2.C_BP_BankAccount_ID) "
                + "FROM C_BP_BankAccount bpa2 "
                + "WHERE bpa2.C_BPartner_ID=l.C_BPartner_ID "
                + "AND bpa2.IsActive='Y' "
                + "AND COALESCE(bpa2.RoutingNo,'')=?"
                + ") "
                + "WHERE l.LAR_LoteSueldos_ID=? "
                + "AND COALESCE(l.ImportePpal,0) > 0 "
                + "AND l.TenderType='A' "
                + "ORDER BY l.LAR_LoteSueldosLine_ID";

        List<DetailData> rows = new ArrayList<DetailData>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = DB.prepareStatement(sql, get_TrxName());
            pstmt.setString(1, codigoBancoConvenio);
            pstmt.setInt(2, lote.getLAR_LoteSueldos_ID());
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int bpartnerID = rs.getInt(2);
                String nombre = rs.getString(3);
                String taxId = rs.getString(4);
                BigDecimal importe = rs.getBigDecimal(5);
                String accountNo = rs.getString(6);
                String bankAccountType = rs.getString(7);
                String routingNo = rs.getString(8);
                String branchCodeRaw = rs.getString(9);
                int bpBankAccountID = rs.getInt(10);

                if (bpBankAccountID <= 0) {
                    throw new AdempiereUserError("El empleado " + safeEmployeeName(nombre)
                            + " no tiene cuenta bancaria activa con código de banco "
                            + codigoBancoConvenio + " en pestaña Cuenta Bancaria (Socio de Negocio)");
                }

                String tipoCuenta = mapTipoCuenta(bankAccountType);
                String nroCuenta = resolveNumeroCuenta(accountNo, nombre);
                String codigoBanco = resolveCodigoBanco(routingNo, nombre);
                String codigoSucursal = resolveCodigoSucursal(branchCodeRaw, nombre);
                String nroDocumento = resolveNumeroDocumento(taxId, nombre);

                DetailData row = new DetailData();
                row.tipoCuenta = tipoCuenta;
                row.numeroCuenta = nroCuenta;
                row.importe = importe;
                row.numeroComprobante = leftPad(String.valueOf(bpartnerID), 7, '0');
                row.apellidoNombre = sanitizeName(nombre);
                row.codigoBanco = codigoBanco;
                row.codigoSucursal = codigoSucursal;
                row.tipoDocumento = "001";
                row.numeroDocumento = nroDocumento;
                row.provinciaDocumento = "  ";
                row.codigoDependencia = codigoDependencia;
                rows.add(row);
            }

            return rows;
        } catch (AdempiereUserError e) {
            throw e;
        } catch (Exception e) {
            log.log(Level.SEVERE, sql, e);
            throw new AdempiereUserError("Error recuperando líneas de lote: " + e.getMessage());
        } finally {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }
    }

    private String buildHeaderGeneral(String codigoBanco, String fechaPresentacion, String nroEnvio, String nroEmpresa, BigDecimal importeTotal)
            throws AdempiereUserError {
        StringBuilder sb = new StringBuilder(200);
        sb.append("0");
        sb.append(leftPad(codigoBanco, 3, '0'));
        sb.append(repeat(' ', 5));
        sb.append(nroEmpresa);
        sb.append(fechaPresentacion);
        sb.append(nroEnvio);
        sb.append("0001");
        sb.append(repeat(' ', 2));
        sb.append(formatAmount(importeTotal, 13, 2));
        sb.append(repeat(' ', 10));
        sb.append("0");
        sb.append(repeat(' ', 133));
        sb.append(repeat(' ', 8));
        sb.append(nroEmpresa);
        return ensureLength(sb.toString(), 200, "Cabecera general");
    }

    private String buildHeaderLote(String nroLote, String concepto, int cantidad, BigDecimal importe,
            String fechaAcreditacion, String nroEnvio, String nroEmpresa) throws AdempiereUserError {
        StringBuilder sb = new StringBuilder(200);
        sb.append("1");
        sb.append(nroLote);
        sb.append("2");
        sb.append(rightPad(sanitizeAscii(concepto), 10, ' '));
        sb.append(leftPad(String.valueOf(cantidad), 3, '0'));
        sb.append(formatAmount(importe, 13, 2));
        sb.append(fechaAcreditacion);
        sb.append(nroEnvio);
        sb.append(repeat(' ', 144));
        sb.append(repeat(' ', 8));
        sb.append(nroEmpresa);
        return ensureLength(sb.toString(), 200, "Cabecera de lote");
    }

    private String buildDetail(String nroLote, DetailData detail, String tipoLiquidacion, String nroEmpresa)
            throws AdempiereUserError {
        StringBuilder sb = new StringBuilder(200);
        // Layout B.2 detalle:
        // - numero de lote (pos 2-5) se informa desde cabecera/proceso (nroLote)
        // - tipo de liquidacion (pos 101-103) se informa desde cabecera del lote (tipoLiquidacion)
        // Por eso no se almacenan como atributos de DetailData.
        sb.append("2");
        sb.append(nroLote);
        sb.append(detail.tipoCuenta);
        sb.append(leftPad(detail.numeroCuenta, 10, '0'));
        sb.append(formatAmount(detail.importe, 9, 2));
        sb.append(leftPad(detail.numeroComprobante, 7, '0'));
        sb.append(rightPad(detail.apellidoNombre, 20, ' '));
        sb.append(leftPad(detail.codigoBanco, 3, '0'));
        sb.append(leftPad(detail.codigoSucursal, 5, '0'));
        sb.append(detail.tipoDocumento);
        sb.append(leftPad(detail.numeroDocumento, 17, '0'));
        // Provincia del documento: solo aplica para tipo 004 (Cedula).
        // Para DNI (001), no se informa.
        if ("004".equals(detail.tipoDocumento)) {
            sb.append(leftPad(detail.provinciaDocumento, 2, '0'));
        } else {
            sb.append("  ");
        }
        sb.append(leftPad(detail.codigoDependencia, 15, '0'));
        sb.append(" ");
        sb.append(tipoLiquidacion);
        sb.append(repeat(' ', 93));
        sb.append(nroEmpresa);
        return ensureLength(sb.toString(), 200, "Detalle");
    }

    private int attachReplacingSameKey(MLARLoteSueldos lote, String fileName, byte[] data) throws AdempiereUserError {
        int adTableID = MTable.getTable_ID(I_LAR_LoteSueldos.Table_Name);
        MAttachment attachment = MAttachment.get(getCtx(), adTableID, lote.getLAR_LoteSueldos_ID());
        if (attachment == null) {
            attachment = new MAttachment(getCtx(), adTableID, lote.getLAR_LoteSueldos_ID(), get_TrxName());
        }

        String replaceKey = extractReplaceKey(fileName);
        int replaced = 0;

        MAttachmentEntry[] entries = attachment.getEntries();
        for (int i = entries.length - 1; i >= 0; i--) {
            String entryName = entries[i].getName();
            if (entryName != null && extractReplaceKey(entryName).equalsIgnoreCase(replaceKey)) {
                if (attachment.deleteEntry(i)) {
                    replaced++;
                }
            }
        }

        if (!attachment.addEntry(fileName, data)) {
            throw new AdempiereUserError("No fue posible agregar el adjunto al lote");
        }
        attachment.saveEx(get_TrxName());
        return replaced;
    }

    private String buildFileName(String documentNo, String tipoLiquidacion, String fechaAcreditacion, String nroEnvio) {
        String docNo = sanitizeAlphaNum(documentNo);
        if (docNo.length() == 0) {
            docNo = "SIN_DOCNO";
        }
        return TIPO_ARCHIVO + "_" + docNo + "_" + tipoLiquidacion + "_" + fechaAcreditacion + "_ENV" + nroEnvio + ".txt";
    }

    private String extractReplaceKey(String fileName) {
        String normalized = fileName;
        if (normalized.toLowerCase().endsWith(".txt")) {
            normalized = normalized.substring(0, normalized.length() - 4);
        }
        return normalized;
    }

    private String resolveConcepto(String tipoLiquidacion, Timestamp fechaLote) throws AdempiereUserError {
        if (fechaLote == null) {
            throw new AdempiereUserError("El lote no posee DateTrx para construir el concepto (MM/AA)");
        }
        String mmAA = new SimpleDateFormat("MM/yy").format(fechaLote);
        if ("001".equals(tipoLiquidacion)) {
            return "SUE " + mmAA;
        }
        if ("002".equals(tipoLiquidacion)) {
            return "SAC " + mmAA;
        }
        throw new AdempiereUserError("Tipo de liquidación inválido para concepto: " + tipoLiquidacion);
    }

    private void updateLoteDescriptionWithConcept(MLARLoteSueldos lote, String concepto) {
        String currentDescription = lote.getDescription();
        String newDescription;
        if (currentDescription == null || currentDescription.trim().length() == 0) {
            newDescription = concepto;
        } else {
            newDescription = currentDescription + " - " + concepto;
        }
        lote.setDescription(newDescription);
        lote.saveEx(get_TrxName());
    }

    private String resolveNumeroDocumento(String taxID, String employeeName) throws AdempiereUserError {
        String doc = digitsOnly(taxID);
        if (doc.length() == 0) {
            throw new AdempiereUserError("El empleado " + safeEmployeeName(employeeName)
                    + " no posee número de documento (TaxID)");
        }
        if (doc.length() > 17) {
            doc = doc.substring(doc.length() - 17);
        }
        return doc;
    }

    private String resolveCodigoBanco(String routingNo, String employeeName) throws AdempiereUserError {
        String routingDigits = digitsOnly(routingNo);
        if (routingDigits.length() > 0 && routingDigits.length() <= 3) {
            return routingDigits;
        }
        throw new AdempiereUserError("El empleado " + safeEmployeeName(employeeName)
                + " no posee un código de banco válido en RoutingNo (1-3 dígitos)");
    }

    private String resolveCodigoSucursal(String branchCodeRaw, String employeeName)
            throws AdempiereUserError {
        String branchDigits = digitsOnly(branchCodeRaw);
        if (branchDigits.length() > 0 && branchDigits.length() <= 5) {
            return branchDigits;
        }
        throw new AdempiereUserError("El empleado " + safeEmployeeName(employeeName)
                + " no posee un código de sucursal válido en CreditCardNumber (1-5 dígitos)");
    }

    private String resolveNumeroCuenta(String accountNo, String employeeName) throws AdempiereUserError {
        String accountDigits = digitsOnly(accountNo);
        if (accountDigits.length() > 10) {
            accountDigits = accountDigits.substring(accountDigits.length() - 10);
        }
        if (accountDigits.length() > 0) {
            return accountDigits;
        }
        throw new AdempiereUserError("El empleado " + safeEmployeeName(employeeName)
                + " no posee una cuenta bancaria configurada (AccountNo) en su pestaña Cuenta Bancaria");
    }

    private String safeEmployeeName(String employeeName) {
        return employeeName == null || employeeName.trim().length() == 0 ? "<sin nombre>" : employeeName.trim();
    }

    private String mapTipoCuenta(String bankAccountType) throws AdempiereUserError {
        // Diseño Patagonia B.2 (detalle campo 3 - Tipo de cuenta):
        // 1 = Cuenta Corriente, 2 = Caja de Ahorro.
        // En ADempiere, C_BP_BankAccount.BankAccountType usa:
        // C = Checking (Cuenta Corriente), S = Savings (Caja de Ahorro).
        if ("C".equalsIgnoreCase(bankAccountType)) {
            return "1";
        }
        if ("S".equalsIgnoreCase(bankAccountType)) {
            return "2";
        }
        throw new AdempiereUserError("Tipo de cuenta bancaria inválido en C_BP_BankAccount: "
                + (bankAccountType == null ? "<vacío>" : bankAccountType));
    }

    private String formatDate(Timestamp ts) {
        return new SimpleDateFormat("yyyyMMdd").format(ts);
    }

    private String formatAmount(BigDecimal amount, int integerDigits, int decimalDigits) {
        if (amount == null) {
            amount = Env.ZERO;
        }
        BigDecimal scaled = amount.setScale(decimalDigits, RoundingMode.HALF_UP);
        String digits = scaled.movePointRight(decimalDigits).toBigInteger().toString();
        return leftPad(digits, integerDigits + decimalDigits, '0');
    }

    private String ensureLength(String value, int length, String section) throws AdempiereUserError {
        if (value.length() != length) {
            throw new AdempiereUserError(section + " con longitud inválida: " + value.length() + " (esperado " + length + ")");
        }
        return value;
    }

    private String sanitizeName(String value) {
        return sanitizeAscii(value).replaceAll("[^A-Za-z0-9 ]", " ").trim();
    }

    private String sanitizeAscii(String value) {
        if (value == null) {
            return "";
        }
        String normalized = Normalizer.normalize(value, Normalizer.Form.NFD);
        normalized = normalized.replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
        return normalized;
    }

    private String sanitizeAlphaNum(String value) {
        if (value == null) {
            return "";
        }
        return value.replaceAll("[^A-Za-z0-9]", "");
    }

    private String digitsOnly(String value) {
        if (value == null) {
            return "";
        }
        return value.replaceAll("[^0-9]", "");
    }

    private String leftPad(String value, int length, char fill) {
        String str = value == null ? "" : value;
        if (str.length() > length) {
            str = str.substring(str.length() - length);
        }
        if (str.length() == length) {
            return str;
        }
        StringBuilder sb = new StringBuilder(length);
        for (int i = str.length(); i < length; i++) {
            sb.append(fill);
        }
        sb.append(str);
        return sb.toString();
    }

    private String rightPad(String value, int length, char fill) {
        String str = value == null ? "" : value;
        if (str.length() > length) {
            str = str.substring(0, length);
        }
        if (str.length() == length) {
            return str;
        }
        StringBuilder sb = new StringBuilder(length);
        sb.append(str);
        for (int i = str.length(); i < length; i++) {
            sb.append(fill);
        }
        return sb.toString();
    }

    private String repeat(char c, int count) {
        StringBuilder sb = new StringBuilder(count);
        for (int i = 0; i < count; i++) {
            sb.append(c);
        }
        return sb.toString();
    }

    private static class HeaderData {
        int nroEmpresa;
        String codigoDependencia;
        String codigoBanco;
    }

    private static class DetailData {
        String tipoCuenta;
        String numeroCuenta;
        BigDecimal importe;
        String numeroComprobante;
        String apellidoNombre;
        String codigoBanco;
        String codigoSucursal;
        String tipoDocumento;
        String numeroDocumento;
        String provinciaDocumento;
        String codigoDependencia;
    }
}
