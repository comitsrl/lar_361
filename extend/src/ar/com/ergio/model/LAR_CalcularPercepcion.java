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
import java.util.Date;
import java.util.logging.Level;

import org.compiere.model.MBPartner;
import org.compiere.model.MBPartnerLocation;
import org.compiere.model.MInOut;
import org.compiere.model.MLocation;
import org.compiere.model.MOrder;
import org.compiere.model.MOrderLine;
import org.compiere.model.MOrderTax;
import org.compiere.model.MOrgInfo;
import org.compiere.model.MPOS;
import org.compiere.model.MPriceList;
import org.compiere.model.MTax;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.globalqss.model.MLCOInvoiceWithholding;
import org.globalqss.model.X_LCO_WithholdingCalc;
import org.globalqss.model.X_LCO_WithholdingRule;
import org.globalqss.model.X_LCO_WithholdingRuleConf;
import org.globalqss.model.X_LCO_WithholdingType;

import com.jhlabs.image.FieldWarpFilter.Line;

/**
 * Calcular percepciones.
 * @author fchiappano
 */
public class LAR_CalcularPercepcion
{
    /** Logger */
    private static CLogger log = CLogger.getCLogger(LAR_CalcularPercepcion.class);


    /**
     * Constructor para evitar instanciación
     */
    private LAR_CalcularPercepcion() {}


    /** Model Change Type New */
    private static final int TYPE_AFTER_NEW = 4;
    /** Model Change Type Change */
    private static final int TYPE_AFTER_CHANGE = 5;
    /** Model Change Type Delete */
    private static final int TYPE_AFTER_DELETE = 6;

    /**
     * Calcular percion de la OV.
     * @param bp
     * @param line
     * @param type
     * @return
     */
    public static String calculateWhithholdingLine(final MBPartner bp, final MOrderLine line, int type)
    {
        if (type == TYPE_AFTER_NEW || type == TYPE_AFTER_DELETE
                || (type == TYPE_AFTER_CHANGE && (line.is_ValueChanged("LineNetAmt")
                        || line.is_ValueChanged("M_Product_ID") || line.is_ValueChanged("IsActive")
                        || line.is_ValueChanged("C_Tax_ID") || line.is_ValueChanged("C_BPartner_ID"))))
        {
            // Check if withholding on sales is needed
            final MPOS pos = MPOS.get(Env.getCtx(), Env.getContextAsInt(Env.getCtx(), Env.POS_ID));
            if (!pos.get_ValueAsBoolean("IsGenerateWithholdingOnSale"))
            {
                return null;
            }
            final MOrder order = line.getParent();
            // Check if is a sales transaction
            if (!order.isSOTrx())
                return null;

            // final WithholdingConfig[] configs =
            // WithholdingConfig.getConfig(bp, true, order.get_TrxName(), order,
            // order.getDateOrdered(), null);

            try
            {
                // Borrar las percepciones generadas
                deleteWhithholdingLine(order);
                // Fill variables normally needed
                // BP variables
                // MBPartner bp = new MBPartner(getCtx(), getC_BPartner_ID(),
                // get_TrxName());
                Integer bp_isic_int = (Integer) bp.get_Value("LCO_ISIC_ID");
                int bp_isic_id = 0;
                if (bp_isic_int != null)
                    bp_isic_id = bp_isic_int.intValue();
                Integer bp_taxpayertype_int = (Integer) bp.get_Value("LCO_TaxPayerType_ID");
                int bp_taxpayertype_id = 0;
                if (bp_taxpayertype_int != null)
                    bp_taxpayertype_id = bp_taxpayertype_int.intValue();
                // MBPartnerLocation mbpl = new MBPartnerLocation(line.getCtx(),
                // getC_BPartner_Location_ID(), line.get_TrxName());
                // MBPartnerLocation mbpl = bp.getPrimaryC_BPartner_Location();
                // MBPartnerLocation mbpl = line.getC_BPartner_Location_ID()
                MBPartnerLocation mbpl = new MBPartnerLocation(line.getCtx(), line.getC_BPartner_Location_ID(),
                        line.get_TrxName());
                MLocation bpl = MLocation.get(line.getCtx(), mbpl.getC_Location_ID(), line.get_TrxName());
                int bp_city_id = bpl.getC_City_ID();
                // OrgInfo variables
                MOrgInfo oi = MOrgInfo.get(line.getCtx(), line.getAD_Org_ID(), line.get_TrxName());
                Integer org_isic_int = (Integer) oi.get_Value("LCO_ISIC_ID");
                int org_isic_id = 0;
                if (org_isic_int != null)
                    org_isic_id = org_isic_int.intValue();
                Integer org_taxpayertype_int = (Integer) oi.get_Value("LCO_TaxPayerType_ID");
                int org_taxpayertype_id = 0;
                if (org_taxpayertype_int != null)
                    org_taxpayertype_id = org_taxpayertype_int.intValue();
                MLocation ol = MLocation.get(line.getCtx(), oi.getC_Location_ID(), line.get_TrxName());
                int org_city_id = ol.getC_City_ID();
                // Se recupera la provincia desde la dirección
                int provincia_id = bpl.getC_Region_ID();
                if (provincia_id == 0)
                {
                    return "Error al recuperar la provincia desde el Socio del Negocio";
                }
                // Search withholding types applicable depending on IsSOTrx
                String sqlt = "SELECT LCO_WithholdingType_ID " + " FROM LCO_WithholdingType "
                        + " WHERE IsSOTrx = ? AND IsActive = 'Y'";
                PreparedStatement pstmtt = DB.prepareStatement(sqlt, line.get_TrxName());
                pstmtt.setString(1, "Y");
                ResultSet rst = pstmtt.executeQuery();
                while (rst.next())
                {
                    // For each applicable withholding
                    X_LCO_WithholdingType wt = new X_LCO_WithholdingType(line.getCtx(), rst.getInt(1),
                            line.get_TrxName());
                    X_LCO_WithholdingRuleConf wrc = null;
                    log.info("Withholding Type: " + wt.getLCO_WithholdingType_ID() + "/" + wt.getName());

                    // look the conf fields
                    String sqlrc = "SELECT * " + " FROM LCO_WithholdingRuleConf "
                            + " WHERE LCO_WithholdingType_ID = ? AND IsActive = 'Y'";
                    PreparedStatement pstmtrc = DB.prepareStatement(sqlrc, line.get_TrxName());
                    pstmtrc.setInt(1, wt.getLCO_WithholdingType_ID());
                    ResultSet rsrc = pstmtrc.executeQuery();
                    if (rsrc.next())
                    {
                        wrc = new X_LCO_WithholdingRuleConf(line.getCtx(), rsrc, line.get_TrxName());
                    }
                    else
                    {
                        log.warning("No LCO_WithholdingRuleConf for LCO_WithholdingType = "
                                + wt.getLCO_WithholdingType_ID());
                        rsrc.close();
                        pstmtrc.close();
                        continue;
                    }
                    rsrc.close();
                    pstmtrc.close();

                    // look for applicable rules according to config fields
                    // (rule)
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
                    if (wrc.isUseShipmentRegion())
                        sqlr.append(" AND C_Region_ID = ? ");

                    // Add withholding categories of lines
                    if (wrc.isUseWithholdingCategory())
                    {
                        // look the conf fields
                        String sqlwcs = "SELECT DISTINCT COALESCE (p.LCO_WithholdingCategory_ID, COALESCE (c.LCO_WithholdingCategory_ID, 0)) "
                                + "  FROM C_OrderLine ol "
                                + "  LEFT OUTER JOIN M_Product p ON (ol.M_Product_ID = p.M_Product_ID) "
                                + "  LEFT OUTER JOIN C_Charge c ON (ol.C_Charge_ID = c.C_Charge_ID) "
                                + "  WHERE C_OrderLine_ID = ? AND ol.IsActive='Y'";
                        PreparedStatement pstmtwcs = DB.prepareStatement(sqlwcs, line.get_TrxName());
                        pstmtwcs.setInt(1, line.getC_OrderLine_ID());
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
                                }
                                else
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

                    // Add tax categories of lines
                    if (wrc.isUseProductTaxCategory())
                    {
                        // look the conf fields
                        String sqlwct = "SELECT DISTINCT COALESCE (p.C_TaxCategory_ID, COALESCE (c.C_TaxCategory_ID, 0)) "
                                + "  FROM C_InvoiceOrder ol "
                                + "  LEFT OUTER JOIN M_Product p ON (ol.M_Product_ID = p.M_Product_ID) "
                                + "  LEFT OUTER JOIN C_Charge c ON (ol.C_Charge_ID = c.C_Charge_ID) "
                                + "  WHERE C_Order_ID = ? AND il.IsActive='Y'";
                        PreparedStatement pstmtwct = DB.prepareStatement(sqlwct, line.get_TrxName());
                        pstmtwct.setInt(1, line.getC_Order_ID());
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
                                }
                                else
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

                    PreparedStatement pstmtr = DB.prepareStatement(sqlr.toString(), line.get_TrxName());
                    int idxpar = 1;
                    pstmtr.setInt(idxpar, wt.getLCO_WithholdingType_ID());
                    idxpar++;
                    pstmtr.setTimestamp(idxpar, line.getDateOrdered());
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
                            log.warning(
                                    "Posible error de configuración se utiliza Ciudad del SdN pero no está configurada");
                    }
                    if (wrc.isUseOrgCity())
                    {
                        idxpar++;
                        pstmtr.setInt(idxpar, org_city_id);
                        if (org_city_id <= 0)
                            log.warning(
                                    "Posible error de configuración se utiliza Ciudad de la Org pero no está configurada");
                    }
                    if (wrc.isUseShipmentRegion())
                    {
                        idxpar++;
                        pstmtr.setInt(idxpar, provincia_id);
                        if (provincia_id <= 0)
                            log.warning("Posible error de configuración se utiliza Provincia pero no está configurada");
                    }

                    ResultSet rsr = pstmtr.executeQuery();
                    while (rsr.next())
                    {
                        // for each applicable rule
                        X_LCO_WithholdingRule wr = new X_LCO_WithholdingRule(line.getCtx(), rsr.getInt(1),
                                line.get_TrxName());

                        // bring record for withholding calculation
                        X_LCO_WithholdingCalc wc = new X_LCO_WithholdingCalc(line.getCtx(),
                                wr.getLCO_WithholdingCalc_ID(), line.get_TrxName());
                        if (wc.getLCO_WithholdingCalc_ID() == 0)
                        {
                            log.severe("Rule without calc " + rsr.getInt(1));
                            continue;
                        }

                        // bring record for tax
                        MTax tax = new MTax(line.getCtx(), wc.getC_Tax_ID(), line.get_TrxName());

                        log.info("WithholdingRule: " + wr.getLCO_WithholdingRule_ID() + "/" + wr.getName()
                                + " BaseType:" + wc.getBaseType() + " Calc: " + wc.getLCO_WithholdingCalc_ID() + "/"
                                + wc.getName() + " CalcOnInvoice:" + wc.isCalcOnInvoice() + " Tax: " + tax.getC_Tax_ID()
                                + "/" + tax.getName());

                        // calc base
                        // apply rule to calc base

                        // Calcula las bases de cálculo
                        BigDecimal taxAmt = BigDecimal.ZERO;
                        BigDecimal gravado = BigDecimal.ZERO;
                        BigDecimal base = BigDecimal.ZERO;
                        BigDecimal importePerc = BigDecimal.ZERO;
                        for (MOrderTax orderTax : order.getTaxes(true))
                        {
                            taxAmt = taxAmt.add(orderTax.getTaxAmt());
                        }
                        // Acumula la base imponible para calcular la Percepción de IIBB
                        for (MOrderLine oline : order.getLines())
                            gravado = gravado.add(oline.getLineNetAmt());

                        if (wc.getBaseType() == null)
                            log.severe("Tipo de Base de Cálculo no configurada en registro de cálculo "
                                    + wr.getLCO_WithholdingCalc_ID());
                        else if (wc.getBaseType().equals(X_LCO_WithholdingCalc.BASETYPE_Document))
                            base = gravado;
                        // Utilizar como base de calculo, el total de la Orden
                        else if (wc.getBaseType().equals("G"))
                            base = order.getGrandTotal();
                        else if (wc.getBaseType().equals(X_LCO_WithholdingCalc.BASETYPE_Line))
                        {
                            String sqllca;
                            if (wrc.isUseWithholdingCategory() && wrc.isUseProductTaxCategory())
                            {
                                // base = lines of the withholding category and
                                // tax category
                                sqllca = "SELECT SUM (LineNetAmt) " + "  FROM C_OrderLine ol "
                                        + " WHERE IsActive='Y' AND C_Order_ID = ? " + "   AND (   EXISTS ( "
                                        + "              SELECT 1 " + "                FROM M_Product p "
                                        + "               WHERE ol.M_Product_ID = p.M_Product_ID "
                                        + "                 AND p.C_TaxCategory_ID = ? "
                                        + "                 AND p.LCO_WithholdingCategory_ID = ?) "
                                        + "        OR EXISTS ( " + "              SELECT 1 "
                                        + "                FROM C_Charge c "
                                        + "               WHERE ol.C_Charge_ID = c.C_Charge_ID "
                                        + "                 AND c.C_TaxCategory_ID = ? "
                                        + "                 AND c.LCO_WithholdingCategory_ID = ?) " + "       ) ";
                            }
                            else if (wrc.isUseWithholdingCategory())
                            {
                                // base = lines of the withholding category
                                sqllca = "SELECT SUM (LineNetAmt) " + "  FROM C_OrderLine ol "
                                        + " WHERE IsActive='Y' AND C_Order_ID = ? " + "   AND (   EXISTS ( "
                                        + "              SELECT 1 " + "                FROM M_Product p "
                                        + "               WHERE ol.M_Product_ID = p.M_Product_ID "
                                        + "                 AND p.LCO_WithholdingCategory_ID = ?) "
                                        + "        OR EXISTS ( " + "              SELECT 1 "
                                        + "                FROM C_Charge c "
                                        + "               WHERE ol.C_Charge_ID = c.C_Charge_ID "
                                        + "                 AND c.LCO_WithholdingCategory_ID = ?) " + "       ) ";
                            }
                            else if (wrc.isUseProductTaxCategory())
                            {
                                // base = lines of the product tax category
                                sqllca = "SELECT SUM (LineNetAmt) " + "  FROM C_OrderLine ol "
                                        + " WHERE IsActive='Y' AND C_Order_ID = ? " + "   AND (   EXISTS ( "
                                        + "              SELECT 1 " + "                FROM M_Product p "
                                        + "               WHERE ol.M_Product_ID = p.M_Product_ID "
                                        + "                 AND p.C_TaxCategory_ID = ?) " + "        OR EXISTS ( "
                                        + "              SELECT 1 " + "                FROM C_Charge c "
                                        + "               WHERE ol.C_Charge_ID = c.C_Charge_ID "
                                        + "                 AND c.C_TaxCategory_ID = ?) " + "       ) ";
                            }
                            else
                            {
                                // base = all lines
                                sqllca = "SELECT SUM (LineNetAmt) " + "  FROM C_OrderLine il "
                                        + " WHERE IsActive='Y' AND C_Order_ID = ? ";
                            }

                            PreparedStatement pstmtlca = DB.prepareStatement(sqllca, line.get_TrxName());
                            pstmtlca.setInt(1, line.getC_Order_ID());
                            if (wrc.isUseWithholdingCategory() && wrc.isUseProductTaxCategory())
                            {
                                pstmtlca.setInt(2, wr.getC_TaxCategory_ID());
                                pstmtlca.setInt(3, wr.getLCO_WithholdingCategory_ID());
                                pstmtlca.setInt(4, wr.getC_TaxCategory_ID());
                                pstmtlca.setInt(5, wr.getLCO_WithholdingCategory_ID());
                            }
                            else if (wrc.isUseWithholdingCategory())
                            {
                                pstmtlca.setInt(2, wr.getLCO_WithholdingCategory_ID());
                                pstmtlca.setInt(3, wr.getLCO_WithholdingCategory_ID());
                            }
                            else if (wrc.isUseProductTaxCategory())
                            {
                                pstmtlca.setInt(2, wr.getC_TaxCategory_ID());
                                pstmtlca.setInt(3, wr.getC_TaxCategory_ID());
                            }
                            else
                            {
                                ; // nothing
                            }
                            ResultSet rslca = pstmtlca.executeQuery();
                            if (rslca.next())
                                base = rslca.getBigDecimal(1);
                            rslca.close();
                            pstmtlca.close();
                        }
                        else if (wc.getBaseType().equals(X_LCO_WithholdingCalc.BASETYPE_Tax))
                        {
                            // if specific tax
                            if (wc.getC_BaseTax_ID() != 0)
                            {
                                // base = value of specific tax
                                String sqlbst = "SELECT SUM(TaxAmt) " + " FROM C_OrderTax "
                                        + " WHERE IsActive='Y' AND C_Invoice_ID = ? " + "   AND C_Tax_ID = ?";
                                PreparedStatement pstmtbst = DB.prepareStatement(sqlbst, line.get_TrxName());
                                pstmtbst.setInt(1, line.getC_Order_ID());
                                pstmtbst.setInt(2, wc.getC_BaseTax_ID());
                                ResultSet rsbst = pstmtbst.executeQuery();
                                if (rsbst.next())
                                    base = rsbst.getBigDecimal(1);
                                rsbst.close();
                                pstmtbst.close();
                            }
                            else
                            {
                                // not specific tax
                                // base = value of all taxes
                                String sqlbsat = "SELECT SUM(TaxAmt) " + " FROM C_OrderTax "
                                        + " WHERE IsActive='Y' AND C_Order_ID = ? ";
                                PreparedStatement pstmtbsat = DB.prepareStatement(sqlbsat, line.get_TrxName());
                                pstmtbsat.setInt(1, line.getC_Order_ID());
                                ResultSet rsbsat = pstmtbsat.executeQuery();
                                if (rsbsat.next())
                                    base = rsbsat.getBigDecimal(1);
                                rsbsat.close();
                                pstmtbsat.close();
                            }
                        }
                        log.info("Base: " + base + " Thresholdmin:" + wc.getThresholdmin());

                        // @fchiappano Verificar si el SdN es Exento en percepción
                        // de IIBB y recalcular la base de calculo.
                        boolean vigenciaExencionIIBB = false;
                        BigDecimal baseExension = base;
                        BigDecimal porcExencion = (BigDecimal) bp.get_Value("LAR_Exencion_IIBB_Venta");

                        if (bp.get_ValueAsBoolean("LAR_Exento_Perc_IIBB"))
                        {
                            Date fechaVenc = (Date) bp.get_Value("LAR_Venc_Cert_IIBB_Venta");
                            Date fechaInicio = (Date) bp.get_Value("LAR_Inicio_Cert_IIBB_Venta");

                            if (fechaVenc == null || (!fechaInicio.after(line.getDateOrdered())
                                    && !fechaVenc.before(line.getDateOrdered())))
                                vigenciaExencionIIBB = true;

                            // @fchiappano Aplicar el porcentaje de Exención a
                            // la base imponible, para determinar si esta por debajo del minimo.
                            baseExension = baseExension.subtract(baseExension.multiply(porcExencion)
                                    .divide(Env.ONEHUNDRED).setScale(2, BigDecimal.ROUND_HALF_EVEN));
                        }

                        // if thresholdmax = 0 it is ignored
                        if (base != null && base.compareTo(Env.ZERO) != 0 &&
                        // @fchiappano Utilizar la base con porcentaje de exención aplicado
                        // para validar que sea superior al minimo
                                baseExension.compareTo(wc.getThresholdmin()) >= 0
                                && (wc.getThresholdMax() == null || wc.getThresholdMax().compareTo(Env.ZERO) == 0
                                        || base.compareTo(wc.getThresholdMax()) <= 0)
                                && tax.getRate() != null && tax.getRate().compareTo(Env.ZERO) != 0)
                        {
                            // Crea la percepción de la orden
                            // Si existe recupera la línea anterior y acumula el
                            // importe de la percepción.
                            MLAROrderPerception percepcion = MLAROrderPerception.get(order, order.get_TrxName());
                            percepcion.setC_Order_ID(order.get_ID());
                            percepcion.setC_Tax_ID(wc.getC_Tax_ID());
                            percepcion.setLCO_WithholdingRule_ID(wr.getLCO_WithholdingRule_ID());
                            percepcion.setLCO_WithholdingType_ID(wc.getLCO_WithholdingType_ID());

                            int stdPrecision = MPriceList.getStandardPrecision(order.getCtx(),
                                    order.getM_PriceList_ID());
                            importePerc = tax.calculateTax(base, false, stdPrecision).negate();
                            if (wc.getAmountRefunded() != null && wc.getAmountRefunded().compareTo(Env.ZERO) > 0)
                            {
                                importePerc = importePerc.subtract(wc.getAmountRefunded());
                            }

                            // @fchiappano Aplicar Exención de IIBB
                            if (vigenciaExencionIIBB && (importePerc.compareTo(Env.ZERO) > 0))
                            {
                                BigDecimal impExencion = (BigDecimal) bp.get_Value("LAR_Imp_Exencion_IIBB_Venta");

                                BigDecimal impExentoDesc = importePerc.multiply(porcExencion).divide(Env.ONEHUNDRED)
                                        .setScale(2, BigDecimal.ROUND_HALF_EVEN);
                                importePerc = importePerc.subtract(impExentoDesc).subtract(impExencion);

                                // @fchiappano Si el importe de la percepcion,
                                // es mayor a cero, quiere decir que no debe
                                // percibirse luego de aplicada la exención.
                                if (importePerc.compareTo(Env.ZERO) > 0)
                                    importePerc = Env.ZERO;
                            }

                            // Se acumula el importe
                            percepcion.setTaxAmt(percepcion.getTaxAmt().add(importePerc));
                            percepcion.setTaxBaseAmt(percepcion.getTaxBaseAmt().add(base));

                            percepcion.setIsTaxIncluded(false);
                            if (!percepcion.save())
                            {
                                return "Error al intentar gravar la percepción";
                            }
                            // Update order amounts
                            if (!order.save())
                            {
                                return "Error al intentar actualizar los importes de la orden";
                            }
                            log.info("LAR_OrderPerception registrada: " + percepcion.getTaxAmt());
                        }
                    } // while each applicable rule
                } // for each applicable withholding

                rst.close();
                pstmtt.close();
            }
            catch (SQLException e)
            {
                log.log(Level.SEVERE, "", e);
                return "Error al calcular la percepción en el PDV";
            }
        } // Model change type
        return null;
    } // calculateWhithholdingLine

    /**
     * Eliminar percepciones de la OV
     * @param order
     * @return
     */
    public static String deleteWhithholdingLine(final MOrder order)
    {
        // Check if is a sales transaction
        if (!order.isSOTrx())
            return null;
        // Check if withholding on sales is needed
        final MPOS pos = MPOS.get(Env.getCtx(), Env.getContextAsInt(Env.getCtx(),Env.POS_ID));
        if (!pos.get_ValueAsBoolean("IsGenerateWithholdingOnSale")) {
            return null;
        }
        int c_Order_ID = order.get_ID();
        log.info("Borrar las percepciones para la orden: " + c_Order_ID);
        String sql = "DELETE FROM LAR_OrderPerception WHERE C_ORDER_ID=?";
        PreparedStatement pstmt = null;
        try {
            pstmt = DB.prepareStatement(sql, order.get_TrxName());
            pstmt.setInt(1, c_Order_ID);
            pstmt.executeUpdate();
        } catch (Exception e) {
            log.log(Level.SEVERE, sql, e);
            return e.getMessage();
        } finally {
            DB.close(pstmt);
            pstmt = null;
        }
        return null;
    } // deleteWhithholdingLine

} // LAR_CalcularPercepcion
