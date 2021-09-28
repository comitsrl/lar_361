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
import java.io.FileWriter;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.model.MBPartner;
import org.compiere.model.MBPartnerLocation;
import org.compiere.model.MClient;
import org.compiere.model.MDocType;
import org.compiere.model.MInOut;
import org.compiere.model.MInOutLine;
import org.compiere.model.MLocation;
import org.compiere.model.MOrgInfo;
import org.compiere.model.MPOS;
import org.compiere.model.MProduct;
import org.compiere.model.MRegion;
import org.compiere.model.MShipper;
import org.compiere.model.MUOM;
import org.compiere.model.MWarehouse;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.compiere.util.ValueNamePair;
import org.globalqss.model.X_LCO_TaxIdType;

import ar.com.ergio.model.LAR_TaxPayerType;

/**
 * Clase que procesara los datos del remito y solicitara el codigo COT a traves
 * del WS de ARBA.
 *
 * @author fchiappano
 */
public class ProcesadorCOT
{
    protected CLogger log = CLogger.getCLogger(ProcesadorCOT.class);

    // @fchiappano Remito por el cual se solicitara el codigo COT.
    private final MInOut remito;
    private final MOrgInfo orgInfo;
    private final String cuitOrg;
    private final Properties ctx = Env.getCtx();
    private final String separador = "|";
    private final String separadorNombre = "_";
    private final String finalLinea = "\r\n";

    // @fchiappano parametros fijos.
    private final String sujetoGenerador = "E";
    private String msgError = "";
    private String url = "";
    private String usuario = "";
    private String pass = "";

    // @fchiappano parametros a mapear en config.
    private final String esDevolucion = "0";
    //private final String codigoProd = "650300";
    private final String planta = "000";
    private final String puerta = "000";
    private final String extencion = ".txt";
    private final String codSecuencial;
    private final String nroDirec = "0";
    private final String direc_completa = "S/N";

    public ProcesadorCOT(final MInOut remito)
    {
        this.remito = remito;
        this.orgInfo = MOrgInfo.get(ctx, Env.getAD_Org_ID(ctx), remito.get_TrxName());
        this.cuitOrg = orgInfo.get_ValueAsString("TaxID").replaceAll("-", "");
        int length = remito.getDocumentNo().length();
        this.codSecuencial = remito.getDocumentNo().substring(length - 5, length) + String.valueOf(remito.get_ValueAsInt("NroConexionCOT"));
    } // ProcesadorCOT

    /**
     * Enviar solicitud de COT a WebService de ARBA.
     * @author fchiappano
     * @return mensaje
     */
    public String solcitarCOT()
    {
        // @fchiappano Recuperar Configuración del WS.
        if (!getConfiguracionWS())
            return msgError;

        // @fchiappano Generar el archivo txt que se enviara al WS.
        File informe = generarTXT();

        // @fchiappano si el informe es nulo, es porque se disparo una excepción.
        if (informe == null)
            return msgError;

        // @fchiappano En esta instancia, todo error devuelto sera del WS o bien
        // de conexion con el mismo. Sea cual fuere el caso, incrementar el
        // contador de conexiones.
        remito.set_ValueOfColumn("NroConexionCOT", remito.get_ValueAsInt("NroConexionCOT") + 1);

        // @fchiappano Realizar la solicitud de COT.
        if (!COTWebServiceCliente.solicitarCOT(url, usuario, pass, informe))
        {
            msgError = COTWebServiceCliente.getMsgError();
            remito.set_ValueOfColumn("ErrorCOT", msgError);
            // Se guarda el error fuera de la transacción
            // para evitar el rollback que dispara la excepción.
            remito.saveEx(null);
            log.log(Level.SEVERE, "Error al solicitar COT: " + msgError);
            return msgError;
        }

        // @fchiappano Recuperar datos de autorización y setearlos en el remito.
        List<ValueNamePair> datosCOT = COTWebServiceCliente.getDatosCOT();

        for (ValueNamePair dato : datosCOT)
            remito.set_ValueOfColumn(dato.getName(), dato.getValue());

        // @fchiappano Si no se ingreso una fecha de autorización en el remito,
        // setearle por defecto la fecha actual, que es la que se le paso al WS.
        if (remito.getPickDate() == null)
            remito.setPickDate(new Timestamp(System.currentTimeMillis()));

        // Dejar en blanco el registro de errores
        remito.set_ValueOfColumn("ErrorCOT", null);

        if(!remito.save(remito.get_TrxName()))
            return "Error al actualizar el Remito";

        return "";
    } // solcitarCOT

    /**
     * Generar archivo Txt, con los datos requeridos del remito, para la solicitud del COT.
     * @author fchiappano
     * @return
     */
    private File generarTXT()
    {
        // @fchiappano Crear el archivo
        String nombreArchivo = "TB"
                             + separadorNombre + cuitOrg
                             + separadorNombre + planta + puerta
                             + separadorNombre + getFecha(remito.getMovementDate())
                             + separadorNombre + codSecuencial + extencion;

        File archivo = new File(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator") + nombreArchivo);

        try
        {
            // @fchiappano Crear el StringBuffer y cargar los datos de la
            // cabecera del remito.
            StringBuffer cuerpoTxt = cargarDatosCabecera();

            // @fchiappano Si el cuerpo del archivo es nulo, es porque se disparo algun error.
            if (cuerpoTxt == null)
                return null;

            // @fchiappano agregar al StringBuffer, los datos de las lineas del
            // remito.
            agregarLineas(cuerpoTxt);

            // @fchiappano Agregar final del TXT.
            cuerpoTxt.append("04" + separador + "1" + finalLinea);

            // @fchiappano Escribir el archivo.
            FileWriter escritor = new FileWriter(archivo);
            escritor.write(cuerpoTxt.toString());
            escritor.close();
        }
        catch (Exception ex)
        {
            msgError = "Error al escribir archivo " + extencion;
            log.log(Level.SEVERE, msgError + ": " + ex.getMessage());
            ex.printStackTrace();
            return null;
        }

        return archivo;
    } // generarTXT

    /**
     * Crear el string buffer y cargarlo con todos los datos referidos a la
     * cabecera del remito.
     *
     * @author fchiappano
     * @return
     */
    private StringBuffer cargarDatosCabecera()
    {
        StringBuffer cabecera = new StringBuffer();

        // @fchiappano linea cabecera.
        cabecera.append("01" + separador + cuitOrg + finalLinea);

        MBPartner cliente = remito.getBPartner();
        MWarehouse deposito = new MWarehouse(ctx, remito.getM_Warehouse_ID(), remito.get_TrxName());

        // @fchiappano validar que se haya seleccionado un transporte.
        int transporte_ID = remito.get_ValueAsInt("M_Shipper_ID");
        if(transporte_ID <= 0)
        {
            msgError = "Por favor, ingrese un transportista valido.";
            return null;
        }
        MShipper transporte = new MShipper(ctx, transporte_ID, remito.get_TrxName());

        // @fchiappano Validar que el transporte tenga vinculado un Socio del Negocio.
        int bpTransporte_ID = transporte.getC_BPartner_ID();
        if (bpTransporte_ID <= 0)
        {
            msgError = "El transportista seleccionado, no posee un Socio del Negocio valido asignado.";
            return null;
        }
        MBPartner bpTransporte = new MBPartner(ctx, bpTransporte_ID, remito.get_TrxName());

        // @fchiappano linea descripción del remito.
        String fechaEmision = getFecha(remito.getMovementDate());
        cabecera.append("02" + separador + fechaEmision);

        // @fchiappano Codigo unico del documento (DocSubTypeCAE + pdv + documentno).
        String codigoUnico = generarCodigoUnicoRemito();

        if(codigoUnico == null)
            return null;

        cabecera.append(separador + codigoUnico);

        // @fchiappano Fecha de salida.
        cabecera.append(separador + getFecha(remito.getPickDate()));

        // @fchiappano Hora de salida
        cabecera.append(separador + " ");

        // @fchiappano Sujeto Generador (E: Emisor. D: Destinatario).
        cabecera.append(separador + sujetoGenerador);

        // @fchiappano parametro es consumidor final.
        LAR_TaxPayerType taxPayerType = LAR_TaxPayerType.getTaxPayerType(cliente);
        boolean esConsumidorFinal = taxPayerType.equals(LAR_TaxPayerType.CONSUMIDOR_FINAL);
        cabecera.append(separador + (esConsumidorFinal ? "1" : "0"));

        // @fchiappano tipo de documento cliente (DNI, CL,CUIL, etc. No informar si no se trata de un CF)
        if (esConsumidorFinal)
        {
            X_LCO_TaxIdType tipoDoc = new X_LCO_TaxIdType(ctx, cliente.get_ValueAsInt("LCO_TaxIDType_ID"),
                    remito.get_TrxName());
            cabecera.append(separador + tipoDoc.getName());
        }
        else
            cabecera.append(separador + " ");

        // @fchiappano nro de documento del cliente (CF).
        String cuit_cliente = cliente.getTaxID();
        if (cuit_cliente == null)
        {
            msgError = "El cliente no posee un número de identificación valido";
            return null;
        }
        cabecera.append(separador + (esConsumidorFinal ? cuit_cliente.replaceAll("-", "") : " "));

        // @fchiappano numero de cuit del cliente (si no es CF)
        cabecera.append(separador + (!esConsumidorFinal ? cuit_cliente.replaceAll("-", "") : " "));

        // @fchiappano Razon social del cliente.
        String razonSocial = cliente.getName();
        cabecera.append(separador + (razonSocial.length() > 50 ? razonSocial.substring(0, 49) : razonSocial));

        // @fchiappano Destinatario Tenedor (depende de la condición de IVA del cliente)
        cabecera.append(separador + (esConsumidorFinal ? "0" : "1"));

        // @fchiappano Datos de la direccion destino.
        MLocation direccion;

        if (remito.get_ValueAsBoolean("EntregaTransporte"))
            direccion = (MLocation) new MBPartnerLocation(ctx, remito.get_ValueAsInt("Shipper_Location_ID"), remito.get_TrxName()).getC_Location();
        else
            direccion = (MLocation) remito.getC_BPartner_Location().getC_Location();

        String calle = direccion.getAddress1();
        if (calle != null && !calle.equals(""))
            cabecera.append(separador + (calle.length() > 40 ? calle.substring(0, 39) : calle));
        else
            cabecera.append(separador + "");
        // Numero
        cabecera.append(separador + nroDirec);
        // Destino_Domicilio_Comple
        cabecera.append(separador + direc_completa);
        // Piso
        cabecera.append(separador + " ");
        // Departamento
        cabecera.append(separador + " ");
        // Barrio
        cabecera.append(separador + " ");
        // Codigo Postal
        cabecera.append(separador + direccion.getPostal());
        // Ciudad
        String ciudad = direccion.getCity();
        if (ciudad != null && !ciudad.equals(""))
            cabecera.append(separador + (ciudad.length() > 50 ? ciudad.substring(0, 49) : ciudad));
        else
            cabecera.append(separador + " ");
        // Codigo Provincia
        cabecera.append(separador + ((MRegion) direccion.getC_Region()).get_ValueAsString("CodigoCOT"));
        // PROPIO_DESTINO_DOMICILIO_CODIGO
        cabecera.append(separador + " ");

        // @fchiappano Entrega domicilio Origen.
        cabecera.append(separador + "NO");

        // @fchiappano cuit origen (Si Sujeto_Generador = E, entonces debe ir el
        // CUIT de la org. Sino, CUIT del SdN).
        cabecera.append(separador + cuitOrg);

        // @fchiappano Razon social del emisor
        razonSocial = MClient.get(ctx).getName();
        cabecera.append(separador + (razonSocial.length() > 50 ? razonSocial.substring(0, 49) : razonSocial));

        // @fachiappano Emisor Tenedor.
        cabecera.append(separador + "1");

        // @mzuniga Datos de dirección origen.
        // Se recupera la diracción del depósito
        // Calle
        MLocation direcOrigen = (MLocation) deposito.getC_Location();
        if (calle != null && !calle.equals(""))
            cabecera.append(separador + (calle.length() > 40 ? calle.substring(0, 39) : calle));
        else
            cabecera.append(separador + " ");
        // Numero
        cabecera.append(separador + nroDirec);
        // ORIGEN_DOMICILIO_COMPLE
        cabecera.append(separador + direc_completa);
        // Piso
        cabecera.append(separador + " ");
        // Departamento
        cabecera.append(separador + " ");
        // Barrio
        cabecera.append(separador + " ");
        // Codigo postal
        cabecera.append(separador + direcOrigen.getPostal());
        // Localidad
        ciudad = direcOrigen.getCity();
        if (ciudad != null && !ciudad.equals(""))
            cabecera.append(separador + (ciudad.length() > 50 ? ciudad.substring(0, 49) : ciudad));
        else
            cabecera.append(separador + " ");
        // Cod Provincia
        cabecera.append(separador + ((MRegion) direcOrigen.getC_Region()).get_ValueAsString("CodigoCOT"));

        // @fchiappano Cuit del transportista.
        String cuit_transporte = bpTransporte.getTaxID();
        if (cuit_transporte == null)
        {
            msgError = "El trasnportista seleccionado, no posee un número de identificación valido";
            return null;
        }
        cabecera.append(separador + cuit_transporte.replaceAll("-", ""));

        // @fchiappano Tipo Recorrido (‘U’, ‘R’, ‘M’ o ‘ ’).
        cabecera.append(separador + " ");

        // @fchiappano Localidad del Recorrido.
        cabecera.append(separador + " ");

        // @fchiappano Calle del Recorrido.
        cabecera.append(separador + " ");

        // @fchiappano Ruta del Recorrido.
        cabecera.append(separador + " ");

        // @fchiappano Patente del vehiculo.
        String patente = (String) remito.get_Value("Patente");
        if (patente == null)
            patente = "";
        cabecera.append(separador + patente.replaceAll("\\s", ""));

        // @fchiappano Patente del Acoplado del vehiculo.
        String patenteAcop = (String) remito.get_Value("Patente");
        if (patenteAcop == null)
            patenteAcop = "";
        cabecera.append(separador + patenteAcop.replaceAll("\\s", ""));

        // @fchiappano Es devolucion
        cabecera.append(separador + esDevolucion);

        // @rchiappano Importe total remito (descontando impuestos = neto)
        cabecera.append(separador + formatearBigDecimal(remito.getC_Order().getTotalLines()));

        // @fchiappano Agregar final de Linea.
        cabecera.append(finalLinea);

        return cabecera;
    } // cargarDatosCabecera

    /**
     * Agregar al cuerpo del txt, los datos requeridos de las lineas del remito.
     * @author fchiappano
     * @param cuerpoTxt
     */
    private void agregarLineas(final StringBuffer cuerpoTxt)
    {
        MInOutLine[] lineas = remito.getLines();
        MUOM unidadMedida;
        MProduct producto;

        for (int x = 0; x < lineas.length; x ++)
        {
            MInOutLine linea = lineas[x];
            if (linea.getM_Product_ID() > 0)
            {
                unidadMedida = (MUOM) linea.getC_UOM();
                producto = new MProduct(ctx, linea.getM_Product_ID(), remito.get_TrxName());

                // @fchiappano agregar codigo de linea.
                cuerpoTxt.append("03");

                // @mzuniga CODIGO_UNICO_PRODUCTO
                // Nomenclador-COT (longitud: 6 dígitos)
                cuerpoTxt.append(separador + (String) producto.get_Value("NomecladorCOT"));

                // @fchiappano Codigo de UM
                cuerpoTxt.append(separador + unidadMedida.get_ValueAsString("CodigoCOT"));

                // @fchiappano Cantidad
                cuerpoTxt.append(separador + formatearBigDecimal(linea.getQtyEntered()));

                // @fchiappano Datos del producto.
                cuerpoTxt.append(separador + linea.getM_Product().getValue());// Codigo.
                String name = linea.getM_Product().getName();
                cuerpoTxt.append(separador + (name.length() > 40 ? name.substring(0, 39) : name));// Nombre/Descripcion

                // @fchiappano Descripcion UM
                String umName = unidadMedida.get_Translation("Name");
                cuerpoTxt.append(separador + (umName.length() > 20 ? umName.substring(0, 19) : umName));

                // @fchiappano Cantidad Ajustada FIXME (Determinar diferencia con el parametro
                // cantidad).
                cuerpoTxt.append(separador + formatearBigDecimal(linea.getQtyEntered()));

                // @fchiappano Final de Linea.
                cuerpoTxt.append(finalLinea);
            }
        }
    } // agregarLineas

    /**
     * Formatear BigDecimal a un string, según requerimiento del WS.
     * @author fchiappano
     * @param decimal
     * @return decimalStr
     */
    private String formatearBigDecimal(BigDecimal decimal)
    {
        String decimalStr = decimal.setScale(2, RoundingMode.HALF_UP).toString();
        decimalStr = decimalStr.replace(",", "").replace(".", "");
        return decimalStr;
    } // formatearBigDecimal

    /**
     * Obtener Fecha de Vencimiento de Pago.
     * @author fchiappano
     * @return
     */
    private String getFecha(final Timestamp fecha)
    {
        if (fecha != null)
            return formatTime(fecha, "yyyyMMdd");
        else
            return formatTime(new Timestamp(System.currentTimeMillis()), "yyyyMMdd");
    } // getFecha

    /**
     * Formatear fecha a tipo String.
     * @author fchiappano
     * @param time
     * @param format
     * @return
     */
    private String formatTime(Timestamp time, String format)
    {
        SimpleDateFormat simpleformat = new SimpleDateFormat(format);
        Date date = new Date(time.getTime());
        return simpleformat.format(date);
    } // formatTime

    /**
     * Generar codigo unico de remito (codigo tipo doc + pdv + numero documento).
     * @author fchiappano
     * @return codigo unico
     */
    private String generarCodigoUnicoRemito()
    {
        String codigoUnico = "";

        // @fchiappano Recuperar el codigo del tipo de documento.
        String tipoCbte = ((MDocType) remito.getC_DocType()).get_ValueAsString("DocSubTypeCAE");

        if (tipoCbte == null || tipoCbte.equals(""))
        {
            msgError = "El tipo de documento, no posee un Sub Tipo valido para ARBA.";
            return null;
        }

        // @fchiappano estandarizar numero punto de venta.
        int c_POS_ID = ((MDocType) remito.getC_DocType()).get_ValueAsInt("C_POS_ID");

        if (c_POS_ID <= 0)
        {
            msgError = "El tipo de documento, no posee configurado un Punto de Venta valido.";
            return null;
        }

        int pdv = new MPOS(ctx, c_POS_ID, remito.get_TrxName()).get_ValueAsInt("PosNumber");
        String pdv_str = "00000" + String.valueOf(pdv);
        pdv_str = pdv_str.substring(pdv_str.length() - 5, pdv_str.length());

        // @fchiappano recuperar numero de documento del remito.
        String nroDoc = remito.getDocumentNo();
        nroDoc = nroDoc.substring(nroDoc.length() -8, nroDoc.length());

        // @fchiappano Armar el codigo unico.
        codigoUnico = tipoCbte + pdv_str + nroDoc;

        return codigoUnico;
    } // generarCodigoUnicoRemito

    /**
     * Recuperar Configuración del WS de ARBA.
     * @author fchiappano
     * @return confirmación
     */
    private boolean getConfiguracionWS()
    {
        String sql = "SELECT *"
                   +  " FROM LAR_ConfiguracionFE"
                   + " WHERE AD_Client_ID = 1000000 AND IsActive = 'Y' AND COT = 'Y'"
                   + " ORDER BY IsDefault DESC";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            pstmt = DB.prepareStatement(sql, null);
            rs = pstmt.executeQuery();

            if (rs.next())
            {
                usuario = rs.getString("Signer");
                url = rs.getString("WSDL");
                pass = rs.getString("ClaveCifrado");
            }
            else
                msgError = "No existe una Configuración valida para el Servicio Web de ARBA.";
        }
        catch (SQLException eSql)
        {
            log.log(Level.SEVERE, sql, eSql);
            msgError = "Erorr al recuperar la Configuración del Servicio Web.";
            return false;
        }
        finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }

        return true;
    } // getConfiguracionWS

} // ProcesadorCOT
