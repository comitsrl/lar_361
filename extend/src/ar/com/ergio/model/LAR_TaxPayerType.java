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

import org.adempiere.exceptions.AdempiereException;
import org.compiere.model.MBPartner;
import org.globalqss.model.X_LCO_TaxPayerType;

/**
 * Enumeration for tax payer types
 *
 * @author Emiliano Pereyra
 */
public enum LAR_TaxPayerType {
    NO_CATEGORIZADO("NoCategorizado"),
    RESPONSABLE_MONOTRIBUTO("ResponsableMonotributo"),
    EXENTO("Exento"),
    RESPONSABLE_INSCRIPTO("ResponsableInscripto"),
    CONSUMIDOR_FINAL("ConsumidorFinal");

    private final String name;

    private LAR_TaxPayerType(String name)
    {
        this.name = name;
    }

    /**
     * Returns the tax payer type for a given bpartner
     * @param bp bpartner
     * @return tax payer type enum
     */
    public static LAR_TaxPayerType getTaxPayerType(final MBPartner bp)
    {
        int taxPayerType_ID = bp.get_ValueAsInt("LCO_TaxPayerType_ID");
        X_LCO_TaxPayerType type = new X_LCO_TaxPayerType(bp.getCtx(), taxPayerType_ID, bp.get_TrxName());
        String typeName = type.getName();
        for (LAR_TaxPayerType e : values()) {
            if (e.name.equals(typeName)) {
                return e;
            }
        }
        throw new AdempiereException("Tax Payer Type configured not found");
    }

    public String getName()
    {
        return name;
    }

    @Override
    public String toString()
    {
        return getName();
    }
}
