-- 02/02/2014 11:35:28 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field_Trl SET Name='Relacionado a un Activo',Updated=TO_DATE('2014-02-02 11:35:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=56249 AND AD_Language='es_AR'
;

-- 02/02/2014 11:37:13 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field_Trl SET Name='Diario Nº',Description='Diario Nº',Help='Identifica al grupo de líneas correspondientes al Diario que representa una transacción lógica del negocio.',Updated=TO_DATE('2014-02-02 11:37:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=716 AND AD_Language='es_AR'
;

-- 02/02/2014 11:39:02 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field_Trl SET Name='Diario No.',Description='Número de secuencia del Diario.',Help='El número del documento es usualmente generado en automático por el sistema y determinado por el tipo del documento. Si el documento no se graba; el número preliminar se despliega entre "<>"',Updated=TO_DATE('2014-02-02 11:39:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=698 AND AD_Language='es_AR'
;

-- 02/02/2014 11:39:08 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2014-02-02 11:39:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=698
;

-- 02/02/2014 11:39:33 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2014-02-02 11:39:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=716
;

-- 02/02/2014 11:39:42 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field_Trl SET Name='Diario No.',Description='Diario No.',Updated=TO_DATE('2014-02-02 11:39:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=716 AND AD_Language='es_AR'
;

-- 02/02/2014 11:42:03 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2014-02-02 11:42:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=56249
;

-- 02/02/2014 11:53:35 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
INSERT INTO AD_Element (AD_Element_ID,ColumnName,Help,EntityType,Name,Description,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000155,'VC_Description','A description is limited to 255 characters.','LAR','VC_Description','Valid Combination Description. Optional short description of the record','VC_Description',0,TO_DATE('2014-02-02 11:53:34','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2014-02-02 11:53:34','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 02/02/2014 11:53:35 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000155 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 02/02/2014 11:58:34 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT Description FROM C_ValidCombination vc WHERE GL_JournalLine.C_ValidCombination_ID = vc.C_ValidCombination_ID)',3000872,226,'U',1,'N','N','N',0,'A description is limited to 255 characters.','N',255,'Y',10,'Y','N',3000155,'N','Y','N','N','N','Valid Combination Description. Optional short description of the record','VC_Description','VC_Description','N',100,TO_DATE('2014-02-02 11:58:33','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2014-02-02 11:58:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/02/2014 11:58:34 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000872 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/02/2014 12:00:33 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,AD_FieldGroup_ID,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3001408,60,'Y','N','N',3000872,'N',210,'Y',161,'N','A description is limited to 255 characters.',104,'LAR','Valid Combination Description. Optional short description of the record','VC_Description',100,0,TO_DATE('2014-02-02 12:00:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2014-02-02 12:00:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/02/2014 12:00:33 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3001408 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=713
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=10325
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=714
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=903
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=716
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=724
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=725
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=715
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=884
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=727
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=1293
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=8645
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=895
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=4724
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3001408
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=56249
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=56250
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=56251
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=728
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=729
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=730
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=731
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=1294
;

-- 02/02/2014 12:00:53 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=1295
;

-- 02/02/2014 12:01:07 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2014-02-02 12:01:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001408
;

-- 02/02/2014 12:03:03 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2014-02-02 12:03:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001408
;

-- 02/02/2014 12:03:56 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Descripción',Description='Descripción de la Combinación Contable.',Help='En esta ventana se muestran hasta 60 caracteres de la Descripción.',Updated=TO_DATE('2014-02-02 12:03:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001408 AND AD_Language='es_AR'
;

-- 02/02/2014 12:06:34 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Column SET IsKey='Y', IsUpdateable='N', IsAllowCopy='N',Updated=TO_DATE('2014-02-02 12:06:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=1794
;

-- 02/02/2014 12:07:03 ART
-- Agregar Campo Descripción (Combinación Contable)  a la Pestaña Línea, Ventana Diario de CG
UPDATE AD_Column SET IsKey='Y', IsUpdateable='N', IsAllowCopy='N',Updated=TO_DATE('2014-02-02 12:07:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=1654
;

SELECT register_migration_script_lar('0055_VCDescription_Pestaña_Linea_Ventana_DiarioCG.sql','LAR','') FROM dual;
