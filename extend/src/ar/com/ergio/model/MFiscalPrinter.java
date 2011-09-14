package ar.com.ergio.model;

import java.sql.ResultSet;
import java.util.Properties;

import org.compiere.model.MDocType;
import org.compiere.util.CLogger;
import org.compiere.util.Env;
import org.compiere.util.Msg;

import ar.com.ergio.print.fiscal.FiscalPrinter;
import ar.com.ergio.print.fiscal.comm.FiscalComm;
import ar.com.ergio.print.fiscal.comm.SpoolerTCPComm;

public class MFiscalPrinter extends X_LAR_Fiscal_Printer {

    private static final long serialVersionUID = -3842337830339209086L;
    
    /** Logger de la aplicación */
	protected static CLogger log = CLogger.getCLogger(MFiscalPrinter.class);
    
	public MFiscalPrinter(Properties ctx, int C_Controlador_Fiscal_ID, String trxName) {
		super(ctx, C_Controlador_Fiscal_ID, trxName);
	}

	public MFiscalPrinter(Properties ctx, ResultSet rs, String trxName) {
		super(ctx, rs, trxName);
	}

	/**
	 * Obtiene el MFiscalPrinter que tiene asignado el tipo de documento.
	 * @param docType_ID ID del tipo de documento.
	 * @return El <code>MFiscalPrinter</code> que corresponde al tipo
	 * de documento o <code>null</code> en caso de que el DocType no sea Fiscal
	 * (<code>isfiscal() == false</code>).
	 */
	public static MFiscalPrinter getOfDocType(int docType_ID) {
		MFiscalPrinter cFiscal = null;
		MDocType docType = new MDocType(Env.getCtx(), docType_ID, null);
		if(docType.isfiscal())
			cFiscal = new MFiscalPrinter(Env.getCtx(), docType.getLAR_Fiscal_Printer_ID(), null);
		return cFiscal;
	}
	
	/**
	 * Retorna la <code>FiscalPrinter</code> correspondiente al tipo de documento
	 * especificado. Se obtienen los datos del <code>MFiscalPrinter</code>
	 * que tiene asignado el DocType, e intenta instanciar la impresora fiscal
	 * según la clase configurada en el tipo del controlador fiscal.
  	 * @param docType_ID ID del tipo de documento
	 * @return La instancia de la impresora. 
	 * @throws Exception cuando ocurre algun error en el intento de instanciar
	 * la clase configurada o si el DocType no es fiscal.
	 */	
	public static FiscalPrinter getFiscalPrinter(int docType_ID) throws Exception {
		Properties ctx = Env.getCtx();
		
		MFiscalPrinter cFiscal = getOfDocType(docType_ID);
		
		if(cFiscal == null) 
			throw new Exception(Msg.translate(ctx, "DocTypeNotFiscalError"));
		
		return cFiscal.getFiscalPrinter();
	}
	
	/**
	 * Retorna la <code>FiscalPrinter</code> correspondiente al tipo de documento
	 * especificado. Se obtienen los datos del <code>MFiscalPrinter</code>
	 * que tiene asignado el DocType, e intenta instanciar la impresora fiscal
	 * según la clase configurada en el tipo del controlador fiscal.
	 * @return La instancia de la impresora.
	 * @throws Exception cuando ocurre algun error en el intento de instanciar
	 * la clase configurada o si el DocType no es fiscal.
	 */	
	public FiscalPrinter getFiscalPrinter() throws Exception {
		Properties ctx = Env.getCtx();
		FiscalPrinter fiscalPrinter = null;
		X_LAR_Fiscal_Printer_Type cType = new X_LAR_Fiscal_Printer_Type(Env.getCtx(), getLAR_Fiscal_Printer_Type_ID(), null);
		String className = cType.getclazz();
		
		try {
			try {
				fiscalPrinter = (FiscalPrinter)Class.forName(className).newInstance();
			} catch (ClassNotFoundException e) {
				throw new Exception(Msg.translate(ctx,"FiscalPrinterClassNotFound"), e);
			} catch (Exception e) {
				throw new Exception(Msg.translate(ctx,"FiscalPrinterInstanciationError"), e);
			}
			String host = getHost();
			int port = getPort();
			FiscalComm fiscalComm = new SpoolerTCPComm(host, port);
			fiscalPrinter.setFiscalComm(fiscalComm);
			
		} catch(Exception e) {
			log.severe(e.getMessage());
			throw e;
		}
		return fiscalPrinter;
		
	}	
}
