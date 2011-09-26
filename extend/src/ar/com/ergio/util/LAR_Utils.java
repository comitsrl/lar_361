package ar.com.ergio.util;

import java.sql.ResultSet;
import java.util.Properties;
import org.compiere.model.X_AD_Reference;

public class LAR_Utils extends X_AD_Reference {

    private static final long serialVersionUID = -8128704971497452535L;

    private LAR_Utils (Properties ctx, ResultSet rs, String trxName) {
        super(ctx, rs, trxName);
    }
}
