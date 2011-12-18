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
import org.junit.Test;

import test.AdempiereTestCase;

/**
 * Unit test for LAR_TaxPayerType class
 *
 * @author Emiliano Pereyra
 */
public class LAR_TaxPayerTypeTest extends AdempiereTestCase
{
    private X_LCO_TaxPayerType taxPayerType_OK;
    private X_LCO_TaxPayerType taxPayerType_WRONG;
    private MBPartner bpartner_OK;
    private MBPartner bpartner_WRONG;

    @Override
    protected void setUp() throws Exception
    {
        super.setUp();
        taxPayerType_OK = new X_LCO_TaxPayerType(getCtx(), 0, getTrxName());
        taxPayerType_OK.setName("Exento");
        taxPayerType_OK.save();
        taxPayerType_WRONG = new X_LCO_TaxPayerType(getCtx(), 0, getTrxName());
        taxPayerType_WRONG.setName("TipoErroneo");
        taxPayerType_WRONG.save();

        bpartner_OK = new MBPartner(getCtx(), 118, getTrxName()); // Joe Block
        bpartner_OK.set_ValueOfColumn("LCO_TaxPayerType_ID", taxPayerType_OK.get_ID());

        bpartner_WRONG = new MBPartner(getCtx(), 120, getTrxName()); // Seed Farm Inc.
        bpartner_WRONG.set_ValueOfColumn("LCO_TaxPayerType_ID", taxPayerType_WRONG.get_ID());
        commit();
    }


    @Override
    protected void tearDown() throws Exception
    {
        bpartner_OK.set_ValueOfColumn("LCO_TaxPayerType_ID", null);
        bpartner_WRONG.set_ValueOfColumn("LCO_TaxPayerType_ID", null);
        taxPayerType_OK.delete(true);
        taxPayerType_WRONG.delete(true);
        commit();
        super.tearDown();
    }

    @Test
    public void testGetTaxPayerTypeOK()
    {
        LAR_TaxPayerType type = LAR_TaxPayerType.getTaxPayerType(bpartner_OK);
        assertEquals(LAR_TaxPayerType.EXENTO.getName(), type.getName());
    }

    @Test
    public void testGetTaxPayerTypeWrong()
    {
        try {
            LAR_TaxPayerType.getTaxPayerType(bpartner_WRONG);
            fail("Type should not exists");
        } catch (AdempiereException e) {
            // TEST OK
        }
    }
}
