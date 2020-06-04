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

import java.io.File;
import java.io.Reader;
import java.io.StringReader;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.model.MAttachment;
import org.compiere.model.MAttachmentEntry;
import org.compiere.util.CLogger;
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
    private static File certificado = null;
    // @fchiappano Constantes que almacenaran los datos relevantes del ticket de acceso, provisto por afip.
    private static String token = "";
    private static String sign = "";
    private static Timestamp fechaExpiracion = null;
    // @fchiappano variable que almacenara los mensajes de error.
    private static String msgError = "";

    private static Properties ctx = Env.getCtx();

    // @fchiappano Variables de configuración (pasar a ventana de config).
    private final static String CMS = "https://wsaahomo.afip.gov.ar/ws/services/LoginCms";
    // private final String CMS =
    // "https://wsaa.afip.gov.ar/ws/services/LoginCms";
    private final static String servicio = "wsfe";
    private final static long ticketTime = 3600000;
    private final static String signer = "Emiliano";
    private final static String claveCifrado = "emmie";
    private final static String dstDN = "CN=wsaahomo, O=AFIP, C=AR, SERIALNUMBER=CUIT 33693450239";
    private final static String certificado_name = "emiliano.p12";

    /**
     * Constructor que evita la instanciación de la clase.
     */
    private ProcesadorWSAA() {}

    /**
     * Recuperar ticket de acceso, solicitado al WS de Afip.
     * @return
     */
    public static String[] getTicketAcceso()
    {
        // @fchiappano Si no existe aún el TA o esta vencido, se solicita uno nuevo.
        if ((token == null || token.equals("")) || (sign == null || sign.equals(""))
                || fechaExpiracion.before(new Timestamp(System.currentTimeMillis())))
            if (!obtenerTA())
                return null;

        String[] tokenSign = {token, sign};

        return tokenSign;
    } // getTicketAcceso

    /**
     * Solicitar el ticket de acceso, al WS de afip.
     * @author fchiappano
     * @return confirmación
     */
    private static boolean obtenerTA()
    {
        // @fchiappano Obtener el certificado.
        File certificado = getCertificado();

        if (certificado == null)
        {
            msgError = "Error al recuperar certificado de cliente.";
            return false;
        }

        try
        {
            // @fchiappano solicitar Ticket de Acceso.
            byte[] loginTicketRequest_xml_cms = Wsaa.create_cms(certificado, claveCifrado, signer, dstDN, servicio, ticketTime);

            String loginTicketResponse = Wsaa.invoke_wsaa(loginTicketRequest_xml_cms, CMS);

            Reader tokenReader = new StringReader(loginTicketResponse);
            Document tokenDoc = new SAXReader(false).read(tokenReader);

            token = tokenDoc.valueOf("/loginTicketResponse/credentials/token");
            sign = tokenDoc.valueOf("/loginTicketResponse/credentials/sign");
            String expiracion = tokenDoc.valueOf("/loginTicketResponse/header/expirationTime");
            expiracion = expiracion.replace("T", " ");
            fechaExpiracion = getTimestamp(expiracion, "yyyy-MM-dd hh:mm:ss.SSS");
        }
        catch (Exception e)
        {
            e.printStackTrace();
            msgError = e.getMessage();
            return false;
        }

        return true;
    } // obtenerTA

    /**
     * Obtener el certificado necesario para conectar con el WS Afip. Si no existe, crear el archivo temporal.
     * @author fchiappano
     * @return archivo p12.
     */
    private static File getCertificado()
    {
        // @fchiappano si el certificado adjunto en la config, ya fue
        // recuperado, retornar el mismo.
        if (certificado != null)
            return certificado;

        // @fchiappano Recuperar el certificado adjunto en la configuración.
        MAttachment adjunto = MAttachment.get(ctx, 318, 4063528);
        MAttachmentEntry[] archivos = adjunto.getEntries();
        MAttachmentEntry entry = null;
        for (int i = 0; i < archivos.length; i++)
        {
            if (archivos[i].getName().equals(certificado_name))
            {
                entry = archivos[i];
                break;
            }
        }
        // @fchiappano Recupero el certificado.
        certificado = entry.getFile();

        return certificado;
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
     * Obtener un timestamp a partir de un string.
     * @author fchiappano
     * @param value
     * @param format
     * @return timestamp
     */
    public static Timestamp getTimestamp(String value, String format)
    {
        Timestamp time = null;
        try
        {
            SimpleDateFormat dateFormat = new SimpleDateFormat(format);
            java.util.Date date = dateFormat.parse(value);
            time = new Timestamp(date.getTime());
        }
        catch (Exception ex)
        {
            log.log(Level.SEVERE, "Error getTimestamp():" + ex);
        }
        return time;
    } // getTimestamp

} // ProcesadorWSAA
