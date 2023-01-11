package ar.com.ergio.process;

import org.compiere.model.MBankAccount;
import org.compiere.model.MCashBook;
import org.compiere.model.MDocType;
import org.compiere.model.MOrg;
import org.compiere.model.MPOS;
import org.compiere.model.MSequence;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereUserError;

public class LAR_CreacionPDV extends SvrProcess
{
    //private static final CLogger LOG = CLogger.getCLogger(LAR_CreacionPDV.class);

    private int p_NroPDV;
    private int p_AD_Org_ID;
    private boolean p_EsElectronico;
    private boolean p_EsFiscal;
    private int p_LAR_Fiscal_Printer_ID;
    private boolean p_EsMiles;
    private int p_M_Wharehouse_ID;
    private int p_C_BankAccount_ID;
    private int p_M_PriceList_ID;
    private boolean p_CrearRemito;
    private int p_C_DocType_InOut_ID;
    private boolean p_CrearRecibo;
    private int p_C_DocType_Payment_ID;

    @Override
    protected void prepare()
    {
        ProcessInfoParameter[] para = getParameter(); // Devuelve un arreglo de parametros
        for (int i = 0; i < para.length; i++) // Recorre el arreglo de parámetros
        {
            String name = para[i].getParameterName(); //

            if (para[i].getParameter() == null)
                ;
            else if (name.equals("NroPDV"))
            {
                p_NroPDV = para[i].getParameterAsInt();
            }
            else if (name.equals("AD_Org_ID"))
            {
                p_AD_Org_ID = para[i].getParameterAsInt();
            }
            else if (name.equals("EsElectronico"))
            {
                p_EsElectronico = para[i].getParameterAsBoolean();
            }
            else if (name.equals("EsFiscal"))
            {
                p_EsFiscal = para[i].getParameterAsBoolean();
            }
            else if (name.equals("LAR_Fiscal_Printer_ID"))
            {
                p_LAR_Fiscal_Printer_ID = para[i].getParameterAsInt();
            }
            else if (name.equals("EsMiles"))
            {
                p_EsMiles = para[i].getParameterAsBoolean();
            }
            else if (name.equals("M_Warehouse_ID"))
            {
                p_M_Wharehouse_ID = para[i].getParameterAsInt();
            }
            else if (name.equals("C_BankAccount_ID"))
            {
                // verifico si la caja es isdrawer y no es la principal
                p_C_BankAccount_ID = para[i].getParameterAsInt();
            }
            else if (name.equals("M_PriceList_ID"))
            {
                p_M_PriceList_ID = para[i].getParameterAsInt();
            }
            else if (name.equals("CrearRemito"))
            {
                p_CrearRemito = para[i].getParameterAsBoolean();
            }
            else if (name.equals("C_DocType_InOut_ID"))
            {
                p_C_DocType_InOut_ID = para[i].getParameterAsInt();
            }
            else if (name.equals("CrearRecibo"))
            {
                p_CrearRecibo = para[i].getParameterAsBoolean();
            }
            else if (name.equals("C_DocType_Payment_ID"))
            {
                p_C_DocType_Payment_ID = para[i].getParameterAsInt();
            }
        }
    } // prepare

    @Override
    protected String doIt() throws Exception
    {
        // Creacion de Punto de Venta (C_POS)
        final MPOS pos = crearPuntoVenta();

        // -------------------------------------------------------------------------------
        // Creacion de los Tipos de Documento asociados
        // -------------------------------------------------------------------------------

        // Factura A y B
        int gl_Category_ARI_ID = 1000003;
        int gl_Category_ARR_ID = 1000006;
        int gl_Category_MM_ID = 1000005;

        int lar_DocumentLetter_A_ID = 1000000; // FC - A
        int lar_DocumentLetter_B_ID = 1000001; // FC - B

        final MDocType tipoFacturaA = crearDocumento("Factura", "A", MDocType.DOCBASETYPE_ARInvoice, gl_Category_ARI_ID,
                pos, lar_DocumentLetter_A_ID, "");
        final MDocType tipoFacturaB = crearDocumento("Factura", "B", MDocType.DOCBASETYPE_ARInvoice, gl_Category_ARI_ID,
                pos, lar_DocumentLetter_B_ID, "");

        // Nota de Crédito A y B
        final MDocType tipoNotaCreditoA = crearDocumento("Nota de Crédito", "A", MDocType.DOCBASETYPE_ARCreditMemo,
                gl_Category_ARI_ID, pos, lar_DocumentLetter_A_ID, "NC");
        final MDocType tipoNotaCreditoB = crearDocumento("Nota de Crédito", "B", MDocType.DOCBASETYPE_ARCreditMemo,
                gl_Category_ARI_ID, pos, lar_DocumentLetter_B_ID, "NC");

        // Nota de Débito A y B
        final MDocType tipoNotaDebitoA = crearDocumento("Nota de Débito", "A", MDocType.DOCBASETYPE_ARInvoice,
                gl_Category_ARI_ID, pos, lar_DocumentLetter_A_ID, "ND");
        final MDocType tipoNotaDebitoB = crearDocumento("Nota de Débito", "B", MDocType.DOCBASETYPE_ARInvoice,
                gl_Category_ARI_ID, pos, lar_DocumentLetter_B_ID, "ND");

        // si es fiscal se asigna la impresora fiscal
        if (p_EsFiscal)
        {
            // FC - A y B
            configuracionEsFiscal(tipoFacturaA, "F");
            configuracionEsFiscal(tipoFacturaB, "F");
            configuracionEsFiscal(tipoNotaCreditoA, "C");
            configuracionEsFiscal(tipoNotaCreditoB, "C");
            configuracionEsFiscal(tipoNotaDebitoA, "D");
            configuracionEsFiscal(tipoNotaDebitoB, "D");
        }
        if (p_EsElectronico)
        {
            // 201=Factura Electronica A, 202=Nota de Debito Electronica A, 203=Nota de Credito Electronica A,
            // 206=Factura Electronica B, 207=Nota de Debito Electronica B, 208=Nota de Debito ElectronicaB
            configuracionEsElectronico(tipoFacturaA, "001");
            configuracionEsElectronico(tipoFacturaB, "006");
            configuracionEsElectronico(tipoNotaCreditoA, "003");
            configuracionEsElectronico(tipoNotaCreditoB, "008");
            configuracionEsElectronico(tipoNotaDebitoA, "002");
            configuracionEsElectronico(tipoNotaDebitoB, "007");
        }
        if (p_EsMiles)
        {
            configuracionEsMiles(tipoFacturaA);
            configuracionEsMiles(tipoFacturaB);
        }

        // Remito X
        // se crea un tipo nuevo o se recupera el seleccionado como parametro
        final MDocType tipoRemitoX;
        if (p_CrearRemito)
        {
            tipoRemitoX = crearDocumento("Remito", "X", MDocType.DOCBASETYPE_MaterialDelivery,
                    gl_Category_MM_ID, pos, null, "Rem");
        }
        else
        {
            tipoRemitoX = new MDocType(getCtx(), p_C_DocType_InOut_ID, get_TrxName());
        }

        // Recibo
        // se crea un tipo nuevo o se recupera el seleccionado como parametro
        final MDocType tipoRecibo;
        if (p_CrearRecibo)
        {
            tipoRecibo = crearDocumento("Recibo", "X", MDocType.DOCBASETYPE_ARReceipt, gl_Category_MM_ID,
                    pos, null, "Rec");
        }
        else
        {
            tipoRecibo = new MDocType(getCtx(), p_C_DocType_Payment_ID, get_TrxName());
        }

        // POSOrder
        // a este tipo de documento hay que asignar las referencia de factura A y remito X
        // 1000001 es la categoria none para la compañia distinta de System
        final MDocType tipoPDV = crearDocumento("Orden PDV", "", MDocType.DOCBASETYPE_SalesOrder, 1000001, pos, null, "PDV");
        tipoPDV.setC_DocTypeInvoice_ID(tipoFacturaA.getC_DocType_ID());
        tipoPDV.setC_DocTypeShipment_ID(tipoRemitoX.getC_DocType_ID());
        tipoPDV.setDocSubTypeSO(MDocType.DOCSUBTYPESO_POSOrder);
        // @fchiappano Guardar tipo de orden de venta despues de modificarlo.
        tipoPDV.saveEx();

        // Finalizacion de la configuracion la Terminal PDV
        pos.setC_DocType_ID(tipoPDV.getC_DocType_ID());
        pos.set_ValueOfColumn("C_DocTypeOnCredit_ID", tipoPDV.getC_DocType_ID());
        pos.set_ValueOfColumn("C_Payment_DocType_ID", tipoRecibo.getC_DocType_ID());

        // @fchiappano Guardar los ultimos cambios en C_Pos
        pos.saveEx();

        return null;
    } // doIt

    private void configuracionEsMiles(final MDocType doctype)
    {
        doctype.set_ValueOfColumn("DocSubTypeINV", null);
        doctype.set_ValueOfColumn("isFical", false);
        doctype.set_ValueOfColumn("isFiscalDocument", false);

        doctype.set_ValueOfColumn("fiscalDocument", "F");
        doctype.saveEx();
    }

    /**
     * Configura el tipo de documento pasado como parametro con los valores necesarios para que el
     * mismo sea electronico
     * 
     * @param doctype
     *            tipo de documento a configurar
     * @param docSubTypeCAE
     *            subtipo de documento cae segun corresponda (valores de referencia en
     *            LAR_DocSubTypeCAE)
     * @throws AdempiereUserError
     *             si ocurre un error al guardar el tipo de documento
     */
    private void configuracionEsElectronico(final MDocType doctype, final String docSubTypeCAE)
            throws AdempiereUserError
    {

        doctype.set_ValueOfColumn("DocSubTypeINV", "EL");
        doctype.set_ValueOfColumn("isElectronic", p_EsElectronico);
        doctype.set_ValueOfColumn("DocSubTypeCAE", docSubTypeCAE);
        doctype.saveEx();

    } // configuracionEsElectronico

    /**
     * Configura el tipo de documento pasado como parametro con los valores necesario para que el
     * mismo sea fiscal
     *
     * @param docType
     *            tipo de documento a configurar
     * @param fiscalDocument
     *            tipo de documento fiscal (valores en refrencia LAR_FiscalDocument)
     * @throws AdempiereUserError
     *             si ocurre un error al guardar el tipo de documento
     */
    private void configuracionEsFiscal(final MDocType docType, final String fiscalDocument) throws AdempiereUserError
    {
        // Referencia LAR_DocSubtyeINV. FF=Fiscal Form
        docType.set_ValueOfColumn("DocSubTypeINV", "FF");
        docType.set_ValueOfColumn("isFical", p_EsFiscal);
        docType.set_ValueOfColumn("isFiscalDocument", p_EsFiscal);
        docType.set_ValueOfColumn("LAR_Fiscal_Printer_ID", p_LAR_Fiscal_Printer_ID);
        // F=Invoice C=Credit Note D=Debit Note
        docType.set_ValueOfColumn("fiscalDocument", fiscalDocument);
        docType.saveEx();
    } // configuracionEsFiscal

    /**
     * Crea un tipo de documento con la configuracion que se pasa como parametro
     *
     * @param tipo
     *            tipo de documento (Ej: "Factura", "Nota de Credito", et)
     * @param letra
     *            letra del tipo de documento
     * @param docBaseType
     *            sub tipo base del documento (valores en la referncia DocSubType)
     * @param gl_Category_ID
     *            ID de la categoria contable
     * @param pos
     *            configuracion del punto de venta
     * @return tipo de documento
     * @throws Exception
     */
    private MDocType crearDocumento(final String tipo, final String letra, final String docBaseType,
            final int gl_Category_ID, final MPOS pos, final Integer lar_DocumentLetter_ID, final String abreviatura) throws Exception
    {
        final String sufijo = String.format("%s%04d", letra, p_NroPDV);
        final String nombre = String.format("%s%s %s", tipo, p_EsMiles ? " Miles" : "", sufijo);
        final MDocType documento = new MDocType(getCtx(), 0, get_TrxName());

        documento.setName(nombre);
        documento.setDescription(nombre);
        documento.setPrintName(nombre);
        documento.setDocBaseType(docBaseType);
        documento.setIsDefault(false);
        documento.setIsSOTrx(true);
        // @fchiappano marcar el documento como controlado, ademas de sobreescribe secuencia (necesario uno para el otro).
        documento.setIsDocNoControlled(true);
        documento.setIsOverwriteSeqOnComplete(true);
        // Tratar con el tema de overwriteSeq/date al haber diferencias entre tipos de docs
        documento.setDocNoSequence_ID(crearSecuencia(tipo, abreviatura, letra, true));
        // @fchiappano crear secuencia definitiva.
        documento.setDefiniteSequence_ID(crearSecuencia(tipo, abreviatura, letra, false));
        documento.setGL_Category_ID(gl_Category_ID);
        // Configurar si es fiscal
        documento.setIsOverwriteDateOnComplete(p_EsFiscal);
        // Generar retencion
        // Posiblemente 'N' por default. Preguntar
        documento.set_ValueOfColumn("GenerateWithholding", "N");
        // PDV 
        documento.set_ValueOfColumn("C_POS_ID", pos.getC_POS_ID());
        // Asignar Letra
        documento.set_ValueOfColumn("LAR_DocumentLetter_ID", lar_DocumentLetter_ID);
        documento.saveEx();
        return documento;
    } // crearDocumento

    // PREGUNTAR: diferencias entre nombres como temporal/tmp o -/" patron
    // decimal prefijo"
    private int crearSecuencia(final String tipo, final String abreviatura, final String letra, final boolean esTemporal) throws Exception
    {
        // int id = 0;
        final MSequence secuencia = new MSequence(getCtx(), 0, get_TrxName());
        // final String prefijo = String.format("%s-%s", tipo, nroPDV);
        // //AGREGAR Temp???
        final String prefijo = String.format("%s%04d", letra, p_NroPDV);
        String nombre = "";

        // @fchiappano Determinar los valores diferenciados para secuencias temporales o definitivas.
        if (esTemporal)
        {
            nombre = String.format("TMP %s %s %s", abreviatura, tipo, prefijo);
            secuencia.setPrefix("Tmp" + abreviatura + prefijo + "-");
        }
        else
        {
            nombre = tipo + " "  + prefijo;
            secuencia.setPrefix(abreviatura + prefijo + "-");
        }

        secuencia.setName(nombre);
        secuencia.setDescription(nombre);
        secuencia.setDecimalPattern("00000000");
        secuencia.setCurrentNext(1);
        secuencia.saveEx();
        return secuencia.getAD_Sequence_ID();
    }

    private MPOS crearPuntoVenta() throws Exception
    {
        final MPOS pos = new MPOS(getCtx(), 0, get_TrxName());
        final MBankAccount bankAccount = new MBankAccount(getCtx(), p_C_BankAccount_ID, get_TrxName());

        String nroCaja = bankAccount.getAccountNo();
        String nombre = String.format("%05d - %s", p_NroPDV, nroCaja);
        pos.setName(nombre);
        pos.setAD_Org_ID(p_AD_Org_ID);
        pos.setC_BankAccount_ID(p_C_BankAccount_ID);
        pos.setSalesRep_ID(1000000);
        pos.setM_PriceList_ID(p_M_PriceList_ID);
        pos.setC_CashBook_ID(crearCashBook(p_AD_Org_ID));
        pos.setM_Warehouse_ID(p_M_Wharehouse_ID);
        // @fchiappano asignar el nro de punto de venta.
        pos.set_ValueOfColumn("PosNumber", p_NroPDV);
        pos.saveEx();
        return pos;
    } // crearPuntoVenta

    /**
     * Crea o recupera el ID del CashBook asociado a la organizacion
     * @return CashBook ID
     */
    private int crearCashBook(int AD_Org_ID)
    {
        int c_Currency_ID = 118; // ARS
        MCashBook cashBook = MCashBook.get(getCtx(), AD_Org_ID, c_Currency_ID);
        // Si el cashbook no existe para la organizacion, se crea uno
        if (cashBook == null)
        {
            final MOrg org = new MOrg(getCtx(), AD_Org_ID, get_TrxName());
            cashBook = new MCashBook(getCtx(), 0, get_TrxName());
            cashBook.setAD_Org_ID(AD_Org_ID);
            cashBook.setC_Currency_ID(c_Currency_ID);
            cashBook.setIsDefault(false);
            cashBook.setName(String.format("Estandar %s", org.getName()));
            cashBook.saveEx();
        }
        return cashBook.getC_CashBook_ID();
    } // crearCashBook
}
