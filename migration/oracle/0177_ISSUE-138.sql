-- @fchiappano ESTE SCRIPT FALLARA EN EL PROYECTO LAR_LEIMAT, YA QUE LA COLUMNA SQL QUE SE AGREGA, YA EXISTE EN ESTE PROYECTO.

-- 09/06/2021 19:57:25 ART
-- ISSUE 60: Mejorar registro de scripts de migración
INSERT INTO AD_Element (AD_Element_ID,ColumnName,Help,EntityType,Name,Description,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001139,'DocumentoNo','El número del documento es usualmente generado en automático por el sistema y determinado por el tipo del documento. Si el documento no se salva; el número preliminar se despliega entre "<>"','U','No. del Documento','Número de secuencia del documento para cada documento','No. del Documento',0,TO_DATE('2021-06-09 19:57:25','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-06-09 19:57:25','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 09/06/2021 19:57:25 ART
-- ISSUE 60: Mejorar registro de scripts de migración
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001139 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 09/06/2021 20:00:53 ART
-- ISSUE 60: Mejorar registro de scripts de migración
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,ReadOnlyLogic,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT i.DocumentNo FROM C_Invoice i WHERE i.C_Invoice_ID = C_Invoice.C_Invoice_ID)',3003927,318,'LAR',1,'N','N','Y',0,'El número del documento es usualmente generado en automático por el sistema y determinado por el tipo del documento. Si el documento no se salva; el número preliminar se despliega entre "<>"','N',30,'Y',10,'N','N',3001139,NULL,'N','Y','N','N','N','Número de secuencia del documento para cada documento','No. del Documento','DocumentoNo','N',100,TO_DATE('2021-06-09 20:00:53','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-06-09 20:00:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/06/2021 20:00:53 ART
-- ISSUE 60: Mejorar registro de scripts de migración
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003927 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/06/2021 20:02:31 ART
-- ISSUE 60: Mejorar registro de scripts de migración
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007054,30,'Y','N','N',3003927,'N','Y',263,'N','El número del documento es usualmente generado en automático por el sistema y determinado por el tipo del documento. Si el documento no se salva; el número preliminar se despliega entre "<>"','LAR','Número de secuencia del documento para cada documento','No. del Documento',100,0,TO_DATE('2021-06-09 20:02:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2021-06-09 20:02:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 09/06/2021 20:02:31 ART
-- ISSUE 60: Mejorar registro de scripts de migración
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007054 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/06/2021 20:03:14 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET SeqNo=50,Updated=TO_DATE('2021-06-09 20:03:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007054
;

-- 09/06/2021 20:04:01 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET IsDisplayed='N',Updated=TO_DATE('2021-06-09 20:04:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2779
;

-- 09/06/2021 20:07:56 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Column SET IsIdentifier='N', IsSelectionColumn='N',Updated=TO_DATE('2021-06-09 20:07:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003927
;

-- 10/06/2021 18:21:42 ART
-- Agrega_maxlines_en_C_DocType.sql
UPDATE AD_Field SET DisplayLength=20,Updated=TO_DATE('2021-06-10 18:21:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007054
;

-- 10/06/2021 18:31:34 ART
-- Agrega_maxlines_en_C_DocType.sql
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=200050
;

-- 10/06/2021 18:31:34 ART
-- Agrega_maxlines_en_C_DocType.sql
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=53258
;

-- 10/06/2021 18:31:35 ART
-- Agrega_maxlines_en_C_DocType.sql
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000028
;

-- 10/06/2021 18:31:35 ART
-- Agrega_maxlines_en_C_DocType.sql
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3002136
;

-- 10/06/2021 18:31:35 ART
-- Agrega_maxlines_en_C_DocType.sql
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3002142
;

-- 10/06/2021 18:31:35 ART
-- Agrega_maxlines_en_C_DocType.sql
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3002138
;

-- 10/06/2021 18:31:35 ART
-- Agrega_maxlines_en_C_DocType.sql
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3274
;

-- 10/06/2021 18:31:35 ART
-- Agrega_maxlines_en_C_DocType.sql
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3006683
;

-- 10/06/2021 18:31:35 ART
-- Agrega_maxlines_en_C_DocType.sql
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=2779
;

-- 10/06/2021 18:33:02 ART
-- Agrega_maxlines_en_C_DocType.sql
UPDATE AD_Field SET SortNo=1.000000000000,Updated=TO_DATE('2021-06-10 18:33:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2779
;

-- 10/06/2021 18:42:02 ART
-- Agrega_maxlines_en_C_DocType.sql
UPDATE AD_Field SET SortNo=-1.000000000000, SeqNo=50,Updated=TO_DATE('2021-06-10 18:42:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2779
;

-- 10/06/2021 18:44:42 ART
-- Agrega_maxlines_en_C_DocType.sql
UPDATE AD_Field SET DisplayLogic='@IsSOTrx@ = ''N''',Updated=TO_DATE('2021-06-10 18:44:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2779
;

-- 10/06/2021 18:45:19 ART
-- Agrega_maxlines_en_C_DocType.sql
UPDATE AD_Field SET DisplayLogic='@IsSOTrx@ = ''Y''',Updated=TO_DATE('2021-06-10 18:45:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007054
;

-- 10/06/2021 18:47:42 ART
-- Agrega_maxlines_en_C_DocType.sql
UPDATE AD_Field SET IsSameLine='Y', SeqNo=55,Updated=TO_DATE('2021-06-10 18:47:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007054
;

-- 10/06/2021 18:49:27 ART
-- Agrega_maxlines_en_C_DocType.sql
UPDATE AD_Field SET SortNo=NULL,Updated=TO_DATE('2021-06-10 18:49:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2779
;

-- 10/06/2021 19:17:55 ART
-- ISSUE 60: Mejorar registro de scripts de migración
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2021-06-10 19:17:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007054
;

-- Registración de script
SELECT register_migration_script_lar('0177_ISSUE-138.sql', 'LAR', '') FROM dual
;
