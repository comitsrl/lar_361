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

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

import org.compiere.model.MPriceList;
import org.compiere.model.MPriceListVersion;
import org.compiere.model.MProduct;
import org.compiere.model.MProductPrice;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereUserError;
import org.compiere.util.DB;

import ar.com.ergio.util.LAR_Utils;

/**
 * Generación masiva, de versiones de lista de precios.
 *
 * @author fchiappano
 *
 */
public class LAR_GenerarVersionesListasPrecios extends SvrProcess
{

    private MPriceList listaMadre = null;

    @Override
    protected void prepare()
    {
        ProcessInfoParameter[] para = getParameter();
        for (int i = 0; i < para.length; i++)
        {
            String name = para[i].getParameterName();

            if (para[i].getParameter() == null)
                ;
            else if (name.equals("M_PriceList_ID"))
            {
                listaMadre = new MPriceList(getCtx(), para[i].getParameterAsInt(), get_TrxName());
            }
            else
            {
                log.log(Level.SEVERE, "Unknown Parameter: " + name);
            }
        }
    } // prepare

    @Override
    protected String doIt() throws Exception
    {
        // @fchiappano Obtener la lista de precios base.
        int m_PriceListBase_ID = getM_PriceListBase_ID();

        if (m_PriceListBase_ID <= 0)
            throw new AdempiereUserError("No fue posible recuperar, una lista de precios BASE.");

        // @fchiappano Recuperar la ultima version vigente de la lista madre.
        MPriceListVersion versionMadre = getMPriceListVersionMadre();

        if (versionMadre == null)
            throw new AdempiereUserError("No existe, una versión vigente, para la lista de precios Madre.");

        // @fchiappano Crear nueva Versión de Lista de precios BASE.
        MPriceListVersion versionBase = new MPriceListVersion(getCtx(), 0, get_TrxName());
        versionBase.setValidFrom(new Timestamp(System.currentTimeMillis()));
        versionBase.setM_PriceList_ID(m_PriceListBase_ID);
        versionBase.saveEx(get_TrxName());

        // @fchiappano Obtener los precios de la version madre.
        MProductPrice[] preciosMadre = versionMadre.getProductPrice(true);

        // @fchiappano Recorrer precios y convertirlos a pesos en la version
        // base.
        for (int x = 0; x < preciosMadre.length; x++)
        {
            MProductPrice precioMadre = preciosMadre[x];
            MProduct producto = (MProduct) precioMadre.getM_Product();
            MProductPrice precioBase = new MProductPrice(getCtx(), m_PriceListBase_ID, producto.getM_Product_ID(),
                    get_TrxName());
            int monedaPredeterminada = LAR_Utils.getMonedaPredeterminada(getCtx(), getAD_Client_ID(), get_TrxName());
            int monedaProducto = producto.get_ValueAsInt("C_Currency_ID");

            // @fchiappano Si la moneda configurada en el producto, es distinta
            // de la moneda predeterminada en el ERP, aplico conversion de
            // moneda.
            if (monedaProducto != monedaPredeterminada)
            {
                BigDecimal tasaCambio = LAR_Utils.getTasaCambio(monedaProducto, monedaPredeterminada,
                        LAR_Utils.getTipoCambioPredeterminado(getAD_Client_ID(), get_TrxName()), getAD_Client_ID(), 0,
                        getCtx(), get_TrxName());

                BigDecimal precioStd = (BigDecimal) precioMadre.get_Value("PrecioStd_Final");
                BigDecimal precioLista = (BigDecimal) precioMadre.get_Value("PrecioLista_Final");
                BigDecimal precioLimite = (BigDecimal) precioMadre.get_Value("PrecioLimite_Final");

                precioStd = precioStd.multiply(tasaCambio).setScale(2, RoundingMode.HALF_UP);
                precioLista = precioLista.multiply(tasaCambio).setScale(2, RoundingMode.HALF_UP);
                precioLimite = precioLimite.multiply(tasaCambio).setScale(2, RoundingMode.HALF_UP);

                precioBase.set_ValueOfColumn("PrecioStd_Final", precioStd);
                precioBase.set_ValueOfColumn("PrecioLista_Final", precioLista);
                precioBase.set_ValueOfColumn("PrecioLimite_Final", precioLimite);
            }
            else
            {
                precioBase.set_ValueOfColumn("PrecioStd_Final", precioMadre.get_Value("PrecioStd_Final"));
                precioBase.set_ValueOfColumn("PrecioLista_Final", precioMadre.get_Value("PrecioLista_Final"));
                precioBase.set_ValueOfColumn("PrecioLimite_Final", precioMadre.get_Value("PrecioLimite_Final"));
            }

            precioBase.saveEx(get_TrxName());

            // @fchiappano Obtener, las demas lista de precios.
            
        }

        return null;
    } // doIt

    /**
     * Obtener el ID, de la lista de precios BASE (Marcada como predeterminada).
     *
     * @author fchiappano
     * @return M_PriceList_ID
     */
    private int getM_PriceListBase_ID()
    {
        String sql = "SELECT M_PriceList_ID"
                   +  " FROM M_PriceList"
                   + " WHERE IsActive = 'Y'"
                   +   " AND IsDefault = 'Y'"
                   +   " AND AD_Client_ID = ?"
                   +   " AND IsSOPriceList = ?";

        return DB.getSQLValue(get_TrxName(), sql, listaMadre.getAD_Client_ID(), listaMadre.isSOPriceList());
    } // getM_PriceListBase_ID

    /**
     * Obtener la versión vigente, de la lista de precios Madre.
     *
     * @author fchiappano
     * @return M_PriceListVersion_ID
     */
    private MPriceListVersion getMPriceListVersionMadre()
    {
        String sql = "SELECT plv.M_PriceListVersion_ID"
                   +  " FROM M_PriceListVersion plv"
                   + " WHERE plv.IsActive = 'Y'"
                   +   " AND plv.ValidFrom <= Now()"
                   +   " AND plv.M_PriceList_ID = ?"
                   + " ORDER BY plv.ValidFrom DESC";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            pstmt = DB.prepareStatement(sql, get_TrxName());
            pstmt.setInt(1, listaMadre.getM_PriceList_ID());
            rs = pstmt.executeQuery();

            if (rs.next())
                return new MPriceListVersion(getCtx(), rs.getInt(1), get_TrxName());

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

        return null;
    } // getM_PriceListVersionMadre_ID

    /**
     * Obtener listas de precios a actualizar.
     *
     * @author fchiappano
     * @return
     */
    private List<MPriceList> getListasPrecios()
    {
        List<MPriceList> listasPrecios = new ArrayList<MPriceList>();

        String sql = "";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            pstmt = DB.prepareStatement(sql, get_TrxName());
            pstmt.setInt(1, listaMadre.getM_PriceList_ID());
            rs = pstmt.executeQuery();

            while (rs.next())
            {
                
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
