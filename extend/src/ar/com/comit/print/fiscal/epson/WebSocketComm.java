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
package ar.com.comit.print.fiscal.epson;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.ByteBuffer;
import java.util.logging.Level;

import javax.websocket.ClientEndpoint;
import javax.websocket.CloseReason;
import javax.websocket.ContainerProvider;
import javax.websocket.DeploymentException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.PongMessage;
import javax.websocket.Session;
import javax.websocket.WebSocketContainer;

import org.compiere.util.CLogger;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;

import ar.com.ergio.print.fiscal.FiscalPacket;
import ar.com.ergio.print.fiscal.comm.FiscalComm;

/**
 * Cliente WebSocket
 *
 * @author fchiappano
 */
@ClientEndpoint
public class WebSocketComm implements FiscalComm
{
    /** Logger */
    protected CLogger log = CLogger.getCLogger(getClass());

    Session userSession = null;
    private String respuesta;
    private String error;
    private String host;
    private int port;

    public WebSocketComm(String host, int port)
    {
        this.host = host;
        this.port = port;
    } // WebSocketComm

    /**
     * Callback hook for Connection open events.
     *
     * @param userSession
     *            the userSession which is opened.
     */
    @OnOpen
    public void onOpen(Session userSession)
    {
        System.out.println("opening websocket");
        this.userSession = userSession;
    }

    /**
     * Callback hook for Connection close events.
     *
     * @param userSession
     *            the userSession which is getting closed.
     * @param reason
     *            the reason for connection close
     */
    @OnClose
    public void onClose(Session userSession, CloseReason reason)
    {
        System.out.println("closing websocket");
        try
        {
            this.userSession.close(reason);
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        this.userSession = null;
    }

    /**
     * Callback hook for Message Events. This method will be invoked when a client send a message.
     *
     * @param message
     *            The text message
     */
    @OnMessage
    public void onMessage(String message)
    {
        this.respuesta = message;
    }

    @OnMessage
    public void onMessage(PongMessage message) {
        System.out.println("PongMessage Recibido: " + message);
        log.log(Level.WARNING, "PongMessage Recibido: " + message);
    }

    @OnMessage
    public void onMessage(ByteBuffer bytes)
    {
        System.out.println("Handle byte buffer");
        log.log(Level.WARNING, "Mensaje Recibido en Bytes: " + bytes);
    }

    // Processing when receiving a message
    @OnError
    public void onError(Throwable th)
    {
        error = th.getMessage();
    } // onError

    /**
     * Send a message.
     *
     * @param message
     */
    public void sendMessage(String message)
    {
        try
        {
            if (!isConnected())
                connect();

            this.userSession.getBasicRemote().sendText(message);
            // @fchiappano esperar 5 segundos por la respuesta del CF.
            Thread.sleep(5000);

            // @fchiappano Esperar otros 5 segundos.
            if (respuesta == null)
                Thread.sleep(5000);
            // @fchiappano Cerrar Conexión.
            close();
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        catch (InterruptedException e)
        {
            e.printStackTrace();
        }
    } // sendMessage

    public void connect() throws IOException
    {
        try
        {
            URI endPointURI = new URI("ws://" + host + ":" + port + "/ws");
            WebSocketContainer container = ContainerProvider.getWebSocketContainer();
            container.setAsyncSendTimeout(12000);
            userSession = container.connectToServer(this, endPointURI);
        }
        catch (IOException | URISyntaxException e)
        {
            e.printStackTrace();
        }
        catch (DeploymentException e)
        {
            e.printStackTrace();
        }
    } // connect

    public boolean isConnected()
    {
        if (userSession != null)
            return userSession.isOpen();

        return false;
    } // isConnected

    public void close() throws IOException
    {
        if (userSession != null)
        {
            error = null;
            userSession.close();
            userSession = null;
            respuesta = null;
        }
    } // close

    @Override
    public void execute(FiscalPacket request, FiscalPacket response) throws IOException
    {}

    public JSONObject getRespuesta()
    {
        if (respuesta != null)
        {
            JSONObject rta = (JSONObject) JSONValue.parse(respuesta);
            return rta;
        }

        return null;
    } // getRespuesta

    public String getError()
    {
        return error;
    } // getError

} // WebSocketClient
