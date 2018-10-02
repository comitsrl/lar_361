package ar.com.ergio.process;

import java.awt.Frame;
import java.util.logging.Level;

import org.compiere.apps.AEnv;
import org.compiere.apps.search.Info;
import org.compiere.model.MPayment;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;

import ar.com.ergio.model.MLARRetiroCaja;
import ar.com.ergio.model.X_LAR_RetiroCajaLine;
import ar.compiere.apps.search.InfoOnDrawerChecks;

public class LAR_ChequeEnCarteraPorCaja extends SvrProcess
{

    private Integer retiroCaja_ID = null;

    @Override
    protected void prepare()
    {
        ProcessInfoParameter[] para = getParameter();
        for (int i = 0; i < para.length; i++)
        {
            String name = para[i].getParameterName();

            if (para[i].getParameter() == null)
                ;
            else if (name.equals("LAR_RetiroCaja_ID"))
            {
                retiroCaja_ID = para[i].getParameterAsInt();
            }
            else
            {
                log.log(Level.SEVERE, "Unknown Parameter: " + name);
            }
        }
    } // prepare

    @Override
    protected String doIt() throws Exception
    {
        MLARRetiroCaja retiroCaja = new MLARRetiroCaja(getCtx(), retiroCaja_ID, get_TrxName());

        Frame frame = new Frame();
        String usedDocs=""  //Consulta que devuelve el ID de los documentos (recibos) que ya
                            //fueron transferidos en algún pago, siempre y cuando ese pago no haya sido cancelado
            + "SELECT distinct(REC.c_payment_id)"
            +  " FROM c_payment PAY"
            +  " JOIN c_payment REC ON REC.c_payment_id = PAY.lar_paymentsource_id"
            +   " AND REC.docstatus IN ('CO', 'CL')"
            +   " AND REC.IsReceipt = 'Y'"
            +   " AND PAY.docstatus IN ('CO', 'CL')";

        String noDuplicado = " SELECT COALESCE (rcl.C_Payment_ID, 0)"
                           +   " FROM LAR_RetiroCajaLine rcl"
                           +   " JOIN LAR_RetiroCaja rc ON rcl.LAR_RetiroCaja_ID = rc.LAR_RetiroCaja_ID AND rc.DocStatus = 'DR'";

        StringBuilder whereSQL = new StringBuilder();
            whereSQL.append(" p.IsOnDrawer = 'Y'");
            whereSQL.append(" AND p.Docstatus IN ('CO','CL')");
            // ChequePropio = K  ChequeTercero = Z (nuevo)
            whereSQL.append(" AND p.TenderType IN ('K', 'Z')");
            whereSQL.append(" AND p.C_Payment_ID NOT IN ("+usedDocs+")");
            whereSQL.append(" AND p.C_Payment_ID NOT IN ("+noDuplicado+")");
            whereSQL.append(" AND p.C_BankAccount_ID IN (" + retiroCaja.getC_BankAccountFrom_ID() + ")");

        Info inf = InfoOnDrawerChecks.create(frame, true, 0, "C_Payment", "C_Payment_ID", "", true, whereSQL.toString());
        AEnv.showCenterWindow(frame, inf);
        Object[] pays=inf.getSelectedKeys();

        if (pays != null)
        {
            for (int x = 0; x < pays.length; x++)
            {
                final MPayment payment = new MPayment(getCtx(), (Integer) pays[x], get_TrxName());
                final X_LAR_RetiroCajaLine lineaRetiro = new X_LAR_RetiroCajaLine(getCtx(), 0, get_TrxName());

                lineaRetiro.setLAR_RetiroCaja_ID(retiroCaja.getLAR_RetiroCaja_ID());
                lineaRetiro.set_ValueOfColumn("C_Payment_ID", payment.getC_Payment_ID());
                lineaRetiro.setMonto(payment.getPayAmt());
                lineaRetiro.setRoutingNo(payment.getRoutingNo());
                lineaRetiro.setAccountNo(payment.getAccountNo());
                lineaRetiro.setCheckNo(payment.getCheckNo());
                lineaRetiro.setA_Name(payment.getA_Name());
                lineaRetiro.setTenderType("Z");

                lineaRetiro.saveEx();
            }
        }

        return null;
    } // doIt

} // LAR_ChequeEnCarteraPorCaja
