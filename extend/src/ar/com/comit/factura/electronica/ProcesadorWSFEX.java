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
import java.math.RoundingMode;
import java.net.URL;
import java.rmi.RemoteException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.apache.axis.AxisFault;
import org.compiere.model.MBPartner;
import org.compiere.model.MBPartnerLocation;
import org.compiere.model.MInvoice;
import org.compiere.model.MInvoiceLine;
import org.compiere.model.MOrgInfo;
import org.compiere.model.MPOS;
import org.compiere.util.Env;

import ar.com.comit.wsfex.ClsFEXAuthRequest;
import ar.com.comit.wsfex.ClsFEXErr;
import ar.com.comit.wsfex.ClsFEXOutAuthorize;
import ar.com.comit.wsfex.ClsFEXRequest;
import ar.com.comit.wsfex.ClsFEX_LastCMP;
import ar.com.comit.wsfex.Cmp_asoc;
import ar.com.comit.wsfex.FEXResponseAuthorize;
import ar.com.comit.wsfex.FEXResponseLast_CMP;
import ar.com.comit.wsfex.Item;
import ar.com.comit.wsfex.Opcional;
import ar.com.comit.wsfex.Permiso;
import ar.com.comit.wsfex.ServiceSoap12Stub;

/**
 * @author Franco Chiappano 
 * Procesa el pedido de autorización electronica CAE,
 * para comprobantes de exportación, mediante el WS de Afip.
 */
public class ProcesadorWSFEX implements ElectronicInvoiceInterface
{
    // @fchiappano Documento por el cual se solicita autorización.
    private final MInvoice factura;
    private ServiceSoap12Stub soap = null;
    private long cuitOrg;
    private final Properties ctx = Env.getCtx();

    // @fchiappano Listas y arreglos utilizados para informar otros atributos.
    private List<Permiso> permisos = new ArrayList<Permiso>();
    private List<Cmp_asoc> cmp_asoc = new ArrayList<Cmp_asoc>();
    private List<Opcional> opcionales = new ArrayList<Opcional>();
    private List<Item> items = new ArrayList<Item>();
    private Permiso[] array_permisos = null;
    private Cmp_asoc[] array_cmp_asoc = null;
    private Opcional[] array_opcionales = null;
    private Item[] array_items = null;

    // @fchiappano variable de retorno.
    private String msgError = "";
    private String cae = "";
    private long nroCbte;
    private Timestamp fechaVencCae = null;
    private String aceptado = "";
    private String mensaje = "";

    public ProcesadorWSFEX(MInvoice inv)
    {
        factura = inv;
        String cuit = MOrgInfo.get(ctx, Env.getAD_Org_ID(ctx), inv.get_TrxName()).get_ValueAsString("TaxID").replaceAll("-", "");
        cuitOrg = Long.parseLong(cuit);
    } // ProcesadorWSFEX

    /**
     * Construir el FEXRequest (Cabecera del comprobante).
     *
     * @author fchiappano
     * @return
     */
    private ClsFEXRequest getClsFEXRequest(final long nroComprobante)
    {
        // FIXME @fchiappano Variables a resolver desde donde recuperarlas.
        short tipo_export = 2;
        String permiso_existente = "";
        short paisDestino = 203;
        long cuit_pais = Long.parseLong("50000000059");
        String formaPago = "Efectivo";
        String incoterms = "";
        String incoterms_Ds = "";
        short idioma = 1;

        // @fchiappano Tipo de Documento Electronico.
        short tipoCbte = (short) UtilidadesFE.getDocSubTypeCAE(factura);

        // @fchiappano Formatear fecha del comprobante a String.
        String fechaComprobante = UtilidadesFE.formatTime(factura.getDateAcct(), "yyyyMMdd");

        // @fchiappano Recuperar el nro de punto de venta.
        short pdv = (short) getPuntoVenta(factura);
        if (pdv <= 0)
            return null;

        // @fchiappano Recuperar direccion del cliente.
        MBPartner cliente = (MBPartner) factura.getC_BPartner();
        MBPartnerLocation[] direcciones =  cliente.getLocations(true);
        String direccion = direcciones[0].getName();

        // @fchiappano Cuit del cliente.
        String cuit_cliente = cliente.getTaxID().replaceAll("-", "");

        // @fchiappano Generar ID Identificador del requerimiento.
        String id_str = String.valueOf(factura.getC_Invoice_ID()) + "1";
        long id = Long.parseLong(id_str);

        // @fchiappano Cargar listas de items.
        cargarItems();

        // @fchiappano Convertir todas las listas en arreglos.
        convertirArray();

        ClsFEXRequest request = new ClsFEXRequest(id, fechaComprobante, tipoCbte, pdv, nroComprobante + 1, tipo_export,
                permiso_existente, array_permisos, paisDestino, cliente.getName(), cuit_pais, direccion, cuit_cliente,
                UtilidadesFE.getCodMoneda(factura), UtilidadesFE.getCotizacion(factura), factura.getDescription(),
                factura.getGrandTotal(), factura.getDescription(), array_cmp_asoc, formaPago, incoterms, incoterms_Ds, idioma,
                array_items, array_opcionales);

        return request;
    } // getClsFEXRequest

    /**
     * Retornar arreglo con los items de la factura.
     * @author fchiappano
     */
    private void cargarItems()
    {
        MInvoiceLine[] lineas = factura.getLines();

        for (int x = 0; x < lineas.length; x ++)
        {
            MInvoiceLine linea = lineas[x];
            // FIXME Recuperar Codigo de UM desde la UM.
            int codigo_UM = 7;
            BigDecimal totalLinea = linea.getLineNetAmt().add(linea.getTaxAmt());
            Item item = new Item("", linea.getM_Product().getName(), linea.getQtyEntered(), codigo_UM, totalLinea.divide(linea.getQtyEntered(), RoundingMode.HALF_UP), Env.ZERO, totalLinea);
            items.add(item);
        }
    } // cargarItems

    /**
     * Convertir listas en arreglos.
     * @author fchiappano
     */
    private void convertirArray()
    {
        if (items.size() > 0)
            array_items = items.toArray(new Item[items.size()]);
        if (permisos.size() > 0)
            array_permisos = permisos.toArray(new Permiso[permisos.size()]);
        if (opcionales.size() > 0)
            array_opcionales = opcionales.toArray(new Opcional[opcionales.size()]);
        if (cmp_asoc.size() > 0)
            array_cmp_asoc = cmp_asoc.toArray(new Cmp_asoc[cmp_asoc.size()]);
    } // convertirArray

    @Override
    public String generateCAE()
    {
        try
        {
            // @fchiappano Recuperar Ticket de Acceso.
            String[] tokenSign = ProcesadorWSAA.getTicketAcceso("WSFEX");

            if (tokenSign == null)
            {
                msgError = ProcesadorWSAA.getMsgError();
                return msgError;
            }

            // @fchiappano Instanciar el servicio, que interactuara con el WS.
            soap = new ServiceSoap12Stub(new URL(ProcesadorWSAA.getWSDL_FEX()), null);

            // @fchiappano Recompilar datos del documento y crear el cmp_request.
            ClsFEXRequest request = getClsFEXRequest(getUltimoAutorizado(tokenSign[0], tokenSign[1]));

            // @fchiappano Generar autenticador.
            ClsFEXAuthRequest auth = new ClsFEXAuthRequest(tokenSign[0], tokenSign[1], cuitOrg);

            // @fchiappano Solicitar autorización FEX.
            FEXResponseAuthorize autorizacion = soap.FEXAuthorize(auth, request);

            // @fchiappano Chequear si se obtuvo algun error.
            ClsFEXErr error = autorizacion.getFEXErr();
            if (error != null)
            {
                msgError = error.getErrCode() + " " + error.getErrMsg();
                return msgError;
            }

            // @fchiappano Recuperar datos de autorización.
            ClsFEXOutAuthorize resultadoAuth = autorizacion.getFEXResultAuth();
            cae = resultadoAuth.getCae();
            nroCbte = resultadoAuth.getCbte_nro();
            fechaVencCae = UtilidadesFE.getTimestamp(resultadoAuth.getFch_venc_Cae(), "yyyyMMdd");
            mensaje = resultadoAuth.getMotivos_Obs();
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

    @Override
    public String getCAE()
    {
        return cae;
    }

    @Override
    public Timestamp getDateCae()
    {
        return fechaVencCae;
    }

    @Override
    public String getNroCbte()
    {
        return String.valueOf(nroCbte);
    }

    @Override
    public String getErrorMsg()
    {
        return msgError;
    }

    @Override
    public String getMsg()
    {
        return mensaje;
    }

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
     * Obtener el ultimo comprobante autorizado por afip.
     *
     * @return nroComprobante.
     */
    private long getUltimoAutorizado(final String token, final String sign)
    {
        long ultimoAuto = 0;

        try
        {
            ClsFEX_LastCMP cmp = new ClsFEX_LastCMP(token, sign, cuitOrg, (short) getPuntoVenta(factura),
                    (short) UtilidadesFE.getDocSubTypeCAE(factura));
            FEXResponseLast_CMP respuestaUltimoCmp = soap.FEXGetLast_CMP(cmp);

            ultimoAuto = respuestaUltimoCmp.getFEXResult_LastCMP().getCbte_nro();
        }
        catch (RemoteException e)
        {
            e.printStackTrace();
            msgError = e.getMessage();
        }

        return ultimoAuto;
    } // getUltimoAutorizado

} // ProcesadorWSFEX
