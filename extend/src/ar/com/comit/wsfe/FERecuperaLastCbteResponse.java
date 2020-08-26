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
 * FERecuperaLastCbteResponse.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package ar.com.comit.wsfe;

public class FERecuperaLastCbteResponse  implements java.io.Serializable {
    private int ptoVta;

    private int cbteTipo;

    private int cbteNro;

    private Err[] errors;

    private Evt[] events;

    public FERecuperaLastCbteResponse() {
    }

    public FERecuperaLastCbteResponse(
           int ptoVta,
           int cbteTipo,
           int cbteNro,
           Err[] errors,
           Evt[] events) {
           this.ptoVta = ptoVta;
           this.cbteTipo = cbteTipo;
           this.cbteNro = cbteNro;
           this.errors = errors;
           this.events = events;
    }


    /**
     * Gets the ptoVta value for this FERecuperaLastCbteResponse.
     *
     * @return ptoVta
     */
    public int getPtoVta() {
        return ptoVta;
    }


    /**
     * Sets the ptoVta value for this FERecuperaLastCbteResponse.
     *
     * @param ptoVta
     */
    public void setPtoVta(int ptoVta) {
        this.ptoVta = ptoVta;
    }


    /**
     * Gets the cbteTipo value for this FERecuperaLastCbteResponse.
     *
     * @return cbteTipo
     */
    public int getCbteTipo() {
        return cbteTipo;
    }


    /**
     * Sets the cbteTipo value for this FERecuperaLastCbteResponse.
     *
     * @param cbteTipo
     */
    public void setCbteTipo(int cbteTipo) {
        this.cbteTipo = cbteTipo;
    }


    /**
     * Gets the cbteNro value for this FERecuperaLastCbteResponse.
     *
     * @return cbteNro
     */
    public int getCbteNro() {
        return cbteNro;
    }


    /**
     * Sets the cbteNro value for this FERecuperaLastCbteResponse.
     *
     * @param cbteNro
     */
    public void setCbteNro(int cbteNro) {
        this.cbteNro = cbteNro;
    }


    /**
     * Gets the errors value for this FERecuperaLastCbteResponse.
     *
     * @return errors
     */
    public Err[] getErrors() {
        return errors;
    }


    /**
     * Sets the errors value for this FERecuperaLastCbteResponse.
     *
     * @param errors
     */
    public void setErrors(Err[] errors) {
        this.errors = errors;
    }


    /**
     * Gets the events value for this FERecuperaLastCbteResponse.
     *
     * @return events
     */
    public Evt[] getEvents() {
        return events;
    }


    /**
     * Sets the events value for this FERecuperaLastCbteResponse.
     *
     * @param events
     */
    public void setEvents(Evt[] events) {
        this.events = events;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof FERecuperaLastCbteResponse)) return false;
        FERecuperaLastCbteResponse other = (FERecuperaLastCbteResponse) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true &&
            this.ptoVta == other.getPtoVta() &&
            this.cbteTipo == other.getCbteTipo() &&
            this.cbteNro == other.getCbteNro() &&
            ((this.errors==null && other.getErrors()==null) ||
             (this.errors!=null &&
              java.util.Arrays.equals(this.errors, other.getErrors()))) &&
            ((this.events==null && other.getEvents()==null) ||
             (this.events!=null &&
              java.util.Arrays.equals(this.events, other.getEvents())));
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
        _hashCode += getPtoVta();
        _hashCode += getCbteTipo();
        _hashCode += getCbteNro();
        if (getErrors() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getErrors());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getErrors(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getEvents() != null) {
            for (int i=0;
                 i<java.lang.reflect.Array.getLength(getEvents());
                 i++) {
                java.lang.Object obj = java.lang.reflect.Array.get(getEvents(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(FERecuperaLastCbteResponse.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "FERecuperaLastCbteResponse"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("ptoVta");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "PtoVta"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("cbteTipo");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "CbteTipo"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("cbteNro");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "CbteNro"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("errors");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "Errors"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "Err"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "Err"));
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("events");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "Events"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "Evt"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "Evt"));
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
