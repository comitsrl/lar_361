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
package ar.com.comit.remito.electronico;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.w3c.dom.Document;
import org.xml.sax.SAXException;

/**
 * Clase de servicio, que se encargara efectivamente de conectar con WS de ARBA y solicitar el COT.
 * @author fchiappano
 */
public class COTWebServiceCliente
{
    // @fchiappano variable de error.
    private static String msgError;

    // @fchiappano Parametros a evaluar si deben pasarse a una ventana de config.
//    private static String url = "https://cot.arba.gov.ar/TransporteBienes/SeguridadCliente/presentarRemitos.do";
    private static String url = "http://cot.test.arba.gov.ar/TransporteBienes/SeguridadCliente/presentarRemitos.do";
    private static String usuario = "30716879867";
    private static String pass = "Blumos3071";

    /**
     * Conectar al WebService y realizar la solicitud del COT.
     * @author fchiappano
     * @param informe
     * @return respuesta.
     */
    public static String solicitarCOT(final File informe)
    {
        String respuesta = "";
        try
        {
            final HttpPost httppost = new HttpPost(url);

            MultipartEntityBuilder builder = MultipartEntityBuilder.create();

            builder.addPart("user", new StringBody(usuario, ContentType.APPLICATION_FORM_URLENCODED.withCharset("UTF-8")));
            builder.addPart("password", new StringBody(pass, ContentType.APPLICATION_FORM_URLENCODED.withCharset("UTF-8")));
            builder.addPart("file", new FileBody(informe, ContentType.APPLICATION_OCTET_STREAM.withCharset("UTF-8"), informe.getName()));
//            byte[] bytes = Files.readAllBytes(informe.toPath());
//            builder.addPart("file", new ByteArrayBody(bytes, ContentType.TEXT_PLAIN, informe.getName()));
            HttpEntity multipart = builder.build();
            httppost.setEntity(multipart);
            httppost.addHeader("Cookie", "JSESSIONID=0000XgY-FTL7K-J-2yuPYz6J3_T:-1");
            long contentLentgth = httppost.getEntity().getContentLength();
            Header[] headers = httppost.getAllHeaders();
            CloseableHttpClient httpclient = HttpClientBuilder.create().build();
            CloseableHttpResponse response = httpclient.execute(httppost);
            final HttpEntity httpEntity = response.getEntity();
            final Document doc = parseXML((InputStream) httpEntity.getContent());

            // @fchiappano Recuperar Errores.
            msgError = doc.getElementsByTagName("codigoError").item(0).getTextContent() + "_"
                     + doc.getElementsByTagName("tipoError").item(0).getTextContent() + "_"
                     + doc.getElementsByTagName("mensajeError").item(0).getTextContent();

            respuesta = "COT Generado con exito";
        }
        catch (Exception e)
        {
            e.printStackTrace();
            msgError = e.getMessage();
        }

        return respuesta;
    } // solicitarCOT

    /**
     * Load XML from string. Can throw exception
     *
     * @param responseBody
     * @return parsedXml
     * @throws javax.xml.parsers.ParserConfigurationException
     * @throws org.xml.sax.SAXException
     * @throws java.io.IOException
     */
    protected static Document parseXML(final InputStream responseBody) throws ParserConfigurationException, SAXException, IOException
    {
        final DocumentBuilderFactory docFactory = DocumentBuilderFactory.newInstance();
        final DocumentBuilder docBuilder = docFactory.newDocumentBuilder();

        return docBuilder.parse(responseBody);
    } // parseXML

    public static String getMsgError()
    {
        return msgError;
    } // getMsgError

} // COTWebServiceCliente
