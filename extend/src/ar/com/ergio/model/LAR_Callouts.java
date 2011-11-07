package ar.com.ergio.model;

import java.util.Properties;

import org.compiere.model.CalloutEngine;
import org.compiere.model.GridField;
import org.compiere.model.GridTab;
import org.compiere.util.AdempiereSystemError;

public class LAR_Callouts extends CalloutEngine {

    public String normalizeCuit(Properties ctx, int windowNo, GridTab mTab, GridField mField,
            Object value) throws AdempiereSystemError {
        String localValue = ((String) mTab.getValue("TaxID")).replaceAll("[^0123456789]", "");
        mTab.setValue("TaxID",localValue);
                   return "";
            }

    public String normalizeIibb(Properties ctx, int windowNo, GridTab mTab, GridField mField,
            Object value) throws AdempiereSystemError {
                   mTab.setValue("DUNS",((String)mTab.getValue("DUNS")).replaceAll("[^0123456789]", ""));
                   return "";
            }
}