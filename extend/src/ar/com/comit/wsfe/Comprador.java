/**
 * Comprador.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package ar.com.comit.wsfe;

public class Comprador  implements java.io.Serializable {
    private int docTipo;

    private long docNro;

    private double porcentaje;

    public Comprador() {
    }

    public Comprador(
           int docTipo,
           long docNro,
           double porcentaje) {
           this.docTipo = docTipo;
           this.docNro = docNro;
           this.porcentaje = porcentaje;
    }


    /**
     * Gets the docTipo value for this Comprador.
     * 
     * @return docTipo
     */
    public int getDocTipo() {
        return docTipo;
    }


    /**
     * Sets the docTipo value for this Comprador.
     * 
     * @param docTipo
     */
    public void setDocTipo(int docTipo) {
        this.docTipo = docTipo;
    }


    /**
     * Gets the docNro value for this Comprador.
     * 
     * @return docNro
     */
    public long getDocNro() {
        return docNro;
    }


    /**
     * Sets the docNro value for this Comprador.
     * 
     * @param docNro
     */
    public void setDocNro(long docNro) {
        this.docNro = docNro;
    }


    /**
     * Gets the porcentaje value for this Comprador.
     * 
     * @return porcentaje
     */
    public double getPorcentaje() {
        return porcentaje;
    }


    /**
     * Sets the porcentaje value for this Comprador.
     * 
     * @param porcentaje
     */
    public void setPorcentaje(double porcentaje) {
        this.porcentaje = porcentaje;
    }

    private java.lang.Object __equalsCalc = null;
    public synchronized boolean equals(java.lang.Object obj) {
        if (!(obj instanceof Comprador)) return false;
        Comprador other = (Comprador) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true && 
            this.docTipo == other.getDocTipo() &&
            this.docNro == other.getDocNro() &&
            this.porcentaje == other.getPorcentaje();
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
        _hashCode += getDocTipo();
        _hashCode += new Long(getDocNro()).hashCode();
        _hashCode += new Double(getPorcentaje()).hashCode();
        __hashCodeCalc = false;
        return _hashCode;
    }

    // Type metadata
    private static org.apache.axis.description.TypeDesc typeDesc =
        new org.apache.axis.description.TypeDesc(Comprador.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "Comprador"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("docTipo");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "DocTipo"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("docNro");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "DocNro"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "long"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("porcentaje");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "Porcentaje"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "double"));
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
