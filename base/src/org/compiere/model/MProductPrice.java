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

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;

/**
 *	Product Price
 *	
 *  @author Jorg Janke
 *  @version $Id: MProductPrice.java,v 1.3 2006/07/30 00:51:02 jjanke Exp $
 */
public class MProductPrice extends X_M_ProductPrice
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 9187555438223385521L;

	/**
	 * 	Get Product Price
	 *	@param ctx ctx
	 *	@param M_PriceList_Version_ID id
	 *	@param M_Product_ID id
	 *	@param trxName trx
	 *	@return product price or null
	 */
	public static MProductPrice get (Properties ctx, int M_PriceList_Version_ID, int M_Product_ID,
		String trxName)
	{
		final String whereClause = MProductPrice.COLUMNNAME_M_PriceList_Version_ID +"=? AND "+MProductPrice.COLUMNNAME_M_Product_ID+"=?";
		MProductPrice retValue = new Query(ctx,I_M_ProductPrice.Table_Name,  whereClause, trxName)
		.setParameters(M_PriceList_Version_ID, M_Product_ID)
		.first();
		return retValue;
	}	//	get
	
	/**	Logger	*/
	private static CLogger s_log = CLogger.getCLogger (MProductPrice.class);
	
	/**
	 * 	Persistency Constructor
	 *	@param ctx context
	 *	@param ignored ignored
	 *	@param trxName transaction
	 */
	public MProductPrice (Properties ctx, int ignored, String trxName)
	{
		super(ctx, 0, trxName);
		if (ignored != 0)
			throw new IllegalArgumentException("Multi-Key");
		setPriceLimit (Env.ZERO);
		setPriceList (Env.ZERO);
		setPriceStd (Env.ZERO);
	}	//	MProductPrice

	/**
	 * 	Load Constructor
	 *	@param ctx context
	 *	@param rs result set
	 *	@param trxName transaction
	 */
	public MProductPrice (Properties ctx, ResultSet rs, String trxName)
	{
		super(ctx, rs, trxName);
	}	//	MProductPrice

	/**
	 * 	New Constructor
	 *	@param ctx context
	 *	@param M_PriceList_Version_ID Price List Version
	 *	@param M_Product_ID product
	 *	@param trxName transaction
	 */
	public MProductPrice (Properties ctx, int M_PriceList_Version_ID, int M_Product_ID, String trxName)
	{
		this (ctx, 0, trxName);
		setM_PriceList_Version_ID (M_PriceList_Version_ID);	//	FK
		setM_Product_ID (M_Product_ID);						//	FK
	}	//	MProductPrice

	/**
	 * 	New Constructor
	 *	@param ctx context
	 *	@param M_PriceList_Version_ID Price List Version
	 *	@param M_Product_ID product
	 *	@param PriceList list price
	 *	@param PriceStd standard price
	 *	@param PriceLimit limit price
	 *	@param trxName transaction
	 */
	public MProductPrice (Properties ctx, int M_PriceList_Version_ID, int M_Product_ID,
		BigDecimal PriceList, BigDecimal PriceStd, BigDecimal PriceLimit, String trxName)
	{
		this (ctx, M_PriceList_Version_ID, M_Product_ID, trxName);
		setPrices (PriceList, PriceStd, PriceLimit);
	}	//	MProductPrice

	/**
	 * 	Parent Constructor
	 *	@param plv price list version
	 *	@param M_Product_ID product
	 *	@param PriceList list price
	 *	@param PriceStd standard price
	 *	@param PriceLimit limit price
	 */
	public MProductPrice (MPriceListVersion plv, int M_Product_ID,
		BigDecimal PriceList, BigDecimal PriceStd, BigDecimal PriceLimit)
	{
		this (plv.getCtx(), 0, plv.get_TrxName());
		setClientOrg(plv);
		setM_PriceList_Version_ID(plv.getM_PriceList_Version_ID());
		setM_Product_ID(M_Product_ID);
		setPrices (PriceList, PriceStd, PriceLimit);
	}	//	MProductPrice
	
	/**
	 * 	Set Prices
	 *	@param PriceList list price
	 *	@param PriceStd standard price
	 *	@param PriceLimit limit price
	 */
	public void setPrices (BigDecimal PriceList, BigDecimal PriceStd, BigDecimal PriceLimit)
	{
		setPriceLimit (PriceLimit.setScale(this.getM_PriceList_Version().getM_PriceList().getPricePrecision(), BigDecimal.ROUND_HALF_UP)); 
		setPriceList (PriceList.setScale(this.getM_PriceList_Version().getM_PriceList().getPricePrecision(), BigDecimal.ROUND_HALF_UP)); 
		setPriceStd (PriceStd.setScale(this.getM_PriceList_Version().getM_PriceList().getPricePrecision(), BigDecimal.ROUND_HALF_UP));
	}	//	setPrice

    /** Establecer Categoría del Producto.
    @param M_Product_Category_ID
    Product, Service, Item
  */
	public void setM_ProductCategory_ID (int M_Product_Category_ID)
	{
	    if (M_Product_Category_ID < 1)
	        set_ValueNoCheck ("M_Product_Category_ID", 0);
	    else
	        set_ValueNoCheck ("M_Product_Category_ID", Integer.valueOf(M_Product_Category_ID));
	}

	/** Recuperar la Categoría del Producto.
	    @return ID de la Categoría o cero
	  */
	public int getM_ProductCategory_ID ()
	{
	    Integer ii = (Integer)get_Value("M_Product_Category_ID");
	    if (ii == null)
	         return 0;
	    return ii.intValue();
	}

    /**************************************************************************
     *  Before Save
     *  @param newRecord
     *  @return true if save
     */
    protected boolean beforeSave (boolean newRecord)
    {
        s_log.fine("New=" + newRecord);

        // @fchiappano Actualizar precios.
        String sql = "SELECT C_Tax_ID From C_Tax WHERE C_TaxCategory_ID=? AND IsDefault='Y'";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        int c_Tax_ID = 0;
        try
        {
            pstmt = DB.prepareStatement(sql, get_TrxName());
            pstmt.setInt(1, getM_Product().getC_TaxCategory_ID());
            rs = pstmt.executeQuery();

            if (rs.next())
                c_Tax_ID = rs.getInt(1);

            rs.close();
            pstmt.close();
        }
        catch (Exception e)
        {
            s_log.log(Level.SEVERE, "getName", e);
        }
        finally
        {
            pstmt = null;
            rs = null;
        }

        if (c_Tax_ID > 0)
        {
            int precision = this.getM_PriceList_Version().getM_PriceList().getPricePrecision();
            BigDecimal alic = Env.ONE.add(new MTax(getCtx(), c_Tax_ID, get_TrxName()).getRate().divide(
                    new BigDecimal(100), 3, RoundingMode.HALF_UP));

            // @fchiappano Determinar si la lista de precios tiene impuestos incluidos en el precio.
            boolean isTaxIncluded = getM_PriceList_Version().getM_PriceList().isTaxIncluded();

            // Actualizar precio Standart
            if (is_ValueChanged("PrecioStd_Final") && (!newRecord || (newRecord && ((BigDecimal) get_Value("PrecioStd_Final")).compareTo(Env.ZERO) != 0)))
            {
                if (isTaxIncluded)
                    setPriceStd((BigDecimal) get_Value("PrecioStd_Final"));
                else
                    setPriceStd(((BigDecimal) get_Value("PrecioStd_Final")).divide(alic, precision, RoundingMode.HALF_UP));

                // @fchiappano copiar precio estandar en precio de lista.
                set_ValueOfColumn("PrecioLista_Final", get_Value("PrecioStd_Final"));
            }
            else if (is_ValueChanged("PriceStd"))
            {
                if (isTaxIncluded)
                    set_ValueOfColumn("PrecioStd_Final", getPriceStd());
                else
                    set_ValueOfColumn("PrecioStd_Final", getPriceStd().multiply(alic));

                // @fchiappano copiar precio estandar en precio de lista.
                setPriceList(getPriceStd());
            }

            // Actualizar precio de Lista
            if (is_ValueChanged("PrecioLista_Final") && (!newRecord || (newRecord && ((BigDecimal) get_Value("PrecioLista_Final")).compareTo(Env.ZERO) != 0)))
            {
                if (isTaxIncluded)
                    setPriceList(((BigDecimal) get_Value("PrecioLista_Final")));
                else
                    setPriceList(((BigDecimal) get_Value("PrecioLista_Final")).divide(alic, precision, RoundingMode.HALF_UP));
            }
            else if (is_ValueChanged("PriceList"))
            {
                if (isTaxIncluded)
                    set_ValueOfColumn("PrecioLista_Final", getPriceList());
                else
                    set_ValueOfColumn("PrecioLista_Final", getPriceList().multiply(alic));
            }

            // Actualizar precio Limite
            if (is_ValueChanged("PrecioLimite_Final") && (!newRecord || (newRecord && ((BigDecimal) get_Value("PrecioLimite_Final")).compareTo(Env.ZERO) != 0)))
            {
                if (isTaxIncluded)
                    setPriceLimit((BigDecimal) get_Value("PrecioLimite_Final"));
                else
                    setPriceLimit(((BigDecimal) get_Value("PrecioLimite_Final")).divide(alic, precision,
                            RoundingMode.HALF_UP));
            }
            else if (is_ValueChanged("PriceLimit"))
            {
                if (isTaxIncluded)
                    set_ValueOfColumn("PrecioLimite_Final", getPriceLimit());
                else
                    set_ValueOfColumn("PrecioLimite_Final", getPriceLimit().multiply(alic));
            }
        }
        else
        {
            log.saveError("Error:", "No se pudo recuperar el impuesto del producto.");
            return false;
        }

        if (newRecord)
        {
            int m_Product_Category_ID = 0;
            // Recupera la categoría del producto desde le producto
            sql = "SELECT M_Product_Category_ID "
                + "  FROM M_Product "
                + " WHERE M_Product_ID=?";
            pstmt = null;
            try
            {
                pstmt = DB.prepareStatement(sql, get_TrxName());
                pstmt.setInt(1, getM_Product_ID());
                rs = pstmt.executeQuery();
                if (rs.next())
                    m_Product_Category_ID = rs.getInt(1);
                rs.close();
                pstmt.close();
                pstmt = null;
                if (m_Product_Category_ID < 0)
                    m_Product_Category_ID = 0;
            }
            catch (Exception e)
            {
                log.log(Level.SEVERE, "getName", e);
            }
            finally
            {
                try
                {
                    if (pstmt != null)
                        pstmt.close();
                }
                catch (Exception e)
                {}
                pstmt = null;
                rs = null;
            }

            // Establecer la categoría del Producto
            setM_ProductCategory_ID(m_Product_Category_ID);
        }

        return true;
    }   //  beforeSave

	/**
	 * 	String Representation
	 *	@return info
	 */
	public String toString()
	{
		StringBuffer sb = new StringBuffer ("MProductPrice[");
		sb.append(getM_PriceList_Version_ID())
			.append(",M_Product_ID=").append (getM_Product_ID())
			.append(",PriceList=").append(getPriceList())
			.append("]");
		return sb.toString ();
	} //	toString
	
}	//	MProductPrice
