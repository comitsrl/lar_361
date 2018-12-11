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
package ar.com.comit.print.javapos;

import java.math.BigDecimal;
import java.util.Date;

import jpos.JposException;
import jpos.POSPrinterConst;

import org.compiere.model.MOrder;
import org.compiere.model.MOrderLine;
import org.compiere.model.MProduct;
import org.compiere.model.PO;

/**
 * Impresión de ticket de compra
 */
public class ImprimeTicketEnvio extends ManejadorAbstractoDeImpresion
{
    private DatosImpresion datos;

    public ImprimeTicketEnvio(final PO documento)
    {
        super(documento);
    }

    @Override
    protected void imprimirDocumento() throws JposException
    {
        printer.transactionPrint(POSPrinterConst.PTR_S_RECEIPT, 11);

        final MOrder orden = (MOrder) documento;
        datos = new DatosImpresion(orden);

        imprimirEnvio(orden);
        imprimirEnvio(orden); //copia
    } // imprimirDocumento

    private void imprimirEnvio(final MOrder orden) throws JposException
    {
        printEncabezado(orden);
        printDetalle(orden);
        printTotales(orden);

        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, LF);
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, CUT);

        printer.transactionPrint(POSPrinterConst.PTR_S_RECEIPT, POSPrinterConst.PTR_TP_NORMAL);
    } //imprimirEnvio

    private void printEncabezado(final MOrder orden) throws JposException
    {
        String linea;

        printer.setRecLetterQuality(true);

        // Información de la Compañia
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, LF);
        printer.printBitmap(POSPrinterConst.PTR_S_RECEIPT, datos.getLogo(), printer.getRecLineWidth(), POSPrinterConst.PTR_BM_CENTER);
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, LF);

        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, CENTER + datos.getDireccion() + LF);
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, CENTER + "Email: " + datos.getEmail() + LF);
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, LF);

        // Datos del Cliente
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, "Sucursal: " + datos.getSucursal() + LF);
        DatosCliente bp = datos.getDatosCliente();
        linea = Util.justifyString("Cliente: " + bp.getNombre(), 42, -1);
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, linea + LF);
        final String rut = "CUIT: " + bp.getCUIT();
        linea = Util.justifyString(rut, 22, -1);
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, linea + LF);
        linea = Util.justifyString("Dirección: " + bp.getDireccion(), 42, -1);
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, linea + LF);
        linea = Util.justifyString("Atendido por: " + datos.getUsuario(), 42, -1);
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, linea + LF);

        // Fecha de Emisión
        linea = Util.stringRepeat("_", printer.getRecLineChars());
        linea = Util.makePrintString(printer.getRecLineChars(), "Fecha Emisión: " + Util.fechaToString(orden.getDateOrdered(), "dd/MM/yyyy")
                                                              , "Hora: " + Util.fechaToString(new Date(), "HH:mm"));
        
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, linea + LF);

        // Fecha de Entrega.
        linea = Util.makePrintString(printer.getRecLineChars(), "Fecha Entrega: " + Util.fechaToString(orden.getDatePromised(), "dd/MM/yyyy")
                , "Turno: " + orden.get_ValueAsString("Turno") == "M" ? "Mañana" : "Tarde");
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, linea + LF);
        
    } // printEncabezado

    private void printDetalle(final MOrder orden) throws JposException
    {
        printer.setRecLetterQuality(false);
        String linea;

        linea = Util.stringRepeat("_", printer.getRecLineChars());
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, linea + LF);
        linea = "Código" + Util.stringRepeat(" ", 9) + "Descripción" + Util.stringRepeat(" ", 9) + "Importe";
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, linea + LF);
        //printer.setRecLineSpacing(10);
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, CENTER + "Cantidad x Precio" + LF);
        //printer.setRecLineSpacing(200);
        linea = Util.stringRepeat("_", printer.getRecLineChars());
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, linea + LF);

        for (final MOrderLine det : orden.getLines())
        {
            final MProduct prod = det.getProduct();

            final BigDecimal precioLinea = det.getLineNetAmt();
            final BigDecimal precioUnitario = det.getPriceActual();

            linea = Util.justifyString(prod.getValue(), 12, -1)
                  + Util.justifyString(prod.getName(), 20, -1)
                  + Util.formatDecimal(precioLinea, 2, 10);
            printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, linea + LF);

            linea = "     " + det.getQtyInvoiced() + " x " + Util.formatDecimal(precioUnitario, 2, 0) + " c/u";
            printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, linea + LF);
        }
    } // printDetalle

    private void printTotales(final MOrder orden) throws JposException
    {
        printer.setRecLetterQuality(false);
        String linea;

        linea = Util.makePrintString((printer.getRecLineChars() / 2), "Total",
                Util.formatoParaImporte(orden.getGrandTotal()));
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, DOUBLEH + BOLD + linea + LF + LF);

        // 3 cm de espacio
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, ESC + "|3000uF");

        // Renglon de firma
        linea = Util.stringRepeat("_", printer.getRecLineChars());
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, linea + LF);

        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, CENTER + "Firma y Aclaración" + LF);
    } // printTotales

}