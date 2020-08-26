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
 * CbteAsoc.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package ar.com.comit.wsfe;

public class CbteAsoc  implements java.io.Serializable {
    private int tipo;

    private int ptoVta;

    private long nro;

    // @fchiappano cuit del comrobante asociado.
    private long cuit;

    // @fchiappano fecha del comprobante asociado.
    private String cbteFch;

    public CbteAsoc() {
    }

    public CbteAsoc(
           int tipo,
           int ptoVta,
           long nro,
           long cuit,
           String cbteFch) {
           this.tipo = tipo;
           this.ptoVta = ptoVta;
           this.nro = nro;
           this.cuit = cuit;
           this.cbteFch = cbteFch;
    }


    /**
     * Gets the tipo value for this CbteAsoc.
     *
     * @return tipo
     */
    public int getTipo() {
        return tipo;
    }


    /**
     * Sets the tipo value for this CbteAsoc.
     *
     * @param tipo
     */
    public void setTipo(int tipo) {
        this.tipo = tipo;
    }


    /**
     * Gets the ptoVta value for this CbteAsoc.
     *
     * @return ptoVta
     */
    public int getPtoVta() {
        return ptoVta;
    }


    /**
     * Sets the ptoVta value for this CbteAsoc.
     *
     * @param ptoVta
     */
    public void setPtoVta(int ptoVta) {
        this.ptoVta = ptoVta;
    }


    /**
     * Gets the nro value for this CbteAsoc.
     *
     * @return nro
     */
    public long getNro() {
        return nro;
    }


    /**
     * Sets the nro value for this CbteAsoc.
     *
     * @param nro
     */
    public void setNro(long nro) {
        this.nro = nro;
    }

    // @fchiappano Getters y Setters para las variables Cuit y CbteFecha.
    public long getCuit()
    {
        return cuit;
    }

    public void setCuit(long cuit)
    {
        this.cuit = cuit;
    }

    public String getCbteFch()
    {
        return cbteFch;
    }

    public void setCbteFch(String cbteFch)
    {
        this.cbteFch = cbteFch;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof CbteAsoc)) return false;
        CbteAsoc other = (CbteAsoc) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true &&
            this.tipo == other.getTipo() &&
            this.ptoVta == other.getPtoVta() &&
            this.nro == other.getNro() &&
            this.cuit == other.getCuit() &&
            this.cbteFch == other.getCbteFch();
        __equalsCalc = null;
        return _equals;
    }

    private boolean __hashCodeCalc = false;
    public synchronized int hashCode() {
        if (__hashCodeCalc) {
            return 0;
        }
        __hashCodeCalc = true;
        int _hashCode = 1;
        _hashCode += getTipo();
        _hashCode += getPtoVta();
        _hashCode += new Long(getNro()).hashCode();
        // @fchiappano Agregar el cuit del comprobante asociado.
        _hashCode += new Long(getCuit()).hashCode();
        _hashCode += getCbteFch().hashCode();
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(CbteAsoc.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "CbteAsoc"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("tipo");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "Tipo"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("ptoVta");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "PtoVta"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("nro");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "Nro"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "long"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        // @fchiappano Agregar Cuit de documento origen.
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("cuit");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "Cuit"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "long"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        // @fchiappano Agregar fecha del documento origen.
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("cbteFch");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "CbteFch"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
    }

    /**
     * Return type metadata object
     */
    public static org.apache.axis.description.TypeDesc getTypeDesc() {
        return typeDesc;
    }

    /**
     * Get Custom Serializer
     */
    public static org.apache.axis.encoding.Serializer getSerializer(
           java.lang.String mechType,
           java.lang.Class _javaType,
           javax.xml.namespace.QName _xmlType) {
        return
          new  org.apache.axis.encoding.ser.BeanSerializer(
            _javaType, _xmlType, typeDesc);
    }

    /**
     * Get Custom Deserializer
     */
    public static org.apache.axis.encoding.Deserializer getDeserializer(
           java.lang.String mechType,
           java.lang.Class _javaType,
           javax.xml.namespace.QName _xmlType) {
        return
          new  org.apache.axis.encoding.ser.BeanDeserializer(
            _javaType, _xmlType, typeDesc);
    }

}
