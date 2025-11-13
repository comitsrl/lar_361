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
package ar.com.ergio.model;

import java.util.Properties;

import org.compiere.model.CalloutEngine;
import org.compiere.model.GridField;
import org.compiere.model.GridTab;
import org.compiere.model.MBPartner;

/**
 *	Socio del Negocio Callouts
 *
 *  @author Franco Chiappano - www.comit.com.ar
 */
public class CalloutBPartner extends CalloutEngine
{
    /**
     * C_Order - Order Defaults.
     *
     * @param ctx
     * @param WindowNo
     * @param mTab
     * @param mField
     * @param value
     * @return error message or ""
     */
    public String paymentRule(Properties ctx, int WindowNo, GridTab mTab, GridField mField, Object value)
    {
        String paymentRule = (String) value;

        // No Callout Active to fire dependent values
        if (isCalloutActive()) // prevent recursive
            return "";

        if (paymentRule.equals(MBPartner.PAYMENTRULE_OnCredit))
        {
            mTab.setValue(MBPartner.COLUMNNAME_SOCreditStatus, MBPartner.SOCREDITSTATUS_CreditOK);
        }
        // @fchiappano Contrarrembolso Contado y Contrarrembolso Cheque
        else if (paymentRule.equals("N") || paymentRule.equals("O"))
        {
            mTab.setValue(MBPartner.COLUMNNAME_SOCreditStatus, MBPartner.SOCREDITSTATUS_NoCreditCheck);
        }
        else if (paymentRule == null || !paymentRule.equals(MBPartner.PAYMENTRULE_OnCredit))
        {
            mTab.setValue(MBPartner.COLUMNNAME_SOCreditStatus, MBPartner.SOCREDITSTATUS_CreditHold);
        }
        return "";
    } // paymentRule

} // CalloutBPartner