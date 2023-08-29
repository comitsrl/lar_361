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
package ar.com.ergio.model;

import java.io.File;
import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.Calendar;
import java.util.List;
import java.util.Properties;

import org.compiere.model.MInOut;
import org.compiere.model.MInOutLine;
import org.compiere.model.MOrder;
import org.compiere.model.MOrderLine;
import org.compiere.model.MRMA;
import org.compiere.model.MRMALine;
import org.compiere.model.MStorage;
import org.compiere.model.MSysConfig;
import org.compiere.model.MWarehouse;
import org.compiere.model.Query;
import org.compiere.process.DocAction;
import org.compiere.process.DocOptions;
import org.compiere.process.DocumentEngine;

/**
 * Modelo de Clase para ventana Ordenes de Garantía.
 * 
 * @author Franco Chiappano - www.comit.com.ar
 */
public class MLAROrdenGarantia extends X_LAR_OrdenGarantia implements DocAction, DocOptions
{
    /** Process Message */
    private String m_processMsg = null;
    // @fchiappano Tipos de documento para entregas y devolución.
    final static int c_DocType_Salida_ID = 4000066;
    final static int c_DocType_Ingreso_ID = 4000067;
    final static int c_DocType_Orden_Devolucion_ID = 1000123;

    private static final long serialVersionUID = -3656070525865255215L;

    public MLAROrdenGarantia(Properties ctx, ResultSet rs, String trxName)
    {
        super(ctx, rs, trxName);
    } // MLAROrdenGarantia

    public MLAROrdenGarantia(Properties ctx, int LAR_OrdenGarantia_ID, String trxName)
    {
        super(ctx, LAR_OrdenGarantia_ID, trxName);
    } // MLAROrdenGarantia

    @Override
    public boolean processIt(String action) throws Exception
    {
        m_processMsg = null;
        DocumentEngine engine = new DocumentEngine(this, getDocStatus());
        return engine.processIt(action, getDocAction());
    }

    /**************************************************************************
     * Before Save
     * @param newRecord new
     * @return save
     */
    protected boolean beforeSave(boolean newRecord)
    {
        // @fchiappano si se selecciono una factura, chequear que este dentro de
        // los plazos de garantía.
        if (getC_Invoice_ID() > 0)
        {
            int meses = 0 - MSysConfig.getIntValue("LAR_MesesDeGarantia", 0, getAD_Client_ID());

            if (meses != 0)
            {
                Calendar calendar = Calendar.getInstance();
                calendar.setTimeInMillis(getFechaCambio().getTime());
                calendar.add(Calendar.MONTH, meses);

                Timestamp fechaLimite = new Timestamp(calendar.getTimeInMillis());

                if (fechaLimite.after(getC_Invoice().getDateInvoiced()))
                {
                    log.saveError("Garantía Vencida",
                            "La fecha de facturación, supera la cantidad de meses límite establecida.");
                    return false;
                }
            }
        }

        return true;
    } // beforeSave

    @Override
    public boolean unlockIt()
    {
        return false;
    }

    @Override
    public boolean invalidateIt()
    {
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
        return false;
    }

    @Override
    public boolean rejectIt()
    {
        return false;
    }

    @Override
    public String completeIt()
    {
        // @fchiappano Recuperar las lineas del documento y chequear que se haya cargado al menos una.
        X_LAR_OrdenGarantiaLine[] lineas = getLines();

        if (lineas == null || lineas.length <= 0)
        {
            m_processMsg = "No se encontraron líneas en el documento.";
            return DOCSTATUS_Invalid;
        }

        // @fchiappano Crear remito de salida de Mercaderia.
        MInOut remitoSalida = new MInOut((MOrder) getC_Order(), c_DocType_Salida_ID, getFechaCambio());
        remitoSalida.setM_Warehouse_ID(getM_WareHouseSalida_ID());
        remitoSalida.setMovementDate(getFechaCambio());
        remitoSalida.set_ValueOfColumn("LAR_OrdenGarantia_ID", get_ID());

        // @fchiappano Guardar cabecera.
        if (!remitoSalida.save(get_TrxName()))
        {
            m_processMsg = "No se pudo crear el Remito de Entrega de Mercadería.";
            return DOCSTATUS_Invalid;
        }

        // @fchiappano Crear una Orden de Devolución (unica manera en que los
        // remitos generados no modifiquen la cantidad reservada).
        MRMA ordenDevolucion = new MRMA(p_ctx, 0, get_TrxName());
        ordenDevolucion.setC_BPartner_ID(getC_BPartner_ID());
        ordenDevolucion.setM_InOut_ID(remitoSalida.getM_InOut_ID());
        ordenDevolucion.setAD_Org_ID(getAD_Org_ID());
        ordenDevolucion.setName(new Timestamp(System.currentTimeMillis()) + getC_BPartner().getName());
        ordenDevolucion.setC_Currency_ID(getC_Order().getC_Currency_ID());
        ordenDevolucion.setC_Order_ID(getC_Order_ID());
        ordenDevolucion.setIsSOTrx(getC_Order().isSOTrx());
        ordenDevolucion.setC_DocType_ID(c_DocType_Orden_Devolucion_ID);
        ordenDevolucion.setSalesRep_ID(getC_Order().getSalesRep_ID());
        // ordenDevolucion.setM_RMAType_ID(tipoRMA_ID);
        ordenDevolucion.saveEx(get_TrxName());

        setM_RMA_ID(ordenDevolucion.get_ID());

        // @fchiappano Crear lineas del Remito de Salida.
        for (X_LAR_OrdenGarantiaLine linea : lineas)
        {
            int M_Locator_ID = MStorage.getM_Locator_ID(getM_WareHouseSalida_ID(), linea.getM_Product_ID(),
                    linea.getC_OrderLine().getM_AttributeSetInstance_ID(), linea.getCantidad(), get_TrxName());
            if (M_Locator_ID == 0) // Get default Location
            {
                MWarehouse wh = MWarehouse.get(getCtx(), getM_WareHouseSalida_ID());
                M_Locator_ID = wh.getDefaultLocator().getM_Locator_ID();
            }

            MRMALine rmaLine = new MRMALine(p_ctx, 0, get_TrxName());
            rmaLine.setAD_Org_ID(getAD_Org_ID());
            rmaLine.setM_RMA_ID(ordenDevolucion.getM_RMA_ID());
            rmaLine.setQty(linea.getCantidad());
            rmaLine.setM_InOutLine_ID(getM_InOutLine_ID(linea.getC_OrderLine_ID()));
            rmaLine.saveEx(get_TrxName());

            //
            MInOutLine rLinea = new MInOutLine(remitoSalida);
            rLinea.setOrderLine((MOrderLine) linea.getC_OrderLine(), M_Locator_ID, linea.getCantidad());
            rLinea.setQty(linea.getCantidad());
            rLinea.set_ValueOfColumn("C_OrderLine_ID", null);
            rLinea.setM_RMALine_ID(rmaLine.get_ID());
            rLinea.setIsInvoiced(true);

            if (!rLinea.save(get_TrxName()))
            {
                m_processMsg = "No se pudo crear la línea del Remito de Entrega de Mercadería (N° " + linea.getLine() + ".";
                return DOCSTATUS_Invalid;
            }

            linea.setM_RMALine_ID(rmaLine.get_ID());
            linea.saveEx(get_TrxName());
        }

        // @fchiappano Completar remito de salida.
        if (!remitoSalida.processIt(DocAction.ACTION_Complete))
        {
            m_processMsg = "Error al procesar el remito de salida: " + remitoSalida.getProcessMsg();
            return DOCSTATUS_Invalid;
        }

        // @fchiappano Actualizar remito de salida.
        remitoSalida.saveEx(get_TrxName());

        // @fchiappano Completar la Orden de Devolución.
        if (!ordenDevolucion.processIt(DocAction.ACTION_Complete))
        {
            m_processMsg = "Error al procesar la orden de devolución: " + ordenDevolucion.getProcessMsg();
            return DOCSTATUS_Invalid;
        }
        ordenDevolucion.saveEx(get_TrxName());

        // @fchiappano Crear Remito de ingreso (devolución del cliente).
        MInOut remitoIngreso = new MInOut((MOrder) getC_Order(), c_DocType_Ingreso_ID, getFechaCambio());
        remitoIngreso.setM_Warehouse_ID(getM_WareHouseIngreso_ID());
        remitoIngreso.setMovementDate(getFechaCambio());
        remitoIngreso.set_ValueOfColumn("LAR_OrdenGarantia_ID", get_ID());

        // @fchiappano Guardar cabecera de remito de ingreso.
        if (!remitoIngreso.save(get_TrxName()))
        {
            m_processMsg = "No se pudo crear el Remito de Recepción de Mercadería.";
            return DOCSTATUS_Invalid;
        }

        // @fchiappano Crear lineas del Remito de Ingreso.
        for (X_LAR_OrdenGarantiaLine linea : lineas)
        {
            int M_Locator_ID = MStorage.getM_Locator_ID(getM_WareHouseIngreso_ID(), linea.getM_Product_ID(),
                    linea.getC_OrderLine().getM_AttributeSetInstance_ID(), linea.getCantidad(), get_TrxName());
            if (M_Locator_ID == 0) // Get default Location
            {
                MWarehouse wh = MWarehouse.get(getCtx(), getM_WareHouseIngreso_ID());
                M_Locator_ID = wh.getDefaultLocator().getM_Locator_ID();
            }
            //
            MInOutLine rLinea = new MInOutLine(remitoIngreso);
            rLinea.setOrderLine((MOrderLine) linea.getC_OrderLine(), M_Locator_ID, linea.getCantidad());
            rLinea.setQty(linea.getCantidad());
            rLinea.setIsInvoiced(true);
            rLinea.set_ValueOfColumn("C_OrderLine_ID", null);
            rLinea.setM_RMALine_ID(linea.getM_RMALine_ID());

            if (!rLinea.save(get_TrxName()))
            {
                m_processMsg = "No se pudo crear la línea del Remito de Recepción de Mercadería (N° " + linea.getLine()
                        + ".";
                return DOCSTATUS_Invalid;
            }
        }

        // @fchiappano Completar remito de ingreso.
        if (!remitoIngreso.processIt(DocAction.ACTION_Complete))
        {
            m_processMsg = "Error al procesar el remito de salida: " + remitoIngreso.getProcessMsg();
            return DOCSTATUS_Invalid;
        }

        // @fchiappano Actualizar remito de ingreso.
        remitoIngreso.saveEx(get_TrxName());

        setDocAction(DOCACTION_Close);
        setProcessed(true);

        return DOCSTATUS_Completed;
    } // completeIt

    @Override
    public boolean voidIt()
    {
        // @fchiappano Recuperar Remitos asociados (Ingreso - Egreso).
        MInOut[] remitos = getRemitos();

        if (remitos.length <= 0 && getDocStatus().equals("CO"))
        {
            m_processMsg = "No se encontraron Remitos asociados a la Orden de Garantía.";
            return false;
        }

        // @fchiappano Recorrer los remitos y anularlos.
        for (MInOut remito : remitos)
        {
            // @fchiappano Si el remito ya se encuntra anulado o revertido,
            // continuo con el siguiente.
            if (remito.getDocStatus().equals(DOCSTATUS_Voided) || remito.getDocStatus().equals(DOCSTATUS_Reversed))
                continue;

            // @fchiappano Completar remito de ingreso.
            if (!remito.processIt(DocAction.ACTION_Void))
            {
                m_processMsg = "Error al anular el remito N° " + remito.getDocumentNo() + ": " + remito.getProcessMsg();
                return false;
            }
        }

        // @fchiappano Anular la orden de devolución.
        MRMA ordenDevolucion = (MRMA) getM_RMA();
        if (!ordenDevolucion.processIt(DocAction.ACTION_Void) || !ordenDevolucion.save(get_TrxName()))
        {
            m_processMsg = "Error al anular la Orden de Devolución Asociada: " + ordenDevolucion.getDocumentNo() + ": "
                    + ordenDevolucion.getProcessMsg();
            return false;
        }

        setDocAction(DOCACTION_None);
        setProcessed(true);

        return true;
    } // voidIt()

    @Override
    public boolean closeIt()
    {
        return false;
    }

    @Override
    public boolean reverseCorrectIt()
    {
        return false;
    }

    @Override
    public boolean reverseAccrualIt()
    {
        return false;
    }

    @Override
    public boolean reActivateIt()
    {
        return false;
    }

    @Override
    public String getSummary()
    {
        return null;
    }

    @Override
    public String getDocumentInfo()
    {
        return null;
    }

    @Override
    public File createPDF()
    {
        return null;
    }

    @Override
    public String getProcessMsg()
    {
        return m_processMsg;
    } // getProcessMsg

    @Override
    public int getDoc_User_ID()
    {
        return 0;
    }

    @Override
    public BigDecimal getApprovalAmt()
    {
        return null;
    }

    @Override
    public int getC_Currency_ID()
    {
        return 0;
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

    /**************************************************************************
     * Recuperar las líneas de la Orden de Garantía
     * @return lines
     */
    private X_LAR_OrdenGarantiaLine[] getLines()
    {
        StringBuffer whereClause = new StringBuffer(X_LAR_OrdenGarantiaLine.COLUMNNAME_LAR_OrdenGarantia_ID + "=? ");
        //
        List<X_LAR_OrdenGarantiaLine> list = new Query(getCtx(), I_LAR_OrdenGarantiaLine.Table_Name,
                whereClause.toString(), get_TrxName()).setParameters(get_ID())
                        .setOrderBy(X_LAR_OrdenGarantiaLine.COLUMNNAME_Line).list();
        //
        return list.toArray(new X_LAR_OrdenGarantiaLine[list.size()]);
    } // getLines

    /**************************************************************************
     * Recuperar los remitos asociados a la orden de garantia.
     * @return lines
     */
    private MInOut[] getRemitos()
    {
        StringBuffer whereClause = new StringBuffer("LAR_OrdenGarantia_ID"+ "=? ");
        //
        List<MInOut> list = new Query(getCtx(), MInOut.Table_Name,
                whereClause.toString(), get_TrxName()).setParameters(get_ID()).list();
        //
        return list.toArray(new MInOut[list.size()]);
    } // getRemitos

    private int getM_InOutLine_ID (final int c_OrderLine_ID)
    {
        MInOutLine[] lineas = MInOutLine.get(getCtx(), c_OrderLine_ID, get_TrxName());

        if (lineas != null)
            return lineas[0].get_ID();
        else
            return 0;

    } // getM_InOutLine_ID
} // MLAROrdenGarantia