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
package ar.com.ergio.process;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;

import org.compiere.model.MPriceList;
import org.compiere.model.MPriceListVersion;
import org.compiere.model.MSysConfig;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.DB;
import org.compiere.util.Env;

/**
 * Desactivar versiones de Lista de Precios antiguas.
 *
 * @author fchiappano
 *
 */
public class LAR_DesactivarVersionesListaPrecios extends SvrProcess
{
    @Override
    protected void prepare()
    {
        ProcessInfoParameter[] para = getParameter();
        for (int i = 0; i < para.length; i++)
        {
            String name = para[i].getParameterName();

            if (para[i].getParameter() == null)
                ;
            else
            {
                log.log(Level.SEVERE, "Unknown Parameter: " + name);
            }
        }
    } // prepare

    @Override
    protected String doIt() throws Exception
    {
        // @fchiappano Obtener listas de precios.
        List<MPriceList> listasPrecios = getListasPrecios();

        // @fchiappano Obtener el parametro que marca la cantidad de días de
        // antiguadad permitida para las versiones de lista de precios.
        int dias = MSysConfig.getIntValue("LAR_DiasDesactivar_VersionesListaPrecios", 0, Env.getAD_Client_ID(getCtx()));

        for (MPriceList lista : listasPrecios)
        {
            // @fchiappano Obtener versiones activas.
            List<MPriceListVersion> versiones = getMPriceListVersion(lista.getM_PriceList_ID());

            for (MPriceListVersion version : versiones)
            {
                long diffTime = System.currentTimeMillis() - version.getValidFrom().getTime();
                int diffDias = (int) TimeUnit.DAYS.convert(diffTime, TimeUnit.MILLISECONDS);

                // @fchiappano desactivar versión de la lista de precios.
                if (diffDias >= dias)
                {
                    version.setIsActive(false);
                    version.saveEx(get_TrxName());
                }
            }
        }

        return  "";
    } // doIt

    /**
     * Obtener versiones de lista de precios activas.
     *
     * @author fchiappano
     * @return M_PriceListVersion_ID
     */
    private List<MPriceListVersion> getMPriceListVersion(final int m_PriceList_ID)
    {
        List<MPriceListVersion> versiones = new ArrayList<MPriceListVersion>();

        String sql = "SELECT plv.M_PriceList_Version_ID"
                   +  " FROM M_PriceList_Version plv"
                   + " WHERE plv.IsActive = 'Y'"
                   +   " AND plv.ValidFrom <= Now()"
                   +   " AND plv.M_PriceList_ID = ?"
                   + " ORDER BY plv.ValidFrom DESC";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            pstmt = DB.prepareStatement(sql, get_TrxName());
            pstmt.setInt(1, m_PriceList_ID);
            rs = pstmt.executeQuery();

            // @fchiappano ejecutar next, de manera que se descarte la ultima versión vigente.
            rs.next();

            while (rs.next())
            {
                versiones.add(new MPriceListVersion(getCtx(), rs.getInt(1), get_TrxName()));
            }
        }
        catch (Exception e)
        {
            log.log(Level.SEVERE, sql, e);
        }
        finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }

        return versiones;
    } // getM_PriceListVersion_ID

    /**
     * Obtener listas de precios a desactivar.
     *
     * @author fchiappano
     * @return
     */
    private List<MPriceList> getListasPrecios()
    {
        List<MPriceList> listasPrecios = new ArrayList<MPriceList>();

        String sql = "SELECT M_PriceList_ID"
                   +  " FROM M_PriceList"
                   + " WHERE IsActive = 'Y'"
                   +   " AND EsListaMadre = 'N'"
                   +   " AND AD_Client_ID = ?"
                   +   " AND IsSOPriceList = 'Y'"
                   + " ORDER BY OrdenActualizacion ASC";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            pstmt = DB.prepareStatement(sql, get_TrxName());
            pstmt.setInt(1, getAD_Client_ID());
            rs = pstmt.executeQuery();

            while (rs.next())
            {
                MPriceList lista = new MPriceList(getCtx(), rs.getInt(1), get_TrxName());
                listasPrecios.add(lista);
            }
        }
        catch (Exception e)
        {
            log.log(Level.SEVERE, sql, e);
        }
        finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }

        return listasPrecios;
    } // getListasPrecios

} // LAR_ChequeEnCarteraPorCaja
