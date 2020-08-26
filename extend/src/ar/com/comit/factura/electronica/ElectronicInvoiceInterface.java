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

/**
 * Interface para la gestion de Facturas Electronicas mediante WS de AFIP.
 * La interfaz se definió respetando dentro de las posibilidades la 
 * tradicional implementacion Wsfe que se apoyaba en pyafipws, a fin 
 * de evitar generar mayor impacto en la logica de la clase MInvoice
 */

import java.sql.Timestamp;

public interface ElectronicInvoiceInterface
{
    /** Registra una factura electronica en el site de AFIP mediante WSFEV1 */
    public String generateCAE();

    /** Retorna el CAE obtenido */
    public String getCAE();

    /** Retorna el Vencimiento del CAE */
    public Timestamp getDateCae();

    /** Retorna el Numero de comprobante obtenido */
    public String getNroCbte();

    /** Retorna Error(es) al obtener el CAE */
    public String getErrorMsg();
} // ElectronicInvoiceInterface
