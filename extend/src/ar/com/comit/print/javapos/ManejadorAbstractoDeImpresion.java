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

import java.util.logging.Level;

import javax.swing.JOptionPane;

import jpos.JposException;
import jpos.POSPrinter;
import jpos.POSPrinterConst;

import org.compiere.model.PO;
import org.compiere.util.CLogger;

/**
 * Clase Template que define genéricamente el algorithmo
 * de impresión en una impresora Java POS
 *
 * @author Emiliano Pereyra - http://www.comit.com.ar
 */
public abstract class ManejadorAbstractoDeImpresion
{
    protected static final String ESC = "\u001b";
    protected static final String LF = "\n";
    protected static final String CENTER = ESC + "|cA";
    protected static final String DOUBLEH = ESC + "|2C";
    protected static final String RIGHT = ESC + "|rA";
    protected static final String CUT = ESC + "|100fP";
    protected static final String BOLD = ESC + "|bC";
    protected static final String UNDERSCORE = ESC + "|uC";

    protected static CLogger log = CLogger.getCLogger(ManejadorAbstractoDeImpresion.class);
    protected POSPrinter printer;

    final protected PO documento;

    public ManejadorAbstractoDeImpresion(final PO documento)
    {
        this.documento = documento;
    }

    public boolean imprimir() throws JposException
    {
        boolean resultado = false;
        boolean sigue = true;


        while (sigue)
        {
            try
            {
                log.config("Abriendo e inicializando dispositivo...");

                // Esta instancia de impresora ya está inicializada
                printer = ImpresoraPOS.getInstance().getPrinter();

                if (printer.getCoverOpen())
                {
                    final String msg = "Cubierta abierta";
                    log.config(msg);
                    throw new JposException(1, msg);
                }

                if (printer.getRecEmpty() == true)
                {
                    final String msg = "Impresora sin papel";
                    log.config(msg);
                    throw new JposException(2, msg);
                }

                // Paso genérico delegado a la subclase concreta
                imprimirDocumento();

                resultado = true;
                sigue = false;
            }
            catch (JposException e)
            {
                final String msg = "Error en Impresi\u00f3n JPOS";
                log.log(Level.SEVERE, msg, e);
                throw new JposException(3, msg);
            }
            /*
             * @emmie - Se cierra al finalizar el uso del ERP, para agilizar la impresión
             *
            finally
            {
                try {printer.close();} catch (Exception e){log.severe(e.getLocalizedMessage());}
            }
             */

            // FIXME - @emmie, revisar
            if ((!resultado)
                    && (1 == JOptionPane.showConfirmDialog(null, "¿ Reintentar ?",
                            "Error al imprimir documento.", 0)))
            {
                sigue = false;
            }

        }

        return resultado;
    } // imprimeDoc

    /**
     * Método template que delega a la subclase la funcionalidad
     * específica de impresión
     *
     * @param printer impresora java POS
     */
    protected abstract void imprimirDocumento() throws JposException;

    /**
     * Singleton anidado para la inicialización de la impresora
     */
    public static final class ImpresoraPOS
    {
        private static ImpresoraPOS instance;

        private POSPrinter printer = null;

        private ImpresoraPOS() throws JposException
        {
            printer = new POSPrinter();
            // FIXME - @emmie - Parametrizar esta nombre
            printer.open("PRT100FC");

            // Se obtiene el control exclusivo para el dispositivo abierto,
            // por lo que el mismo no está disponible para otra aplicación
            printer.claim(1000);

            // Deja disponible el dispositivo
            printer.setDeviceEnabled(true);

            // Incluso si utiliza cualquier impresora, la unidad de 0,01 mm
            // permite imprimir con claridad.
            printer.setMapMode(POSPrinterConst.PTR_MM_METRIC);
            printer.setCharacterSet(1252);
        }

        public static ImpresoraPOS getInstance() throws JposException
        {
            if (instance == null)
                instance = new ImpresoraPOS();

            return instance;
        }

        public POSPrinter getPrinter()
        {
            return printer;
        }

        public void close() throws JposException
        {
            printer.close();
            printer = null;
            instance = null;
        }
    }
}