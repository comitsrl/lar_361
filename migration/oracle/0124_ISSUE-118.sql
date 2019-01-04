ALTER TABLE LAR_PaymentHeader ADD COLUMN Description character varying(255);

-- 17/12/2018 18:18:27 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003364,3000010,'LAR',0,'N','N','N','A description is limited to 255 characters.','N',255,'Y',10,'N',275,'N','Y','N','Optional short description of the record','Description','Description',TO_DATE('2018-12-17 18:18:27','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2018-12-17 18:18:27','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 17/12/2018 18:18:27 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003364 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 17/12/2018 18:30:11 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006258,255,'Y','N','N',3003364,'N','Y',3000012,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,'Y',TO_DATE('2018-12-17 18:30:11','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2018-12-17 18:30:11','YYYY-MM-DD HH24:MI:SS'))
;

-- 17/12/2018 18:30:11 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006258 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/12/2018 18:31:58 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3006258
;

-- 17/12/2018 18:31:58 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3000280
;

-- 17/12/2018 18:31:58 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000266
;

-- 17/12/2018 18:31:58 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000267
;

-- 17/12/2018 18:31:58 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000901
;

-- 17/12/2018 18:31:58 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000271
;

-- 17/12/2018 18:31:58 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000386
;

-- 17/12/2018 18:31:58 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000602
;

-- 17/12/2018 18:31:58 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000269
;

-- 17/12/2018 18:32:27 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006259,255,'Y','N','N',3003364,'N','Y',3000023,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,'Y',TO_DATE('2018-12-17 18:32:27','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2018-12-17 18:32:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 17/12/2018 18:32:27 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006259 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/12/2018 18:32:41 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3006259
;

-- 17/12/2018 18:32:41 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3000759
;

-- 17/12/2018 18:32:41 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000752
;

-- 17/12/2018 18:32:41 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000760
;

-- 17/12/2018 18:32:41 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000761
;

-- 17/12/2018 18:32:41 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000763
;

-- 17/12/2018 18:32:41 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000764
;

-- 17/12/2018 18:32:41 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000765
;

-- 17/12/2018 18:32:41 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000766
;

-- 17/12/2018 18:32:41 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000767
;

-- 17/12/2018 18:32:41 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000768
;

-- 17/12/2018 18:34:31 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006260,255,'Y','N','N',3003364,'N','Y',3000015,'N','A description is limited to 255 characters.','LAR','Optional short description of the record','Description',100,0,'Y',TO_DATE('2018-12-17 18:34:31','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2018-12-17 18:34:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 17/12/2018 18:34:31 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006260 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 17/12/2018 18:35:04 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3006260
;

-- 17/12/2018 18:35:04 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3000396
;

-- 17/12/2018 18:35:04 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000389
;

-- 17/12/2018 18:35:04 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000397
;

-- 17/12/2018 18:35:04 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000388
;

-- 17/12/2018 18:35:04 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000398
;

-- 17/12/2018 18:35:04 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000899
;

-- 17/12/2018 18:35:04 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000401
;

-- 17/12/2018 18:35:04 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000400
;

-- 17/12/2018 18:35:04 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3001147
;

-- 17/12/2018 18:35:04 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3003315
;

-- 17/12/2018 18:35:04 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000600
;

-- 17/12/2018 18:35:04 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3001142
;

-- 17/12/2018 18:35:04 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000402
;

-- 17/12/2018 19:37:39 ART
-- ISSUE #118: Correcciones ventana Recibos / Ordenes de Pago.
UPDATE AD_Column SET Callout='org.compiere.model.CalloutPayment.tenderType',Updated=TO_DATE('2018-12-17 19:37:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=5046
;

-- Registración de script
SELECT register_migration_script_lar('0124_ISSUE-118.sql', 'LAR', '') FROM dual
;
