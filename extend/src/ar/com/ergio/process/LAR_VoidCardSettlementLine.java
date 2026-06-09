package ar.com.ergio.process;

import org.adempiere.exceptions.AdempiereException;
import org.compiere.process.SvrProcess;

import ar.com.ergio.model.MLARCardSettlement;

public class LAR_VoidCardSettlementLine extends SvrProcess {

    @Override
    protected void prepare() {
    }

    @Override
    protected String doIt() throws Exception {
        if (getRecord_ID() <= 0)
            throw new AdempiereException("@Record_ID@ @NotFound@");
        if (getTable_ID() != MLARCardSettlement.Table_ID)
            throw new AdempiereException("@AD_Table_ID@ @Invalid@");

        MLARCardSettlement line = new MLARCardSettlement(getCtx(), getRecord_ID(), get_TrxName());
        if (line.get_ID() <= 0)
            throw new AdempiereException("@Record_ID@ @NotFound@");
        if (!MLARCardSettlement.DOCSTATUS_Completed.equals(line.getDocStatus()))
            throw new AdempiereException("@DocStatus@ @Invalid@");

        if (!line.voidIt())
            throw new AdempiereException(line.getProcessMsg());

        line.saveEx(get_TrxName());
        return "@Reversed@";
    }
}
