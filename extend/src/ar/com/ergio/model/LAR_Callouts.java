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

import java.util.Properties;

import org.compiere.model.CalloutEngine;
import org.compiere.model.GridField;
import org.compiere.model.GridTab;
import org.compiere.util.AdempiereSystemError;

/**
 * Callouts for Localization Argentina
 *
 * @author Emiliano Gonzalez - Ergio=energia+evolucion - http://www.ergio.com.ar
 * @version $Id: LAR_Callouts.java,v 1.0 2011/11/04 egonzalez Exp $
 **/
public class LAR_Callouts extends CalloutEngine
{

    public String normalizeCuit(Properties ctx, int windowNo, GridTab mTab, GridField mField,
            Object value) throws AdempiereSystemError
    {
        String localValue = ((String) mTab.getValue("TaxID")).replaceAll("[^0123456789]", "");
        mTab.setValue("TaxID", localValue);
        return "";
    }

    public String normalizeIibb(Properties ctx, int windowNo, GridTab mTab, GridField mField,
            Object value) throws AdempiereSystemError
    {
        mTab.setValue("DUNS", ((String) mTab.getValue("DUNS")).replaceAll("[^0123456789]", ""));
        return "";
    }
}
