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
 * FECAEADetRequest.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package ar.com.comit.wsfe;

public class FECAEADetRequest  extends FEDetRequest  implements java.io.Serializable {
    private java.lang.String CAEA;

    public FECAEADetRequest() {
    }

    public FECAEADetRequest(
           int concepto,
           int docTipo,
           long docNro,
           long cbteDesde,
           long cbteHasta,
           java.lang.String cbteFch,
           double impTotal,
           double impTotConc,
           double impNeto,
           double impOpEx,
           double impTrib,
           double impIVA,
           java.lang.String fchServDesde,
           java.lang.String fchServHasta,
           java.lang.String fchVtoPago,
           java.lang.String monId,
           double monCotiz,
           CbteAsoc[] cbtesAsoc,
           Tributo[] tributos,
           AlicIva[] iva,
           Opcional[] opcionales,
           java.lang.String CAEA) {
        super(
            concepto,
            docTipo,
            docNro,
            cbteDesde,
            cbteHasta,
            cbteFch,
            impTotal,
            impTotConc,
            impNeto,
            impOpEx,
            impTrib,
            impIVA,
            fchServDesde,
            fchServHasta,
            fchVtoPago,
            monId,
            monCotiz,
            cbtesAsoc,
            tributos,
            iva,
            opcionales);
        this.CAEA = CAEA;
    }


    /**
     * Gets the CAEA value for this FECAEADetRequest.
     *
     * @return CAEA
     */
    public java.lang.String getCAEA() {
        return CAEA;
    }


    /**
     * Sets the CAEA value for this FECAEADetRequest.
     *
     * @param CAEA
     */
    public void setCAEA(java.lang.String CAEA) {
        this.CAEA = CAEA;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof FECAEADetRequest)) return false;
        FECAEADetRequest other = (FECAEADetRequest) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = super.equals(obj) &&
            ((this.CAEA==null && other.getCAEA()==null) ||
             (this.CAEA!=null &&
              this.CAEA.equals(other.getCAEA())));
        __equalsCalc = null;
        return _equals;
    }

    private boolean __hashCodeCalc = false;
    public synchronized int hashCode() {
        if (__hashCodeCalc) {
            return 0;
        }
        __hashCodeCalc = true;
        int _hashCode = super.hashCode();
        if (getCAEA() != null) {
            _hashCode += getCAEA().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(FECAEADetRequest.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "FECAEADetRequest"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("CAEA");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "CAEA"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
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
