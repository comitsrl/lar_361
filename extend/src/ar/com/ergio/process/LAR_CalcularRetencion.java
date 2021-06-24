package ar.com.ergio.process;

import java.util.logging.Level;

import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereUserError;
import org.compiere.util.Env;

import ar.com.ergio.model.MLARPaymentHeader;

/**
 * Calcula la retención sobre la cabecera de pago
 * realiza el cálculo, pero no genera el pago retención
 * ni el certificado correspondiente.
 *
 * @author Marcos Zúñiga - http://www.comit.com.ar
 */
public class LAR_CalcularRetencion extends SvrProcess
{

    /** The Record                      */
    private int     p_Record_ID = 0;

    @Override
    protected void prepare()
    {
        final ProcessInfoParameter[] para = getParameter();
        for (int i = 0; i < para.length; i++)
        {
            String name = para[i].getParameterName();
            if (para[i].getParameter() == null)
                ;
            else
                log.log(Level.SEVERE, "Par\u00e1metro desconocido: " + name);
        }
        p_Record_ID = getRecord_ID();
    } // prepare

    @Override
    protected String doIt() throws Exception
    {
        final MLARPaymentHeader header = new MLARPaymentHeader(getCtx(), p_Record_ID, get_TrxName());
        if (header.getLAR_PaymentHeader_ID() == 0)
            throw new AdempiereUserError("Sin Cabecera de Pago");

        // Sólo calcula la retención si el total de la cabecera no es cero (Existe algún pago cargado).
        if (!header.getPayHeaderTotalAmt().equals(Env.ZERO))
        {
            // @fchiappano Recuperar el mensaje apropiadamente.
            String mensaje = header.recalcPaymentWithholding(false);
            if (mensaje != null && !mensaje.equals(""))
                throw new AdempiereUserError(
                        "Error al calcular la retenci\u00f3n sobre la cabecera de pago. \n " + mensaje);
        }

        return "Retención Calculada";
    } // doIt
}
