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
package ar.com.ergio.print.fiscal.document;

import java.io.Serializable;
import java.math.BigDecimal;

/**
 * Class that represent a perception line.
 * 
 * @author Emiliano Pereyra - http://www.ergio.com.ar
 * 
 */
public final class PerceptionLine implements Serializable
{
    private static final long serialVersionUID = 1638571380448887794L;
    private String description;
    private BigDecimal amt;
    private BigDecimal taxRate;

    /**
     * Creates an inmutable perception line
     * 
     * @param description
     * @param amt
     * @param taxRate
     */
    public PerceptionLine(String description, BigDecimal amt, BigDecimal taxRate)
    {
        super();
        this.description = description;
        this.amt = amt;
        this.taxRate = taxRate;
    }

    /**
     * Returns perception description
     */
    public String getDescription()
    {
        return description;
    }

    /**
     * Returns perception amount
     */
    public BigDecimal getAmt()
    {
        return amt;
    }

    /**
     * Returns perception tax rate 
     */
    public BigDecimal getTaxRate()
    {
        return taxRate;
    }
}
