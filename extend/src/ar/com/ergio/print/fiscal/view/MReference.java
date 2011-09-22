package ar.com.ergio.print.fiscal.view;

import java.sql.ResultSet;
import java.util.Properties;
import org.compiere.model.X_AD_Reference;
import org.compiere.util.DB;

public class MReference extends X_AD_Reference {

    private static final long serialVersionUID = -1090021864775486956L;

    public MReference(Properties ctx, ResultSet rs, String trxName) {
        super(ctx, rs, trxName);
    }		
    
    public MReference(Properties ctx, int AD_Reference_ID, String trxName) {
        super(ctx, AD_Reference_ID, trxName);
    }
    
    public static int getReferenceID(String refName)
    {
    	return DB.getSQLValue(null, " SELECT AD_Reference_ID FROM AD_Reference WHERE name = ? ", refName);
    }
    
    public static String getReferenceName(int refID)
    {
    	return DB.getSQLValueString(null, " SELECT name FROM AD_Reference WHERE AD_Reference_ID = ? ", refID);
    }
    
}
