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

package org.globalqss.util;

/**
 *	Utils for Localization LCO
 *
 *  @author Jesus Garcia - globalqss - Quality Systems & Solutions - http://globalqss.com
 *	@version $Id: LCO_Utils.java,v 1.0 2008/05/26 23:01:26 cruiz Exp $
 */

public class LCO_Utils
{

	/**
	 *	Calculate DIAN Digit based on TaxID.
	 */
	public static int calculateDigitDian(String strNit) {

		//Vector de numeros primos
		int iNrosPrimos[] = { 3, 7, 13, 17, 19, 23, 29, 37,	41, 43, 47, 53, 59, 67, 71 };
		//Variable para realizar las operaciones
		int iOperacion = 0;
		int posini = 0;
	
		//Ciclo para multiplicar cada uno de los digitos del NIT con el vector
		for (int i = 0; i < strNit.trim().length() ; i++) {
			posini = strNit.trim().length() - (i + 1);
			try {
				iOperacion = iOperacion + Integer.parseInt(strNit.substring(posini, posini + 1)) * iNrosPrimos[i];
			} catch (NumberFormatException e) {
				return -1;
			}
		}
	
		//Obtener el residuo de la operacion
		iOperacion %= 11;
	
		if (iOperacion == 0 || iOperacion == 1)	{
		    return iOperacion;
		}
		else {
		    return 11 - iOperacion;
		}
	}	// calculateDigitDian

}	// LCO_Utils