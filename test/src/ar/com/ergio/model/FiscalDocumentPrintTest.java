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

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.logging.Level;

import org.compiere.model.MBPartner;
import org.compiere.model.MInvoice;
import org.compiere.model.MPOS;
import org.compiere.model.MProduct;
import org.compiere.pos.PosOrderModel;
import org.compiere.util.CLogger;
import org.easymock.EasyMock;

import test.AdempiereTestCase;
import ar.com.ergio.print.fiscal.FiscalPrinterListener;

public class FiscalDocumentPrintTest extends AdempiereTestCase
{
    /** Logger  */
    private static final CLogger log = CLogger.getCLogger(FiscalDocumentPrintTest.class);
    private static final int SERVER_PORT = 9911;

    private FiscalDocumentListener fiscalDocumentListener;
    private FiscalPrinterListener fiscalPrinterListener;
    private X_LAR_Fiscal_Printer_Type fiscalPrinterType;
    private MFiscalPrinter fiscalPrinter;
    private MPOS posModel;
    private PosOrderModel posOrder;
    private TCPServerTest serverTest;

    private int m_AD_Org_ID = 11; // HQ
    private int m_C_DocType_ID = 135; // POS Order
    private int m_M_PriceList_ID = 101; // Starndard
    private int m_C_CashBook_ID = 101; // HQ Cashbook
    private int m_M_Warehouse_ID = 103; // HQ Warehouse
    private int m_C_BPartner_ID = 118; // Joe Block
    private int m_C_BankAccount_ID = 100; // Account 1234
    private int m_M_Product_ID = 123; // Standard

    @Override
    protected void setUp() throws Exception
    {
        super.setUp();
        getCtx().setProperty("#AD_Org_ID", new Integer(m_AD_Org_ID).toString());
        getCtx().setProperty("#M_Warehouse_ID", new Integer(m_M_Warehouse_ID).toString());
        createTestData();
        serverTest = new TCPServerTest();
        serverTest.start();
    }

    @Override
    protected void tearDown() throws Exception
    {
        serverTest.interrupt();
        deleteTestData();
        super.tearDown();
    }

    public void testPrintDocument() throws Exception
    {
        FiscalDocumentPrint fiscalDocumentPrint = new FiscalDocumentPrint(fiscalPrinter.getLAR_Fiscal_Printer_ID(),
                fiscalPrinterListener, fiscalDocumentListener);
        log.info("POS Order: " + posOrder);
        boolean ok = fiscalDocumentPrint.printDocument(posOrder.getInvoices()[0]);
        assertTrue(ok);
    }

//    public void testCreateInvoice()
//    {
//        fail("Not yet implemented");
//    }
//
//    public void testCreateDebitNote()
//    {
//        fail("Not yet implemented");
//    }
//
//    public void testCreateCreditNote()
//    {
//        fail("Not yet implemented");
//    }
//
//    public void testGetCustomer()
//    {
//        fail("Not yet implemented");
//    }
//
//    public void testReprintDocument()
//    {
//        fail("Not yet implemented");
//    }

    ////////////////////////////////////////////////////////////////////////////////////////////////
    //  Support Test Behavior
    ////////////////////////////////////////////////////////////////////////////////////////////////

    /**
     *
     */
    private static class TCPServerTest extends Thread {
        @Override
        public void run()
        {
            try {
                ServerSocket serverSocket = new ServerSocket(SERVER_PORT);
                Socket socket = null;
                while (true) {
                    socket = serverSocket.accept();
                    log.info("Connection accepted: " + socket);
                    // Process request
                    BufferedReader io = new BufferedReader(new InputStreamReader(socket.getInputStream()));
                    String fiscalPacket = io.readLine();
                    log.info("Packet recived: " + fiscalPacket);

                    try {
                        log.info("sleeping server...");
                        Thread.sleep(1000);
                    } catch (InterruptedException e) {
                        log.log(Level.SEVERE, e.getMessage(), e);
                    }
                    // Process response
                    byte[] code = new byte[]{0x06}; // Ack (06H)
                    OutputStream out = socket.getOutputStream();
                    out.write(code);
                    out.flush();
                }
            } catch (IOException e) {
                log.log(Level.SEVERE, e.getMessage(), e);
            }
        }
    }

    private void createTestData() throws Exception
    {
        // Mock objetcs
        fiscalDocumentListener = EasyMock.createMock(FiscalDocumentListener.class);
        fiscalPrinterListener = EasyMock.createMock(FiscalPrinterListener.class);

        // Fiscal Printer Type
        fiscalPrinterType = new X_LAR_Fiscal_Printer_Type(getCtx(), 0, getTrxName());
        fiscalPrinterType.setClazz("ar.com.ergio.print.fiscal.hasar.HasarPrinterP320F");
        fiscalPrinterType.setIsActive(true);
        fiscalPrinterType.setName("Test Printer Type");
        fiscalPrinterType.save();
        // Fiscal Printer
        fiscalPrinter = new MFiscalPrinter(getCtx(), 0, getTrxName());
        fiscalPrinter.setLAR_Fiscal_Printer_Type_ID(fiscalPrinterType.getLAR_Fiscal_Printer_Type_ID());
        fiscalPrinter.setName("Test Printer");
        fiscalPrinter.setHost("localhost");
        fiscalPrinter.setPort(SERVER_PORT);
        fiscalPrinter.setStatus("IDL"); // TODO - should be init AD config with this status?
        fiscalPrinter.save();
        // POS Model
        posModel = new MPOS(getCtx(), 0, getTrxName());
        posModel.setName("Test POS");
        posModel.setC_DocType_ID(m_C_DocType_ID);
        posModel.setSalesRep_ID(getAD_User_ID());
        posModel.setM_PriceList_ID(m_M_PriceList_ID);
        posModel.setC_CashBook_ID(m_C_CashBook_ID);
        posModel.setM_Warehouse_ID(m_M_Warehouse_ID);
        posModel.setC_BankAccount_ID(m_C_BankAccount_ID);
        posModel.save();
        // POS Order Model
        MBPartner partner = new MBPartner(getCtx(), m_C_BPartner_ID, getTrxName());
        if (partner.getTaxID() == null || partner.getTaxID().equals("")) {
            partner.setTaxID("30-71135312-3");
            partner.save();
        }
        MProduct product = new MProduct(getCtx(), m_M_Product_ID, getTrxName());
        posOrder = PosOrderModel.createOrder(posModel, partner, getTrxName());
        posOrder.createLine(product, BigDecimal.valueOf(1), BigDecimal.valueOf(100), 0);
        posOrder.payCash(BigDecimal.valueOf(100));
        if (posOrder.processOrder()) {
            commit();
        }
    }

    private void deleteTestData() throws Exception
    {
        fiscalDocumentListener = null;
        fiscalPrinterListener = null;

        for (MInvoice invoice : posOrder.getInvoices()) {
            invoice.delete(true, getTrxName());
        }
        posOrder.delete(true, getTrxName());
        posModel.delete(true, getTrxName());
        fiscalPrinter.delete(true, getTrxName());
        fiscalPrinterType.delete(true, getTrxName());
        commit();
    }
}
