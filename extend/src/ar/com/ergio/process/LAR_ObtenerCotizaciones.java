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

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.logging.Level;

import org.compiere.model.MConversionRate;
import org.compiere.model.MCurrency;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereUserError;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.jsoup.Connection.Response;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import ar.com.ergio.util.LAR_Utils;

/**
 * Proceso que obtiene las tasas de cambio del banco nación, y actualiza las
 * tasas existentes en Adempiere.
 *
 * @author fchiappano
 */
public class LAR_ObtenerCotizaciones extends SvrProcess
{
    private static final String BNA_PERSONAS_URL = "https://www.bna.com.ar/Personas";
    private static final String BNA_USER_AGENT = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) "
            + "AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36";
    private static final int BNA_TIMEOUT_MS = 60 * 1000;
    private static final int BNA_MAX_INTENTOS = 5;
    private static final long BNA_REINTENTO_BASE_MS = 30 * 1000L;

    private int monedaExtranjera = 100;
    private int tipoCambioDivisa = 4000001;
    private int tipoCambioBillete = 4000002;
    private int diasVigencia = 7;

    @Override
    protected void prepare()
    {
        ProcessInfoParameter[] para = getParameter();
        for (int i = 0; i < para.length; i++)
        {
            String name = para[i].getParameterName();
            if (para[i].getParameter() == null)
                ;
            else
                log.log(Level.SEVERE, "Par\u00e1metro desconocido: " + name);
        }
    } // prepare

    @Override
    protected String doIt() throws Exception
    {
        /**************************************************************************************************
         * FIXME @fchiappano
         *
         * Para utilizar esta funcionalidad, se debe agregar dentro de la instalación de Adempiere,
         * la siguiente libreria jsoup-1.10.3.jar (ultima versión compatible con JDK 1.6).
         *
         * Ruta dentro del repositorio: lar_361/lib/jsoup-1.10.3.jar
         * Ruta destino en instalación de Adempiere: Adempiere/jboss/server/adempiere/lib/jsoup-1.10.3.jar
         **************************************************************************************************/

        try
        {
            // @fchiappano Conectarse al sitio web y recuperar codigo HTML
            Document doc = obtenerDocumentoBNA();

            // @fchiappano Obtener tasa de venta Dolar Billete y Dolar Divisa.
            Elements cotizacionesBilletes = doc.select("#billetes > table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(3)");
            Elements cotizacionesDivisas = doc.select("#divisas > table:nth-child(1) > tbody:nth-child(2) > tr:nth-child(1) > td:nth-child(3)");

            BigDecimal bnaBillete = Env.ZERO;
            BigDecimal bnaDivisa = Env.ZERO;

            // @fchiappano Validar que se haya recuperado una tasa billete.
            if (cotizacionesBilletes.size() > 0)
                bnaBillete = new BigDecimal(cotizacionesBilletes.get(0).text().replace(",", "."));
            else
                throw new AdempiereUserError("No fue posible recuperar tasa de cambio BNA Billete");

            // @fchiappano Validar que se haya recuperado una tasa divisa.
            if (cotizacionesDivisas.size() > 0)
                bnaDivisa = new BigDecimal(cotizacionesDivisas.get(0).text().replace(",", "."));
            else
                throw new AdempiereUserError("No fue posible recuperar tasa de cambio BNA Divisa");

            // @fchiappano Redondear tasas, según la precisión de la moneda.
            int precision = MCurrency.getStdPrecision(getCtx(), monedaExtranjera);
            bnaBillete = bnaBillete.setScale(precision, RoundingMode.HALF_UP);
            bnaDivisa = bnaDivisa.setScale(precision, RoundingMode.HALF_UP);

            // @fchiappano Recuperar y actualizar tasas de cambio de Adempiere.
            MConversionRate tasaBillete = getTasaCambio(tipoCambioBillete);

            if (tasaBillete == null || bnaBillete.compareTo(tasaBillete.getMultiplyRate()) != 0)
                generarTasacambio(bnaBillete, tipoCambioBillete);

            MConversionRate tasaDivisa = getTasaCambio(tipoCambioDivisa);

            if (tasaDivisa == null || bnaDivisa.compareTo(tasaDivisa.getMultiplyRate()) != 0)
                generarTasacambio(bnaDivisa, tipoCambioDivisa);
        }
        catch (IOException ex)
        {
            log.log(Level.SEVERE, "Error al intentar conectar con el sitio web", ex);
            throw new AdempiereUserError("Error al intentar conectar con el sitio web: " + ex.getMessage());
        }
        catch (InterruptedException ex)
        {
            Thread.currentThread().interrupt();
            log.log(Level.SEVERE, "Se interrumpio la conexion con el sitio web", ex);
            throw new AdempiereUserError("Se interrumpio la conexion con el sitio web: " + ex.getMessage());
        }

        return null;
    } // doIt

    private Document obtenerDocumentoBNA() throws IOException, InterruptedException, AdempiereUserError
    {
        IOException ultimoError = null;

        for (int intento = 1; intento <= BNA_MAX_INTENTOS; intento++)
        {
            try
            {
                Response response = buildBNAConnection().execute();

                if (response.statusCode() == 200)
                    return response.parse();

                String errorMsg = "Error al acceder al sitio web: Status code = " + response.statusCode()
                        + ", Response = " + limitarTexto(response.body());
                if (!isStatusReintentable(response.statusCode()) || intento == BNA_MAX_INTENTOS)
                {
                    log.severe(errorMsg);
                    throw new AdempiereUserError(errorMsg);
                }

                log.warning(errorMsg + ". Reintentando conexion con BNA (" + intento + "/" + BNA_MAX_INTENTOS + ").");
            }
            catch (IOException ex)
            {
                ultimoError = ex;
                if (intento == BNA_MAX_INTENTOS)
                    throw ex;

                log.log(Level.WARNING, "Fallo transitorio al conectar con BNA. Reintentando (" + intento + "/"
                        + BNA_MAX_INTENTOS + ").", ex);
            }

            Thread.sleep(getDemoraReintento(intento));
        }

        throw ultimoError;
    } // obtenerDocumentoBNA

    private org.jsoup.Connection buildBNAConnection()
    {
        return Jsoup.connect(BNA_PERSONAS_URL)
                .userAgent(BNA_USER_AGENT)
                .timeout(BNA_TIMEOUT_MS);
    } // buildBNAConnection

    private boolean isStatusReintentable(int statusCode)
    {
        return statusCode == 408 || statusCode == 429 || statusCode >= 500;
    } // isStatusReintentable

    private long getDemoraReintento(int intento)
    {
        return BNA_REINTENTO_BASE_MS * intento;
    } // getDemoraReintento

    private String limitarTexto(String texto)
    {
        if (texto == null)
            return "";
        return texto.length() <= 500 ? texto : texto.substring(0, 500);
    } // limitarTexto

    /**
     * Obtener la tasa vigente, según el tipo de cambio indicado.
     * 
     * @author fchiappano
     * @return tasa de cambio.
     */
    private MConversionRate getTasaCambio(final int c_ConversionType_ID)
    {
        MConversionRate tasa = null;
        int monedaLocal = LAR_Utils.getMonedaPredeterminada(getCtx(), getAD_Client_ID(), get_TrxName());

        String sql = "SELECT C_Conversion_Rate_ID"
                   +  " FROM C_Conversion_Rate"
                   + " WHERE C_Currency_ID = ?"
                   +   " AND C_Currency_ID_To = ?"
                   +   " AND IsActive = 'Y'"
                   +   " AND ValidFrom < Now()"
                   +   " AND ValidTo > Now()"
                   +   " AND C_ConversionType_ID = ?"
                   +   " AND AD_Client_ID = ?"
                   + " ORDER BY ValidFrom DESC";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            pstmt = DB.prepareStatement(sql, get_TrxName());
            pstmt.setInt(1, monedaExtranjera);
            pstmt.setInt(2, monedaLocal);
            pstmt.setInt(3, c_ConversionType_ID);
            pstmt.setInt(4, getAD_Client_ID());
            rs = pstmt.executeQuery();

            if (rs.next())
                tasa = new MConversionRate(getCtx(), rs.getInt(1), get_TrxName());
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

        return tasa;
    } // getTasaCambio

    /**
     * Obtener fecha de vigencia, sumando la cantidad de dias especificados a la fecha actual.
     * @author fchiappano
     * @return fecha de vigencia.
     */
    private Timestamp getFechaVigencia()
    {
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(System.currentTimeMillis());
        calendar.add(Calendar.DAY_OF_YEAR, diasVigencia);

        Timestamp fechaVigencia = new Timestamp(calendar.getTimeInMillis());

        return fechaVigencia;
    } // getFechaVigencia

    /**
     * Crear una nueva tasa de cambio, para el tipo de cambio especificado.
     * @author fchiappano
     * @param tasaMultiplicadora
     * @param tipoCambio
     */
    private void generarTasacambio(final BigDecimal tasaMultiplicadora, final int tipoCambio)
    {
        int monedaLocal = LAR_Utils.getMonedaPredeterminada(getCtx(), getAD_Client_ID(), get_TrxName());
        MConversionRate nuevaTasa = new MConversionRate(Env.getCtx(), 0, get_TrxName());
        nuevaTasa.set_ValueOfColumn("AD_Client_ID", 1000000);
        nuevaTasa.setAD_Org_ID(0);
        nuevaTasa.setMultiplyRate(tasaMultiplicadora);
        nuevaTasa.setC_ConversionType_ID(tipoCambio);
        nuevaTasa.setValidTo(new Timestamp(System.currentTimeMillis()));
        nuevaTasa.setC_Currency_ID(monedaExtranjera);
        nuevaTasa.setC_Currency_ID_To(monedaLocal);
        nuevaTasa.saveEx(get_TrxName());
    } // generarTasacambio

} // LAR_ChequeEnCarteraPorCaja
