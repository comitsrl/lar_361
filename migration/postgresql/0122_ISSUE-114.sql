CREATE OR REPLACE FUNCTION LARCurrencyBase(
    p_Amount numeric,
    p_CurFrom_ID numeric,
    p_ConversionType_ID numeric,
    p_ConvDate timestamp with time zone,
    p_Client_ID numeric,
    p_Org_ID numeric)
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
 * 
 ***
 * Title:	Convert Amount to Base Currency of Client
 * Description:
 *		Get CurrencyTo from Client
 *		Returns NULL, if conversion not found
 *		Standard Rounding
 * Test:
 *		SELECT currencyBase(100,116,null,11,null) FROM AD_System; => 64.72
 ************************************************************************/
DECLARE
	v_CurTo_ID	NUMERIC;
BEGIN
	--	Get Currency
	SELECT	MAX(ac.C_Currency_ID)
	  INTO	v_CurTo_ID
	FROM	AD_ClientInfo ci, C_AcctSchema ac
	WHERE	ci.C_AcctSchema1_ID=ac.C_AcctSchema_ID
	  AND	ci.AD_Client_ID=p_Client_ID;
	--	Same as Currency_Conversion - if currency/rate not found - return 0
	IF (v_CurTo_ID IS NULL) THEN
		RETURN NULL;
	END IF;
	--	Same currency
	IF (p_CurFrom_ID = v_CurTo_ID) THEN
		RETURN p_Amount;
	END IF;

	RETURN currencyConvert (p_Amount, p_CurFrom_ID, v_CurTo_ID, p_ConvDate, p_ConversionType_ID, p_Client_ID, p_Org_ID);
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION LARCurrencyBase(numeric, numeric, numeric, timestamp with time zone, numeric, numeric)
  OWNER TO adempiere;

-- 28/11/2018 15:51:40 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='(CurrencyRate (100, 118, LAR_PaymentHeader.DateTrx, (SELECT bp.C_ConversionType_ID FROM C_BPartner bp WHERE bp.C_BPartner_ID = LAR_PaymentHeader.C_BPartner_ID), LAR_PaymentHeader.AD_Client_ID, LAR_PaymentHeader.AD_Org_ID))', IsMandatory='N', IsUpdateable='N', IsAllowCopy='N',Updated=TO_TIMESTAMP('2018-11-28 15:51:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003028
;

-- 28/11/2018 16:08:06 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET Name='Diferencia de Valoración', ColumnName='DiferenciaValoracion',Updated=TO_TIMESTAMP('2018-11-28 16:08:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003029
;

-- 28/11/2018 16:08:06 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003029
;

-- 28/11/2018 16:08:06 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Diferencia de Valoración', Description=NULL, Help=NULL WHERE AD_Column_ID=3003029 AND IsCentrallyMaintained='Y'
;

-- 28/11/2018 16:08:45 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Diferencia de Valoración',Updated=TO_TIMESTAMP('2018-11-28 16:08:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003029 AND AD_Language='es_AR'
;

-- 28/11/2018 16:09:03 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='DiferenciaValoracion', Name='Diferencia de Valoración', PrintName='Diferencia de Valoración',Updated=TO_TIMESTAMP('2018-11-28 16:09:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000900
;

-- 28/11/2018 16:09:03 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000900
;

-- 28/11/2018 16:09:03 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='DiferenciaValoracion', Name='Diferencia de Valoración', Description=NULL, Help=NULL WHERE AD_Element_ID=3000900
;

-- 28/11/2018 16:09:03 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='DiferenciaValoracion', Name='Diferencia de Valoración', Description=NULL, Help=NULL, AD_Element_ID=3000900 WHERE UPPER(ColumnName)='DIFERENCIAVALORACION' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 28/11/2018 16:09:03 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='DiferenciaValoracion', Name='Diferencia de Valoración', Description=NULL, Help=NULL WHERE AD_Element_ID=3000900 AND IsCentrallyMaintained='Y'
;

-- 28/11/2018 16:09:03 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Diferencia de Valoración', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000900) AND IsCentrallyMaintained='Y'
;

-- 28/11/2018 16:09:03 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_PrintFormatItem SET PrintName='Diferencia de Valoración', Name='Diferencia de Valoración' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000900)
;

-- 28/11/2018 16:09:12 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Diferencia de Valoración',PrintName='Diferencia de Valoración',Updated=TO_TIMESTAMP('2018-11-28 16:09:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000900 AND AD_Language='es_AR'
;

-- 28/11/2018 16:13:36 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='(CurrencyConvertRate ((SELECT COALESCE(Sum(Amount),0) FROM C_PaymentAllocate i WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = i.LAR_PaymentHeader_ID), 100, 118, CurrencyRate (100, 118, LAR_PaymentHeader.DateTrx, (SELECT bp.C_ConversionType_ID FROM C_BPartner bp WHERE bp.C_BPartner_ID = LAR_PaymentHeader.C_BPartner_ID), LAR_PaymentHeader.AD_Client_ID, LAR_PaymentHeader.AD_Org_ID)) - CurrencyConvertRate ((SELECT COALESCE(Sum(Amount),0) FROM C_PaymentAllocate i WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = i.LAR_PaymentHeader_ID), 100, 118, LAR_PaymentHeader.TasaCambio))',Updated=TO_TIMESTAMP('2018-11-28 16:13:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003029
;

-- 28/11/2018 16:14:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='(CurrencyConvertRate ((SELECT COALESCE(Sum(Amount),0) FROM C_PaymentAllocate i WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = i.LAR_PaymentHeader_ID), 100, 118, CurrencyRate (100, 118, LAR_PaymentHeader.DateTrx, (SELECT bp.C_ConversionType_ID FROM C_BPartner bp WHERE bp.C_BPartner_ID = LAR_PaymentHeader.C_BPartner_ID), LAR_PaymentHeader.AD_Client_ID, LAR_PaymentHeader.AD_Org_ID)) - CurrencyConvertRate ((SELECT COALESCE(Sum(Amount),0) FROM C_PaymentAllocate i WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = i.LAR_PaymentHeader_ID), 100, 118, LAR_PaymentHeader.TasaDeCambio))',Updated=TO_TIMESTAMP('2018-11-28 16:14:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003029
;

-- 28/11/2018 16:25:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000981,'%DiferenciaValoracion','LAR','% Dif. de Valoración','% Dif. de Valoración',0,TO_TIMESTAMP('2018-11-28 16:25:31','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2018-11-28 16:25:31','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 28/11/2018 16:25:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000981 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 28/11/2018 16:26:40 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('((CurrencyRate (100, 118, LAR_PaymentHeader.DateTrx, (SELECT bp.C_ConversionType_ID FROM C_BPartner bp WHERE bp.C_BPartner_ID = LAR_PaymentHeader.C_BPartner_ID), LAR_PaymentHeader.AD_Client_ID, LAR_PaymentHeader.AD_Org_ID) - LAR_PaymentHeader.TasaDeCambio) * 100 / LAR_PaymentHeader.TasaDeCambio)',3003363,3000010,'LAR',0,'N','N','N',0,'N',10,'N',37,'N','N',3000981,'N','Y','N','N','N','% Dif. de Valoración','%DiferenciaValoracion','N',100,TO_TIMESTAMP('2018-11-28 16:26:40','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2018-11-28 16:26:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/11/2018 16:26:40 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003363 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/11/2018 16:27:36 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006245,10,'Y','N','N',3003363,'N','Y',3000012,'N','LAR','% Dif. de Valoración',100,0,TO_TIMESTAMP('2018-11-28 16:27:36','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-11-28 16:27:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/11/2018 16:27:36 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006245 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/11/2018 16:27:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3006245
;

-- 28/11/2018 16:27:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000269
;

-- 28/11/2018 16:28:02 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2018-11-28 16:28:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006245
;

-- 28/11/2018 16:34:59 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='DiferenciaValoracion %', Name='Dif. de Valoración %', PrintName='Dif. de Valoración %',Updated=TO_TIMESTAMP('2018-11-28 16:34:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000981
;

-- 28/11/2018 16:34:59 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000981
;

-- 28/11/2018 16:34:59 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='DiferenciaValoracion %', Name='Dif. de Valoración %', Description=NULL, Help=NULL WHERE AD_Element_ID=3000981
;

-- 28/11/2018 16:34:59 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='DiferenciaValoracion %', Name='Dif. de Valoración %', Description=NULL, Help=NULL, AD_Element_ID=3000981 WHERE UPPER(ColumnName)='DIFERENCIAVALORACION %' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 28/11/2018 16:34:59 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='DiferenciaValoracion %', Name='Dif. de Valoración %', Description=NULL, Help=NULL WHERE AD_Element_ID=3000981 AND IsCentrallyMaintained='Y'
;

-- 28/11/2018 16:34:59 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Dif. de Valoración %', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000981) AND IsCentrallyMaintained='Y'
;

-- 28/11/2018 16:34:59 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_PrintFormatItem SET PrintName='Dif. de Valoración %', Name='Dif. de Valoración %' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000981)
;

-- 28/11/2018 16:35:08 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Dif. de Valoración %',PrintName='Dif. de Valoración %',Updated=TO_TIMESTAMP('2018-11-28 16:35:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000981 AND AD_Language='es_AR'
;

-- 28/11/2018 16:51:02 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Dif. de Valoración %',Updated=TO_TIMESTAMP('2018-11-28 16:51:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003363 AND AD_Language='es_AR'
;

-- 29/11/2018 15:56:48 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='PorcDiferenciaValoracion', Name='Porc. Dif. de Valoración', PrintName='Porc. Dif. de Valoración',Updated=TO_TIMESTAMP('2018-11-29 15:56:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000981
;

-- 29/11/2018 15:56:48 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000981
;

-- 29/11/2018 15:56:48 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='PorcDiferenciaValoracion', Name='Porc. Dif. de Valoración', Description=NULL, Help=NULL WHERE AD_Element_ID=3000981
;

-- 29/11/2018 15:56:48 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='PorcDiferenciaValoracion', Name='Porc. Dif. de Valoración', Description=NULL, Help=NULL, AD_Element_ID=3000981 WHERE UPPER(ColumnName)='PORCDIFERENCIAVALORACION' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 29/11/2018 15:56:48 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='PorcDiferenciaValoracion', Name='Porc. Dif. de Valoración', Description=NULL, Help=NULL WHERE AD_Element_ID=3000981 AND IsCentrallyMaintained='Y'
;

-- 29/11/2018 15:56:48 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Porc. Dif. de Valoración', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000981) AND IsCentrallyMaintained='Y'
;

-- 29/11/2018 15:56:48 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_PrintFormatItem SET PrintName='Porc. Dif. de Valoración', Name='Porc. Dif. de Valoración' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000981)
;

-- 29/11/2018 15:56:55 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Porc. Dif. de Valoración',PrintName='Porc. Dif. de Valoración',Updated=TO_TIMESTAMP('2018-11-29 15:56:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000981 AND AD_Language='es_AR'
;

-- 29/11/2018 15:57:10 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Porc. Dif. de Valoración',Updated=TO_TIMESTAMP('2018-11-29 15:57:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003363 AND AD_Language='es_AR'
;

-- 29/11/2018 16:12:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='((CurrencyRate (100, 118, LAR_PaymentHeader.DateTrx, (SELECT bp.C_ConversionType_ID FROM C_BPartner bp WHERE bp.C_BPartner_ID = LAR_PaymentHeader.C_BPartner_ID), LAR_PaymentHeader.AD_Client_ID, LAR_PaymentHeader.AD_Org_ID) - LAR_PaymentHeader.TasaDeCambio) * 100 / COALESCE (LAR_PaymentHeader.TasaDeCambio, 100))',Updated=TO_TIMESTAMP('2018-11-29 16:12:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003363
;

-- 29/11/2018 16:43:57 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='((CurrencyRate (100, 118, LAR_PaymentHeader.DateTrx, (SELECT bp.C_ConversionType_ID FROM C_BPartner bp WHERE bp.C_BPartner_ID = LAR_PaymentHeader.C_BPartner_ID), LAR_PaymentHeader.AD_Client_ID, LAR_PaymentHeader.AD_Org_ID) - LAR_PaymentHeader.TasaDeCambio) * 100 / CASE LAR_PaymentHeader.TasaDeCambio > 0 THEN LAR_PaymentHeader.TasaCambio ELSE 100)',Updated=TO_TIMESTAMP('2018-11-29 16:43:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003363
;

-- 29/11/2018 16:48:41 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='((CurrencyRate (100, 118, LAR_PaymentHeader.DateTrx, (SELECT bp.C_ConversionType_ID FROM C_BPartner bp WHERE bp.C_BPartner_ID = LAR_PaymentHeader.C_BPartner_ID), LAR_PaymentHeader.AD_Client_ID, LAR_PaymentHeader.AD_Org_ID) - LAR_PaymentHeader.TasaDeCambio) * 100 / CASE WHEN LAR_PaymentHeader.TasaDeCambio > 0 THEN LAR_PaymentHeader.TasaCambio ELSE 100 END)',Updated=TO_TIMESTAMP('2018-11-29 16:48:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003363
;

-- 29/11/2018 16:50:02 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='((CurrencyRate (100, 118, LAR_PaymentHeader.DateTrx, (SELECT bp.C_ConversionType_ID FROM C_BPartner bp WHERE bp.C_BPartner_ID = LAR_PaymentHeader.C_BPartner_ID), LAR_PaymentHeader.AD_Client_ID, LAR_PaymentHeader.AD_Org_ID) - LAR_PaymentHeader.TasaDeCambio) * 100 / CASE WHEN LAR_PaymentHeader.TasaDeCambio > 0 THEN LAR_PaymentHeader.TasaDeCambio ELSE 100 END)',Updated=TO_TIMESTAMP('2018-11-29 16:50:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003363
;

-- 29/11/2018 16:52:26 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET IsCentrallyMaintained='N', IsReadOnly='Y',Updated=TO_TIMESTAMP('2018-11-29 16:52:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006245
;

-- 29/11/2018 16:52:29 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field_Trl SET IsTranslated='Y',Updated=TO_TIMESTAMP('2018-11-29 16:52:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006245 AND AD_Language='es_AR'
;

-- 29/11/2018 16:52:45 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2018-11-29 16:52:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005877
;

-- Se agrega columna i.TasaDeCambio.
CREATE OR REPLACE VIEW c_invoice_v AS 
 SELECT i.c_invoice_id,
    i.ad_client_id,
    i.ad_org_id,
    i.isactive,
    i.created,
    i.createdby,
    i.updated,
    i.updatedby,
    i.issotrx,
    i.documentno,
    i.docstatus,
    i.docaction,
    i.processing,
    i.processed,
    i.c_doctype_id,
    i.c_doctypetarget_id,
    i.c_order_id,
    i.description,
    i.isapproved,
    i.istransferred,
    i.salesrep_id,
    i.dateinvoiced,
    i.dateprinted,
    i.dateacct,
    i.c_bpartner_id,
    i.c_bpartner_location_id,
    i.ad_user_id,
    i.poreference,
    i.dateordered,
    i.c_currency_id,
    i.c_conversiontype_id,
    i.paymentrule,
    i.c_paymentterm_id,
    i.c_charge_id,
    i.m_pricelist_id,
    i.c_campaign_id,
    i.c_project_id,
    i.c_activity_id,
    i.isprinted,
    i.isdiscountprinted,
    i.ispaid,
    i.isindispute,
    i.ispayschedulevalid,
    NULL::numeric AS c_invoicepayschedule_id,
    i.invoicecollectiontype,
    i.dunninggrace,
        CASE
            WHEN charat(d.docbasetype::character varying, 3)::text = 'C'::text THEN i.chargeamt * (-1)::numeric
            ELSE i.chargeamt
        END AS chargeamt,
        CASE
            WHEN charat(d.docbasetype::character varying, 3)::text = 'C'::text THEN i.totallines * (-1)::numeric
            ELSE i.totallines
        END AS totallines,
        CASE
            WHEN charat(d.docbasetype::character varying, 3)::text = 'C'::text THEN i.grandtotal * (-1)::numeric
            ELSE i.grandtotal
        END AS grandtotal,
        CASE
            WHEN charat(d.docbasetype::character varying, 3)::text = 'C'::text THEN (-1.0)
            ELSE 1.0
        END AS multiplier,
        CASE
            WHEN charat(d.docbasetype::character varying, 2)::text = 'P'::text THEN (-1.0)
            ELSE 1.0
        END AS multiplierap,
    d.docbasetype,
    paymenttermduedate(i.c_paymentterm_id, i.dateinvoiced::timestamp with time zone) AS duedate,
    i.TasaDeCambio
   FROM c_invoice i
     JOIN c_doctype d ON i.c_doctype_id = d.c_doctype_id
  WHERE i.ispayschedulevalid <> 'Y'::bpchar
UNION
 SELECT i.c_invoice_id,
    i.ad_client_id,
    i.ad_org_id,
    i.isactive,
    i.created,
    i.createdby,
    i.updated,
    i.updatedby,
    i.issotrx,
    i.documentno,
    i.docstatus,
    i.docaction,
    i.processing,
    i.processed,
    i.c_doctype_id,
    i.c_doctypetarget_id,
    i.c_order_id,
    i.description,
    i.isapproved,
    i.istransferred,
    i.salesrep_id,
    i.dateinvoiced,
    i.dateprinted,
    i.dateacct,
    i.c_bpartner_id,
    i.c_bpartner_location_id,
    i.ad_user_id,
    i.poreference,
    i.dateordered,
    i.c_currency_id,
    i.c_conversiontype_id,
    i.paymentrule,
    i.c_paymentterm_id,
    i.c_charge_id,
    i.m_pricelist_id,
    i.c_campaign_id,
    i.c_project_id,
    i.c_activity_id,
    i.isprinted,
    i.isdiscountprinted,
    i.ispaid,
    i.isindispute,
    i.ispayschedulevalid,
    ips.c_invoicepayschedule_id,
    i.invoicecollectiontype,
    i.dunninggrace,
    NULL::numeric AS chargeamt,
    NULL::numeric AS totallines,
        CASE
            WHEN charat(d.docbasetype::character varying, 3)::text = 'C'::text THEN ips.dueamt * (-1)::numeric
            ELSE ips.dueamt
        END AS grandtotal,
        CASE
            WHEN charat(d.docbasetype::character varying, 3)::text = 'C'::text THEN (-1)
            ELSE 1
        END AS multiplier,
        CASE
            WHEN charat(d.docbasetype::character varying, 2)::text = 'P'::text THEN (-1)
            ELSE 1
        END AS multiplierap,
    d.docbasetype,
    ips.duedate,
    i.TasaDeCambio
   FROM c_invoice i
     JOIN c_doctype d ON i.c_doctype_id = d.c_doctype_id
     JOIN c_invoicepayschedule ips ON i.c_invoice_id = ips.c_invoice_id
  WHERE i.ispayschedulevalid = 'Y'::bpchar AND ips.isvalid = 'Y'::bpchar;

ALTER TABLE c_invoice_v
  OWNER TO adempiere;

-- 05/12/2018 18:29:21 ART
-- ISSUE #114: Venta en dolares.
INSERT INTO AD_Val_Rule (Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('S',3000066,'LAR','C_ConversionType',100,100,TO_TIMESTAMP('2018-12-05 18:29:20','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_TIMESTAMP('2018-12-05 18:29:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/12/2018 18:30:51 ART
-- ISSUE #114: Venta en dolares.
UPDATE AD_Val_Rule SET Code='IsDefault = ''N''',Updated=TO_TIMESTAMP('2018-12-05 18:30:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000066
;

-- 05/12/2018 18:35:20 ART
-- ISSUE #114: Venta en dolares.
UPDATE AD_Column SET AD_Val_Rule_ID=3000066,Updated=TO_TIMESTAMP('2018-12-05 18:35:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002966
;

-- Registración de script
SELECT register_migration_script_lar('0122_ISSUE-114.sql', 'LAR', '')
;
