package ar.com.ergio.model;

import java.io.File;
import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;

import org.compiere.model.MPayment;
import org.compiere.model.MSysConfig;
import org.compiere.process.DocAction;
import org.compiere.process.DocOptions;
import org.compiere.process.DocumentEngine;
import org.compiere.util.CLogger;
import org.compiere.util.DB;
import org.compiere.util.Env;

public class MLARRetiroCaja extends X_LAR_RetiroCaja implements DocAction, DocOptions
{

    /**
     * 
     */
    private static final long serialVersionUID = -9036584951968459382L;

    private String m_processMsg = null;

    /** Logger */
    protected transient CLogger log = CLogger.getCLogger(getClass());

    /**
     * Standard constuctor.
     * @param ctx
     * @param LAR_RetiroCaja_ID
     * @param trxName
     */
    public MLARRetiroCaja(Properties ctx, int LAR_RetiroCaja_ID, String trxName)
    {
        super(ctx, LAR_RetiroCaja_ID, trxName);
    } // MLARRetiroCaja

    /**
     * ResultSet constuctor.
     * @param ctx
     * @param rs
     * @param trxName
     */
    public MLARRetiroCaja(Properties ctx, ResultSet rs, String trxName)
    {
        super(ctx, rs, trxName);
    } // MLARRetiroCaja

    /**************************************************************************
     * Before Save
     * @param newRecord new
     * @return save
     */
    protected boolean beforeSave(boolean newRecord)
    {
        // Verifico que el monto sea mayor a cero.
        // if (getMonto().compareTo(Env.ZERO) <= 0)
        // {
        // log.saveError("Error al Guardar", "Por favor, ingrese un importe.");
        // return false;
        // }

        // Si es una tranferencia, verifico que las cajas sean distintas y fuerzo el retiro == false.
        if (isTransferencia())
        {
            if (getC_BankAccountTo_ID() == getC_BankAccountFrom_ID())
            {
                log.saveError("Error al Guardar", "No se pueden transferir valores a la misma caja.");
                return false;
            }

            setRetiro(false);
        }

        if (!isTransferencia() && !isRetiro())
        {
            log.saveError("Error al Guardar","Por favor, marque si se trata de un Retiro o una Transferencia.");
            return false;
        }
        return true;
    } // beforeSave

    @Override
    public boolean processIt(String action) throws Exception
    {
        m_processMsg = null;
        DocumentEngine engine = new DocumentEngine(this, getDocStatus());
        return engine.processIt(action, getDocAction());
    } // processIt

    @Override
    public boolean unlockIt()
    {
        return false;
    } // unlockIt

    @Override
    public boolean invalidateIt()
    {
        return false;
    } // invalidateIt

    @Override
    public String prepareIt()
    {
        return STATUS_InProgress;
    } // prepareIt

    @Override
    public boolean approveIt()
    {
        return true;
    } // approveIt

    @Override
    public boolean rejectIt()
    {
        return false;
    } // rejectIt

    @Override
    public String completeIt()
    {
        for (X_LAR_RetiroCajaLine linea : obtenerLineas())
        {
            // Verifico que el importe ingresado, sea mayor a 0.
            if (linea.getMonto().compareTo(Env.ZERO) <= 0)
            {
                m_processMsg = "Por favor, ingrese un importe.";
                return STATUS_Drafted;
            }

            if (isRetiro() || linea.getTenderType().equals(MPayment.TENDERTYPE_Cash))
            {
                // Pago que debita los valores transferidos de la cuenta.
                final MPayment paymentBankFrom = new MPayment(getCtx(), 0, get_TrxName());
                paymentBankFrom.setC_BankAccount_ID(getC_BankAccountFrom_ID());
                paymentBankFrom.setDateAcct(new Timestamp(System.currentTimeMillis()));
                paymentBankFrom.setDateTrx(new Timestamp(System.currentTimeMillis()));
                // paymentBankFrom.setTenderType(MPayment.TENDERTYPE_DirectDeposit);
                paymentBankFrom.setDescription(getDescription());
                paymentBankFrom.setC_BPartner_ID(MSysConfig.getIntValue("LAR_SdN_MovimientosDeCaja", Env.getAD_Client_ID(getCtx())));
                paymentBankFrom.setC_Currency_ID(getC_Currency_ID());
                paymentBankFrom.setPayAmt(linea.getMonto());
                paymentBankFrom.setOverUnderAmt(Env.ZERO);
                paymentBankFrom.setC_DocType_ID(false);

                // Si es un retiro, y el TenderType es cheque, marco la marca
                // IsOnDrawer como false.
                if (linea.getTenderType().equals("Z"))
                {
                    final MPayment cobro = new MPayment(getCtx(), linea.getCobro_ID(), get_TrxName());
                    paymentBankFrom.setTenderType(cobro.getTenderType());
                    paymentBankFrom.setRoutingNo(cobro.getRoutingNo());
                    paymentBankFrom.setCheckNo(cobro.getCheckNo());
                    paymentBankFrom.setAccountNo(cobro.getAccountNo());
                    paymentBankFrom.setA_Name(cobro.getA_Name());

                    final String sql = "UPDATE C_Payment" + "   SET IsOnDrawer='N'" + " WHERE C_Payment_ID='"
                            + cobro.getC_Payment_ID() + "'";
                    DB.executeUpdate(sql, get_TrxName());
                }
                else
                    paymentBankFrom.setTenderType(MPayment.TENDERTYPE_Cash);

                paymentBankFrom.saveEx();

                if (paymentBankFrom.processIt(MPayment.DOCACTION_Complete))
                {
                    paymentBankFrom.saveEx();
                    linea.setPago_ID(paymentBankFrom.getC_Payment_ID());
                    linea.saveEx();
                }
                else
                {
                    m_processMsg = "No se ha podido procesar el pago correspondiente al retiro de efectivo.";
                    return STATUS_Drafted;
                }
            }

            if (isTransferencia())
            {
                if (getC_BankAccountTo_ID() != 0)
                {
                    // Si el tenderType es cheque, solo cambio la cuenta
                    // bancaria al Pago.
                    if (linea.getTenderType().equals("Z"))
                    {
                        final String sql = "UPDATE C_Payment" + "   SET C_BankAccount_ID='" + getC_BankAccountTo_ID()
                                + "'" + " WHERE C_Payment_ID='" + linea.getCobro_ID() + "'";
                        DB.executeUpdate(sql, get_TrxName());
                    }
                    else
                    {
                        final MPayment paymentBankTo = new MPayment(getCtx(), 0, get_TrxName());
                        paymentBankTo.setC_BankAccount_ID(getC_BankAccountTo_ID());
                        paymentBankTo.setDateAcct(new Timestamp(System.currentTimeMillis()));
                        paymentBankTo.setDateTrx(new Timestamp(System.currentTimeMillis()));
                        paymentBankTo.setTenderType(MPayment.TENDERTYPE_Cash);
                        paymentBankTo.setDescription(getDescription());
                        paymentBankTo.setC_BPartner_ID(MSysConfig.getIntValue("LAR_SdN_MovimientosDeCaja", Env.getAD_Client_ID(getCtx())));
                        paymentBankTo.setC_Currency_ID(getC_Currency_ID());
                        paymentBankTo.setPayAmt(linea.getMonto());
                        paymentBankTo.setOverUnderAmt(Env.ZERO);
                        paymentBankTo.setC_DocType_ID(true);
                        paymentBankTo.setIsReceipt(true);
                        paymentBankTo.saveEx();
                        if (paymentBankTo.processIt(MPayment.DOCACTION_Complete))
                        {
                            paymentBankTo.saveEx();
                            linea.setCobro_ID(paymentBankTo.getC_Payment_ID());
                            linea.saveEx();
                        }
                        else
                        {
                            m_processMsg = "No se ha podido efectuar la transferencia de efectivo. Error al crear el cobro en la cuenta Destino.";
                            return STATUS_Drafted;
                        }
                    }
                }
                else
                {
                    m_processMsg = "Por favor, seleccione una Caja Destino.";
                    return STATUS_Drafted;
                }
            }
        }

        setProcessed(true);
        setDocAction(DOCACTION_Void);

        if (!save())
            return STATUS_Drafted;

        return STATUS_Completed;
    } // completeIt

    @Override
    public boolean voidIt()
    {
        for (X_LAR_RetiroCajaLine linea : obtenerLineas())
        {
            // Si es un retiro y el TenderType es cheque, vuelvo a marcar el
            // cheque como en cartera.
            if (isRetiro() || linea.getTenderType().equals(MPayment.TENDERTYPE_Cash))
            {
                if (linea.getTenderType().equals("Z"))
                {
                    final String sql = "UPDATE C_Payment" + "   SET IsOnDrawer='Y'" + " WHERE C_Payment_ID='"
                            + linea.getCobro_ID() + "'";
                    DB.executeUpdate(sql, get_TrxName());
                }
                else
                {
                    // Revierto el pago realizado desde la caja Origen.
                    MPayment pago = new MPayment(p_ctx, linea.getPago_ID(), get_TrxName());

                    if (!pago.voidIt())
                    {
                        m_processMsg = pago.getProcessMsg();
                        return false;
                    }

                    pago.saveEx();
                }
            }

            // Si se trata de una transferencia, revierto el cobro de la caja
            // destino.
            if (isTransferencia())
            {
                // Si el TenderType es Cheque, cambio el C_BankAccount_ID del
                // pago, por el de la caja origen.
                if (linea.getTenderType().equals("Z"))
                {
                    final String sql = "UPDATE C_Payment" + "   SET C_BankAccount_ID='" + getC_BankAccountFrom_ID()
                            + "'" + " WHERE C_Payment_ID='" + linea.getCobro_ID() + "'";
                    DB.executeUpdate(sql, get_TrxName());
                }
                // Sino, Revierto el cobro normalmente.
                else
                {
                    MPayment cobro = new MPayment(p_ctx, linea.getCobro_ID(), get_TrxName());

                    if (!cobro.voidIt())
                    {
                        m_processMsg = cobro.getProcessMsg();
                        return false;
                    }

                    cobro.saveEx();
                }
            }
        }

        setDocAction(DOCACTION_None);
        saveEx();

        return true;
    } // voidIt

    @Override
    public boolean closeIt()
    {
        return false;
    } // closeIt

    @Override
    public boolean reverseCorrectIt()
    {
        return false;
    } // reverseCorrectIt

    @Override
    public boolean reverseAccrualIt()
    {
        return false;
    } // reverseAccrualIt

    @Override
    public boolean reActivateIt()
    {
        return false;
    } // reActivateIt

    @Override
    public String getSummary()
    {
        return null;
    } // getSummary

    @Override
    public String getDocumentNo()
    {
        return null;
    } // getDocumentNo

    @Override
    public String getDocumentInfo()
    {
        return null;
    } // getDocumentInfo

    @Override
    public File createPDF()
    {
        return null;
    } // createPDF

    @Override
    public String getProcessMsg()
    {
        return m_processMsg;
    } // getProcessMsg

    @Override
    public int getDoc_User_ID()
    {
        return 0;
    } // getDoc_User_ID

    @Override
    public BigDecimal getApprovalAmt()
    {
        return null;
    } // getApprovalAmt

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

    /**
     * Obtener Lineas de Retiro de Caja.
     * @return lineas.
     */
    private List<X_LAR_RetiroCajaLine> obtenerLineas()
    {
        final List<X_LAR_RetiroCajaLine> lineas = new ArrayList<X_LAR_RetiroCajaLine>();

        final String sql = "SELECT LAR_RetiroCajaLine_ID"
                         + "  FROM LAR_RetiroCajaLine"
                         + " WHERE LAR_RetiroCaja_ID=?";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            pstmt = DB.prepareStatement(sql, null);
            pstmt.setInt(1, getLAR_RetiroCaja_ID());
            rs = pstmt.executeQuery();
            while (rs.next())
            {
                final X_LAR_RetiroCajaLine linea = new X_LAR_RetiroCajaLine(getCtx(), rs.getInt("LAR_RetiroCajaLine_ID"), get_TrxName());
                lineas.add(linea);
            }
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
        return lineas;
    }

} // MLARRetiroCaja
