/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2006 Adempiere, Inc. All Rights Reserved.               *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 *****************************************************************************/
package ar.com.ergio.model;

import org.compiere.util.CLogger;
import org.compiere.util.CPreparedStatement;
import org.compiere.util.DB;

import test.AdempiereTestCase;
import ar.com.ergio.print.fiscal.FiscalPrinterDevice;

public class MFiscalPrinterTest extends AdempiereTestCase
{
    /** Logger  */
    private static CLogger  log = CLogger.getCLogger(MFiscalPrinterTest.class);

    private int m_LAR_Fiscal_Printer_Type_ID = 1000001;
    private int m_LAR_Fiscal_Printer_ID = 1000001;

    @Override
    protected void setUp() throws Exception
    {
        super.setUp();
        // Fiscal Printer Type
        String insertTypes =
            "INSERT INTO LAR_Fiscal_Printer_Type (lar_fiscal_printer_type_id, ad_client_id, " +
            " ad_org_id, isactive, created, createdby, updated, updatedby, name, description, " +
            " parameters, clazz) " +
            "VALUES (?, ?, 0, 'Y', now(), ?, now(), ?, 'TestType', 'TestTypeDesc', " +
            " 'param1,param2', 'ar.com.ergio.print.fiscal.hasar.HasarPrinterP320F')";
        CPreparedStatement stmt = DB.prepareStatement(insertTypes, getTrxName());
        stmt.setInt(1, m_LAR_Fiscal_Printer_Type_ID);
        stmt.setInt(2, getAD_Client_ID());
        stmt.setInt(3, getAD_User_ID());
        stmt.setInt(4, getAD_User_ID());
        int result = stmt.executeUpdate();
        log.info("Fiscal Printer Type insert result: " + result);

        // Fiscal Printer
        String insertPrinter =
            "INSERT INTO LAR_Fiscal_Printer (lar_fiscal_printer_id, ad_client_id, ad_org_id, " +
            " lar_fiscal_printer_type_id, isactive, createdby, updatedby, name, host, port) " +
            "VALUES (?, ?, 0, ?, 'Y', ?, ?, 'TestPrinter', 'localhost', 9000)";
        stmt = DB.prepareStatement(insertPrinter, getTrxName());
        stmt.setInt(1, m_LAR_Fiscal_Printer_ID);
        stmt.setInt(2, getAD_Client_ID());
        stmt.setInt(3, m_LAR_Fiscal_Printer_Type_ID);
        stmt.setInt(4, getAD_User_ID());
        stmt.setInt(5, getAD_User_ID());
        result = stmt.executeUpdate();
        log.info("Fiscal Printer insert result: " + result);
        commit();
    }

    @Override
    protected void tearDown() throws Exception
    {
        super.tearDown();
        String deletePrinter = "DELETE FROM LAR_Fiscal_Printer WHERE LAR_Fiscal_Printer_ID = ?";
        int result = DB.executeUpdate(deletePrinter, m_LAR_Fiscal_Printer_ID, getTrxName());
        log.info("Delete Printer result: " + result);

        String deleteType = "DELETE FROM LAR_Fiscal_Printer_Type WHERE LAR_Fiscal_Printer_Type_ID = ?";
        result = DB.executeUpdate(deleteType, m_LAR_Fiscal_Printer_Type_ID, getTrxName());
        log.info("Delete Printer Type result: " + result);
        commit();
    }

    public void testGetFiscalPrinter() throws Exception {
        log.info("Trx = " + getTrxName());

        MFiscalPrinter mFiscalPrinter = new MFiscalPrinter(getCtx(), m_LAR_Fiscal_Printer_ID, getTrxName());
        FiscalPrinterDevice printer = mFiscalPrinter.getFiscalPrinter();
        log.info("printer = " + printer);

        assertNotNull(mFiscalPrinter);
        assertNotNull(printer);
    }
}
