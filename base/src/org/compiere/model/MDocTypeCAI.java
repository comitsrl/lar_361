package org.compiere.model;

import java.util.Properties;

/**
 * C_DocType_CAI Model
 *
 * @author Marcos Zúñiga - http://www.comit.com.ar
 *
 */
public class MDocTypeCAI extends X_C_DocType_CAI
{
    public MDocTypeCAI(Properties ctx, int C_DocType_CAI_ID, String trxName)
    {
        super(ctx, C_DocType_CAI_ID, trxName);
        // TODO Auto-generated constructor stub
    }

    private static final long serialVersionUID = -625021622629468693L;

    /**
     *  Before Save
     *  @param newRecord new
     *  @return true
     */
    protected boolean beforeSave (boolean newRecord)
    {
        /*Se valida que la longitud del CAI
         * ingresado sea de 12 dígitos*/
        String cai = getCAI().trim();
        if (cai.length() < 12)
        {
            log.saveError("Autorizaciones", "CAI incorrecto debe contener 12 dígitos");
            return false;
        }

        return true;
    }   //  beforeSave
}
