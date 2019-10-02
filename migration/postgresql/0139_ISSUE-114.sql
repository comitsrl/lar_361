ALTER TABLE C_AllocationLine ADD COLUMN TasaDeCambio numeric NOT NULL DEFAULT 0;

-- 27/09/2019 19:04:28 ART
-- ISSUE #114: Tasa de Cambio en Asignaciones.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003530,390,'LAR',0,'Y','N','N','N',131089,'N',22,'N',3000867,'N','Y','N','Tasa de Cambio','TasaDeCambio',100,TO_TIMESTAMP('2019-09-27 19:04:27','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2019-09-27 19:04:27','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/09/2019 19:04:28 ART
-- ISSUE #114: Tasa de Cambio en Asignaciones.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003530 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/09/2019 19:04:45 ART
-- ISSUE #114: Tasa de Cambio en Asignaciones.
UPDATE AD_Column SET FieldLength=20,Updated=TO_TIMESTAMP('2019-09-27 19:04:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003530
;

-- 27/09/2019 19:05:21 ART
-- ISSUE #114: Tasa de Cambio en Asignaciones.
UPDATE AD_Column SET AD_Reference_ID=37,Updated=TO_TIMESTAMP('2019-09-27 19:05:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003530
;

-- 27/09/2019 19:10:56 ART
-- ISSUE #114: Tasa de Cambio en Asignaciones.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3006612,20,'Y','N','N',3003530,'N','Y',349,'N','LAR','Tasa de Cambio',100,0,TO_TIMESTAMP('2019-09-27 19:10:56','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2019-09-27 19:10:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/09/2019 19:10:56 ART
-- ISSUE #114: Tasa de Cambio en Asignaciones.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006612 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/09/2019 19:11:27 ART
-- ISSUE #114: Tasa de Cambio en Asignaciones.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3006612
;

-- 27/09/2019 19:11:27 ART
-- ISSUE #114: Tasa de Cambio en Asignaciones.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=4373
;

-- 27/09/2019 19:11:27 ART
-- ISSUE #114: Tasa de Cambio en Asignaciones.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=4372
;

-- 27/09/2019 19:11:27 ART
-- ISSUE #114: Tasa de Cambio en Asignaciones.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=4371
;

-- 27/09/2019 19:11:27 ART
-- ISSUE #114: Tasa de Cambio en Asignaciones.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3003721
;

-- 27/09/2019 19:11:27 ART
-- ISSUE #114: Tasa de Cambio en Asignaciones.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=4368
;

-- 27/09/2019 19:11:27 ART
-- ISSUE #114: Tasa de Cambio en Asignaciones.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=4374
;

-- 27/09/2019 19:11:27 ART
-- ISSUE #114: Tasa de Cambio en Asignaciones.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=4375
;

-- 27/09/2019 19:11:27 ART
-- ISSUE #114: Tasa de Cambio en Asignaciones.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=4387
;

-- 27/09/2019 19:11:27 ART
-- ISSUE #114: Tasa de Cambio en Asignaciones.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=8931
;

-- 27/09/2019 19:11:27 ART
-- ISSUE #114: Tasa de Cambio en Asignaciones.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=4380
;

-- 27/09/2019 19:11:27 ART
-- ISSUE #114: Tasa de Cambio en Asignaciones.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3006611
;

-- 27/09/2019 19:11:37 ART
-- ISSUE #114: Tasa de Cambio en Asignaciones.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2019-09-27 19:11:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006612
;

-- Registración de script
SELECT register_migration_script_lar('0139_ISSUE-114.sql', 'LAR', '')
;
