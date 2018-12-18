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

import org.compiere.model.MBPartner;
import org.compiere.model.MBPartnerLocation;
import org.compiere.model.MInvoice;
import org.compiere.model.MLocation;
import org.compiere.model.MOrder;
import org.compiere.model.PO;
import org.compiere.util.Env;

/**
 * Datos del cliente de una factura determinada para utilizar
 * en la impresión vía POS
 *
 * @author Emiliano Pereyra - http://www.comit.com.ar
 */
final class DatosCliente
{
    private final MBPartner bpartner;
    private MBPartnerLocation bpLocation;

    DatosCliente(final PO documento)
    {
        if (documento instanceof MOrder)
        {
            final MOrder orden = (MOrder) documento;
            bpartner = new MBPartner(Env.getCtx(), orden.getC_BPartner_ID(), orden.get_TrxName());
        }
        else
        {
            final MInvoice invoice = (MInvoice) documento;
            bpartner = new MBPartner(Env.getCtx(), invoice.getC_BPartner_ID(), invoice.get_TrxName());
        }

        bpLocation = new MBPartnerLocation(bpartner);
    }

    public String getNombre()
    {
        return bpartner.getName();
    }

    public String getCUIT()
    {
        return bpartner.getTaxID();
    }

    public String getDireccion()
    {
        final MLocation location = bpLocation.getLocation(false);
        final String address = location.getAddress1() == null ? "-- " : location.getAddress1() + "\n";
        return new StringBuilder(address)
                         .append("(").append(location.getPostal()).append(")")
                         .append(" ").append(location.getCity())
                         .append(", ").append(location.getRegionName())
                         .toString();

    }

    public String getTelefono()
    {
        return bpLocation.getPhone() == null ? "--" : bpLocation.getPhone();
    }
}
