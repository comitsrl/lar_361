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
package org.globalqss.process;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.logging.Level;

import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereUserError;
import org.compiere.util.DB;
import org.globalqss.model.MLCODIANConcept;
import org.globalqss.model.MLCODIANFormat;
import org.globalqss.model.X_LCO_DIAN_SendSchedule;

/**
 *	LCO_DianProcessContent
 *
 *  @author Carlos Ruiz - globalqss - Quality Systems & Solutions - http://globalqss.com
 *  @version  $Id: LCO_DianProcessContent
 */
public class LCO_DianProcessContent extends SvrProcess
{

	/** The Record						*/
	private int		p_Record_ID = 0;

	private int		p_LCO_DIAN_SendSchedule_ID = 0;

	/**
	 *  Prepare - e.g., get Parameters.
	 */
	protected void prepare()
	{
		ProcessInfoParameter[] para = getParameter();
		for (int i = 0; i < para.length; i++)
		{
			String name = para[i].getParameterName();
			if (para[i].getParameter() == null)
				;
			else
				log.log(Level.SEVERE, "Unknown Parameter: " + name);
		}
		p_Record_ID = getRecord_ID();
		p_LCO_DIAN_SendSchedule_ID = p_Record_ID;
	}	//	prepare

	/**
	 * 	Process
	 *	@return message
	 *	@throws Exception
	 */
	protected String doIt() throws Exception
	{
		// Fill details for the format
		log.info("LCO_DIAN_SendSchedule_ID = " + p_LCO_DIAN_SendSchedule_ID);
		X_LCO_DIAN_SendSchedule sendScheduleProcess = new X_LCO_DIAN_SendSchedule (getCtx(), p_LCO_DIAN_SendSchedule_ID, get_TrxName());
		if (sendScheduleProcess.isGenerated()) {
			throw new AdempiereUserError("SendSchedule has been generated before");
		}
		if (sendScheduleProcess.getLCO_DIAN_SendSchedule_ID() == 0)
			throw new AdempiereUserError("@No@ @LCO_DIAN_SendSchedule@");

		MLCODIANFormat format = new MLCODIANFormat (getCtx(), sendScheduleProcess.getLCO_DIAN_Format_ID(), get_TrxName());
		int cnt = 0;
		if (format.isBPartnerDetailed()) {
			// bring BPartners from selected year and dates
			String sqlBp = "SELECT DISTINCT fa.C_BPartner_ID AS C_BPartner_ID, bp.TaxID AS TaxId "
				+ "FROM Fact_Acct fa "
				+ " JOIN C_BPartner bp ON fa.C_BPartner_ID = bp.C_BPartner_ID "
				+ " INNER JOIN C_Period p ON fa.C_Period_ID = p.C_Period_ID "
				+ "WHERE fa.C_BPartner_ID <> 0 AND fa.C_Bpartner_ID IS NOT NULL "
				+ " AND fa.AD_Client_ID = ? "
				+ " AND p.C_Year_ID = ? AND fa.DateAcct BETWEEN ? AND ? "
				+ " AND fa.PostingType = 'A' /* Actual Hardcoded */ "
				+ "ORDER BY fa.C_BPartner_ID";

			PreparedStatement pstmtbp = null;
			ResultSet rsbp = null;

			try
			{
				pstmtbp = DB.prepareStatement(sqlBp, get_TrxName());
				pstmtbp.setInt(1, sendScheduleProcess.getAD_Client_ID());
				pstmtbp.setInt(2, sendScheduleProcess.getC_Year_ID());
				pstmtbp.setTimestamp(3, sendScheduleProcess.getStartDate());
				pstmtbp.setTimestamp(4, sendScheduleProcess.getEndDate());
				rsbp = pstmtbp.executeQuery();
				// for each bpartner
				while (rsbp.next()) {
					// bp was found in fact acct
					int bpID = rsbp.getInt(1);
					// for each concept related to this format
					for (MLCODIANConcept concept : format.getConcepts()) {
						int cntsrc = concept.calculateSources(sendScheduleProcess, bpID);
						cnt = cnt + cntsrc;
					}
				}
				
			} catch (Exception e) {
				log.log(Level.SEVERE, "", e);
				throw e;
			} finally {
				DB.close(rsbp, pstmtbp);
				rsbp = null;
				pstmtbp = null;
			}
		} else {
			int bpID = -1;
			// for each concept related to this format
			for (MLCODIANConcept concept : format.getConcepts()) {
				int cntsrc = concept.calculateSources(sendScheduleProcess, bpID);
				cnt = cnt + cntsrc;
			}
		}
	
		// TODO: Implement post-process

		sendScheduleProcess.setIsGenerated(true);
		sendScheduleProcess.saveEx();
		return "@LCO_LinesInserted@=" + cnt;

	}	//	doIt

}	//	LCO_DianProcessContent
