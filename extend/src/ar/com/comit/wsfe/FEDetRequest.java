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
 * FEDetRequest.java
 *
 * This file was auto-generated from WSDL
 * by the Apache Axis 1.4 Apr 22, 2006 (06:55:48 PDT) WSDL2Java emitter.
 */

package ar.com.comit.wsfe;

import java.lang.reflect.Array;

public class FEDetRequest  implements java.io.Serializable {
    private int concepto;

    private int docTipo;

    private long docNro;

    private long cbteDesde;

    private long cbteHasta;

    private String cbteFch;

    private double impTotal;

    private double impTotConc;

    private double impNeto;

    private double impOpEx;

    private double impTrib;

    private double impIVA;

    private String fchServDesde;

    private String fchServHasta;

    private String fchVtoPago;

    private String monId;

    private double monCotiz;

    private CbteAsoc[] cbtesAsoc;

    private Tributo[] tributos;

    private AlicIva[] iva;

    private Opcional[] opcionales;

    public FEDetRequest() {
    }

    public FEDetRequest(
           int concepto,
           int docTipo,
           long docNro,
           long cbteDesde,
           long cbteHasta,
           String cbteFch,
           double impTotal,
           double impTotConc,
           double impNeto,
           double impOpEx,
           double impTrib,
           double impIVA,
           String fchServDesde,
           String fchServHasta,
           String fchVtoPago,
           String monId,
           double monCotiz,
           CbteAsoc[] cbtesAsoc,
           Tributo[] tributos,
           AlicIva[] iva,
           Opcional[] opcionales) {
           this.concepto = concepto;
           this.docTipo = docTipo;
           this.docNro = docNro;
           this.cbteDesde = cbteDesde;
           this.cbteHasta = cbteHasta;
           this.cbteFch = cbteFch;
           this.impTotal = impTotal;
           this.impTotConc = impTotConc;
           this.impNeto = impNeto;
           this.impOpEx = impOpEx;
           this.impTrib = impTrib;
           this.impIVA = impIVA;
           this.fchServDesde = fchServDesde;
           this.fchServHasta = fchServHasta;
           this.fchVtoPago = fchVtoPago;
           this.monId = monId;
           this.monCotiz = monCotiz;
           this.cbtesAsoc = cbtesAsoc;
           this.tributos = tributos;
           this.iva = iva;
           this.opcionales = opcionales;
    }


    /**
     * Gets the concepto value for this FEDetRequest.
     *
     * @return concepto
     */
    public int getConcepto() {
        return concepto;
    }


    /**
     * Sets the concepto value for this FEDetRequest.
     *
     * @param concepto
     */
    public void setConcepto(int concepto) {
        this.concepto = concepto;
    }


    /**
     * Gets the docTipo value for this FEDetRequest.
     *
     * @return docTipo
     */
    public int getDocTipo() {
        return docTipo;
    }


    /**
     * Sets the docTipo value for this FEDetRequest.
     *
     * @param docTipo
     */
    public void setDocTipo(int docTipo) {
        this.docTipo = docTipo;
    }


    /**
     * Gets the docNro value for this FEDetRequest.
     *
     * @return docNro
     */
    public long getDocNro() {
        return docNro;
    }


    /**
     * Sets the docNro value for this FEDetRequest.
     *
     * @param docNro
     */
    public void setDocNro(long docNro) {
        this.docNro = docNro;
    }


    /**
     * Gets the cbteDesde value for this FEDetRequest.
     *
     * @return cbteDesde
     */
    public long getCbteDesde() {
        return cbteDesde;
    }


    /**
     * Sets the cbteDesde value for this FEDetRequest.
     *
     * @param cbteDesde
     */
    public void setCbteDesde(long cbteDesde) {
        this.cbteDesde = cbteDesde;
    }


    /**
     * Gets the cbteHasta value for this FEDetRequest.
     *
     * @return cbteHasta
     */
    public long getCbteHasta() {
        return cbteHasta;
    }


    /**
     * Sets the cbteHasta value for this FEDetRequest.
     *
     * @param cbteHasta
     */
    public void setCbteHasta(long cbteHasta) {
        this.cbteHasta = cbteHasta;
    }


    /**
     * Gets the cbteFch value for this FEDetRequest.
     *
     * @return cbteFch
     */
    public String getCbteFch() {
        return cbteFch;
    }


    /**
     * Sets the cbteFch value for this FEDetRequest.
     *
     * @param cbteFch
     */
    public void setCbteFch(String cbteFch) {
        this.cbteFch = cbteFch;
    }


    /**
     * Gets the impTotal value for this FEDetRequest.
     *
     * @return impTotal
     */
    public double getImpTotal() {
        return impTotal;
    }


    /**
     * Sets the impTotal value for this FEDetRequest.
     *
     * @param impTotal
     */
    public void setImpTotal(double impTotal) {
        this.impTotal = impTotal;
    }


    /**
     * Gets the impTotConc value for this FEDetRequest.
     *
     * @return impTotConc
     */
    public double getImpTotConc() {
        return impTotConc;
    }


    /**
     * Sets the impTotConc value for this FEDetRequest.
     *
     * @param impTotConc
     */
    public void setImpTotConc(double impTotConc) {
        this.impTotConc = impTotConc;
    }


    /**
     * Gets the impNeto value for this FEDetRequest.
     *
     * @return impNeto
     */
    public double getImpNeto() {
        return impNeto;
    }


    /**
     * Sets the impNeto value for this FEDetRequest.
     *
     * @param impNeto
     */
    public void setImpNeto(double impNeto) {
        this.impNeto = impNeto;
    }


    /**
     * Gets the impOpEx value for this FEDetRequest.
     *
     * @return impOpEx
     */
    public double getImpOpEx() {
        return impOpEx;
    }


    /**
     * Sets the impOpEx value for this FEDetRequest.
     *
     * @param impOpEx
     */
    public void setImpOpEx(double impOpEx) {
        this.impOpEx = impOpEx;
    }


    /**
     * Gets the impTrib value for this FEDetRequest.
     *
     * @return impTrib
     */
    public double getImpTrib() {
        return impTrib;
    }


    /**
     * Sets the impTrib value for this FEDetRequest.
     *
     * @param impTrib
     */
    public void setImpTrib(double impTrib) {
        this.impTrib = impTrib;
    }


    /**
     * Gets the impIVA value for this FEDetRequest.
     *
     * @return impIVA
     */
    public double getImpIVA() {
        return impIVA;
    }


    /**
     * Sets the impIVA value for this FEDetRequest.
     *
     * @param impIVA
     */
    public void setImpIVA(double impIVA) {
        this.impIVA = impIVA;
    }


    /**
     * Gets the fchServDesde value for this FEDetRequest.
     *
     * @return fchServDesde
     */
    public String getFchServDesde() {
        return fchServDesde;
    }


    /**
     * Sets the fchServDesde value for this FEDetRequest.
     *
     * @param fchServDesde
     */
    public void setFchServDesde(String fchServDesde) {
        this.fchServDesde = fchServDesde;
    }


    /**
     * Gets the fchServHasta value for this FEDetRequest.
     *
     * @return fchServHasta
     */
    public String getFchServHasta() {
        return fchServHasta;
    }


    /**
     * Sets the fchServHasta value for this FEDetRequest.
     *
     * @param fchServHasta
     */
    public void setFchServHasta(String fchServHasta) {
        this.fchServHasta = fchServHasta;
    }


    /**
     * Gets the fchVtoPago value for this FEDetRequest.
     *
     * @return fchVtoPago
     */
    public String getFchVtoPago() {
        return fchVtoPago;
    }


    /**
     * Sets the fchVtoPago value for this FEDetRequest.
     *
     * @param fchVtoPago
     */
    public void setFchVtoPago(String fchVtoPago) {
        this.fchVtoPago = fchVtoPago;
    }


    /**
     * Gets the monId value for this FEDetRequest.
     *
     * @return monId
     */
    public String getMonId() {
        return monId;
    }


    /**
     * Sets the monId value for this FEDetRequest.
     *
     * @param monId
     */
    public void setMonId(String monId) {
        this.monId = monId;
    }


    /**
     * Gets the monCotiz value for this FEDetRequest.
     *
     * @return monCotiz
     */
    public double getMonCotiz() {
        return monCotiz;
    }


    /**
     * Sets the monCotiz value for this FEDetRequest.
     *
     * @param monCotiz
     */
    public void setMonCotiz(double monCotiz) {
        this.monCotiz = monCotiz;
    }


    /**
     * Gets the cbtesAsoc value for this FEDetRequest.
     *
     * @return cbtesAsoc
     */
    public CbteAsoc[] getCbtesAsoc() {
        return cbtesAsoc;
    }


    /**
     * Sets the cbtesAsoc value for this FEDetRequest.
     *
     * @param cbtesAsoc
     */
    public void setCbtesAsoc(CbteAsoc[] cbtesAsoc) {
        this.cbtesAsoc = cbtesAsoc;
    }


    /**
     * Gets the tributos value for this FEDetRequest.
     *
     * @return tributos
     */
    public Tributo[] getTributos() {
        return tributos;
    }


    /**
     * Sets the tributos value for this FEDetRequest.
     *
     * @param tributos
     */
    public void setTributos(Tributo[] tributos) {
        this.tributos = tributos;
    }


    /**
     * Gets the iva value for this FEDetRequest.
     *
     * @return iva
     */
    public AlicIva[] getIva() {
        return iva;
    }


    /**
     * Sets the iva value for this FEDetRequest.
     *
     * @param iva
     */
    public void setIva(AlicIva[] iva) {
        this.iva = iva;
    }


    /**
     * Gets the opcionales value for this FEDetRequest.
     *
     * @return opcionales
     */
    public Opcional[] getOpcionales() {
        return opcionales;
    }


    /**
     * Sets the opcionales value for this FEDetRequest.
     *
     * @param opcionales
     */
    public void setOpcionales(Opcional[] opcionales) {
        this.opcionales = opcionales;
    }

    private Object __equalsCalc = null;
    public synchronized boolean equals(Object obj) {
        if (!(obj instanceof FEDetRequest)) return false;
        FEDetRequest other = (FEDetRequest) obj;
        if (obj == null) return false;
        if (this == obj) return true;
        if (__equalsCalc != null) {
            return (__equalsCalc == obj);
        }
        __equalsCalc = obj;
        boolean _equals;
        _equals = true &&
            this.concepto == other.getConcepto() &&
            this.docTipo == other.getDocTipo() &&
            this.docNro == other.getDocNro() &&
            this.cbteDesde == other.getCbteDesde() &&
            this.cbteHasta == other.getCbteHasta() &&
            ((this.cbteFch==null && other.getCbteFch()==null) ||
             (this.cbteFch!=null &&
              this.cbteFch.equals(other.getCbteFch()))) &&
            this.impTotal == other.getImpTotal() &&
            this.impTotConc == other.getImpTotConc() &&
            this.impNeto == other.getImpNeto() &&
            this.impOpEx == other.getImpOpEx() &&
            this.impTrib == other.getImpTrib() &&
            this.impIVA == other.getImpIVA() &&
            ((this.fchServDesde==null && other.getFchServDesde()==null) ||
             (this.fchServDesde!=null &&
              this.fchServDesde.equals(other.getFchServDesde()))) &&
            ((this.fchServHasta==null && other.getFchServHasta()==null) ||
             (this.fchServHasta!=null &&
              this.fchServHasta.equals(other.getFchServHasta()))) &&
            ((this.fchVtoPago==null && other.getFchVtoPago()==null) ||
             (this.fchVtoPago!=null &&
              this.fchVtoPago.equals(other.getFchVtoPago()))) &&
            ((this.monId==null && other.getMonId()==null) ||
             (this.monId!=null &&
              this.monId.equals(other.getMonId()))) &&
            this.monCotiz == other.getMonCotiz() &&
            ((this.cbtesAsoc==null && other.getCbtesAsoc()==null) ||
             (this.cbtesAsoc!=null &&
              java.util.Arrays.equals(this.cbtesAsoc, other.getCbtesAsoc()))) &&
            ((this.tributos==null && other.getTributos()==null) ||
             (this.tributos!=null &&
              java.util.Arrays.equals(this.tributos, other.getTributos()))) &&
            ((this.iva==null && other.getIva()==null) ||
             (this.iva!=null &&
              java.util.Arrays.equals(this.iva, other.getIva()))) &&
            ((this.opcionales==null && other.getOpcionales()==null) ||
             (this.opcionales!=null &&
              java.util.Arrays.equals(this.opcionales, other.getOpcionales())));
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
        _hashCode += getConcepto();
        _hashCode += getDocTipo();
        _hashCode += new Long(getDocNro()).hashCode();
        _hashCode += new Long(getCbteDesde()).hashCode();
        _hashCode += new Long(getCbteHasta()).hashCode();
        if (getCbteFch() != null) {
            _hashCode += getCbteFch().hashCode();
        }
        _hashCode += new Double(getImpTotal()).hashCode();
        _hashCode += new Double(getImpTotConc()).hashCode();
        _hashCode += new Double(getImpNeto()).hashCode();
        _hashCode += new Double(getImpOpEx()).hashCode();
        _hashCode += new Double(getImpTrib()).hashCode();
        _hashCode += new Double(getImpIVA()).hashCode();
        if (getFchServDesde() != null) {
            _hashCode += getFchServDesde().hashCode();
        }
        if (getFchServHasta() != null) {
            _hashCode += getFchServHasta().hashCode();
        }
        if (getFchVtoPago() != null) {
            _hashCode += getFchVtoPago().hashCode();
        }
        if (getMonId() != null) {
            _hashCode += getMonId().hashCode();
        }
        _hashCode += new Double(getMonCotiz()).hashCode();
        if (getCbtesAsoc() != null) {
            for (int i=0;
                 i<Array.getLength(getCbtesAsoc());
                 i++) {
                Object obj = Array.get(getCbtesAsoc(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getTributos() != null) {
            for (int i=0;
                 i<Array.getLength(getTributos());
                 i++) {
                Object obj = Array.get(getTributos(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getIva() != null) {
            for (int i=0;
                 i<Array.getLength(getIva());
                 i++) {
                Object obj = Array.get(getIva(), i);
                if (obj != null &&
                    !obj.getClass().isArray()) {
                    _hashCode += obj.hashCode();
                }
            }
        }
        if (getOpcionales() != null) {
            for (int i=0;
                 i<Array.getLength(getOpcionales());
                 i++) {
                Object obj = Array.get(getOpcionales(), i);
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
        new org.apache.axis.description.TypeDesc(FEDetRequest.class, true);

    static {
        typeDesc.setXmlType(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "FEDetRequest"));
        org.apache.axis.description.ElementDesc elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("concepto");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "Concepto"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "int"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
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
        elemField.setFieldName("cbteDesde");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "CbteDesde"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "long"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("cbteHasta");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "CbteHasta"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "long"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("cbteFch");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "CbteFch"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("impTotal");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "ImpTotal"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "double"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("impTotConc");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "ImpTotConc"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "double"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("impNeto");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "ImpNeto"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "double"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("impOpEx");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "ImpOpEx"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "double"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("impTrib");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "ImpTrib"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "double"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("impIVA");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "ImpIVA"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "double"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("fchServDesde");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "FchServDesde"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("fchServHasta");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "FchServHasta"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("fchVtoPago");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "FchVtoPago"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("monId");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "MonId"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "string"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("monCotiz");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "MonCotiz"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://www.w3.org/2001/XMLSchema", "double"));
        elemField.setNillable(false);
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("cbtesAsoc");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "CbtesAsoc"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "CbteAsoc"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "CbteAsoc"));
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("tributos");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "Tributos"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "Tributo"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "Tributo"));
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("iva");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "Iva"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "AlicIva"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "AlicIva"));
        typeDesc.addFieldDesc(elemField);
        elemField = new org.apache.axis.description.ElementDesc();
        elemField.setFieldName("opcionales");
        elemField.setXmlName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "Opcionales"));
        elemField.setXmlType(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "Opcional"));
        elemField.setMinOccurs(0);
        elemField.setNillable(false);
        elemField.setItemQName(new javax.xml.namespace.QName("http://ar.gov.afip.dif.FEV1/", "Opcional"));
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
           String mechType,
           Class _javaType,
           javax.xml.namespace.QName _xmlType) {
        return
          new  org.apache.axis.encoding.ser.BeanSerializer(
            _javaType, _xmlType, typeDesc);
    }

    /**
     * Get Custom Deserializer
     */
    public static org.apache.axis.encoding.Deserializer getDeserializer(
           String mechType,
           Class _javaType,
           javax.xml.namespace.QName _xmlType) {
        return
          new  org.apache.axis.encoding.ser.BeanDeserializer(
            _javaType, _xmlType, typeDesc);
    }

}
