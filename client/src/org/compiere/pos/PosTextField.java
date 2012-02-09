/******************************************************************************
 * Product: Adempiere ERP & CRM Smart Business Solution                       *
 * Copyright (C) 1999-2006 Adempiere, Inc. All Rights Reserved.               *
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

import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.text.Format;
import java.util.Locale;
import java.util.logging.Level;

import javax.swing.JFormattedTextField;
import javax.swing.text.BadLocationException;

import org.compiere.util.CLogger;
import org.compiere.util.Language;


/**
 * Formatted Text field with on-screen keyboard support
 * @author Paul Bowden
 * Adaxa Pty Ltd
 *
 */
public class PosTextField extends JFormattedTextField implements MouseListener, KeyListener
{
	/**
	 *
	 */
	private static final long serialVersionUID = -2453719110038264481L;
	private static CLogger log = CLogger.getCLogger(PosTextField.class);
	//private DefaultFormatterFactory formatFactory = new DefaultFormatterFactory(); emmie
	private PosBasePanel pos = null;
	private int keyLayoutId = 0;
	private String title;
	// emmie - workaround to decimal key (numpad) with spanish language
	private boolean isSpanish = false;

	public PosTextField(String title, PosBasePanel pos, final int posKeyLayout_ID, Format format ) {
		super(format);
		init(title, pos, posKeyLayout_ID);
	}

	public PosTextField(String title, PosBasePanel pos, final int posKeyLayout_ID, AbstractFormatter formatter ) {
		super(formatter);
		init(title, pos, posKeyLayout_ID);
	}


	public PosTextField(String title, PosBasePanel pos, final int posKeyLayout_ID) {
		super();
		init(title, pos, posKeyLayout_ID);
	}

	public void mouseReleased(MouseEvent arg0) {}
	public void mousePressed(MouseEvent arg0) {}
	public void mouseExited(MouseEvent arg0) {}
	public void mouseEntered(MouseEvent arg0) {}

	public void mouseClicked(MouseEvent arg0) {

		if ( isEnabled() && isEditable() )
		{
			POSKeyboard keyboard = pos.getKeyboard(keyLayoutId);
			keyboard.setTitle(title);
			keyboard.setPosTextField(this);
			keyboard.setVisible(true);
			fireActionPerformed();
		}
	}

	/***************************************************************
	 * Decimal Key Workaround (spanish language only)
	 */
    @Override
    public void keyTyped(KeyEvent e) {}

    @Override
    public void keyPressed(KeyEvent e)
    {
        if (isSpanish && e.getKeyLocation() == KeyEvent.KEY_LOCATION_NUMPAD &&
                e.getKeyCode() == KeyEvent.VK_DECIMAL)
        {
             try {
                getDocument().insertString(getDocument().getLength(), ",", null);
            } catch (BadLocationException ex) {
                log.log(Level.SEVERE, ex.getMessage(), ex);
            }
        }
    }

    @Override
    public void keyReleased(KeyEvent e)
    {
        if (isSpanish && e.getKeyLocation() == KeyEvent.KEY_LOCATION_NUMPAD &&
                e.getKeyCode() == KeyEvent.VK_DECIMAL)
        {
            try {
                getDocument().remove(getDocument().getLength() -1, 1);
            } catch (BadLocationException ex) {
                log.log(Level.SEVERE, ex.getMessage(), ex);
            }
        }
    }

    /**
     * Init pos text field
     * @param title
     * @param pos
     * @param posKeyLayout_ID
     */
    private void init(String title, PosBasePanel pos, final int posKeyLayout_ID)
    {
        keyLayoutId = posKeyLayout_ID;
        this.pos = pos;
        this.title = title;

        // only apply "decimal key workaround" if no key layout configurated
        if (posKeyLayout_ID > 0) {
            addMouseListener(this);
        } else {
            addKeyListener(this);
            Locale locale = Language.getLoginLanguage().getLocale();
            isSpanish = locale.getLanguage().equals(new Locale("es", "", "").getLanguage());
        }
    }
}
