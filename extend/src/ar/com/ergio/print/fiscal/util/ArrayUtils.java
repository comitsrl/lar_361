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
package ar.com.ergio.print.fiscal.util;

public class ArrayUtils {

	public static byte[] append(byte [] array, byte [] otherArray) {
		byte [] result = new byte[array.length + otherArray.length];
		System.arraycopy(array, 0, result, 0, array.length);
		System.arraycopy(otherArray, 0, result, array.length, otherArray.length);
		return result;
	}
	
	public static byte[] append(byte[] array, byte value) {
		byte[] valueArray = { value };
		return append(array, valueArray);
	}
	
	public static byte[] redim(byte[] array, int length) {
		byte[] result = new byte[length];
		System.arraycopy(array, 0, result, 0, length);
		return result;
	}
	
	//Ader Javier : 10 oct 2010
	/**
	 * Remueve el prefijo de logitud prefixLength; SE ASUME
	 * que array tiene longitud mayor o igual a prefixLength.
	 * Ejemplo: [10,11,12,13,14], prefixLength = 3 -> [10,11,12]
	 * y con prefixLength[5] = []
	 * @param array
	 * @param prefixLength
	 * @return
	 */
	public static byte[] removePrefix(byte[] array, int prefixLength)
	{
		int newLength =array.length - prefixLength;
		byte[] newArray = new byte[newLength];
		if (newLength == 0)
			return newArray;
		System.arraycopy(array, prefixLength, newArray,0, newLength);
		return newArray;
	}
}
