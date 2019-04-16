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


/**
 * Payment Withholding Line Model
 *
 * @author Marcos Zúñiga - http://www.comit.com.ar
 *
 */
public class MLARPaymentWithholdingLine extends X_LAR_PaymentWithholdingLine
{

    private static final long serialVersionUID = -3124217886297209551L;

    public MLARPaymentWithholdingLine(Properties ctx, int LAR_PaymentWithholdingLine_ID, String trxName)
    {
        super(ctx, LAR_PaymentWithholdingLine_ID, trxName);
    }

    public MLARPaymentWithholdingLine(Properties ctx, ResultSet rs, String trxName)
    {
        super(ctx, rs, trxName);
    }
}