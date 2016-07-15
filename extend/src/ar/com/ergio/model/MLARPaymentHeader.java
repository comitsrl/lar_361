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
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;

import javax.swing.JDialog;

import org.compiere.Adempiere;
import org.compiere.apps.ADialog;
import org.compiere.model.MAllocationHdr;
import org.compiere.model.MAllocationLine;
import org.compiere.model.MBPartner;
import org.compiere.model.MDocType;
import org.compiere.model.MInvoice;
import org.compiere.model.MPayment;
import org.compiere.model.MPaymentAllocate;
import org.compiere.model.ModelValidationEngine;
import org.compiere.model.ModelValidator;
import org.compiere.model.Query;
import org.compiere.process.DocAction;
import org.compiere.process.DocOptions;
import org.compiere.process.DocumentEngine;
import org.compiere.util.DB;
import org.compiere.util.Env;

/**
 * Payment Header
 *
 * @author Wagner Germán
 *
 * @contributor Marcos Zuñiga - http://www.ergio.com.ar
 */
public class MLARPaymentHeader extends X_LAR_PaymentHeader implements DocAction, DocOptions
{
	/**
	 *
	 */
	private static final long serialVersionUID = -2698873064570244615L;

	/** Process Message             */
    private String      m_processMsg = null;
    /** Just Prepared Flag          */
    private boolean     m_justPrepared = false;

    /**
     * Recupera la cabecera de pagos relacionada con el id de la factura dada
     *
     * @param ctx
     *        contexto
     * @param C_Invoice_ID
     *        id de factura
     * @param trxName
     *        nombre de la transacción
     * @return Cabecera de pago asociada a la factura dada
     */
    public static MLARPaymentHeader getFromInvoice(final Properties ctx, int C_Invoice_ID, final String trxName)
    {
        final String whereClause = COLUMNNAME_C_Invoice_ID + "=?";
        final MLARPaymentHeader header = new Query(ctx, Table_Name, whereClause, trxName)
                                                .setParameters(C_Invoice_ID)
                                                .setClient_ID()
                                                .setOnlyActiveRecords(true)
                                                .firstOnly();
        return header;
    }

    /**
     * Actualiza la retenci\u00f3n y el total de pago en la cabecera via sql.
     * (Esta forma evita el disparo de la validaci\u00f3n)
     *
     * @return verdadero si se actualiza la cabecera
     */
    public static boolean updateHeaderWithholding(int LAR_PaymentHeader_ID, String trxName)
    {
        String sql = "UPDATE LAR_PaymentHeader"
                   + "   SET WithholdingAmt ="
                   + "         (SELECT COALESCE(SUM(TaxAmt),0)"
                   + "            FROM LAR_PaymentWithholding iw"
                   + "           WHERE iw.IsActive='Y'"
                   + "             AND LAR_PaymentHeader.LAR_PaymentHeader_ID=iw.LAR_PaymentHeader_ID)"
                   + "     , PayHeaderTotalAmt = "
                   + "         (SELECT COALESCE(SUM(PayAmt),0)"
                   + "            FROM C_Payment p"
                   + "           WHERE p.IsActive='Y'"
                   + "             AND LAR_PaymentHeader.LAR_PaymentHeader_ID=p.LAR_PaymentHeader_ID)"
                   + "          + "
                   + "         (SELECT COALESCE(SUM(TaxAmt),0)"
                   + "            FROM LAR_PaymentWithholding iw"
                   + "           WHERE iw.IsActive='Y'"
                   + "             AND LAR_PaymentHeader.LAR_PaymentHeader_ID=iw.LAR_PaymentHeader_ID)"
                   + " WHERE LAR_PaymentHeader_ID=?";
        int no = DB.executeUpdate(sql, LAR_PaymentHeader_ID, trxName);

        return no == 1;
    }   //  updateHeaderWithholding

    /**
     * Establece un valor al campo retención directamente (via sql)
     *
     * @param header cabecera de pago
     * @param amt importe de retención
     * @return verdadero si se actualiza la cabecera
     */
    public static boolean setWithholdingAmtDirectly(final MLARPaymentHeader header, final BigDecimal amt)
    {
        DB.executeUpdate("UPDATE LAR_PaymentHeader SET WithholdingAmt=? WHERE LAR_PaymentHeader_ID=?",
                new Object[] {amt, header.getLAR_PaymentHeader_ID()},
                true,
                header.get_TrxName());
        return true;
    }

    /**
     * Realiza el cálculo de la retención sobre la cabezera de pago dada.
     * Esto lo lleva a cabo creando un registro de retención sobre pagos
     * y un pago con el importe de la retención el campo WriteOff para su
     * posterior contabilización.
     *
     * @return cantidad de retenciones generadas o -1 en caso de error
     */
    public boolean recalcPaymentWithholding()
    {
        final MDocType dt = new MDocType(getCtx(), getC_DocType_ID(), get_TrxName());
        String genwh = dt.get_ValueAsString("GenerateWithholding");
        if (genwh == null || genwh.equals("N"))
            return true;

        // Recupera la configuración y calcula
        final MBPartner bp = new MBPartner(getCtx(), getC_BPartner_ID(), get_TrxName());
        final WithholdingConfig wc = new WithholdingConfig(bp, false);
        log.config("Withholding conf >> " + wc);

        if (wc.isCalcFromPayment() &&
                getPayHeaderTotalAmt().compareTo(wc.getPaymentThresholdMin()) >= 0)
        {
            // Crea la retención
            BigDecimal taxAmt = getPayHeaderTotalAmt().multiply(wc.getAliquot())
                    .setScale(2, BigDecimal.ROUND_HALF_EVEN);

            // @fchiappano verifico que existan pagos en los que se pueda generar la retención.
            boolean retener = false;
            for (MPayment payment : getPayments(get_TrxName()))
            {
                if (!payment.getTenderType().equals("Z") && payment.getPayAmt().compareTo(taxAmt) >= 0)
                {
                    retener = true;
                    break;
                }
            }

            if (!retener)
            {
                JDialog dialog = new JDialog();
                dialog.setIconImage(Adempiere.getImage16());
                ADialog.warn(1, dialog, "No existen pagos, con el monto suficiente para realizar la retención."
                        + " Recuerde que no es posible realizar una retención desde un Cheque de Terceros.");
            }

            final MLARPaymentWithholding pwh = MLARPaymentWithholding.get(this);
            pwh.setLAR_PaymentHeader_ID(getLAR_PaymentHeader_ID());
            pwh.setC_Tax_ID(wc.getC_Tax_ID());
            pwh.setLCO_WithholdingRule_ID(wc.getWithholdingRule_ID());
            pwh.setLCO_WithholdingType_ID(wc.getWithholdingType_ID());
            pwh.setDateAcct(Env.getContextAsDate(getCtx(), "#Date"));
            pwh.setDateTrx(Env.getContextAsDate(getCtx(), "#Date"));
            pwh.setPercent(wc.getRate());
            pwh.setProcessed(false);
            pwh.setTaxAmt(taxAmt);
            pwh.setTaxBaseAmt(getPayHeaderTotalAmt());
            // Cuando se guarda la retención, se actualiza la cabecera
            // de pago con mediante MLARPaymentWithholding.afterSave()
            if (!pwh.save(get_TrxName()))
                return false;
        }
        return true;
    } // recalcPaymentWithholding

    /**
     * Constructor tradicional para una cabecera de cobros/pagos
     *
     * @param ctx
     *        contexto
     * @param LAR_PaymentHeader_ID
     *        ID de la cabecera a crear o 0 si es nueva
     * @param trxName
     *        nombre de la transacción
     */
	public MLARPaymentHeader (Properties ctx, int LAR_PaymentHeader_ID, String trxName)
	{
		super (ctx, LAR_PaymentHeader_ID, trxName);
	}	//	MLARPaymentHeader

    /**
     * Constructor de carga para las cabecera de cobros/pagos
     *
     * @param ctx
     *        contexto
     * @param rs
     *        result conjunto de resultado (jdbc)
     * @param trxName
     *        nombre de la transaction
     */
	public MLARPaymentHeader (Properties ctx, ResultSet rs, String trxName)
	{
		super(ctx, rs, trxName);
	}	//	MLARPaymentHeader

	@Override
	protected boolean beforeSave(boolean newRecord)
	{
	    // TODO - Think about implement a determination of DocType similar to in MPayment.beforeSave()
		if(!newRecord)
		{
			MPayment[] pays = getPayments(get_TrxName());

            for (int i = 0; i < pays.length; i++)
			{
				pays[i].setC_DocType_ID(getC_DocType_ID());
				pays[i].setDocumentNo(getDocumentNo());
				pays[i].setDateTrx(getDateTrx());
				pays[i].setDateAcct(getDateTrx());
				pays[i].setC_BPartner_ID(getC_BPartner_ID());
				pays[i].setIsReceipt(isReceipt());
				pays[i].setIsActive(isActive());
				if(!pays[i].save(get_TrxName()))
				{
					try
					{
						DB.rollback(false, get_TrxName());
					}
					catch (SQLException e)
					{
					    log.log(Level.SEVERE, e.getLocalizedMessage(), e);
					}
					return false;
				}
			}
		}
		return true;
	} // beforeSave

	/**
	 * @param success
	 */
	@Override
	protected boolean afterDelete(boolean success)
	{
		if(success)
		{
            MPayment[] pays = getPayments(get_TrxName());
            for (int i = 0; i < pays.length; i++)
            {
                if (!pays[i].delete(false, get_TrxName()))
                {
                    String msg = "No se pudo eliminar alguno de los pagos vinculados al documento que"
                            + "se está eliminando. Se cancelará la operación";
                    log.severe(msg);
                    ADialog.error(0, null, msg);
                    return false;
                }
            }
        }
        return success;
	} // afterDelete

	/**
	 * Devuelve un array con todos los payments vinculados a la cabecera
	 * @param trxName
	 * @return MPayment[] array con los pagos vinculados al documento
	 * @throws SQLException
	 */
	public MPayment[] getPayments(String trxName)
	{
	    //TODO - Analize genereate a cache for this payments
		List<MPayment> pays = new ArrayList<MPayment>();
		// @mzuniga -  Se Agrega la condición de ordenamiento, recupera primero las retenciones
        String sql = "SELECT * FROM C_Payment WHERE LAR_PaymentHeader_ID = ? ORDER BY EsRetencionSufrida DESC";

		PreparedStatement pstmt;
		pstmt = DB.prepareStatement(sql, trxName);
		ResultSet rs=null;

		try
		{
		    pstmt.setInt(1, getLAR_PaymentHeader_ID());
			rs = pstmt.executeQuery();
			while(rs.next())
				pays.add(new MPayment(getCtx(),rs,trxName));

			return pays.toArray(new MPayment[pays.size()]);
		}
		catch (SQLException e)
		{
			log.log(Level.SEVERE, sql, e);
			return new MPayment[0];
		}
		finally
		{
			DB.close(rs, pstmt);
			rs = null; pstmt = null;
		}
	} // getPayments

	/**
	 * 	Process document
	 *	@param processAction document action
	 *	@return true if performed
	 */
	public boolean processIt (String processAction)
	{
        m_processMsg = null;
        DocumentEngine engine = new DocumentEngine (this, getDocStatus());
        return engine.processIt (processAction, getDocAction());
	}	//	processIt


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
        log.info(toString());
        // Dispara la validación del documento
        m_processMsg = ModelValidationEngine.get().fireDocValidate(this, ModelValidator.TIMING_BEFORE_PREPARE);
        if (m_processMsg != null)
            return DocAction.STATUS_Invalid;

        // Validar que la cabecera tiene al menos un cobro/pago
        MPayment[] pays = getPayments(get_TrxName());
        if (pays.length == 0)
        {
            ADialog.error(0, null, "El recibo no tiene cobros");
            return DocAction.STATUS_Invalid;
        }
        // Recibos: Validar que la suma de los Pagos Retención sea >=
        // que la suma del importe abierto (impago) de las facturas
        // @begin
        if (this.isReceipt())
        {
            BigDecimal sumPagosRet = Env.ZERO;
            for (int p = 0; p < pays.length; p++)
                if (pays[p].get_ValueAsBoolean("EsRetencionSufrida"))
                    sumPagosRet = sumPagosRet.add(pays[p].getWriteOffAmt());
            // Si existen Pagos Retención
            if (!(sumPagosRet.compareTo(Env.ZERO) == 0))
            {
                MPaymentAllocate[] invoices = getInvoices(get_TrxName());
                BigDecimal sumaFacturas = Env.ZERO;
                for (int i = 0; i < invoices.length; i++)
                    sumaFacturas = sumaFacturas.add(invoices[i].getAmount());

                if (sumaFacturas.compareTo(sumPagosRet) == -1)
                {
                    ADialog.error(0, null,
                            "El importe de las Retenciones es mayor que el de las Facturas");
                    return DocAction.STATUS_Invalid;
                }
            }
        }
        // @end

        // Dispara la validación del documento
        m_processMsg = ModelValidationEngine.get().fireDocValidate(this, ModelValidator.TIMING_AFTER_PREPARE);
        if (m_processMsg != null)
            return DocAction.STATUS_Invalid;

        m_justPrepared = true;
        if (!DOCACTION_Complete.equals(getDocAction()))
            setDocAction(DOCACTION_Complete);
        return DocAction.STATUS_InProgress;
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
        log.info(toString());

        //  Re-Check
        if (!m_justPrepared)
        {
            String status = prepareIt();
            if (!DocAction.STATUS_InProgress.equals(status))
                return status;
        }

        // Dispara la validación del documento
        m_processMsg = ModelValidationEngine.get().fireDocValidate(this,
                ModelValidator.TIMING_BEFORE_COMPLETE);
        if (m_processMsg != null)
            return DocAction.STATUS_Invalid;

        MPayment[] pays = getPayments(get_TrxName());
        int p = 0;
        for (; p < pays.length; p++)
        {
            pays[p].setDateAcct(getDateTrx());
            pays[p].setDateTrx(getCreated());
            pays[p].setTrxType(MPayment.TRXTYPE_CreditPayment);
            pays[p].processIt(ACTION_Complete);
            pays[p].save(get_TrxName());
            if (!DOCSTATUS_Completed.equals(pays[p].getDocStatus()))
            {
                m_processMsg = "@C_Payment_ID@: " + pays[p].getProcessMsg();
                return DocAction.STATUS_Invalid;
            }
        }
        // Asigna los cobros/pagos a las facturas
        MPaymentAllocate[] invoices = getInvoices(get_TrxName());
        if (invoices.length != 0)
        {
            p = 0;
            // Asignaciones
            for (int i = 0; (i < invoices.length && p < pays.length);)
            {
                MAllocationHdr alloc = new MAllocationHdr(getCtx(), false, getDateTrx(),
                        getC_Currency_ID(), "Asignación Pagos a Facturas - Cabecera: "
                                + getDocumentNo(), get_TrxName());
                alloc.setAD_Org_ID(getAD_Org_ID());
                if (!alloc.save())
                {
                    log.severe("La Cabecera de Asignacion no pudo crearse");
                    return DocAction.STATUS_Invalid;
                }
                MPaymentAllocate pa = invoices[i];
                MInvoice invoice = new MInvoice(Env.getCtx(), pa.getC_Invoice_ID(), get_TrxName());
                int comp = (pays[p].getPayAmt().add(pays[p].getWriteOffAmt()).subtract(pays[p]
                        .getAllocatedAmt())).compareTo(invoice.getOpenAmt());
                MAllocationLine aLine = null;
                BigDecimal alineOUAmt = pa.getOverUnderAmt();
                BigDecimal alineAmt;
                // Evita Sobrepagos
                if (!((comp != -1) && (comp != 0)))
                {
                    alineAmt = pays[p].getPayAmt().add(pays[p].getWriteOffAmt())
                            .subtract(pays[p].getAllocatedAmt());
                    alineOUAmt = invoice.getOpenAmt().subtract(alineAmt);
                } else
                    alineAmt = invoice.getOpenAmt();
                if (isReceipt())
                    aLine = new MAllocationLine(alloc, alineAmt, pa.getDiscountAmt(),
                            pa.getWriteOffAmt(), alineOUAmt);
                else
                    aLine = new MAllocationLine(alloc, alineAmt.negate(), pa.getDiscountAmt()
                            .negate(), pa.getWriteOffAmt().negate(), alineOUAmt.negate());
                aLine.setDocInfo(pa.getC_BPartner_ID(), 0, pa.getC_Invoice_ID());
                aLine.setPaymentInfo(pays[p].getC_Payment_ID(), 0);
                if (!aLine.save(get_TrxName()))
                    log.warning("Asignación: No se pudo guradar la línea");
                else
                {
                    pa.setC_AllocationLine_ID(aLine.getC_AllocationLine_ID());
                    pa.saveEx();
                }
                if (comp != -1)
                {
                    i = i + 1;
                    if (comp == 0)
                        p = p + 1;
                } else
                    p = p + 1;
                // Cabecera de Asignación: Comienzo de WF
                alloc.processIt(DocAction.ACTION_Complete);
                alloc.save(get_TrxName());
                m_processMsg = "@C_AllocationHdr_ID@: " + alloc.getDocumentNo();
                log.fine(m_processMsg);
            }
        }
        // setC_BankAccount_ID(C_BankAccount_ID);
        // Dispara la validación del documento
        m_processMsg = ModelValidationEngine.get().fireDocValidate(this,
                ModelValidator.TIMING_AFTER_COMPLETE);
        if (m_processMsg != null)
            return DocAction.STATUS_Invalid;
        // @mzuniga - Marca los cobros/pagos como asignados si corresponde
        for (p = 0; p < pays.length; p++)
        {
            pays[p].testAllocation();
            pays[p].saveEx();
        }
        setDocStatus(ACTION_Complete);
        setDocAction(DOCACTION_Close);
        setProcessed(true);
        return DocAction.STATUS_Completed;
    } // completeIt

    @Override
    public boolean voidIt()
    {
        log.info(toString());

        // Dispara la validación del documento
        m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_BEFORE_VOID);
        if (m_processMsg != null)
            return false;

        // Cheque si ya fue procesado
        if (DOCSTATUS_Closed.equals(getDocStatus()) || DOCSTATUS_Voided.equals(getDocStatus()))
        {
            m_processMsg = "Documento cerrado: " + getDocStatus();
            setDocAction(DOCACTION_None);
            return false;
        }

        // Procesa la anulación
        // NOTA: No se tiene el concepto de "reversión" de las cabeceras de cobros/pagos.
        MPayment[] pays = getPayments(get_TrxName());

        for(int i = 0; i < pays.length; i++)
        {
            pays[i].processIt(ACTION_Void);
            pays[i].save(get_TrxName());
            if (!DOCSTATUS_Voided.equals(pays[i].getDocStatus()))
            {
                m_processMsg = "@C_Payment_ID@: " + pays[i].getProcessMsg();
                return false;
            }
        }

        // Dispara la validación del documento
        m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_AFTER_VOID);
        if (m_processMsg != null)
            return false;

        setProcessed(true);
        setDocStatus(ACTION_Void);
        setDocAction(DOCACTION_None);
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
        return "Cabecera " + getDocumentNo();
    }

    @Override
    public File createPDF()
    {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Operación no soportada");
    }

    @Override
    public String getProcessMsg()
    {
        return m_processMsg;
    }

    @Override
    public int getDoc_User_ID()
    {
        return getCreatedBy();
    }

    @Override
    public int getC_Currency_ID()
    {
        // TODO - Si es necesario, agregar la columna C_Currency_ID a la
        //        tabla LAR_PaymentHeader y generar el modelo nuevamente
        return Env.getContextAsInt(getCtx(), "$C_Currency_ID"); // ARS
    }

    @Override
    public BigDecimal getApprovalAmt()
    {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Operación no soportada");
    }

    @Override
    public int customizeValidActions(String docStatus, Object processing, String orderType, String isSOTrx, int AD_Table_ID,
            String[] docAction, String[] options, int index)
    {
        // Este método permite agregar las acciones necesarias para
        // operar con el documento "cabecera"
        if (AD_Table_ID == Table_ID)
        {
            //  Complete
            if (docStatus.equals(DocumentEngine.STATUS_Completed))
                options[index++] = DocumentEngine.ACTION_Void;
        }
        return index;
    }

	@Override
	public String toString()
	{
        StringBuffer sb = new StringBuffer ("MLARPaymentHeader[");
        sb.append(get_ID()).append("-").append(getDocumentNo())
            .append(",Receipt=").append(isReceipt())
            .append(",DocStatus=").append(getDocStatus())
            .append ("]");
        return sb.toString ();
	}

    public MPaymentAllocate[] getInvoices(String trxName)
    {
        // TODO - Analize genereate a cache for this invoices
        List<MPaymentAllocate> invoices = new ArrayList<MPaymentAllocate>();

        String sql = "SELECT * FROM C_PaymentAllocate WHERE LAR_PaymentHeader_ID = ?";

        PreparedStatement pstmt;
        pstmt = DB.prepareStatement(sql, trxName);
        ResultSet rs = null;

        try
        {
            pstmt.setInt(1, getLAR_PaymentHeader_ID());
            rs = pstmt.executeQuery();
            while (rs.next())
                invoices.add(new MPaymentAllocate(getCtx(), rs, trxName));

            return invoices.toArray(new MPaymentAllocate[invoices.size()]);
        } catch (SQLException e)
        {
            log.log(Level.SEVERE, sql, e);
            return new MPaymentAllocate[0];
        } finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }
    } // getInvoices

}	//	MLARPaymentHeader