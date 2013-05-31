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
import java.util.logging.Level;

import org.compiere.model.MBPartner;
import org.compiere.util.CLogger;
import org.compiere.util.DB;

/**
 * Encapsula la recuperación de los parámetros de configuración
 * de retenciones/percepciones.
 *
 * @author Emiliano Pereyra - http://www.ergio.com.ar
 */
// TODO - Allow retrive individual configuration, depending withholding type
// and using config values defined into lco tables (see LCO_Validator)
class WithholdingConfig
{
    /** Logger          */
    private static CLogger log = CLogger.getCLogger(WithholdingConfig.class);

    private BigDecimal aliquot = BigDecimal.ZERO;
    private BigDecimal rate = BigDecimal.ZERO;
    private BigDecimal paymentThresholdMin = BigDecimal.ZERO;
    private boolean isCalcFromPayment;
    private boolean isSOTrx;
    private int lco_WithholdingRule_ID;
    private int lco_WithholdingType_ID;
    private int c_Tax_ID;
    private int c_DocType_ID;
    private int c_TaxCategory_ID;

    private String sql = "SELECT X.Rate/100 AS Rate"
                       + "     , R.LCO_WithholdingRule_ID"
                       + "     , C.LCO_WithholdingType_ID"
                       + "     , X.C_Tax_ID"
                       + "     , F.IsCalcFromPayment"
                       + "     , F.PaymentThresholdMin"
                       + "     , F.C_DocType_ID"
                       + "     , R.C_TaxCategory_ID"
                       + "  FROM C_BPartner B"
                       + "  JOIN LCO_WithholdingRule R ON R.LCO_BP_ISIC_ID = B.LCO_ISIC_ID"
                       + "       AND R.LCO_BP_TaxPayerType_ID = B.LCO_TaxPayerType_ID"
                       + "  JOIN LCO_WithholdingRuleConf F ON F.LCO_WithholdingType_ID = R.LCO_WithholdingType_ID"
                       + "  JOIN LCO_WithholdingCalc C ON C.LCO_WithholdingCalc_ID = R.LCO_WithholdingCalc_ID"
                       + "  JOIN LCO_WithholdingType T ON T.LCO_WithholdingType_ID = R.LCO_WithholdingType_ID"
                       + "  JOIN C_Tax X on X.C_Tax_ID = C.C_Tax_ID"
                       + " WHERE B.C_BPartner_ID=?"
                       + "   AND T.IsSOTrx=?"
                       + "   AND F.IsActive='Y'";

    public WithholdingConfig(final MBPartner bp, boolean isSOTrx)
    {
        this.isSOTrx = isSOTrx;
        retrieveConfig(bp);
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

    public BigDecimal getAliquot()
    {
        return isSOTrx ? aliquot.negate() : aliquot;
    }

    public BigDecimal getRate()
    {
		return rate;
    }

    public BigDecimal getPaymentThresholdMin()
    {
        return paymentThresholdMin;
    }

    public boolean isCalcFromPayment()
    {
        return isCalcFromPayment;
    }

    public int getC_DocType_ID()
    {
        return c_DocType_ID;
    }

    public int getC_TaxCategory_ID()
    {
        return c_TaxCategory_ID;
    }

    /**
     * Retrieve perception configuration variables for a given bpartner.
     *
     * @param bp bpartner
     */
    private void retrieveConfig(final MBPartner bp)
    {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            pstmt = DB.prepareStatement(sql, bp.get_TrxName());
            pstmt.setInt(1, bp.getC_BPartner_ID());
            pstmt.setString(2, isSOTrx ? "Y" : "N");
            rs = pstmt.executeQuery();
            if (rs.next())
            {
                aliquot = rs.getBigDecimal(1).setScale(4, BigDecimal.ROUND_HALF_EVEN);
                rate = aliquot.multiply(BigDecimal.valueOf(100));
                lco_WithholdingRule_ID = rs.getInt(2);
                lco_WithholdingType_ID = rs.getInt(3);
                c_Tax_ID = rs.getInt(4);
                isCalcFromPayment = rs.getString(5).equals("Y");
                paymentThresholdMin = rs.getBigDecimal(6);
                c_DocType_ID = rs.getInt(7);
                c_TaxCategory_ID = rs.getInt(8);
            }
        } catch (Exception e)
        {
            log.log(Level.SEVERE, sql, e);
        } finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }
    } // retrieveConfig

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
        sb.append("]");
        return sb.toString();
    } // toString

} // WithholndigConfig
