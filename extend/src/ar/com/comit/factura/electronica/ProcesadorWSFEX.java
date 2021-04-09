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

import java.sql.Timestamp;
import java.util.Properties;

import org.compiere.model.MDocType;
import org.compiere.model.MInvoice;
import org.compiere.model.MOrgInfo;
import org.compiere.model.MPOS;
import org.compiere.util.Env;

import ar.com.comit.wsfex.ClsFEXRequest;

/**
 * @author Franco Chiappano 
 * Procesa el pedido de autorización electronica CAE,
 * para comprobantes de exportación, mediante el WS de Afip.
 */
public class ProcesadorWSFEX implements ElectronicInvoiceInterface
{
    // @fchiappano Documento por el cual se solicita autorización.
    private final MInvoice factura;
    private final Properties ctx = Env.getCtx();

    // @fchiappano variable de retorno.
    private String msgError = "";
    private String cae = "";
    private String nroCbte = "";
    private Timestamp fechaVencCae = null;
    private String aceptado = "";
    private String mensaje = "";

    public ProcesadorWSFEX(MInvoice inv)
    {
        factura = inv;
    } // ProcesadorWSFEX

    /**
     * Construir el FEXRequest (Cabecera del comprobante).
     *
     * @author fchiappano
     * @return
     */
    private ClsFEXRequest getClsFEXRequest()
    {
        // @fchiappano Tipo de Documento Electronico.
        int tipoCbte = UtilidadesFE.getDocSubTypeCAE(factura);

        // @fchiappano Formatear fecha del comprobante a String.
        String fechaComprobante = UtilidadesFE.formatTime(factura.getDateAcct(), "yyyyMMdd");

        // @fchiappano Recuperar el nro de punto de venta.
        int pdv = getPuntoVenta(factura);
        if (pdv <= 0)
            return null;

        ClsFEXRequest request = new ClsFEXRequest(id, fechaComprobante, tipoCbte, pdv, cbte_nro, tipo_expo, permiso_existente, permisos, dst_cmp, cliente, cuit_pais_cliente, domicilio_cliente, id_impositivo, moneda_Id, moneda_ctz, obs_comerciales, imp_total, obs, cmps_asoc, forma_pago, incoterms, incoterms_Ds, idioma_cbte, items, opcionales);
        return null;
    } // getClsFEXRequest

    @Override
    public String generateCAE()
    {
        ClsFEXRequest request = getClsFEXRequest();
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
        return nroCbte;
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

} // ProcesadorWSFEX
