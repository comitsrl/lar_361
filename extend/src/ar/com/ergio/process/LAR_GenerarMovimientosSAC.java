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

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;

import org.compiere.model.I_C_UserRemuneration;
import org.compiere.model.MSysConfig;
import org.compiere.model.MUser;
import org.compiere.model.Query;
import org.compiere.model.X_C_Remuneration;
import org.compiere.model.X_C_UserRemuneration;
import org.compiere.process.SvrProcess;
import org.compiere.util.AdempiereUserError;
import org.compiere.util.DB;
import org.compiere.util.Env;

import ar.com.ergio.model.MLARRegistroRemuneraciones;

/**
 * Generación movimientos SAC
 *
 *  @author mzuniga Marcos Zúñiga - http://www.comit.com.ar
 *
 */
public class LAR_GenerarMovimientosSAC extends SvrProcess
{
    /** The Record                      */
    private int     p_Record_ID = 0;

    @Override
    protected void prepare()
    {
        // Recuperar el registro actual
        p_Record_ID = getRecord_ID();

    }

    @Override
    protected String doIt() throws Exception
    {

        final int remuneracion_SAC = MSysConfig.getIntValue("LAR_SAC_C_Remuneration_ID", 0,
                Env.getAD_Client_ID(getCtx()));
        // Obtener Tipo de Remuneración y período
        int c_RemunerationID = p_Record_ID;
        X_C_Remuneration remuneration = new X_C_Remuneration(getCtx(), c_RemunerationID, get_TrxName());
        int c_periodID = remuneration.get_ValueAsInt("C_Period_ID");

        if (c_periodID == 0)
            throw new AdempiereUserError("Ingresar un per\u00edodo para registrar los movimientos");

        // Obtener las remuneraciones para cada empleado según el tipo de remuneración
        X_C_UserRemuneration[] sueldos = recuperarSueldos("");

        // Recorrer las remuneraciones de los empleados
        for (int x = 0; x < sueldos.length; x++)
        {
            X_C_UserRemuneration sueldoEmp = sueldos[x];
            int userID = sueldoEmp.getAD_User_ID();
            MUser empleado = new MUser(getCtx(), userID, get_TrxName());

            MLARRegistroRemuneraciones movSAC = new MLARRegistroRemuneraciones(getCtx(), 0, get_TrxName());
            movSAC.setC_Remuneration_ID(remuneracion_SAC);
            movSAC.setC_Period_ID(c_periodID);
            movSAC.setImporte(sueldoEmp.getGrossRAmt().divide(new BigDecimal(2), RoundingMode.HALF_UP));
            movSAC.setC_BPartner_ID(empleado.getC_BPartner_ID());
            movSAC.setDescription("SAC");
            movSAC.setProcessed(true);

            if (!movSAC.save(get_TrxName()))
                throw new AdempiereUserError("No fue posible guardar el movimiento SAC: " + empleado.getName());

            BigDecimal totalRAmt = (BigDecimal) sueldoEmp.get_Value("TotalRAmt");
            boolean hayDiff = (totalRAmt != BigDecimal.ZERO
                    && (totalRAmt.subtract(sueldoEmp.getGrossRAmt()).compareTo(BigDecimal.ZERO) >= 0));

            if (hayDiff)
            {
                MLARRegistroRemuneraciones movDiffSAC = new MLARRegistroRemuneraciones(getCtx(), 0, get_TrxName());
                final int remuneracion_SACDiff = MSysConfig.getIntValue("LAR_DiffSAC_C_Remuneration_ID", 0,
                        Env.getAD_Client_ID(getCtx()));
                movDiffSAC.setC_Remuneration_ID(remuneracion_SACDiff);
                movDiffSAC.setC_Period_ID(c_periodID);
                movDiffSAC.setImporte(
                        totalRAmt.subtract(sueldoEmp.getGrossRAmt()).divide(new BigDecimal(2), RoundingMode.HALF_UP));
                movDiffSAC.setC_BPartner_ID(empleado.getC_BPartner_ID());
                movDiffSAC.setDescription("Diferencia SAC");
                movDiffSAC.setProcessed(true);

                if (!movDiffSAC.save(get_TrxName()))
                    throw new AdempiereUserError(
                            "No fue posible guardar el movimiento por diferencia SAC: " + empleado.getName());
            }

        } // Recorrer las remuneraciones de los empleados

        return "Movimientos generados: " + sueldos.length;
    } // doIt

    /**
     * Obtener Remuneraciones Empleado
     * 
     * @param whereClause
     *        optional where clause
     * @return User Remuneration
     */
    public X_C_UserRemuneration[] recuperarSueldos(String whereClause)
    {
        String sql = "SELECT DISTINCT(AD_User_ID)" + " FROM C_UserRemuneration ur"
                + " WHERE ur.IsActive = 'Y'" + " AND C_Remuneration_ID =?";

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try
        {
            pstmt = DB.prepareStatement(sql, get_TrxName());
            pstmt.setInt(1, p_Record_ID);
            rs = pstmt.executeQuery();

            String orderClause = " ORDER BY ValidFrom DESC";
            List<X_C_UserRemuneration> list = new ArrayList<>();
            while (rs.next())
            {
                String localWhereClause = I_C_UserRemuneration.COLUMNNAME_C_Remuneration_ID + "=? "
                        + "AND AD_User_ID=? " + "AND ValidFrom <= Now()";
                if (whereClause != null)
                    localWhereClause += " " + whereClause;
                list.add(new Query(getCtx(), I_C_UserRemuneration.Table_Name, localWhereClause,
                        get_TrxName()).setParameters(p_Record_ID, rs.getInt("AD_User_ID")).setOnlyActiveRecords(true)
                                .setOrderBy(orderClause).first());
            }
            X_C_UserRemuneration[] pp = new X_C_UserRemuneration[list.size()];
            list.toArray(pp);
            return pp;
        } catch (Exception e)
        {
            log.log(Level.SEVERE, sql, e);
            return null;
        } finally
        {
            DB.close(rs, pstmt);
            rs = null;
            pstmt = null;
        }
    } // recuperarSueldos

} // LAR_GenerarMovimientosSueldos
