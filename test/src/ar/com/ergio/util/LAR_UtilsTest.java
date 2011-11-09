package ar.com.ergio.util;

import org.compiere.model.MDocType;

import test.AdempiereTestCase;


public class LAR_UtilsTest extends AdempiereTestCase
{

    private int m_C_DocType_ID = 123; // AP invoice
    private MDocType larDocType;
    private MDocType docType;

    @Override
    protected void setUp() throws Exception
    {
        super.setUp();
        larDocType = new MDocType(getCtx(), 0, getTrxName());
        larDocType.setName("Test document");
        larDocType.setPrintName("Test print name");
        larDocType.setDocBaseType("API");
        larDocType.setGL_Category_ID(112);
        larDocType.setDocumentCopies(0);
        larDocType.set_ValueOfColumn("IsFiscal", true);
        larDocType.save();
        docType = new MDocType(getCtx(), m_C_DocType_ID, getTrxName());
        commit();
    }

    @Override
    protected void tearDown() throws Exception
    {
        larDocType.delete(true);
        docType = null;
        commit();
        super.tearDown();
    }

    public void testValidateCuit()
    {
        String cuitOk = "30-71135312-3";
        assertTrue("Valid CUIT was not validated", LAR_Utils.validateCUIT(cuitOk));

        String cuitWrong = "30-71135312-4";
        assertFalse("Wrong CUIT was validated", LAR_Utils.validateCUIT(cuitWrong));
    }

    public void testIsFiscalDocTypeOk()
    {
        assertTrue("Fiscal document was not validated", LAR_Utils.isFiscalDocType(larDocType.getC_DocType_ID()));
        assertFalse("No Fiscal document was validated", LAR_Utils.isFiscalDocType(docType.getC_DocType_ID()));
    }

}
