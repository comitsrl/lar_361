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
import java.util.logging.Level;

import org.compiere.model.MBPartner;
import org.compiere.model.MOrder;
import org.compiere.model.MOrderLine;
import org.compiere.model.MOrderTax;
import org.compiere.model.MPOS;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.globalqss.model.X_LCO_WithholdingCalc;

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
                || (type == TYPE_AFTER_CHANGE
                    && (line.is_ValueChanged("LineNetAmt")
                        || line.is_ValueChanged("M_Product_ID")
                        || line.is_ValueChanged("IsActive")
                        || line.is_ValueChanged("C_Tax_ID")
                        || line.is_ValueChanged("C_BPartner_ID")
                        )
                    )
           )
        {
            // Check if withholding on sales is needed
            final MPOS pos = MPOS.get(Env.getCtx(), Env.getContextAsInt(Env.getCtx(),Env.POS_ID));
            if (!pos.get_ValueAsBoolean("IsGenerateWithholdingOnSale")) {
                return null;
            }
            final MOrder order = line.getParent();
            // Check if is a sales transaction
            if (!order.isSOTrx())
                return null;

            final WithholdingConfig[] configs = WithholdingConfig.getConfig(bp, true, order.get_TrxName(), order, order.getDateOrdered());

            deleteWhithholdingLine(order);
            // Se recorren las configuraciones recuperadas
            // Se crean las líneas de percepción
            for (int i = 0; i < configs.length; i++)
            {
                final WithholdingConfig wc = configs[i];
                log.info("Withholding conf >> " + wc);

                // Calcula el subtotal y el importe de la percepción
                BigDecimal taxAmt = BigDecimal.ZERO;
                BigDecimal gravado = BigDecimal.ZERO;
                BigDecimal base = BigDecimal.ZERO;
                BigDecimal perceptionAmt = BigDecimal.ZERO;
                for (MOrderTax tax : order.getTaxes(true)) {
                    taxAmt = taxAmt.add(tax.getTaxAmt());
                }
                // Acumula la base imponible para calcular la Percepción de IIBB
                for (MOrderLine oline : order.getLines())
                    gravado = gravado.add(oline.getLineNetAmt());
                if (wc.getBaseType().equals(X_LCO_WithholdingCalc.BASETYPE_Tax))
                    base = taxAmt;
                else
                    base = gravado;

                /*
                 * @mzuniga: No se tiene en cuenta la condición de IVA del SdN ya que en las
                 * Configuraciones de las percepciones se realiza una entrada para el neto del
                 * documento y otra para el impuesto. Esto permite utilizar los importes base
                 * mínimos para el cálculo.
                 */
                perceptionAmt = (((base.multiply(wc.getAliquot())).divide(new BigDecimal(100)))
                        .setScale(2, BigDecimal.ROUND_HALF_UP)).abs();
                // @mzuniga: Si la base de cálculo no supera el mínimo el importe
                // de la Perceción debe quedar en 0 (cero).
                if (base.compareTo(wc.getThresholdMin()) <= 0)
                    perceptionAmt = Env.ZERO;

                // Crea la percepción de la orden
                // Si existe recupera la línea anterior y acumula el importe de la percepción.
                MLAROrderPerception perception = MLAROrderPerception.get(order, order.get_TrxName());
                perception.setC_Order_ID(order.get_ID());
                perception.setC_Tax_ID(wc.getC_Tax_ID());
                perception.setLCO_WithholdingRule_ID(wc.getWithholdingRule_ID());
                perception.setLCO_WithholdingType_ID(wc.getWithholdingType_ID());
                // Se acumula el importe
                perception.setTaxAmt(perception.getTaxAmt().add(perceptionAmt));
                perception.setTaxBaseAmt(perception.getTaxBaseAmt().add(base));

                perception.setIsTaxIncluded(false);
                if (!perception.save()) {
                    return "Error al craer percepción";
                }
                // Update order amounts
                if (!order.save()) {
                    return "Error al intentar actualizar los importes de la orden";
                }
            } // Fin recorrido configuraciones
        }
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
