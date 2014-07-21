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

import ar.com.ergio.model.MLARPaymentHeader;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;

/**
 *
 * @author german wagner
 * @deprecated Desde commit de002ca se incorporó el flujo de trabajo para
 *             el proceso de las cabeceras de cobros/pagos, por tal razón
 *             esta clase queda en desuso.
 */
public class LAR_ProcessPaymentHeader extends SvrProcess
{
	private String accion = null;
	private Integer paymentHeader_ID = null;

	protected void prepare()
	{
		ProcessInfoParameter[] para = getParameter();
		for (int i = 0; i < para.length; i++)
		{
			String name = para[i].getParameterName();

			if (para[i].getParameter() == null)
				;
			else if (name.equals("Accion"))
			{
				accion = para[i].getParameter().toString();
			}
			else if (name.equals("LAR_PaymentHeader_ID"))
			{
				paymentHeader_ID = para[i].getParameterAsInt();
			}
			else
			{
				log.log(Level.SEVERE, "Unknown Parameter: " + name);
			}
		}

	}

	protected String doIt() throws Exception
	{
		String result="Documento procesado con éxito";

		MLARPaymentHeader header = new MLARPaymentHeader(getCtx(),paymentHeader_ID, get_TrxName());
		if(!header.processIt(accion))
			result="No se pudo procesar el documento";

		return result;
	}
}
