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
package ar.com.ergio.model;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

import org.compiere.model.MBPartner;
import org.compiere.model.MBPartnerLocation;
import org.compiere.model.MLocation;
import org.compiere.model.MOrder;
import org.compiere.model.MOrgInfo;
import org.compiere.model.MPaymentAllocate;
import org.compiere.model.MTax;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.globalqss.model.X_LCO_WithholdingCalc;
import org.globalqss.model.X_LCO_WithholdingRule;
import org.globalqss.model.X_LCO_WithholdingRuleConf;
import org.globalqss.model.X_LCO_WithholdingType;

/**
 * Encapsula la recuperación de los parámetros de configuración
 * de retenciones/percepciones.
 *
 * @author Emiliano Pereyra - http://www.ergio.com.ar
 */
class WithholdingConfig
{
    /** Logger          */
    private static CLogger log = CLogger.getCLogger(WithholdingConfig.class);

    private BigDecimal aliquot = BigDecimal.ZERO;
    private BigDecimal rate = BigDecimal.ZERO;
    private BigDecimal paymentThresholdMin = BigDecimal.ZERO;
    private BigDecimal thresholdMin = BigDecimal.ZERO;
    private BigDecimal thresholdMax = BigDecimal.ZERO;
    private BigDecimal amountRefunded = BigDecimal.ZERO;
    private boolean isCalcFromPayment;
    private boolean isSOTrx;
    private int lco_WithholdingRule_ID;
    private int lco_WithholdingType_ID;
    private int c_Tax_ID;
    private int c_DocType_ID;
    private int c_TaxCategory_ID;
    private boolean isUseBPISIC;
    private boolean usaTipoGananciasBP;
    private boolean isUseOrgTaxPayerType;
    private boolean isUseDocumentType;
    private boolean isUseShipmentRegion;
    private int c_DocTypeInvoice_ID;
    private String baseType;

    private WithholdingConfig(final BigDecimal aliquot, final BigDecimal rate,
            final BigDecimal paymentThresholdMin, final BigDecimal thresholdMin, final BigDecimal thresholdMax, final BigDecimal amountRefunded, final boolean isCalcFromPayment,
            final int lco_WithholdingRule_ID, final int lco_WithholdingType_ID, final int c_Tax_ID, final int c_DocTypeInvoice_ID,
            final int c_DocType_ID, final int c_TaxCategory_ID, final boolean isUseBPISIC, final boolean usaTipoGananciasBP, final boolean isUseOrgTaxPayerType, final boolean isUseDocumentType,  final String baseType)
    {
        this.aliquot = aliquot;
        this.rate = rate;
        this.paymentThresholdMin = paymentThresholdMin;
        this.thresholdMin = thresholdMin;
        this.thresholdMax = thresholdMax;
        this.amountRefunded = amountRefunded;
        this.isCalcFromPayment = isCalcFromPayment;
        this.lco_WithholdingRule_ID = lco_WithholdingRule_ID;
        this.lco_WithholdingType_ID = lco_WithholdingType_ID;
        this.c_Tax_ID = c_Tax_ID;
        this.c_DocTypeInvoice_ID = c_DocTypeInvoice_ID;
        this.c_DocType_ID = c_DocType_ID; 
        this.c_TaxCategory_ID = c_TaxCategory_ID;
        this.isUseBPISIC = isUseBPISIC;
        this.usaTipoGananciasBP = usaTipoGananciasBP;
        this.isUseOrgTaxPayerType = isUseOrgTaxPayerType;
        this.isUseDocumentType = isUseDocumentType;
        this.baseType = baseType;
    }

    /*********************************************************
     *  Obtiene la configuración de retenciones/percepciones
     *  @param MBPartner Socio del Negocio
     *  @param isSOTrx 
     *  @return Configuraciones de retención
     */
    public static WithholdingConfig[] getConfig(final MBPartner bp, boolean isSOTrx, String trxName, MOrder order, Timestamp dateTrx, MPaymentAllocate[] facturas)
    {
        log.info("");
        final List<WithholdingConfig> list = new ArrayList<WithholdingConfig>();
        try
        {
            // Fill variables normally needed
            // BP variables
            Integer bp_isic_int = (Integer) bp.get_Value("LCO_ISIC_ID");
            int bp_isic_id = 0;
            if (bp_isic_int != null)
                bp_isic_id = bp_isic_int.intValue();
            Integer bp_taxpayertype_int = (Integer) bp.get_Value("LCO_TaxPayerType_ID");
            int bp_taxpayertype_id = 0;
            if (bp_taxpayertype_int != null)
                bp_taxpayertype_id = bp_taxpayertype_int.intValue();
            String lar_tipoganancias = bp.get_ValueAsString("LAR_TipoGanancias");
            int c_doctypeinvoice_id = 0;
            if (facturas != null && facturas.length > 0)
            {
                c_doctypeinvoice_id = facturas[0].getC_Invoice().getC_DocType_ID();
            }

            /*
             * No se utiliza la dirección del BP en los tipos de retenciones/percepciones que
             * aplicamos. TODO: Revisar la forma de recuperar la dirección sin estar en un
             * operación que obligue a seleccionarla.
             */
            MBPartnerLocation mbpl = new MBPartnerLocation(Env.getCtx(),
                    bp.getLocations(true)[0].get_ID(), trxName);
            MLocation bpl = MLocation.get(Env.getCtx(), mbpl.getC_Location_ID(), trxName);
            int bp_city_id = bpl.getC_City_ID();

            // OrgInfo variables
            MOrgInfo oi = MOrgInfo.get(Env.getCtx(), Env.getAD_Org_ID(Env.getCtx()), trxName);
            Integer org_isic_int = (Integer) oi.get_Value("LCO_ISIC_ID");
            int org_isic_id = 0;
            if (org_isic_int != null)
                org_isic_id = org_isic_int.intValue();
            Integer org_taxpayertype_int = (Integer) oi.get_Value("LCO_TaxPayerType_ID");
            int org_taxpayertype_id = 0;
            if (org_taxpayertype_int != null)
                org_taxpayertype_id = org_taxpayertype_int.intValue();
            MLocation ol = MLocation.get(Env.getCtx(), oi.getC_Location_ID(), trxName);
            int org_city_id = ol.getC_City_ID();

            // Search withholding types applicable depending on IsSOTrx
            String sqlt = "SELECT LCO_WithholdingType_ID " + " FROM LCO_WithholdingType "
                    + " WHERE IsSOTrx = ? AND IsActive = 'Y'";
            PreparedStatement pstmtt = DB.prepareStatement(sqlt, trxName);
            pstmtt.setString(1, isSOTrx ? "Y" : "N");
            ResultSet rst = pstmtt.executeQuery();
            while (rst.next())
            {
                // Por cada una de las retenciones aplicables
                X_LCO_WithholdingType wt = new X_LCO_WithholdingType(Env.getCtx(), rst.getInt(1),
                        trxName);
                X_LCO_WithholdingRuleConf wrc = null;
                log.info("Withholding Type: " + wt.getLCO_WithholdingType_ID() + "/" + wt.getName());
                // look the conf fields
                String sqlrc = "SELECT * " + " FROM LCO_WithholdingRuleConf "
                        + " WHERE LCO_WithholdingType_ID = ? AND IsActive = 'Y'";
                PreparedStatement pstmtrc = DB.prepareStatement(sqlrc, trxName);
                pstmtrc.setInt(1, wt.getLCO_WithholdingType_ID());
                ResultSet rsrc = pstmtrc.executeQuery();
                if (rsrc.next())
                {
                    wrc = new X_LCO_WithholdingRuleConf(Env.getCtx(), rsrc, trxName);
                } else
                {
                    log.warning("No LCO_WithholdingRuleConf for LCO_WithholdingType = "
                            + wt.getLCO_WithholdingType_ID());
                    rsrc.close();
                    pstmtrc.close();
                    continue;
                }
                rsrc.close();
                pstmtrc.close();

                // look for applicable rules according to config fields (rule)
                StringBuffer sqlr = new StringBuffer("SELECT LCO_WithholdingRule_ID "
                        + "  FROM LCO_WithholdingRule " + " WHERE LCO_WithholdingType_ID = ? "
                        + "   AND IsActive = 'Y' " + "   AND ValidFrom <= ? ");
                if (wrc.isUseBPISIC())
                    sqlr.append(" AND LCO_BP_ISIC_ID = ? ");
                if (wrc.isUseBPTaxPayerType())
                    sqlr.append(" AND LCO_BP_TaxPayerType_ID = ? ");
                if (wrc.isUseOrgISIC())
                    sqlr.append(" AND LCO_Org_ISIC_ID = ? ");
                if (wrc.isUseOrgTaxPayerType())
                    sqlr.append(" AND LCO_Org_TaxPayerType_ID = ? ");
                if (wrc.isUseBPCity())
                    sqlr.append(" AND LCO_BP_City_ID = ? ");
                if (wrc.isUseOrgCity())
                    sqlr.append(" AND LCO_Org_City_ID = ? ");
                if (wrc.get_ValueAsBoolean("LAR_UsaTipoGananciasBP"))
                    sqlr.append(" AND LAR_TipoGananciasBP = ? ");
                if (wrc.isUseDocumentType())
                    sqlr.append(" AND C_DocTypeInvoice_ID = ? ");

                if (isSOTrx)
                {
                    if (order != null)
                    {
                        // Add withholding categories of lines
                        if (wrc.isUseWithholdingCategory())
                        {
                            // look the conf fields
                            String sqlwcs = "SELECT DISTINCT COALESCE (p.LCO_WithholdingCategory_ID, COALESCE (c.LCO_WithholdingCategory_ID, 0)) "
                                    + "  FROM C_OrderLine il "
                                    + "  LEFT OUTER JOIN M_Product p ON (il.M_Product_ID = p.M_Product_ID) "
                                    + "  LEFT OUTER JOIN C_Charge c ON (il.C_Charge_ID = c.C_Charge_ID) "
                                    + "  WHERE C_OrderLine_ID = ? AND il.IsActive='Y'";
                            PreparedStatement pstmtwcs = DB.prepareStatement(sqlwcs, trxName);
                            pstmtwcs.setInt(1, order.getC_Order_ID());
                            ResultSet rswcs = pstmtwcs.executeQuery();
                            int i = 0;
                            int wcid = 0;
                            boolean addedlines = false;
                            while (rswcs.next())
                            {
                                wcid = rswcs.getInt(1);
                                if (wcid > 0)
                                {
                                    if (i == 0)
                                    {
                                        sqlr.append(" AND LCO_WithholdingCategory_ID IN (");
                                        addedlines = true;
                                    } else
                                    {
                                        sqlr.append(",");
                                    }
                                    sqlr.append(wcid);
                                    i++;
                                }
                            }
                            if (addedlines)
                                sqlr.append(") ");
                            rswcs.close();
                            pstmtwcs.close();
                        }
                    }
                    // Add tax categories of lines
                    if (wrc.isUseProductTaxCategory())
                    {
                        // look the conf fields
                        String sqlwct = "SELECT DISTINCT COALESCE (p.C_TaxCategory_ID, COALESCE (c.C_TaxCategory_ID, 0)) "
                                + "  FROM C_InvoiceLine il "
                                + "  LEFT OUTER JOIN M_Product p ON (il.M_Product_ID = p.M_Product_ID) "
                                + "  LEFT OUTER JOIN C_Charge c ON (il.C_Charge_ID = c.C_Charge_ID) "
                                + "  WHERE C_Invoice_ID = ? AND il.IsActive='Y'";
                        PreparedStatement pstmtwct = DB.prepareStatement(sqlwct, trxName);
                        pstmtwct.setInt(1, order.getC_Order_ID());
                        ResultSet rswct = pstmtwct.executeQuery();
                        int i = 0;
                        int wcid = 0;
                        boolean addedlines = false;
                        while (rswct.next())
                        {
                            wcid = rswct.getInt(1);
                            if (wcid > 0)
                            {
                                if (i == 0)
                                {
                                    sqlr.append(" AND C_TaxCategory_ID IN (");
                                    addedlines = true;
                                } else
                                {
                                    sqlr.append(",");
                                }
                                sqlr.append(wcid);
                                i++;
                            }
                        }
                        if (addedlines)
                            sqlr.append(") ");
                        rswct.close();
                        pstmtwct.close();
                    }
                }

                PreparedStatement pstmtr = DB.prepareStatement(sqlr.toString(), trxName);
                int idxpar = 1;
                pstmtr.setInt(idxpar, wt.getLCO_WithholdingType_ID());
                idxpar++;
                pstmtr.setTimestamp(idxpar, dateTrx);
                if (wrc.isUseBPISIC())
                {
                    idxpar++;
                    pstmtr.setInt(idxpar, bp_isic_id);
                }
                if (wrc.isUseBPTaxPayerType())
                {
                    idxpar++;
                    pstmtr.setInt(idxpar, bp_taxpayertype_id);
                }
                if (wrc.isUseOrgISIC())
                {
                    idxpar++;
                    pstmtr.setInt(idxpar, org_isic_id);
                }
                if (wrc.isUseOrgTaxPayerType())
                {
                    idxpar++;
                    pstmtr.setInt(idxpar, org_taxpayertype_id);
                }
                if (wrc.isUseBPCity())
                {
                    idxpar++;
                    pstmtr.setInt(idxpar, bp_city_id);
                    if (bp_city_id <= 0)
                        log.warning("Possible configuration error bp city is used but not set");
                }
                if (wrc.isUseOrgCity())
                {
                    idxpar++;
                    pstmtr.setInt(idxpar, org_city_id);
                    if (org_city_id <= 0)
                        log.warning("Possible configuration error org city is used but not set");
                }
                if (wrc.get_ValueAsBoolean("LAR_UsaTipoGananciasBP"))
                {
                    idxpar++;
                    if (lar_tipoganancias.equals(""))
                    {
                        log.warning("No existe configuraci\u00f3n de Ganancias para el SdN");
                        return null;
                    }
                    pstmtr.setString(idxpar, lar_tipoganancias);
                }
                if (wrc.isUseDocumentType())
                {
                    idxpar++;
                    if (c_doctypeinvoice_id <= 0)
                    {
                        log.warning("No existe documento ingresado para la retenci\\u00f3n");
                    }
                    pstmtr.setInt(idxpar, c_doctypeinvoice_id);
                }

                ResultSet rsr = pstmtr.executeQuery();
                while (rsr.next())
                {
                    // for each applicable rule
                    X_LCO_WithholdingRule wr = new X_LCO_WithholdingRule(Env.getCtx(),
                            rsr.getInt(1), trxName);

                    // bring record for withholding calculation
                    X_LCO_WithholdingCalc wc = new X_LCO_WithholdingCalc(Env.getCtx(),
                            wr.getLCO_WithholdingCalc_ID(), trxName);
                    if (wc.getLCO_WithholdingCalc_ID() == 0)
                    {
                        log.severe("Regla sin c\u00e1lculo configurado: " + wr.getName());
                        continue;
                    }

                    // bring record for tax
                    MTax tax = new MTax(Env.getCtx(), wc.getC_Tax_ID(), trxName);

                    log.info("WithholdingRule: " + wr.getLCO_WithholdingRule_ID() + "/"
                            + wr.getName() + " BaseType:" + wc.getBaseType() + " Calc: "
                            + wc.getLCO_WithholdingCalc_ID() + "/" + wc.getName()
                            + " CalcOnInvoice:" + wc.isCalcOnInvoice() + " Tax: "
                            + tax.getC_Tax_ID() + "/" + tax.getName());

                    BigDecimal alicuota = BigDecimal.ZERO;
                    BigDecimal tasa = BigDecimal.ZERO;
                    alicuota = tax.getRate().setScale(4, BigDecimal.ROUND_HALF_EVEN);
                    tasa = alicuota.multiply(BigDecimal.valueOf(100));
                    WithholdingConfig config = new WithholdingConfig(alicuota, tasa,
                            (BigDecimal) wrc.get_Value("PaymentThresholdMin"),
                            wc.getThresholdmin(), wc.getThresholdMax(), wc.getAmountRefunded(),
                            wc.isCalcOnPayment(), wr.getLCO_WithholdingRule_ID(),
                            wr.getLCO_WithholdingType_ID(), wc.getC_Tax_ID(),
                            wr.get_ValueAsInt("C_DocTypeInvoice_ID"),
                            wrc.get_ValueAsInt("C_DocType_ID"), wr.getC_TaxCategory_ID(),
                            wrc.isUseBPISIC(), wrc.get_ValueAsBoolean("LAR_UsaTipoGananciasBP"),
                            wrc.get_ValueAsBoolean("IsUseOrgTaxPayerType"),
                            wrc.get_ValueAsBoolean("isUseDocumentType"), wc.getBaseType());

                    if (!list.add(config))
                    {
                        log.severe("Error al agregar configuración a la lista");
                        continue;
                    }
                    ;
                }// while each applicable rule
            }// while each applicable withholding
        } catch (SQLException e)
        {
            log.log(Level.SEVERE, "", e);
            return null;
        }
        return list.toArray(new WithholdingConfig[list.size()]);

    }

    public int getWithholdingRule_ID()
    {
        return lco_WithholdingRule_ID;
    }

    public int getWithholdingType_ID()
    {
        return lco_WithholdingType_ID;
    }

    public int getC_Tax_ID()
    {
        return c_Tax_ID;
    }

    public void setC_Tax_ID(final int c_tax_ID)
    {
        c_Tax_ID = c_tax_ID;
    }

    public BigDecimal getAliquot()
    {
        return isSOTrx ? aliquot.negate() : aliquot;
    }

    public void setAliquot(final BigDecimal aliq)
    {
        aliquot = aliq;
    }

    public BigDecimal getRate()
    {
		return rate;
    }

    public BigDecimal getPaymentThresholdMin()
    {
        return paymentThresholdMin;
    }

    public BigDecimal getThresholdMin()
    {
        return thresholdMin;
    }

    public BigDecimal getThresholdMax()
    {
        return thresholdMax;
    }

    public BigDecimal getamountRefunded()
    {
        return amountRefunded;
    }

    public boolean isCalcFromPayment()
    {
        return isCalcFromPayment;
    }

    public int getC_DocType_ID()
    {
        return c_DocType_ID;
    }
    public int getc_DocTypeInvoice_ID()
    {
        return c_DocTypeInvoice_ID;
    }
    public int getC_TaxCategory_ID()
    {
        return c_TaxCategory_ID;
    }

    public boolean isUseBPISIC()
    {
        return isUseBPISIC;
    }

    public boolean usaTipoGananciasBP()
    {
        return usaTipoGananciasBP;
    }

    public boolean isUseOrgTaxPayerType()
    {
        return isUseOrgTaxPayerType;
    }

    public boolean isUseDocumentType()
    {
        return isUseDocumentType;
    }

    public boolean isUseShipmentRegion()
    {
        return isUseShipmentRegion;
    }

    public String getBaseType()
    {
        return baseType;
    }

    @Override
    public String toString()
    {
        StringBuilder sb = new StringBuilder("WithholdingConfig[");
        sb.append("Aliquot=").append(aliquot);
        sb.append(",IsSOTrx=").append(isSOTrx);
        sb.append(",IsCalcFromPayment=").append(isCalcFromPayment);
        sb.append(",C_DocType_ID=").append(c_DocType_ID);
        sb.append(",C_TaxCategory_ID=").append(c_TaxCategory_ID);
        sb.append(",C_Tax_ID=").append(c_Tax_ID);
        sb.append(",C_DocTypeInvoice_ID=").append(c_DocTypeInvoice_ID);
        sb.append("]");
        return sb.toString();
    } // toString

} // WithholndigConfig
