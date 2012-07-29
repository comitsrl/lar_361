/******************************************************************************
* Product: Adempiere ERP & CRM Smart Business Solution *
* Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved. *
* This program is free software; you can redistribute it and/or modify it *
* under the terms version 2 of the GNU General Public License as published *
* by the Free Software Foundation. This program is distributed in the hope *
* that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
* warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. *
* See the GNU General Public License for more details. *
* You should have received a copy of the GNU General Public License along *
* with this program; if not, write to the Free Software Foundation, Inc., *
* 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA. *
* For the text or an alternative of this public license, you may reach us *
* ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA *
* or via info@compiere.org or http://www.compiere.org/license.html *
*****************************************************************************/
package ar.com.ergio.model;

import java.math.BigDecimal;
import java.util.Properties;

import org.compiere.model.CalloutEngine;
import org.compiere.model.GridField;
import org.compiere.model.GridTab;
import org.compiere.model.MPayment;
import org.compiere.util.Env;

/**
 * Withholding Callouts for Localization Argentina
 *
 * @author Emiliano Pereyra - http://www.ergio.com.ar
 *
 */
public class LAR_CalloutWithholding extends CalloutEngine
{
    // Called from C_Payment.WriteOffAmt
    public String withholdingTax(Properties ctx, int WindowNo, GridTab mTab, GridField mField,
            Object value, Object oldValue)
    {
        if (isCalloutActive())
            return "";

        BigDecimal writeOffAmt = (BigDecimal) value;
        // if writeoff is zero, reset related values
        if (writeOffAmt == null || writeOffAmt.compareTo(Env.ZERO) == 0)
        {
            mTab.setValue("C_TaxWithholding_ID", null);
            mTab.setValue("WithholdingCertNo", null);
        }
        // if writeoffamt is greater tha zero, TT is always cash
        if (writeOffAmt == null || writeOffAmt.compareTo(Env.ZERO) > 0)
            mTab.setValue("TenderType", MPayment.TENDERTYPE_Cash);

        return "";
    }
}