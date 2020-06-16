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
package org.compiere.model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.util.CLogger;
import org.compiere.util.DB;


/**
 *	Preference Model
 *	
 *  @author Jorg Janke
 *  @version $Id: MPreference.java,v 1.3 2006/07/30 00:51:03 jjanke Exp $
 */
public class MPreference extends X_AD_Preference
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -5098559160325123593L;
	/**	Null Indicator				*/
	public static String		NULL = "null";
    private static CLogger log = CLogger.getCLogger(MPreference.class);

	/**
	 * 	Standatrd Constructor
	 *	@param ctx ctx
	 *	@param AD_Preference_ID id
	 *	@param trxName transaction
	 */
	public MPreference(Properties ctx, int AD_Preference_ID, String trxName)
	{
		super(ctx, AD_Preference_ID, trxName);
		if (AD_Preference_ID == 0)
		{
		//	setAD_Preference_ID (0);
		//	setAttribute (null);
		//	setValue (null);
		}
	}	//	MPreference

	/**
	 * 	Load Contsructor
	 *	@param ctx context
	 *	@param rs result set
	 *	@param trxName transaction
	 */
	public MPreference(Properties ctx, ResultSet rs, String trxName)
	{
		super(ctx, rs, trxName);
	}	//	MPreference

	/**
	 * 	Full Constructor
	 *	@param ctx context
	 *	@param Attribute attribute
	 *	@param Value value
	 *	@param trxName trx
	 */
	public MPreference (Properties ctx, String Attribute, String Value, String trxName)
	{
		this (ctx, 0, trxName);
		setAttribute (Attribute);
		setValue (Value);
	}	//	MPreference

	/**
	 * 	Before Save
	 *	@param newRecord
	 *	@return true if can be saved
	 */
	protected boolean beforeSave (boolean newRecord)
	{
		String value = getValue();
		if (value == null)
			value = "";
		if (value.equals("-1"))
			setValue("");
		return true;
	}	//	beforeSave

	/**
	 * 	String Representation
	 *	@return info
	 */
	public String toString ()
	{
		StringBuffer sb = new StringBuffer ("MPreference[");
		sb.append (get_ID()).append("-")
			.append(getAttribute()).append("-").append(getValue())
			.append ("]");
		return sb.toString ();
	}	//	toString

	/**
	 * Obtener Preferencia a nivel Organización, mediante el campo Attribute.
	 *
	 * @param AD_Client_ID
	 * @param AD_Org_ID
	 * @param atributo
	 * @param ctx
	 * @param trx
	 * @return MPreference
	 */
    public static MPreference getOrgPreference(final int AD_Client_ID, final int AD_Org_ID, final String atributo,
                                                final Properties ctx, final String trx)
    {
        String sql = "SELECT AD_Preference_ID"
                   + "  FROM AD_Preference "
                   + " WHERE AD_Client_ID=? AND AD_Org_ID=? AND Attribute=?";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MPreference preference = null;
        try
        {
            pstmt = DB.prepareStatement(sql, null);
            pstmt.setInt(1, AD_Client_ID);
            pstmt.setInt(2, AD_Org_ID);
            pstmt.setString(3, atributo);
            rs = pstmt.executeQuery();
            if (rs.next())
            {
                preference = new MPreference(ctx, rs.getInt("AD_Preference_ID"), trx);
            }
        }
        catch (SQLException eSql)
        {
            log.log(Level.SEVERE, sql, eSql);
        }
        finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }
        return preference;
    } // getOrgPreference

    /**
     * Obtener Preferencia a nivel de Compañia, mediante el campo Attribute.
     * @author fchiappano
     *
     * @param AD_Client_ID
     * @param atributo
     * @param ctx
     * @param trx
     * @return MPreference
     */
    public static MPreference getClientPreference(final int AD_Client_ID, final String atributo,
                                                final Properties ctx, final String trx)
    {
        String sql = "SELECT AD_Preference_ID"
                   + "  FROM AD_Preference "
                   + " WHERE AD_Client_ID=? AND Attribute=?";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        MPreference preference = null;
        try
        {
            pstmt = DB.prepareStatement(sql, null);
            pstmt.setInt(1, AD_Client_ID);
            pstmt.setString(2, atributo);
            rs = pstmt.executeQuery();
            if (rs.next())
            {
                preference = new MPreference(ctx, rs.getInt("AD_Preference_ID"), trx);
            }
        }
        catch (SQLException eSql)
        {
            log.log(Level.SEVERE, sql, eSql);
        }
        finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }
        return preference;
    } // getClientPreference

}	//	MPreference
