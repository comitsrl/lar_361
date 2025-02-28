/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2006 ComPiere, Inc. All Rights Reserved.                *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 * For the text or an alternative of this public license, you may reach us    *
 * ComPiere, Inc., 2620 Augustine Dr. #245, Santa Clara, CA 95054, USA        *
 * or via info@compiere.org or http://www.compiere.org/license.html           *
 *****************************************************************************/
package ar.com.ergio.process;

import java.util.logging.Level;

import org.compiere.model.MInvoice;
import org.compiere.model.MPayment;
import org.compiere.model.MPaymentAllocate;
import org.compiere.process.DocAction;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereUserError;
import org.compiere.util.Env;

import ar.com.ergio.model.MLARPaymentHeader;

/**
 *  Generar Orden de Pago automatica, desde Factura de Compra.
 *
 *  @author fchiappano Franco Chiappano - http://www.comit.com.ar
 *
 */
public class LAR_GenerarOrdenPago extends SvrProcess
{
    /** The Record                      */
    private int     p_Record_ID = 0;
    private boolean completar = false;
    private int lar_Deposito_Directo_ID = 0;
    private int c_BankAccount_ID = 0;
    private int c_DocType_ID = 0;

    @Override
    protected void prepare()
    {
        ProcessInfoParameter[] para = getParameter();
        for (int i = 0; i < para.length; i++)
        {
            String name = para[i].getParameterName();

            if (para[i].getParameter() == null)
                ;
            else if (name.equals("C_BankAccount_ID"))
            {
                c_BankAccount_ID = para[i].getParameterAsInt();
            }
            else if (name.equals("C_DocType_ID"))
            {
                c_DocType_ID = para[i].getParameterAsInt();
            }
            else if (name.equals("LAR_Deposito_Directo_ID"))
            {
                lar_Deposito_Directo_ID = para[i].getParameterAsInt();
            }
            else if (name.equals("Completar"))
            {
                completar = para[i].getParameterAsBoolean();
            }
            else
            {
                log.log(Level.SEVERE, "Unknown Parameter: " + name);
            }
        }
        p_Record_ID = getRecord_ID();
    } // prepare

    @Override
    protected String doIt() throws Exception
    {
        // @fchiappano recuperar la factura a pagar.
        MInvoice factura = new MInvoice(getCtx(), p_Record_ID, get_TrxName());

        // @fchiappano Crear cabecera de pago.
        MLARPaymentHeader paymentHeader = new MLARPaymentHeader(getCtx(), 0, get_TrxName());
        paymentHeader.setAD_Org_ID(factura.getAD_Org_ID());
        paymentHeader.setC_BankAccount_ID(c_BankAccount_ID);
        paymentHeader.setC_DocType_ID(c_DocType_ID);
        paymentHeader.setC_BPartner_ID(factura.getC_BPartner_ID());
        paymentHeader.setDateTrx(Env.getContextAsDate(getCtx(), "#Date"));
        paymentHeader.setDocStatus(DocAction.STATUS_Drafted);
        paymentHeader.setIsReceipt(false);
        paymentHeader.setC_Invoice_ID(factura.getC_Invoice_ID());
        if (!paymentHeader.save(get_TrxName()))
            throw new AdempiereUserError("Error al crear cabecera de Orden de Pago");

        // @fchiappano Crear PaymentAllocate (Pestaña factura de OP).
        MPaymentAllocate allocate = new MPaymentAllocate(getCtx(), 0, get_TrxName());
        allocate.setAD_Org_ID(factura.getAD_Org_ID());
        allocate.set_ValueOfColumn("LAR_PaymentHeader_ID", paymentHeader.getLAR_PaymentHeader_ID());
        allocate.setInvoiceAmt(factura.getGrandTotal());
        allocate.setAmount(factura.getGrandTotal());
        allocate.setC_Invoice_ID(factura.getC_Invoice_ID());
        allocate.set_ValueOfColumn("C_Currency_ID", factura.getC_Currency_ID());
        if (!allocate.save(get_TrxName()))
            throw new AdempiereUserError("Error al vincular Orden Pago con Factura.");

        // @fchiappano Crear Detalle del Pago.
        MPayment payment = new MPayment(getCtx(), 0, get_TrxName());
        payment.setAD_Org_ID(factura.getAD_Org_ID());
        payment.setTenderType(MPayment.TENDERTYPE_DirectDeposit);
        payment.setIsReceipt(false);
        payment.setC_BPartner_ID(factura.getC_BPartner_ID());
        payment.set_ValueOfColumn("LAR_PaymentHeader_ID", paymentHeader.getLAR_PaymentHeader_ID());
        payment.setAmount(factura.getC_Currency_ID(), factura.getGrandTotal());
        payment.setC_BankAccount_ID(c_BankAccount_ID);
        payment.set_ValueOfColumn("LAR_Deposito_Directo_ID", lar_Deposito_Directo_ID);
        if (!payment.save(get_TrxName()))
            throw new AdempiereUserError("Error al crear detalle de Orden de Pago");

        if (completar)
        {
            if (!paymentHeader.processIt(MPayment.ACTION_Complete) || !paymentHeader.save(get_TrxName()))
                throw new AdempiereUserError("Error al completar OP: " + paymentHeader.getProcessMsg());
        }

        return  "Orden de Pago Generada: " + paymentHeader.getDocumentNo();
    } // doIt

} // LAR_GenerarOrdenPago
