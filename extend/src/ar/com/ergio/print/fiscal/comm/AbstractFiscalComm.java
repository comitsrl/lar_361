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
package ar.com.ergio.print.fiscal.comm;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.PrintWriter;

import ar.com.ergio.print.fiscal.msg.MsgRepository;

public abstract class AbstractFiscalComm implements FiscalComm {

	private boolean connected = false;
	private InputStream inputStream;
	private OutputStream outputStream;
	private BufferedReader reader;
	private PrintWriter writer;  
	
	public void close() throws IOException {
		if(getInputStream() != null)
			getInputStream().close();
		if(getOutputStream() != null)
			getOutputStream().close();
		setInputStream(null);
		setOutputStream(null);
		setConnected(false);
	}
	
	/**
	 * @throws <code>IllegalStateException</code> si la interfaz de comunicación
	 * no se encuentra conectada al dispositivo.
	 */
	protected void validateConnection() {
		if(!isConnected())
			throw new IllegalStateException(MsgRepository.get("DeviceNotConnectedError"));
	}

	/**
	 * @return Returns the connected.
	 */
	public boolean isConnected() {
		return connected;
	}

	/**
	 * @param connected The connected to set.
	 */
	protected void setConnected(boolean connected) {
		this.connected = connected;
	}

	/**
	 * @return Returns the in.
	 */
	public InputStream getInputStream() {
		return inputStream;
	}

	/**
	 * @param in The in to set.
	 */
	public void setInputStream(InputStream in) {
		this.inputStream = in;
	}

	/**
	 * @return Returns the out.
	 */
	public OutputStream getOutputStream() {
		return outputStream;
	}

	/**
	 * @param out The out to set.
	 */
	public void setOutputStream(OutputStream out) {
		this.outputStream = out;
	}

	/**
	 * @return Returns the reader.
	 */
	public BufferedReader getReader() {
		if(reader == null)
			reader = new BufferedReader(new InputStreamReader(getInputStream()));
		return reader;
	}

	/**
	 * @param reader The reader to set.
	 */
	public void setReader(BufferedReader reader) {
		this.reader = reader;
	}

	/**
	 * @return Returns the writer.
	 */
	public PrintWriter getWriter() {
		if(writer == null)
			writer = new PrintWriter(getOutputStream());
		return writer;
	}

	/**
	 * @param writer The writer to set.
	 */
	public void setWriter(PrintWriter writer) {
		this.writer = writer;
	}

}
