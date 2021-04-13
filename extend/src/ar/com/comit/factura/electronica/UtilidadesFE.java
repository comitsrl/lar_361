package ar.com.comit.factura.electronica;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.model.MCurrency;
import org.compiere.model.MDocType;
import org.compiere.model.MInvoice;
import org.compiere.util.CLogger;
import org.compiere.util.Env;

import ar.com.ergio.util.LAR_Utils;

/**
 * Servicio de utilidades, para procesadores FE.
 * @author fchiappano
 */
public class UtilidadesFE
{
    private static CLogger log = CLogger.getCLogger(UtilidadesFE.class);

    private UtilidadesFE(){}

    // @fchiappano recuperar contexto.
    private static final Properties ctx = Env.getCtx();

    /**
     * Formatear fecha a tipo String.
     * @author fchiappano
     * @param time
     * @param format
     * @return
     */
    public static String formatTime(Timestamp time, String format)
    {
        SimpleDateFormat simpleformat = new SimpleDateFormat(format);
        Date date = new Date(time.getTime());
        return simpleformat.format(date);
    } // formatTime

    /**
     * Obtener el tipo de documento electronico.
     * @author fchiappano
     * @return
     */
    public static int getDocSubTypeCAE(final MInvoice invoice)
    {
        MDocType tipoDoc = (MDocType) invoice.getC_DocType();
        return tipoDoc.get_ValueAsInt("docsubtypecae");
    } // getDocSubTypeCAE

    /**
     * Obtener Codigo WSFE de la moneda.
     * @author fchiappano
     * @return WSFE CODE
     */
    public static String getCodMoneda(final MInvoice factura)
    {
        MCurrency moneda = (MCurrency) factura.getC_Currency();
        return moneda.get_ValueAsString("WSFECode");
    } // getCodMoneda

    /**
     * Obtener cotización de moneda extrajera.
     * @author fchiappano
     * @return cotización.
     */
    public static BigDecimal getCotizacion(final MInvoice factura)
    {
        BigDecimal cotizacion = Env.ZERO;
        MCurrency moneda = (MCurrency) factura.getC_Currency();

        if (moneda.getC_Currency_ID() != LAR_Utils.getMonedaPredeterminada(ctx, factura.getAD_Client_ID(),
                factura.get_TrxName()))
            cotizacion = (BigDecimal) factura.get_Value("TasaDeCambio");
        else
            cotizacion = MCurrency.currencyConvert(Env.ONE, Env.getContextAsInt(ctx, "$C_Currency_ID"),
                    factura.getC_Currency_ID(), factura.getDateInvoiced(), 0, ctx);

        return cotizacion;
    } // getCotizacion

    /**
     * Obtener un timestamp a partir de un string.
     * @author fchiappano
     * @param value
     * @param format
     * @return timestamp
     */
    public static Timestamp getTimestamp(String value, String format)
    {
        Timestamp time = null;
        try
        {
            SimpleDateFormat dateFormat = new SimpleDateFormat(format);
            java.util.Date date = dateFormat.parse(value);
            time = new Timestamp(date.getTime());
        }
        catch (Exception ex)
        {
            log.log(Level.SEVERE, "Error getTimestamp():" + ex);
        }
        return time;
    } // getTimestamp

} // UtilidadesFE
