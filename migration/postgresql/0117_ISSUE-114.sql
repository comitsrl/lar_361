-- Nueva Función de conversión.
CREATE OR REPLACE FUNCTION currencyConvertRate(
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

		--	Cost Precision
		RETURN currencyRound(p_Amount * p_Rate, p_CurTo_ID, 'Y');
END;

$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION CurrencyConvertRate(numeric, numeric, numeric, numeric)
  OWNER TO adempiere;

ALTER TABLE LAR_PaymentHeader ADD COLUMN TasaDeCambio numeric NOT NULL DEFAULT 0;
ALTER TABLE LAR_PaymentHeader ADD COLUMN TasaDelDia numeric NOT NULL DEFAULT 0;

-- 03/10/2018 14:51:59 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET IsReadOnly='Y', DisplayLogic='@EsRetencionSufrida@=''N'' & @C_ConversionType_ID@ != 0',Updated=TO_TIMESTAMP('2018-10-03 14:51:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000320
;

-- 03/10/2018 14:53:14 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET IsReadOnly='Y', DisplayLogic='@EsRetencionSufrida@=''N'' & @C_ConversionType_ID@ != 0',Updated=TO_TIMESTAMP('2018-10-03 14:53:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000812
;

-- 03/10/2018 14:57:16 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Column SET Callout='org.compiere.model.CalloutPayment.conversionType',Updated=TO_TIMESTAMP('2018-10-03 14:57:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=5398
;

-- 03/10/2018 14:58:15 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2018-10-03 14:58:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000811
;

-- 03/10/2018 14:58:50 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2018-10-03 14:58:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000319
;

-- 03/10/2018 15:06:47 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET DisplayLogic='@EsRetencionSufrida@=''N'' & @C_ConversionType_ID@ =! 0',Updated=TO_TIMESTAMP('2018-10-03 15:06:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000320
;

-- 03/10/2018 15:10:05 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET DisplayLogic='@EsRetencionSufrida@=''N'' & @C_ConversionType_ID@>0',Updated=TO_TIMESTAMP('2018-10-03 15:10:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000320
;

-- 03/10/2018 15:42:09 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET DisplayLogic='@EsRetencionSufrida@=''N'' & @C_ConversionType_ID@>0',Updated=TO_TIMESTAMP('2018-10-03 15:42:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000812
;

-- 04/10/2018 17:22:31 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003017,3000010,'LAR',0,'Y','N','N','N',131089,'N',22,'N',3000867,'N','Y','N','Tasa de Cambio','TasaDeCambio',100,TO_TIMESTAMP('2018-10-04 17:22:30','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2018-10-04 17:22:30','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 04/10/2018 17:22:31 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003017 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 04/10/2018 17:23:11 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005762,131089,'Y','N','N',3003017,'N','Y',3000012,'N','LAR','Tasa de Cambio',100,0,TO_TIMESTAMP('2018-10-04 17:23:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-10-04 17:23:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 04/10/2018 17:23:11 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005762 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/10/2018 17:23:25 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3005762
;

-- 04/10/2018 17:23:25 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3004051
;

-- 04/10/2018 17:23:25 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000269
;

-- 04/10/2018 17:23:33 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2018-10-04 17:23:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005762
;

-- 04/10/2018 17:23:51 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005763,1,'Y','N','N',3002111,'N','Y',3000023,'N','LAR','CalculaRetencion',100,0,TO_TIMESTAMP('2018-10-04 17:23:51','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-10-04 17:23:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 04/10/2018 17:23:51 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005763 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/10/2018 17:23:51 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005764,1,'Y','N','N',3002278,'N','Y',3000023,'N','LAR','Recibo_EOS',100,0,TO_TIMESTAMP('2018-10-04 17:23:51','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-10-04 17:23:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 04/10/2018 17:23:51 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005764 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/10/2018 17:23:51 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005765,131089,'Y','N','N',3003017,'N','Y',3000023,'N','LAR','Tasa de Cambio',100,0,TO_TIMESTAMP('2018-10-04 17:23:51','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-10-04 17:23:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 04/10/2018 17:23:51 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005765 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/10/2018 17:24:14 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3005763
;

-- 04/10/2018 17:24:14 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3005764
;

-- 04/10/2018 17:24:14 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3005765
;

-- 04/10/2018 17:24:14 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000768
;

-- 04/10/2018 17:24:26 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2018-10-04 17:24:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005765
;

-- 04/10/2018 17:24:30 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2018-10-04 17:24:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005765
;

-- 04/10/2018 17:25:07 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET DisplayLogic='@TasaDeCambio@>0',Updated=TO_TIMESTAMP('2018-10-04 17:25:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005765
;

-- 04/10/2018 17:25:44 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET DisplayLogic='@TasaDeCambio@>0',Updated=TO_TIMESTAMP('2018-10-04 17:25:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005762
;

-- 04/10/2018 17:27:38 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2018-10-04 17:27:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005762
;

-- 04/10/2018 17:46:13 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000894,'ReceiptHeaderTotalInvAmt_Dolar','LAR','ReceiptHeaderTotalInvAmt_Dolar','ReceiptHeaderTotalInvAmt_Dolar',0,TO_TIMESTAMP('2018-10-04 17:46:13','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2018-10-04 17:46:13','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 04/10/2018 17:46:13 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000894 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 04/10/2018 17:46:39 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(CurrencyConvert ((SELECT COALESCE(Sum(Amount),0) FROM C_PaymentAllocate i WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = i.LAR_PaymentHeader_ID), 100, @#C_Currency_ID@, (SELECT bp.C_ConversionType_ID FROM C_BPartner bp WHERE bp.C_BPartner_ID = @C_BPartner_ID@), @AD_Client_ID@, @AD_Org_ID@))',3003019,3000010,'U',0,'N','N','N',0,'N',14,'N',37,'N','N',3000894,'N','Y','N','N','N','ReceiptHeaderTotalInvAmt_Dolar','ReceiptHeaderTotalInvAmt_Dolar','N',100,TO_TIMESTAMP('2018-10-04 17:46:39','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2018-10-04 17:46:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 04/10/2018 17:46:39 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003019 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 04/10/2018 17:47:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005766,14,'Y','N','N',3003019,'N','Y',3000012,'N','U','ReceiptHeaderTotalInvAmt_Dolar',100,0,TO_TIMESTAMP('2018-10-04 17:47:04','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-10-04 17:47:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 04/10/2018 17:47:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005766 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/10/2018 17:49:40 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Column SET ColumnSQL='(CurrencyConvert ((SELECT COALESCE(Sum(Amount),0) FROM C_PaymentAllocate i WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = i.LAR_PaymentHeader_ID), 100, 118, (SELECT bp.C_ConversionType_ID FROM C_BPartner bp WHERE bp.C_BPartner_ID = @C_BPartner_ID@), @AD_Client_ID@, @AD_Org_ID@))',Updated=TO_TIMESTAMP('2018-10-04 17:49:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003019
;

-- 04/10/2018 17:59:52 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Column SET ColumnSQL='(CurrencyConvert ((SELECT COALESCE(Sum(Amount),0) FROM C_PaymentAllocate i WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = i.LAR_PaymentHeader_ID), 100, 118, (SELECT bp.C_ConversionType_ID FROM C_BPartner bp WHERE bp.C_BPartner_ID = LAR_PaymentHeader.C_BPartner_ID), LAR_PaymentHeader.AD_Client_ID, LAR_PaymentHeader.AD_Org_ID))',Updated=TO_TIMESTAMP('2018-10-04 17:59:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003019
;

-- 04/10/2018 18:03:17 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Column SET ColumnSQL='(CurrencyConvert ((SELECT COALESCE(Sum(Amount),0) FROM C_PaymentAllocate i WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = i.LAR_PaymentHeader_ID), 100, 118, LAR_PaymentHeader.DateTrx, (SELECT bp.C_ConversionType_ID FROM C_BPartner bp WHERE bp.C_BPartner_ID = LAR_PaymentHeader.C_BPartner_ID), LAR_PaymentHeader.AD_Client_ID, LAR_PaymentHeader.AD_Org_ID))',Updated=TO_TIMESTAMP('2018-10-04 18:03:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003019
;

-- 04/10/2018 18:06:37 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET IsSameLine='Y', IsReadOnly='Y', EntityType='LAR',Updated=TO_TIMESTAMP('2018-10-04 18:06:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005766
;

-- 04/10/2018 18:06:52 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Total Facturas',Updated=TO_TIMESTAMP('2018-10-04 18:06:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005766 AND AD_Language='es_AR'
;

-- 04/10/2018 18:06:55 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_TIMESTAMP('2018-10-04 18:06:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005766
;

-- 04/10/2018 18:07:17 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET DisplayLogic='@TasaDeCambio@>0',Updated=TO_TIMESTAMP('2018-10-04 18:07:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005766
;

-- 04/10/2018 18:07:31 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3005766
;

-- 04/10/2018 18:07:31 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000602
;

-- 04/10/2018 18:07:31 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3005762
;

-- 04/10/2018 18:07:31 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3004051
;

-- 04/10/2018 18:07:31 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000269
;

-- 04/10/2018 18:07:52 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET DisplayLogic='@TasaDeCambio@=0',Updated=TO_TIMESTAMP('2018-10-04 18:07:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000268
;

-- 04/10/2018 18:13:22 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET DisplayLogic=NULL,Updated=TO_TIMESTAMP('2018-10-04 18:13:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000268
;

-- 04/10/2018 18:13:29 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET DisplayLogic='@TasaDeCambio@=0',Updated=TO_TIMESTAMP('2018-10-04 18:13:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001296
;

-- 04/10/2018 18:20:19 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,Description,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000895,'RemainingAmt_Dolar','LAR','RemainingAmt_Dolar','Remaining Amount','RemainingAmt_Dolar',0,TO_TIMESTAMP('2018-10-04 18:20:19','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2018-10-04 18:20:19','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 04/10/2018 18:20:19 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000895 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 04/10/2018 18:20:37 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(CurrencyConvert ((SELECT COALESCE(Sum(Amount),0) FROM C_PaymentAllocate i WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = i.LAR_PaymentHeader_ID), 100, 118, LAR_PaymentHeader.DateTrx, (SELECT bp.C_ConversionType_ID FROM C_BPartner bp WHERE bp.C_BPartner_ID = LAR_PaymentHeader.C_BPartner_ID), LAR_PaymentHeader.AD_Client_ID, LAR_PaymentHeader.AD_Org_ID) - ((SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID) + (SELECT COALESCE(Sum(WriteOffAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID))',3003021,3000010,'LAR',0,'N','N','N',0,'N',14,'N',12,'N','N',3000895,'N','Y','N','N','N','Remaining Amount','RemainingAmt_Dolar','RemainingAmt_Dolar','N',100,TO_TIMESTAMP('2018-10-04 18:20:37','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2018-10-04 18:20:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 04/10/2018 18:20:37 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003021 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 04/10/2018 18:21:17 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005767,14,'Y','N','N',3003021,'N','Y',3000012,'N','LAR','Remaining Amount','RemainingAmt_Dolar',100,0,TO_TIMESTAMP('2018-10-04 18:21:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-10-04 18:21:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 04/10/2018 18:21:17 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005767 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/10/2018 18:21:33 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3005767
;

-- 04/10/2018 18:21:33 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3005762
;

-- 04/10/2018 18:21:33 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3004051
;

-- 04/10/2018 18:21:33 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000269
;

-- 04/10/2018 18:22:03 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Importe Remanente',Description='Importe Remanente',Updated=TO_TIMESTAMP('2018-10-04 18:22:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005767 AND AD_Language='es_AR'
;

-- 04/10/2018 18:22:34 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET IsSameLine='Y', IsCentrallyMaintained='N', IsReadOnly='Y', DisplayLogic='@TasaDeCambio@>0',Updated=TO_TIMESTAMP('2018-10-04 18:22:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005767
;

-- 04/10/2018 18:23:06 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET DisplayLogic='@TasaDeCambio@=0',Updated=TO_TIMESTAMP('2018-10-04 18:23:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000602
;

-- 05/10/2018 14:52:29 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Column SET ColumnSQL='(CurrencyConvert ((SELECT COALESCE(Sum(Amount),0) FROM C_PaymentAllocate i WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = i.LAR_PaymentHeader_ID), 100, 118, LAR_PaymentHeader.DateTrx, (SELECT bp.C_ConversionType_ID FROM C_BPartner bp WHERE bp.C_BPartner_ID = LAR_PaymentHeader.C_BPartner_ID), LAR_PaymentHeader.AD_Client_ID, LAR_PaymentHeader.AD_Org_ID) - ((SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID) + (SELECT COALESCE(Sum(WriteOffAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID)))',Updated=TO_TIMESTAMP('2018-10-05 14:52:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003021
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000326
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000328
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000325
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000323
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000324
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3003293
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000329
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000330
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3002719
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000331
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3002720
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000332
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3002803
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000335
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000356
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3003009
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000336
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000337
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000338
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000339
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000340
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000341
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000342
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000343
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000344
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000345
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000346
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000347
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000348
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000349
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000350
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000351
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000352
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000353
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000354
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000355
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000357
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000358
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000359
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000360
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000363
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000302
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000362
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000289
;

-- 05/10/2018 14:54:04 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- 10/10/2018 17:53:27 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Column SET ColumnSQL='(CurrencyConvertRate ((SELECT COALESCE(Sum(Amount),0) FROM C_PaymentAllocate i WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = i.LAR_PaymentHeader_ID), 100, 118, LAR_PaymentHeader.TasaDeCambio) - ((SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID) + (SELECT COALESCE(Sum(WriteOffAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID)))',Updated=TO_TIMESTAMP('2018-10-10 17:53:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003021
;

-- 10/10/2018 17:56:05 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Column SET ColumnSQL='(CurrencyConvertRate ((SELECT COALESCE(Sum(Amount),0) FROM C_PaymentAllocate i WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = i.LAR_PaymentHeader_ID), 100, 118, LAR_PaymentHeader.TasaDeCambio))',Updated=TO_TIMESTAMP('2018-10-10 17:56:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003019
;

-- 11/10/2018 18:14:01 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000899,'tasadeldia','LAR','tasadeldia','tasadeldia',0,TO_TIMESTAMP('2018-10-11 18:14:01','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2018-10-11 18:14:01','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 11/10/2018 18:14:01 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000899 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/10/2018 18:14:01 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003028,3000010,'LAR',0,'Y','N','N','N',131089,'N',22,'N',3000899,'N','Y','N','tasadeldia','tasadeldia',100,TO_TIMESTAMP('2018-10-11 18:14:01','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2018-10-11 18:14:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/10/2018 18:14:01 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003028 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/10/2018 18:14:46 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Column SET Name='Tasa del Día', ColumnName='TasaDelDia',Updated=TO_TIMESTAMP('2018-10-11 18:14:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003028
;

-- 11/10/2018 18:14:46 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003028
;

-- 11/10/2018 18:14:46 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET Name='Tasa del Día', Description=NULL, Help=NULL WHERE AD_Column_ID=3003028 AND IsCentrallyMaintained='Y'
;

-- 11/10/2018 18:15:14 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Element SET ColumnName='TasaDelDia', Name='Tasa del Día', PrintName='Tasa del Día',Updated=TO_TIMESTAMP('2018-10-11 18:15:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000899
;

-- 11/10/2018 18:15:14 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000899
;

-- 11/10/2018 18:15:14 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Column SET ColumnName='TasaDelDia', Name='Tasa del Día', Description=NULL, Help=NULL WHERE AD_Element_ID=3000899
;

-- 11/10/2018 18:15:14 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Process_Para SET ColumnName='TasaDelDia', Name='Tasa del Día', Description=NULL, Help=NULL, AD_Element_ID=3000899 WHERE UPPER(ColumnName)='TASADELDIA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/10/2018 18:15:14 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Process_Para SET ColumnName='TasaDelDia', Name='Tasa del Día', Description=NULL, Help=NULL WHERE AD_Element_ID=3000899 AND IsCentrallyMaintained='Y'
;

-- 11/10/2018 18:15:14 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET Name='Tasa del Día', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000899) AND IsCentrallyMaintained='Y'
;

-- 11/10/2018 18:15:14 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_PrintFormatItem SET PrintName='Tasa del Día', Name='Tasa del Día' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000899)
;

-- 11/10/2018 18:15:21 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Element_Trl SET Name='Tasa del Día',PrintName='Tasa del Día',Updated=TO_TIMESTAMP('2018-10-11 18:15:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000899 AND AD_Language='es_AR'
;

-- 11/10/2018 18:15:27 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Column_Trl SET Name='Tasa del Día',Updated=TO_TIMESTAMP('2018-10-11 18:15:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003028 AND AD_Language='es_AR'
;

-- 11/10/2018 18:16:01 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Column SET FieldLength=30, AD_Reference_ID=37,Updated=TO_TIMESTAMP('2018-10-11 18:16:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003028
;

-- 11/10/2018 18:21:31 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000900,'ValoracionDelDia','LAR','Valoración del Día','Valoración del Día',0,TO_TIMESTAMP('2018-10-11 18:21:31','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2018-10-11 18:21:31','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 11/10/2018 18:21:31 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000900 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/10/2018 18:22:02 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(CurrencyConvertRate ((SELECT COALESCE(Sum(Amount),0) FROM C_PaymentAllocate i WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = i.LAR_PaymentHeader_ID), 100, 118, LAR_PaymentHeader.TasaDelDia))',3003029,3000010,'LAR',0,'N','N','N',0,'N',30,'N',37,'N','N',3000900,'N','Y','N','N','N','Valoración del Día','ValoracionDelDia','N',100,TO_TIMESTAMP('2018-10-11 18:22:02','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2018-10-11 18:22:02','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/10/2018 18:22:02 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003029 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/10/2018 18:23:10 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005876,30,'Y','N','N',3003028,'N','Y',3000012,'N','LAR','Tasa del Día',100,0,TO_TIMESTAMP('2018-10-11 18:23:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-10-11 18:23:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/10/2018 18:23:10 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005876 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/10/2018 18:23:11 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005877,30,'Y','N','N',3003029,'N','Y',3000012,'N','LAR','Valoración del Día',100,0,TO_TIMESTAMP('2018-10-11 18:23:10','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-10-11 18:23:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/10/2018 18:23:11 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005877 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/10/2018 18:23:44 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3005876
;

-- 11/10/2018 18:23:44 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3005877
;

-- 11/10/2018 18:23:44 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3004051
;

-- 11/10/2018 18:23:44 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000269
;

-- 11/10/2018 18:23:59 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2018-10-11 18:23:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005877
;

-- 11/10/2018 18:24:40 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005878,14,'Y','N','N',3003019,'N','Y',3000023,'N','U','ReceiptHeaderTotalInvAmt_Dolar',100,0,TO_TIMESTAMP('2018-10-11 18:24:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-10-11 18:24:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/10/2018 18:24:40 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005878 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/10/2018 18:24:40 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005879,14,'Y','N','N',3003021,'N','Y',3000023,'N','LAR','Remaining Amount','RemainingAmt_Dolar',100,0,TO_TIMESTAMP('2018-10-11 18:24:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-10-11 18:24:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/10/2018 18:24:40 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005879 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/10/2018 18:24:40 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005880,30,'Y','N','N',3003028,'N','Y',3000023,'N','LAR','Tasa del Día',100,0,TO_TIMESTAMP('2018-10-11 18:24:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-10-11 18:24:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/10/2018 18:24:40 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005880 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/10/2018 18:24:40 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005881,30,'Y','N','N',3003029,'N','Y',3000023,'N','LAR','Valoración del Día',100,0,TO_TIMESTAMP('2018-10-11 18:24:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2018-10-11 18:24:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/10/2018 18:24:40 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005881 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/10/2018 18:25:31 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3005878
;

-- 11/10/2018 18:25:32 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000767
;

-- 11/10/2018 18:25:32 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3005879
;

-- 11/10/2018 18:25:32 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3005765
;

-- 11/10/2018 18:25:32 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000768
;

-- 11/10/2018 18:25:32 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3005880
;

-- 11/10/2018 18:25:32 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3005881
;

-- 11/10/2018 18:25:44 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2018-10-11 18:25:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005879
;

-- 11/10/2018 18:26:19 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET DisplayLogic='@TasaDeCambio@>0',Updated=TO_TIMESTAMP('2018-10-11 18:26:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005879
;

-- 11/10/2018 18:26:37 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET IsSameLine='Y', DisplayLogic='@TasaDeCambio@>0',Updated=TO_TIMESTAMP('2018-10-11 18:26:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005878
;

-- 11/10/2018 18:26:56 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET EntityType='LAR',Updated=TO_TIMESTAMP('2018-10-11 18:26:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005878
;

-- 11/10/2018 18:28:06 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET DisplayLogic='@TasaDeCambio@=0',Updated=TO_TIMESTAMP('2018-10-11 18:28:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000767
;

-- 11/10/2018 18:29:29 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3005880
;

-- 11/10/2018 18:29:29 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3005881
;

-- 11/10/2018 18:29:29 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000768
;

-- 11/10/2018 18:30:28 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET DisplayLogic='@TasaDelDia@>0',Updated=TO_TIMESTAMP('2018-10-11 18:30:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005881
;

-- 11/10/2018 18:31:11 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET DisplayLogic='@TasaDelDia@>0',Updated=TO_TIMESTAMP('2018-10-11 18:31:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005877
;

-- 11/10/2018 18:33:06 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2018-10-11 18:33:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005880
;

-- 11/10/2018 18:36:08 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2018-10-11 18:36:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000766
;

-- 11/10/2018 18:37:25 ART
-- ISSUE #114: Configuración de Recibos (Venta en Dolares).
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2018-10-11 18:37:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005876
;

-- Registración de script
SELECT register_migration_script_lar('0117_ISSUE-114.sql', 'LAR', '')
;
