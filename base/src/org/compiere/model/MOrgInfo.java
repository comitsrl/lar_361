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

import java.sql.ResultSet;
import java.util.Properties;

import org.compiere.util.CCache;

/**
 *	Organization Info Model
 *	
 *  @author Jorg Janke
 *  @version $Id: MOrgInfo.java,v 1.3 2006/07/30 00:58:37 jjanke Exp $
 *  
 *  @author Teo Sarca, www.arhipac.ro
 *  		<li>BF [ 2107083 ] Caching of MOrgInfo issue
 */
public class MOrgInfo extends X_AD_OrgInfo
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 2496591466841600079L;

	/**
	 * 	Load Constructor
	 *	@param ctx context
	 *	@param AD_Org_ID id
	 *	@return Org Info
	 *  @deprecated
	 */
	public static MOrgInfo get (Properties ctx, int AD_Org_ID)
	{
		return get(ctx, AD_Org_ID, null);
	}	//	get

	/**
	 * 	Load Constructor
	 *	@param ctx context
	 *	@param AD_Org_ID id
	 *  @param trxName
	 *	@return Org Info
	 */
	public static MOrgInfo get (Properties ctx, int AD_Org_ID, String trxName)
	{
		MOrgInfo retValue = s_cache.get(AD_Org_ID);
		if (retValue != null)
		{
			return retValue;
		}
		retValue = new Query(ctx, Table_Name, "AD_Org_ID=?", trxName)
						.setParameters(AD_Org_ID)
						.firstOnly();
		if (retValue != null)
		{
			s_cache.put(AD_Org_ID, retValue);
		}
		return retValue;
	}	//	get

	/**	Cache						*/
	private static CCache<Integer,MOrgInfo>	s_cache	= new CCache<Integer, MOrgInfo>(Table_Name, 50);

	
	/**************************************************************************
	 * 	Load Constructor
	 *	@param ctx context
	 *	@param rs result set
	 *	@param trxName transaction
	 */
	public MOrgInfo (Properties ctx, ResultSet rs, String trxName)
	{
		super(ctx, rs, trxName);
	}	//	MOrgInfo

	/**
	 * 	Organization constructor
	 *	@param org org
	 */
	public MOrgInfo (MOrg org)
	{
		super(org.getCtx(), 0, org.get_TrxName());
		setClientOrg(org);
		setDUNS ("?");
		setTaxID ("?");
	}	//	MOrgInfo

	// @fchiappano Codigo copiado desde Libertya.
    public static final int EXPORTTYPEFE_AD_Reference_ID = MReference.getReferenceID("Tipo de Exportación Electrónica");
    /** Exportación definitiva de Bienes = 1 */
    public static final String EXPORTTYPEFE_ExportaciónDefinitivaDeBienes = "1";
    /** Servicios = 2 */
    public static final String EXPORTTYPEFE_Servicios = "2";
    /** Otros = 4 */
    public static final String EXPORTTYPEFE_Otros = "4";

    /** Set Export Type FE */
    public void setExportTypeFE(String ExportTypeFE)
    {
        if (ExportTypeFE == null || ExportTypeFE.equals("1") || ExportTypeFE.equals("2") || ExportTypeFE.equals("4"))
            ;
        else
            throw new IllegalArgumentException(
                    "ExportTypeFE Invalid value - Reference = EXPORTTYPEFE_AD_Reference_ID - 1 - 2 - 4");
        if (ExportTypeFE != null && ExportTypeFE.length() > 1)
        {
            log.warning("Length > 1 - truncated");
            ExportTypeFE = ExportTypeFE.substring(0, 1);
        }
        set_Value("ExportTypeFE", ExportTypeFE);
    }

    /** Get Export Type FE */
    public String getExportTypeFE()
    {
        return (String) get_Value("ExportTypeFE");
    }
}
