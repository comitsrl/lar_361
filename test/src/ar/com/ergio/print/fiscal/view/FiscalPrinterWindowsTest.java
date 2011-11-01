package ar.com.ergio.print.fiscal.view;

import org.compiere.util.Env;

import test.AdempiereTestCase;

public class FiscalPrinterWindowsTest extends AdempiereTestCase
{
    private AInfoFiscalPrinter info;

    @Override
    protected void setUp() throws Exception
    {
        super.setUp();

    }

    @Override
    protected void tearDown() throws Exception
    {
        super.tearDown();
        info.setVisible(false);
        info = null;
    }

    public void testInitInfoFiscalPrinter()
    {
        int windowNo = Env.createWindowNo(null);
        String title = "Test Info Printer Window";
        info = new AInfoFiscalPrinter(null, windowNo, title);
        info.setVisible(true);
    }

}
