ALTER TABLE C_Payment ADD COLUMN Fecha_Cert_Retencion timestamp without time zone;

-- 02/08/2021 16:41:32 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001181,'fecha_cert_retencion','LAR','fecha_cert_retencion','fecha_cert_retencion',0,TO_DATE('2021-08-02 16:41:31','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-08-02 16:41:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 02/08/2021 16:41:32 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001181 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 02/08/2021 16:41:33 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004171,335,'LAR',0,'N','N','N','N',29,'N',16,'N',3001181,'N','Y','N','fecha_cert_retencion','fecha_cert_retencion',TO_DATE('2021-08-02 16:41:31','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-08-02 16:41:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2021 16:41:33 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004171 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/08/2021 16:42:37 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Column SET Name='Fecha de Certificado de Retención', ColumnName='Fecha_Cert_Retencion',Updated=TO_DATE('2021-08-02 16:42:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004171
;

-- 02/08/2021 16:42:37 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3004171
;

-- 02/08/2021 16:42:37 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET Name='Fecha de Certificado de Retención', Description=NULL, Help=NULL WHERE AD_Column_ID=3004171 AND IsCentrallyMaintained='Y'
;

-- 02/08/2021 16:42:44 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Column_Trl SET Name='Fecha de Certificado de Retención',Updated=TO_DATE('2021-08-02 16:42:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004171 AND AD_Language='es_AR'
;

-- 02/08/2021 16:43:01 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Element SET ColumnName='Fecha_Cert_Retencion', Name='Fecha de Certificado de Retención', PrintName='Fecha de Certificado de Retención',Updated=TO_DATE('2021-08-02 16:43:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001181
;

-- 02/08/2021 16:43:01 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001181
;

-- 02/08/2021 16:43:01 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Column SET ColumnName='Fecha_Cert_Retencion', Name='Fecha de Certificado de Retención', Description=NULL, Help=NULL WHERE AD_Element_ID=3001181
;

-- 02/08/2021 16:43:01 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Process_Para SET ColumnName='Fecha_Cert_Retencion', Name='Fecha de Certificado de Retención', Description=NULL, Help=NULL, AD_Element_ID=3001181 WHERE UPPER(ColumnName)='FECHA_CERT_RETENCION' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 02/08/2021 16:43:01 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Process_Para SET ColumnName='Fecha_Cert_Retencion', Name='Fecha de Certificado de Retención', Description=NULL, Help=NULL WHERE AD_Element_ID=3001181 AND IsCentrallyMaintained='Y'
;

-- 02/08/2021 16:43:01 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET Name='Fecha de Certificado de Retención', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001181) AND IsCentrallyMaintained='Y'
;

-- 02/08/2021 16:43:01 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_PrintFormatItem pi SET PrintName='Fecha de Certificado de Retención', Name='Fecha de Certificado de Retención' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001181)
;

-- 02/08/2021 16:43:11 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Element_Trl SET Name='Fecha de Certificado de Retención',PrintName='Fecha de Certificado de Retención',Updated=TO_DATE('2021-08-02 16:43:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001181 AND AD_Language='es_AR'
;

-- 02/08/2021 16:44:00 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007322,29,'Y','N','N',3004171,'N','Y',3000013,'N','LAR','Fecha de Certificado de Retención',100,0,TO_DATE('2021-08-02 16:43:59','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-08-02 16:43:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/08/2021 16:44:00 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007322 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000333
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3002719
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3002720
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3002803
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3003009
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000330
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000339
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000329
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000331
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3006614
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000335
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3003293
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000356
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000336
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000337
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000338
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000340
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000341
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000342
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000343
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000344
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000345
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000346
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000347
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000348
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000349
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000350
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000351
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000352
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3001624
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000318
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000322
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000319
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000320
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000325
;

-- 02/08/2021 16:46:13 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3007322
;

-- 02/08/2021 16:46:29 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-08-02 16:46:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007322
;

-- 02/08/2021 16:48:20 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET DisplayLogic='@C_Invoice_ID@^'''' &  @EsRetencionSufrida@=''Y''',Updated=TO_DATE('2021-08-02 16:48:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007322
;

-- 02/08/2021 16:48:33 ART
-- ISSUE #81: Fecha de certificado de retención en recibos.
UPDATE AD_Field SET DisplayLogic='@C_Invoice_ID@^'''' &  @EsRetencionSufrida@=''Y''',Updated=TO_DATE('2021-08-02 16:48:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000325
;

-- Registración de script
SELECT register_migration_script_lar('0188_ISSUE-81.sql', 'LAR', '') FROM dual
;
