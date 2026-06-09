-- 2026-06-08
-- ISSUE #174: Agrega fecha de vencimiento de cheque a la liquidacion operativa.

SET search_path TO adempiere, pg_catalog;

ALTER TABLE adempiere.LAR_CardSettlement
    ADD COLUMN IF NOT EXISTS Fecha_Venc_Cheque timestamp without time zone;

INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,FieldLength,IsParent,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Description,Help,CreatedBy,UpdatedBy,Created,Updated,AD_Client_ID,AD_Org_ID,IsActive)
VALUES (3005988,3000284,'LAR',0,'N','N','N',29,'N','N',15,'N',3000419,'N','Y','N','Fecha de Venc. Cheque','Fecha_Venc_Cheque','Fecha de vencimiento del cheque',NULL,100,100,TO_TIMESTAMP('2026-06-08 10:00:00','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 10:00:00','YYYY-MM-DD HH24:MI:SS'),0,0,'Y')
;

INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID,Name,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Column_ID,t.Name,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Column t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Column_ID=3005988
  AND NOT EXISTS (SELECT 1 FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

UPDATE AD_Column_Trl
SET Name='Fecha de Venc. Cheque', IsTranslated='Y', Updated=TO_TIMESTAMP('2026-06-08 10:00:00','YYYY-MM-DD HH24:MI:SS'), UpdatedBy=100
WHERE AD_Column_ID=3005988 AND AD_Language='es_AR'
;

INSERT INTO AD_Field (AD_Field_ID,AD_Tab_ID,AD_Column_ID,DisplayLength,IsDisplayed,SeqNo,IsSameLine,IsHeading,IsFieldOnly,IsCentrallyMaintained,IsReadOnly,IsEncrypted,EntityType,Name,Description,Help,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,Created,Updated,IsActive)
VALUES (3009509,3000319,3005988,29,'Y',145,'N','N','N','N','N','N','LAR','Fecha de Venc. Cheque','Fecha de vencimiento del cheque',NULL,0,0,100,100,TO_TIMESTAMP('2026-06-08 10:00:00','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2026-06-08 10:00:00','YYYY-MM-DD HH24:MI:SS'),'Y')
;

INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID,Help,Description,Name,IsTranslated,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy)
SELECT l.AD_Language,t.AD_Field_ID,t.Help,t.Description,t.Name,'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.CreatedBy,t.Updated,t.UpdatedBy
FROM AD_Language l, AD_Field t
WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N'
  AND t.AD_Field_ID=3009509
  AND NOT EXISTS (SELECT 1 FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

UPDATE AD_Field_Trl
SET Name='Fecha de Venc. Cheque', Description='Fecha de vencimiento del cheque', IsTranslated='Y', Updated=TO_TIMESTAMP('2026-06-08 10:00:00','YYYY-MM-DD HH24:MI:SS'), UpdatedBy=100
WHERE AD_Field_ID=3009509 AND AD_Language='es_AR'
;

UPDATE AD_Field
SET DisplayLogic='@OperationType@=''C''', IsReadOnly='N', Updated=TO_TIMESTAMP('2026-06-08 10:00:00','YYYY-MM-DD HH24:MI:SS'), UpdatedBy=100
WHERE AD_Field_ID=3009509
;

-- 08/06/2026 9:14:37 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2026-06-08 09:14:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009508
;

-- 08/06/2026 9:14:46 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3009508
;

-- 08/06/2026 9:14:46 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3009492
;

-- 08/06/2026 9:14:46 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3009493
;

-- 08/06/2026 9:14:46 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3009494
;

-- 08/06/2026 9:14:46 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3009495
;

-- 08/06/2026 9:14:46 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3009496
;

-- 08/06/2026 9:14:46 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3009497
;

-- 08/06/2026 9:14:46 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3009509
;

-- 08/06/2026 9:14:46 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3009498
;

-- 08/06/2026 9:14:46 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3009499
;

-- 08/06/2026 9:14:46 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3009500
;

-- 08/06/2026 9:14:46 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3009501
;

-- 08/06/2026 9:14:46 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3009502
;

-- 08/06/2026 9:14:46 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3009503
;

-- 08/06/2026 9:14:46 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3009484
;

-- 08/06/2026 9:14:46 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3009485
;

-- 08/06/2026 9:15:16 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2026-06-08 09:15:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009497
;

-- 08/06/2026 9:15:20 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2026-06-08 09:15:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009509
;

-- 08/06/2026 9:18:12 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2026-06-08 09:18:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009501
;

-- 08/06/2026 9:28:36 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_TIMESTAMP('2026-06-08 09:28:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005974
;

-- 08/06/2026 9:28:48 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_TIMESTAMP('2026-06-08 09:28:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005972
;

-- 08/06/2026 9:28:53 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_TIMESTAMP('2026-06-08 09:28:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005981
;

-- 08/06/2026 9:29:01 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_TIMESTAMP('2026-06-08 09:29:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005966
;

-- 08/06/2026 9:29:09 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_TIMESTAMP('2026-06-08 09:29:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005970
;

-- 08/06/2026 9:29:22 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_TIMESTAMP('2026-06-08 09:29:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005988
;

-- 08/06/2026 9:29:35 ART
-- ISSUE#174: Liquidación Operativa Tarjetas
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_TIMESTAMP('2026-06-08 09:29:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005973
;

SELECT register_migration_script_lar('0250_ISSUE-174.sql', 'LAR', '')
;
