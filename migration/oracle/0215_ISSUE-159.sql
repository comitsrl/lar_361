ALTER TABLE C_DocType ADD COLUMN Permite_Fecha_Futura character(1) NOT NULL DEFAULT 'Y'::bpchar;

-- 18/10/2022 22:07:50 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001348,'permite_fecha_futura','LAR','permite_fecha_futura','permite_fecha_futura',0,TO_DATE('2022-10-18 22:07:49','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-10-18 22:07:49','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 18/10/2022 22:07:50 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001348 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 18/10/2022 22:07:50 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005270,217,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001348,'N','Y','N','permite_fecha_futura','permite_fecha_futura',100,TO_DATE('2022-10-18 22:07:49','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2022-10-18 22:07:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/10/2022 22:07:50 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005270 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 18/10/2022 22:09:27 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Element SET ColumnName='Permite_Fecha_Futura', Name='Permite Fecha Futura', PrintName='Permite Fecha Futura',Updated=TO_DATE('2022-10-18 22:09:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001348
;

-- 18/10/2022 22:09:27 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001348
;

-- 18/10/2022 22:09:27 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Column SET ColumnName='Permite_Fecha_Futura', Name='Permite Fecha Futura', Description=NULL, Help=NULL WHERE AD_Element_ID=3001348
;

-- 18/10/2022 22:09:27 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Process_Para SET ColumnName='Permite_Fecha_Futura', Name='Permite Fecha Futura', Description=NULL, Help=NULL, AD_Element_ID=3001348 WHERE UPPER(ColumnName)='PERMITE_FECHA_FUTURA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 18/10/2022 22:09:27 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Process_Para SET ColumnName='Permite_Fecha_Futura', Name='Permite Fecha Futura', Description=NULL, Help=NULL WHERE AD_Element_ID=3001348 AND IsCentrallyMaintained='Y'
;

-- 18/10/2022 22:09:27 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET Name='Permite Fecha Futura', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001348) AND IsCentrallyMaintained='Y'
;

-- 18/10/2022 22:09:27 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_PrintFormatItem pi SET PrintName='Permite Fecha Futura', Name='Permite Fecha Futura' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001348)
;

-- 18/10/2022 22:09:51 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Element_Trl SET Name='Permite Fecha Futura',PrintName='Permite Fecha Futura',Updated=TO_DATE('2022-10-18 22:09:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001348 AND AD_Language='es_AR'
;

-- 18/10/2022 22:10:20 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Column_Trl SET Name='Permite Fecha Futura',Updated=TO_DATE('2022-10-18 22:10:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005270 AND AD_Language='es_AR'
;

-- 18/10/2022 22:10:40 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008050,1,'Y','N','N',3005270,'N','Y',167,'N','LAR','Permite Fecha Futura',100,0,TO_DATE('2022-10-18 22:10:39','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2022-10-18 22:10:39','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/10/2022 22:10:40 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008050 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3008050
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=10345
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=10346
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=10481
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=10480
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=58859
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=10371
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=10528
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=10340
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=200004
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=6567
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3125
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=1000015
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3001289
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000039
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000032
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000038
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000031
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000036
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000035
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000037
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000030
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3006569
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000034
;

-- 18/10/2022 22:13:25 ART
-- ISSUE #159: No permitir comprobantes con fecha futura.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3007034
;

-- Registración de script
SELECT register_migration_script_lar('0215_ISSUE-159.sql', 'LAR', '') FROM dual
;
