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

/**
 * ServiceSoap.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package ar.com.comit.wsfex;

public interface ServiceSoap extends java.rmi.Remote {

    /**
     * Autoriza un comprobante, devolviendo  su CAE correspondiente
     */
    public ar.com.comit.wsfex.FEXResponseAuthorize FEXAuthorize(ar.com.comit.wsfex.ClsFEXAuthRequest auth, ar.com.comit.wsfex.ClsFEXRequest cmp) throws java.rmi.RemoteException;

    /**
     * Recupera los datos completos de un comprobante ya autorizado
     */
    public ar.com.comit.wsfex.FEXGetCMPResponse FEXGetCMP(ar.com.comit.wsfex.ClsFEXAuthRequest auth, ar.com.comit.wsfex.ClsFEXGetCMP cmp) throws java.rmi.RemoteException;

    /**
     * Recupera el listado de los tipos de comprobante  y su codigo
     * utilizables en servicio de autorizacion
     */
    public ar.com.comit.wsfex.FEXResponse_Cbte_Tipo FEXGetPARAM_Cbte_Tipo(ar.com.comit.wsfex.ClsFEXAuthRequest auth) throws java.rmi.RemoteException;

    /**
     * Recupera el listado de los tipos de exportacion  y sus codigo
     * utilizables en servicio de autorizacion
     */
    public ar.com.comit.wsfex.FEXResponse_Tex FEXGetPARAM_Tipo_Expo(ar.com.comit.wsfex.ClsFEXAuthRequest auth) throws java.rmi.RemoteException;

    /**
     * Recupera el listado Incoterms  utilizables en servicio de autorizacion
     */
    public ar.com.comit.wsfex.FEXResponse_Inc FEXGetPARAM_Incoterms(ar.com.comit.wsfex.ClsFEXAuthRequest auth) throws java.rmi.RemoteException;

    /**
     * Recupera el listado de los idiomas  y sus codigos utilizables
     * en servicio de autorizacion
     */
    public ar.com.comit.wsfex.FEXResponse_Idi FEXGetPARAM_Idiomas(ar.com.comit.wsfex.ClsFEXAuthRequest auth) throws java.rmi.RemoteException;

    /**
     * Recupera el listado de las unidades de medida  y su codigo
     * utilizables en servicio de autorizacion
     */
    public ar.com.comit.wsfex.FEXResponse_Umed FEXGetPARAM_UMed(ar.com.comit.wsfex.ClsFEXAuthRequest auth) throws java.rmi.RemoteException;

    /**
     * Recupera el listado de paises
     */
    public ar.com.comit.wsfex.FEXResponse_DST_pais FEXGetPARAM_DST_pais(ar.com.comit.wsfex.ClsFEXAuthRequest auth) throws java.rmi.RemoteException;

    /**
     * Recupera el listado de las cuits de los paises de destinacion
     */
    public ar.com.comit.wsfex.FEXResponse_DST_cuit FEXGetPARAM_DST_CUIT(ar.com.comit.wsfex.ClsFEXAuthRequest auth) throws java.rmi.RemoteException;

    /**
     * Recupera el listado  de monedas y su codigo utilizables en
     * servicio de autorizacion
     */
    public ar.com.comit.wsfex.FEXResponse_Mon FEXGetPARAM_MON(ar.com.comit.wsfex.ClsFEXAuthRequest auth) throws java.rmi.RemoteException;

    /**
     * Recupera el ultimos comprobante autorizado
     */
    public ar.com.comit.wsfex.FEXResponseLast_CMP FEXGetLast_CMP(ar.com.comit.wsfex.ClsFEX_LastCMP auth) throws java.rmi.RemoteException;

    /**
     * Metodo dummy para verificacion de funcionamiento
     */
    public ar.com.comit.wsfex.DummyResponse FEXDummy() throws java.rmi.RemoteException;

    /**
     * Recupera la cotizacion de la moneda consultada y su  fecha
     */
    public ar.com.comit.wsfex.FEXResponse_Ctz FEXGetPARAM_Ctz(ar.com.comit.wsfex.ClsFEXAuthRequest auth, java.lang.String mon_id) throws java.rmi.RemoteException;

    /**
     * Recupera el ultimo ID y su  fecha
     */
    public ar.com.comit.wsfex.FEXResponse_LastID FEXGetLast_ID(ar.com.comit.wsfex.ClsFEXAuthRequest auth) throws java.rmi.RemoteException;

    /**
     * Recupera el listado de los puntos de venta registrados para
     * Factura electronica de exportacion - WS y su estado
     */
    public ar.com.comit.wsfex.FEXResponse_PtoVenta FEXGetPARAM_PtoVenta(ar.com.comit.wsfex.ClsFEXAuthRequest auth) throws java.rmi.RemoteException;

    /**
     * Verifica la  existencia de la permiso/pais de destinación 
     * de embarque ingresado
     */
    public ar.com.comit.wsfex.FEXResponse_CheckPermiso FEXCheck_Permiso(ar.com.comit.wsfex.ClsFEXAuthRequest auth, java.lang.String ID_Permiso, int dst_merc) throws java.rmi.RemoteException;

    /**
     * Recupera el listado de identificadores para los campos Opcionales
     */
    public ar.com.comit.wsfex.FEXResponse_Opc FEXGetPARAM_Opcionales(ar.com.comit.wsfex.ClsFEXAuthRequest auth) throws java.rmi.RemoteException;
}
