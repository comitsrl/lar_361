-- 18/10/2021 12:29:20 ART
-- ISSUE #114: Despliegue de campos en Recibos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007562,10,'Y','N','N',3004301,'N','Y',3000012,'N','Indicates the Currency to be used when processing or reporting on this record','LAR','The Currency for this record','Currency',100,0,TO_TIMESTAMP('2021-10-18 12:29:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-10-18 12:29:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/10/2021 12:29:20 ART
-- ISSUE #114: Despliegue de campos en Recibos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007562 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/10/2021 12:29:21 ART
-- ISSUE #114: Despliegue de campos en Recibos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007563,30,'Y','N','N',3004304,'N','Y',3000012,'N','U','Diferencia de Valoración Ext.',100,0,TO_TIMESTAMP('2021-10-18 12:29:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-10-18 12:29:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/10/2021 12:29:21 ART
-- ISSUE #114: Despliegue de campos en Recibos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007563 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/10/2021 12:29:21 ART
-- ISSUE #114: Despliegue de campos en Recibos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007564,10,'Y','N','N',3004302,'N','Y',3000012,'N','LAR','Moneda de Factura',100,0,TO_TIMESTAMP('2021-10-18 12:29:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-10-18 12:29:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/10/2021 12:29:21 ART
-- ISSUE #114: Despliegue de campos en Recibos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007564 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/10/2021 12:29:21 ART
-- ISSUE #114: Despliegue de campos en Recibos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007565,30,'Y','N','N',3004305,'N','Y',3000012,'N','U','Pagado en Tasa de Factura',100,0,TO_TIMESTAMP('2021-10-18 12:29:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-10-18 12:29:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/10/2021 12:29:21 ART
-- ISSUE #114: Despliegue de campos en Recibos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007565 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/10/2021 12:29:22 ART
-- ISSUE #114: Despliegue de campos en Recibos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007566,30,'Y','N','N',3004307,'N','Y',3000012,'N','LAR','Pagado en Tasa del Día',100,0,TO_TIMESTAMP('2021-10-18 12:29:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-10-18 12:29:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/10/2021 12:29:22 ART
-- ISSUE #114: Despliegue de campos en Recibos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007566 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/10/2021 12:33:05 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007563
;

-- 18/10/2021 12:33:05 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007565
;

-- 18/10/2021 12:33:05 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007566
;

-- 18/10/2021 12:33:05 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3007562
;

-- 18/10/2021 12:33:05 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3007564
;

-- 18/10/2021 12:33:29 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2021-10-18 12:33:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007564
;

-- 18/10/2021 12:33:53 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET SeqNo=122,Updated=TO_TIMESTAMP('2021-10-18 12:33:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007562
;

-- 18/10/2021 12:34:05 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET SeqNo=124,Updated=TO_TIMESTAMP('2021-10-18 12:34:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007564
;

-- 18/10/2021 12:37:12 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET DisplayLogic='@C_CurrencyTo_ID@!=118',Updated=TO_TIMESTAMP('2021-10-18 12:37:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005766
;

-- 18/10/2021 12:37:30 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET DisplayLogic='@C_CurrencyTo_ID@!=118',Updated=TO_TIMESTAMP('2021-10-18 12:37:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005767
;

-- 18/10/2021 13:25:34 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2021-10-18 13:25:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007562
;

-- 18/10/2021 13:25:42 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2021-10-18 13:25:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007564
;

-- 19/10/2021 16:59:29 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET DisplayLogic='@C_CurrencyTo_ID@=!118',Updated=TO_TIMESTAMP('2021-10-19 16:59:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005766
;

-- 19/10/2021 16:59:41 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET DisplayLogic='@C_CurrencyTo_ID@=!118',Updated=TO_TIMESTAMP('2021-10-19 16:59:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005767
;

-- 19/10/2021 17:07:13 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET DisplayLogic='@C_CurrencyTo_ID@!118',Updated=TO_TIMESTAMP('2021-10-19 17:07:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005766
;

-- 19/10/2021 17:07:22 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET DisplayLogic='@C_CurrencyTo_ID@!118',Updated=TO_TIMESTAMP('2021-10-19 17:07:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005767
;

-- 19/10/2021 17:32:12 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET DisplayLogic='@TasaDeCambio@>0',Updated=TO_TIMESTAMP('2021-10-19 17:32:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007564
;

-- 19/10/2021 17:48:56 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET DisplayLogic='@C_CurrencyTo_ID@ > 0 & @C_CurrencyTo_ID@!118',Updated=TO_TIMESTAMP('2021-10-19 17:48:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005767
;

-- 19/10/2021 17:49:57 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET DisplayLogic='@C_CurrencyTo_ID@ > 0 & @C_CurrencyTo_ID@!118',Updated=TO_TIMESTAMP('2021-10-19 17:49:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005766
;

-- 19/10/2021 19:03:09 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET DisplayLogic='@C_CurrencyTo_ID@ <= 0 | @C_CurrencyTo_ID@ = 118',Updated=TO_TIMESTAMP('2021-10-19 19:03:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001296
;

-- 19/10/2021 19:03:20 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET DisplayLogic='@C_CurrencyTo_ID@ <= 0 | @C_CurrencyTo_ID@ = 118',Updated=TO_TIMESTAMP('2021-10-19 19:03:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000602
;

-- 19/10/2021 19:10:36 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET DisplayLogic='@C_CurrencyTo_ID@ < 0 | @C_CurrencyTo_ID@ = 0 | @C_CurrencyTo_ID@ = 118',Updated=TO_TIMESTAMP('2021-10-19 19:10:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000602
;

-- 19/10/2021 19:11:14 ART
-- ISSUE #114: Despliegue de campos en Recibos.
UPDATE AD_Field SET DisplayLogic='@C_CurrencyTo_ID@ < 0 | @C_CurrencyTo_ID@ = 0 | @C_CurrencyTo_ID@ = 118',Updated=TO_TIMESTAMP('2021-10-19 19:11:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001296
;

-- Registración de script
SELECT register_migration_script_lar('0198_ISSUE-114.sql', 'LAR', '')
;
