package ar.com.comit.factura.electronica;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.compiere.model.MDocType;
import org.compiere.model.MInvoice;

/**
 * Servicio de utilidades, para procesadores FE.
 * @author fchiappano
 */
public class UtilidadesFE
{
    private UtilidadesFE(){}

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

} // UtilidadesFE
