ALTER TABLE LAR_Medio_Pago ADD COLUMN LAR_Quick_Response_ID numeric(10,0);
ALTER TABLE LAR_Medio_Pago ADD CONSTRAINT larmediopago_LARQuickResponse FOREIGN KEY (LAR_Quick_Response_ID)
      REFERENCES LAR_Tarjeta_Credito (LAR_Tarjeta_Credito_ID) MATCH SIMPLE;

-- 14/06/2021 18:39:44 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Ref_Table SET WhereClause='LAR_Tarjeta_Credito.EsQR = ''Y''', OrderByClause='LAR_Tarjeta_Credito.Name',Updated=TO_TIMESTAMP('2021-06-14 18:39:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000124
;

-- 14/06/2021 19:07:18 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,IsMandatory,Version,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003932,3000032,'LAR','N',0,'N','N','N',10,'N',19,'N',3001141,'N','Y','N','Billetera Digital','LAR_Quick_Response_ID',TO_TIMESTAMP('2021-06-14 19:07:18','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2021-06-14 19:07:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/06/2021 19:07:18 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003932 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/06/2021 19:07:58 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007075,10,'Y','N','N',3003932,'N','Y',3000056,'N','LAR','Billetera Digital',100,0,'Y',TO_TIMESTAMP('2021-06-14 19:07:58','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2021-06-14 19:07:58','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/06/2021 19:07:58 ART
-- ISSUE #80: Nueva forma de pago QR.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007075 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/06/2021 19:08:07 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3007075
;

-- 14/06/2021 19:08:07 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3001888
;

-- 14/06/2021 19:08:45 ART
-- ISSUE #80: Nueva forma de pago QR.
UPDATE AD_Field SET DisplayLogic='@TenderType@=''Q''',Updated=TO_TIMESTAMP('2021-06-14 19:08:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007075
;

-- Registración de script
SELECT register_migration_script_lar('0179_ISSUE-80.sql', 'LAR', '')
;
