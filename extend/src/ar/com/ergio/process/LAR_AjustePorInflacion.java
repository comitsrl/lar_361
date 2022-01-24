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
package ar.com.ergio.process;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

import org.compiere.model.I_GL_JournalLine;
import org.compiere.model.MAccount;
import org.compiere.model.MAcctSchema;
import org.compiere.model.MAcctSchemaElement;
import org.compiere.model.MElementValue;
import org.compiere.model.MJournal;
import org.compiere.model.MJournalLine;
import org.compiere.model.MPeriod;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereUserError;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.compiere.util.Msg;

/**
 * Proceso de Ajuste por inflación
 *
 * @author Marcos Zúñiga - http://www.comit.com.ar
 */
public class LAR_AjustePorInflacion extends SvrProcess
{
    // Tipo de Documento Asiento Contable
    private static final  int C_DOCTYPE_Asiento_Contable = 1000000;
    // Categoría de Contabilidad General - Standard (Tipo Manual)
    private static final  int GL_CATEGORY_Standard = 1000002;
    // Esquema Contable
    private static final  int C_ACCOUNTSCHEMA_ID = 1000000;
    // Tipo de Contabilización Posting Type
    private static String POSTINGTYPE = "A";
    // Conversion Type (Spot) Solo de referencia se ajusta en ARS
    private static final  int C_CONVERSIONTYPE_ID = 114;
    // Directorio de trabajo del proceso
    private static final String DIRECTORIO_PROCESO = "ComitSRL/";

    private String ruta = "";
    private String mensajeError = "";
    private int cantRegistros = 0;
    private LocalDate fechaInicial = null;
    private LocalDate fechaFinal = null;
    private Timestamp fechaTimestamp = null;
    private int cuentaRECPAM_ID = 0;
    private MElementValue cuentaRECPAM = null;
    private boolean soloEjecutaReporte = false;

    @Override
    protected void prepare()
    {
        // TODO Parametrizar la ruta (en Preferencias o Parámetro)
        String osName = System.getProperty("os.name");
        if(osName.equals("Linux"))
            ruta = System.getProperty("user.home") + "/" + DIRECTORIO_PROCESO;
        else
            ruta = "C:/" + DIRECTORIO_PROCESO;

        final File dir = new File(ruta);
        if (!dir.exists())
            dir.mkdirs();

        ProcessInfoParameter[] para = getParameter();
        for (int i = 0; i < para.length; i++)
        {
            String name = para[i].getParameterName();

            if (para[i].getParameter() == null)
                ;
            else if (name.equals("FechaInicial"))
            {
                fechaTimestamp = (Timestamp) para[i].getParameter();
                fechaInicial = fechaTimestamp.toLocalDateTime().toLocalDate();
            }
            else if (name.equals("FechaFinal"))
            {
                fechaTimestamp = (Timestamp) para[i].getParameter();
                fechaFinal = fechaTimestamp.toLocalDateTime().toLocalDate();
            }
            else if (name.equals("SoloEjecutaReporte"))
            {
                soloEjecutaReporte = para[i].getParameterAsBoolean();
            }
            else if (name.equals("Account_ID"))
            {
                cuentaRECPAM_ID = para[i].getParameterAsInt();
                cuentaRECPAM = new MElementValue(getCtx(), cuentaRECPAM_ID, get_TrxName());
            }
            else if (name.equals("GeneraAsientos"))
            {
                // Parámetro no utilizado;
            }
            else
            {
                log.log(Level.SEVERE, "Unknown Parameter: " + name);
            }
        }
    } // prepare

    @Override
    protected String doIt() throws Exception
    {
        final LocalTime inicio = LocalTime.now();
        int cantAsientosCreados = 0;

        try
        {
            // Se crea el archivo para el reporte
            final String dia = String.valueOf(fechaInicial.getDayOfMonth());
            final String mes = (fechaInicial.getMonthValue() < 10) ? "0" + String.valueOf(fechaInicial.getMonthValue()) : String.valueOf(fechaInicial.getMonthValue());
            final String anio = String.valueOf(fechaInicial.getYear());
            final String diaF = String.valueOf(fechaFinal.getDayOfMonth());
            final String mesF = (fechaFinal.getMonthValue() < 10) ? "0" + String.valueOf(fechaFinal.getMonthValue()) : String.valueOf(fechaFinal.getMonthValue());
            final String anioF = String.valueOf(fechaFinal.getYear());
            final String reporte = "Reporte_RECPAM_" + dia + mes + anio + "_hasta_" +  diaF + mesF + anioF + "_" + get_TrxName().substring(get_TrxName().length() - 6) + ".csv";
            final File archivoReporte = new File(ruta + reporte);
            // Buffers para la escritura en disco
            final BufferedWriter bufferReporte = new BufferedWriter(new FileWriter(archivoReporte));

            // *** Titulo
            StringBuffer titulo = new StringBuffer();
            String fecha = dia + "/" + mes  + "/" + anio;
            String fechaF = diaF + "/" + mesF  + "/" + anioF;
            titulo.append("Ajuste desde " + fecha + " hasta " + fechaF + "|" + "\n");
            bufferReporte.write(titulo.toString());

            // *** Cabeceras de Columna (Reporte)
            final StringBuffer lineaReporte = new StringBuffer();
            lineaReporte.append("Codigo|Cuenta|Periodo|Saldo|Indice|Saldo_Ajustado|RECPAM\n");
            bufferReporte.write(lineaReporte.toString());

            // Se recuperan los períodos en base a las fechas recuperadas del parámetro
            Integer[] periodos = recuperarPeriodos(get_TrxName());
            if (periodos == null)
            {
                bufferReporte.close();
                mensajeError = "No se recuperaron períodos";
                throw new AdempiereUserError("No se recuperaron períodos");
            }

            // Se recuperan los IDs de las cuentas que se incluirán en el ajuste
            Integer[] cuentas = recuperarCuentas(get_TrxName());
            if (cuentas == null)
            {
                bufferReporte.close();
                throw new AdempiereUserError("No se recuperaron cuentas candidatas para procesar");
            }
            // Se recorren las cuentas
            for (int c = 0; c < cuentas.length; c++)
            {
                MElementValue cuenta = new MElementValue(getCtx(), cuentas[c], get_TrxName());
                String codigoCuenta = cuenta.getValue();
                String nombreCuenta = cuenta.getName();
                /********************************************************
                 * Por cada Cuenta se calcula el importe mensual de ajuste según el coeficiente
                 * del período correspondiente.
                 */

                // Se recorren los períodos y se va calculando el ajuste acumulado
                // Se escribe el detalle en el archivo/reporte
                String periodoFinal = "";
                Timestamp fechaFinalperiodoFinal = null;
                MPeriod periodo = null;
                BigDecimal saldoAjustado = Env.ZERO;
                BigDecimal sumaRECPAM = Env.ZERO;
                for (int p = 0; p < periodos.length; p++)
                {
                    periodo = new MPeriod(getCtx(), periodos[p], get_TrxName());
                    String nombrePeriodo = periodo.getName();
                    BigDecimal indice = (BigDecimal) periodo.get_Value("IndiceAjusteInflacion");
                    final Timestamp pFechaInicial = periodo.getStartDate();
                    final Timestamp pFechaFinal = periodo.getEndDate();

                    // Obtener el saldo de la cuenta en el período
                    BigDecimal saldo = saldoCuenta(pFechaInicial, pFechaFinal, cuenta.getC_ElementValue_ID());
                    if (saldo == null)
                    {
                        final String msg = String.format(
                                "Error al recuperar el saldo de la cuenta %s - %s", codigoCuenta, nombreCuenta);
                        bufferReporte.close();
                        throw new AdempiereUserError(msg);
                    }

                    // Calcular el saldo ajustado y la diferencia
                    //saldoAjustado = saldo.multiply(indice, new MathContext(6, RoundingMode.HALF_UP));
                    saldoAjustado = saldo.multiply(indice);
                    BigDecimal recpam = saldoAjustado.subtract(saldo).setScale(2, RoundingMode.HALF_UP);
                    sumaRECPAM = sumaRECPAM.add(recpam);
                    //registraro en el archivo/reporte
                    //("Codigo|Cuenta|Periodo|Saldo|Indice|Saldo_Ajustado|RECPAM\n");
                    lineaReporte.delete(0, lineaReporte.length());
                    lineaReporte.append(codigoCuenta).append("|");
                    lineaReporte.append(nombreCuenta).append("|");
                    lineaReporte.append(nombrePeriodo).append("|");
                    lineaReporte.append(String.format("%.2f",saldo)).append("|");
                    lineaReporte.append(String.format("%.2f",indice)).append("|");
                    lineaReporte.append(String.format("%.2f",saldoAjustado)).append("|");
                    lineaReporte.append(String.format("%.2f",recpam)).append("|");
                    lineaReporte.append("\n");
                    bufferReporte.write(lineaReporte.toString());
                    periodoFinal = nombrePeriodo;
                    fechaFinalperiodoFinal = pFechaFinal;
                } // Se recorren los períodos

                if (!soloEjecutaReporte && !sumaRECPAM.setScale(2).equals(Env.ZERO.setScale(2)))
                {
                    // Generar el asiento para la cuenta
                    // Dejarlo registrado como Asiento Manual
                    MJournal asiento = new MJournal(getCtx(), 0, get_TrxName());
                    asiento.setDescription("Ajuste por Inflación - Cuenta: " + codigoCuenta + " al "
                            + periodoFinal);
                    asiento.setDocumentNo(
                            codigoCuenta + "-" + periodoFinal + get_TrxName().substring(get_TrxName().length() - 6));
                    // AccountSchema_ID
                    asiento.setC_AcctSchema_ID(C_ACCOUNTSCHEMA_ID);
                    // Tipo contabilización = Real
                    asiento.setPostingType(POSTINGTYPE);
                    // Tipo de Documento = Asiento Contable
                    asiento.setC_DocType_ID(C_DOCTYPE_Asiento_Contable);
                    // Categoría de CG = Standard
                    asiento.setGL_Category_ID(GL_CATEGORY_Standard);
                    asiento.setDateAcct(fechaFinalperiodoFinal);
                    asiento.setDateDoc(fechaFinalperiodoFinal);
                    // Período
                    asiento.setC_Period_ID(periodo.getC_Period_ID());
                    // Moneda ARS
                    asiento.setC_Currency_ID(118);
                    // Conversion Typec_conversiontype_id = 4000003
                    asiento.setC_ConversionType_ID(C_CONVERSIONTYPE_ID);

                    asiento.save(get_TrxName());
                    MJournalLine lineaDR = new MJournalLine(asiento);
                    MJournalLine lineaCR = new MJournalLine(asiento);
                    // *** Línea Debe ***
                    // Si el saldo > 0 entonces es saldo Deudor
                    // Se debe incrementar ese saldo
                    if (sumaRECPAM.compareTo(Env.ZERO) > 0)
                        lineaDR.setAccount_ID(cuenta.getC_ElementValue_ID());
                    else
                        lineaDR.setAccount_ID(cuentaRECPAM_ID);

                    // Combinación Contable
                    getOrCreateCombination(asiento, lineaDR);
                    // amtsourcedr amtsourcecr
                    lineaDR.setAmtSourceDr(sumaRECPAM.abs());
                    lineaDR.saveEx(get_TrxName());

                    // *** Línea Haber ***
                    if (sumaRECPAM.compareTo(Env.ZERO) > 0)
                        lineaCR.setAccount_ID(cuentaRECPAM_ID);
                    else
                        lineaCR.setAccount_ID(cuenta.getC_ElementValue_ID());
                    // Combinación Contable
                    getOrCreateCombination(asiento, lineaCR);
                    // amtsourcedr amtsourcecr
                    lineaCR.setAmtSourceCr(sumaRECPAM.abs());
                    lineaCR.saveEx(get_TrxName());

                    // Completar el Asiento (GL Journal)
                    asiento.setDocStatus(asiento.completeIt());
                    asiento.saveEx(get_TrxName());
                } // !soloEjecutaReporte

                // Registra el asiento generado en el archivo - Linea DR
                lineaReporte.delete(0, lineaReporte.length());
                lineaReporte.append("->").append("|");
                lineaReporte.append("DEBE").append("|");
                if (sumaRECPAM.compareTo(Env.ZERO) > 0)
                    lineaReporte.append(cuenta.getValue()).append("|");
                else
                    lineaReporte.append(cuentaRECPAM.getValue()).append("|");
                lineaReporte.append(String.format("%.2f",sumaRECPAM.abs()));
                lineaReporte.append("\n");
                bufferReporte.write(lineaReporte.toString());
                
                // Registra el asiento generado en el archivo - Linea CR
                lineaReporte.delete(0, lineaReporte.length());
                lineaReporte.append("-->").append("|");
                lineaReporte.append("HABER").append("|");
                if (sumaRECPAM.compareTo(Env.ZERO) > 0)
                    lineaReporte.append(cuentaRECPAM.getValue()).append("|");
                else
                    lineaReporte.append(cuenta.getValue()).append("|");
                lineaReporte.append(0).append("|");
                lineaReporte.append(String.format("%.2f",sumaRECPAM.abs()));
                lineaReporte.append("\n");
                bufferReporte.write(lineaReporte.toString());

                // Separación entre cuentas en el archivo
                lineaReporte.delete(0, lineaReporte.length());
                lineaReporte.append("--------------").append("|");
                lineaReporte.append("\n");
                bufferReporte.write(lineaReporte.toString());

                if (!sumaRECPAM.setScale(2).equals(Env.ZERO.setScale(2)))
                    cantAsientosCreados = cantAsientosCreados + 1;
            } // Se recorren las cuentas

            bufferReporte.close();
        }
        catch (Exception e)
        {
            String msg = String.format("Error al crear generar el asiento. %s", mensajeError);
            log.log(Level.SEVERE, msg, e);
            throw new AdempiereUserError(msg);
        }

        final Duration duracion = Duration.between(inicio, LocalTime.now());
        final String tiempoProceso = LocalTime.MIDNIGHT.plus(duracion).format(DateTimeFormatter.ofPattern("HH 'hs' mm 'min' ss 'seg'")); 

        return String.format("<b>PROCESAMIENTO OK</b><br/><br/>Cuentas Procesadas: %d  -  Asientos Creados: %d<br/><br/>Tiempo de proceso: %s",
                cantRegistros, cantAsientosCreados, tiempoProceso);
    } // doIt

    /**
     *  Obtiene el listado de IDs de Cuentas
     *  marcadas para realizar el ajuste por inflación
     *
     *  @return Lista de IDs
     */
    public Integer[] recuperarCuentas(String trxName)
    {
        List<Integer> cuentas = new ArrayList<Integer>();

        String sql = "SELECT ev.C_ElementValue_ID "
                   + "  FROM C_ElementValue ev "
                   + " WHERE ev.IsActive = 'Y'"
                   + " AND ev.AjustaPorInflacion = 'Y'"
                   + " ORDER BY ev.value";

        PreparedStatement pstmt;
        pstmt = DB.prepareStatement(sql, trxName);
        ResultSet rs = null;

        try
        {
            rs = pstmt.executeQuery();
            while (rs.next())
                cuentas.add(rs.getInt(1));
            Integer[] arr = new Integer[cuentas.size()];
            cantRegistros = cuentas.size();
            log.warning(String.format("Se recuperaron %d cuentas candidatas.", cuentas.size()));
            return cuentas.toArray(arr);
        } catch (SQLException e)
        {
            log.log(Level.SEVERE, sql, e);
            return null;
        } finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }
    } // recuperarCuentas

    /**
     *  Obtiene el listado de IDs de Períodos
     *  incluídos entre las fechas ingresadas
     *
     *  @return Lista de IDs
     */
    public Integer[] recuperarPeriodos(String trxName)
    {
        List<Integer> periodos = new ArrayList<Integer>();

        String sql = "SELECT C_Period_ID "
                   + "  FROM C_Period "
                   + "WHERE StartDate >= ? " // 1 Fecha Inicial 
                   + "AND EndDate <= ? " // 2 Fecha Final
                   + "AND AD_Client_ID = ? "
                   + "ORDER BY EndDate"; // 3 Compañia

        PreparedStatement pstmt;
        pstmt = DB.prepareStatement(sql, trxName);
        ResultSet rs = null;

        try
        {
            pstmt.setTimestamp(1, Timestamp.valueOf(fechaInicial.atStartOfDay()));
            pstmt.setTimestamp(2, Timestamp.valueOf(fechaFinal.atStartOfDay()));
            pstmt.setInt(3, this.getAD_Client_ID());
            rs = pstmt.executeQuery();
            while (rs.next())
                periodos.add(rs.getInt(1));
            Integer[] arr = new Integer[periodos.size()];
            log.warning(String.format("Se recuperaron %d períodos.", periodos.size()));
            return periodos.toArray(arr);
        } catch (SQLException e)
        {
            log.log(Level.SEVERE, sql, e);
            return null;
        } finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }
    } // recuperarPeríodos

    /**
     * Obtener el saldo de la cuenta entre fechas Saldo = AmtAcctDR - AmtAcctCR
     * 
     * @return saldo
     * @throws AdempiereUserError
     */
    private BigDecimal saldoCuenta(Timestamp fInicial, Timestamp fFinal, int Account_ID) throws AdempiereUserError
    {
        BigDecimal saldo = null;
        // Obtener la sumatoria del debe y haber entre fechas
        String sqlSaldo = "SELECT "
                + "        SUM(COALESCE(f.amtacctdr, 0)) AS AmtAcctDR, "
                + "        SUM(COALESCE(f.amtacctcr, 0)) AS AmtAcctCR "
                + "   FROM rv_fact_acct_principales f "
                + "   JOIN ad_org o ON f.ad_org_id = o.ad_org_id "
                + "   JOIN ad_orginfo oi ON o.ad_org_id = oi.ad_org_id AND oi.ismiles = 'N' "
                + "   JOIN c_elementvalue ev ON f.account_id = ev.c_elementvalue_id "
                + "   WHERE "
                + "        f.isactive='Y' "
                + "        AND f.AD_Client_ID = ? " // 1 Compañía
                + "        AND f.DateAcct BETWEEN ? AND ? " // 2 Fecha Inicial, 3 Fecha Final 
                + "        AND f.Account_ID = ? " // 4 Cuenta
                + "   GROUP BY ev.value, ev.name, ev.accounttype ";

        PreparedStatement pstmtSaldo;
        pstmtSaldo = DB.prepareStatement(sqlSaldo, get_TrxName());
        ResultSet rsSaldo = null;
        try
        {
            pstmtSaldo = DB.prepareStatement(sqlSaldo, get_TrxName());
            pstmtSaldo.setInt(1, this.getAD_Client_ID());
            pstmtSaldo.setTimestamp(2, fInicial);
            pstmtSaldo.setTimestamp(3, fFinal);
            pstmtSaldo.setInt(4, Account_ID);

            rsSaldo = pstmtSaldo.executeQuery();
            saldo = Env.ZERO;
            while (rsSaldo.next())
            {
                // Se recuperan los importes y calcula el saldo
                BigDecimal sumaDR = rsSaldo.getBigDecimal("AmtAcctDR");
                BigDecimal sumaCR = rsSaldo.getBigDecimal("AmtAcctCR");
                saldo = sumaDR.subtract(sumaCR);
            }
        } catch (SQLException e)
        {
            log.log(Level.SEVERE, sqlSaldo, e);
            throw new AdempiereUserError(e.getLocalizedMessage());
        } finally
        {
            DB.close(rsSaldo, pstmtSaldo);
            rsSaldo = null;
            pstmtSaldo = null;
        }

        return saldo;
    } // saldoCuenta

    /** Update combination and optionally **/
    private boolean getOrCreateCombination(MJournal asiento, MJournalLine linea)
    {

            // Validate all mandatory combinations are set
            MAcctSchema as = (MAcctSchema) asiento.getC_AcctSchema();
            String errorFields = "";
            for (MAcctSchemaElement elem : MAcctSchemaElement.getAcctSchemaElements(as)) {
                if (! elem.isMandatory())
                    continue;
                String et = elem.getElementType();
                if (MAcctSchemaElement.ELEMENTTYPE_Account.equals(et) && linea.getAccount_ID() == 0)
                    errorFields += "@" + I_GL_JournalLine.COLUMNNAME_Account_ID + "@, ";
                if (MAcctSchemaElement.ELEMENTTYPE_Activity.equals(et) && linea.getC_Activity_ID() == 0)
                    errorFields += "@" + I_GL_JournalLine.COLUMNNAME_C_Activity_ID + "@, ";
                if (MAcctSchemaElement.ELEMENTTYPE_BPartner.equals(et) && linea.getC_BPartner_ID() == 0)
                    errorFields += "@" + I_GL_JournalLine.COLUMNNAME_C_BPartner_ID + "@, ";
                if (MAcctSchemaElement.ELEMENTTYPE_Campaign.equals(et) && linea.getC_Campaign_ID() == 0)
                    errorFields += "@" + I_GL_JournalLine.COLUMNNAME_C_Campaign_ID + "@, ";
                if (MAcctSchemaElement.ELEMENTTYPE_Organization.equals(et) && linea.getAD_Org_ID() == 0)
                    errorFields += "@" + I_GL_JournalLine.COLUMNNAME_AD_Org_ID + "@, ";
                if (MAcctSchemaElement.ELEMENTTYPE_OrgTrx.equals(et) && linea.getAD_OrgTrx_ID() == 0)
                    errorFields += "@" + I_GL_JournalLine.COLUMNNAME_AD_OrgTrx_ID + "@, ";
                if (MAcctSchemaElement.ELEMENTTYPE_Product.equals(et) && linea.getM_Product_ID() == 0)
                    errorFields += "@" + I_GL_JournalLine.COLUMNNAME_M_Product_ID + "@, ";
                if (MAcctSchemaElement.ELEMENTTYPE_Project.equals(et) && linea.getC_Project_ID() == 0)
                    errorFields += "@" + I_GL_JournalLine.COLUMNNAME_C_Project_ID + "@, ";
                if (MAcctSchemaElement.ELEMENTTYPE_SalesRegion.equals(et) && linea.getC_SalesRegion_ID() == 0)
                    errorFields += "@" + I_GL_JournalLine.COLUMNNAME_C_SalesRegion_ID + "@, ";
            }
            if (errorFields.length() > 0)
            {
                log.saveError("Error", Msg.parseTranslation(getCtx(), "@IsMandatory@: " + errorFields.substring(0, errorFields.length() - 2)));
                return false;
            }
            
            MAccount acct = MAccount.get(getCtx(), getAD_Client_ID(), linea.getAD_Org_ID(), asiento.getC_AcctSchema_ID(), linea.getAccount_ID(),
                    linea.getC_SubAcct_ID(), linea.getM_Product_ID(), linea.getC_BPartner_ID(), linea.getAD_OrgTrx_ID(), linea.getC_LocFrom_ID(),
                    linea.getC_LocTo_ID(), linea.getC_SalesRegion_ID(), linea.getC_Project_ID(), linea.getC_Campaign_ID(), 
                    linea.getC_Activity_ID(), linea.getUser1_ID(), linea.getUser2_ID(), linea.getUserElement1_ID(), linea.getUserElement2_ID());

            if (acct != null)
            {
                acct.saveEx(get_TrxName()); // get ID from transaction
                linea.setC_ValidCombination_ID(acct.get_ID());
                if (acct.getAlias() != null && acct.getAlias().length() > 0)
                    linea.setAlias_ValidCombination_ID(acct.get_ID());
                else
                    linea.setAlias_ValidCombination_ID(0);
            }

        return true;
    }   //  getOrCreateCombination
}
