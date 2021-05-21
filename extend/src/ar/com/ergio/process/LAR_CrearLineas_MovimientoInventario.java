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
package ar.com.ergio.process;

import java.util.logging.Level;

import org.compiere.model.MMovement;
import org.compiere.model.MMovementLine;
import org.compiere.model.PO;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereUserError;
import org.compiere.util.CLogger;
import org.compiere.util.ValueNamePair;

/**
 * Proceso de copía de líneas, desde otro movimiento de inventario.
 * @author fchiappano
 */
public class LAR_CrearLineas_MovimientoInventario extends SvrProcess
{
    int p_M_Movement_ID_Origen = 0;
    int p_M_Movement_ID_Copia = 0;

    @Override
    protected void prepare()
    {
        ProcessInfoParameter[] para = getParameter();
        for (int i = 0; i < para.length; i++)
        {
            String name = para[i].getParameterName();

            if (para[i].getParameter() == null)
                ;
            else if (name.equals("M_Movement_ID"))
            {
                p_M_Movement_ID_Origen = para[i].getParameterAsInt();
            }
            else
            {
                log.log(Level.SEVERE, "Unknown Parameter: " + name);
            }
        }

        p_M_Movement_ID_Copia = getRecord_ID();
    } // prepare

    @Override
    protected String doIt() throws Exception
    {
        // @fchiappano Validar que se haya recuperado correctamente el ID del
        // movimiento origen.
        if (p_M_Movement_ID_Origen <= 0)
            throw new AdempiereUserError("Por favor, seleccione un Movimiento de Inventario valido.");

        // @fchiappano instanciar ambos movimientos (original y copia).
        MMovement movimientoOrigen = new MMovement(getCtx(), p_M_Movement_ID_Origen, get_TrxName());
        MMovement movimientoCopia = new MMovement(getCtx(), p_M_Movement_ID_Copia, get_TrxName());

        // @fchiappano si el MI seleccionado no posee lineas, notificar al
        // usuario para que no parezca que el proceso no hace nada.
        MMovementLine[] lineas = movimientoOrigen.getLines(false);
        if (lineas.length <= 0)
            throw new AdempiereUserError("El Movimiento de Stock seleccionado, no posee líneas cargadas.");

        // @fchiappano Recorrer las lineas del movimiento original y relizar la
        // copia de los datos en una nueva linea del movimiento copia.
        for (MMovementLine linea : lineas)
        {
             MMovementLine nuevaLinea = new MMovementLine(movimientoCopia);
             PO.copyValues(linea, nuevaLinea);
             // @fchiappano Pisar las ubicaciones de la linea, con las ubicaciones seleccionadas en la cabecera.
             nuevaLinea.setM_Locator_ID(movimientoCopia.get_ValueAsInt("M_Locator_ID"));
             nuevaLinea.setM_LocatorTo_ID(movimientoCopia.get_ValueAsInt("M_LocatorTo_ID"));
             nuevaLinea.setM_Movement_ID(p_M_Movement_ID_Copia);
             nuevaLinea.setAD_Org_ID(movimientoCopia.getAD_Org_ID());
             nuevaLinea.set_ValueOfColumn("AD_Client_ID", movimientoCopia.getAD_Client_ID());

            // @fchiappano Chequear que se haya copiado una UM. Validación de
            // compatibilidad para MI generados antes de la implementacion de
            // conversion de UM en esta ventana.
            if (nuevaLinea.get_ValueAsInt("C_UOM_ID") <= 0)
                nuevaLinea.set_ValueOfColumn("C_UOM_ID", nuevaLinea.getM_Product().getC_UOM_ID());

            if (!nuevaLinea.save(get_TrxName()))
            {
                String msgError = "";
                // @fchiappano Recuperar error de guardado desde el logger.
                ValueNamePair pp = CLogger.retrieveError();
                if (pp != null)
                    msgError = pp.getValue();

                throw new AdempiereUserError("Error al copiar línea N° " + nuevaLinea.getLine() + ": " + msgError);
            }
        }

        return "Líneas copiadas con exito.";
    } // doIt

} // LAR_CrearLineas_MovimientoInventario
