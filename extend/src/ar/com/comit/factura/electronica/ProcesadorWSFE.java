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

import java.math.BigDecimal;
import java.net.URL;
import java.rmi.RemoteException;
import java.sql.Date;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.apache.axis.AxisFault;
import org.compiere.model.MBPartner;
import org.compiere.model.MBankAccount;
import org.compiere.model.MCurrency;
import org.compiere.model.MDocType;
import org.compiere.model.MInvoice;
import org.compiere.model.MInvoiceTax;
import org.compiere.model.MOrgInfo;
import org.compiere.model.MPOS;
import org.compiere.model.MSysConfig;
import org.compiere.model.MTax;
import org.compiere.util.Env;
import org.compiere.util.Msg;
import org.globalqss.model.X_LCO_TaxIdType;

import ar.com.comit.wsfe.AlicIva;
import ar.com.comit.wsfe.CbteAsoc;
import ar.com.comit.wsfe.Err;
import ar.com.comit.wsfe.FEAuthRequest;
import ar.com.comit.wsfe.FECAECabRequest;
import ar.com.comit.wsfe.FECAEDetRequest;
import ar.com.comit.wsfe.FECAEDetResponse;
import ar.com.comit.wsfe.FECAERequest;
import ar.com.comit.wsfe.FECAEResponse;
import ar.com.comit.wsfe.FERecuperaLastCbteResponse;
import ar.com.comit.wsfe.Obs;
import ar.com.comit.wsfe.Opcional;
import ar.com.comit.wsfe.ServiceSoap12Stub;
import ar.com.comit.wsfe.Tributo;
import ar.com.ergio.util.LAR_Utils;

/**
 * @author Franco Chiappano
 * Procesa el pedido de autorización electronica CAE, mediante el WS de Afip.
 */
public class ProcesadorWSFE implements ElectronicInvoiceInterface
{
    private final Properties ctx = Env.getCtx();

    /** @fchiappano Determinar si se deben parametrizar estas variables */
    // private final String WSDL = "https://servicios1.afip.gov.ar/wsfev1/service.asmx?WSDL";
    private final String WSDL = "https://wswhomo.afip.gov.ar/wsfev1/service.asmx?WSDL";

    private final MInvoice factura;
    private List<AlicIva> impuestos = new ArrayList<AlicIva>();
    private List<Tributo> tributos = new ArrayList<Tributo>();
    private List<Opcional> opcionales = new ArrayList<Opcional>();
    private List<CbteAsoc> asociados = new ArrayList<CbteAsoc>();
    private AlicIva[] array_imp = null;
    private Tributo[] array_trib = null;
    private Opcional[] array_opc = null;
    private CbteAsoc[] array_asoc = null;
    private int concepto = MSysConfig.getIntValue("LAR_PrestaServicios_FE", 0, Env.getAD_Client_ID(Env.getCtx()));
    private long cuitOrg;

    // @fchiappano variable de retorno.
    private String msgError = "";
    private String cae = "";
    private String nroCbte = "";
    private Timestamp fechaVencCae = null;
    private String aceptado = "";
    private String mensaje = "";
    private ServiceSoap12Stub soap = null;

    public ProcesadorWSFE(MInvoice inv)
    {
        factura = inv;
        String cuit = MOrgInfo.get(ctx, Env.getAD_Org_ID(ctx), inv.get_TrxName()).get_ValueAsString("TaxID").replaceAll("-", "");
        cuitOrg = Long.parseLong(cuit);
    } // ProcesadorWSFE

    /**
     * Crear Detalle del Documento.
     * @author fchiappano
     */
    private FECAEDetRequest getFECAEDetRequest(final int nroComprobante)
    {
        // @fchiappano Agregar impuesto y tributos.
        MInvoiceTax[] taxes = factura.getTaxes(true);
        MTax tax = null;
        BigDecimal total_Tributos = BigDecimal.ZERO;
        BigDecimal total_Impuesto = BigDecimal.ZERO;

        for (int i = 0; i < taxes.length; i++)
        {
            tax = MTax.get(ctx, taxes[i].getC_Tax_ID());
            // @fchiappano Impuesto.
            if (!tax.get_ValueAsBoolean("IsPerception"))
            {
                total_Impuesto = total_Impuesto.add(taxes[i].getTaxAmt().setScale(2, BigDecimal.ROUND_HALF_UP));
                AlicIva impuesto = new AlicIva(tax.get_ValueAsInt("WSFECode"), taxes[i].getTaxBaseAmt().doubleValue(), taxes[i].getTaxAmt().doubleValue());
                impuestos.add(impuesto);
            }
            // @fchiappano Tributo.
            else
            {
                total_Tributos = total_Tributos.add(taxes[i].getTaxAmt().setScale(2, BigDecimal.ROUND_HALF_UP));
                MTax taxPerc = MTax.get(ctx, taxes[i].getC_Tax_ID());
                double alic = (taxPerc.getRate().negate().doubleValue());
                Tributo tributo = new Tributo(Short.parseShort(tax.get_ValueAsString("WSFECode")), "", taxes[i].getTaxBaseAmt().doubleValue(), alic, taxes[i].getTaxAmt().doubleValue());
                tributos.add(tributo);
            }
        }

        int tipoDoc = 0;
        long nroDoc = 0;
        MBPartner cliente = (MBPartner) factura.getC_BPartner();

        // @fchiappano Recuperar el tipo de identificación, desde el Socio del
        // Negocio.
        final X_LCO_TaxIdType tipoIdentificacion = new X_LCO_TaxIdType(ctx, cliente.get_ValueAsInt("LCO_TaxIdType_ID"),
                factura.get_TrxName());

        tipoDoc = Integer.parseInt(tipoIdentificacion.getLCO_TaxCodeDian());

        if (cliente.getTaxID() == null || cliente.getTaxID().equals(""))
        {
            msgError = Msg.translate(ctx, "CaeNoCUIT");
            return null;
        }

        nroDoc = Long.parseLong(cliente.getTaxID().replaceAll("-", "").replaceAll(" ", ""));

        int tipoCbte = getDocSubTypeCAE(factura);
        String fechaVecPago = getFechaVencPago();

        // @fchiappano Si el tipo de doc es NC o ND FCE, no informar fecha de pago y agregar comprobante asociado.
        if (tipoCbte == 202 || tipoCbte == 203 || tipoCbte == 207 || tipoCbte == 208 || tipoCbte == 212 || tipoCbte == 213)
        {
            fechaVecPago = "";

            if (!agregarDocAsociado())
                return null;
        }

        // @fchiappano Si es FCE, agregar CBU
        if (tipoCbte == 201 || tipoCbte == 206 || tipoCbte == 211)
            agregarCBU();

        String fechaComprobante = formatTime(factura.getDateAcct(), "yyyyMMdd");
        String fechaActual = formatTime(new Timestamp(System.currentTimeMillis()), "yyyyMMdd");

        // @fchiappano Convertir las listas en arreglos.
        convertirArray();

        // @fchiappano Creo el archivo xml Request.
        FECAEDetRequest detRequest = new FECAEDetRequest(concepto, tipoDoc, nroDoc, nroComprobante + 1,
                nroComprobante + 1, fechaComprobante, factura.getGrandTotal().doubleValue(), Env.ZERO.doubleValue(),
                factura.getTotalLines().doubleValue(), Env.ZERO.doubleValue(), total_Tributos.doubleValue(),
                total_Impuesto.doubleValue(), fechaActual, fechaActual, fechaVecPago, getCodMoneda(), getCotizacion(),
                array_asoc, array_trib, array_imp, array_opc);

        return detRequest;
    } // getFECAEDetRequest

    /**
     * Obtener el ultimo comprobante autorizado por afip.
     *
     * @return nroComprobante.
     */
    private int getUltimoAutorizado(final String token, final String sign)
    {
        int ultimoAuto = 0;

        FEAuthRequest authRequest = new FEAuthRequest(token, sign, cuitOrg);
        try
        {
            FERecuperaLastCbteResponse ultimoCbte = soap.FECompUltimoAutorizado(authRequest, getPuntoVenta(factura),
                    getDocSubTypeCAE(factura));
            ultimoAuto = ultimoCbte.getCbteNro();
        }
        catch (RemoteException e)
        {
            e.printStackTrace();
            msgError = e.getMessage();
        }

        return ultimoAuto;
    } // getUltimoAutorizado

    /**
     * Crear Cabecera del Documento.
     * @author fchiappano
     * @return
     */
    private FECAECabRequest getFECAECabRequest()
    {
        int pdv = getPuntoVenta(factura);

        if (pdv <= 0)
            return null;

        int tipoCbte = getDocSubTypeCAE(factura);

        FECAECabRequest cabRequest = new FECAECabRequest(1, pdv, tipoCbte);

        return cabRequest;
    } // getFECAECabRequest

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
     * Obtener Codigo WSFE de la moneda.
     * @author fchiappano
     * @return WSFE CODE
     */
    private String getCodMoneda()
    {
        MCurrency moneda = (MCurrency) factura.getC_Currency();
        return moneda.get_ValueAsString("WSFECode");
    } // getCodMoneda

    /**
     * Obtener cotización de moneda extrajera.
     * @author fchiappano
     * @return cotización.
     */
    private double getCotizacion()
    {
        BigDecimal cotizacion = Env.ZERO;
        MCurrency moneda = (MCurrency) factura.getC_Currency();

        if (moneda.getC_Currency_ID() != LAR_Utils.getMonedaPredeterminada(ctx, factura.getAD_Client_ID(), factura.get_TrxName()))
            cotizacion = (BigDecimal) factura.get_Value("TasaDeCambio");
        else
            cotizacion = MCurrency.currencyConvert(Env.ONE, Env.getContextAsInt(ctx, "$C_Currency_ID"),
                    factura.getC_Currency_ID(), factura.getDateInvoiced(), 0, ctx);

        return cotizacion.doubleValue();
    } // getCotizacion

    /**
     * Obtener el tipo de documento electronico.
     * @author fchiappano
     * @return
     */
    private int getDocSubTypeCAE(final MInvoice invoice)
    {
        MDocType tipoDoc = (MDocType) invoice.getC_DocType();
        return tipoDoc.get_ValueAsInt("docsubtypecae");
    } // getDocSubTypeCAE

    /**
     * Obtener Fecha de Vencimiento de Pago.
     * @author fchiappano
     * @return
     */
    private String getFechaVencPago()
    {
        Timestamp fechaPago = (Timestamp) factura.get_Value("FechaPago");

        if (fechaPago != null)
            return formatTime(fechaPago, "yyyyMMdd");
        else
            return formatTime(new Timestamp(System.currentTimeMillis()), "yyyyMMdd");
    } // getFechaVencPago

    /**
     * Agregar opcial CBU.
     */
    private void agregarCBU()
    {
        int c_BankAccount_ID = MOrgInfo.get(ctx, factura.getAD_Org_ID()).get_ValueAsInt(
                "C_BankAccount_ID");
        MBankAccount cuentaBancaria = new MBankAccount(ctx, c_BankAccount_ID, factura.get_TrxName());
        Opcional opcional = new Opcional("2101", cuentaBancaria.get_ValueAsString("CBU"));
        opcionales.add(opcional);
    } // agregarCBU

    /**
     * Convertir listas en arreglos.
     * @author fchiappano
     */
    private void convertirArray()
    {
        if (asociados.size() > 0)
            array_asoc = asociados.toArray(new CbteAsoc[asociados.size()]);
        if (impuestos.size() > 0)
            array_imp = impuestos.toArray(new AlicIva[impuestos.size()]);
        if (opcionales.size() > 0)
            array_opc = opcionales.toArray(new Opcional[opcionales.size()]);
        if (tributos.size() > 0)
            array_trib = tributos.toArray(new Tributo[tributos.size()]);
    } // convertirArray

    /**
     * Agregar comprobante asociado para NC o ND Mipyme.
     * @author fchiappano
     * @return confirmación.
     */
    private boolean agregarDocAsociado()
    {
        if (factura.get_ValueAsInt("Source_Invoice_ID") <= 0)
        {
            msgError = "Es obligatorio, informar un documento asociado, para Notas de Crédito o Notas de Débito MiPyme.";
            return false;
        }

        // @fchiappano Agreagar comprobante asociado para NC o ND MiPyme.
        MInvoice facturaOrigen = new MInvoice(ctx, factura.get_ValueAsInt("Source_Invoice_ID"), factura.get_TrxName());
        CbteAsoc asociado = new CbteAsoc(getDocSubTypeCAE(facturaOrigen), getPuntoVenta(facturaOrigen), Long.parseLong(facturaOrigen.getDocumentNo()));
        asociados.add(asociado);

        // @fchiappano Agregar parametro opcional EsCancelación.
        String cancelacion = "";
        if (factura.get_ValueAsBoolean("Cancelacion"))
            cancelacion = "S";
        else
            cancelacion = "N";

        Opcional opcional = new Opcional("22", cancelacion);
        opcionales.add(opcional);

        return true;
    } // agregarDocAsociado

    /**
     * Obtener nro de Punto de Venta.
     * @author fchiappano
     * @param invoice
     * @return nroPdv.
     */
    private int getPuntoVenta(final MInvoice invoice)
    {
        int c_Pos_ID = invoice.get_ValueAsInt("C_Pos_ID");

        if (c_Pos_ID <= 0)
        {
            msgError = "Es obligatorio, el ingreso de un punto de venta valido, para el documento.";
            return 0;
        }

        MPOS pdv = new MPOS(ctx, c_Pos_ID, invoice.get_TrxName());
        int nroPdv = pdv.get_ValueAsInt("PosNumber");

        if (nroPdv <= 0)
        {
            msgError = "Número de PDV invalido.";
            return 0;
        }

        return nroPdv;
    } // getPuntoVenta

    /**
     * Solicitar Codigo de Aurización Electronico (CAE).
     *
     * @author fchiappano
     */
    public String generateCAE()
    {
        try
        {
            // @fchiappano Recuperar Ticket de Acceso.
            String[] tokenSign = ProcesadorWSAA.getTicketAcceso();

            // @fchiappano Instanciar el servicio, que interactuara con el WS.
            soap = new ServiceSoap12Stub(new URL(WSDL), null);

            // @fchiappano Generar Encabezado del documento.
            FECAECabRequest cabRequest = getFECAECabRequest();

            if (cabRequest == null)
                return msgError;

            // @fchiappano Generar Detalle del documento.
            FECAEDetRequest detRequest = getFECAEDetRequest(getUltimoAutorizado(tokenSign[0], tokenSign[1]));

            if (detRequest == null)
                return msgError;

            FECAEDetRequest[] detalles = { detRequest };

            // @fchiappano Genero el Request, con el encabezado y detalle.
            FECAERequest request = new FECAERequest(cabRequest, detalles);

            // @fchiappano Genero el authentication request.
            FEAuthRequest autRequest = new FEAuthRequest(tokenSign[0], tokenSign[1], cuitOrg);

            // @fchiappano Solicitar CAE.
            FECAEResponse response = soap.FECAESolicitar(autRequest, request);

            // @fchiappano obtener datos desde la respuesta.
            FECAEDetResponse[] detalleRespuesta = response.getFeDetResp();
            Obs[] observaciones = detalleRespuesta[0].getObservaciones();
            Err[] errores = response.getErrors();
            aceptado = detalleRespuesta[0].getResultado();

            if (observaciones != null)
            {
                msgError = observaciones[0].getMsg();
                return msgError;
            }
            if (errores != null)
            {
                msgError = errores[0].getMsg();
                return msgError;
            }

            cae = detalleRespuesta[0].getCAE();
            fechaVencCae = ProcesadorWSAA.getTimestamp(detalleRespuesta[0].getCAEFchVto(), "yyyyMMdd");
            nroCbte = String.valueOf(detalleRespuesta[0].getCbteDesde());
        }
        catch (AxisFault e)
        {
            e.printStackTrace();
            msgError = e.getMessage();
            return msgError;
        }
        catch (RemoteException e)
        {
            e.printStackTrace();
            msgError = e.getMessage();
            return msgError;
        }
        catch (Exception e)
        {
            e.printStackTrace();
            msgError = e.getMessage();
            return msgError;
        }

        return "";
    } // generateCAE

    public String getAccepted()
    {
        return aceptado;
    }

    public String getCAE()
    {
        return cae;
    }

    public String getNroCbte()
    {
        return nroCbte;
    }

    public Timestamp getDateCae()
    {
        return fechaVencCae;
    }

    public String getMensaje()
    {
        return mensaje;
    }

    @Override
    public String getErrorMsg()
    {
        return msgError;
    }
} // ProcesadorWSFE
