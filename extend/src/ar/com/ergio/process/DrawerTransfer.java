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
package ar.com.ergio.process;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

import org.compiere.model.MBankAccount;
import org.compiere.model.MBankStatementLine;
import org.compiere.model.MUser;
import org.compiere.process.ProcessInfoParameter;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereUserError;
import org.compiere.util.DB;
import org.compiere.util.Env;

import ar.com.ergio.model.TransaccionCuentaBancaria;

/**
 * Drawer transfer
 *
 * Based on BankTranfer contributed by Victor Perez.
 *
 * @author Emiliano Pereyra - http://www.ergio.com.ar
 *
 **/
public class DrawerTransfer extends SvrProcess
{
    private String p_DocumentNo = ""; // Document No
    private String p_Description = ""; // Description
    private int p_C_BPartner_ID = 0; // Business Partner to be used as bridge
    // private int p_C_Currency_ID = 0; // Payment Currency

    private int p_From_C_BankAccount_ID = 0; // Bank Account From
    private int p_To_C_BankAccount_ID = 0; // Bank Account To
    private Timestamp p_StatementDate = null; // Date Statement
    private Timestamp p_DateAcct = null; // Date Account
    private int p_BankStatement_ID = 0;
    private int m_transferred = 0;

    /**
     * Prepare - e.g., get Parameters.
     */
    protected void prepare()
    {
        ProcessInfoParameter[] para = getParameter();
        for (int i = 0; i < para.length; i++) {
            String name = para[i].getParameterName();
            if (name.equals("From_C_BankAccount_ID"))
                p_From_C_BankAccount_ID = para[i].getParameterAsInt();
            else if (name.equals("To_C_BankAccount_ID"))
                p_To_C_BankAccount_ID = para[i].getParameterAsInt();
            // else if (name.equals("C_Currency_ID"))
            // p_C_Currency_ID = para[i].getParameterAsInt();
            else if (name.equals("Description"))
                p_Description = (String) para[i].getParameter();
            else if (name.equals("DocumentNo"))
                p_DocumentNo = (String)para[i].getParameter();
            else if (name.equals("StatementDate"))
                p_StatementDate = (Timestamp) para[i].getParameter();
            else if (name.equals("DateAcct"))
                p_DateAcct = (Timestamp) para[i].getParameter();
            else if (name.equals("C_BankStatement_ID"))
                p_BankStatement_ID = para[i].getParameterAsInt();
            else
                log.log(Level.SEVERE, "prepare - Unknown Parameter: " + name);
        }
    } // prepare

    /**
     * Perform process.
     *
     * @return Message (translated text)
     * @throws Exception
     *             if not successful
     */
    protected String doIt() throws Exception
    {
        String msg = String.format("From Bank=%d - To Bank=%d - DocumentNo=%s - Description=%s - Statement Date=%s - Date Account=%s",
                p_From_C_BankAccount_ID, p_To_C_BankAccount_ID, p_DocumentNo, p_Description, p_StatementDate, p_DateAcct);
        log.info(msg);

        if (p_From_C_BankAccount_ID == 0)
            throw new IllegalArgumentException("Número de Caja Requerido");

        // if (p_DocumentNo == null || p_DocumentNo.length() == 0)
        // throw new IllegalArgumentException("Document No required");

        // if (p_To_C_BankAccount_ID == p_From_C_BankAccount_ID)
        // throw new AdempiereUserError("Accounts From and To must be different");

        p_C_BPartner_ID = new MUser(getCtx(), Env.getAD_User_ID(getCtx()), get_TrxName()).getC_BPartner_ID();        
        if (p_C_BPartner_ID == 0)
            throw new AdempiereUserError ("Socio de Negocio requerido");

        // if (p_C_Currency_ID == 0)
        // throw new AdempiereUserError("Currency required");

        // Login Date
        if (p_StatementDate == null)
            p_StatementDate = Env.getContextAsDate(getCtx(), "#Date");
        if (p_StatementDate == null)
            p_StatementDate = new Timestamp(System.currentTimeMillis());

        if (p_DateAcct == null)
            p_DateAcct = p_StatementDate;

        if (p_BankStatement_ID == 0)
            throw new AdempiereUserError ("Por favor, seleccione un cierre de caja a transferir.");

        // Si la cuenta, es una caja principal, se transfieren los valores segun 
        // la forma de pago.
        final MBankAccount cuenta = new MBankAccount(getCtx(), p_From_C_BankAccount_ID, get_TrxName());
        if(cuenta.get_ValueAsBoolean("EsCajaPrincipal"))
            m_transferred = TransaccionCuentaBancaria.transferirValoresPorFormaPago(p_BankStatement_ID, p_Description,
                    p_C_BPartner_ID, p_StatementDate, p_DateAcct, getCtx(), get_TrxName());
        else
            m_transferred = TransaccionCuentaBancaria.transferirMovimientosEntreCuentas(p_BankStatement_ID,
                    p_From_C_BankAccount_ID, p_Description, p_C_BPartner_ID, p_StatementDate,
                    p_DateAcct, getCtx(), get_TrxName());

        return "@Se transfirieron@ " + m_transferred + " líneas.";
    } // doIt

    /**
     * Retrieves untransferred lines from a given drawer (bank account)
     *
     * @param drawer bank account
     */
    private List<MBankStatementLine> getLines(final MBankAccount drawer)
    {
        final String sql =
                "SELECT L.* " +
                "  FROM C_BankStatementLine L" +
                "  JOIN C_BankStatement S ON S.C_BankStatement_ID=L.C_BankStatement_ID" +
                " WHERE L.AD_Client_ID=? " +
                "   AND L.AD_Org_ID=? " +
                "   AND L.IsActive='Y' " +
                "   AND S.C_BankAccount_ID=? " +
                "   AND L.IsTransferred='N'";

        final List<MBankStatementLine> list = new ArrayList<MBankStatementLine>();
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            pstmt = DB.prepareStatement(sql, get_TrxName());
            pstmt.setInt(1, drawer.getAD_Client_ID());
            pstmt.setInt(2, drawer.getAD_Org_ID());
            pstmt.setInt(3, drawer.getC_BankAccount_ID());
            rs = pstmt.executeQuery();
            while (rs.next()) {
                list.add(new MBankStatementLine(getCtx(), rs, get_TrxName()));
            }
        } catch (Exception e) {
            log.log(Level.SEVERE, sql, e);
        } finally {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }
        return list;
    } // getStatementsIDs

} // DrawerTransfer
