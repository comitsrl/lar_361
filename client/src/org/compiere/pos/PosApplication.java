/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2011 Adempiere, Inc. All Rights Reserved.               *
 * This program is free software; you can redistribute it and/or modify it    *
 * under the terms version 2 of the GNU General Public License as published   *
 * by the Free Software Foundation. This program is distributed in the hope   *
 * that it will be useful, but WITHOUT ANY WARRANTY; without even the implied *
 * warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.           *
 * See the GNU General Public License for more details.                       *
 * You should have received a copy of the GNU General Public License along    *
 * with this program; if not, write to the Free Software Foundation, Inc.,    *
 * 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA.                     *
 *****************************************************************************/

package org.compiere.pos;

import java.awt.KeyboardFocusManager;
import java.awt.event.WindowEvent;
import java.awt.event.WindowListener;
import java.util.Properties;

import javax.swing.JFrame;

import org.compiere.Adempiere;
import org.compiere.apps.ADialog;
import org.compiere.apps.AEnv;
import org.compiere.apps.AKeyboardFocusManager;
import org.compiere.apps.ALogin;
import org.compiere.apps.form.FormFrame;
import org.compiere.model.MSession;
import org.compiere.swing.CFrame;
import org.compiere.util.DB;
import org.compiere.util.Env;
/**
 * Use for POS GUI Testing in Fitnesse with UISpec4J.
 * @author Compiere authors
 * @contributors  others and Redhuan D. Oon http://www.red1.org/adempiere
 *
 */
public class PosApplication {
	private Properties m_ctx;

	PosApplication() {
		Adempiere.startup(true);	//	needs to be here for UI
//		Splash splash = Splash.getSplash();   not mandatory, so its removed for faster GUI testing
		final FormFrame frame = new FormFrame(new CFrame().getGraphicsConfiguration());
		//  Focus Traversal
		KeyboardFocusManager.setCurrentKeyboardFocusManager(AKeyboardFocusManager.get());


		ALogin login = new ALogin(frame);
		if (!login.initLogin())		//	no automatic login
		{
			//	Center the window
			try
			{
				AEnv.showCenterScreen(login);	//	HTML load errors
			}
			catch (Exception ex)
			{
			}
			if (!login.isConnected()) // '|| !login.isOKpressed()' -- red1 -- can't work during UISpec4J testing
				AEnv.exit(1);
		}

		//  Check Build
		if (!DB.isBuildOK(m_ctx)) // red1 - m_ctx seems null
			AEnv.exit(1);
		Env.setContext( Env.getCtx(), "#M_Warehouse_ID", 104 ); //red1 - presetting to Store Central for GUI Testing
		if (!Adempiere.startupEnvironment(true)) // Load Environment
			System.exit(1);
		MSession.get (Env.getCtx(), true);		//	Start Session

		//int m_WindowNo = Env.createWindowNo(frame); emmie

	//  Default Image
		frame.setIconImage(Adempiere.getImage16());

		// Setting close operation/listener - teo_sarca [ 1684168 ]
		frame.setDefaultCloseOperation(JFrame.DO_NOTHING_ON_CLOSE);
		frame.addWindowListener(new WindowListener() {
			public void windowClosing(WindowEvent e) {
				if (!ADialog.ask(0, null, "ExitApplication?"))
					return;
				frame.dispose();
			}
			public void windowActivated(WindowEvent e) {}
			public void windowClosed(WindowEvent e) {}
			public void windowDeactivated(WindowEvent e) {}
			public void windowDeiconified(WindowEvent e) {}
			public void windowIconified(WindowEvent e) {}
			public void windowOpened(WindowEvent e) {}
		});

		PosBasePanel pos = new PosBasePanel();
		pos.init(0,frame);
		frame.pack();
//		splash.dispose();
//		splash = null;
		frame.setVisible(true);
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		new PosApplication();

	}

}
