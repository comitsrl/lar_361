package ar.com.comit.factura.electronica;

import java.io.File;
import java.io.FileWriter;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.logging.Level;

import org.compiere.model.MBPartner;
import org.compiere.model.MBankAccount;
import org.compiere.model.MCurrency;
import org.compiere.model.MDocType;
import org.compiere.model.MInvoice;
import org.compiere.model.MInvoiceTax;
import org.compiere.model.MOrgInfo;
import org.compiere.model.MPOS;
import org.compiere.model.MSysConfig;
import org.compiere.model.MTax;
import org.compiere.util.CLogger;
import org.compiere.util.Env;
import org.compiere.util.Msg;
import org.globalqss.model.X_LCO_TaxIdType;

import ar.com.ergio.util.LAR_Utils;

/**
 * @author Castro, Juan Manul
 */
public class WsfeV1 extends Wsfe{
	
	protected CLogger log = CLogger.getCLogger(WsfexV1.class);
	
	public WsfeV1(MInvoice inv) {
		super(inv);
	}

	/**
	 * @author: Horacio Alvarez
	 * @descripcion: Crea el archivo de entrada para el WSFE.PY.
	 * Setea los valores necesarios con el objeto MInvoice.
	 */
	@Override
	protected void createInputFile(){
		try{
			StringBuffer line  = new StringBuffer();
			//*****NRO. COMPROBANTE
			if(this.getInvoice().getNumeroComprobante() == 0){
				this.setMessageError(Msg.translate(this.getM_ctx(), "CaeNoNumeroComprobante"));
				return;
			}
			line.append(this.getInvoice().getNumeroComprobante() + "\n");
			
			//*****PUNTO DE VENTA
			final MPOS pos = new MPOS(getM_ctx(), this.getInvoice().get_ValueAsInt("C_Pos_ID"), getTrxName());
			if(pos.get_ValueAsInt("PosNumber") == 0){
				this.setMessageError(Msg.translate(this.getM_ctx(), "CaeNoPuntoDeVenta"));
				return;
			}
			line.append(pos.get_ValueAsInt("PosNumber") + "\n");
			
			//*****TIPO DE COMPROBANTE
			MDocType docType = new MDocType(Env.getCtx(),this.getInvoice().getC_DocTypeTarget_ID(),getTrxName());
			line.append(docType.getdocsubtypecae()+"\n");
			
			//*****TIPO DOC: 80 CUIT / 96 DNI
			MBPartner partner = new MBPartner(this.getM_ctx(),this.getInvoice().getC_BPartner_ID(),getTrxName());

			// @fchiappano Recuperar el tipo de identificación, desde el Socio del Negocio.
			final X_LCO_TaxIdType tipoIdentificacion = new X_LCO_TaxIdType(getM_ctx(),
                    partner.get_ValueAsInt("LCO_TaxIdType_ID"), getTrxName());

            line.append(tipoIdentificacion.getLCO_TaxCodeDian() + "\n");

            if (partner.getTaxID() == null || partner.getTaxID().equals(""))
            {
                this.setMessageError(Msg.translate(this.getM_ctx(), "CaeNoCUIT"));
                return;
            }

            line.append(partner.getTaxID().replaceAll("-", "") + "\n");

			//*****IMPORTE TOTAL
			//line.append(this.getInvoice().getGrandTotal().toString().replace(".", "")+"\n");
			line.append(this.getInvoice().getGrandTotal().setScale(2, BigDecimal.ROUND_HALF_UP) + "\n");
			
			//*****IMPORTE NETO
			//line.append(this.getInvoice().getTotalLines().toString().replace(".", "")+"\n");
			line.append(this.getInvoice().getTotalLines().setScale(2, BigDecimal.ROUND_HALF_UP) + "\n");
			
			//*****FECHA
			if(this.getInvoice().getDateAcct() == null){
				this.setMessageError(Msg.translate(this.getM_ctx(), "CaeNoDateAcct"));
				return;
			}			
			line.append(formatTime(this.getInvoice().getDateAcct(), "yyyyMMdd")+"\n");
			
			//*****PRESTA SERVICIOS 0-->NO  1-->SI
			line.append(MSysConfig.getValue("LAR_PrestaServicios_FE", Env.getAD_Client_ID(Env.getCtx())) + "\n");

			//*****MONEDA
			MCurrency currency = new MCurrency(this.getM_ctx(), this.getInvoice().getC_Currency_ID(),getTrxName());
			line.append(currency.get_ValueAsString("WSFECode") + "\n");
			
			//*****CONVERSION
			// Se debe convertir a la moneda del comprobante desde la moneda de la compañía
			BigDecimal cotizacion;
			if (currency.getC_Currency_ID() != LAR_Utils.getMonedaPredeterminada(getM_ctx(), getInvoice().getAD_Client_ID(), getTrxName()))
			    cotizacion = (BigDecimal) getInvoice().get_Value("TasaDeCambio");
			else
                cotizacion = MCurrency.currencyConvert(Env.ONE, Env.getContextAsInt(this.getM_ctx(), "$C_Currency_ID"),
                        this.getInvoice().getC_Currency_ID(), this.getInvoice().getDateInvoiced(), 0, this.getM_ctx());
			line.append(cotizacion+"\n");
			
			//*****IMPUESTO
			BigDecimal total_Impuesto = BigDecimal.ZERO;
			MInvoiceTax[] taxes = this.getInvoice().getTaxes(false);
			MTax tax = null;
			int size = taxes.length;
			boolean firstLineAppended = false;
			for (int i = 0; i < size; i++){
				tax = MTax.get(this.getM_ctx(), taxes[i].getC_Tax_ID());
				if (!tax.get_ValueAsBoolean("IsPerception")){
				    total_Impuesto = total_Impuesto.add(taxes[i].getTaxAmt().setScale(2, BigDecimal.ROUND_HALF_UP));
					taxes[i].getTaxAmt();
					taxes[i].getTaxBaseAmt();
					tax.get_ValueAsString("WSFECode");
					
					if(firstLineAppended){
						line.append(";");
					}
					line.append(tax.get_ValueAsString("WSFECode") + ":" + (getTaxBaseAmt(taxes[i].getTaxBaseAmt(), this.getInvoice().getGrandTotal(), getTaxesAmt(this.getInvoice()))).setScale(2, BigDecimal.ROUND_HALF_UP) + ":" + taxes[i].getTaxAmt().setScale(2, BigDecimal.ROUND_HALF_UP));
					firstLineAppended = true;	
				}
			}

            line.append("\n");

            // *****MONTO TOTAL DE IMPUESTOS
            // line.append(total_Impuesto + "\n");

			//*****IMPUESTOS PERCEPCIONES
			BigDecimal total_Perception = BigDecimal.ZERO;
			MInvoiceTax[] taxesPerc = this.getInvoice().getTaxes(true);
			MTax taxPerc = null;
			int sizePerc = taxesPerc.length;
			boolean firstLineAppended2 = false;
			for (int i = 0; i < sizePerc; i++){
				taxPerc = MTax.get(this.getM_ctx(), taxesPerc[i].getC_Tax_ID());
				if (taxPerc.get_ValueAsBoolean("IsPerception")){
					total_Perception = total_Perception.add(taxesPerc[i].getTaxAmt().setScale(2, BigDecimal.ROUND_HALF_UP)); 
					
					taxesPerc[i].getTaxAmt();
					taxesPerc[i].getTaxBaseAmt();
					taxPerc.get_ValueAsInt("WSFECode");
					
					if(firstLineAppended2){
						line.append(";");
					}
					BigDecimal alic = (taxPerc.getRate().setScale(2, BigDecimal.ROUND_HALF_UP)).negate();
					line.append(taxPerc.get_ValueAsInt("WSFECode") + ":" + (getTaxBaseAmt(taxesPerc[i].getTaxBaseAmt(), this.getInvoice().getGrandTotal(), getTaxesAmt(this.getInvoice()))).setScale(2, BigDecimal.ROUND_HALF_UP) + ":" + taxesPerc[i].getTaxAmt().setScale(2, BigDecimal.ROUND_HALF_UP) + ":" + alic);
					firstLineAppended2 = true;	
				}
			}

			if (total_Perception.equals(Env.ZERO))
			    line.append("0");

			line.append("\n"); 
			
			//*****MONTO TOTAL DE PERCEPCIONES
			line.append(total_Perception+"\n");
			
			//*****C_INVOICE_ID para seguimiento
			line.append(this.getInvoice().getC_Invoice_ID()+"\n");

            // @fchiappano Agregar Fecha de Vencimiento de Pago.
            line.append(formatTime((Timestamp) this.getInvoice().get_Value("FechaPago"), "yyyyMMdd") + "\n");

            // @fchiappano Agregar datos opcionales (CBU y Alias).
            int c_BankAccount_ID = MOrgInfo.get(this.getM_ctx(), this.getInvoice().getAD_Org_ID()).get_ValueAsInt(
                    "C_BankAccount_ID");
            MBankAccount cuentaBancaria = new MBankAccount(getM_ctx(), c_BankAccount_ID, getTrxName());

            // ****** CBU
            line.append(cuentaBancaria.get_Value("CBU") + "\n");

            // ****** ALIAS
            line.append(cuentaBancaria.get_Value("Alias") + "\n");

            // @fchiappano se agregan datos para NC y ND (FCE).
            if (getInvoice().get_ValueAsInt("Source_Invoice_ID") > 0)
            {
                MInvoice facturaOrigen = new MInvoice(getM_ctx(), getInvoice().get_ValueAsInt("Source_Invoice_ID"), getTrxName());

                // ****** Tipo de Doc. Factura Origen.
                MDocType tipoDoc = (MDocType) facturaOrigen.getC_DocTypeTarget();
                line.append(tipoDoc.getdocsubtypecae() + "\n");

                // ****** Punto de Venta Factura Origen.
                MPOS pdv = new MPOS(getM_ctx(), facturaOrigen.get_ValueAsInt("C_Pos_ID"), getTrxName());
                line.append(pdv.get_ValueAsInt("PosNumber") + "\n");

                // ****** Nro. Doc. Factura Origen.
                line.append(facturaOrigen.getNumeroComprobante() + "\n");

                // ****** Fecha Facturación Factura Origen
                Date fecha = new Date(facturaOrigen.getDateInvoiced().getTime());
                line.append(fecha.toString().replace("-", "") + "\n");

                // ****** Codigo de Cancelación
                boolean cancelado = getInvoice().get_ValueAsBoolean("Cancelacion");

                if (cancelado)
                    line.append("S" + "\n");
                else
                    line.append("N" + "\n");
            }

			File textFile = new File(getPath()+"entrada.txt");
			FileWriter textOut;
			textOut = new FileWriter(textFile);
			textOut.write(line.toString());
			textOut.close();
		}catch (Exception ex) {
			this.setMessageError(Msg.translate(this.getM_ctx(), "caeErrorCreateInputFile"));
			log.log(Level.SEVERE, this.getMessageError(),ex);
		}			
	}
	
	private BigDecimal getTaxBaseAmt(BigDecimal taxBaseAmt, BigDecimal grandTotal,	BigDecimal taxesAmt) {
		if ((Math.abs((grandTotal.subtract(taxesAmt).subtract(taxBaseAmt)).doubleValue()) >= 0.01) && (Math.abs((grandTotal.subtract(taxesAmt).subtract(taxBaseAmt)).doubleValue()) <= 0.02)){
			return (grandTotal.subtract(taxesAmt));
		}
		return taxBaseAmt;
	}
	
}
