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

import org.compiere.model.MBPartner;
import org.compiere.model.MClient;
import org.compiere.model.ModelValidationEngine;
import org.compiere.model.ModelValidator;
import org.compiere.model.PO;
import org.compiere.util.CLogger;

/**
 * Validador de Localización Argentina, que solo se encargara monitoriar el Modelo de clase MBPartner.
 *
 * @author fchiappano - www.comit.com.ar
 */
public class LAR_ValidatorSdN implements ModelValidator
{
    /**
     * Constructor. The class is instantiated when logging in and client is
     * selected/known
     */
    public LAR_ValidatorSdN()
    {
        super();
    } // LAR_ValidatorSdN

    /** Logger          */
    private static CLogger log = CLogger.getCLogger(LAR_ValidatorSdN.class);
    /** Client          */
    private int     m_AD_Client_ID = -1;

    @Override
    public void initialize(ModelValidationEngine engine, MClient client)
    {
        if (client != null)
        {
            m_AD_Client_ID = client.getAD_Client_ID();
            log.info(client.toString());
        }

        engine.addModelChange(MBPartner.Table_Name, this);
    } // initialize

    @Override
    public int getAD_Client_ID()
    {
        return m_AD_Client_ID;
    } // getAD_Client_ID

    @Override
    public String login(int AD_Org_ID, int AD_Role_ID, int AD_User_ID)
    {
        log.info("AD_User_ID=" + AD_User_ID);
        return null;
    } // login

    @Override
    public String modelChange(PO po, int type) throws Exception
    {
        if (type == TYPE_BEFORE_CHANGE || type == TYPE_BEFORE_NEW)
        {
            MBPartner bpartner = (MBPartner) po;

            if (bpartner.get_ValueAsInt("LAR_CategoriaCredito_ID") > 0)
            {
                MLARCategoriaCredito catCredito = new MLARCategoriaCredito(bpartner.getCtx(),
                        bpartner.get_ValueAsInt("LAR_CategoriaCredito_ID"), bpartner.get_TrxName());
                bpartner.setSO_CreditLimit(catCredito.getSO_CreditLimit());
            }
        }

        return null;
    }

    @Override
    public String docValidate(PO po, int timing)
    {
        return null;
    }

} // LAR_ValidatorSdN
