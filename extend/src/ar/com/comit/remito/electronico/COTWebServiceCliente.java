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
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.compiere.util.ValueNamePair;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 * Clase de servicio, que se encargará efectivamente de conectar con WS de ARBA y solicitar el
 * COT. Las bilbiotecas necesarias para esta funcionalidad se dejaron en el directorio de
 * instalación de Adempiere. Se encuentran también en el directorio lib de LAR para fines de
 * desarrollo, pero no se incluyen en el customization.
 *
 * @author fchiappano - http://www.comit.com.ar
 * @author Marcos Zúñiga - http://www.comit.com.ar
 */
public class COTWebServiceCliente
{
    // @fchiappano variable de error.
    private static String msgError = "";

    // @fchiappano Valores de retorno
    private static List<ValueNamePair> datosCOT;

    /**
     * Conectar al WebService y realizar la solicitud del COT.
     * @author fchiappano
     * @param informe
     * @return respuesta.
     */
    public static boolean solicitarCOT(final String url, final String usuario, final String pass, final File informe)
    {
        try
        {
            final HttpPost httppost = new HttpPost(url);

            // @fchiappano instanciar el constructor del "formulario" multipart.
            MultipartEntityBuilder builder = MultipartEntityBuilder.create();
            builder.setLaxMode(); // @emmie: Setea por defecto el modo BROWSER_COMPATIBLE.

            // @fchiappano agregar cada una de las partes, con sus respectivos bodys y el Contentype correspondiente.
            builder.addPart("user", new StringBody(usuario, ContentType.APPLICATION_FORM_URLENCODED.withCharset("UTF-8")));
            builder.addPart("password", new StringBody(pass, ContentType.APPLICATION_FORM_URLENCODED.withCharset("UTF-8")));
            builder.addPart("file", new FileBody(informe, ContentType.APPLICATION_OCTET_STREAM.withCharset("UTF-8"), informe.getName()));

            // @fchiappano utilizando un entity de tipo multipart, no es necesario agregar el header Content-type: Multipart form/data.
            HttpEntity multipart = builder.build();
            httppost.setEntity(multipart);

            CloseableHttpClient httpclient = HttpClientBuilder.create().build();
            CloseableHttpResponse response = httpclient.execute(httppost);

            final HttpEntity httpEntity = response.getEntity();
            final Document doc = parseXML((InputStream) httpEntity.getContent());

            //System.out.println(documentToString(doc));

            // @fchiappano Recuperar errores (si es que existen).
            msgError = getErrores(doc);
            if (!msgError.equals(""))
                return false;

            // @fchiappano Recuperar los datos de la transacción y codigo COT.
            getDatosCOT(doc);
        }
        catch (Exception e)
        {
            e.printStackTrace();
            msgError = e.getMessage();
        }

        return true;
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

    public static List<ValueNamePair> getDatosCOT()
    {
        return datosCOT;
    } // getDatosCOT

    /**
     * Recuperar mensajes de error, contenidos en el xml response.
     * @return mensaje de error o "".
     */
    private static String getErrores(final Document doc)
    {
        String mensajeError = "";

        // @fchiappano Recuperar error de comunicación con el web service y/o
        // errores de formato de datos.
        NodeList tags = doc.getElementsByTagName("codigoError");
        if (tags.getLength() > 0)
        {
            mensajeError = doc.getElementsByTagName("codigoError").item(0).getTextContent() + "_"
                         + doc.getElementsByTagName("tipoError").item(0).getTextContent() + "_"
                         + doc.getElementsByTagName("mensajeError").item(0).getTextContent();
        }

        // @fchiappano Recorrer errores de datos (informado en el archivo).
        tags = doc.getElementsByTagName("error");
        if (tags.getLength() > 0)
        {
            NodeList tagsCodigo = doc.getElementsByTagName("codigo");
            NodeList tagsDescripcion = doc.getElementsByTagName("descripcion");

            for (int x = 0; x < tags.getLength(); x++)
            {
                mensajeError = mensajeError
                             + tagsCodigo.item(x).getTextContent() + "_"
                             + tagsDescripcion.item(x).getTextContent() + " | ";
            }
        }

        return mensajeError;
    } // getErrores

    /**
     * Recuperar los datos de transacción y COT, del xml response.
     * @author fchiappano
     */
    private static void getDatosCOT(final Document doc)
    {
        datosCOT = new ArrayList<ValueNamePair>();

        datosCOT.add(new ValueNamePair(doc.getElementsByTagName("codigoIntegridad").item(0).getTextContent(), "CodigoIntegridadCOT"));
        datosCOT.add(new ValueNamePair(doc.getElementsByTagName("numeroComprobante").item(0).getTextContent(), "NumeroComprobanteCOT"));
        datosCOT.add(new ValueNamePair(doc.getElementsByTagName("cot").item(0).getTextContent(), "COT"));

        String procesado = doc.getElementsByTagName("procesado").item(0).getTextContent();
        datosCOT.add(new ValueNamePair(procesado.equals("SI") ? "Y" : "N", "COTAutorizado"));
    } // getDatosCOT

    private static String documentToString(final Document doc) throws TransformerException
    {
        final TransformerFactory transfac = TransformerFactory.newInstance();
        final Transformer trans = transfac.newTransformer();
        trans.setOutputProperty(OutputKeys.METHOD, "xml");
        trans.setOutputProperty(OutputKeys.INDENT, "yes");
        trans.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", Integer.toString(2));

        final StringWriter sw = new StringWriter();
        final StreamResult result = new StreamResult(sw);
        final DOMSource source = new DOMSource(doc.getDocumentElement());

        trans.transform(source, result);
        final String xmlString = sw.toString();

        return xmlString;
    } // DocumentToString

} // COTWebServiceCliente
