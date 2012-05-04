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

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.apps.ADialog;
import org.compiere.model.MPayment;
import org.compiere.util.CLogger;
import org.compiere.util.DB;

/**
 * Payment Header
 *
 * @author Wagner Germán
 *
 * @contributor Marcos Zuñiga - http://www.ergio.com.ar
 */
public class MLARPaymentHeader extends X_LAR_PaymentHeader
{
	/**
	 *
	 */
	private static final long serialVersionUID = -2698873064570244615L;

	/**	Logger							*/
	private static CLogger	s_log = CLogger.getCLogger (MLARPaymentHeader.class);

	/**************************************************************************
	 * 	Payment Header Constructor
	 *	@param ctx context
	 *	@param A_Asset_ID asset
	 *	@param trxName transaction name
	 */
	public MLARPaymentHeader (Properties ctx, int LAR_PaymentHeader_ID, String trxName)
	{
		super (ctx, LAR_PaymentHeader_ID, trxName);
	}	//	MLARPaymentHeader

	/**
	 *  Load Constructor
	 *  @param ctx context
	 *  @param rs result set record
	 *	@param trxName transaction
	 */
	public MLARPaymentHeader (Properties ctx, ResultSet rs, String trxName)
	{
		super(ctx, rs, trxName);
	}	//	MLARPaymentHeader


	protected boolean beforeSave(boolean newRecord)
	{
	    // TODO - Think about implement a determination of DocType similar to in MPayment.beforeSave()
		if(!newRecord)
		{
			MPayment[] pays;
			try
			{
				pays = getPayments(get_TrxName());
			}
			catch (SQLException e)
			{
				s_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
				return false;
			}
            for (int i = 0; i < pays.length; i++)
			{
				pays[i].setC_DocType_ID(getC_DocType_ID());
				pays[i].setDocumentNo(getDocumentNo());
				pays[i].setDateTrx(getDateTrx());
				pays[i].setDateAcct(getDateTrx());
				pays[i].setC_BPartner_ID(getC_BPartner_ID());
				pays[i].setIsReceipt(isReceipt());
				pays[i].setIsActive(isActive());
				if(!pays[i].save(get_TrxName()))
				{
					try
					{
						DB.rollback(false, get_TrxName());
					}
					catch (SQLException e)
					{
					    s_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
					}
					return false;
				}
			}
		}
		return true;
	}

	/**
	 * @param success
	 */
	protected boolean afterDelete(boolean success)
	{
		if(success)
		{
			try
			{
                MPayment[] pays = getPayments(get_TrxName());
                for (int i = 0; i < pays.length; i++)
                {
					if(!pays[i].delete(false, get_TrxName()))
					{
						String msg = "No se pudo eliminar alguno de los pagos vinculados al documento que" +
								"se está eliminando. Se cancelará la operación";
						s_log.severe(msg);
						ADialog.error(0, null, msg);
						return false;
					}
                }
			}
			catch (SQLException e)
			{
			    s_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
				return false;
			}
		}
		return success;
	}

	/**
	 * Devuelve un array con todos los payments vinculados a la cabecera
	 * @param trxName
	 * @return MPayment[] array con los pagos vinculados al documento
	 * @throws SQLException
	 */
	public MPayment[] getPayments(String trxName) throws SQLException
	{
	    //TODO - Analize genereate a cache for this payments
		List<MPayment> pays = new ArrayList<MPayment>();

        String sql = "SELECT * FROM C_Payment WHERE LAR_PaymentHeader_ID = ?";

		PreparedStatement pstmt;
		pstmt = DB.prepareStatement(sql, trxName);
		ResultSet rs=null;

		try
		{
		    pstmt.setInt(1, getLAR_PaymentHeader_ID());
			rs = pstmt.executeQuery();
			while(rs.next())
				pays.add(new MPayment(getCtx(),rs,trxName));
		}
		catch (SQLException e)
		{
			DB.close(rs, pstmt);
			throw e;
		}
		finally
		{
			DB.close(rs, pstmt);
			rs = null; pstmt = null;
		}

		return pays.toArray(new MPayment[pays.size()]);
	}

	/**
	 * 	Process document
	 *	@param processAction document action
	 *	@return true if performed
	 */
	public boolean processIt (String processAction)
	{
	    s_log.info(toString());
		MPayment[] pays;
		try
		{
			pays = getPayments(get_TrxName());
		}
		catch (SQLException e)
		{
		    s_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
			return false;
		}

		for(int i = 0; i < pays.length; i++)
		{
			if(!pays[i].processIt(processAction))
			{
				try
				{
					DB.rollback(false, get_TrxName());
				}
				catch (SQLException e)
				{
				    s_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
				}
				return false;
			}
			if(!pays[i].save(get_TrxName()))
			{
				try
				{
					DB.rollback(false, get_TrxName());
				}
				catch (SQLException e)
				{
				    s_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
				}
				return false;
			}
		}

		if(!isProcessed())
			setProcessed(true);

		setDocStatus(processAction);

		if(!save())
		{
			try
			{
				DB.rollback(false, get_TrxName());
			}
			catch (SQLException e)
			{
			    s_log.log(Level.SEVERE, e.getLocalizedMessage(), e);
			}
			return false;
		}
		return true;

	}	//	process

	@Override
	public String toString()
	{
        StringBuffer sb = new StringBuffer ("MLARPaymentHeader[");
        sb.append(get_ID()).append("-").append(getDocumentNo())
            .append(",Receipt=").append(isReceipt())
            .append(",DocStatus=").append(getDocStatus())
            .append ("]");
        return sb.toString ();
	}
}	//	MLARPaymentHeader
