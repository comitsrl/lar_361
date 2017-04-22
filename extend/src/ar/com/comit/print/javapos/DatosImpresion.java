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
package ar.com.comit.print.javapos;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.compiere.model.MClient;
import org.compiere.model.MDocType;
import org.compiere.model.MInvoice;
import org.compiere.model.MLocation;
import org.compiere.model.MOrg;
import org.compiere.model.MOrgInfo;
import org.compiere.model.MPOS;
import org.compiere.model.MUser;
import org.compiere.util.Env;

import ar.com.ergio.model.X_LAR_DocumentLetter;

/**
 *
 * @author Emiliano Pereyra - http://www.comit.com.ar
 */
final class DatosImpresion
{
    private final MInvoice invoice;
    private final MDocType docType;
    private final MClient client;
    private final MOrg org;
    private final MOrgInfo orgInfo;
    private Boolean discriminaIva = null;
    private String letra = null;

    public DatosImpresion(final MInvoice invoice)
    {
        this.invoice = invoice;
        this.docType = new MDocType(Env.getCtx(), invoice.getC_DocType_ID(), invoice.get_TrxName());
        this.client = MClient.get(Env.getCtx(), invoice.getAD_Client_ID());
        this.org = MOrg.get(Env.getCtx(), invoice.getAD_Org_ID());
        this.orgInfo = MOrgInfo.get(Env.getCtx(), invoice.getAD_Org_ID(), invoice.get_TrxName());
    }

    public String getRazonSocial()
    {
        return client.getName();
    }

    /**
     * Devuelve la dirección de la organización
     *
     * @return dirección
     */
    public String getDireccion()
    {
        final MLocation location = MLocation.get(Env.getCtx(), orgInfo.getC_Location_ID(), orgInfo.get_TrxName());
        return new StringBuilder(location.getAddress1())
                         .append("\n(").append(location.getPostal()).append(")")
                         .append(" ").append(location.getCity())
                         .append(", ").append(location.getRegionName())
                         .toString();
    }

    public String getCUIT()
    {
        return orgInfo.getTaxID();
    }

    public String getEmail()
    {
        return orgInfo.getEMail();
    }

    public String getIIBB()
    {
        return orgInfo.getDUNS();
    }

    public String getInicioActividades()
    {
        return "01/01/2000";
    }

    public String getLogo()
    {
        return "Logo_Propet.bmp";
    }

    public String getSucursal()
    {
        return org.getName();
    }

    public DatosCliente getDatosCliente()
    {
        return new DatosCliente(invoice);
    }

    public String getUsuario()
    {
        return MUser.get(Env.getCtx()).getName();
    }

    public String getNumeroDocumento()
    {
        // Se le quita el primer caracter que es que "letra"
        return invoice.getDocumentNo().substring(1);
    }

    /**
     * Devuelve el subtipo de CAE
     *
     * @return subtipo
     */
    public String getDocSubtypeCAE()
    {
        return docType.getdocsubtypecae();
    }

    public String getLetra()
    {
        if (letra == null)
        {
            int lar_DocumentLetter_ID = docType.get_ValueAsInt("LAR_DocumentLetter_ID");
            final X_LAR_DocumentLetter letter = new X_LAR_DocumentLetter(Env.getCtx(), lar_DocumentLetter_ID, invoice.get_TrxName());
            letra = letter.getLetter();
        }
        return letra;
    }

    public boolean isDiscriminaIVA()
    {
        if (discriminaIva == null)
            // se asume que getLetra se llama primero, por eso letra no es nulo
            discriminaIva = letra.equals("A") ? Boolean.TRUE : Boolean.FALSE;

        return discriminaIva;
    }
    /**
     * Devuelve el punto de venta, con formato de 4 dígitos
     *
     * @return pdv
     */
    public String getPDV()
    {
        final MPOS pos = new MPOS(Env.getCtx(), invoice.get_ValueAsInt("C_POS_ID"), invoice.get_TrxName());
        return String.format("%04d", pos.get_ValueAsInt("POSNumber"));
    }

    /**
     * Devuelve el CAE asignado a la factura
     *
     * @return cae
     */
    public String getCAE()
    {
        //return invoice.getcae();
        return "66183859964837";
    }

    /**
     * Devuelve la fecha de vencimiento del CAE
     *
     * @return fecha
     */
    public Timestamp getVtoCAE()
    {
        //return invoice.getvtocae();
        return new Timestamp(System.currentTimeMillis());
    }

    /**
     * Devuelve la combinación de código para formar el código de barra
     * necesario en las facturas electrónicas
     *
     * @return codigo
     */
    public String getCodigoFE()
    {
        // FIXME - Falta incorporar el dígito verificador
        return new StringBuilder(getCUIT().replace("-", ""))
                            .append(getDocSubtypeCAE())
                            .append(getPDV())
                            .append(getCAE())
                            .append(new SimpleDateFormat("yyyyMMdd").format(getVtoCAE()))
                            .toString();
    }
}
