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

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import org.compiere.util.DB;

/**
 *	Model class for format
 *	
 *  @author Carlos Ruiz - globalqss
 */
public class MLCODIANFormat extends X_LCO_DIAN_Format
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -3330647263228424556L;

	/**************************************************************************
	 * 	Default Constructor
	 *	@param ctx context
	 *	@param MLCOInvoiceWithholding_ID id
	 *	@param trxName transaction
	 */
	public MLCODIANFormat (Properties ctx, int LCO_DIAN_Format_ID, String trxName)
	{
		super(ctx, LCO_DIAN_Format_ID, trxName);
	}	//	MLCODIANFormat

	/**
	 * 	Load Constructor
	 *	@param ctx context
	 *	@param rs result set
	 *	@param trxName transaction
	 */
	public MLCODIANFormat(Properties ctx, ResultSet rs, String trxName)
	{
		super(ctx, rs, trxName);
	}	//	MLCODIANFormat

	/**
	 * 	Get Concepts of Format
	 *	@return array
	 * @throws SQLException 
	 */
	public MLCODIANConcept[] getConcepts () throws SQLException
	{
		String sql = "SELECT DISTINCT dc.* "
			+ "FROM LCO_DIAN_Concept dc "
			+ "JOIN LCO_DIAN_ConceptFormat dcf ON (dc.LCO_DIAN_Concept_ID = dcf.LCO_DIAN_Concept_ID)"
			+ " WHERE dcf.LCO_DIAN_Format_ID=? AND dc.IsActive='Y' AND dcf.IsActive='Y'";
		ArrayList<MLCODIANConcept> list = new ArrayList<MLCODIANConcept>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			pstmt = DB.prepareStatement(sql, get_TrxName());
			pstmt.setInt(1, getLCO_DIAN_Format_ID());
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				MLCODIANConcept cp = new MLCODIANConcept(getCtx(), rs, get_TrxName());
				list.add (cp);
			}
		} finally {
			DB.close(rs, pstmt);
			rs = null;
			pstmt = null;
		}
		
		MLCODIANConcept[] concepts = new MLCODIANConcept[list.size()];
		list.toArray(concepts);
		return concepts;
	}	//	getConcepts

	/**
	 * 	Get Concepts of Format
	 *	@return array
	 * @throws SQLException 
	 */
	public X_LCO_DIAN_FieldFormat[] getFields () throws SQLException
	{
		String sql = "SELECT DISTINCT dff.* "
			+ "FROM LCO_DIAN_FieldFormat dff "
			+ "WHERE dff.LCO_DIAN_Format_ID=? AND dff.IsActive='Y' ORDER BY Line";
		ArrayList<X_LCO_DIAN_FieldFormat> list = new ArrayList<X_LCO_DIAN_FieldFormat>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try
		{
			pstmt = DB.prepareStatement(sql, get_TrxName());
			pstmt.setInt(1, getLCO_DIAN_Format_ID());
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				X_LCO_DIAN_FieldFormat cp = new X_LCO_DIAN_FieldFormat(getCtx(), rs, get_TrxName());
				list.add (cp);
			}
		} finally {
			DB.close(rs, pstmt);
			rs = null;
			pstmt = null;
		}
		
		X_LCO_DIAN_FieldFormat[] fields = new X_LCO_DIAN_FieldFormat[list.size()];
		list.toArray(fields);
		return fields;
	}	//	getFields
	
}	//	MLCODIANFormat