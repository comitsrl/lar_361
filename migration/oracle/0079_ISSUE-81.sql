ALTER TABLE C_PaymentAllocate ADD COLUMN C_InvoicePaySchedule_ID numeric(10,0);

ALTER TABLE C_PaymentAllocate ADD CONSTRAINT cinvoicepayschedule_cpaymentallocate FOREIGN KEY (C_InvoicePaySchedule_ID)
      REFERENCES C_InvoicePaySchedule (C_InvoicePaySchedule_ID) MATCH SIMPLE;


CREATE OR REPLACE FUNCTION invoicediscount(
    p_c_invoice_id numeric,
    p_paydate timestamp with time zone,
    p_c_invoicepayschedule_id numeric)
  RETURNS numeric AS
$BODY$
/*************************************************************************
 * The contents of this file are subject to the Compiere License.  You may
 * obtain a copy of the License at    http://www.compiere.org/license.html
 * Software is on an  "AS IS" basis,  WITHOUT WARRANTY OF ANY KIND, either
 * express or implied. See the License for details. Code: Compiere ERP+CRM
 * Copyright (C) 1999-2001 Jorg Janke, ComPiere, Inc. All Rights Reserved.
 *
 * converted to postgreSQL by Karsten Thiemann (Schaeffer AG), 
 * kthiemann@adempiere.org
 *************************************************************************
 ***
 * Title:	Calculate Payment Discount Amount
 * Description:
 *			- Calculate discountable amount (i.e. with or without tax)
 *			- Calculate and return payment discount
 * Test:
 * 		select invoiceDiscount(109, now(), 103) from ad_system; => 0
 ************************************************************************/
DECLARE
	v_Amount		NUMERIC;
	v_IsDiscountLineAmt	CHAR(1);
	v_GrandTotal		NUMERIC;
	v_TotalLines		NUMERIC;
	v_C_PaymentTerm_ID	NUMERIC(10);
	v_DocDate		timestamp with time zone;
	v_PayDate		timestamp with time zone := now();
    	v_IsPayScheduleValid    CHAR(1);

BEGIN
	SELECT 	ci.IsDiscountLineAmt, i.GrandTotal, i.TotalLines,
		i.C_PaymentTerm_ID, i.DateInvoiced, i.IsPayScheduleValid
	INTO 	v_IsDiscountLineAmt, v_GrandTotal, v_TotalLines,
		v_C_PaymentTerm_ID, v_DocDate, v_IsPayScheduleValid
	FROM 	AD_ClientInfo ci, C_Invoice i
	WHERE 	ci.AD_Client_ID=i.AD_Client_ID
	  AND 	i.C_Invoice_ID=p_C_Invoice_ID;
	  
	--	What Amount is the Discount Base?
 	IF (v_IsDiscountLineAmt = 'Y') THEN
		v_Amount := v_TotalLines;
	ELSE
		v_Amount := v_GrandTotal;
	END IF;

	--	Anything to discount?
	IF (v_Amount = 0) THEN
		RETURN 0;
   	END IF;
	IF (p_PayDate IS NOT NULL) THEN
		v_PayDate := p_PayDate;
  	END IF;

    --  Valid Payment Schedule
    IF (v_IsPayScheduleValid='Y' AND p_C_InvoicePaySchedule_ID > 0) THEN
        SELECT COALESCE(MAX(DiscountAmt),0)
          INTO v_Amount
        FROM C_InvoicePaySchedule
        WHERE C_InvoicePaySchedule_ID=p_C_InvoicePaySchedule_ID
          AND DiscountDate <= v_PayDate
          AND DueDate >= v_PayDate;
        --
        RETURN v_Amount;
    END IF;

	--	return discount amount	
	RETURN paymentTermDiscount (v_Amount, 0, v_C_PaymentTerm_ID, v_DocDate, p_PayDate);

--	Most likely if invoice not found
EXCEPTION
	WHEN OTHERS THEN
		RETURN NULL;
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION invoicediscount(numeric, timestamp with time zone, numeric)
  OWNER TO adempiere;
  

-- 28/10/2016 4:57:41 ART
-- ISSUE #81: Aplicar Regimen de Retenciones.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001896,812,'LAR',0,'N','N','N','The Invoice Payment Schedule determines when partial payments are due.','N',10,'N',19,'N',1995,'N','Y','N','Invoice Payment Schedule','Invoice Payment Schedule','C_InvoicePaySchedule_ID',100,TO_DATE('2016-10-28 04:57:40','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-10-28 04:57:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/10/2016 4:57:41 ART
-- ISSUE #81: Aplicar Regimen de Retenciones.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001896 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/10/2016 4:58:12 ART
-- ISSUE #81: Aplicar Regimen de Retenciones.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002971,10,'Y','N','N',3001896,'N','Y',3000045,'N','The Invoice Payment Schedule determines when partial payments are due.','LAR','Invoice Payment Schedule','Invoice Payment Schedule',100,0,'Y',TO_DATE('2016-10-28 04:58:11','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-10-28 04:58:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/10/2016 4:58:12 ART
-- ISSUE #81: Aplicar Regimen de Retenciones.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002971 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/10/2016 4:58:19 ART
-- ISSUE #81: Aplicar Regimen de Retenciones.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002971
;

-- Registración de script
SELECT register_migration_script_lar('0079_ISSUE-81.sql', 'LAR', '') FROM dual
;
