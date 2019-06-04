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
import org.compiere.process.M_PriceList_Create;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereUserError;
import org.compiere.util.DB;
import org.compiere.util.DisplayType;

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
            else
            {
                log.log(Level.SEVERE, "Unknown Parameter: " + name);
            }
        }
    } // prepare

    @Override
    protected String doIt() throws Exception
    {
        listaMadre = new MPriceList(getCtx(), getRecord_ID(), get_TrxName());

        // @fchiappano Obtener la lista de precios base.
        int m_PriceListBase_ID = getM_PriceListBase_ID();

        if (m_PriceListBase_ID <= 0)
            throw new AdempiereUserError("No fue posible recuperar, una lista de precios BASE.");

        // @fchiappano Recuperar la ultima version vigente de la lista madre.
        MPriceListVersion versionMadre = getMPriceListVersion(listaMadre.getM_PriceList_ID());

        if (versionMadre == null)
            throw new AdempiereUserError("No existe, una versión vigente, para la lista de precios Madre.");

        // @fchiappano Desactivar versión BASE anterior.
        MPriceListVersion versionBaseAnterior = getMPriceListVersion(m_PriceListBase_ID);
        versionBaseAnterior.setIsActive(false);
        versionBaseAnterior.saveEx(get_TrxName());

        // @fchiappano Crear nueva Versión de Lista de precios BASE.
        MPriceList listaBase = new MPriceList(getCtx(), m_PriceListBase_ID, get_TrxName());
        MPriceListVersion versionBase = new MPriceListVersion(getCtx(), 0, get_TrxName());
        versionBase.setValidFrom(new Timestamp(System.currentTimeMillis()));
        versionBase.setM_PriceList_ID(m_PriceListBase_ID);
        versionBase.setM_DiscountSchema_ID(listaBase.get_ValueAsInt("M_DiscountSchema_ID"));
        versionBase.setAD_Org_ID(0);
        versionBase.setName(listaBase.getName() + " " + DisplayType.getDateFormat(DisplayType.Date).format(versionBase.getValidFrom()));
        versionBase.saveEx(get_TrxName());

        // @fchiappano Obtener los precios de la version madre.
        MProductPrice[] preciosMadre = versionMadre.getProductPrice("");

        // @fchiappano Recorrer precios y convertirlos a pesos en la version
        // base.
        for (int x = 0; x < preciosMadre.length; x++)
        {
            MProductPrice precioMadre = preciosMadre[x];
            MProduct producto = (MProduct) precioMadre.getM_Product();
            MProductPrice precioBase = new MProductPrice(getCtx(), versionBase.get_ID(), producto.getM_Product_ID(),
                    get_TrxName());
            int monedaPredeterminada = LAR_Utils.getMonedaPredeterminada(getCtx(), getAD_Client_ID(), get_TrxName());
            int monedaProducto = producto.get_ValueAsInt("C_Currency_ID");

            // @fchiappano Si la moneda configurada en el producto, es distinta
            // de la moneda predeterminada en el ERP, aplico conversion de
            // moneda.
            if (monedaProducto > 0 && monedaProducto != monedaPredeterminada)
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
        }

        // @fchiappano Obtener, las demas lista de precios.
        List<MPriceList> listasPrecios = getListasPrecios();

        for (MPriceList lista : listasPrecios)
        {       
            int listaBase_ID = lista.get_ValueAsInt("BasePriceList_ID");
            int esquema_ID = lista.get_ValueAsInt("M_DiscountSchema_ID");

            // @fchiappano validar que la lista de precios tengo una lista base y un esquema configurado.
            if (listaBase_ID <= 0 || esquema_ID <= 0)
                throw new AdempiereUserError("Lista de Precios: " + lista.getName() + ".\n"
                                       + "No posee una Lista de Precios Base o un Esquema de Descuento configurados.");

            // @fchiappano desactivar la ultima versión de la lista de precios (vesión anterior).
            MPriceListVersion versionAnterior = getMPriceListVersion(lista.getM_PriceList_ID());
            versionAnterior.setIsActive(false);
            versionAnterior.saveEx(get_TrxName());

            // @fchiappano Crear nueva versión.
            MPriceListVersion version = new MPriceListVersion(getCtx(), 0, get_TrxName());
            version.setM_PriceList_ID(lista.getM_PriceList_ID());
            version.setAD_Org_ID(0);
            version.setValidFrom(new Timestamp(System.currentTimeMillis()));
            version.setName(lista.getName() + " " + DisplayType.getDateFormat(DisplayType.Date).format(version.getValidFrom()));

            // @fchiappano chequear si la lista de precios base configurada,
            // esta marcada como predeterminada, utilizar la version base. Caso
            // contrario, recuperar la ultima version de la lista base.
            MPriceList base = new MPriceList(getCtx(), listaBase_ID, get_TrxName());
            if (!base.isDefault())
                version.setM_Pricelist_Version_Base_ID(versionBase.get_ID());
            else
                version.setM_Pricelist_Version_Base_ID(getMPriceListVersion(listaBase_ID).getM_PriceList_Version_ID());

            version.setM_DiscountSchema_ID(esquema_ID);
            version.saveEx(get_TrxName());

            M_PriceList_Create create = new M_PriceList_Create();
            if (!create.crearVersionLP(version.get_ID(), "N", getAD_PInstance_ID(), get_TrxName()))
                throw new AdempiereUserError("Error al actualizar lista de precios: " + lista.getName() + ".");
        }

        return  "Listas Actualzadas: " + (listasPrecios.size() + 1);
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
     * Obtener la versión vigente, de la lista de precios.
     *
     * @author fchiappano
     * @return M_PriceListVersion_ID
     */
    private MPriceListVersion getMPriceListVersion(int m_PriceList_ID)
    {
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
    } // getM_PriceListVersion_ID

    /**
     * Obtener listas de precios a actualizar.
     *
     * @author fchiappano
     * @return
     */
    private List<MPriceList> getListasPrecios()
    {
        List<MPriceList> listasPrecios = new ArrayList<MPriceList>();

        String soPriceList = listaMadre.isSOPriceList() == true ? "'Y'" : "'N'";
        String sql = "SELECT M_PriceList_ID"
                   +  " FROM M_PriceList"
                   + " WHERE IsActive = 'Y'"
                   +   " AND EsListaMadre = 'N'"
                   +   " AND IsDefault = 'N'"
                   +   " AND AD_Client_ID = ?"
                   +   " AND IsSOPriceList = " + soPriceList;

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
