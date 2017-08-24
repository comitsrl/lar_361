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
package org.compiere.model;

import java.io.File;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;

import javax.swing.JFrame;

import org.compiere.Adempiere;
import org.compiere.apps.ADialog;
import org.compiere.process.DocAction;
import org.compiere.process.DocumentEngine;
import org.compiere.util.DB;
import org.compiere.util.Env;
import org.compiere.util.KeyNamePair;
import org.compiere.util.Msg;

import ar.com.ergio.model.TransaccionCuentaBancaria;
 
/**
*	Bank Statement Model
*
*  @author Eldir Tomassen/Jorg Janke
*  @author victor.perez@e-evolution.com, e-Evolution http://www.e-evolution.com
*   <li> BF [ 1933645 ] Wrong balance Bank Statement
*   @see http://sourceforge.net/tracker/?func=detail&atid=879332&aid=1933645&group_id=176962
* 	<li> FR [ 2520591 ] Support multiples calendar for Org 
*	@see http://sourceforge.net/tracker2/?func=detail&atid=879335&aid=2520591&group_id=176962
* 	<li> BF [ 2824951 ] The payments is not release when Bank Statement is void 
*	@see http://sourceforge.net/tracker/?func=detail&aid=2824951&group_id=176962&atid=879332
*  @author Teo Sarca, http://www.arhipac.ro
* 	<li>FR [ 2616330 ] Use MPeriod.testPeriodOpen instead of isOpen
* 		https://sourceforge.net/tracker/?func=detail&atid=879335&aid=2616330&group_id=176962
*  
*   @version $Id: MBankStatement.java,v 1.3 2006/07/30 00:51:03 jjanke Exp $
*/
public class MBankStatement extends X_C_BankStatement implements DocAction
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -859925588789443186L;

	/**
	 * 	Standard Constructor
	 *	@param ctx context
	 *	@param C_BankStatement_ID id
	 *	@param trxName transaction
	 */	
	public MBankStatement (Properties ctx, int C_BankStatement_ID, String trxName)
	{
		super (ctx, C_BankStatement_ID, trxName);
		if (C_BankStatement_ID == 0)
		{ 
		//	setC_BankAccount_ID (0);	//	parent
			setStatementDate (new Timestamp(System.currentTimeMillis()));	// @Date@
			setDocAction (DOCACTION_Complete);	// CO
			setDocStatus (DOCSTATUS_Drafted);	// DR
			setBeginningBalance(Env.ZERO);
			setStatementDifference(Env.ZERO);
			setEndingBalance (Env.ZERO);
			setIsApproved (false);	// N
			setIsManual (true);	// Y
			setPosted (false);	// N
			super.setProcessed (false);
		}
	}	//	MBankStatement

	/**
	 * 	Load Constructor
	 * 	@param ctx Current context
	 * 	@param rs result set
	 *	@param trxName transaction
	 */
	public MBankStatement(Properties ctx, ResultSet rs, String trxName)
	{
		super(ctx, rs, trxName);
	}	//	MBankStatement

 	/**
 	 * 	Parent Constructor
	 *	@param account Bank Account
 	 * 	@param isManual Manual statement
 	 **/
	public MBankStatement (MBankAccount account, boolean isManual)
	{
		this (account.getCtx(), 0, account.get_TrxName());
		setClientOrg(account);
		setC_BankAccount_ID(account.getC_BankAccount_ID());
		setStatementDate(new Timestamp(System.currentTimeMillis()));
		setBeginningBalance(account.getCurrentBalance());
		setName(getStatementDate().toString());
		setIsManual(isManual);
	}	//	MBankStatement
	
	/**
	 * 	Create a new Bank Statement
	 *	@param account Bank Account
	 */
	public MBankStatement(MBankAccount account)
	{
		this(account, false);
	}	//	MBankStatement
 
	/**	Lines							*/
	private MBankStatementLine[] 	m_lines = null;
	
 	/**
 	 * 	Get Bank Statement Lines
 	 * 	@param requery requery
 	 *	@return line array
 	 */
 	public MBankStatementLine[] getLines (boolean requery)
 	{
		if (m_lines != null && !requery) {
			set_TrxName(m_lines, get_TrxName());
			return m_lines;
		}
		//
		final String whereClause = I_C_BankStatementLine.COLUMNNAME_C_BankStatement_ID+"=?";
		List<MBankStatementLine> list = new Query(getCtx(),I_C_BankStatementLine.Table_Name,whereClause,get_TrxName())
		.setParameters(getC_BankStatement_ID())
		.setOrderBy("Line")
		.list();
		MBankStatementLine[] retValue = new MBankStatementLine[list.size()];
		list.toArray(retValue);
		return retValue;
 	}	//	getLines

 	/**
	 * 	Add to Description
	 *	@param description text
	 */
	public void addDescription (String description)
	{
		String desc = getDescription();
		if (desc == null)
			setDescription(description);
		else
			setDescription(desc + " | " + description);
	}	//	addDescription

	/**
	 * 	Set Processed.
	 * 	Propergate to Lines/Taxes
	 *	@param processed processed
	 */
	public void setProcessed (boolean processed)
	{
		super.setProcessed (processed);
		if (get_ID() == 0)
			return;
		String sql = "UPDATE C_BankStatementLine SET Processed='"
			+ (processed ? "Y" : "N")
			+ "' WHERE C_BankStatement_ID=" + getC_BankStatement_ID();
		int noLine = DB.executeUpdate(sql, get_TrxName());
		m_lines = null;
		log.fine("setProcessed - " + processed + " - Lines=" + noLine);
	}	//	setProcessed

	/**
	 * 	Get Bank Account
	 *	@return bank Account
	 */
	public MBankAccount getBankAccount()
	{
		return MBankAccount.get(getCtx(), getC_BankAccount_ID());
	}	//	getBankAccount
	
	/**
	 * 	Get Document No 
	 *	@return name
	 */
	public String getDocumentNo()
	{
		return getName();
	}	//	getDocumentNo
	
	/**
	 * 	Get Document Info
	 *	@return document info (untranslated)
	 */
	public String getDocumentInfo()
	{
		return getBankAccount().getName() + " " + getDocumentNo();
	}	//	getDocumentInfo

	/**
	 * 	Create PDF
	 *	@return File or null
	 */
	public File createPDF ()
	{
		try
		{
			File temp = File.createTempFile(get_TableName()+get_ID()+"_", ".pdf");
			return createPDF (temp);
		}
		catch (Exception e)
		{
			log.severe("Could not create PDF - " + e.getMessage());
		}
		return null;
	}	//	getPDF

	/**
	 * 	Create PDF file
	 *	@param file output file
	 *	@return file if success
	 */
	public File createPDF (File file)
	{
	//	ReportEngine re = ReportEngine.get (getCtx(), ReportEngine.INVOICE, getC_Invoice_ID());
	//	if (re == null)
			return null;
	//	return re.getPDF(file);
	}	//	createPDF

	
	/**
	 * 	Before Save
	 *	@param newRecord new
	 *	@return true
	 */
	protected boolean beforeSave (boolean newRecord)
	{
		if (! isProcessed() && getBeginningBalance().compareTo(Env.ZERO) == 0)
		{
			MBankAccount ba = getBankAccount();
			ba.load(get_TrxName());
			setBeginningBalance(ba.getCurrentBalance());
		}
        // @fchiappano Si es un cierre de caja, EndingBalance = SaldoInicial + Cheques Contabiizados + Efectivo Contabilizado.
        if (get_ValueAsBoolean("EsCierreCaja"))
            setEndingBalance(((BigDecimal) get_Value("ScrutinizedCheckAmt")).add((BigDecimal) get_Value("ScrutinizedCashAmt")));
        else
            setEndingBalance(getBeginningBalance().add(getStatementDifference()));
		return true;
	}	//	beforeSave
	
	/**************************************************************************
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
	
	/**	Process Message 			*/
	private String		m_processMsg = null;
	/**	Just Prepared Flag			*/
	private boolean		m_justPrepared = false;

	/**
	 * 	Unlock Document.
	 * 	@return true if success 
	 */
	public boolean unlockIt()
	{
		log.info("unlockIt - " + toString());
		setProcessing(false);
		return true;
	}	//	unlockIt
	
	/**
	 * 	Invalidate Document
	 * 	@return true if success 
	 */
	public boolean invalidateIt()
	{
		log.info("invalidateIt - " + toString());
		setDocAction(DOCACTION_Prepare);
		return true;
	}	//	invalidateIt
	
	/**
	 *	Prepare Document
	 * 	@return new status (In Progress or Invalid) 
	 */
	public String prepareIt()
	{
		log.info(toString());
		m_processMsg = ModelValidationEngine.get().fireDocValidate(this, ModelValidator.TIMING_BEFORE_PREPARE);
		if (m_processMsg != null)
			return DocAction.STATUS_Invalid;

		//	Std Period open?
		MPeriod.testPeriodOpen(getCtx(), getStatementDate(), MDocType.DOCBASETYPE_BankStatement, getAD_Org_ID());
		MBankStatementLine[] lines = getLines(true);
		if (lines.length == 0)
		{
			m_processMsg = "@NoLines@";
			return DocAction.STATUS_Invalid;
		}
		//	Lines
		BigDecimal total = Env.ZERO;
		Timestamp minDate = getStatementDate();
		Timestamp maxDate = minDate;
		for (int i = 0; i < lines.length; i++)
		{
			MBankStatementLine line = lines[i];
			total = total.add(line.getStmtAmt());
			if (line.getDateAcct().before(minDate))
				minDate = line.getDateAcct(); 
			if (line.getDateAcct().after(maxDate))
				maxDate = line.getDateAcct(); 
		}

		// @fchiappano Si es un cierre de caja, sumo los cheques en cartera
		// y los que fueron utilizados en alguna orden de pago, pero que la misma
		// aun no fue conciliada en algun cierre de cajas anterior.
		if (get_ValueAsBoolean("EsCierreCaja"))
		{
		    String sql = "SELECT COALESCE (SUM(pa.PayAmt),0) + COALESCE((SELECT SUM(pa.PayAmt)"
                       + "                                                 FROM C_Payment pa"
                       + "                                                WHERE pa.C_BankAccount_ID=? AND pa.IsReceipt='N'"
                       + "                                                                            AND pa.DocStatus IN ('CO','CL')"
                       + "                                                                            AND pa.TenderType IN ('K','Z')"
                       + "                                                                            AND pa.IsReconciled='N'"
                       + "                                                                            AND pa.LAR_Cheque_Emitido_ID IS NULL"
                       + "                                                                            AND pa.LAR_PaymentSource_ID > 0"
                       + "                                                                            AND pa.LAR_PaymentSource_ID NOT IN (SELECT sli.C_Payment_ID"
                       + "                                                                                                                  FROM C_BankStatementLine sli"
                       + "                                                                                                                 WHERE sli.C_BankStatement_ID=?)),0)"
		               + "  FROM C_Payment pa"
		               + " WHERE pa.C_BankAccount_ID=? AND pa.IsOnDrawer='Y'"
                       + "                             AND pa.IsReceipt='Y'"
                       + "                             AND pa.DocStatus IN ('CO','CL')"
                       + "                             AND pa.TenderType IN ('K','Z')"
                       + "                             AND pa.C_Payment_ID NOT IN (SELECT sli.C_Payment_ID"
                       + "                                                           FROM C_BankStatementLine sli"
                       + "                                                          WHERE sli.C_BankStatement_ID=?)";

		    PreparedStatement pstmt = null;
	        ResultSet rs = null;
	        try
	        {
	            pstmt = DB.prepareStatement(sql, null);
	            pstmt.setInt(1, getC_BankAccount_ID());
	            pstmt.setInt(2, getC_BankStatement_ID());
	            pstmt.setInt(3, getC_BankAccount_ID());
                pstmt.setInt(4, getC_BankStatement_ID());
	            rs = pstmt.executeQuery();

	            if (rs.next())
	                total = total.add(rs.getBigDecimal(1));
	        }
	        catch (SQLException eSql)
	        {
	            log.log(Level.SEVERE, sql, eSql);
	        }
	        finally
	        {
	            DB.close(rs, pstmt);
	            rs = null;
	            pstmt = null;
	        }
		}
		setStatementDifference(total);
        // @fchiappano Si es un cierre de caja, EndingBalance = SaldoInicial + Efectivo contabilizado + Cheques Contabilizados.
        if (get_ValueAsBoolean("EsCierreCaja"))
            setEndingBalance(((BigDecimal) get_Value("ScrutinizedCashAmt")).add((BigDecimal) get_Value("scrutinizedcheckamt")));
        else
            setEndingBalance(getBeginningBalance().add(total));
		MPeriod.testPeriodOpen(getCtx(), minDate, MDocType.DOCBASETYPE_BankStatement, 0);
		MPeriod.testPeriodOpen(getCtx(), maxDate, MDocType.DOCBASETYPE_BankStatement, 0);

		m_processMsg = ModelValidationEngine.get().fireDocValidate(this, ModelValidator.TIMING_AFTER_PREPARE);
		if (m_processMsg != null)
			return DocAction.STATUS_Invalid;

		
		m_justPrepared = true;
		if (!DOCACTION_Complete.equals(getDocAction()))
			setDocAction(DOCACTION_Complete);
		return DocAction.STATUS_InProgress;
	}	//	prepareIt
	
	/**
	 * 	Approve Document
	 * 	@return true if success 
	 */
	public boolean  approveIt()
	{
		log.info("approveIt - " + toString());
		setIsApproved(true);
		return true;
	}	//	approveIt
	
	/**
	 * 	Reject Approval
	 * 	@return true if success 
	 */
	public boolean rejectIt()
	{
		log.info("rejectIt - " + toString());
		setIsApproved(false);
		return true;
	}	//	rejectIt
	
	/**
	 * 	Complete Document
	 * 	@return new status (Complete, In Progress, Invalid, Waiting ..)
	 */
	public String completeIt()
	{
		//	Re-Check
		if (!m_justPrepared)
		{
			String status = prepareIt();
			if (!DocAction.STATUS_InProgress.equals(status))
				return status;
		}

		m_processMsg = ModelValidationEngine.get().fireDocValidate(this, ModelValidator.TIMING_BEFORE_COMPLETE);
		if (m_processMsg != null)
			return DocAction.STATUS_Invalid;
		
		//	Implicit Approval
		if (!isApproved())
			approveIt();
		log.info("completeIt - " + toString());
		
		//	Set Payment reconciled
		MBankStatementLine[] lines = getLines(false);
		for (int i = 0; i < lines.length; i++)
		{
			MBankStatementLine line = lines[i];
			if (line.getC_Payment_ID() != 0)
			{
				MPayment payment = new MPayment (getCtx(), line.getC_Payment_ID(), get_TrxName());
				payment.setIsReconciled(true);
				payment.saveEx(get_TrxName());
			}
		}
		//	Update Bank Account
		MBankAccount ba = getBankAccount();
		ba.load(get_TrxName());
		//BF 1933645
		ba.setCurrentBalance(ba.getCurrentBalance().add(getStatementDifference()));
		ba.saveEx(get_TrxName());
		
		//	User Validation
		String valid = ModelValidationEngine.get().fireDocValidate(this, ModelValidator.TIMING_AFTER_COMPLETE);
		if (valid != null)
		{
			m_processMsg = valid;
			return DocAction.STATUS_Invalid;
		}

		// @fchiappano tranferir todos los moviemientos de caja, a las cuentas según corresponda.
		KeyNamePair[] m_transferred = null;

		if (get_ValueAsBoolean("EsCierreCaja"))
		{
		    if (!get_ValueAsBoolean("Transferido"))
		    {
		        final Timestamp fecha = new Timestamp(System.currentTimeMillis());
		        final int C_BPartner_ID = MSysConfig.getIntValue("LAR_SdN_MovimientosDeCaja", 0, Env.getAD_Client_ID(getCtx()));
                final String descripcion = "Pago en concepto de transferencia de valores.";
                m_transferred = TransaccionCuentaBancaria.transferirValoresPorFormaPago(getC_BankStatement_ID(),
                        descripcion, C_BPartner_ID, fecha, fecha, getCtx(), get_TrxName());

                if (m_transferred[0].getName().equals("Error"))
                {
                    m_processMsg = m_transferred[1].getName();
                    return STATUS_Invalid;
                }
		    }

		    // @fchiappano actualizar columnas "fisicas" de cheques.
		    actualizarColumnasCheques();

            if (m_transferred != null)
            {
                String mensaje = m_transferred[0].getKey() + " Líneas Transferidas. \n Detalle: \n ";

                for (int x = 1; x < m_transferred.length; x ++)
                {
                    KeyNamePair value = m_transferred[x];
                    if (value.getKey() > 0)
                    {
                        mensaje = mensaje + value.getKey() + " " + value.getName() + " \n ";
                    }
                }
                final JFrame frame = new JFrame();
                frame.setIconImage(Adempiere.getImage16());
                ADialog.info(1, frame, mensaje);
            }
		}
		//
		setProcessed(true);
		setDocAction(DOCACTION_Close);
		return DocAction.STATUS_Completed;
	}	//	completeIt
	
	/**
	 * 	Void Document.
	 * 	@return false 
	 */
	public boolean voidIt()
	{
		log.info(toString());
		// Before Void
		m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_BEFORE_VOID);
		if (m_processMsg != null)
			return false;
		
		if (DOCSTATUS_Closed.equals(getDocStatus())
			|| DOCSTATUS_Reversed.equals(getDocStatus())
			|| DOCSTATUS_Voided.equals(getDocStatus()))
		{
			m_processMsg = "Document Closed: " + getDocStatus();
			setDocAction(DOCACTION_None);
			return false;
		}

		//	Not Processed
		if (DOCSTATUS_Drafted.equals(getDocStatus())
			|| DOCSTATUS_Invalid.equals(getDocStatus())
			|| DOCSTATUS_InProgress.equals(getDocStatus())
			|| DOCSTATUS_Approved.equals(getDocStatus())
			|| DOCSTATUS_NotApproved.equals(getDocStatus()) )
			;
		//	Std Period open?
		else
		{
			MPeriod.testPeriodOpen(getCtx(), getStatementDate(), MDocType.DOCBASETYPE_BankStatement, getAD_Org_ID());
			MFactAcct.deleteEx(Table_ID, getC_BankStatement_ID(), get_TrxName());
		}
		
		//Added Lines by AZ Goodwill
		//Restore Bank Account Balance
		MBankAccount ba = getBankAccount();
		ba.load(get_TrxName());
		ba.setCurrentBalance(ba.getCurrentBalance().subtract(getStatementDifference()));
		ba.saveEx();
		//End of Added Lines
			
		//	Set lines to 0
		MBankStatementLine[] lines = getLines(true);
		for (int i = 0; i < lines.length; i++)
		{
			MBankStatementLine line = lines[i];
			if (line.getStmtAmt().compareTo(Env.ZERO) != 0)
			{
				String description = Msg.getMsg(getCtx(), "Voided") + " ("
					+ Msg.translate(getCtx(), "StmtAmt") + "=" + line.getStmtAmt();
				if (line.getTrxAmt().compareTo(Env.ZERO) != 0)
					description += ", " + Msg.translate(getCtx(), "TrxAmt") + "=" + line.getTrxAmt();
				if (line.getChargeAmt().compareTo(Env.ZERO) != 0)
					description += ", " + Msg.translate(getCtx(), "ChargeAmt") + "=" + line.getChargeAmt();
				if (line.getInterestAmt().compareTo(Env.ZERO) != 0)
					description += ", " + Msg.translate(getCtx(), "InterestAmt") + "=" + line.getInterestAmt();
				description += ")";
				line.addDescription(description);
				//
				line.setStmtAmt(Env.ZERO);
				line.setTrxAmt(Env.ZERO);
				line.setChargeAmt(Env.ZERO);
				line.setInterestAmt(Env.ZERO);
				if (line.getC_Payment_ID() != 0)
				{
					MPayment payment = new MPayment (getCtx(), line.getC_Payment_ID(), get_TrxName());
					payment.setIsReconciled(false);
					payment.saveEx();
					line.setC_Payment_ID(0);

					// @fchiappano Si es un cierre de caja y el LAR_Cierre_Origen_ID es mayor a 0,
					// quiere decir que se trata de un cierre de compensacion, por lo que anulo el pago de la linea.
					if (get_ValueAsBoolean("EsCierreCaja") && get_ValueAsInt("LAR_CierreCaja_Origen_ID") > 0)
					{
					    if (!payment.voidIt())
					    {
					        m_processMsg = payment.getProcessMsg();
					        return false;
					    }
					    MPayment reverso = (MPayment) payment.getReversal();
					    reverso.setIsReconciled(true);
					    reverso.saveEx();
					    payment.setIsReconciled(true);
					    payment.saveEx();
					}
					// @fchiappano Anular cobro que acredita en cuenta destino,
					// si es que se trata de un cierre de cajas.
					else if (get_ValueAsBoolean("EsCierreCaja"))
					{
					    final String sql = "SELECT C_Payment_ID"
					                     + "  FROM C_Payment"
					                     + " WHERE LAR_PaymentSource_ID=? AND DocStatus NOT IN ('RE','VO')";
					    PreparedStatement pstmt = null;
				        ResultSet rs = null;
				        try
				        {
				            pstmt = DB.prepareStatement(sql, get_TrxName());
				            pstmt.setInt(1, payment.getC_Payment_ID());
				            rs = pstmt.executeQuery();

				            while (rs.next())
				            {
				                MPayment paymentTransferencia = new MPayment(p_ctx, rs.getInt("C_Payment_ID"), get_TrxName());
				                if (!paymentTransferencia.voidIt())
				                {
				                    m_processMsg = paymentTransferencia.getProcessMsg();
				                    return false;
				                }
				                MPayment reverso = (MPayment) paymentTransferencia.getReversal();
				                reverso.setIsReconciled(true);
				                reverso.saveEx();
				                paymentTransferencia.setIsReconciled(true);
				                paymentTransferencia.saveEx();
				            }
				        }
				        catch (SQLException e)
				        {
				            log.log(Level.SEVERE, sql, e);
				        }
				        finally
				        {
				            DB.close(rs, pstmt);
				            rs = null;
				            pstmt = null;
				        }
					}
				}
				line.saveEx();
			}
		}

        // @fchiappano Busco el cierre de compensacion y lo anulo.
        final String sql = "SELECT C_BankStatement_ID"
                         + "  FROM C_BankStatement"
                         + " WHERE LAR_CierreCaja_Origen_ID=? AND DocStatus NOT IN ('RE','VO')";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            pstmt = DB.prepareStatement(sql, get_TrxName());
            pstmt.setInt(1, getC_BankStatement_ID());
            rs = pstmt.executeQuery();

            if (rs.next())
            {
                MBankStatement stmCompensacion = new MBankStatement(p_ctx, rs.getInt("C_BankStatement_ID"), get_TrxName());
                if (!stmCompensacion.voidIt())
                {
                    m_processMsg = stmCompensacion.m_processMsg;
                    return false;
                }
                stmCompensacion.saveEx();
            }
        }
        catch (SQLException e)
        {
            log.log(Level.SEVERE, sql, e);
        }
        finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }

		addDescription(Msg.getMsg(getCtx(), "Voided"));
		setStatementDifference(Env.ZERO);
		
		// After Void
		m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_AFTER_VOID);
		if (m_processMsg != null)
			return false;		
		
		setProcessed(true);
		setDocAction(DOCACTION_None);
		return true;
	}	//	voidIt
	
	/**
	 * 	Close Document.
	 * 	@return true if success 
	 */
	public boolean closeIt()
	{
		log.info("closeIt - " + toString());
		// Before Close
		m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_BEFORE_CLOSE);
		if (m_processMsg != null)
			return false;		

		setDocAction(DOCACTION_None);

		// After Close
		m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_AFTER_CLOSE);
		if (m_processMsg != null)
			return false;
		return true;
	}	//	closeIt
	
	/**
	 * 	Reverse Correction
	 * 	@return false 
	 */
	public boolean reverseCorrectIt()
	{
		log.info("reverseCorrectIt - " + toString());
		// Before reverseCorrect
		m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_BEFORE_REVERSECORRECT);
		if (m_processMsg != null)
			return false;
		
		// After reverseCorrect
		m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_AFTER_REVERSECORRECT);
		if (m_processMsg != null)
			return false;
		
		return false;
	}	//	reverseCorrectionIt
	
	/**
	 * 	Reverse Accrual
	 * 	@return false 
	 */
	public boolean reverseAccrualIt()
	{
		log.info("reverseAccrualIt - " + toString());
		// Before reverseAccrual
		m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_BEFORE_REVERSEACCRUAL);
		if (m_processMsg != null)
			return false;
		
		// After reverseAccrual
		m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_AFTER_REVERSEACCRUAL);
		if (m_processMsg != null)
			return false;
		
		return false;
	}	//	reverseAccrualIt
	
	/** 
	 * 	Re-activate
	 * 	@return false 
	 */
	public boolean reActivateIt()
	{
		log.info("reActivateIt - " + toString());
		// Before reActivate
		m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_BEFORE_REACTIVATE);
		if (m_processMsg != null)
			return false;		
		
		// After reActivate
		m_processMsg = ModelValidationEngine.get().fireDocValidate(this,ModelValidator.TIMING_AFTER_REACTIVATE);
		if (m_processMsg != null)
			return false;		
		return false;
	}	//	reActivateIt
	
	
	/*************************************************************************
	 * 	Get Summary
	 *	@return Summary of Document
	 */
	public String getSummary()
	{
		StringBuffer sb = new StringBuffer();
		sb.append(getName());
		//	: Total Lines = 123.00 (#1)
		sb.append(": ")
			.append(Msg.translate(getCtx(),"StatementDifference")).append("=").append(getStatementDifference())
			.append(" (#").append(getLines(false).length).append(")");
		//	 - Description
		if (getDescription() != null && getDescription().length() > 0)
			sb.append(" - ").append(getDescription());
		return sb.toString();
	}	//	getSummary
	
	/**
	 * 	Get Process Message
	 *	@return clear text error message
	 */
	public String getProcessMsg()
	{
		return m_processMsg;
	}	//	getProcessMsg
	
	/**
	 * 	Get Document Owner (Responsible)
	 *	@return AD_User_ID
	 */
	public int getDoc_User_ID()
	{
		return getUpdatedBy();
	}	//	getDoc_User_ID

	/**
	 * 	Get Document Approval Amount.
	 * 	Statement Difference
	 *	@return amount
	 */
	public BigDecimal getApprovalAmt()
	{
		return getStatementDifference();
	}	//	getApprovalAmt

	/**
	 * 	Get Document Currency
	 *	@return C_Currency_ID
	 */
	public int getC_Currency_ID()
	{
	//	MPriceList pl = MPriceList.get(getCtx(), getM_PriceList_ID());
	//	return pl.getC_Currency_ID();
		return 0;
	}	//	getC_Currency_ID

	/**
	 * 	Document Status is Complete or Closed
	 *	@return true if CO, CL or RE
	 */
	public boolean isComplete()
	{
		String ds = getDocStatus();
		return DOCSTATUS_Completed.equals(ds) 
			|| DOCSTATUS_Closed.equals(ds)
			|| DOCSTATUS_Reversed.equals(ds);
	}	//	isComplete

	/**
	 * Actulizar columnas "Fisicas", con los valores obtenidos en las respectivas columnas "Virtuales"(Sql).
	 */
	private void actualizarColumnasCheques()
	{
	    // @fchiappano Actualizo la columna total de cheques.
        String sql = "UPDATE C_BankStatement bs"
                   + "   SET TotalCheques=((SELECT COALESCE(Sum(sl.TrxAmt),0)"
                   + "                        FROM C_BankStatementLine sl"
                   + "                        JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID)"
                   + "                       WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN ('K','Z') AND p.LAR_Cheque_Emitido_ID IS NULL))"
                   + "         + (COALESCE((SELECT SUM(pa.PayAmt)"
                   + "                        FROM C_Payment pa"
                   + "                       WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsOnDrawer='Y'"
                   + "                                                                                  AND pa.IsReceipt='Y'"
                   + "                                                                                  AND pa.DocStatus IN ('CO','CL')"
                   + "                                                                                  AND pa.TenderType IN ('K','Z')"
                   + "                                                                                  AND pa.C_Payment_ID NOT IN (SELECT sli.C_Payment_ID"
                   + "                                                                                                                FROM C_BankStatementLine sli"
                   + "                                                                                                               WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)), 0))"
                   + "         + (COALESCE((SELECT SUM(pa.PayAmt)"
                   + "                        FROM C_Payment pa"
                   + "                       WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsReceipt='N'"
                   + "                                                                                  AND pa.DocStatus IN ('CO','CL')"
                   + "                                                                                  AND pa.TenderType IN ('K','Z')"
                   + "                                                                                  AND pa.IsReconciled='N'"
                   + "                                                                                  AND pa.LAR_Cheque_Emitido_ID IS NULL"
                   + "                                                                                  AND pa.LAR_PaymentSource_ID > 0"
                   + "                                                                                  AND pa.LAR_PaymentSource_ID NOT IN (SELECT sli.C_Payment_ID"
                   + "                                                                                                                        FROM C_BankStatementLine sli"
                   + "                                                                                                                       WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)), 0)))"
                   + " WHERE C_BankStatement_ID=" + getC_BankStatement_ID();

        DB.executeUpdate(sql, get_TrxName());

        // @fchiappano Actulizar columna DifereciaCheques.
        sql = "UPDATE C_BankStatement bs"
            + "   SET DiferenciaCheques=(SELECT (C_BankStatement.ScrutinizedCheckAmt - ((SELECT COALESCE(Sum(sl.TrxAmt),0)"
            + "                                                                           FROM C_BankStatementLine sl"
            + "                                                                           JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID)"
            + "                                                                          WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN ('K','Z') AND p.LAR_Cheque_Emitido_ID IS NULL))"
            + "                                                            + (COALESCE((SELECT SUM(pa.PayAmt)"
            + "                                                                           FROM C_Payment pa"
            + "                                                                          WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsOnDrawer='Y'"
            + "                                                                                                                                     AND pa.IsReceipt='Y'"
            + "                                                                                                                                     AND pa.DocStatus IN ('CO','CL')"
            + "                                                                                                                                     AND pa.TenderType IN ('K','Z')"
            + "                                                                                                                                     AND pa.C_Payment_ID NOT IN (SELECT sli.C_Payment_ID"
            + "                                                                                                                                                                   FROM C_BankStatementLine sli"
            + "                                                                                                                                                                  WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)), 0))"
            + "                                                            + (COALESCE((SELECT SUM(pa.PayAmt)"
            + "                                                                           FROM C_Payment pa"
            + "                                                                          WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsReceipt='N'"
            + "                                                                                                                                     AND pa.DocStatus IN ('CO','CL')"
            + "                                                                                                                                     AND pa.TenderType IN ('K','Z')"
            + "                                                                                                                                     AND pa.IsReconciled='N'"
            + "                                                                                                                                     AND pa.LAR_Cheque_Emitido_ID IS NULL"
            + "                                                                                                                                     AND pa.LAR_PaymentSource_ID > 0"
            + "                                                                                                                                     AND pa.LAR_PaymentSource_ID NOT IN (SELECT sli.C_Payment_ID"
            + "                                                                                                                                                                           FROM C_BankStatementLine sli"
            + "                                                                                                                                                                          WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)), 0)))))"
            + " WHERE C_BankStatement_ID=" + getC_BankStatement_ID();

        DB.executeUpdate(sql, get_TrxName());

        // @fchiappano Actualizar columna Total Diferencias.
        sql = "UPDATE C_BankStatement bs"
            + "   SET TotalDiferencias=((SELECT (C_BankStatement.ScrutinizedCashAmt - (COALESCE(Sum(TrxAmt),0))) "
            + "                            FROM C_BankStatementLine sl"
            + "                            JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID)"
            + "                           WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = 'X'))"
            + "                       + (SELECT (C_BankStatement.ScrutinizedCheckAmt - ((SELECT COALESCE(Sum(sl.TrxAmt),0)"
            + "                            FROM C_BankStatementLine sl"
            + "                            JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID)"
            + "                           WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN ('K','Z') AND p.LAR_Cheque_Emitido_ID IS NULL))"
            + "             + (COALESCE((SELECT SUM(pa.PayAmt)"
            + "                            FROM C_Payment pa"
            + "                           WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsOnDrawer='Y'"
            + "                                                                                      AND pa.IsReceipt='Y'"
            + "                                                                                      AND pa.DocStatus IN ('CO','CL')"
            + "                                                                                      AND pa.TenderType IN ('K','Z')"
            + "                                                                                      AND pa.C_Payment_ID NOT IN (SELECT sli.C_Payment_ID"
            + "                                                                                                                    FROM C_BankStatementLine sli"
            + "                                                                                                                   WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)), 0))"
            + "              + (COALESCE((SELECT SUM(pa.PayAmt)"
            + "                             FROM C_Payment pa"
            + "                            WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsReceipt='N'"
            + "                                                                                       AND pa.DocStatus IN ('CO','CL')"
            + "                                                                                       AND pa.TenderType IN ('K','Z')"
            + "                                                                                       AND pa.IsReconciled='N'"
            + "                                                                                       AND pa.LAR_Cheque_Emitido_ID IS NULL"
            + "                                                                                       AND pa.LAR_PaymentSource_ID > 0"
            + "                                                                                       AND pa.LAR_PaymentSource_ID NOT IN (SELECT sli.C_Payment_ID"
            + "                                                                                                                             FROM C_BankStatementLine sli"
            + "                                                                                                                            WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)), 0)))))"
            + "                        + (SELECT (C_BankStatement.ScrutinizedCreditCardAmt - (COALESCE(Sum(TrxAmt),0)))"
            + "                             FROM C_BankStatementLine sl"
            + "                             JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID)"
            + "                            WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN ('D', 'C'))) - C_BankStatement.SaldoInicial)"
            + " WHERE C_BankStatement_ID=" + getC_BankStatement_ID();

        DB.executeUpdate(sql, get_TrxName());

	} // actualizarColumnasCheques
	
}	//	MBankStatement
