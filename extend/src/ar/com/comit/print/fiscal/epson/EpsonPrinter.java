/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2007 ComPiere, Inc. All Rights Reserved.                *
 * This program is free software, you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY, without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program, if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
package ar.com.comit.print.fiscal.epson;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.text.Normalizer;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.regex.Pattern;

import org.compiere.util.CLogger;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import ar.com.ergio.print.fiscal.BasicFiscalPrinter;
import ar.com.ergio.print.fiscal.FiscalPacket;
import ar.com.ergio.print.fiscal.comm.FiscalComm;
import ar.com.ergio.print.fiscal.document.CreditNote;
import ar.com.ergio.print.fiscal.document.Customer;
import ar.com.ergio.print.fiscal.document.DNFH;
import ar.com.ergio.print.fiscal.document.DebitNote;
import ar.com.ergio.print.fiscal.document.Document;
import ar.com.ergio.print.fiscal.document.DocumentLine;
import ar.com.ergio.print.fiscal.document.Invoice;
import ar.com.ergio.print.fiscal.document.NonFiscalDocument;
import ar.com.ergio.print.fiscal.document.PerceptionLine;
import ar.com.ergio.print.fiscal.exception.DocumentException;
import ar.com.ergio.print.fiscal.exception.FiscalPrinterIOException;
import ar.com.ergio.print.fiscal.exception.FiscalPrinterStatusError;

/**
 * Implementación para impresoras EpsonG2 TM-T900FA
 *
 * @author fchiappano - www.comit.com.ar
 */
public class EpsonPrinter extends BasicFiscalPrinter
{
    /** Logger */
    protected CLogger log = CLogger.getCLogger(getClass());

    // Responsabilidad frente al IVA
    /** Responsabilidad frente al IVA: Responsable inscripto */
    protected static final String RESPONSABLE_INSCRIPTO = "RESPONSABLE_INSCRIPTO";
    /** Responsabilidad frente al IVA: Responsable no inscripto */
    protected static final String RESPONSABLE_NO_INSCRIPTO = "RESPONSABLE_NO_INSCRIPTO";
    /** Responsabilidad frente al IVA: Exento */
    protected static final String EXENTO = "EXENTO";
    /** Responsabilidad frente al IVA: No responsable */
    protected static final String NO_RESPONSABLE = "NO_RESPONSABLE";
    /** Responsabilidad frente al IVA: Consumidor final */
    protected static final String CONSUMIDOR_FINAL = "CONSUMIDOR_FINAL";
    /**
     * Responsabilidad frente al IVA: Responsable no inscripto, venta de bienes
     * de uso
     */
    protected static final String RESPONSABLE_NO_INSCRIPTO_BIENES_DE_USO = "B";
    /** Responsabilidad frente al IVA: Responsable monotributo */
    protected static final String RESPONSABLE_MONOTRIBUTO = "RESPONSABLE_MONOTRIBUTO";
    /** Responsabilidad frente al IVA: Monotributista social */
    protected static final String MONOTRIBUTISTA_SOCIAL = "MONOTRIBUTISTA_SOCIAL";
    /** Responsabilidad frente al IVA: Pequeño contribuyente eventual */
    protected static final String PEQUENO_CONTRIBUYENTE_EVENTUAL = "PEQUENIO_CONTRIBUYENTE_EVENTUAL";
    /** Responsabilidad frente al IVA: Pequeño contribuyente eventual social */
    protected static final String PEQUENO_CONTRIBUYENTE_EVENTUAL_SOCIAL = "PEQUENIO_CONTRIBUYENTE_EVENTUAL_SOCIAL";
    /** Responsabilidad frente al IVA: No categorizado */
    protected static final String NO_CATEGORIZADO = "NO_CATEGORIZADO";

    // Tipo de documento
    /** C.U.I.T. */
    protected static final String CUIT = "CUIT";
    /** C.U.I.L. */
    protected static final String CUIL = "CUIL";
    /** Libreta de enrolamiento */
    protected static final String LIBRETA_DE_ENROLAMIENTO = "LIBRETA_ENROLAMIENTO";
    /** Libreta cívica */
    protected static final String LIBRETA_CIVICA = "LIBRETA_CIVICA";
    /** Documento nacional de identidad */
    protected static final String DNI = "DNI";
    /** Pasaporte */
    protected static final String PASAPORTE = "PASAPORTE";
    /** Cédula de identidad */
    protected static final String CEDULA = "CEDULA";
    /** Sin calificador */
    protected static final String SIN_CALIFICADOR = "SIN_CALIFICADOR";

    /**
     * Mapeo entre categorias de IVA de las clases de documentos y los valores
     * esperados por las impresoras fiscales de esta marca.
     */
    private Map<Integer, String> ivaResponsabilities;
    /**
     * Mapeo entre los tipos de identificación de clientes de las clases de
     * documentos y los valores esperados por las impresoras de esta marca.
     */
    private Map<Integer, String> identificationTypes;

    /** Interfaz de comunicación con el dispositivo */
    private WebSocketComm fiscalComm;
    private String impresora = "IMPRESORA_FISCAL_E2G";

    @Override
    public void setFiscalComm(FiscalComm fiscalComm)
    {
        this.fiscalComm = (WebSocketComm) fiscalComm;
    }
    
    @Override
    public FiscalComm getFiscalComm()
    {
        return fiscalComm;
    }

    @Override
    public void printDocument(Invoice invoice)
            throws DocumentException, FiscalPrinterIOException
    {
        // @fchiappano Crear el json "Principal"
        JSONObject printTicketJSON = new JSONObject();

        // @fchiappano Recuperar datos de Encabezado del documento.
        JSONObject encabezado = getEncabezado(invoice, "F");

        // @fchiappano icorporar lineas del documento, al json.
        JSONArray items = getDocumentItems(invoice);
        encabezado.put("items", items);

        // @fchiappano Agregar percepciones.
        JSONArray percepcion = getDocumentPercepcion(invoice);

        if (percepcion != null)
            encabezado.put("percepciones", percepcion);

        // @fchiappano Agregar el nombre de la impresora.
        printTicketJSON.put("printerName", impresora);
        printTicketJSON.put("printTicket", encabezado);

        // @fchiappano envio mensaje a la impresora.
        fiscalComm.sendMessage(printTicketJSON.toString());

        // @fchiappano Obtener respuesta y setear en el documento, tras la
        // emision de la factura.
        setMessage(invoice);

        // @fchiappano ejecutar la apertura de cajon si corresponde.
        if (invoice.isAperturaCajon())
        {
            JSONObject aperturaCajon = new JSONObject();
            aperturaCajon.put("openDrawer", true);
            aperturaCajon.put("printerName", impresora);
            fiscalComm.sendMessage(aperturaCajon.toString());
        }

        // Se indica al manejador de eventos que la impresión ha finalizado.
        firePrintEnded();
    } // printDocument (Invoice)

    @Override
    public void printDocument(CreditNote creditNote)
            throws FiscalPrinterStatusError, FiscalPrinterIOException, DocumentException
    {
        // @fchiappano Crear el json "Principal"
        JSONObject printTicketJSON = new JSONObject();

        // @fchiappano Recuperar datos de Encabezado del documento.
        JSONObject encabezado = getEncabezado(creditNote, "NC");

        // @fchiappano icorporar lineas del documento, al json.
        JSONArray items = getDocumentItems(creditNote);
        encabezado.put("items", items);

        // @fchiappano Agregar percepciones.
        JSONArray percepcion = getDocumentPercepcion(creditNote);

        if (percepcion != null)
            encabezado.put("percepciones", percepcion);

        // @fchiappano Agregar el nombre de la impresora.
        printTicketJSON.put("printerName", impresora);
        printTicketJSON.put("printTicket", encabezado);

        // @fchiappano envio mensaje a la impresora.
        fiscalComm.sendMessage(printTicketJSON.toString());

        // @fchiappano Obtener respuesta y setear en el documento, tras la
        // emision de la factura.
        setMessage(creditNote);

        // Se indica al manejador de eventos que la impresión ha finalizado.
        firePrintEnded();
    } // printDocument (CreditNote)

    @Override
    public void printDocument(DebitNote debitNote)
            throws FiscalPrinterStatusError, FiscalPrinterIOException, DocumentException
    {
        // @fchiappano Crear el json "Principal"
        JSONObject printTicketJSON = new JSONObject();

        // @fchiappano Recuperar datos de Encabezado del documento.
        JSONObject encabezado = getEncabezado(debitNote, "ND");

        // @fchiappano icorporar lineas del documento, al json.
        JSONArray items = getDocumentItems(debitNote);
        encabezado.put("items", items);

        // @fchiappano Agregar percepciones.
        JSONArray percepcion = getDocumentPercepcion(debitNote);

        if (percepcion != null)
            encabezado.put("percepciones", percepcion);

        // @fchiappano Agregar el nombre de la impresora.
        printTicketJSON.put("printerName", impresora);
        printTicketJSON.put("printTicket", encabezado);

        // @fchiappano envio mensaje a la impresora.
        fiscalComm.sendMessage(printTicketJSON.toString());

        // @fchiappano Obtener respuesta y setear en el documento, tras la
        // emision de la factura.
        setMessage(debitNote);

        // Se indica al manejador de eventos que la impresión ha finalizado.
        firePrintEnded();
    } // printDocument (DebitNote)

    @Override
    public void printDocument(NonFiscalDocument nonFiscalDocument)
            throws FiscalPrinterStatusError, FiscalPrinterIOException, DocumentException
    {}

    @Override
    public void printDocument(DNFH dnfh) throws FiscalPrinterStatusError, FiscalPrinterIOException, DocumentException
    {}

    @Override
    public void fiscalClose(String type) throws FiscalPrinterStatusError, FiscalPrinterIOException
    {
        // @fchiappano armo el json con la instrucción de cierre fiscal
        JSONObject json = new JSONObject();
        json.put("dailyClose", type);
        json.put("printerName", impresora);

        // @fchiappano envio mensaje a la impresora.
        fiscalComm.sendMessage(json.toString());
    } // fiscalClose

    /**
     * Formatea un número de identificación de un comprador para que sea
     * aceptado por la impresora fiscal. En caso de ser un número de documento
     * le extrae los ".", si es un CUIL/CUIT le extrae los "-", etc.
     *
     * @param docType Tipo de identificación.
     * @param docNumber Número de identificación a formatear
     * @return El string formateado.
     */
    private String formatDocNumber(String docType, String docNumber)
    {
        String result = docNumber;
        if (docNumber != null)
        {
            if (docType.equals(DNI))
                result = docNumber.replace(".", "").replace("-", "");
            if (docType.equals(CUIT) || docType.equals(CUIL))
                result = docNumber.replace("-", "");
            result.trim();
        }
        return result;
    } // formatDocNumber

    /**
     * @return Returns the identificationTypes.
     */
    private Map<Integer, String> getIdentificationTypes()
    {
        if (identificationTypes == null)
        {
            identificationTypes = new HashMap<Integer, String>();
            identificationTypes.put(Customer.CEDULA, CEDULA);
            identificationTypes.put(Customer.CUIL, CUIL);
            identificationTypes.put(Customer.CUIT, CUIT);
            identificationTypes.put(Customer.DNI, DNI);
            identificationTypes.put(Customer.LIBRETA_CIVICA, LIBRETA_CIVICA);
            identificationTypes.put(Customer.LIBRETA_DE_ENROLAMIENTO, LIBRETA_DE_ENROLAMIENTO);
            identificationTypes.put(Customer.PASAPORTE, PASAPORTE);
            identificationTypes.put(Customer.SIN_CALIFICADOR, SIN_CALIFICADOR);
        }
        return identificationTypes;
    } // getIdentificationTypes

    /**
     * Realiza la conversión entre el entero que representa el tipo de
     * identificación en las clases de documentos y el string que espera la
     * impresora fiscal.
     *
     * @param identificationTypes Tipo de identificación a convertir
     * @return Retorna el string que representa el tipo de identificación que
     *         espera la impresora fiscal.
     */
    private String traduceIdentificationType(Integer identificationType)
    {
        String result = getIdentificationTypes().get(identificationType);
        if (result == null)
            result = SIN_CALIFICADOR;
        return result;
    } // traduceIdentificationType

    /**
     * @return Returns the ivaResponsabilities.
     */
    private Map<Integer, String> getIvaResponsabilities()
    {
        if (ivaResponsabilities == null)
        {
            ivaResponsabilities = new HashMap<Integer, String>();
            ivaResponsabilities.put(Customer.CONSUMIDOR_FINAL, CONSUMIDOR_FINAL);
            ivaResponsabilities.put(Customer.EXENTO, EXENTO);
            ivaResponsabilities.put(Customer.MONOTRIBUTISTA_SOCIAL, MONOTRIBUTISTA_SOCIAL);
            ivaResponsabilities.put(Customer.NO_CATEGORIZADO, NO_CATEGORIZADO);
            ivaResponsabilities.put(Customer.NO_RESPONSABLE, NO_RESPONSABLE);
            ivaResponsabilities.put(Customer.PEQUENO_CONTRIBUYENTE_EVENTUAL, PEQUENO_CONTRIBUYENTE_EVENTUAL);
            ivaResponsabilities.put(Customer.PEQUENO_CONTRIBUYENTE_EVENTUAL_SOCIAL,
                    PEQUENO_CONTRIBUYENTE_EVENTUAL_SOCIAL);
            ivaResponsabilities.put(Customer.RESPONSABLE_INSCRIPTO, RESPONSABLE_INSCRIPTO);
            ivaResponsabilities.put(Customer.RESPONSABLE_MONOTRIBUTO, RESPONSABLE_MONOTRIBUTO);
            ivaResponsabilities.put(Customer.RESPONSABLE_NO_INSCRIPTO, RESPONSABLE_NO_INSCRIPTO);
            ivaResponsabilities.put(Customer.RESPONSABLE_NO_INSCRIPTO_BIENES_DE_USO,
                    RESPONSABLE_NO_INSCRIPTO_BIENES_DE_USO);
        }
        return ivaResponsabilities;
    } // getIvaResponsabilities

    /**
     * Realiza la conversión entre el entero que representa a la categoría
     * de IVA en las clases de documentos y el string que espera la impresora
     * fiscal.
     * @param ivaResponsibility Valor de la responsabilidad frente a IVA.
     * @return El string que representa la responsabilidad frente al IVA.
     */
    private String traduceIvaResponsibility(Integer ivaResponsibility) {
        String result = getIvaResponsabilities().get(ivaResponsibility);
        if(result == null)
            result = NO_CATEGORIZADO;
        return result;
    } // traduceIvaResponsibility

    /**
     * Recuperar json con los datos del encabezado del documento.
     * @param documento
     * @param tipoCbte
     * @return
     */
    private JSONObject getEncabezado(final Document documento, final String tipoCbte)
    {
        if (documento.getCustomer().getIvaResponsibility() == Customer.CONSUMIDOR_FINAL)
            documento.getCustomer().setIdentificationType(Customer.DNI);

        // @fchiappano Crear json con el Target Encabezado.
        JSONObject encabezado = new JSONObject();

        // @fchiappano Json con los datos de la cabecera.
        JSONObject datosCabecera = new JSONObject();

        // @fchiappano determinar el tipo de comprobante (es F + letra del doc).
        datosCabecera.put("tipo_cbte", tipoCbte + documento.getLetter());
        String tipo_doc = traduceIdentificationType(documento.getCustomer().getIdentificationType());
        datosCabecera.put("nro_doc", formatDocNumber(tipo_doc, documento.getCustomer().getIdentificationNumber()));
        datosCabecera.put("domicilio_cliente", formatText(documento.getCustomer().getLocation(), 120));
        datosCabecera.put("tipo_doc", tipo_doc);
        datosCabecera.put("nombre_cliente", formatText(documento.getCustomer().getName(), 80));
        datosCabecera.put("tipo_responsable", traduceIvaResponsibility(documento.getCustomer().getIvaResponsibility()));

        encabezado.put("encabezado", datosCabecera);

        return encabezado;
    } // getEncabezado

    /**
     * Recorrer lineas del documento y agregarlas en un JSONArray.
     * @author fchiappano
     * @param document
     * @return items
     */
    private JSONArray getDocumentItems(final Document document)
    {
        // @fchiappano Json que englobara los items de la factura.
        JSONArray items = new JSONArray();
        int x = 0;

        // @fchiappano recorrer las lineas de la factura y crear un json por
        // cada item.
        for (DocumentLine linea : document.getLines())
        {
            JSONObject item = new JSONObject();
            item.put("alic_iva", linea.getIvaRate().setScale(2, RoundingMode.HALF_UP));
            item.put("importe", linea.getUnitPrice().setScale(2, RoundingMode.HALF_UP));
            item.put("ds", formatText(linea.getDescription(), 40));
            item.put("qty", linea.getQuantity().setScale(2, RoundingMode.HALF_UP));

            if (linea.tieneImpuestosInternos())
            {
                item.put("id_ii", 1);
                item.put("ii_valor", linea.getImporteImpuestosInternos().divide(linea.getQuantity(), 2, RoundingMode.HALF_UP));
            }

            // @fchiappano determinar el codigo de unidad de medida.
            int codUM = 0;
            if (linea.getUnidMedida().equals("Unidad"))
                codUM = 7;
            else
                codUM = 62; // Pack (lo mas parecido a bulto)

            item.put("codigo_unidad_medida", codUM);

            items.add(x, item);
            x++;

            // @fchiappano Agregar descuento de item.
            if (linea.hasDiscount())
            {
                item = new JSONObject();
                item.put("alic_iva", linea.getIvaRate().setScale(2, RoundingMode.HALF_UP));
                item.put("importe", linea.getDiscount().getAmount().setScale(2, RoundingMode.HALF_UP));
                item.put("ds", "aplicado");
                item.put("qty", 1);
                item.put("discountNegative", true);

                items.add(x, item);
                x++;
            }
        }

        return items;
    } // getDocumentItems

    /**
     * Recuperar percepciones del documento.
     *
     * @author fchiappano
     * @param document
     * @return JSONArray con percepcion o null
     */
    private JSONArray getDocumentPercepcion(final Document document)
    {
        PerceptionLine percepcion = document.getPerceptionLine();
        JSONArray jsonPercepcion = new JSONArray();

        if (percepcion != null)
        {
            JSONObject percepcionOject = new JSONObject();
            percepcionOject.put("importe", percepcion.getAmt());
            percepcionOject.put("ds", percepcion.getDescription());
            percepcionOject.put("iva", "NINGUNO"); // codigo 0 de otros tributos: sin iva.
            percepcionOject.put("percepcion_tipo", "PERCEPCION_DE_INGRESOS_BRUTOS");

            jsonPercepcion.add(percepcionOject);

            return jsonPercepcion;
        }

        return null;
    } // getDocumentPercepcion

    /**
     * Recuperar el ultimo comprobante autorizado.
     * @param invoice
     * @throws FiscalPrinterIOException
     */
    private void getUltimoAutorizado(final Document invoice) throws FiscalPrinterIOException
    {
        // @fchiappano Recuperar el nro de comprobante autorizado.
        JSONObject jsoAutorizado = new JSONObject();
        jsoAutorizado.put("printerName", impresora);
        jsoAutorizado.put("getLastNumber", "F" + invoice.getLetter());
        fiscalComm.sendMessage(jsoAutorizado.toString());

        // @fchiapppano obtener respuesta de fiscal berry.
        JSONObject jsonRta = fiscalComm.getRespuesta();
        if (jsonRta != null)
        {
            String respuesta = (String) jsonRta.get("rta");

            if (respuesta != null || !respuesta.equals(""))
            {
                invoice.setDocumentNo(respuesta);
            }
        }
    } // getUltimoAutorizado

    public String formatText(String text, int maxLength)
    {
        text = super.formatText(text, maxLength);
        if (text == null)
            return text;
        // Reemplaza caracteres especiales que las impresoras hasar no permiten.
        String textoNuevo = stripAccents(text);
        return textoNuevo.toString();
    }

    /**
     * Setear en el documento la respuesta del controlador fiscal.
     *
     * @param invoice
     * @throws FiscalPrinterIOException
     */
    private void setMessage(final Document invoice) throws FiscalPrinterIOException
    {
        Object objeto = fiscalComm.getRespuesta();
        JSONArray jsonRta = null;

        if (objeto == null)
        {
            log.log(Level.WARNING, "EL MENSAJE ESTA LLEGANDO NULO.");
            throw new FiscalPrinterIOException("No se obtuvo respuesta del Controlador Fiscal");
        }
        else
            jsonRta = (JSONArray) ((JSONObject) objeto).getOrDefault("rta", null);

        if (jsonRta != null)
        {
            JSONObject rta = (JSONObject) jsonRta.get(0);
            String respuesta = (String) rta.get("rta");

            if (respuesta == null || respuesta.equals("") || respuesta.equals("None"))
                throw new FiscalPrinterIOException("Error de impresión Fiscal. Respuesta Recibida: " + respuesta);
            else if (respuesta.equals("Ninguno"))
                throw new FiscalPrinterIOException(
                        "No fue posible abrir un comprobante fiscal. Verifique que se haya realizado el cierre fiscal (Z) diario y que los datos del cliente sean validos.");
            else
                invoice.setDocumentNo(respuesta);
        }
    } // setMessage

    /**
     * Cerrar la conexión con el websocket y recuperar variable de error.
     * @throws FiscalPrinterIOException 
     */
    private void cerrarConexion() throws FiscalPrinterIOException
    {
        try
        {
            fiscalComm.close();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }

        // @fchiappano si se recupera un error, disparo la excepción.
        String error =  fiscalComm.getError();

        if (error != null && !error.equals(""))
        {
            throw new FiscalPrinterIOException(error);
        }
    } // cerrarConexion

    /**
     * @emmie: tomado del código de Apache Commons StringUtils v3
     *
     * <p>Removes diacritics (~= accents) from a string. The case will not be altered.</p>
     * <p>For instance, '&agrave;' will be replaced by 'a'.</p>
     * <p>Note that ligatures will be left as is.</p>
     *
     * <pre>
     * StringUtils.stripAccents(null)                = null
     * StringUtils.stripAccents("")                  = ""
     * StringUtils.stripAccents("control")           = "control"
     * StringUtils.stripAccents("&eacute;clair")     = "eclair"
     * </pre>
     *
     * @param input String to be stripped
     * @return input text with diacritics removed
     *
     * @since 3.0
     *
     * See also Lucene's ASCIIFoldingFilter (Lucene 2.9) that replaces accented characters by their unaccented equivalent
     * (and uncommitted bug fix: https://issues.apache.org/jira/browse/LUCENE-1343?focusedCommentId=12858907&page=com.atlassian.jira.plugin.system.issuetabpanels%3Acomment-tabpanel#action_12858907).
     */
    private String stripAccents(final String input)
    {
        if (input == null)
        {
            return null;
        }
        final Pattern pattern = Pattern.compile("\\p{InCombiningDiacriticalMarks}+"); //$NON-NLS-1$
        final StringBuilder decomposed = new StringBuilder(Normalizer.normalize(input, Normalizer.Form.NFD));
        convertRemainingAccentCharacters(decomposed);
        // Note that this doesn't correctly remove ligatures...
        return pattern.matcher(decomposed).replaceAll("");
    } // stripAccents

    private static void convertRemainingAccentCharacters(final StringBuilder decomposed)
    {
        for (int i = 0; i < decomposed.length(); i++)
        {
            if (decomposed.charAt(i) == '\u0141')
            {
                decomposed.deleteCharAt(i);
                decomposed.insert(i, 'L');
            }
            else if (decomposed.charAt(i) == '\u0142')
            {
                decomposed.deleteCharAt(i);
                decomposed.insert(i, 'l');
            }
        }
    } // convertRemainingAccentCharacters

    @Override
    public String formatQuantity(BigDecimal quantity)
    {
        return null;
    }

    @Override
    public String formatAmount(BigDecimal amount)
    {
        return null;
    }

    @Override
    public String formatPerceptionAmount(BigDecimal amount)
    {
        return null;
    }

    @Override
    public int getAllowedPaymentQty()
    {
        return 0;
    }

    @Override
    protected FiscalPacket createFiscalPacket()
    {
        return null;
    }

} // EpsonPrinter
