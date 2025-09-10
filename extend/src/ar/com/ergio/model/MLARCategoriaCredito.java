/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2007 ComPiere, Inc. All Rights Reserved.                *
 * This program is free software, you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY, without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program, if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
package ar.com.ergio.model;

import java.sql.ResultSet;
import java.util.Properties;

import org.compiere.util.DB;

public class MLARCategoriaCredito extends X_LAR_CategoriaCredito implements I_LAR_CategoriaCredito
{
    private static final long serialVersionUID = -7961572515771752060L;

    /** Standard Constructor */
    public MLARCategoriaCredito (Properties ctx, int LAR_CategoriaCredito_ID, String trxName)
    {
      super (ctx, LAR_CategoriaCredito_ID, trxName);
    }

    /** Load Constructor */
    public MLARCategoriaCredito (Properties ctx, ResultSet rs, String trxName)
    {
      super (ctx, rs, trxName);
    }

    /**
     *  After Save
     *  @param newRecord new
     *  @param success success
     *  @return true if can be saved
     */
    protected boolean afterSave (boolean newRecord, boolean success)
    {
        if (!success || newRecord)
            return success;

        if (isActive())
        {
            String sql = "UPDATE C_BPartner bp"
                       +   " SET SO_CreditLimit = " + getSO_CreditLimit()
                       + " WHERE LAR_CategoriaCredito_ID=" + getLAR_CategoriaCredito_ID();
            int no = DB.executeUpdate(sql, get_TrxName());
            log.fine("SdN Actualizados -> #" + no);
        }
        //
        return true;
    }   //  afterSave

} // MLARCategoriaCredito
