package ar.com.ergio.process;

import org.compiere.model.MBPartner;
import org.compiere.model.MSysConfig;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import ar.com.ergio.model.MLARLoteSueldos;
import ar.com.ergio.model.MLARLoteSueldosLine;
import org.compiere.util.DB;
import org.compiere.util.AdempiereUserError;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

public class LAR_RecuperarImportes extends SvrProcess {
    private int p_LAR_LoteSueldos_ID;
    private int p_AD_Org_ID;
    private int p_C_Remuneration_ID;
    private String p_TipoSueldo;

    @Override
    protected void prepare() {
        ProcessInfoParameter[] para = getParameter();
        for (int i = 0; i < para.length; i++) {
            String name = para[i].getParameterName();
            if (para[i].getParameter() == null)
                ;
            else if (name.equals("AD_Org_ID"))
                p_AD_Org_ID = para[i].getParameterAsInt();
            else if (name.equals("TipoSueldo"))
                p_TipoSueldo = (String) para[i].getParameter();
            else if (name.equals("C_Remuneration_ID"))
                p_C_Remuneration_ID = para[i].getParameterAsInt();
            else
                log.warning("Unknown Parameter: " + name);
        }
        p_LAR_LoteSueldos_ID = getRecord_ID();
    }

    @Override
    protected String doIt() throws Exception {
        MLARLoteSueldos lote = new MLARLoteSueldos(getCtx(), p_LAR_LoteSueldos_ID, get_TrxName());
        // Si el lote ya está procesado, no permitir recuperación
        if (lote.isProcessed()) {
            return "El lote ya está procesado. No se puede recuperar importes.";
        }
        // Borrar líneas existentes del lote antes de recuperar
        String deleteSQL = "DELETE FROM LAR_LoteSueldosLine WHERE LAR_LoteSueldos_ID=?";
        DB.executeUpdate(deleteSQL, new Object[]{lote.getLAR_LoteSueldos_ID()}, false, get_TrxName());
        // 1. Recuperar empleados asociados al lote (solo empleados activos, excluyendo IDs específicos)
        StringBuilder sql = new StringBuilder();
        String excluidos = MSysConfig.getValue("LAR_SdNsExcluidosRRHH", "", lote.getAD_Client_ID());
        sql.append("SELECT bp.C_BPartner_ID, bp.AD_Org_ID FROM C_BPartner bp WHERE bp.IsEmployee='Y' AND bp.IsActive='Y' AND bp.AD_Client_ID=?");
        sql.append(" AND bp.C_BPartner_ID NOT IN (" + excluidos + ")");
        if (p_AD_Org_ID > 0) {
            sql.append(" AND bp.AD_Org_ID = ").append(p_AD_Org_ID);
        }
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int count = 0;
        BigDecimal totalImporte = BigDecimal.ZERO; // Acumulador de importes
        try {
            pstmt = DB.prepareStatement(sql.toString(), get_TrxName());
            pstmt.setInt(1, lote.getAD_Client_ID());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                int cBPartnerId = rs.getInt("C_BPartner_ID");
                MBPartner sdn = new MBPartner(getCtx(), cBPartnerId, get_TrxName());
                // 2. Ejecutar funciones para obtener importes
                // Fecha + 1 día
                Timestamp fecha = null;
                if (lote.getDateTrx() != null) {
                    fecha = new Timestamp(lote.getDateTrx().getTime() + 24L * 60L * 60L * 1000L);
                }
                BigDecimal saldoPPal = DB.getSQLValueBD(get_TrxName(),
                    "SELECT comit_saldo_inicial_sueldo_empleado_por_tipo(?, ?, 'N')",
                    cBPartnerId, fecha);
                BigDecimal saldoMiles = DB.getSQLValueBD(get_TrxName(),
                    "SELECT comit_saldo_inicial_sueldo_empleado_por_tipo(?, ?, 'Y')",
                    cBPartnerId, fecha);
                if (saldoPPal == null) saldoPPal = BigDecimal.ZERO;
                if (saldoMiles == null) saldoMiles = BigDecimal.ZERO;
                // 3. Crear línea de lote
                MLARLoteSueldosLine line = new MLARLoteSueldosLine(getCtx(), 0, get_TrxName());
                line.setAD_Org_ID(rs.getInt("AD_Org_ID"));
                line.setLAR_LoteSueldos_ID(lote.getLAR_LoteSueldos_ID());
                line.setC_BPartner_ID(cBPartnerId);
                line.setC_BankAccount_ID(lote.getC_BankAccount_ID());
                // Se recupera la forma de Pago del socio de negocio (Proveedor)
                String ttype = sdn.getPaymentRulePO();
                if (ttype == null || ttype.isEmpty())
                {
                    // Detener el proceso y mostrar error al usuario
                    throw new AdempiereUserError("El Socio de Negocio " + sdn.getName() + " no tiene definida una Forma de Pago.");
                }
                line.setTenderType(convertPaymentRuleToTenderType(ttype));
                line.setLAR_Deposito_Directo_ID(lote.getLAR_Deposito_Directo_ID());
                line.setTenderTypeMiles(lote.getTenderTypeMiles());
                line.setC_Remuneration_ID(p_C_Remuneration_ID);
                line.setDescription(lote.getDescription());
                // Lógica según tipo de sueldo
                if ("M".equalsIgnoreCase(p_TipoSueldo)) {
                    line.setImportePpal(BigDecimal.ZERO);
                    line.setImporteMiles(saldoMiles);
                    if (saldoMiles.compareTo(BigDecimal.ZERO) > 0) {
                        totalImporte = totalImporte.add(saldoMiles);
                    }
                } else if ("P".equalsIgnoreCase(p_TipoSueldo)) {
                    line.setImportePpal(saldoPPal);
                    line.setImporteMiles(BigDecimal.ZERO);
                    if (saldoPPal.compareTo(BigDecimal.ZERO) > 0) {
                        totalImporte = totalImporte.add(saldoPPal);
                    }
                } else { // Todos
                    line.setImportePpal(saldoPPal);
                    line.setImporteMiles(saldoMiles);
                    if (saldoPPal.compareTo(BigDecimal.ZERO) > 0) {
                        totalImporte = totalImporte.add(saldoPPal);
                    }
                    if (saldoMiles.compareTo(BigDecimal.ZERO) > 0) {
                        totalImporte = totalImporte.add(saldoMiles);
                    }
                }
                line.saveEx();
                count++;
            }
        } finally {
            DB.close(rs, pstmt);
        }
        lote.setLoteImporte(totalImporte);
        lote.saveEx();
        return "Importes Recuperados para " + count + " empleados.";
    }

    public static String convertPaymentRuleToTenderType(String paymentRule) {
        if (paymentRule == null)
            return null;

        switch (paymentRule) {
            case "B": // Cash
            case "N": // Contra Reembolso Contado
                return "X";
            case "S": // Cheque propio
            case "Z": // Cheque de terceros
            case "O": // Contrareembolso cheque propio
                return "K";
            case "K": // Credit Card
                return "C";
            case "T": // Direct Deposit / Transfer
                return "A";
            case "D": // Direct Debit
                return "D";
            case "P": // On Credit / Account
                return "T";
            default:
                return "A"; // Default fallback
        }
    }

}