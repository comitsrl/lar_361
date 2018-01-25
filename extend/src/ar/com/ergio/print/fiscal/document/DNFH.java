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
package ar.com.ergio.print.fiscal.document;

import ar.com.ergio.print.fiscal.exception.DocumentException;

/**
 * Documento no-fiscal homologado (DNFH), utilizado para la impresión de remitos
 *
 * @author Emiliano Pereyra - http://www.ergio.com.ar
 */
public class DNFH extends Document
{
    /**
     *
     */
    private static final long serialVersionUID = -7477250088894436720L;
    private int numberOfCopies = 0;
    // Inicador de cierre de impresión fiscal. Por defecto se cierra.
    private boolean printEnded = true;

    @Override
    public String getDocumentType()
    {
        return DT_SHIPMENT;
    }

    @Override
    public void validate() throws DocumentException
    {
        try {
            // Se validan los datos del cliente.
            getCustomer().validate();
        } catch (DocumentException e) {
            // Se relanza la excepción agregando este documento como
            // parámetro.
            e.setDocument(this);
            throw e;
        }

        // Validar cantidad de líneas mayor que 0.
        if (getLines().isEmpty())
            throw createDocumentException("InvalidDocumentLinesCount", this);
    }

    public int getNumberOfCopies()
    {
        return numberOfCopies;
    }

    public void setNumberOfCopies(int numberOfCopies)
    {
        this.numberOfCopies = numberOfCopies;
    }

    /**
     * Indica si se tiene que cerrar la impresión fiscal al
     * finalizar el procesamiento de este documento.
     *
     * @return
     */
    public boolean isPrintEnded()
    {
        return printEnded;
    }

    /**
     * Determina si se debe finalizar o no la impresión fiscal
     * al finalizar el procesamiento del documento
     *
     * @param printEnded indica si se debe cerrar o no la impresión fiscal
     */
    public void setPrintEnded(boolean printEnded)
    {
        this.printEnded = printEnded;
    }

    @Override
    public String toString()
    {
        StringBuffer sb = new StringBuffer("DNFH[")
                .append("copies=").append(numberOfCopies)
                .append(",printEnded=").append(printEnded)
                .append(",type=").append(getDocumentType())
                .append("]");
        return sb.toString();
    }
}
