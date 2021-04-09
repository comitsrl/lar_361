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
 * FEXResponseAuthorize.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package ar.com.comit.wsfex;

public class FEXResponseAuthorize  implements java.io.Serializable {
    private ar.com.comit.wsfex.ClsFEXOutAuthorize FEXResultAuth;

    private ar.com.comit.wsfex.ClsFEXErr FEXErr;

    private ar.com.comit.wsfex.ClsFEXEvents FEXEvents;

    public FEXResponseAuthorize() {
    }

    public FEXResponseAuthorize(
           ar.com.comit.wsfex.ClsFEXOutAuthorize FEXResultAuth,
           ar.com.comit.wsfex.ClsFEXErr FEXErr,
           ar.com.comit.wsfex.ClsFEXEvents FEXEvents) {
           this.FEXResultAuth = FEXResultAuth;
           this.FEXErr = FEXErr;
           this.FEXEvents = FEXEvents;
    }


    /**
     * Gets the FEXResultAuth value for this FEXResponseAuthorize.
     * 
     * @return FEXResultAuth
     */
    public ar.com.comit.wsfex.ClsFEXOutAuthorize getFEXResultAuth() {
        return FEXResultAuth;
    }


    /**
     * Sets the FEXResultAuth value for this FEXResponseAuthorize.
     * 
     * @param FEXResultAuth
     */
    public void setFEXResultAuth(ar.com.comit.wsfex.ClsFEXOutAuthorize FEXResultAuth) {
        this.FEXResultAuth = FEXResultAuth;
    }


    /**
     * Gets the FEXErr value for this FEXResponseAuthorize.
     * 
     * @return FEXErr
     */
    public ar.com.comit.wsfex.ClsFEXErr getFEXErr() {
        return FEXErr;
    }


    /**
     * Sets the FEXErr value for this FEXResponseAuthorize.
     * 
     * @param FEXErr
     */
    public void setFEXErr(ar.com.comit.wsfex.ClsFEXErr FEXErr) {
        this.FEXErr = FEXErr;
    }


    /**
     * Gets the FEXEvents value for this FEXResponseAuthorize.
     * 
     * @return FEXEvents
     */
    public ar.com.comit.wsfex.ClsFEXEvents getFEXEvents() {
        return FEXEvents;
    }


    /**
     * Sets the FEXEvents value for this FEXResponseAuthorize.
     * 
     * @param FEXEvents
     */
    public void setFEXEvents(ar.com.comit.wsfex.ClsFEXEvents FEXEvents) {
        this.FEXEvents = FEXEvents;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof FEXResponseAuthorize)) return false;
        FEXResponseAuthorize other = (FEXResponseAuthorize) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            ((this.FEXResultAuth==null && other.getFEXResultAuth()==null) || 
             (this.FEXResultAuth!=null &&
              this.FEXResultAuth.equals(other.getFEXResultAuth()))) &&
            ((this.FEXErr==null && other.getFEXErr()==null) || 
             (this.FEXErr!=null &&
              this.FEXErr.equals(other.getFEXErr()))) &&
            ((this.FEXEvents==null && other.getFEXEvents()==null) || 
             (this.FEXEvents!=null &&
              this.FEXEvents.equals(other.getFEXEvents())));
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
        if (getFEXResultAuth() != null) {
            _hashCode += getFEXResultAuth().hashCode();
        }
        if (getFEXErr() != null) {
            _hashCode += getFEXErr().hashCode();
        }
        if (getFEXEvents() != null) {
            _hashCode += getFEXEvents().hashCode();
        }
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(FEXResponseAuthorize.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://ar.gov.afip.dif.fexv1/", "FEXResponseAuthorize"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("FEXResultAuth");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.fexv1/", "FEXResultAuth"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://ar.gov.afip.dif.fexv1/", "ClsFEXOutAuthorize"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("FEXErr");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.fexv1/", "FEXErr"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://ar.gov.afip.dif.fexv1/", "ClsFEXErr"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("FEXEvents");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.fexv1/", "FEXEvents"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://ar.gov.afip.dif.fexv1/", "ClsFEXEvents"));
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
