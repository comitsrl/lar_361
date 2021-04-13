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
package ar.com.comit.factura.electronica;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.StringReader;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.model.MAttachment;
import org.compiere.model.MAttachmentEntry;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.dom4j.Document;
import org.dom4j.io.SAXReader;

import ar.com.comit.wsfe.Wsaa;

/**
 * Procesador que interactuara con el modulo WSAA de afip, para solicitud de ticket de acceso.
 * @author fchiappano
 *
 */
public class ProcesadorWSAA
{
    private static CLogger log = CLogger.getCLogger(ProcesadorWSAA.class);

    // @fchiappano Constante que almacenara el certificado adjunto en la BD.
    private static File certificadoFE = null;
    // @fchiappano Constantes que almacenaran los datos relevantes del ticket de acceso, provisto por afip, para el servicio WSFE.
    private static String tokenFE = "";
    private static String signFE = "";
    private static Timestamp fechaExpiracionFE = null;
    private static int configFE_ID = 0;
    // @fchiappano Constantes que almacenaran los datos relevantes del ticket de
    // acceso, provisto por afip, para el servicio WSFEX.
    private static File certificadoFEX = null;
    private static String tokenFEX = "";
    private static String signFEX = "";
    private static Timestamp fechaExpiracionFEX = null;
    private static int configFEX_ID = 0;
    // @fchiappano variable que almacenara los mensajes de error.
    private static String msgError = "";

    private static Properties ctx = Env.getCtx();

    // @fchiappano Variables de configuración para WSFE.
    private static String CMS_FE;
    private static String servicioFE;
    private static long ticketTimeFE;
    private static String signerFE;
    private static String claveCifradoFE;
    private static String dstDN_FE;
    private static String certificado_nameFE;
    private static String WSDL_FE;
    private static int conceptoFE;

    // @fchiappano Variables de configuración para WSFEX.
    private static String CMS_FEX;
    private static String servicioFEX;
    private static long ticketTimeFEX;
    private static String signerFEX;
    private static String claveCifradoFEX;
    private static String dstDN_FEX;
    private static String certificado_nameFEX;
    private static String WSDL_FEX;
    private static int conceptoFEX;

    private static int table_ID;

    /**
     * Constructor que evita la instanciación de la clase.
     */
    private ProcesadorWSAA() {}

    /**
     * Recuperar ticket de acceso, solicitado al WS de Afip.
     * @return
     */
    public static String[] getTicketAcceso(final String servicio)
    {
        if (servicio.equals("WSFE"))
        {
            // @fchiappano Si no existe aún el TA o esta vencido, se solicita
            // uno nuevo.
            if ((tokenFE == null || tokenFE.equals("")) || (signFE == null || signFE.equals(""))
                    || fechaExpiracionFE.before(new Timestamp(System.currentTimeMillis())))
                if (!obtenerTAFE())
                    return null;

            String[] tokenSign = { tokenFE, signFE };

            return tokenSign;
        }
        else
        {
            // @fchiappano Si no existe aún el TA o esta vencido, se solicita
            // uno nuevo.
            if ((tokenFEX == null || tokenFEX.equals("")) || (signFEX == null || signFEX.equals(""))
                    || fechaExpiracionFEX.before(new Timestamp(System.currentTimeMillis())))
                if (!obtenerTAFEX())
                    return null;

            String[] tokenSign = { tokenFEX, signFEX };

            return tokenSign;
        }
    } // getTicketAcceso

    /**
     * Solicitar el ticket de acceso, al WS de afip.
     * @author fchiappano
     * @return confirmación
     */
    private static boolean obtenerTAFEX()
    {
        // @fchiappano Obtener parametros de configuración.
        if (configFEX_ID <= 0)
            getConfiguracion("WSFEX");

        // @fchiappano leer archivo TA.
        File ta = new File(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator") + "TAFEX.txt");
        if (ta.exists())
        {
            if (!leerTA(ta, "WSFEX"))
                return false;
            else if (new Timestamp(System.currentTimeMillis()).before(fechaExpiracionFEX))
                return true;
        }

        // @fchiappano Obtener el certificado.
        File certificado = getCertificado("WSFEX");

        if (certificado == null)
        {
            msgError = "Error al recuperar certificado de cliente.";
            return false;
        }

        try
        {
            // @fchiappano solicitar Ticket de Acceso.
            byte[] loginTicketRequest_xml_cms = Wsaa.create_cms(certificado, claveCifradoFEX, signerFEX, dstDN_FEX, servicioFEX, ticketTimeFEX);

            String loginTicketResponse = Wsaa.invoke_wsaa(loginTicketRequest_xml_cms, CMS_FEX);

            if (loginTicketResponse == null)
            {
                msgError = Wsaa.getMsgError();
                return false;
            }

            Reader tokenReader = new StringReader(loginTicketResponse);
            Document tokenDoc = new SAXReader(false).read(tokenReader);

            tokenFEX = tokenDoc.valueOf("/loginTicketResponse/credentials/token");
            signFEX = tokenDoc.valueOf("/loginTicketResponse/credentials/sign");
            String expiracion = tokenDoc.valueOf("/loginTicketResponse/header/expirationTime");
            expiracion = expiracion.replace("T", " ");
            fechaExpiracionFEX = UtilidadesFE.getTimestamp(expiracion, "yyyy-MM-dd hh:mm:ss.SSS");

            // @fchiappano escribir TA en directorio temporal.
            if (!escribirTA(tokenFEX, signFEX, expiracion, "TAFEX.txt"))
                return false;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            msgError = e.getMessage();
            return false;
        }

        return true;
    } // obtenerTAFEX

    /**
     * Solicitar el ticket de acceso, al WS de afip.
     * @author fchiappano
     * @return confirmación
     */
    private static boolean obtenerTAFE()
    {
        // @fchiappano Obtener parametros de configuración.
        if (configFE_ID <= 0)
            getConfiguracion("WSFE");

        // @fchiappano leer archivo TA.
        File ta = new File(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator") + "TAFE.txt");
        if (ta.exists())
        {
            if (!leerTA(ta, "WSFE"))
                return false;
            else if (new Timestamp(System.currentTimeMillis()).before(fechaExpiracionFE))
                return true;
        }

        // @fchiappano Obtener el certificado.
        File certificado = getCertificado("WSFE");

        if (certificado == null)
        {
            msgError = "Error al recuperar certificado de cliente.";
            return false;
        }

        try
        {
            // @fchiappano solicitar Ticket de Acceso.
            byte[] loginTicketRequest_xml_cms = Wsaa.create_cms(certificado, claveCifradoFE, signerFE, dstDN_FE, servicioFE, ticketTimeFE);

            String loginTicketResponse = Wsaa.invoke_wsaa(loginTicketRequest_xml_cms, CMS_FE);

            if (loginTicketResponse == null)
            {
                msgError = Wsaa.getMsgError();
                return false;
            }

            Reader tokenReader = new StringReader(loginTicketResponse);
            Document tokenDoc = new SAXReader(false).read(tokenReader);

            tokenFE = tokenDoc.valueOf("/loginTicketResponse/credentials/token");
            signFE = tokenDoc.valueOf("/loginTicketResponse/credentials/sign");
            String expiracion = tokenDoc.valueOf("/loginTicketResponse/header/expirationTime");
            expiracion = expiracion.replace("T", " ");
            fechaExpiracionFE = UtilidadesFE.getTimestamp(expiracion, "yyyy-MM-dd hh:mm:ss.SSS");

            // @fchiappano escribir TA en directorio temporal.
            if (!escribirTA(tokenFE, signFE, expiracion, "TAFE.txt"))
                return false;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            msgError = e.getMessage();
            return false;
        }

        return true;
    } // obtenerTAFE

    /**
     * Guardar datos de ticket de acceso, en archivo temporal, por si se cierra la aplicación.
     * @author fchiappano
     * @param token
     * @param sign
     * @param expiracion
     * @return confirmación.
     */
    private static boolean escribirTA(final String token, final String sign, final String expiracion, final String taName)
    {
        File ta = new File(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator") + taName);

        try
        {
            PrintWriter escritor = new PrintWriter(ta);
            escritor.println(token);
            escritor.println(sign);
            escritor.println(expiracion);
            escritor.close();
        }
        catch (IOException e)
        {
            e.printStackTrace();
            msgError = e.getMessage();
            return false;
        }
        return true;
    } // escribirTA

    /**
     * Recuperar datos del ticket de acceso, desde el archivo temporal.
     * @author fchiappano
     * @param ta
     * @return confirmación.
     */
    private static boolean leerTA(final File ta, final String servicio)
    {
        try
        {
            FileReader fr = new FileReader(ta);
            BufferedReader br = new BufferedReader(fr);

            // @fchiappano Determinar que TA se esta leyendo.
            if (servicio.equals("WSFE"))
            {
                tokenFE = br.readLine();
                signFE = br.readLine();
                String expiracion = br.readLine();
                fechaExpiracionFE = UtilidadesFE.getTimestamp(expiracion, "yyyy-MM-dd hh:mm:ss.SSS");
            }
            else
            {
                tokenFEX = br.readLine();
                signFEX = br.readLine();
                String expiracion = br.readLine();
                fechaExpiracionFEX = UtilidadesFE.getTimestamp(expiracion, "yyyy-MM-dd hh:mm:ss.SSS");
            }
            fr.close();
        }
        catch (FileNotFoundException e)
        {
            e.printStackTrace();
            msgError = e.getMessage();
            return false;
        }
        catch (IOException e)
        {
            e.printStackTrace();
            msgError = e.getMessage();
            return false;
        }

        return true;
    } // leerTA

    /**
     * Obtener el certificado necesario para conectar con el WS Afip. Si no existe, crear el archivo temporal.
     * @author fchiappano
     * @return archivo p12.
     */
    private static File getCertificado(final String servicio)
    {
        MAttachment adjunto = null;
        String nombre = "";

        if (servicio.equals("WSFE"))
        {
            // @fchiappano si el certificado adjunto en la config, ya fue
            // recuperado, retornar el mismo.
            if (certificadoFE != null)
                return certificadoFE;

            // @fchiappano Recuperar el certificado adjunto en la configuración.
            adjunto = MAttachment.get(ctx, table_ID, configFE_ID);
            nombre = certificado_nameFE;
        }
        else
        {
            // @fchiappano si el certificado adjunto en la config, ya fue
            // recuperado, retornar el mismo.
            if (certificadoFEX != null)
                return certificadoFEX;

            // @fchiappano Recuperar el certificado adjunto en la configuración.
            adjunto = MAttachment.get(ctx, table_ID, configFEX_ID);
            nombre = certificado_nameFEX;
        }

        // @fchiappano Si no hay archivos adjuntos en la config, retornar null.
        if (adjunto == null)
            return null;

        MAttachmentEntry[] archivos = adjunto.getEntries();
        MAttachmentEntry entry = null;
        for (int i = 0; i < archivos.length; i++)
        {
            if (archivos[i].getName().equals(nombre))
            {
                entry = archivos[i];
                break;
            }
        }

        // @fchiappano Verificar que se haya recuperado el certificado correctamente.
        if (entry == null)
            return null;

        // @fchiappano Recupero el certificado.
        certificadoFE = entry.getFile(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator") + entry.getName());

        return certificadoFE;
    } // getCertificado

    /**
     * Recuperar mensaje de error.
     * @return mensaje de error.
     */
    public static String getMsgError()
    {
        return msgError;
    } // getMsgError

    /**
     * Obtener los parametros necesarios, desde la ventana de configuracion.
     */
    private static void getConfiguracion(final String servicio)
    {
        String sql = "SELECT *"
                   +  " FROM LAR_ConfiguracionFE"
                   + " WHERE AD_Client_ID = 1000000 AND IsActive = 'Y' AND Servicio = ?"
                   + " ORDER BY IsDefault DESC";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            pstmt = DB.prepareStatement(sql, null);
            pstmt.setString(1, servicio.toLowerCase());
            rs = pstmt.executeQuery();

            if (rs.next())
            {
                if (servicio.equals("WSFE"))
                {
                    signerFE = rs.getString("Signer");
                    CMS_FE = rs.getString("CMS");
                    certificado_nameFE = rs.getString("Certificado");
                    claveCifradoFE = rs.getString("ClaveCifrado");
                    servicioFE = rs.getString("Servicio");
                    dstDN_FE = rs.getString("DstDN");
                    ticketTimeFE = rs.getLong("TiempoVidaTicket");
                    WSDL_FE = rs.getString("WSDL");
                    conceptoFE = rs.getInt("Concepto");
                    configFE_ID = rs.getInt("LAR_ConfiguracionFE_ID");
                }
                else
                {
                    signerFEX = rs.getString("Signer");
                    CMS_FEX = rs.getString("CMS");
                    certificado_nameFEX = rs.getString("Certificado");
                    claveCifradoFEX = rs.getString("ClaveCifrado");
                    servicioFEX = rs.getString("Servicio");
                    dstDN_FEX = rs.getString("DstDN");
                    ticketTimeFEX = rs.getLong("TiempoVidaTicket");
                    WSDL_FEX = rs.getString("WSDL");
                    conceptoFEX = rs.getInt("Concepto");
                    configFEX_ID = rs.getInt("LAR_ConfiguracionFE_ID");
                }
            }

            sql = "SELECT AD_Table_ID"
                +  " FROM AD_Table"
                + " WHERE TableName = ?";

            table_ID = DB.getSQLValue(null, sql, "LAR_ConfiguracionFE");
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
    } // getConfiguracion

    public static int getConcepto()
    {
        return conceptoFE;
    } // getConcepto

    public static String getWSDL()
    {
        return WSDL_FE;
    } // getWSDL

    public static String getWSDL_FEX()
    {
        return WSDL_FEX;
    } // getWSDL_FEX

} // ProcesadorWSAA
