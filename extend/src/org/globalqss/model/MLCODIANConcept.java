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

import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.logging.Level;

import javax.script.ScriptEngine;

import org.compiere.model.MBPartner;
import org.compiere.model.MBPartnerLocation;
import org.compiere.model.MRule;
import org.compiere.util.AdempiereUserError;
import org.compiere.util.DB;
import org.compiere.util.Env;

/**
 *	Model class for concept
 *	
 *  @author Carlos Ruiz - globalqss
 */
public class MLCODIANConcept extends X_LCO_DIAN_Concept
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 8280094742826097467L;

	/**************************************************************************
	 * 	Default Constructor
	 *	@param ctx context
	 *	@param MLCOInvoiceWithholding_ID id
	 *	@param trxName transaction
	 */
	public MLCODIANConcept (Properties ctx, int LCO_DIAN_Concept_ID, String trxName)
	{
		super(ctx, LCO_DIAN_Concept_ID, trxName);
	}	//	MLCODIANConcept

	/**
	 * 	Load Constructor
	 *	@param ctx context
	 *	@param rs result set
	 *	@param trxName transaction
	 */
	public MLCODIANConcept(Properties ctx, ResultSet rs, String trxName)
	{
		super(ctx, rs, trxName);
	}	//	MLCODIANConcept

	/**
	 * 	Calculate the sources and insert corresponding schedule lines
	 *	@param sendScheduleProcess the process
	 *	@param format the format
	 *  @return count of lines inserted
	 * @throws AdempiereUserError 
	 */
	public int calculateSources(X_LCO_DIAN_SendSchedule sendScheduleProcess, int bpID) throws Exception {
		int cnt = 0;
		MBPartner bp = null;
		MBPartnerLocation bpl = null;
		if (bpID > 0) {
			bp = MBPartner.get(getCtx(), bpID);
			bpl = bp.getLocation(0);
			if (bpl == null)
				throw new AdempiereUserError("No BPLocation for BPartner = " + bp.getC_BPartner_ID() + " / " + bp.getName());
		}
		// for each position in sources
		String sql = "SELECT DISTINCT dcs.CalcColumnPosition "
			+ "FROM LCO_DIAN_ConceptSource dcs "
			+ "WHERE dcs.LCO_DIAN_Concept_ID=? AND dcs.IsActive='Y' AND dcs.CalcColumnPosition>0"
			+ "ORDER BY dcs.CalcColumnPosition";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			X_LCO_DIAN_SendScheduleLine dssl = null;
			pstmt = DB.prepareStatement(sql, get_TrxName());
			pstmt.setInt(1, getLCO_DIAN_Concept_ID());
			rs = pstmt.executeQuery();
			//    for each position
			while (rs.next())
			{
				int position = rs.getInt(1);
				String sqlsrc = "SELECT dcs.* "
					+ "FROM LCO_DIAN_ConceptSource dcs "
					+ "WHERE dcs.LCO_DIAN_Concept_ID=? AND dcs.IsActive='Y' AND dcs.CalcColumnPosition=?";
				PreparedStatement pstmtsrc = null;
				ResultSet rssrc = null;
				BigDecimal amtTotal = Env.ZERO;
				try
				{
					pstmtsrc = DB.prepareStatement(sqlsrc, get_TrxName());
					pstmtsrc.setInt(1, getLCO_DIAN_Concept_ID());
					pstmtsrc.setInt(2, position);
					rssrc = pstmtsrc.executeQuery();
					//    for each source
					while (rssrc.next())
					{
						X_LCO_DIAN_ConceptSource conceptSource = new X_LCO_DIAN_ConceptSource(getCtx(), rssrc, get_TrxName());
						//       calculate the source
						BigDecimal amtSrc = processSource(sendScheduleProcess, bpID, conceptSource);
						//       sum
						if (amtSrc != null)
							amtTotal = amtTotal.add(amtSrc);
					}
				} finally {
					DB.close(rssrc, pstmtsrc);
					rssrc = null;
					pstmtsrc = null;
				}
				if (amtTotal != null && amtTotal.compareTo(Env.ZERO) != 0) {
					if (dssl == null) {
						dssl = new X_LCO_DIAN_SendScheduleLine (getCtx(), 0, get_TrxName());
						dssl.setLCO_DIAN_Concept_ID(getLCO_DIAN_Concept_ID());
						dssl.setLCO_DIAN_SendSchedule_ID(sendScheduleProcess.getLCO_DIAN_SendSchedule_ID());
						if (bpID > 0)
							dssl.setC_BPartner_ID(bpID);
						if (bpl != null)
							dssl.setC_BPartner_Location_ID(bpl.getC_BPartner_Location_ID());
					}
					//    insert into position
					dssl.set_ValueOfColumn("FieldAmt" + position, amtTotal);
				}
			}
			if (dssl != null) {
				dssl.saveEx();
				cnt++;
				dssl = null;
			}
		} catch (Exception e) {
			throw e;
		} finally {
			DB.close(rs, pstmt);
			rs = null;
			pstmt = null;
		}
		return cnt;
	}

	/**
	 * 	Process the source calling the expression and returning the value
	 *	@param sendScheduleProcess the process
	 *	@param format the format
	 * @throws Exception 
	 */
	private BigDecimal processSource(X_LCO_DIAN_SendSchedule sendScheduleProcess, int bpID, X_LCO_DIAN_ConceptSource conceptSource) throws Exception {
		BigDecimal retValue = null;
		String retValueStr = null;
		String msg = null;
		String cmd = conceptSource.getFieldExpression();
		if (cmd == null || cmd.length() == 0) {
			msg = "FieldExpression not defined";
			throw new AdempiereUserError(msg);
		}
		if (cmd.toLowerCase().startsWith(MRule.SCRIPT_PREFIX)) {
			
			MRule rule = MRule.get(getCtx(), cmd.substring(MRule.SCRIPT_PREFIX.length()));
			if (rule == null) {
				msg = "Callout " + cmd + " not found";
				throw new AdempiereUserError(msg);
			}
			if ( !  (rule.getEventType().equals(MRule.EVENTTYPE_Callout) 
				  && rule.getRuleType().equals(MRule.RULETYPE_JSR223ScriptingAPIs))) {
				msg = "Callout " + cmd + " must be of type JSR 223 and event Callout"; 
				throw new AdempiereUserError(msg);
			}

			ScriptEngine engine = rule.getScriptEngine();

			// Window context are    W_
			// Login context  are    G_
			MRule.setContext(engine, getCtx(), 0);
			// now add the callout parameters windowNo, tab, field, value, oldValue to the engine 
			// Method arguments context are A_
			engine.put(MRule.ARGUMENTS_PREFIX + "Ctx", getCtx());
			engine.put(MRule.ARGUMENTS_PREFIX + "SendSchedule", sendScheduleProcess);
			engine.put(MRule.ARGUMENTS_PREFIX + "C_BPartner_ID", Integer.valueOf(bpID));
			engine.put(MRule.ARGUMENTS_PREFIX + "ConceptSource", conceptSource);
			engine.put(MRule.ARGUMENTS_PREFIX + "TrxName", get_TrxName());

			try 
			{
				retValueStr = engine.eval(rule.getScript()).toString();
				retValue = new BigDecimal(retValueStr);
			}
			catch (Exception e)
			{
				msg = "Callout Script Invalid: " + e.toString();
				log.log(Level.SEVERE, msg, e);
				throw new AdempiereUserError("Error executing script " + cmd);
			}
			
		} else {

			Object call = null;
			String methodName = null;
			int methodStart = cmd.lastIndexOf('.');
			try
			{
				if (methodStart != -1)      //  no class
				{
					Class<?> cClass = Class.forName(cmd.substring(0,methodStart));
					call = cClass.newInstance();
					methodName = cmd.substring(methodStart+1);
				}
			}
			catch (Exception e)
			{
				msg = "Callout Invalid: " + cmd + " (" + e.toString() + ")";
				throw new AdempiereUserError(msg);
			}

			if (call == null || methodName == null ||methodName.length() == 0) {
				msg = "Callout Invalid: " + methodName;
				throw new AdempiereUserError(msg);
			}

			try
			{
				if (methodName == null || methodName.length() == 0)
					throw new IllegalArgumentException ("No Method Name");
				
				Method method = call.getClass().getMethod(methodName, Properties.class, X_LCO_DIAN_SendSchedule.class, Integer.class, X_LCO_DIAN_ConceptSource.class, String.class);

				//	Call Method
				try
				{
					retValue = (BigDecimal) method.invoke(call, getCtx(), sendScheduleProcess, new Integer(bpID), conceptSource, get_TrxName());
				}
				catch (Exception e)
				{
					Throwable ex = e.getCause();	//	InvocationTargetException
					if (ex == null)
						ex = e;
					log.log(Level.SEVERE, "start: " + methodName, ex);
					ex.printStackTrace(System.err);
					retValueStr = ex.getLocalizedMessage();
					throw new AdempiereUserError("Error invoking callout " + cmd + " " + retValueStr);
				}
				return retValue;
			}
			catch (Exception e)
			{
				msg = 	"Callout Invalid: " + e.toString();
				log.log(Level.SEVERE, msg, e);
				throw new AdempiereUserError("Error with method callout " + cmd);
			}
		}			

		return retValue;
	}

}	//	MLCODIANConcept