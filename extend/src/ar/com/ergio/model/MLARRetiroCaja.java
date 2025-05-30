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

import org.compiere.model.MBankAccount;
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
            if (getC_BankAccountTo_ID() <= 0)
            {
                log.saveError("Error al Guardar", "Por favor, seleccione una Caja Destino.");
                return false;
            }
            if (getC_BankAccountTo_ID() == getC_BankAccountFrom_ID())
            {
                log.saveError("Error al Guardar", "No se pueden transferir valores a la misma caja.");
                return false;
            }

            setRetiro(false);
        }
        else if (get_ValueAsBoolean("TransferenciaBancaria"))
        {
            if (get_ValueAsInt("CuentaOrigen_ID") == get_ValueAsInt("CuentaDestino_ID"))
            {
                log.saveError("Error al Guardar", "No se pueden transferir valores a la misma cuenta.");
                return false;
            }
        }
        else if (get_ValueAsBoolean("Deposito"))
        {
            if (get_ValueAsInt("CuentaDestino_ID") <= 0)
            {
                log.saveError("Error al Guardar", "Por favor, seleccione una Cuenta Bancaria Destino.");
                return false;
            }
        }

        if (!isTransferencia() && !isRetiro() && !get_ValueAsBoolean("Deposito") && !get_ValueAsBoolean("ExtraccionBancaria") && !get_ValueAsBoolean("TransferenciaBancaria"))
        {
            log.saveError("Error al Guardar","Por favor, marque si se trata de un Retiro, Transferencia, Depósito, Extracción Bancaria o Transferencia Bancaria.");
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
        Timestamp fechaMovimiento = (Timestamp) get_Value("Fecha");

        for (X_LAR_RetiroCajaLine linea : obtenerLineas())
        {
            // Verifico que el importe ingresado, sea mayor a 0.
            if (linea.getMonto().compareTo(Env.ZERO) <= 0)
            {
                m_processMsg = "Por favor, ingrese un importe.";
                return STATUS_Drafted;
            }

            // Pago que debita los valores transferidos de la cuenta.
            final MPayment paymentBankFrom = new MPayment(getCtx(), 0, get_TrxName());
            int cobro_ID = linea.get_ValueAsInt("C_Payment_ID");

            // Si el TenderType es cheque, cambio la marca IsOnDrawer a false.
            if (linea.getTenderType().equals("Z"))
            {
                final String sql = "UPDATE C_Payment"
                                 + "   SET IsOnDrawer='N'"
                                 + " WHERE C_Payment_ID='" + cobro_ID + "'";
                DB.executeUpdate(sql, get_TrxName());

                final MPayment cobro = new MPayment(getCtx(), cobro_ID, get_TrxName());
                MPayment.copyValues(cobro, paymentBankFrom);
                paymentBankFrom.set_ValueOfColumn("LAR_PaymentSource_ID", cobro_ID);
            }
            else
            {
                paymentBankFrom.setPayAmt(linea.getMonto());
                paymentBankFrom.setTenderType(MPayment.TENDERTYPE_Cash);
                paymentBankFrom.setC_Currency_ID(getC_Currency_ID());
            }

            // Si se trata de una Extaccion Bancaria, tomo la cuenta bancaria origen.
            if (get_ValueAsBoolean("ExtraccionBancaria") || get_ValueAsBoolean("TransferenciaBancaria"))
                paymentBankFrom.setC_BankAccount_ID(get_ValueAsInt("CuentaOrigen_ID"));
            else
                paymentBankFrom.setC_BankAccount_ID(getC_BankAccountFrom_ID());

            paymentBankFrom.setDateAcct(fechaMovimiento);
            paymentBankFrom.setDateTrx(fechaMovimiento);
            paymentBankFrom.setDescription(getDescription());
            paymentBankFrom.setC_BPartner_ID(MSysConfig.getIntValue("LAR_SdN_MovimientosDeCaja", 0, Env.getAD_Client_ID(getCtx())));
            paymentBankFrom.setPosted(true);
            paymentBankFrom.set_ValueOfColumn("LAR_PaymentHeader_ID", null);

            // @fchiappano verificar que exista un tipo de doc valido.
            if (!paymentBankFrom.setLAR_C_DoctType_ID(false,
                    ((MBankAccount) paymentBankFrom.getC_BankAccount()).get_ValueAsBoolean("IsDrawer")
                            ? paymentBankFrom.getC_BankAccount().getAD_Org_ID() : getAD_Org_ID()))
            {
                m_processMsg = "No fue posible recuperar, un tipo de documento válido para débito de valores.";
                return STATUS_Drafted;
            }

            // @fchiappano verificar que exista un tipo de doc valido.
            if (!paymentBankFrom.setLAR_C_DoctType_ID(false,
                    ((MBankAccount) paymentBankFrom.getC_BankAccount()).get_ValueAsBoolean("IsDrawer")
                            ? paymentBankFrom.getC_BankAccount().getAD_Org_ID() : getAD_Org_ID()))
            {
                m_processMsg = "No fue posible recuperar, un tipo de documento válido para débito de valores.";
                return STATUS_Drafted;
            }

            // Si es un depósito recuperar el doc salida de caja origen desde el parámetro
            if (get_ValueAsBoolean("Deposito") || isRetiro())
            {
                int docSalida_ID = MSysConfig.getIntValue(
                            "LAR_Tipo_Documeto_ID_Depositos_Salida_Caja", 0, getAD_Client_ID());
                // Si el valor es cero dejar el valor anterior recuperado
                if (docSalida_ID != 0)
                {
                    paymentBankFrom.setC_DocType_ID(docSalida_ID);
                    paymentBankFrom.saveEx(get_TrxName());
                }
            }

            // @fchiappano Verificar si se debe utilizar el c_charge_id
            // configurado en el concepto de caja.
            if ((isRetiro() || get_ValueAsBoolean("Deposito")) && getLAR_ConceptoCaja_ID() > 0)
            {
                String sql = "SELECT C_Charge_ID FROM LAR_ConceptoCaja WHERE LAR_ConceptoCaja_ID = ?";
                int c_Charge_ID = DB.getSQLValue(get_TrxName(), sql, getLAR_ConceptoCaja_ID());

                if (c_Charge_ID > 0)
                    paymentBankFrom.setC_Charge_ID(c_Charge_ID);
            }

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

            if (isTransferencia() || get_ValueAsBoolean("Deposito") ||
                    get_ValueAsBoolean("ExtraccionBancaria") || get_ValueAsBoolean("TransferenciaBancaria"))
            {
                final MPayment paymentBankTo = new MPayment(getCtx(), 0, get_TrxName());
                MPayment.copyValues(paymentBankFrom, paymentBankTo);
                // Si el tenderType es cheque, copio los campos pertinentes al mismo.
                if (linea.getTenderType().equals("Z"))
                {
                    if (isTransferencia())
                        paymentBankTo.set_ValueOfColumn("IsOnDrawer", true);
                    else
                    {
                        paymentBankTo.set_ValueOfColumn("IsOnDrawer", false);
                        final String sql = "UPDATE C_Payment"
                                         + "   SET IsDeposited = 'Y'"
                                         + " WHERE C_Payment_ID = " + cobro_ID;
                        DB.executeUpdate(sql, get_TrxName());
                    }
                }

                // Si es una trasferencia o una extraccion bancaria, seteo la caja destino. Si no, seteo la cuenta bancaria destino.
                MBankAccount destino = null;
                if (isTransferencia() || get_ValueAsBoolean("ExtraccionBancaria"))
                    destino = (MBankAccount) getC_BankAccountTo();
                else
                    destino = new MBankAccount(p_ctx, get_ValueAsInt("CuentaDestino_ID"), get_TrxName());

                paymentBankTo.setPosted(true);
                paymentBankTo.setC_BankAccount_ID(destino.getC_BankAccount_ID());
                paymentBankTo.setDateAcct(fechaMovimiento);
                paymentBankTo.setDateTrx(fechaMovimiento);
                paymentBankTo.setDescription(getDescription());
                paymentBankTo.setC_BPartner_ID(MSysConfig.getIntValue("LAR_SdN_MovimientosDeCaja", 0,
                        Env.getAD_Client_ID(getCtx())));
                paymentBankTo.set_ValueOfColumn("LAR_PaymentHeader_ID", null);
                // @fchiappano Validar que se pueda recuperar un tipo de doc
                // valido para acreditacion.
                if (!paymentBankTo.setLAR_C_DoctType_ID(true,
                        destino.get_ValueAsBoolean("IsDrawer") ? destino.getAD_Org_ID() : getAD_Org_ID()))
                {
                    m_processMsg = "No fue posible recuperar, un tipo de documento válido para acreditación de valores.";
                    return STATUS_Drafted;
                }

                // @fchiappano Si es un deposito y hay configurado un tipo de documento especifico,
                // pisar el tipo de doc del recibo que acredita en la cuenta bancaria.
                int tipoDocDeposito_ID = MSysConfig.getIntValue("LAR_TipoDocDeposito_ID", 0, getAD_Client_ID());
                if (get_ValueAsBoolean("Deposito") && tipoDocDeposito_ID > 0)
                {
                    paymentBankTo.setC_DocType_ID(tipoDocDeposito_ID);
                }

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
            // Revierto el pago realizado desde la caja Origen.
            MPayment pago = new MPayment(p_ctx, linea.getPago_ID(), get_TrxName());

            if (!pago.voidIt())
            {
                m_processMsg = pago.getProcessMsg();
                return false;
            }

            pago.saveEx();

            // Si se trata de una transferencia o un deposito, revierto el cobro
            // de la caja/cuenta destino.
            if (isTransferencia() || get_ValueAsBoolean("Deposito") || get_ValueAsBoolean("TransferenciaBancaria") || get_ValueAsBoolean("ExtraccionBancaria"))
            {
                MPayment cobro = new MPayment(p_ctx, linea.getCobro_ID(), get_TrxName());

                if (!cobro.voidIt())
                {
                    m_processMsg = cobro.getProcessMsg();
                    return false;
                }

                cobro.saveEx();
            }

            // Si el TenderType es cheque, vuelvo a marcar el cheque como en cartera.
            if (linea.getTenderType().equals("Z"))
            {
                String sql = "UPDATE C_Payment"
                           +   " SET IsOnDrawer = 'Y', IsDeposited = 'N'"
                           + " WHERE C_Payment_ID = " + linea.get_ValueAsInt("C_Payment_ID");

                DB.executeUpdate(sql, get_TrxName());
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
