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

import java.net.URL;
import java.util.logging.Level;

import org.compiere.model.MOrgInfo;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.Env;

import ar.com.comit.wsfe.Err;
import ar.com.comit.wsfe.FEAuthRequest;
import ar.com.comit.wsfe.FECompConsResponse;
import ar.com.comit.wsfe.FECompConsultaReq;
import ar.com.comit.wsfe.FECompConsultaResponse;
import ar.com.comit.wsfe.ServiceSoap12Stub;

/**
 * Proceso que permite consultar los datos una factura autorizada por WS de AFIP.
 *
 * @author fchiappano
 *
 */
public class ConsultarDocumentosFE extends SvrProcess
{
    private int pdv;
    private int tipoCbte;
    private long nroDoc;

    @Override
    protected void prepare()
    {
        ProcessInfoParameter[] para = getParameter();
        for (int i = 0; i < para.length; i++)
        {
            String name = para[i].getParameterName();

            if (para[i].getParameter() == null)
                ;
            else if (name.equals("PDV"))
            {
                pdv = para[i].getParameterAsInt();
            }
            else if (name.equals("TipoCbte"))
            {
                tipoCbte = para[i].getParameterAsInt();
            }
            else if (name.equals("DocumentNo"))
            {
                nroDoc = para[i].getParameterAsInt();
            }
            else
            {
                log.log(Level.SEVERE, "Unknown Parameter: " + name);
            }
        }

    } // prepare

    @Override
    protected String doIt() throws Exception
    {
        FECompConsultaReq consulta = new FECompConsultaReq(tipoCbte, nroDoc, pdv);

        // @fchiappano Recuperar el cuit del emisor.
        String cuit = MOrgInfo.get(getCtx(), Env.getAD_Org_ID(getCtx()), get_TrxName()).get_ValueAsString("TaxID")
                .replaceAll("-", "");
        long cuitOrg = Long.parseLong(cuit);

        // @fchiappano Recuperar Ticket de Acceso.
        String[] tokenSign = ProcesadorWSAA.getTicketAcceso();

        // @fchiappano Instanciar el servicio, que interactuara con el WS.
        ServiceSoap12Stub soap = new ServiceSoap12Stub(new URL(ProcesadorWSAA.getWSDL()), null);

        // @fchiappano Genero el authentication request.
        FEAuthRequest autRequest = new FEAuthRequest(tokenSign[0], tokenSign[1], cuitOrg);

        // @fchiappano Realizar consulta.
        FECompConsultaResponse respuesta = soap.FECompConsultar(autRequest, consulta);

        Err[] errores = respuesta.getErrors();

        if (errores != null)
        {
            String msgError = errores[0].getCode() + " " + errores[0].getMsg();
            return msgError;
        }

        FECompConsResponse comprobante = respuesta.getResultGet();
        String datos = "Identificación Cliente: " + comprobante.getDocNro() + " \n "
                     + "Fecha de Comprobante: " + comprobante.getCbteFch() + " \n "
                     + "Fecha de Venc. PAGO: " + comprobante.getFchVtoPago() + " \n "
                     + "Tipo Doc.: " + comprobante.getDocTipo() + " \n "
                     + "CAE: " + comprobante.getCodAutorizacion() + " \n "
                     + "Neto: " + comprobante.getImpNeto() + " \n "
                     + "Total: " + comprobante.getImpTotal() + " \n "
                     + "Moneda: " + comprobante.getMonId() + " \n "
                     + "Vto Cae: " + comprobante.getFchVto() + "\n"
                     + "IVA: " + comprobante.getImpIVA() + "\n"
                     + "Percepción " + comprobante.getImpTrib();

        return datos;
    } // doIt

} // ConsultarDocumentosFE
