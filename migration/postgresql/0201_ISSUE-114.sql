ALTER TABLE C_PaymentAllocate ADD COLUMN TasaDeCambio numeric NOT NULL DEFAULT 0;
ALTER TABLE C_PaymentAllocate ADD COLUMN C_Currency_ID numeric(10,0);
ALTER TABLE C_PaymentAllocate ADD CONSTRAINT ccurrency_cpaymentallocate FOREIGN KEY (C_Currency_ID)
      REFERENCES C_Currency (C_Currency_ID) MATCH SIMPLE;
ALTER TABLE C_PaymentAllocate ADD COLUMN DiferenciaValoracion numeric NOT NULL DEFAULT 0;
ALTER TABLE C_PaymentAllocate ADD COLUMN DiferenciaValoracionExt numeric NOT NULL DEFAULT 0;
ALTER TABLE C_PaymentAllocate ADD COLUMN PorcDiferenciaValoracion numeric NOT NULL DEFAULT 0;
ALTER TABLE C_PaymentAllocate ADD COLUMN MontoPagado numeric;
ALTER TABLE LAR_PaymentHeader ADD COLUMN CalcularDifCambio character(1);

-- 03/11/2021 19:32:05 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004385,812,'LAR',0,'Y','N','N','N',131089,'N',22,'N',3000867,'N','Y','N','Tasa de Cambio','TasaDeCambio',100,TO_TIMESTAMP('2021-11-03 19:32:05','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2021-11-03 19:32:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 03/11/2021 19:32:05 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004385 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 03/11/2021 19:34:59 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007660,131089,'Y','N','N',3004385,'N','Y',3000045,'N','LAR','Tasa de Cambio',100,0,TO_TIMESTAMP('2021-11-03 19:34:59','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-11-03 19:34:59','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/11/2021 19:34:59 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007660 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/11/2021 19:35:21 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET DisplayLength=30,Updated=TO_TIMESTAMP('2021-11-03 19:35:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007660
;

-- 03/11/2021 19:35:39 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=100,Updated=TO_TIMESTAMP('2021-11-03 19:35:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007660
;

-- 03/11/2021 19:37:25 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007670,131089,'Y','N','N',3004385,'N','Y',3000063,'N','LAR','Tasa de Cambio',100,0,TO_TIMESTAMP('2021-11-03 19:37:24','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-11-03 19:37:24','YYYY-MM-DD HH24:MI:SS'))
;

-- 03/11/2021 19:37:25 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007670 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 03/11/2021 19:37:43 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007669
;

-- 03/11/2021 19:37:43 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3007670
;

-- 03/11/2021 19:37:55 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET DisplayLength=30,Updated=TO_TIMESTAMP('2021-11-03 19:37:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007670
;

-- 03/11/2021 19:39:33 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2021-11-03 19:39:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007670
;

-- 03/11/2021 19:40:39 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2021-11-03 19:40:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007660
;

-- 04/11/2021 20:54:47 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004386,812,'LAR',0,'N','N','N','Indicates the Currency to be used when processing or reporting on this record','N',10,'N',19,'N',193,'N','Y','N','The Currency for this record','Currency','C_Currency_ID',100,TO_TIMESTAMP('2021-11-04 20:54:46','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2021-11-04 20:54:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 04/11/2021 20:54:47 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004386 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 04/11/2021 20:55:34 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007671,10,'Y','N','N',3004386,'N','Y',3000045,'N','Indicates the Currency to be used when processing or reporting on this record','LAR','The Currency for this record','Currency',100,0,TO_TIMESTAMP('2021-11-04 20:55:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-11-04 20:55:34','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/11/2021 20:55:34 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007671 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/11/2021 20:55:55 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3007671
;

-- 04/11/2021 20:55:55 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3007660
;

-- 04/11/2021 20:56:21 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET DisplayLogic='@TasaDeCambio@>0',Updated=TO_TIMESTAMP('2021-11-04 20:56:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007660
;

-- 04/11/2021 20:56:27 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2021-11-04 20:56:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007660
;

-- 04/11/2021 20:56:33 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2021-11-04 20:56:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007671
;

-- 04/11/2021 20:56:42 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2021-11-04 20:56:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007660
;

-- 04/11/2021 20:58:07 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007672,10,'Y','N','N',3004386,'N','Y',3000063,'N','Indicates the Currency to be used when processing or reporting on this record','LAR','The Currency for this record','Currency',100,0,TO_TIMESTAMP('2021-11-04 20:58:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-11-04 20:58:07','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/11/2021 20:58:07 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007672 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/11/2021 20:58:20 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3007672
;

-- 04/11/2021 20:58:20 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3007670
;

-- 04/11/2021 20:58:31 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2021-11-04 20:58:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007672
;

-- 04/11/2021 20:58:39 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET IsSameLine='Y', IsReadOnly='Y',Updated=TO_TIMESTAMP('2021-11-04 20:58:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007670
;

-- 10/11/2021 20:18:42 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET ColumnSQL='(SELECT Sum(COALESCE(CurrencyConvertRate(i.Amount, LAR_PaymentHeader.C_Currency_ID, i.C_Currency_ID, i.TasaDeCambio), 0)) FROM C_PaymentAllocate i WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = i.LAR_PaymentHeader_ID)',Updated=TO_TIMESTAMP('2021-11-10 20:18:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000969
;

-- 10/11/2021 20:19:34 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET ColumnSQL='(SELECT Sum(COALESCE(CurrencyConvertRate(i.Amount, LAR_PaymentHeader.C_Currency_ID, i.C_Currency_ID, i.TasaDeCambio), 0)) FROM C_PaymentAllocate i WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = i.LAR_PaymentHeader_ID) -((SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID) + (SELECT COALESCE(Sum(WriteOffAmt),0)',Updated=TO_TIMESTAMP('2021-11-10 20:19:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000264
;

-- 10/11/2021 20:26:36 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET DisplayLogic=NULL,Updated=TO_TIMESTAMP('2021-11-10 20:26:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000602
;

-- 10/11/2021 20:26:51 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET DisplayLogic=NULL,Updated=TO_TIMESTAMP('2021-11-10 20:26:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001296
;

-- 10/11/2021 20:27:17 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3005766
;

-- 10/11/2021 20:27:17 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
DELETE FROM AD_Field WHERE AD_Field_ID=3005766
;

-- 10/11/2021 20:27:50 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3005767
;

-- 10/11/2021 20:27:50 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
DELETE FROM AD_Field WHERE AD_Field_ID=3005767
;

-- 10/11/2021 20:28:17 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
DELETE FROM AD_Column_Trl WHERE AD_Column_ID=3003021
;

-- 10/11/2021 20:28:18 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
DELETE FROM AD_Column WHERE AD_Column_ID=3003021
;

-- 10/11/2021 20:29:01 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3005878
;

-- 10/11/2021 20:29:01 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
DELETE FROM AD_Field WHERE AD_Field_ID=3005878
;

-- 10/11/2021 20:29:13 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3005879
;

-- 10/11/2021 20:29:13 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
DELETE FROM AD_Field WHERE AD_Field_ID=3005879
;

-- 10/11/2021 20:29:47 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3007664
;

-- 10/11/2021 20:29:47 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
DELETE FROM AD_Field WHERE AD_Field_ID=3007664
;

-- 10/11/2021 20:30:32 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
DELETE FROM AD_Field_Trl WHERE AD_Field_ID=3007666
;

-- 10/11/2021 20:30:32 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
DELETE FROM AD_Field WHERE AD_Field_ID=3007666
;

-- 10/11/2021 20:31:05 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
DELETE FROM AD_Column_Trl WHERE AD_Column_ID=3003019
;

-- 10/11/2021 20:31:05 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
DELETE FROM AD_Column WHERE AD_Column_ID=3003019
;

-- 10/11/2021 20:31:18 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
DELETE FROM AD_Column_Trl WHERE AD_Column_ID=3003021
;

-- 10/11/2021 20:31:18 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
DELETE FROM AD_Column WHERE AD_Column_ID=3003021
;

-- 10/11/2021 21:13:05 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004387,812,'U',0,'N','N','N',0,'N',20,'N',12,'N','N',3000981,'N','Y','N','Y','N','Porc. Dif. de Valoración','PorcDiferenciaValoracion','Y',100,TO_TIMESTAMP('2021-11-10 21:13:04','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2021-11-10 21:13:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/11/2021 21:13:05 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004387 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 10/11/2021 21:14:24 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET ColumnSQL='((C_PaymentAllocate.TasaDelDia - C_PaymentAllocate.TasaDeCambio) * 100 / CASE WHEN C_PaymentAllocate.TasaDeCambio > 0 THEN C_PaymentAllocate.TasaDeCambio ELSE 1 END)', IsUpdateable='N', IsAllowCopy='N',Updated=TO_TIMESTAMP('2021-11-10 21:14:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004387
;

-- 10/11/2021 21:14:32 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET EntityType='LAR',Updated=TO_TIMESTAMP('2021-11-10 21:14:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004387
;

-- 10/11/2021 22:19:21 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('((CurrencyConvertRate(C_PaymentAllocate.Amount, C_PaymentAllocate.C_Currency_ID, 100, C_PaymentAllocate.TasaDeCambio)) - (CurrencyConvertRate(C_PaymentAllocate.Amount, C_PaymentAllocate.C_Currency_ID, 100, (SELECT ph.TasaDelDia FROM LAR_PaymentHeader ph WEHRE C_PaymentAllocate.LAR_PaymentHeader_ID = ph.LAR_PaymentHeader_ID))))',3004388,812,'LAR',0,'N','N','N',0,'N',20,'N',12,'N','N',3000900,'N','Y','N','N','N','Diferencia de Valoración','DiferenciaValoracion','N',100,TO_TIMESTAMP('2021-11-10 22:19:20','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2021-11-10 22:19:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/11/2021 22:19:21 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004388 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 10/11/2021 22:23:06 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007673,20,'Y','N','N',3004388,'N','Y',3000045,'N','LAR','Diferencia de Valoración',100,0,TO_TIMESTAMP('2021-11-10 22:23:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-11-10 22:23:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 10/11/2021 22:23:06 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007673 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/11/2021 22:23:06 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007674,20,'Y','N','N',3004387,'N','Y',3000045,'N','LAR','Porc. Dif. de Valoración',100,0,TO_TIMESTAMP('2021-11-10 22:23:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-11-10 22:23:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 10/11/2021 22:23:06 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007674 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/11/2021 22:24:01 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007675,20,'Y','N','N',3004388,'N','Y',3000063,'N','LAR','Diferencia de Valoración',100,0,TO_TIMESTAMP('2021-11-10 22:24:01','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-11-10 22:24:01','YYYY-MM-DD HH24:MI:SS'))
;

-- 10/11/2021 22:24:01 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007675 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/11/2021 22:24:02 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007676,20,'Y','N','N',3004387,'N','Y',3000063,'N','LAR','Porc. Dif. de Valoración',100,0,TO_TIMESTAMP('2021-11-10 22:24:01','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-11-10 22:24:01','YYYY-MM-DD HH24:MI:SS'))
;

-- 10/11/2021 22:24:02 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007676 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/11/2021 22:36:57 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET ColumnSQL='(SELECT Sum(COALESCE(CurrencyConvertRate(i.Amount, LAR_PaymentHeader.C_Currency_ID, i.C_Currency_ID, i.TasaDeCambio), 0)) FROM C_PaymentAllocate i WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = i.LAR_PaymentHeader_ID) -((SELECT COALESCE(Sum(PayAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID) + (SELECT COALESCE(Sum(WriteOffAmt),0) FROM C_Payment p WHERE  LAR_PaymentHeader.LAR_PaymentHeader_ID = p.LAR_PaymentHeader_ID))',Updated=TO_TIMESTAMP('2021-11-10 22:36:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000264
;

-- 10/11/2021 22:42:07 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET ColumnSQL='((CurrencyConvertRate(C_PaymentAllocate.Amount, C_PaymentAllocate.C_Currency_ID, 100, C_PaymentAllocate.TasaDeCambio)) - (CurrencyConvertRate(C_PaymentAllocate.Amount, C_PaymentAllocate.C_Currency_ID, 100, (SELECT ph.TasaDelDia FROM LAR_PaymentHeader ph WHERE C_PaymentAllocate.LAR_PaymentHeader_ID = ph.LAR_PaymentHeader_ID))))',Updated=TO_TIMESTAMP('2021-11-10 22:42:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004388
;

-- 10/11/2021 22:45:40 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET ColumnSQL='(((SELECT ph.TasaDelDia FROM LAR_PaymentHeader ph WHERE C_PaymentAllocate.LAR_PaymentHeader_ID = ph.LAR_PaymentHeader_ID) - C_PaymentAllocate.TasaDeCambio) * 100 / CASE WHEN C_PaymentAllocate.TasaDeCambio > 0 THEN C_PaymentAllocate.TasaDeCambio ELSE 1 END)',Updated=TO_TIMESTAMP('2021-11-10 22:45:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004387
;

-- 10/11/2021 22:52:36 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET ColumnSQL='((CurrencyConvertRate(C_PaymentAllocate.Amount, C_PaymentAllocate.C_Currency_ID, 118, C_PaymentAllocate.TasaDeCambio)) - (CurrencyConvertRate(C_PaymentAllocate.Amount, C_PaymentAllocate.C_Currency_ID, 100, (SELECT ph.TasaDelDia FROM LAR_PaymentHeader ph WHERE C_PaymentAllocate.LAR_PaymentHeader_ID = ph.LAR_PaymentHeader_ID))))',Updated=TO_TIMESTAMP('2021-11-10 22:52:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004388
;

-- 10/11/2021 22:56:39 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET ColumnSQL='((CurrencyConvertRate(C_PaymentAllocate.Amount, C_PaymentAllocate.C_Currency_ID, 118, C_PaymentAllocate.TasaDeCambio)) - (CurrencyConvertRate(C_PaymentAllocate.Amount, C_PaymentAllocate.C_Currency_ID, 118, (SELECT ph.TasaDelDia FROM LAR_PaymentHeader ph WHERE C_PaymentAllocate.LAR_PaymentHeader_ID = ph.LAR_PaymentHeader_ID))))',Updated=TO_TIMESTAMP('2021-11-10 22:56:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004388
;

-- 10/11/2021 22:59:18 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET ColumnSQL='((CurrencyConvertRate(C_PaymentAllocate.Amount, C_PaymentAllocate.C_Currency_ID, 118, (SELECT ph.TasaDelDia FROM LAR_PaymentHeader ph WHERE C_PaymentAllocate.LAR_PaymentHeader_ID = ph.LAR_PaymentHeader_ID))) - (CurrencyConvertRate(C_PaymentAllocate.Amount, C_PaymentAllocate.C_Currency_ID, 118, C_PaymentAllocate.TasaDeCambio)))',Updated=TO_TIMESTAMP('2021-11-10 22:59:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004388
;

-- 11/11/2021 18:58:34 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET ColumnSQL=NULL,Updated=TO_TIMESTAMP('2021-11-11 18:58:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004387
;

-- 11/11/2021 18:58:54 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET ColumnSQL=NULL,Updated=TO_TIMESTAMP('2021-11-11 18:58:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004388
;

-- 11/11/2021 18:59:28 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001215,'montopagado','LAR','montopagado','montopagado',0,TO_TIMESTAMP('2021-11-11 18:59:28','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-11-11 18:59:28','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 11/11/2021 18:59:28 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001215 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/11/2021 18:59:29 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004389,812,'LAR',0,'N','N','N','N',131089,'N',22,'N',3001215,'N','Y','N','montopagado','montopagado',100,TO_TIMESTAMP('2021-11-11 18:59:28','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2021-11-11 18:59:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2021 18:59:29 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004389 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/11/2021 19:00:55 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Element SET ColumnName='MontoPagado', Name='Monto Pagado', PrintName='Monto Pagado',Updated=TO_TIMESTAMP('2021-11-11 19:00:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001215
;

-- 11/11/2021 19:00:55 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001215
;

-- 11/11/2021 19:00:55 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET ColumnName='MontoPagado', Name='Monto Pagado', Description=NULL, Help=NULL WHERE AD_Element_ID=3001215
;

-- 11/11/2021 19:00:55 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Process_Para SET ColumnName='MontoPagado', Name='Monto Pagado', Description=NULL, Help=NULL, AD_Element_ID=3001215 WHERE UPPER(ColumnName)='MONTOPAGADO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/11/2021 19:00:55 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Process_Para SET ColumnName='MontoPagado', Name='Monto Pagado', Description=NULL, Help=NULL WHERE AD_Element_ID=3001215 AND IsCentrallyMaintained='Y'
;

-- 11/11/2021 19:00:55 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET Name='Monto Pagado', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001215) AND IsCentrallyMaintained='Y'
;

-- 11/11/2021 19:00:55 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_PrintFormatItem SET PrintName='Monto Pagado', Name='Monto Pagado' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001215)
;

-- 11/11/2021 19:01:06 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Element_Trl SET Name='Monto Pagado',PrintName='Monto Pagado',Updated=TO_TIMESTAMP('2021-11-11 19:01:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001215 AND AD_Language='es_AR'
;

-- 11/11/2021 19:01:13 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET FieldLength=20, AD_Reference_ID=12, Name='Monto Pagado', ColumnName='MontoPagado',Updated=TO_TIMESTAMP('2021-11-11 19:01:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004389
;

-- 11/11/2021 19:01:19 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column_Trl SET Name='Monto Pagado',Updated=TO_TIMESTAMP('2021-11-11 19:01:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004389 AND AD_Language='es_AR'
;

-- 11/11/2021 19:04:33 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007677,20,'Y','N','N',3004389,'N','Y',3000045,'N','LAR','Monto Pagado',100,0,TO_TIMESTAMP('2021-11-11 19:04:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-11-11 19:04:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/11/2021 19:04:33 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007677 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2021 19:05:48 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3007677
;

-- 11/11/2021 19:05:48 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3007674
;

-- 11/11/2021 19:05:48 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3007673
;

-- 11/11/2021 19:08:04 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004390,812,'LAR',0,'Y','N','N','N',131089,'N',22,'N',3001199,'N','Y','N','Diferencia de Valoración Ext.','DiferenciaValoracionExt',100,TO_TIMESTAMP('2021-11-11 19:08:04','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2021-11-11 19:08:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2021 19:08:04 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004390 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/11/2021 19:09:08 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007678,131089,'Y','N','N',3004390,'N','Y',3000045,'N','LAR','Diferencia de Valoración Ext.',100,0,TO_TIMESTAMP('2021-11-11 19:09:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-11-11 19:09:08','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/11/2021 19:09:08 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007678 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2021 19:09:15 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3007678
;

-- 11/11/2021 19:09:15 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3007673
;

-- 11/11/2021 19:09:18 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3007673
;

-- 11/11/2021 19:09:18 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3007678
;

-- 11/11/2021 19:09:25 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2021-11-11 19:09:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007674
;

-- 11/11/2021 19:10:06 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET DisplayLength=20, IsSameLine='Y',Updated=TO_TIMESTAMP('2021-11-11 19:10:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007678
;

-- 11/11/2021 19:10:21 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET FieldLength=20, AD_Reference_ID=12,Updated=TO_TIMESTAMP('2021-11-11 19:10:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004390
;

-- 11/11/2021 19:10:50 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007679,20,'Y','N','N',3004390,'N','Y',3000063,'N','LAR','Diferencia de Valoración Ext.',100,0,TO_TIMESTAMP('2021-11-11 19:10:50','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-11-11 19:10:50','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/11/2021 19:10:50 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007679 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2021 19:10:51 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007680,20,'Y','N','N',3004389,'N','Y',3000063,'N','LAR','Monto Pagado',100,0,TO_TIMESTAMP('2021-11-11 19:10:50','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-11-11 19:10:50','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/11/2021 19:10:51 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007680 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2021 19:11:17 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3007680
;

-- 11/11/2021 19:11:17 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3007676
;

-- 11/11/2021 19:11:17 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3007675
;

-- 11/11/2021 19:11:17 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3007679
;

-- 11/11/2021 19:11:25 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2021-11-11 19:11:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007676
;

-- 11/11/2021 19:11:31 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2021-11-11 19:11:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007679
;

-- 11/11/2021 23:00:03 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001216,'calculardifcambio','LAR','calculardifcambio','calculardifcambio',0,TO_TIMESTAMP('2021-11-11 23:00:02','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-11-11 23:00:02','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 11/11/2021 23:00:03 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001216 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 11/11/2021 23:00:03 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004391,3000010,'LAR',0,'N','N','N','N',1,'N',20,'N',3001216,'N','Y','N','calculardifcambio','calculardifcambio',100,TO_TIMESTAMP('2021-11-11 23:00:02','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2021-11-11 23:00:02','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 11/11/2021 23:00:03 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004391 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 11/11/2021 23:00:57 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Element SET ColumnName='CalcularDifCambio', Name='Calcular Dif. de Cambio', PrintName='Calcular Dif. de Cambio',Updated=TO_TIMESTAMP('2021-11-11 23:00:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001216
;

-- 11/11/2021 23:00:57 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001216
;

-- 11/11/2021 23:00:57 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET ColumnName='CalcularDifCambio', Name='Calcular Dif. de Cambio', Description=NULL, Help=NULL WHERE AD_Element_ID=3001216
;

-- 11/11/2021 23:00:57 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Process_Para SET ColumnName='CalcularDifCambio', Name='Calcular Dif. de Cambio', Description=NULL, Help=NULL, AD_Element_ID=3001216 WHERE UPPER(ColumnName)='CALCULARDIFCAMBIO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 11/11/2021 23:00:57 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Process_Para SET ColumnName='CalcularDifCambio', Name='Calcular Dif. de Cambio', Description=NULL, Help=NULL WHERE AD_Element_ID=3001216 AND IsCentrallyMaintained='Y'
;

-- 11/11/2021 23:00:57 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET Name='Calcular Dif. de Cambio', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001216) AND IsCentrallyMaintained='Y'
;

-- 11/11/2021 23:00:57 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_PrintFormatItem SET PrintName='Calcular Dif. de Cambio', Name='Calcular Dif. de Cambio' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001216)
;

-- 11/11/2021 23:01:04 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Element_Trl SET Name='Calcular Dif. de Cambio',PrintName='Calcular Dif. de Cambio',Updated=TO_TIMESTAMP('2021-11-11 23:01:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001216 AND AD_Language='es_AR'
;

-- 11/11/2021 23:01:27 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column_Trl SET Name='Calcular Dif. de Cambio',Updated=TO_TIMESTAMP('2021-11-11 23:01:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004391 AND AD_Language='es_AR'
;

-- 11/11/2021 23:03:09 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES (3000454,'N','N','3','N','N','S','LAR',0,0,'ar.com.ergio.process.LAR_CalcularDifCambio','N','LAR_CalcularDifCambio','LAR_CalcularDifCambio',0,0,100,TO_TIMESTAMP('2021-11-11 23:03:09','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2021-11-11 23:03:09','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 11/11/2021 23:03:10 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000454 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 11/11/2021 23:03:28 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET AD_Reference_ID=28, AD_Process_ID=3000454,Updated=TO_TIMESTAMP('2021-11-11 23:03:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004391
;

-- 11/11/2021 23:03:55 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007681,1,'Y','N','N',3004391,'N','Y',3000012,'N','LAR','Calcular Dif. de Cambio',100,0,TO_TIMESTAMP('2021-11-11 23:03:55','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-11-11 23:03:55','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/11/2021 23:03:55 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007681 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 11/11/2021 23:04:45 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007682,1,'Y','N','N',3004391,'N','Y',3000015,'N','LAR','Calcular Dif. de Cambio',100,0,TO_TIMESTAMP('2021-11-11 23:04:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-11-11 23:04:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 11/11/2021 23:04:45 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007682 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/11/2021 16:18:38 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET IsUpdateable='Y',Updated=TO_TIMESTAMP('2021-11-12 16:18:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004388
;

-- 12/11/2021 16:19:44 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET IsMandatory='N',Updated=TO_TIMESTAMP('2021-11-12 16:19:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004390
;

-- 12/11/2021 16:19:57 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET IsUpdateable='Y',Updated=TO_TIMESTAMP('2021-11-12 16:19:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004387
;

-- 12/11/2021 16:21:57 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2021-11-12 16:21:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007677
;

-- 12/11/2021 16:22:07 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET IsFieldOnly='Y',Updated=TO_TIMESTAMP('2021-11-12 16:22:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007678
;

-- 12/11/2021 16:22:13 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET IsFieldOnly='Y',Updated=TO_TIMESTAMP('2021-11-12 16:22:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007673
;

-- 12/11/2021 16:22:18 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET IsFieldOnly='Y',Updated=TO_TIMESTAMP('2021-11-12 16:22:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007674
;

-- 12/11/2021 16:24:03 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET DisplayLogic='@C_Currency_ID@!@#C_Currency_ID@',Updated=TO_TIMESTAMP('2021-11-12 16:24:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007674
;

-- 12/11/2021 16:27:02 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET IsFieldOnly='N', IsReadOnly='Y',Updated=TO_TIMESTAMP('2021-11-12 16:27:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007674
;

-- 12/11/2021 16:27:41 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET DisplayLogic='@C_Currency_ID@!118',Updated=TO_TIMESTAMP('2021-11-12 16:27:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007674
;

-- 12/11/2021 16:28:07 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET IsFieldOnly='N', IsReadOnly='Y', DisplayLogic='@C_Currency_ID@!118',Updated=TO_TIMESTAMP('2021-11-12 16:28:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007673
;

-- 12/11/2021 16:28:19 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET IsFieldOnly='N', IsReadOnly='Y', DisplayLogic='@C_Currency_ID@!118',Updated=TO_TIMESTAMP('2021-11-12 16:28:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007678
;

-- 12/11/2021 16:28:57 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET DisplayLogic='@TasaDeCambio@>0',Updated=TO_TIMESTAMP('2021-11-12 16:28:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007674
;

-- 12/11/2021 16:29:12 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET DisplayLogic='@TasaDeCambio@>0',Updated=TO_TIMESTAMP('2021-11-12 16:29:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007677
;

-- 12/11/2021 16:29:20 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET DisplayLogic='@TasaDeCambio@>0',Updated=TO_TIMESTAMP('2021-11-12 16:29:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007673
;

-- 12/11/2021 16:29:25 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET DisplayLogic='@TasaDeCambio@>0',Updated=TO_TIMESTAMP('2021-11-12 16:29:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007678
;

-- 12/11/2021 16:31:28 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET DisplayLogic=NULL,Updated=TO_TIMESTAMP('2021-11-12 16:31:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007677
;

-- 12/11/2021 16:36:06 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET DisplayLogic='@TasaDeCambio@>0',Updated=TO_TIMESTAMP('2021-11-12 16:36:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007670
;

-- 12/11/2021 16:36:15 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2021-11-12 16:36:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007680
;

-- 12/11/2021 16:36:25 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET IsReadOnly='Y', DisplayLogic='@TasaDeCambio@>0',Updated=TO_TIMESTAMP('2021-11-12 16:36:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007676
;

-- 12/11/2021 16:36:32 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET IsReadOnly='Y', DisplayLogic='@TasaDeCambio@>0',Updated=TO_TIMESTAMP('2021-11-12 16:36:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007675
;

-- 12/11/2021 16:36:47 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET IsReadOnly='Y', DisplayLogic='@TasaDeCambio@>0',Updated=TO_TIMESTAMP('2021-11-12 16:36:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007679
;

-- 12/11/2021 16:47:47 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET ColumnSQL='(SELECT SUM (COALESCE(DiferenciaValoracion, 0)) FROM C_PaymentAllocate WHERE LAR_PaymentHeader = LAR_PaymenteHeader.LAR_PaymentHeader_ID)',Updated=TO_TIMESTAMP('2021-11-12 16:47:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003029
;

-- 12/11/2021 16:49:25 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET ColumnSQL='(SELECT SUM (COALESCE(DiferenciaValoracion, 0)) FROM C_PaymentAllocate WHERE LAR_PaymentHeader = LAR_PaymentHeader.LAR_PaymentHeader_ID)',Updated=TO_TIMESTAMP('2021-11-12 16:49:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003029
;

-- 12/11/2021 16:51:00 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET ColumnSQL='(SELECT SUM (COALESCE(DiferenciaValoracion, 0)) FROM C_PaymentAllocate WHERE LAR_PaymentHeader_ID = LAR_PaymentHeader.LAR_PaymentHeader_ID)',Updated=TO_TIMESTAMP('2021-11-12 16:51:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003029
;

-- 12/11/2021 16:56:41 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET ColumnSQL='(SELECT SUM (COALESCE(DiferenciaValoracionExt, 0)) FROM C_PaymentAllocate WHERE LAR_PaymentHeader_ID = LAR_PaymentHeader.LAR_PaymentHeader_ID)',Updated=TO_TIMESTAMP('2021-11-12 16:56:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004304
;

-- 12/11/2021 16:57:50 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET ColumnSQL='(SELECT SUM (COALESCE(PorcDiferenciaValoracion, 0)) FROM C_PaymentAllocate WHERE LAR_PaymentHeader_ID = LAR_PaymentHeader.LAR_PaymentHeader_ID)',Updated=TO_TIMESTAMP('2021-11-12 16:57:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003363
;

-- 12/11/2021 17:11:58 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET ColumnSQL='((SELECT SUM (COALESCE(PorcDiferenciaValoracion, 0)) FROM C_PaymentAllocate WHERE LAR_PaymentHeader_ID = LAR_PaymentHeader.LAR_PaymentHeader_ID) / (SELECT COUNT (*) FROM C_PaymentAllocate WHERE LAR_PaymentHeader_ID = LAR_PaymentHeader.LAR_PaymentHeader_ID AND PorcDiferenciaValoracion <> 0))',Updated=TO_TIMESTAMP('2021-11-12 17:11:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003363
;

-- 12/11/2021 17:14:08 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET ColumnSQL='((SELECT SUM (COALESCE(PorcDiferenciaValoracion, 0)) FROM C_PaymentAllocate WHERE LAR_PaymentHeader_ID = LAR_PaymentHeader.LAR_PaymentHeader_ID) / (SELECT COUNT (*) FROM C_PaymentAllocate WHERE LAR_PaymentHeader_ID = LAR_PaymentHeader.LAR_PaymentHeader_ID AND PorcDiferenciaValoracion != 0))',Updated=TO_TIMESTAMP('2021-11-12 17:14:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003363
;

-- 12/11/2021 17:35:13 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Column SET ColumnSQL='((SELECT SUM (COALESCE(PorcDiferenciaValoracion, 0)) FROM C_PaymentAllocate WHERE LAR_PaymentHeader_ID = LAR_PaymentHeader.LAR_PaymentHeader_ID) / (SELECT COALESCE(COUNT (*), 1) FROM C_PaymentAllocate WHERE LAR_PaymentHeader_ID = LAR_PaymentHeader.LAR_PaymentHeader_ID AND C_Currency_ID != LAR_PaymentHeader.C_Currency_ID))',Updated=TO_TIMESTAMP('2021-11-12 17:35:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003363
;

-- 12/11/2021 18:22:49 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3007562
;

-- 12/11/2021 18:22:49 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3007564
;

-- 12/11/2021 18:22:49 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000386
;

-- 12/11/2021 18:22:49 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3001296
;

-- 12/11/2021 18:22:49 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000602
;

-- 12/11/2021 18:22:49 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3007681
;

-- 12/11/2021 18:22:49 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000269
;

-- 12/11/2021 18:23:00 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2021-11-12 18:23:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007681
;

-- 12/11/2021 18:24:59 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET DisplayLogic='@TasaDelDia@ > 0',Updated=TO_TIMESTAMP('2021-11-12 18:24:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007681
;

-- 12/11/2021 18:30:45 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007665
;

-- 12/11/2021 18:30:45 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007667
;

-- 12/11/2021 18:30:45 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3007682
;

-- 12/11/2021 18:30:45 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3007661
;

-- 12/11/2021 18:30:45 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3007662
;

-- 12/11/2021 18:30:45 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3007663
;

-- 12/11/2021 18:30:45 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3007668
;

-- 12/11/2021 18:31:53 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3007663
;

-- 12/11/2021 18:31:53 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3007668
;

-- 12/11/2021 18:31:53 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3007661
;

-- 12/11/2021 18:31:53 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3007662
;

-- 12/11/2021 18:31:53 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3007682
;

-- 12/11/2021 18:32:10 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET DisplayLogic='@TasaDelDia@ > 0',Updated=TO_TIMESTAMP('2021-11-12 18:32:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007661
;

-- 12/11/2021 18:32:17 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET DisplayLogic='@TasaDelDia@ > 0',Updated=TO_TIMESTAMP('2021-11-12 18:32:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007662
;

-- 12/11/2021 18:32:23 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET DisplayLogic='@TasaDelDia@ > 0',Updated=TO_TIMESTAMP('2021-11-12 18:32:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007682
;

-- 12/11/2021 18:32:38 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2021-11-12 18:32:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007668
;

-- 12/11/2021 18:32:44 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2021-11-12 18:32:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007662
;

-- 12/11/2021 18:37:37 ART
-- ISSUE #114: Tasa de cambio en pestaña factura de Recibo/OP.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2021-11-12 18:37:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007661
;

-- Registración de script
SELECT register_migration_script_lar('0201_ISSUE-114.sql', 'LAR', '')
;
