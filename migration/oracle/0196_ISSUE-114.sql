ALTER TABLE LAR_PaymentHeader ADD COLUMN C_Currency_ID numeric(10,0);
ALTER TABLE LAR_PaymentHeader ADD CONSTRAINT ccurrency_payheader FOREIGN KEY (C_Currency_ID)
      REFERENCES C_Currency (C_Currency_ID) MATCH SIMPLE;

ALTER TABLE LAR_PaymentHeader ADD COLUMN C_CurrencyTo_ID numeric(10,0);
ALTER TABLE LAR_PaymentHeader ADD CONSTRAINT ccurrencyto_payheader FOREIGN KEY (C_CurrencyTo_ID)
      REFERENCES C_Currency (C_Currency_ID) MATCH SIMPLE;

CREATE OR REPLACE FUNCTION currencyconvertratediv(
    p_amount numeric,
    p_curfrom_id numeric,
    p_curto_id numeric,
    p_rate numeric)
  RETURNS numeric AS
$BODY$	

BEGIN
	        --	Return Amount
		IF (p_Amount = 0 OR p_Rate = 0 OR p_CurFrom_ID = p_CurTo_ID) THEN
			RETURN p_Amount;
		END IF;
		--	Return NULL
		IF (p_Amount IS NULL OR p_Rate IS NULL OR p_CurFrom_ID IS NULL OR p_CurTo_ID IS NULL) THEN
			RETURN NULL;
		END IF;

		-- Standart Precision
		RETURN currencyRound(p_Amount / p_Rate, p_CurTo_ID, 'N');
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION currencyconvertratediv(numeric, numeric, numeric, numeric)
  OWNER TO adempiere;

-- 29/09/2021 13:16:59 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004301,3000010,'LAR',0,'N','N','N','Indicates the Currency to be used when processing or reporting on this record','N',10,'N',19,'N',193,'N','Y','N','The Currency for this record','Currency','C_Currency_ID',TO_DATE('2021-09-29 13:16:58','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-09-29 13:16:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/09/2021 13:16:59 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004301 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 29/09/2021 13:16:59 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001198,'c_currencyto_id','LAR','c_currencyto_id','c_currencyto_id',0,TO_DATE('2021-09-29 13:16:59','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-09-29 13:16:59','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 29/09/2021 13:16:59 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001198 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 29/09/2021 13:17:00 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004302,3000010,'LAR',0,'N','N','N','N',10,'N',19,'N',3001198,'N','Y','N','c_currencyto_id','c_currencyto_id',TO_DATE('2021-09-29 13:16:59','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-09-29 13:16:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/09/2021 13:17:00 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004302 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 29/09/2021 13:19:38 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000134,'T','LAR','N','C_Currency Monedas',0,0,100,TO_DATE('2021-09-29 13:19:38','YYYY-MM-DD HH24:MI:SS'),'Y',TO_DATE('2021-09-29 13:19:38','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/09/2021 13:19:38 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000134 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 29/09/2021 13:21:52 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Ref_Table (IsValueDisplayed,WhereClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Updated,Created,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N','IsActive = ''Y''',141,3000134,457,458,'LAR',100,TO_DATE('2021-09-29 13:21:52','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-09-29 13:21:52','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 29/09/2021 13:22:20 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Column SET AD_Reference_Value_ID=3000134, AD_Reference_ID=18, Name='Moneda de Factura', ColumnName='C_CurrencyTo_ID',Updated=TO_DATE('2021-09-29 13:22:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004302
;

-- 29/09/2021 13:22:20 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3004302
;

-- 29/09/2021 13:22:20 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET Name='Moneda de Factura', Description=NULL, Help=NULL WHERE AD_Column_ID=3004302 AND IsCentrallyMaintained='Y'
;

-- 29/09/2021 13:22:36 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Column_Trl SET Name='Moneda de Factura',Updated=TO_DATE('2021-09-29 13:22:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004302 AND AD_Language='es_AR'
;

-- 29/09/2021 13:22:58 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Element SET ColumnName='C_CurrencyTo_ID', Name='Moneda de Factura', PrintName='Moneda de Factura',Updated=TO_DATE('2021-09-29 13:22:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001198
;

-- 29/09/2021 13:22:58 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001198
;

-- 29/09/2021 13:22:58 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Column SET ColumnName='C_CurrencyTo_ID', Name='Moneda de Factura', Description=NULL, Help=NULL WHERE AD_Element_ID=3001198
;

-- 29/09/2021 13:22:58 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Process_Para SET ColumnName='C_CurrencyTo_ID', Name='Moneda de Factura', Description=NULL, Help=NULL, AD_Element_ID=3001198 WHERE UPPER(ColumnName)='C_CURRENCYTO_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 29/09/2021 13:22:58 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Process_Para SET ColumnName='C_CurrencyTo_ID', Name='Moneda de Factura', Description=NULL, Help=NULL WHERE AD_Element_ID=3001198 AND IsCentrallyMaintained='Y'
;

-- 29/09/2021 13:22:58 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET Name='Moneda de Factura', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001198) AND IsCentrallyMaintained='Y'
;

-- 29/09/2021 13:22:58 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_PrintFormatItem pi SET PrintName='Moneda de Factura', Name='Moneda de Factura' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001198)
;

-- 29/09/2021 13:23:04 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Element_Trl SET Name='Moneda de Factura',PrintName='Moneda de Factura',Updated=TO_DATE('2021-09-29 13:23:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001198 AND AD_Language='es_AR'
;

-- 29/09/2021 13:25:29 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Column SET DefaultValue='118',Updated=TO_DATE('2021-09-29 13:25:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004301
;

-- 29/09/2021 14:24:27 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Column SET ColumnSQL='(CurrencyConvertRate ((SELECT COALESCE(Sum(Amount),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID), 100, 118, LAR_PaymentHeader.TasaDelDia) - CurrencyConvertRate ((SELECT COALESCE(Sum(Amount),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID), 100, 118, LAR_PaymentHeader.TasaDeCambio))',Updated=TO_DATE('2021-09-29 14:24:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003029
;

-- 29/09/2021 14:26:35 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001199,'DiferenciaValoracionExt','LAR','Diferencia de Valoración Ext.','Diferencia de Valoración Ext.',0,TO_DATE('2021-09-29 14:26:34','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-09-29 14:26:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 29/09/2021 14:26:35 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001199 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 29/09/2021 14:31:03 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(CurrencyConvertRate ((SELECT COALESCE(Sum(Amount),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID), 118, 100, LAR_PaymentHeader.TasaDelDia) - CurrencyConvertRate ((SELECT COALESCE(Sum(Amount),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID), 118, 100, LAR_PaymentHeader.TasaDeCambio))',3004304,3000010,'U',0,'N','N','N',0,'N',30,'N',37,'N','N',3001199,'N','Y','N','N','N','Diferencia de Valoración Ext.','DiferenciaValoracionExt','N',TO_DATE('2021-09-29 14:31:03','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-09-29 14:31:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/09/2021 14:31:03 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004304 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 29/09/2021 14:34:25 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Column SET ColumnSQL='((SELECT COALESCE(Sum(Amount),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID) - (SELECT COALESCE(Sum(Amount),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID))',Updated=TO_DATE('2021-09-29 14:34:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003029
;

-- 29/09/2021 15:02:41 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001200,'PagadoTasaFactura','LAR','Pagado en Tasa de Factura','Pagado en Tasa de Factura',0,TO_DATE('2021-09-29 15:02:40','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-09-29 15:02:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 29/09/2021 15:02:41 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001200 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 29/09/2021 15:03:01 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('((SELECT COALESCE(Sum(Amount),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID) - (SELECT COALESCE(Sum(Amount),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID))',3004305,3000010,'U',0,'N','N','N',0,'N',30,'N',37,'N','N',3001200,'N','Y','N','N','N','Pagado en Tasa de Factura','PagadoTasaFactura','N',TO_DATE('2021-09-29 15:03:00','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-09-29 15:03:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/09/2021 15:03:01 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004305 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 29/09/2021 15:05:02 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Column SET ColumnSQL='(CurrencyConvertRate ((SELECT COALESCE(Sum(Amount),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID), 118, 100, LAR_PaymentHeader.TasaDeCambio))',Updated=TO_DATE('2021-09-29 15:05:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004304
;

-- 29/09/2021 15:06:30 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Column SET ColumnSQL='(CurrencyConvertRate ((SELECT COALESCE(Sum(Amount),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID), 118, 100, LAR_PaymentHeader.TasaDelDia) - CurrencyConvertRate ((SELECT COALESCE(Sum(Amount),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID), 118, 100, LAR_PaymentHeader.TasaDeCambio))',Updated=TO_DATE('2021-09-29 15:06:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004304
;

-- 29/09/2021 15:07:20 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Column SET ColumnSQL='(CurrencyConvertRate ((SELECT COALESCE(Sum(Amount),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID), 118, 100, LAR_PaymentHeader.TasaDeCambio))',Updated=TO_DATE('2021-09-29 15:07:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004305
;

-- 29/09/2021 15:08:14 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001201,'PagadoTasaDia','LAR','Pagado en Tasa del Día','Pagado en Tasa del Día',0,TO_DATE('2021-09-29 15:08:14','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-09-29 15:08:14','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 29/09/2021 15:08:14 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001201 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 29/09/2021 15:08:53 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(CurrencyConvertRate ((SELECT COALESCE(Sum(Amount),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID), 118, 100, LAR_PaymentHeader.TasaDeCambio))',3004307,3000010,'LAR',0,'N','N','N',0,'N',30,'N',37,'N','N',3001201,'N','Y','N','N','N','Pagado en Tasa del Día','PagadoTasaDia','N',TO_DATE('2021-09-29 15:08:53','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-09-29 15:08:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/09/2021 15:08:53 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004307 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 29/09/2021 15:09:42 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Column SET ColumnSQL='(CurrencyConvertRate ((SELECT COALESCE(Sum(Amount),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID), 118, 100, LAR_PaymentHeader.TasaDelDia))',Updated=TO_DATE('2021-09-29 15:09:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004307
;

-- 29/09/2021 15:13:13 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,AD_Tab_ID,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007405,10,'Y','N','N',3004301,3000015,'N','Y','N','Indicates the Currency to be used when processing or reporting on this record','LAR','The Currency for this record','Currency',100,0,TO_DATE('2021-09-29 15:13:12','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-09-29 15:13:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/09/2021 15:13:13 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007405 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 29/09/2021 15:13:13 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,AD_Tab_ID,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007406,30,'Y','N','N',3004304,3000015,'N','Y','N','U','Diferencia de Valoración Ext.',100,0,TO_DATE('2021-09-29 15:13:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-09-29 15:13:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/09/2021 15:13:13 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007406 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 29/09/2021 15:13:13 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,AD_Tab_ID,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007407,10,'Y','N','N',3004302,3000015,'N','Y','N','LAR','Moneda de Factura',100,0,TO_DATE('2021-09-29 15:13:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-09-29 15:13:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/09/2021 15:13:13 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007407 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 29/09/2021 15:13:13 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,AD_Tab_ID,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007408,30,'Y','N','N',3004305,3000015,'N','Y','N','U','Pagado en Tasa de Factura',100,0,TO_DATE('2021-09-29 15:13:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-09-29 15:13:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/09/2021 15:13:13 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007408 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 29/09/2021 15:13:13 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,AD_Tab_ID,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007409,30,'Y','N','N',3004307,3000015,'N','Y','N','LAR','Pagado en Tasa del Día',100,0,TO_DATE('2021-09-29 15:13:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-09-29 15:13:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/09/2021 15:13:13 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007409 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 29/09/2021 15:14:45 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3007405
;

-- 29/09/2021 15:14:45 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3007407
;

-- 29/09/2021 15:14:45 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3007393
;

-- 29/09/2021 15:14:45 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3007394
;

-- 29/09/2021 15:14:45 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3007408
;

-- 29/09/2021 15:14:45 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3007409
;

-- 29/09/2021 15:14:45 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3007389
;

-- 29/09/2021 15:14:45 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3007388
;

-- 29/09/2021 15:14:45 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3007406
;

-- 29/09/2021 15:14:45 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3007390
;

-- 29/09/2021 15:14:59 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2021-09-29 15:14:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007405
;

-- 29/09/2021 15:15:03 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2021-09-29 15:15:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007407
;

-- 29/09/2021 15:16:58 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-09-29 15:16:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007407
;

-- 29/09/2021 15:17:14 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-09-29 15:17:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007408
;

-- 29/09/2021 15:17:23 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-09-29 15:17:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007409
;

-- 29/09/2021 15:17:41 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2021-09-29 15:17:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007388
;

-- 29/09/2021 15:17:47 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-09-29 15:17:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007406
;

-- 29/09/2021 15:17:53 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_DATE('2021-09-29 15:17:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007406
;

-- 29/09/2021 15:18:02 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_DATE('2021-09-29 15:18:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007388
;

-- 29/09/2021 15:18:19 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_DATE('2021-09-29 15:18:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007409
;

-- 29/09/2021 15:18:27 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_DATE('2021-09-29 15:18:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007408
;

-- 29/09/2021 15:18:45 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET DisplayLogic='@TasaDeCambio@>0',Updated=TO_DATE('2021-09-29 15:18:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007408
;

-- 29/09/2021 15:19:15 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET DisplayLogic='@TasaDeCambio@>0',Updated=TO_DATE('2021-09-29 15:19:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007407
;

-- 29/09/2021 15:19:39 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET DisplayLogic='@TasaDelDia@>0',Updated=TO_DATE('2021-09-29 15:19:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007406
;

-- 29/09/2021 15:19:47 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET DisplayLogic='@TasaDelDia@>0',Updated=TO_DATE('2021-09-29 15:19:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007409
;

-- 29/09/2021 15:24:07 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Column SET ColumnSQL='((SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID) - (SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID))',Updated=TO_DATE('2021-09-29 15:24:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003029
;

-- 29/09/2021 15:25:27 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Column SET ColumnSQL='(CurrencyConvertRate ((SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID), 118, 100, LAR_PaymentHeader.TasaDelDia) - CurrencyConvertRate ((SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID), 118, 100, LAR_PaymentHeader.TasaDeCambio))',Updated=TO_DATE('2021-09-29 15:25:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004304
;

-- 29/09/2021 15:26:03 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Column SET ColumnSQL='(CurrencyConvertRate ((SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID), 118, 100, LAR_PaymentHeader.TasaDeCambio))',Updated=TO_DATE('2021-09-29 15:26:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004305
;

-- 29/09/2021 15:26:25 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Column SET ColumnSQL='(CurrencyConvertRate ((SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID), 118, 100, LAR_PaymentHeader.TasaDelDia))',Updated=TO_DATE('2021-09-29 15:26:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004307
;

-- 29/09/2021 15:28:52 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Table SET PO_Window_ID=3000010,Updated=TO_DATE('2021-09-29 15:28:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000010
;

-- 29/09/2021 15:29:14 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2021-09-29 15:29:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007408
;

-- 29/09/2021 15:29:23 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Field SET EntityType='LAR',Updated=TO_DATE('2021-09-29 15:29:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007408
;

-- 29/09/2021 15:51:55 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Ref_Table SET WhereClause='C_Currency.IsActive = ''Y''',Updated=TO_DATE('2021-09-29 15:51:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000134
;

-- 29/09/2021 16:01:10 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Column SET ColumnSQL='(CurrencyConvertRateDiv ((SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID), 118, 100, LAR_PaymentHeader.TasaDelDia) - CurrencyConvertRateDiv ((SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID), 118, 100, LAR_PaymentHeader.TasaDeCambio))',Updated=TO_DATE('2021-09-29 16:01:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004304
;

-- 29/09/2021 16:02:23 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Column SET ColumnSQL='(CurrencyConvertRateDiv ((SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID), 118, 100, LAR_PaymentHeader.TasaDelDia))',Updated=TO_DATE('2021-09-29 16:02:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004307
;

-- 29/09/2021 16:02:41 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Column SET ColumnSQL='(CurrencyConvertRateDiv ((SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID), 118, 100, LAR_PaymentHeader.TasaDeCambio))',Updated=TO_DATE('2021-09-29 16:02:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004305
;

-- 29/09/2021 16:34:34 ART
-- ISSUE #114: Valoraciones en distintas monedas, cabecera de Recibo/Orden Pago.
UPDATE AD_Column SET ColumnSQL='(CurrencyConvertRate (CurrencyConvertRateDiv ((SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID), 118, 100, LAR_PaymentHeader.TasaDelDia) - CurrencyConvertRateDiv ((SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID), 118, 100, LAR_PaymentHeader.TasaDeCambio), 100, 118, LAR_PaymentHeader.TasaDeCambio))',Updated=TO_TIMESTAMP('2021-09-29 16:34:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003029
;

-- Registración de script
SELECT register_migration_script_lar('0196_ISSUE-114.sql', 'LAR', '') FROM dual
;
