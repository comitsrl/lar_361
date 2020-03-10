package ar.com.comit.factura.electronica;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.apps.ADialog;
import org.compiere.model.MInvoice;
import org.compiere.model.MInvoiceTax;
import org.compiere.model.MPOS;
import org.compiere.model.MPreference;
import org.compiere.swing.CDialog;
import org.compiere.util.AdempiereUserError;
import org.compiere.util.CLogger;
import org.compiere.util.Env;
import org.compiere.util.Msg;

/**
 * @author Horacio Alvarez - SERVICIOS DIGITALES S.A.
 * @updated 2011-06-25
 * @notes Adaptado para Factura Electronica Argentina v1.0 - Vigencia a partir del 01-07-2011
 */
public abstract class Wsfe {
	
	private CLogger log = CLogger.getCLogger(Wsfe.class);
	private String messageError = null;
	
	private Properties m_ctx = Env.getCtx(); 
	private String trxName = null;
	
	private MInvoice invoice = null;
	
	private String result = null;
	private WsfeResult wsfeResult;

	private String path = "";

	public Wsfe(MInvoice inv) {
		this.invoice = inv;
		setTrxName(invoice.get_TrxName());
		this.wsfeResult = new WsfeResult();
	}
	
	/* Getters y Setters */
	public String getMessageError() {
		return messageError;
	}

	public void setMessageError(String messageError) {
		this.messageError = messageError;
	}

	public Properties getM_ctx() {
		return m_ctx;
	}

	public void setM_ctx(Properties m_ctx) {
		this.m_ctx = m_ctx;
	}
	
	public String getTrxName(){
		return trxName;
	}
	
	private void setTrxName(String value){
		trxName = value;
	}	

	public MInvoice getInvoice() {
		return invoice;
	}

	public void setInvoice(MInvoice invoice) {
		this.invoice = invoice;
	}

	protected abstract void createInputFile();

	/**
	 * @author Horacio Alvarez
	 * @descripcion: Formatea el fecha recibida @time@
	 * al formato @format@. Ej: yyyyMMdd
	 */
	protected String formatTime(Timestamp time,String format){
		SimpleDateFormat simpleformat = new SimpleDateFormat(format);
		Date date = new Date(time.getTime());
		return simpleformat.format(date);
	}
	
	/**
	 * @author Horacio Alvarez
	 * @return: Devuelve el path donde se encuentra alojado el proceso wsfe.py en el
	 * sistema de archvos local. Este path se guarda en la tabla AD_Preference (Valores Predeterminados)
	 */
    protected String getPath()
    {
        /**
         * El nombre de AD_Preference a consultar se forma concatenando el valor
         * WSFE_PV y el Nro de Punto de Venta
         */
        if (path != "")
            return path;
        else
        {
            MPOS pos = new MPOS(m_ctx, invoice.get_ValueAsInt("C_Pos_ID"), trxName);
            String atributo = "WSFE_PV" + pos.get_ValueAsInt("PosNumber");

            // @fchiappano Si el SO es Windows, busco la preferencia del mismo.
            String osName = System.getProperty("os.name");
            if(!osName.equals("Linux"))
                atributo = atributo + "_WIN";

            MPreference preference = MPreference.getOrgPreference(Env.getAD_Client_ID(getM_ctx()),
                    Env.getAD_Org_ID(getM_ctx()), atributo, getM_ctx(), getTrxName());

            // En el caso que no se haya encontrado ninguna preferencia
            // a partir del Nro de Punto de Venta se busca utilizando el valor
            // por defecto que es: WSFE
            if (preference == null)
            {
                atributo = "WSFE";
                preference = MPreference.getOrgPreference(Env.getAD_Client_ID(getM_ctx()),
                        Env.getAD_Org_ID(getM_ctx()), atributo, getM_ctx(), getTrxName());

                // @fchiappano Si la preferencia continua siendo nula, enviar mensaje al usuario.
                if (preference == null)
                    ADialog.error(0, new CDialog(), "No fue posible, recuperar directorio de comunicación con AFIP.");
            }

            path = preference.getValue();
            return path;
        }
    }
	
	protected void deleteExistingFiles(){
		try{
			File file = new File(getPath()+"entrada.txt");
			if(file.exists()){
				if(!file.delete()){
					messageError = Msg.translate(m_ctx, "caeCannotDeleteEntradaTxt");
					log.log(Level.SEVERE, messageError);					
				}
			}
			file = new File(getPath()+"salida.txt");
			if(file.exists()){
				if(!file.delete()){
					messageError = Msg.translate(m_ctx, "caeCannotDeleteSalidaTxt");
					log.log(Level.SEVERE, messageError);
				}
			}
			file = new File(getPath()+"error.txt");
			if(file.exists()){
				if(!file.delete()){
					messageError = Msg.translate(m_ctx, "caeCannotDeleteErrorTxt");
					log.log(Level.SEVERE, messageError);
				}
			}			
		}
		catch(Exception ex){
			messageError = Msg.translate(m_ctx, "caeCannotDeleteFilesError");
			log.log(Level.SEVERE, messageError,ex);
		}
	}
	
	/**
	 * @author Horacio Alvarez
	 * @descripcion: Invoca el ejecutable run.sh (wsfe.py)
	 * ******************************************************************************
	 * #!/bin/bash
	 * RUTAWSFE="/home/horacio/soft/Archivos"
	 * RUTAPYTHON="/usr/bin/python"
	 * cd $RUTAWSFE
	 * $RUTAPYTHON $RUTAWSFE/wsfe.py >> $RUTAWSFE/log.error 2>> $RUTAWSFE/log.error 
	 * ******************************************************************************
	 * 
	 */
	protected void callProcess(){
		String aux = null;
		String auxE = null;
		try { 
		   /* directorio/ejecutable es el path del ejecutable y un nombre */
			Process p = null;
			String osName = System.getProperty("os.name");
			if(osName.equals("Linux")){
				p = Runtime.getRuntime().exec ("sh "+getPath() + "run.sh");
			}
			else{
				p = Runtime.getRuntime().exec (getPath() + "run.bat");
			}
			p.waitFor();
			if(p.exitValue() != 0){
                // @fchiappano Recuperar mensaje de error desde el archivo wsfev1_error.log
                BufferedReader reader = new BufferedReader(new FileReader(getPath() + "wsfev1_error.log"));
                String linea = "";
                String ultimaLinea = "";

                while ((linea = reader.readLine()) != null)
                    ultimaLinea = linea;

                messageError = "Error de Conexión: " + Msg.translate(getM_ctx(), ultimaLinea);
                log.log(Level.SEVERE, "caeErrorCallProcess:" + ultimaLinea);

				/* InputStream is = p.getInputStream();
				InputStream ie = p.getErrorStream();
				BufferedReader br = new BufferedReader (new InputStreamReader (is));
				BufferedReader brE = new BufferedReader (new InputStreamReader (ie));
	            aux = br.readLine();
	            if(aux == null) aux = "";
	            if(auxE == null) auxE = "";
	            auxE = brE.readLine();
	            messageError = "Exit Value="+p.exitValue()+",InputStream="+aux+",ErrorStream="+auxE;
	            //messageError = "La AFIP no aprueba el envio. Por favor corrobore los datos (CUIT, Categoria de IVA, Etc).";
	            log.log(Level.SEVERE,"caeErrorCallProcess:" +aux + auxE); */
			}
			
		} 
		catch (Exception e) { 
			messageError = "Error callProcess(): "+aux;
			log.log(Level.SEVERE,messageError);
			e.printStackTrace();
		}
	}
	
	/**
	 * @author: Horacio Alvarez
	 * @descripcion: Busca si el wsfe.py devolvió algun error, mediante el error.txt.
	 */
	protected void searchForProblems(){
		String linea = null;
		try{
			File errorFile = new File(getPath()+"error.txt");
			if(errorFile.exists()){
				BufferedReader reader = new BufferedReader(new FileReader(errorFile));
				linea = reader.readLine();
				messageError = linea;
				log.log(Level.SEVERE, linea);
			}
			else{
				log.log(Level.WARNING, "Everything is OK");
			}
		}
		catch(Exception ex){
			messageError = Msg.translate(m_ctx, "caeErrorSearchForProblems");
			log.log(Level.SEVERE, linea);			
		}
	}
	
	/**
	 * @author: Horacio Alvarez
	 * @descripcion: Guarda en @resultado@ la linea del archivo de salida
	 * generado por el WSFE, 
	 */
	protected void readOutput(){
		String linea = null;
		
		try { 
				BufferedReader reader = new BufferedReader(new FileReader(getPath()+"salida.txt"));
				linea = reader.readLine();
				log.log(Level.INFO, linea);
	    } catch (IOException ex) { 
	    	  messageError = Msg.translate(m_ctx, "CaeErrorReadOutput");
	    	  log.log(Level.SEVERE, messageError+ex);
		}
	    result = linea;
	}
	
	protected void setValues(){
		try{
			String[] values = getOutputLine().split(":");
			wsfeResult.setAcepted(values[0]);
			wsfeResult.setCae(values[1]);
			wsfeResult.setNroCbte(values[2]);
			wsfeResult.setMensaje(values[3]);
			wsfeResult.setDateCae(values[4]);			
		}
		catch(Exception ex){
			messageError = Msg.translate(m_ctx, "caeErrorSetValues");
			log.log(Level.SEVERE,messageError+ ":" +ex.toString());
		}
	}
	
	protected void check(){
		if(wsfeResult.getMensaje() != null & !wsfeResult.getMensaje().equals("None")){
			messageError = wsfeResult.getMensaje();
		}
	}
	
	/**
	 * @author Horacio Alvarez
	 * @return Devuelve la linea de salida generada por wsfe.py.
	 */
	private String getOutputLine(){
		return result;
	}
	
	class WsfeResult{
		private String accepted;
		private String cae;
		private String mensaje;
		private String nroCbte;
		private Timestamp dateCae;
		
		/**
		 * @author Horacio Alvarez
		 * @descripcion: Obtiene y setea el ID del CAE desde 
		 * la linea guardada del archivo de respuesta.
		 */	
		public void setAcepted(String value){
			accepted = value;
		}
		
		public String getAccepted(){
			return accepted;
		}
		
		/**
		 * @author Horacio Alvarez
		 * @descripcion: Obtiene y setea el CAE desde la linea guardada del archivo de respuesta.
		 */
		public void setCae(String value){
			cae = value;
		}	
		
		public String getCAE(){
			return cae;		
		}
		
		public void setMensaje(String value){
			mensaje = value;
		}
		
		public String getMensaje(){
			return mensaje;
		}	
		
		public void setNroCbte(String value){
			nroCbte = value;
		}
		
		public String getNroCbte(){
			return nroCbte;		
		}	
		
		/**
		 * @author Horacio Alvarez
		 * @descripcion: Obtiene y setea la fecha de vto. del CAE desde 
		 * la linea guardada del archivo de respuesta.
		 */
		public void setDateCae(String value){ 
			try{
				dateCae = getTimestamp(value, "yyyyMMdd");
			}catch(Exception ex){
				ex.printStackTrace();
			}
		}
		
		public Timestamp getDateCae(){
			return dateCae;		
		}	
	}
	
	public String getAccepted(){
		return this.wsfeResult.getAccepted();
	}
	
	public String getCAE(){
		return this.wsfeResult.getCAE();
	}
	
	public String getNroCbte(){
		return this.wsfeResult.getNroCbte();
	}	
	
	public Timestamp getDateCae(){
		return this.wsfeResult.getDateCae();
	}
	
	public String getMensaje(){
		return this.wsfeResult.getMensaje();
	}
		
	/**
	 * @author Horacio Alvarez
	 * @descripcion: Convierte la fecha string @value@ de formato @format@
	 * en Timestamp.
	 */
	
	private Timestamp getTimestamp(String value, String format){
		Timestamp time = null;
		try{
			SimpleDateFormat dateFormat = new SimpleDateFormat(format);
			java.util.Date date = dateFormat.parse(value);
			time = new Timestamp(date.getTime());
		}
		catch(Exception ex){
			log.log(Level.SEVERE, "Error getTimestamp():"+ex);
		}
		return time;
	}

	/**
	 * Obtener el monto total de todos los impuesto aplicados a la factura.
	 * @param invoice
	 * @return 
	 */
    public BigDecimal getTaxesAmt(MInvoice invoice)
    {
        MInvoiceTax[] taxes = invoice.getTaxes(false);
        BigDecimal total = Env.ZERO;
        for (int i = 0; i < taxes.length; i++)
        {
            total = total.add(taxes[i].getTaxAmt());
        }
        return total;
    } // getTaxesAmt
}
