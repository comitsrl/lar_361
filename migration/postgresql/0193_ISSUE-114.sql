ALTER TABLE C_AllocationHdr ADD COLUMN C_ConversionType_ID numeric(10,0);
ALTER TABLE C_AllocationHdr ADD CONSTRAINT cconversiontype_callocation FOREIGN KEY (C_ConversionType_ID)
      REFERENCES C_ConversionType (C_ConversionType_ID) MATCH SIMPLE;

-- 27/08/2021 12:18:10 ART
-- ISSUE #114: Tipo de Cambio en cabecera de Asignación.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004178,735,'LAR',0,'N','N','N','The Currency Conversion Rate Type lets you define different type of rates, e.g. Spot, Corporate and/or Sell/Buy rates.','N',10,'N',19,'N',2278,'N','Y','N','Currency Conversion Rate Type','Currency Type','C_ConversionType_ID',100,TO_TIMESTAMP('2021-08-27 12:18:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2021-08-27 12:18:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/08/2021 12:18:10 ART
-- ISSUE #114: Tipo de Cambio en cabecera de Asignación.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004178 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/08/2021 12:19:46 ART
-- ISSUE #114: Tipo de Cambio en cabecera de Asignación.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007369,10,'Y','N','N',3004178,'N','Y',661,'N','The Currency Conversion Rate Type lets you define different type of rates, e.g. Spot, Corporate and/or Sell/Buy rates.','LAR','Currency Conversion Rate Type','Currency Type',100,0,TO_TIMESTAMP('2021-08-27 12:19:45','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-08-27 12:19:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/08/2021 12:19:46 ART
-- ISSUE #114: Tipo de Cambio en cabecera de Asignación.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007369 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/08/2021 12:19:47 ART
-- ISSUE #114: Tipo de Cambio en cabecera de Asignación.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007370,20,'Y','N','N',59034,'N','Y',661,'N','The ProcessedOn Date+Time save the exact moment (nanoseconds precision if allowed by the DB) when a document has been processed.','D','The date+time (expressed in decimal format) when the document has been processed','Processed On',100,0,TO_TIMESTAMP('2021-08-27 12:19:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2021-08-27 12:19:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/08/2021 12:19:47 ART
-- ISSUE #114: Tipo de Cambio en cabecera de Asignación.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007370 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/08/2021 12:19:56 ART
-- ISSUE #114: Tipo de Cambio en cabecera de Asignación.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007370
;

-- 27/08/2021 12:19:56 ART
-- ISSUE #114: Tipo de Cambio en cabecera de Asignación.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3007369
;

-- 27/08/2021 12:22:21 ART
-- ISSUE #114: Tipo de Cambio en cabecera de Asignación.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3007369
;

-- 27/08/2021 12:22:21 ART
-- ISSUE #114: Tipo de Cambio en cabecera de Asignación.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=10426
;

-- 27/08/2021 12:22:21 ART
-- ISSUE #114: Tipo de Cambio en cabecera de Asignación.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=10440
;

-- 27/08/2021 12:22:21 ART
-- ISSUE #114: Tipo de Cambio en cabecera de Asignación.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=10439
;

-- 27/08/2021 12:22:21 ART
-- ISSUE #114: Tipo de Cambio en cabecera de Asignación.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=10436
;

-- 27/08/2021 12:22:21 ART
-- ISSUE #114: Tipo de Cambio en cabecera de Asignación.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=10430
;

-- 27/08/2021 12:22:21 ART
-- ISSUE #114: Tipo de Cambio en cabecera de Asignación.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=10431
;

-- 27/08/2021 12:22:30 ART
-- ISSUE #114: Tipo de Cambio en cabecera de Asignación.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2021-08-27 12:22:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007369
;

-- 27/08/2021 13:04:20 ART
-- ISSUE #114: Tipo de Cambio en cabecera de Asignación.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=10431
;

-- 27/08/2021 13:04:20 ART
-- ISSUE #114: Tipo de Cambio en cabecera de Asignación.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=10430
;

-- 27/08/2021 13:24:13 ART
-- ISSUE #114: Tipo de Cambio en cabecera de Asignación.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2021-08-27 13:24:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007369
;

-- Registración de script
SELECT register_migration_script_lar('0193_ISSUE-114.sql', 'LAR', '')
;
