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
package ar.com.ergio.process;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.logging.Level;

import org.compiere.model.MDocType;
import org.compiere.model.MInvoice;
import org.compiere.model.MInvoiceLine;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereUserError;
import org.compiere.util.DB;
import org.compiere.util.Env;

import ar.com.ergio.model.MLARDisposicionFinal;

/**
 * Proceso de generación de Notas de Crédito, desde un certificado de Disposición Final.
 *
 * @author Franco Chiappano - www.comit.com.ar
 */
public class LAR_GenerarNC_DF extends SvrProcess
{
    /** The Record */
    private int p_Record_ID = 0;
    private int p_C_Invoice_ID = 0;
    private int p_C_POS_ID = 0;
    private int p_M_Product_ID = 0;
    private int p_M_PriceList_ID = 0;
    private BigDecimal p_Peso;
    private String p_DocAction;

    @Override
    protected void prepare()
    {
        final ProcessInfoParameter[] para = getParameter();
        for (int i = 0; i < para.length; i++)
        {
            String name = para[i].getParameterName();
            if (para[i].getParameter() == null)
                ;
            else if (name.equals("C_Invoice_ID"))
                p_C_Invoice_ID = para[i].getParameterAsInt();
            else if (name.equals("C_POS_ID"))
                p_C_POS_ID = para[i].getParameterAsInt();
            else if (name.equals("M_Product_ID"))
                p_M_Product_ID = para[i].getParameterAsInt();
            else if (name.equals("M_PriceList_ID"))
                p_M_PriceList_ID = para[i].getParameterAsInt();
            else if (name.equals("Peso"))
                p_Peso = (BigDecimal) para[i].getParameter();
            else if (name.equals("DocAction"))
                p_DocAction = (String) para[i].getParameter();
            else
                log.log(Level.SEVERE, "Par\u00e1metro desconocido: " + name);
        }
        p_Record_ID = getRecord_ID();
    } // prepare

    @Override
    protected String doIt() throws Exception
    {
        MLARDisposicionFinal disposicionF = new MLARDisposicionFinal(getCtx(), p_Record_ID, get_TrxName());

        if (disposicionF.getC_Invoice_ID() > 0)
            throw new AdempiereUserError("Ya se genero una Nota de Crédito previamente.");

        // @fchiappano si el peso ingresado como parametro es distinto al del documento, actualizarlo.
        if (p_Peso.compareTo(Env.ZERO) <= 0)
            throw new AdempiereUserError("El peso ingresado, no puede ser menor o igual a cero.");
        if (p_Peso.compareTo(disposicionF.getPeso()) != 0)
            disposicionF.setPeso(p_Peso);

        int facturaOrigen_ID = 0;

        if (p_C_Invoice_ID > 0)
            facturaOrigen_ID = p_C_Invoice_ID;
        else
        {
            // @fchiappano Si no se selecciono una factura origen como parametro, búscar la ultima emitida a ese SdN y con el punto de venta seleccionado.
            String sql = "SELECT i.C_Invoice_ID"
                       +  " FROM C_Invoice i"
                       +  " JOIN C_DocType dt ON i.C_DocType_ID = dt.C_DocType_ID"
                       + " WHERE i.C_BPartner_ID = ? AND i.C_POS_ID = ? AND i.DocStatus IN ('CO', 'CL') AND dt.DocBaseType = " + "'" + MDocType.DOCBASETYPE_ARInvoice + "'"
                       + " ORDER BY i.DateInvoiced DESC, i.C_Invoice_ID DESC";

            PreparedStatement pstmt = null;
            ResultSet rs = null;
            try
            {
                pstmt = DB.prepareStatement(sql, get_TrxName());
                pstmt.setInt(1, disposicionF.getC_BPartner_ID());
                pstmt.setInt(2, p_C_POS_ID);
                rs = pstmt.executeQuery();

                if (rs.next())
                    facturaOrigen_ID = rs.getInt(1);
            }
            catch (Exception e)
            {
                log.log(Level.SEVERE, sql, e);
            }
            finally
            {
                DB.close(rs, pstmt);
                rs = null;
                pstmt = null;
            }

            if (facturaOrigen_ID <= 0)
                
            {
                throw new AdempiereUserError("No se pudo recuperar una factura origen para el SdN y Punto de Venta seleccionados. Por favor, seleccione una Factura Origen.");
            }
        }

        // @fchiappano Recuperar el tipo de documento para la NC.
        MInvoice facturaOrigen = new MInvoice(getCtx(), facturaOrigen_ID, get_TrxName());
        int letra_ID = ((MDocType) facturaOrigen.getC_DocType()).get_ValueAsInt("LAR_DocumentLetter_ID");
        String sql = "SELECT C_DocType_ID"
                   +  " FROM C_DocType"
                   + " WHERE DocBaseType = '" + MDocType.DOCBASETYPE_ARCreditMemo + "'"
                   +   " AND LAR_DocumentLetter_ID = ?"
                   +   " AND C_POS_ID = ?"
                   +   " AND EsFCE = 'N'";
        int c_DocType_ID = DB.getSQLValue(get_TrxName(), sql, letra_ID, p_C_POS_ID);

        // @fchiappano Crear NC.
        MInvoice notaCredito = new MInvoice(getCtx(), 0, get_TrxName());
        notaCredito.setC_DocTypeTarget_ID(c_DocType_ID);
        notaCredito.setC_BPartner_ID(facturaOrigen.getC_BPartner_ID());
        notaCredito.setC_BPartner_Location_ID(facturaOrigen.getC_BPartner_Location_ID());
        notaCredito.setDateInvoiced(new Timestamp(System.currentTimeMillis()));
        notaCredito.setDateAcct(new Timestamp(System.currentTimeMillis()));
        notaCredito.set_ValueOfColumn("Source_Invoice_ID", facturaOrigen_ID);
        notaCredito.setM_PriceList_ID(p_M_PriceList_ID);
        notaCredito.set_ValueOfColumn("C_POS_ID", p_C_POS_ID);
        notaCredito.saveEx(get_TrxName());

        // @fchiappano Crear linea de NC
        MInvoiceLine linea = new MInvoiceLine(notaCredito);
        linea.setM_Product_ID(p_M_Product_ID);
        linea.setQty(p_Peso);
        linea.saveEx(get_TrxName());

        // @fchiappano Procesar NC según el tipo de acción seleccionada como parametro.
        if (!notaCredito.processIt(p_DocAction))
            throw new AdempiereUserError("Error al procesar Nota de Crédito: " + notaCredito.getProcessMsg());
        if (!notaCredito.save(get_TrxName()))
            throw new AdempiereUserError("Error al actualizar Nota de Crédito, luego del procesamiento.");

        // @fchiappano actualizar el documento.
        disposicionF.setC_Invoice_ID(notaCredito.getC_Invoice_ID());
        disposicionF.saveEx(get_TrxName());

         return "Nota de Crédito generada con Exito: " + notaCredito.getDocumentNo();
    } // doIt

} // LAR_GenerarNC_DF