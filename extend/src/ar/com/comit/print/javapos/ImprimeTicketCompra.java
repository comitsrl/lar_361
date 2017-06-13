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

import org.compiere.model.MInvoice;
import org.compiere.model.MInvoiceLine;
import org.compiere.model.MProduct;
import org.compiere.model.PO;

/**
 * Impresión de ticket de compra
 */
public class ImprimeTicketCompra extends ManejadorAbstractoDeImpresion
{
    private BigDecimal subTotal = new BigDecimal(0);
    private DatosImpresion datos;

    public ImprimeTicketCompra(final PO documento)
    {
        super(documento);
    }

    @Override
    protected void imprimirDocumento() throws JposException
    {
        printer.transactionPrint(POSPrinterConst.PTR_S_RECEIPT, 11);

        final MInvoice factura = (MInvoice) documento;
        datos = new DatosImpresion(factura);

        printEncabezado(factura);
        printDetalle(factura);
        printTotales(factura);

        /*
        printer.setRecLineChars(56);
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, CENTER + "Timbre Electrónico SII" + LF);
        if (documento.getIdTipoDocumento() == 101)
            printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, CENTER + "Res. 97 de 2012. Verifique Documento: " + datos.getURL() + LF);
        else
        {
            printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, CENTER + "Res. 97 de 2012. Verifique Documento: www.sii.cl" + LF);
        }
        printer.setRecLineChars(42);
         */

        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, LF);
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, CUT);

        printer.transactionPrint(POSPrinterConst.PTR_S_RECEIPT, POSPrinterConst.PTR_TP_NORMAL);
    } // imprimirDocumento

    private void printEncabezado(final MInvoice factura) throws JposException
    {
        String linea;

        printer.setRecLetterQuality(true);

        // Información de la Compañia
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, LF);
        printer.printBitmap(POSPrinterConst.PTR_S_RECEIPT, datos.getLogo(), (printer.getRecLineWidth() / 2), POSPrinterConst.PTR_BM_CENTER);
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, LF);

        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, CENTER + DOUBLEH + BOLD + datos.getRazonSocial() + LF);
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, CENTER + datos.getDireccion() + LF);
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, CENTER + "CUIT: " + datos.getCUIT() + LF);
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, CENTER + "Email: " + datos.getEmail() + LF);
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, CENTER + "IIBB: " + datos.getIIBB() + LF);
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, CENTER + "Inicio Actividad: " + datos.getInicioActividades() + LF);
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

        // Datos de tipo de factura
        linea = Util.stringRepeat("_", printer.getRecLineChars());
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, linea + LF);
        linea = Util.makePrintString(printer.getRecLineChars(), "FACTURA \"" + datos.getLetra() + "\"", "Nº " + datos.getNumeroDocumento());
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, BOLD + linea + LF + LF);
        linea = Util.makePrintString(printer.getRecLineChars(), "Fecha Emisión: " + Util.fechaToString(factura.getDateInvoiced(), "dd/MM/yyyy")
                                                              , "Hora: " + Util.fechaToString(new Date(), "HH:mm"));
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, linea + LF);
    } // printEncabezado

    private void printDetalle(final MInvoice factura) throws JposException
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

        for (final MInvoiceLine det : factura.getLines())
        {
            final MProduct prod = det.getProduct();

            // Determina precio con o sin iva en función del tipo de comprobante
            final BigDecimal precioLinea = datos.isDiscriminaIVA() ? det.getLineNetAmt() : det.getLineTotalAmt();
            final BigDecimal precioUnitario = datos.isDiscriminaIVA() ? det.getPriceActual() : det.getLineTotalAmt().divide(det.getQtyInvoiced());

            linea = Util.justifyString(prod.getValue(), 12, -1)
                  + Util.justifyString(prod.getName(), 20, -1)
                  + Util.formatDecimal(precioLinea, 2, 10);
            printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, linea + LF);

            linea = "     " + det.getQtyInvoiced() + " x " + Util.formatDecimal(precioUnitario, 2, 0) + " c/u";
            printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, linea + LF);
            subTotal = subTotal.add(det.getLineNetAmt());
        } // for

        linea = Util.stringRepeat("_", printer.getRecLineChars());
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, linea + LF);

        // Si es factura B no imprime subtotal
        if (datos.isDiscriminaIVA())
        {
            linea = Util.makePrintString(printer.getRecLineChars(), "Subtotal", Util.formatoParaImporte(subTotal));
            printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, linea + LF + LF);
        }
        //printer.setRecLineSpacing(ls);
    } // printDetalle

    private void printTotales(final MInvoice factura) throws JposException
    {
        printer.setRecLetterQuality(false);
        String linea;

        if (datos.isDiscriminaIVA())
        {
            linea = Util.makePrintString(printer.getRecLineChars(), "Total Neto", Util.formatoParaImporte(subTotal));
            printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, linea + LF);

            linea = Util.makePrintString(printer.getRecLineChars(), "IVA 21%", Util.formatoParaImporte(factura.getGrandTotal().subtract(subTotal)));
            printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, linea + LF);

            linea = Util.makePrintString((printer.getRecLineChars() / 2), "Total", Util.formatoParaImporte(factura.getGrandTotal()));
            printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, DOUBLEH + BOLD + linea + LF + LF);

            // TODO
            // final long total = doc.getMontoNeto().add(doc.getMontoImpuesto()).longValue();
            // linea = "SON: " + PrinterUtils.numeroAPalabra(total).trim() + " PESOS";
            // printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, linea.toUpperCase() + LF + LF);
        }
        else
        {
            linea = Util.makePrintString((printer.getRecLineChars() / 2), "Total", Util.formatoParaImporte(factura.getGrandTotal()));
            printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, DOUBLEH + BOLD + linea + LF + LF);
        }

        linea = Util.justifyString("  " + factura.getPaymentRule(), 30, -1);
        // TODO
        // Imprimir todos los medios de pago (recorrer las asignaciones)

        //printer.setRecLineSpacing(ls);

        //1cm de espacio
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, ESC + "|1000uF");

        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, CENTER + "CAE: " + datos.getCAE() + LF);
        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, CENTER + "Vto CAE: " + Util.fechaToString(datos.getVtoCAE(), "dd/MM/yyyy") + LF);

        printer.printNormal(POSPrinterConst.PTR_S_RECEIPT, ESC + "|500uF");

        // Imprime el código de barras >> SOLO CAE
        if (printer.getCapRecBarCode())
        {
            printer.printBarCode(POSPrinterConst.PTR_S_RECEIPT, datos.getCAE(), POSPrinterConst.PTR_BCS_ITF, 1000,
                    printer.getRecLineWidth(), POSPrinterConst.PTR_BC_CENTER, POSPrinterConst.PTR_BC_TEXT_BELOW);
        }
    } // printTotales

}