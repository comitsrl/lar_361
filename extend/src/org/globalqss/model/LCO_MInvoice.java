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
package org.globalqss.model;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.model.MBPartner;
import org.compiere.model.MBPartnerLocation;
import org.compiere.model.MDocType;
import org.compiere.model.MInvoice;
import org.compiere.model.MLocation;
import org.compiere.model.MOrgInfo;
import org.compiere.model.MPriceList;
import org.compiere.model.MTax;
import org.compiere.util.DB;
import org.compiere.util.Env;

/**
 *	LCO_MInvoice
 *
 *  @author Carlos Ruiz - globalqss - Quality Systems & Solutions - http://globalqss.com 
 *  @version  $Id: LCO_MInvoice.java,v 1.5 2007/06/28 03:37:29 cruiz Exp $
 */
public class LCO_MInvoice extends MInvoice
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -924606040343895114L;

	public LCO_MInvoice(Properties ctx, int C_Invoice_ID, String trxName) {
		super(ctx, C_Invoice_ID, trxName);
	}

	public int recalcWithholdings() {
		
		MDocType dt = new MDocType(getCtx(), getC_DocTypeTarget_ID(), get_TrxName());
		String genwh = dt.get_ValueAsString("GenerateWithholding");
		if (genwh == null || genwh.equals("N"))
			return 0;
		
		int noins = 0;
		log.info("");
		BigDecimal totwith = new BigDecimal("0");
		try
		{
			// Delete previous records generated
			String sqldel = "DELETE FROM LCO_InvoiceWithholding "
				+ " WHERE C_Invoice_ID = ?";
			PreparedStatement pstmtdel = DB.prepareStatement(sqldel, get_TrxName());
			pstmtdel.setInt(1, getC_Invoice_ID());
			int nodel = pstmtdel.executeUpdate();
			log.config("LCO_InvoiceWithholding deleted="+nodel);
			pstmtdel.close();

			// Fill variables normally needed
			// BP variables
			MBPartner bp = new MBPartner(getCtx(), getC_BPartner_ID(), get_TrxName());
			Integer bp_isic_int = (Integer) bp.get_Value("LCO_ISIC_ID");
			int bp_isic_id = 0;
			if (bp_isic_int != null)
				bp_isic_id = bp_isic_int.intValue();
			Integer bp_taxpayertype_int = (Integer) bp.get_Value("LCO_TaxPayerType_ID");
			int bp_taxpayertype_id = 0;
			if (bp_taxpayertype_int != null)
				bp_taxpayertype_id = bp_taxpayertype_int.intValue();
			MBPartnerLocation mbpl = new MBPartnerLocation(getCtx(), getC_BPartner_Location_ID(), get_TrxName());
			MLocation bpl = MLocation.get(getCtx(), mbpl.getC_Location_ID(), get_TrxName());
			int bp_city_id = bpl.getC_City_ID();
			// OrgInfo variables
			MOrgInfo oi = MOrgInfo.get(getCtx(), getAD_Org_ID());
			Integer org_isic_int = (Integer) oi.get_Value("LCO_ISIC_ID");
			int org_isic_id = 0;
			if (org_isic_int != null)
				org_isic_id = org_isic_int.intValue();
			Integer org_taxpayertype_int = (Integer) oi.get_Value("LCO_TaxPayerType_ID");
			int org_taxpayertype_id = 0;
			if (org_taxpayertype_int != null)
				org_taxpayertype_id = org_taxpayertype_int.intValue();
			MLocation ol = MLocation.get(getCtx(), oi.getC_Location_ID(), get_TrxName());
			int org_city_id = ol.getC_City_ID();

			// Search withholding types applicable depending on IsSOTrx
			String sqlt = "SELECT LCO_WithholdingType_ID "
				+ " FROM LCO_WithholdingType "
				+ " WHERE IsSOTrx = ? AND IsActive = 'Y'";
			PreparedStatement pstmtt = DB.prepareStatement(sqlt, get_TrxName());
			pstmtt.setString(1, isSOTrx() ? "Y" : "N");
			ResultSet rst = pstmtt.executeQuery();
			while (rst.next())
			{
				// For each applicable withholding
				X_LCO_WithholdingType wt = new X_LCO_WithholdingType(getCtx(), rst.getInt(1), get_TrxName());
				X_LCO_WithholdingRuleConf wrc = null;
				log.info("Withholding Type: "+wt.getLCO_WithholdingType_ID()+"/"+wt.getName());

				// look the conf fields
				String sqlrc = "SELECT * "
					+ " FROM LCO_WithholdingRuleConf "
					+ " WHERE LCO_WithholdingType_ID = ? AND IsActive = 'Y'";
				PreparedStatement pstmtrc = DB.prepareStatement(sqlrc, get_TrxName());
				pstmtrc.setInt(1, wt.getLCO_WithholdingType_ID());
				ResultSet rsrc = pstmtrc.executeQuery();
				if (rsrc.next()) {
					wrc = new X_LCO_WithholdingRuleConf(getCtx(), rsrc, get_TrxName());
				} else {
					log.warning("No LCO_WithholdingRuleConf for LCO_WithholdingType = "+wt.getLCO_WithholdingType_ID());
					rsrc.close();
					pstmtrc.close();
					continue;
				}
				rsrc.close();
				pstmtrc.close();

				// look for applicable rules according to config fields (rule)
				StringBuffer sqlr = new StringBuffer("SELECT LCO_WithholdingRule_ID "
						+ "  FROM LCO_WithholdingRule "
						+ " WHERE LCO_WithholdingType_ID = ? "
						+ "   AND IsActive = 'Y' "
						+ "   AND ValidFrom <= ? ");
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

				// Add withholding categories of lines
				if (wrc.isUseWithholdingCategory()) {
					// look the conf fields
					String sqlwcs =
						"SELECT DISTINCT COALESCE (p.LCO_WithholdingCategory_ID, COALESCE (c.LCO_WithholdingCategory_ID, 0)) "
						+ "  FROM C_InvoiceLine il "
						+ "  LEFT OUTER JOIN M_Product p ON (il.M_Product_ID = p.M_Product_ID) "
						+ "  LEFT OUTER JOIN C_Charge c ON (il.C_Charge_ID = c.C_Charge_ID) "
						+ "  WHERE C_Invoice_ID = ? AND il.IsActive='Y'";
					PreparedStatement pstmtwcs = DB.prepareStatement(sqlwcs, get_TrxName());
					pstmtwcs.setInt(1, getC_Invoice_ID());
					ResultSet rswcs = pstmtwcs.executeQuery();
					int i = 0;
					int wcid = 0;
					boolean addedlines = false;
					while (rswcs.next()) {
						wcid = rswcs.getInt(1);
						if (wcid > 0) {
							if (i == 0) {
								sqlr.append(" AND LCO_WithholdingCategory_ID IN (");
								addedlines = true;
							} else {
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
				if (wrc.isUseProductTaxCategory()) {
					// look the conf fields
					String sqlwct =
						"SELECT DISTINCT COALESCE (p.C_TaxCategory_ID, COALESCE (c.C_TaxCategory_ID, 0)) "
						+ "  FROM C_InvoiceLine il "
						+ "  LEFT OUTER JOIN M_Product p ON (il.M_Product_ID = p.M_Product_ID) "
						+ "  LEFT OUTER JOIN C_Charge c ON (il.C_Charge_ID = c.C_Charge_ID) "
						+ "  WHERE C_Invoice_ID = ? AND il.IsActive='Y'";
					PreparedStatement pstmtwct = DB.prepareStatement(sqlwct, get_TrxName());
					pstmtwct.setInt(1, getC_Invoice_ID());
					ResultSet rswct = pstmtwct.executeQuery();
					int i = 0;
					int wcid = 0;
					boolean addedlines = false;
					while (rswct.next()) {
						wcid = rswct.getInt(1);
						if (wcid > 0) {
							if (i == 0) {
								sqlr.append(" AND C_TaxCategory_ID IN (");
								addedlines = true;
							} else {
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

				PreparedStatement pstmtr = DB.prepareStatement(sqlr.toString(), get_TrxName());
				int idxpar = 1;
				pstmtr.setInt(idxpar, wt.getLCO_WithholdingType_ID());
				idxpar++;
				pstmtr.setTimestamp(idxpar, getDateInvoiced());
				if (wrc.isUseBPISIC()) {
					idxpar++;
					pstmtr.setInt(idxpar, bp_isic_id);
				}
				if (wrc.isUseBPTaxPayerType()) {
					idxpar++;
					pstmtr.setInt(idxpar, bp_taxpayertype_id);
				}
				if (wrc.isUseOrgISIC()) {
					idxpar++;
					pstmtr.setInt(idxpar, org_isic_id);
				}
				if (wrc.isUseOrgTaxPayerType()) {
					idxpar++;
					pstmtr.setInt(idxpar, org_taxpayertype_id);
				}
				if (wrc.isUseBPCity()) {
					idxpar++;
					pstmtr.setInt(idxpar, bp_city_id);
					if (bp_city_id <= 0)
						log.warning("Possible configuration error bp city is used but not set");
				}
				if (wrc.isUseOrgCity()) {
					idxpar++;
					pstmtr.setInt(idxpar, org_city_id);
					if (org_city_id <= 0)
						log.warning("Possible configuration error org city is used but not set");
				}

				ResultSet rsr = pstmtr.executeQuery();
				while (rsr.next())
				{
					// for each applicable rule
					X_LCO_WithholdingRule wr = new X_LCO_WithholdingRule(getCtx(), rsr.getInt(1), get_TrxName());

					// bring record for withholding calculation
					X_LCO_WithholdingCalc wc = new X_LCO_WithholdingCalc(getCtx(), wr.getLCO_WithholdingCalc_ID(), get_TrxName());
					if (wc.getLCO_WithholdingCalc_ID() == 0) {
						log.severe("Rule without calc "+rsr.getInt(1));
						continue;
					}

					// bring record for tax
					MTax tax = new MTax(getCtx(), wc.getC_Tax_ID(), get_TrxName());

					log.info("WithholdingRule: "+wr.getLCO_WithholdingRule_ID()+"/"+wr.getName()
							+" BaseType:"+wc.getBaseType()
							+" Calc: "+wc.getLCO_WithholdingCalc_ID()+"/"+wc.getName()
							+" CalcOnInvoice:"+wc.isCalcOnInvoice()
							+" Tax: "+tax.getC_Tax_ID()+"/"+tax.getName());

					// calc base
					// apply rule to calc base
					BigDecimal base = null;
					
					if (wc.getBaseType() == null) {
						log.severe("Base Type null in calc record "+wr.getLCO_WithholdingCalc_ID());
					} else if (wc.getBaseType().equals(X_LCO_WithholdingCalc.BASETYPE_Document)) {
						base = getTotalLines();
					} else if (wc.getBaseType().equals(X_LCO_WithholdingCalc.BASETYPE_Line)) {
						String sqllca; 
						if (wrc.isUseWithholdingCategory() && wrc.isUseProductTaxCategory()) {
							// base = lines of the withholding category and tax category
							sqllca = 
								"SELECT SUM (LineNetAmt) "
								+ "  FROM C_InvoiceLine il "
								+ " WHERE IsActive='Y' AND C_Invoice_ID = ? "
								+ "   AND (   EXISTS ( "
								+ "              SELECT 1 "
								+ "                FROM M_Product p "
								+ "               WHERE il.M_Product_ID = p.M_Product_ID "
								+ "                 AND p.C_TaxCategory_ID = ? "
								+ "                 AND p.LCO_WithholdingCategory_ID = ?) "
								+ "        OR EXISTS ( "
								+ "              SELECT 1 "
								+ "                FROM C_Charge c "
								+ "               WHERE il.C_Charge_ID = c.C_Charge_ID "
								+ "                 AND c.C_TaxCategory_ID = ? "
								+ "                 AND c.LCO_WithholdingCategory_ID = ?) "
								+ "       ) ";
						} else if (wrc.isUseWithholdingCategory()) {
							// base = lines of the withholding category
							sqllca = 
								"SELECT SUM (LineNetAmt) "
								+ "  FROM C_InvoiceLine il "
								+ " WHERE IsActive='Y' AND C_Invoice_ID = ? "
								+ "   AND (   EXISTS ( "
								+ "              SELECT 1 "
								+ "                FROM M_Product p "
								+ "               WHERE il.M_Product_ID = p.M_Product_ID "
								+ "                 AND p.LCO_WithholdingCategory_ID = ?) "
								+ "        OR EXISTS ( "
								+ "              SELECT 1 "
								+ "                FROM C_Charge c "
								+ "               WHERE il.C_Charge_ID = c.C_Charge_ID "
								+ "                 AND c.LCO_WithholdingCategory_ID = ?) "
								+ "       ) ";
						} else if (wrc.isUseProductTaxCategory()) {
							// base = lines of the product tax category
							sqllca = 
								"SELECT SUM (LineNetAmt) "
								+ "  FROM C_InvoiceLine il "
								+ " WHERE IsActive='Y' AND C_Invoice_ID = ? "
								+ "   AND (   EXISTS ( "
								+ "              SELECT 1 "
								+ "                FROM M_Product p "
								+ "               WHERE il.M_Product_ID = p.M_Product_ID "
								+ "                 AND p.C_TaxCategory_ID = ?) "
								+ "        OR EXISTS ( "
								+ "              SELECT 1 "
								+ "                FROM C_Charge c "
								+ "               WHERE il.C_Charge_ID = c.C_Charge_ID "
								+ "                 AND c.C_TaxCategory_ID = ?) "
								+ "       ) ";
						} else {
							// base = all lines
							sqllca = 
								"SELECT SUM (LineNetAmt) "
								+ "  FROM C_InvoiceLine il "
								+ " WHERE IsActive='Y' AND C_Invoice_ID = ? ";
						}
						
						PreparedStatement pstmtlca = DB.prepareStatement(sqllca, get_TrxName());
						pstmtlca.setInt(1, getC_Invoice_ID());
						if (wrc.isUseWithholdingCategory() && wrc.isUseProductTaxCategory()) {
							pstmtlca.setInt(2, wr.getC_TaxCategory_ID());
							pstmtlca.setInt(3, wr.getLCO_WithholdingCategory_ID());
							pstmtlca.setInt(4, wr.getC_TaxCategory_ID());
							pstmtlca.setInt(5, wr.getLCO_WithholdingCategory_ID());
						} else if (wrc.isUseWithholdingCategory()) {
							pstmtlca.setInt(2, wr.getLCO_WithholdingCategory_ID());
							pstmtlca.setInt(3, wr.getLCO_WithholdingCategory_ID());
						} else if (wrc.isUseProductTaxCategory()) {
							pstmtlca.setInt(2, wr.getC_TaxCategory_ID());
							pstmtlca.setInt(3, wr.getC_TaxCategory_ID());
						} else {
							;  // nothing
						}
						ResultSet rslca = pstmtlca.executeQuery();
						if (rslca.next())
							base = rslca.getBigDecimal(1);
						rslca.close();
						pstmtlca.close();
					} else if (wc.getBaseType().equals(X_LCO_WithholdingCalc.BASETYPE_Tax)) {
						// if specific tax
						if (wc.getC_BaseTax_ID() != 0) {
							// base = value of specific tax
							String sqlbst = "SELECT SUM(TaxAmt) "
								+ " FROM C_InvoiceTax "
								+ " WHERE IsActive='Y' AND C_Invoice_ID = ? "
								+ "   AND C_Tax_ID = ?";
							PreparedStatement pstmtbst = DB.prepareStatement(sqlbst, get_TrxName());
							pstmtbst.setInt(1, getC_Invoice_ID());
							pstmtbst.setInt(2, wc.getC_BaseTax_ID());
							ResultSet rsbst = pstmtbst.executeQuery();
							if (rsbst.next())
								base = rsbst.getBigDecimal(1);
							rsbst.close();
							pstmtbst.close();
						} else {
							// not specific tax
							// base = value of all taxes
							String sqlbsat = "SELECT SUM(TaxAmt) "
								+ " FROM C_InvoiceTax "
								+ " WHERE IsActive='Y' AND C_Invoice_ID = ? ";
							PreparedStatement pstmtbsat = DB.prepareStatement(sqlbsat, get_TrxName());
							pstmtbsat.setInt(1, getC_Invoice_ID());
							ResultSet rsbsat = pstmtbsat.executeQuery();
							if (rsbsat.next())
								base = rsbsat.getBigDecimal(1);
							rsbsat.close();
							pstmtbsat.close();
						}
					}
					log.info("Base: "+base+ " Thresholdmin:"+wc.getThresholdmin());

					// if base between thresholdmin and thresholdmax inclusive
					// if thresholdmax = 0 it is ignored
					if (base != null && 
							base.compareTo(Env.ZERO) != 0 && 
							base.compareTo(wc.getThresholdmin()) >= 0 &&
							(wc.getThresholdMax() == null || wc.getThresholdMax().compareTo(Env.ZERO) == 0 || base.compareTo(wc.getThresholdMax()) <= 0) &&
							tax.getRate() != null &&
							tax.getRate().compareTo(Env.ZERO) != 0) {
						
						// insert new withholding record
						// with: type, tax, base amt, percent, tax amt, trx date, acct date, rule
						MLCOInvoiceWithholding iwh = new MLCOInvoiceWithholding(getCtx(), 0, get_TrxName());
						iwh.setAD_Org_ID(getAD_Org_ID());
						iwh.setC_Invoice_ID(getC_Invoice_ID());
						iwh.setDateAcct(getDateAcct());
						iwh.setDateTrx(getDateInvoiced());
						iwh.setIsCalcOnPayment( ! wc.isCalcOnInvoice() );
						iwh.setIsTaxIncluded(false);
						iwh.setLCO_WithholdingRule_ID(wr.getLCO_WithholdingRule_ID());
						iwh.setLCO_WithholdingType_ID(wt.getLCO_WithholdingType_ID());
						iwh.setC_Tax_ID(tax.getC_Tax_ID());
						iwh.setPercent(tax.getRate());
						iwh.setProcessed(false);
						int stdPrecision = MPriceList.getStandardPrecision(getCtx(), getM_PriceList_ID());
						BigDecimal taxamt = tax.calculateTax(base, false, stdPrecision);
						if (wc.getAmountRefunded() != null &&
								wc.getAmountRefunded().compareTo(Env.ZERO) > 0) {
							taxamt = taxamt.subtract(wc.getAmountRefunded());
						}
						iwh.setTaxAmt(taxamt);
						iwh.setTaxBaseAmt(base);
						iwh.save();
						totwith = totwith.add(taxamt);
						noins++;
						log.info("LCO_InvoiceWithholding saved:"+iwh.getTaxAmt());
					}
				} // while each applicable rule

			} // while type
			LCO_MInvoice.updateHeaderWithholding(getC_Invoice_ID(), get_TrxName());
			save();

			rst.close();
			pstmtt.close();
		}
		catch (SQLException e)
		{
			log.log(Level.SEVERE, "", e);
			return -1;
		}

		return noins;
	}
	
	/**
	 *	Update Withholding in Header
	 *	@return true if header updated with withholding
	 */
	public static boolean updateHeaderWithholding(int C_Invoice_ID, String trxName)
	{
		//	Update Invoice Header
		String sql = 
			"UPDATE C_Invoice "
			+ " SET WithholdingAmt="
				+ "(SELECT COALESCE(SUM(TaxAmt),0) FROM LCO_InvoiceWithholding iw WHERE iw.IsActive = 'Y' " +
						"AND iw.IsCalcOnPayment = 'N' AND C_Invoice.C_Invoice_ID=iw.C_Invoice_ID) "
			+ "WHERE C_Invoice_ID=?";
		int no = DB.executeUpdate(sql, C_Invoice_ID, trxName);

		return no == 1;
	}	//	updateHeaderWithholding

	/*
	 * Set Withholding Amount without Logging (via direct SQL UPDATE)
	 */
	public static boolean setWithholdingAmtWithoutLogging(MInvoice inv, BigDecimal wamt) {
		DB.executeUpdate("UPDATE C_Invoice SET WithholdingAmt=? WHERE C_Invoice_ID=?", 
				new Object[] {wamt, inv.getC_Invoice_ID()}, 
				true, 
				inv.get_TrxName());
		return true;
	}

}	//	LCO_MInvoice