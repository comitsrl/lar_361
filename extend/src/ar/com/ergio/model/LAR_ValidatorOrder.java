package ar.com.ergio.model;

import java.math.BigDecimal;

import org.compiere.model.MClient;
import org.compiere.model.MOrder;
import org.compiere.model.MOrderLine;
import org.compiere.model.ModelValidationEngine;
import org.compiere.model.ModelValidator;
import org.compiere.model.PO;
import org.compiere.util.CLogger;
import org.compiere.util.DB;

/**
 * Validador de Localización Argentina, que solo se encargara monitoriar los Modelos de clase MOrder y MOrderLine.
 *
 * @author fchiappano - www.comit.com.ar
 */
public class LAR_ValidatorOrder implements ModelValidator
{
    /**
     * Constructor. The class is instantiated when logging in and client is
     * selected/known
     */
    public LAR_ValidatorOrder()
    {
        super();
    } // LAR_ValidatorOrder

    /** Logger          */
    private static CLogger log = CLogger.getCLogger(LAR_ValidatorOrder.class);
    /** Client          */
    private int     m_AD_Client_ID = -1;

    @Override
    public void initialize(ModelValidationEngine engine, MClient client)
    {
        if (client != null)
        {
            m_AD_Client_ID = client.getAD_Client_ID();
            log.info(client.toString());
        }

        engine.addDocValidate(MOrder.Table_Name, this);
    } // initialize

    @Override
    public int getAD_Client_ID()
    {
        return m_AD_Client_ID;
    } // getAD_Client_ID

    @Override
    public String login(int AD_Org_ID, int AD_Role_ID, int AD_User_ID)
    {
        log.info("AD_User_ID=" + AD_User_ID);
        return null;
    } // login

    @Override
    public String modelChange(PO po, int type) throws Exception
    {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public String docValidate(PO po, int timing)
    {
        if (timing == TIMING_BEFORE_COMPLETE)
        {
            MOrder orden = (MOrder) po;

            // @fchiappano Si la orden esta marcada a reparto, poner todas las
            // cantidades a reparto en las lineas.
            if (orden.get_ValueAsBoolean("A_Reparto"))
            {
                MOrderLine[] oLines = orden.getLines(true, null);
                for (int i = 0; i < oLines.length; i++)
                {
                    MOrderLine oLine = oLines[i];
                    oLine.set_ValueOfColumn("Cant_Reparto", oLine.getQtyEntered());
                    oLine.saveEx(orden.get_TrxName());
                }
            }
            // @fchiappano si no esta marcada a reparto, chequear si no es que
            // se pusieron a reparto todas las lineas de manera individual y
            // actualizar la marca, para evitar que se genere remito al
            // completar la orden.
            else
            {
                boolean aReparto = true;
                MOrderLine[] oLines = orden.getLines(true, null);
                for (int i = 0; i < oLines.length; i++)
                {
                    MOrderLine oLine = oLines[i];

                    if (oLine.getQtyEntered().compareTo((BigDecimal) oLine.get_Value("Cant_Reparto")) != 0)
                    {
                        aReparto = false;
                        break;
                    }
                }

                if (aReparto)
                {
                    orden.set_ValueOfColumn("A_Reparto", true);
                    orden.saveEx();
//                    String sql = "UPDATE C_Order SET A_Reparto = 'Y' WHERE C_Order_ID = " + orden.getC_Order_ID();
//                    int result = DB.executeUpdate(sql, orden.get_TrxName());
//
//                    if (result < 0)
//                        return "ERROR al modificar condición Entrega Diferida/Reparto en Orden de Venta.";
                }
            }
        }

        return null;
    } // docValidate

} // LAR_ValidatorOrder
