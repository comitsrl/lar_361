package ar.com.ergio.model;

import java.sql.ResultSet;
import java.util.Properties;

public class MLARRegistroRemuneraciones extends X_LAR_Registro_Remuneraciones
{

    public MLARRegistroRemuneraciones(Properties ctx, ResultSet rs, String trxName)
    {
        super(ctx, rs, trxName);
    }

    /**
     * 
     */
    private static final long serialVersionUID = -5252218712024329783L;

    public MLARRegistroRemuneraciones(Properties ctx, int LAR_Registro_Remuneraciones_ID,
            String trxName)
    {
        super(ctx, LAR_Registro_Remuneraciones_ID, trxName);
        // TODO Auto-generated constructor stub
    }

}
