ALTER TABLE C_DocType ADD COLUMN EsDevolucion character(1) COLLATE pg_catalog."default" NOT NULL DEFAULT 'N'::bpchar;
ALTER TABLE C_DocType ADD CONSTRAINT c_doctype_esdevolucion_check CHECK (EsDevolucion = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));

-- 19/09/2025 13:13:06 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001519,'esdevolucion','LAR','esdevolucion','esdevolucion',0,TO_TIMESTAMP('2025-09-19 13:13:05','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-09-19 13:13:05','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 19/09/2025 13:13:06 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001519 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 19/09/2025 13:13:06 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005916,217,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001519,'N','Y','N','esdevolucion','esdevolucion',100,TO_TIMESTAMP('2025-09-19 13:13:05','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2025-09-19 13:13:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 19/09/2025 13:13:06 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005916 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 19/09/2025 13:13:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='EsDevolucion', Name='Es Devolución', PrintName='Es Devolución',Updated=TO_TIMESTAMP('2025-09-19 13:13:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001519
;

-- 19/09/2025 13:13:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001519
;

-- 19/09/2025 13:13:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='EsDevolucion', Name='Es Devolución', Description=NULL, Help=NULL WHERE AD_Element_ID=3001519
;

-- 19/09/2025 13:13:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='EsDevolucion', Name='Es Devolución', Description=NULL, Help=NULL, AD_Element_ID=3001519 WHERE UPPER(ColumnName)='ESDEVOLUCION' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 19/09/2025 13:13:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='EsDevolucion', Name='Es Devolución', Description=NULL, Help=NULL WHERE AD_Element_ID=3001519 AND IsCentrallyMaintained='Y'
;

-- 19/09/2025 13:13:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Es Devolución', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001519) AND IsCentrallyMaintained='Y'
;

-- 19/09/2025 13:13:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_PrintFormatItem SET PrintName='Es Devolución', Name='Es Devolución' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001519)
;

-- 19/09/2025 13:13:59 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Es Devolución',PrintName='Es Devolución',Updated=TO_TIMESTAMP('2025-09-19 13:13:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001519 AND AD_Language='es_AR'
;

-- 19/09/2025 13:14:41 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Es Devolución',Updated=TO_TIMESTAMP('2025-09-19 13:14:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005916 AND AD_Language='es_AR'
;

-- 19/09/2025 13:15:11 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3009450,1,'Y','N','N',3005916,'N','Y',167,'N','LAR','Es Devolución',100,0,TO_TIMESTAMP('2025-09-19 13:15:11','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_TIMESTAMP('2025-09-19 13:15:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 19/09/2025 13:15:11 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3009450 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3009450
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3072
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3071
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3073
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=807
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=808
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=54233
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=54230
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=54232
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3008050
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=10345
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=10346
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=10481
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=10480
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=58859
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=10371
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=10528
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=10340
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=200004
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=6567
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3125
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=1000015
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3001289
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000039
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000032
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000038
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000031
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000036
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000035
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000037
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000030
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3006569
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000034
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3007034
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3009292
;

-- 19/09/2025 13:15:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3009293
;

-- 19/09/2025 13:16:02 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2025-09-19 13:16:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3009450
;
-- Registración de script
SELECT register_migration_script_lar('0240_ISSUE-173.sql', 'LAR', '')
;
