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

package ar.com.ergio.model;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.util.Properties;

public class MLARLoteSueldosLine extends X_LAR_LoteSueldosLine {
    private static final long serialVersionUID = 1L;

    public MLARLoteSueldosLine(Properties ctx, int LAR_LoteSueldosLine_ID, String trxName) {
        super(ctx, LAR_LoteSueldosLine_ID, trxName);
    }

    public MLARLoteSueldosLine(Properties ctx, ResultSet rs, String trxName) {
        super(ctx, rs, trxName);
    }

    // --- Getters and Setters for all columns in LAR_LoteSueldosLine ---

    public int getC_BankAccount_ID() {
        return super.getC_BankAccount_ID();
    }
    public void setC_BankAccount_ID(int C_BankAccount_ID) {
        super.setC_BankAccount_ID(C_BankAccount_ID);
    }

    public int getC_BPartner_ID() {
        return super.getC_BPartner_ID();
    }
    public void setC_BPartner_ID(int C_BPartner_ID) {
        super.setC_BPartner_ID(C_BPartner_ID);
    }

    public int getC_Remuneration_ID() {
        return super.getC_Remuneration_ID();
    }
    public void setC_Remuneration_ID(int C_Remuneration_ID) {
        super.setC_Remuneration_ID(C_Remuneration_ID);
    }

    public String getDescription() {
        return super.getDescription();
    }
    public void setDescription(String Description) {
        super.setDescription(Description);
    }

    public BigDecimal getImporteMiles() {
        return super.getImporteMiles();
    }
    public void setImporteMiles(BigDecimal ImporteMiles) {
        super.setImporteMiles(ImporteMiles);
    }

    public BigDecimal getImportePpal() {
        return super.getImportePpal();
    }
    public void setImportePpal(BigDecimal ImportePpal) {
        super.setImportePpal(ImportePpal);
    }

    public int getLAR_Deposito_Directo_ID() {
        return super.getLAR_Deposito_Directo_ID();
    }
    public void setLAR_Deposito_Directo_ID(int LAR_Deposito_Directo_ID) {
        super.setLAR_Deposito_Directo_ID(LAR_Deposito_Directo_ID);
    }

    public int getLAR_LoteSueldos_ID() {
        return super.getLAR_LoteSueldos_ID();
    }
    public void setLAR_LoteSueldos_ID(int LAR_LoteSueldos_ID) {
        super.setLAR_LoteSueldos_ID(LAR_LoteSueldos_ID);
    }

    public int getLAR_LoteSueldosLine_ID() {
        return super.getLAR_LoteSueldosLine_ID();
    }
    public void setLAR_LoteSueldosLine_ID(int LAR_LoteSueldosLine_ID) {
        super.setLAR_LoteSueldosLine_ID(LAR_LoteSueldosLine_ID);
    }

    public int getLAR_PaymentHeader_ID() {
        return super.getLAR_PaymentHeader_ID();
    }
    public void setLAR_PaymentHeader_ID(int LAR_PaymentHeader_ID) {
        super.setLAR_PaymentHeader_ID(LAR_PaymentHeader_ID);
    }

    public int getLar_PaymentHeaderMiles_ID() {
        return super.getLar_PaymentHeaderMiles_ID();
    }
    public void setLar_PaymentHeaderMiles_ID(int Lar_PaymentHeaderMiles_ID) {
        super.setLar_PaymentHeaderMiles_ID(Lar_PaymentHeaderMiles_ID);
    }

    public String getTenderType() {
        return super.getTenderType();
    }
    public void setTenderType(String TenderType) {
        super.setTenderType(TenderType);
    }

    public String getTenderTypeMiles() {
        return super.getTenderTypeMiles();
    }
    public void setTenderTypeMiles(String TenderTypeMiles) {
        super.setTenderTypeMiles(TenderTypeMiles);
    }

    // --- getAmount() implementation ---
    @Override
    public BigDecimal getAmount() {
        // Suma de ImportePpal + ImporteMiles (ajusta según tu lógica)
        BigDecimal ppal = getImportePpal();
        BigDecimal miles = getImporteMiles();
        if (ppal == null) ppal = BigDecimal.ZERO;
        if (miles == null) miles = BigDecimal.ZERO;
        return ppal.add(miles);
    }
}