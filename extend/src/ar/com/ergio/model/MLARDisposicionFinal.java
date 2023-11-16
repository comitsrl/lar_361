/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2007 ComPiere, Inc. All Rights Reserved.                *
 * This program is free software, you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY, without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program, if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
package ar.com.ergio.model;

import java.io.File;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.util.Properties;

import org.compiere.model.MDocType;
import org.compiere.model.MInvoice;
import org.compiere.process.DocAction;
import org.compiere.process.DocOptions;
import org.compiere.process.DocumentEngine;

/**
 * Modelo de clases para certificados de disposición final.
 *
 * @author Franco Chiappano - www.comit.com.ar
 */
public class MLARDisposicionFinal extends X_LAR_DisposicionFinal implements DocAction, DocOptions
{

    private static final long serialVersionUID = -1290256347740054129L;

    /** Process Message */
    private String m_processMsg = null;

    public MLARDisposicionFinal(Properties ctx, int LAR_DisposicionFinal_ID, String trxName)
    {
        super(ctx, LAR_DisposicionFinal_ID, trxName);
    }

    /** Load Constructor */
    public MLARDisposicionFinal(Properties ctx, ResultSet rs, String trxName)
    {
        super(ctx, rs, trxName);
    }

    @Override
    public int customizeValidActions(String docStatus, Object processing, String orderType, String isSOTrx,
            int AD_Table_ID, String[] docAction, String[] options, int index)
    {
        if (AD_Table_ID == Table_ID)
        {
            //  Complete
            if (docStatus.equals(DocumentEngine.STATUS_Completed))
                options[index++] = DocumentEngine.ACTION_Void;
        }
        return index;
    } // customizeValidActions

    @Override
    public boolean processIt(String action) throws Exception
    {
        m_processMsg = null;
        DocumentEngine engine = new DocumentEngine(this, getDocStatus());
        return engine.processIt(action, getDocAction());
    }

    @Override
    public boolean unlockIt()
    {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean invalidateIt()
    {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public String prepareIt()
    {
        return DOCSTATUS_InProgress;
    }

    @Override
    public boolean approveIt()
    {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean rejectIt()
    {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public String completeIt()
    {
        setDocAction(DocAction.ACTION_Close);
        setProcessed(true);

        return DOCSTATUS_Completed;
    }

    @Override
    public boolean voidIt()
    {
        if (getC_Invoice_ID() > 0)
        {
            MInvoice notaDeCredito = (MInvoice) getC_Invoice();
            String docStatus = notaDeCredito.getDocStatus();
            boolean isElectronic = MDocType.isElectronicDocType(notaDeCredito.getC_DocType_ID());

            // @fchiappano si la nota de credito generada es electronica y se
            // encuentra autorizada, no permitir anular el certificado de
            // disposición final.
            if (isElectronic && (docStatus.equals("CO") || docStatus.equals("CL")))
            {
                m_processMsg = "No es posible anular el documento, ya que posee una Nota de Crédito generada y autorizada electrónicamente.";
                return false;
            }
            else
            {
                if (!notaDeCredito.processIt(DocAction.ACTION_Void))
                {
                    m_processMsg = "No fue posible anular NC asociada: " + notaDeCredito.getProcessMsg();
                    return false;
                }

                notaDeCredito.saveEx(get_TrxName());
            }
        }
        setDocAction(DocAction.ACTION_None);
        setProcessed(true);

        return true;
    }

    @Override
    public boolean closeIt()
    {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean reverseCorrectIt()
    {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean reverseAccrualIt()
    {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public boolean reActivateIt()
    {
        // TODO Auto-generated method stub
        return false;
    }

    @Override
    public String getSummary()
    {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public String getDocumentInfo()
    {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public File createPDF()
    {
        // TODO Auto-generated method stub
        return null;
    }

    @Override
    public String getProcessMsg()
    {
        return m_processMsg;
    }

    @Override
    public int getDoc_User_ID()
    {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public int getC_Currency_ID()
    {
        // TODO Auto-generated method stub
        return 0;
    }

    @Override
    public BigDecimal getApprovalAmt()
    {
        // TODO Auto-generated method stub
        return null;
    }

}
