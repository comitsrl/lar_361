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

import java.sql.ResultSet;
import java.util.Properties;

import org.compiere.util.DB;

public class MLCOConversion extends X_LCO_Conversion
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 7788660905380581865L;

	/**
	 * 	Standard Constructor
	 *	@param ctx context
	 *	@param LCO_Conversion_ID id
	 *	@param trxName transaction
	 */
	public MLCOConversion (Properties ctx, int LCO_Conversion_ID, String trxName)
	{
		super (ctx, LCO_Conversion_ID, trxName);

	}	//	MLCOConversion

	/**
	 * 	Load Constructor
	 *	@param ctx context
	 *	@param rs result set
	 *	@param trxName transaction
	 */
	public MLCOConversion (Properties ctx, ResultSet rs, String trxName)
	{
		super(ctx, rs, trxName);
	}	//	MLCOConversion

	/**
	 * 	getConvertedCode
	 */
	public static String getConvertedCode (Properties ctx, String tableName ,String columnName, String value, String internalCode, String trxName) {
		return DB.getSQLValueString(trxName, 
				"SELECT cvc.ExternalCode " +
				"FROM LCO_Conversion cv, LCO_ConversionCode cvc, AD_Table t, AD_Column c " +
				"WHERE cv.AD_Table_ID=t.AD_Table_ID " +
				"AND cv.AD_Column_ID=c.AD_Column_ID " +
				"AND t.AD_Table_ID=c.AD_Table_ID " +
				"AND cv.LCO_Conversion_ID=cvc.LCO_Conversion_ID " +
				"AND cvc.IsActive='Y' " +
				"AND cv.IsActive='Y' " +
				"AND t.TableName=? " +
				"AND c.ColumnName=? " +
				"AND cv.Value=? " +
				"AND cvc.InternalCode=?",
				new Object[] {tableName, columnName, value, internalCode});
	}

}
