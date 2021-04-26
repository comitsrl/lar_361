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
import org.apache.http.entity.FileEntity;
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
    private static String url = "http://cot.test.arba.gov.ar/TransporteBienes/SeguridadCliente/";
    private static String usuario = "30716879867";
    private static String pass = "Blumos3071";

    private static CloseableHttpClient httpclient;
    private static CloseableHttpResponse response;

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
            final FileEntity entity = new FileEntity(informe, ContentType.create("text/txt"));
            final HttpPost httppost = new HttpPost(agregarParametros(url));
            httppost.setEntity(entity);
            httppost.addHeader("Connection", "close");
            httpclient = HttpClientBuilder.create().build();
            response = httpclient.execute(httppost);
            final Header[] headers = response.getAllHeaders();
            final HttpEntity httpEntity = response.getEntity();
            final Document doc = parseXML((InputStream) httpEntity.getContent());

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
     * Agregar parametros a la URL, requeridos por el WS (Usuario y Password).
     * @author fchiappano
     */
    private static String agregarParametros(final String url)
    {
        String urlCompleta = url + "?user=" + usuario + "&password=" + pass;
        return urlCompleta;
    } // agregarParametros

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
