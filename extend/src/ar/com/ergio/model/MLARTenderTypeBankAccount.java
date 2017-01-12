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

import org.compiere.model.MPayment;

public class MLARTenderTypeBankAccount extends X_LAR_TenderType_BankAccount
{

    /**
     *
     */
    private static final long serialVersionUID = 242815515393907544L;

    public MLARTenderTypeBankAccount(Properties ctx, ResultSet rs, String trxName)
    {
        super(ctx, rs, trxName);
    }

    public MLARTenderTypeBankAccount(Properties ctx, int LAR_TenderType_BankAccount_ID, String trxName)
    {
        super(ctx, LAR_TenderType_BankAccount_ID, trxName);
    }

    /******************************************************************
     * Before Save
     * @param newRecord new
     * @return save
     */
    protected boolean beforeSave(boolean newRecord)
    {
        // Limpiar los campos que estan ligados a otro TenderType.
        final String tenderType = getTenderType();

        if (tenderType.equals(MPayment.TENDERTYPE_CreditCard))
        {
            set_ValueOfColumn("LAR_Tarjeta_Debito_ID", null);
            set_ValueOfColumn("LAR_Deposito_Directo_ID", null);
        }
        else if (tenderType.equals(MPayment.TENDERTYPE_DirectDebit))
        {
            set_ValueOfColumn("LAR_Tarjeta_Credito_ID", null);
            set_ValueOfColumn("LAR_Deposito_Directo_ID", null);
        }
        else if (tenderType.equals(MPayment.TENDERTYPE_DirectDeposit))
        {
            set_ValueOfColumn("LAR_Tarjeta_Credito_ID", null);
            set_ValueOfColumn("LAR_Tarjeta_Debito_ID", null);
        }
        else
        {
            set_ValueOfColumn("LAR_Tarjeta_Credito_ID", null);
            set_ValueOfColumn("LAR_Tarjeta_Debito_ID", null);
            set_ValueOfColumn("LAR_Deposito_Directo_ID", null);
        }

        return true;
    } // beforeSave
} // MLARTenderTypeBankAccount
