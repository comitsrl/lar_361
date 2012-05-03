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
/** Generated Model - DO NOT CHANGE */
package ar.compiere.apps.search;

import java.awt.Frame;

import org.compiere.apps.AEnv;
import org.compiere.apps.search.Info;
import org.compiere.apps.search.InfoFactory;


/**
 * 
 * @author German Wagner
 *
 */
public class InfoFactoryOnDrawerChecks implements InfoFactory
{
	/**
	 * 
	 */
	private static final long serialVersionUID = -2917241055484901704L;

	public InfoFactoryOnDrawerChecks()
	{
	}

	public Info create(Frame frame, boolean modal, int WindowNo, String tableName, String keyColumn, String value, boolean multiSelection, String whereClause) 
	{
		Info i=InfoOnDrawerChecks.create(frame, modal, WindowNo, tableName, keyColumn, value, true, whereClause);
		AEnv.positionCenterWindow(frame, i);
		return i;
	}
	
	
}   //  InfoPayment
