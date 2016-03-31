ALTER TABLE C_Invoice ADD COLUMN cae character varying(14);
ALTER TABLE C_Invoice ADD COLUMN vtocae timestamp without time zone;
ALTER TABLE C_Invoice ADD COLUMN caeerror character varying(255);
ALTER TABLE C_Invoice ADD COLUMN caecbte integer;
ALTER TABLE C_Invoice ADD COLUMN idcae character varying(15);
ALTER TABLE C_Invoice ADD COLUMN NumeroComprobante integer;

ALTER TABLE C_Currency ADD COLUMN WSFECode character(3);

ALTER TABLE C_Tax ADD COLUMN WSFECode integer;
ALTER TABLE C_Tax ADD COLUMN IsPerception character(1) NOT NULL DEFAULT 'N'::bpchar;
ALTER TABLE C_Tax ADD CONSTRAINT c_tax_isperception_check CHECK (isperception = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));

-- 28/03/2016 17:44:08 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000270,'wsfecode','LAR','wsfecode','wsfecode',0,TO_DATE('2016-03-28 17:44:08','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-03-28 17:44:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 28/03/2016 17:44:08 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000270 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 28/03/2016 17:44:08 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001375,261,'LAR',0,'N','N','N','N',10,'N',11,'N',3000270,'N','Y','N','wsfecode','wsfecode',100,TO_DATE('2016-03-28 17:44:08','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-03-28 17:44:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/03/2016 17:44:08 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001375 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/03/2016 17:44:09 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000271,'isperception','LAR','isperception','isperception',0,TO_DATE('2016-03-28 17:44:08','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-03-28 17:44:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 28/03/2016 17:44:09 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000271 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 28/03/2016 17:44:09 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001376,261,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000271,'N','Y','N','isperception','isperception',100,TO_DATE('2016-03-28 17:44:08','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-03-28 17:44:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/03/2016 17:44:09 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001376 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/03/2016 17:45:19 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element SET ColumnName='IsPerception', Name='Es Percepción', PrintName='Es Percepción',Updated=TO_DATE('2016-03-28 17:45:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000271
;

-- 28/03/2016 17:45:19 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000271
;

-- 28/03/2016 17:45:19 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column SET ColumnName='IsPerception', Name='Es Percepción', Description=NULL, Help=NULL WHERE AD_Element_ID=3000271
;

-- 28/03/2016 17:45:19 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='IsPerception', Name='Es Percepción', Description=NULL, Help=NULL, AD_Element_ID=3000271 WHERE UPPER(ColumnName)='ISPERCEPTION' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 28/03/2016 17:45:19 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='IsPerception', Name='Es Percepción', Description=NULL, Help=NULL WHERE AD_Element_ID=3000271 AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 17:45:19 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET Name='Es Percepción', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000271) AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 17:45:19 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_PrintFormatItem pi SET PrintName='Es Percepción', Name='Es Percepción' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000271)
;

-- 28/03/2016 17:45:27 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element_Trl SET Name='Es Percepción',PrintName='Es Percepción',Updated=TO_DATE('2016-03-28 17:45:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000271 AND AD_Language='es_AR'
;

-- 28/03/2016 17:46:44 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column SET Name='WSFECode', ColumnName='WSFECode',Updated=TO_DATE('2016-03-28 17:46:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001375
;

-- 28/03/2016 17:46:44 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001375
;

-- 28/03/2016 17:46:44 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET Name='WSFECode', Description=NULL, Help=NULL WHERE AD_Column_ID=3001375 AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 17:47:01 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element SET ColumnName='WSFECode', Name='WSFECode', PrintName='WSFECode',Updated=TO_DATE('2016-03-28 17:47:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000270
;

-- 28/03/2016 17:47:01 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000270
;

-- 28/03/2016 17:47:01 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column SET ColumnName='WSFECode', Name='WSFECode', Description=NULL, Help=NULL WHERE AD_Element_ID=3000270
;

-- 28/03/2016 17:47:01 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='WSFECode', Name='WSFECode', Description=NULL, Help=NULL, AD_Element_ID=3000270 WHERE UPPER(ColumnName)='WSFECODE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 28/03/2016 17:47:01 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='WSFECode', Name='WSFECode', Description=NULL, Help=NULL WHERE AD_Element_ID=3000270 AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 17:47:01 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET Name='WSFECode', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000270) AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 17:47:01 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_PrintFormatItem pi SET PrintName='WSFECode', Name='WSFECode' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000270)
;

-- 28/03/2016 17:48:07 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element_Trl SET Name='Código WSFE',PrintName='Código WSFE',Updated=TO_DATE('2016-03-28 17:48:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000270 AND AD_Language='es_AR'
;

-- 28/03/2016 17:48:29 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column_Trl SET Name='Código WSFE',Updated=TO_DATE('2016-03-28 17:48:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001375 AND AD_Language='es_AR'
;

-- 28/03/2016 17:49:59 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,AD_Org_ID,UpdatedBy,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002132,1,'Y','N','N',3001376,'N','Y',174,'N','LAR','Es Percepción',0,100,'Y',TO_DATE('2016-03-28 17:49:59','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-03-28 17:49:59','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/03/2016 17:49:59 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002132 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/03/2016 17:50:00 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,AD_Org_ID,UpdatedBy,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002133,10,'Y','N','N',3001375,'N','Y',174,'N','LAR','WSFECode',0,100,'Y',TO_DATE('2016-03-28 17:49:59','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-03-28 17:49:59','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/03/2016 17:50:00 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002133 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/03/2016 17:51:53 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2016-03-28 17:51:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002132
;

-- 28/03/2016 17:53:31 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001377,141,'LAR',0,'N','N','N','N',3,'N',17,'N',3000270,'N','Y','N','WSFECode','WSFECode',100,TO_DATE('2016-03-28 17:53:30','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-03-28 17:53:30','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/03/2016 17:53:31 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001377 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/03/2016 17:54:27 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column_Trl SET Name='Código WSFE',Updated=TO_DATE('2016-03-28 17:54:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001377 AND AD_Language='es_AR'
;

-- 28/03/2016 17:55:21 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,AD_Org_ID,UpdatedBy,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002134,14,'Y','N','N',52074,'N','Y',151,'N','D','Used to Round Off Payment Amount','Round Off Factor',0,100,'Y',TO_DATE('2016-03-28 17:55:20','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-03-28 17:55:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/03/2016 17:55:21 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002134 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/03/2016 17:55:21 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,AD_Org_ID,UpdatedBy,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002135,3,'Y','N','N',3001377,'N','Y',151,'N','LAR','WSFECode',0,100,'Y',TO_DATE('2016-03-28 17:55:21','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-03-28 17:55:21','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/03/2016 17:55:21 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002135 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/03/2016 17:55:46 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=412
;

-- 28/03/2016 17:55:46 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=410
;

-- 28/03/2016 17:55:46 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=411
;

-- 28/03/2016 17:55:46 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=403
;

-- 28/03/2016 17:55:46 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002134
;

-- 28/03/2016 17:55:46 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=413
;

-- 28/03/2016 17:55:46 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=10,IsDisplayed='Y' WHERE AD_Field_ID=404
;

-- 28/03/2016 17:55:46 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=20,IsDisplayed='Y' WHERE AD_Field_ID=2023
;

-- 28/03/2016 17:55:46 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=30,IsDisplayed='Y' WHERE AD_Field_ID=405
;

-- 28/03/2016 17:55:46 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=406
;

-- 28/03/2016 17:55:46 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=407
;

-- 28/03/2016 17:55:46 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=414
;

-- 28/03/2016 17:55:46 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=408
;

-- 28/03/2016 17:55:46 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=409
;

-- 28/03/2016 17:55:46 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3002135
;

-- 28/03/2016 17:57:16 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000272,'cae','LAR','cae','cae',0,TO_DATE('2016-03-28 17:57:16','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-03-28 17:57:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 28/03/2016 17:57:16 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000272 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 28/03/2016 17:57:16 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001378,318,'LAR',0,'N','N','N','N',14,'N',10,'N',3000272,'N','Y','N','cae','cae',100,TO_DATE('2016-03-28 17:57:16','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-03-28 17:57:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/03/2016 17:57:16 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001378 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/03/2016 17:57:16 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000273,'vtocae','LAR','vtocae','vtocae',0,TO_DATE('2016-03-28 17:57:16','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-03-28 17:57:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 28/03/2016 17:57:16 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000273 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 28/03/2016 17:57:16 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001379,318,'LAR',0,'N','N','N','N',29,'N',16,'N',3000273,'N','Y','N','vtocae','vtocae',100,TO_DATE('2016-03-28 17:57:16','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-03-28 17:57:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/03/2016 17:57:16 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001379 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/03/2016 17:57:17 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000274,'caeerror','LAR','caeerror','caeerror',0,TO_DATE('2016-03-28 17:57:16','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-03-28 17:57:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 28/03/2016 17:57:17 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000274 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 28/03/2016 17:57:17 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001380,318,'LAR',0,'N','N','N','N',255,'N',10,'N',3000274,'N','Y','N','caeerror','caeerror',100,TO_DATE('2016-03-28 17:57:16','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-03-28 17:57:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/03/2016 17:57:17 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001380 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/03/2016 17:57:17 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000275,'caecbte','LAR','caecbte','caecbte',0,TO_DATE('2016-03-28 17:57:17','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-03-28 17:57:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 28/03/2016 17:57:17 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000275 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 28/03/2016 17:57:17 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001381,318,'LAR',0,'N','N','N','N',10,'N',11,'N',3000275,'N','Y','N','caecbte','caecbte',100,TO_DATE('2016-03-28 17:57:17','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-03-28 17:57:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/03/2016 17:57:17 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001381 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/03/2016 17:57:17 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000276,'idcae','LAR','idcae','idcae',0,TO_DATE('2016-03-28 17:57:17','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-03-28 17:57:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 28/03/2016 17:57:17 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000276 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 28/03/2016 17:57:17 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001382,318,'LAR',0,'N','N','N','N',15,'N',10,'N',3000276,'N','Y','N','idcae','idcae',100,TO_DATE('2016-03-28 17:57:17','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-03-28 17:57:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/03/2016 17:57:17 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001382 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/03/2016 17:57:17 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000277,'numerocomprobante','LAR','numerocomprobante','numerocomprobante',0,TO_DATE('2016-03-28 17:57:17','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-03-28 17:57:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 28/03/2016 17:57:18 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000277 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 28/03/2016 17:57:18 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001383,318,'LAR',0,'N','N','N','N',10,'N',11,'N',3000277,'N','Y','N','numerocomprobante','numerocomprobante',100,TO_DATE('2016-03-28 17:57:17','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-03-28 17:57:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 28/03/2016 17:57:18 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001383 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 28/03/2016 17:58:10 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column SET Name='CAE', ColumnName='CAE',Updated=TO_DATE('2016-03-28 17:58:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001378
;

-- 28/03/2016 17:58:10 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001378
;

-- 28/03/2016 17:58:10 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET Name='CAE', Description=NULL, Help=NULL WHERE AD_Column_ID=3001378 AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 17:58:21 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element SET ColumnName='CAE', Name='CAE', PrintName='CAE',Updated=TO_DATE('2016-03-28 17:58:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000272
;

-- 28/03/2016 17:58:21 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000272
;

-- 28/03/2016 17:58:21 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column SET ColumnName='CAE', Name='CAE', Description=NULL, Help=NULL WHERE AD_Element_ID=3000272
;

-- 28/03/2016 17:58:21 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='CAE', Name='CAE', Description=NULL, Help=NULL, AD_Element_ID=3000272 WHERE UPPER(ColumnName)='CAE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 28/03/2016 17:58:21 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='CAE', Name='CAE', Description=NULL, Help=NULL WHERE AD_Element_ID=3000272 AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 17:58:21 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET Name='CAE', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000272) AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 17:58:21 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_PrintFormatItem pi SET PrintName='CAE', Name='CAE' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000272)
;

-- 28/03/2016 17:58:25 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element_Trl SET Name='CAE',PrintName='CAE',Updated=TO_DATE('2016-03-28 17:58:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000272 AND AD_Language='es_AR'
;

-- 28/03/2016 17:58:36 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column_Trl SET Name='CAE',Updated=TO_DATE('2016-03-28 17:58:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001378 AND AD_Language='es_AR'
;

-- 28/03/2016 17:59:35 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column SET Name='CAE Error', ColumnName='CAEError',Updated=TO_DATE('2016-03-28 17:59:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001380
;

-- 28/03/2016 17:59:35 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001380
;

-- 28/03/2016 17:59:35 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET Name='CAE Error', Description=NULL, Help=NULL WHERE AD_Column_ID=3001380 AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 17:59:41 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column_Trl SET Name='CAE Error',Updated=TO_DATE('2016-03-28 17:59:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001380 AND AD_Language='es_AR'
;

-- 28/03/2016 17:59:51 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element SET Name='CAE Error', PrintName='CAE Error',Updated=TO_DATE('2016-03-28 17:59:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000274
;

-- 28/03/2016 17:59:51 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000274
;

-- 28/03/2016 17:59:51 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column SET ColumnName='caeerror', Name='CAE Error', Description=NULL, Help=NULL WHERE AD_Element_ID=3000274
;

-- 28/03/2016 17:59:51 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='caeerror', Name='CAE Error', Description=NULL, Help=NULL, AD_Element_ID=3000274 WHERE UPPER(ColumnName)='CAEERROR' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 28/03/2016 17:59:51 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='caeerror', Name='CAE Error', Description=NULL, Help=NULL WHERE AD_Element_ID=3000274 AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 17:59:51 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET Name='CAE Error', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000274) AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 17:59:51 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_PrintFormatItem pi SET PrintName='CAE Error', Name='CAE Error' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000274)
;

-- 28/03/2016 18:00:06 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element SET ColumnName='CAEError',Updated=TO_DATE('2016-03-28 18:00:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000274
;

-- 28/03/2016 18:00:06 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column SET ColumnName='CAEError', Name='CAE Error', Description=NULL, Help=NULL WHERE AD_Element_ID=3000274
;

-- 28/03/2016 18:00:06 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='CAEError', Name='CAE Error', Description=NULL, Help=NULL, AD_Element_ID=3000274 WHERE UPPER(ColumnName)='CAEERROR' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 28/03/2016 18:00:06 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='CAEError', Name='CAE Error', Description=NULL, Help=NULL WHERE AD_Element_ID=3000274 AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 18:00:13 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element_Trl SET Name='CAE Error',PrintName='CAE Error',Updated=TO_DATE('2016-03-28 18:00:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000274 AND AD_Language='es_AR'
;

-- 28/03/2016 18:01:14 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column SET Name='CAE Cbte', ColumnName='CAECbte',Updated=TO_DATE('2016-03-28 18:01:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001381
;

-- 28/03/2016 18:01:14 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001381
;

-- 28/03/2016 18:01:14 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET Name='CAE Cbte', Description=NULL, Help=NULL WHERE AD_Column_ID=3001381 AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 18:01:24 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column_Trl SET Name='CAE Cbte',Updated=TO_DATE('2016-03-28 18:01:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001381 AND AD_Language='es_AR'
;

-- 28/03/2016 18:01:44 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element SET ColumnName='CAECbte', Name='CAE Cbte', PrintName='CAE Cbte',Updated=TO_DATE('2016-03-28 18:01:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000275
;

-- 28/03/2016 18:01:44 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000275
;

-- 28/03/2016 18:01:44 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column SET ColumnName='CAECbte', Name='CAE Cbte', Description=NULL, Help=NULL WHERE AD_Element_ID=3000275
;

-- 28/03/2016 18:01:44 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='CAECbte', Name='CAE Cbte', Description=NULL, Help=NULL, AD_Element_ID=3000275 WHERE UPPER(ColumnName)='CAECBTE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 28/03/2016 18:01:44 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='CAECbte', Name='CAE Cbte', Description=NULL, Help=NULL WHERE AD_Element_ID=3000275 AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 18:01:44 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET Name='CAE Cbte', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000275) AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 18:01:44 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_PrintFormatItem pi SET PrintName='CAE Cbte', Name='CAE Cbte' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000275)
;

-- 28/03/2016 18:01:52 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element_Trl SET Name='CAE Cbte',PrintName='CAE Cbte',Updated=TO_DATE('2016-03-28 18:01:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000275 AND AD_Language='es_AR'
;

-- 28/03/2016 18:03:50 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column SET Name='Vencimiento CAE', ColumnName='VtoCAE',Updated=TO_DATE('2016-03-28 18:03:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001379
;

-- 28/03/2016 18:03:50 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001379
;

-- 28/03/2016 18:03:50 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET Name='Vencimiento CAE', Description=NULL, Help=NULL WHERE AD_Column_ID=3001379 AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 18:04:02 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column_Trl SET Name='Vencimiento CAE',Updated=TO_DATE('2016-03-28 18:04:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001379 AND AD_Language='es_AR'
;

-- 28/03/2016 18:04:22 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element SET ColumnName='VtoCAE', Name='Vencimiento CAE', PrintName='Vencimiento CAE',Updated=TO_DATE('2016-03-28 18:04:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000273
;

-- 28/03/2016 18:04:22 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000273
;

-- 28/03/2016 18:04:22 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column SET ColumnName='VtoCAE', Name='Vencimiento CAE', Description=NULL, Help=NULL WHERE AD_Element_ID=3000273
;

-- 28/03/2016 18:04:22 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='VtoCAE', Name='Vencimiento CAE', Description=NULL, Help=NULL, AD_Element_ID=3000273 WHERE UPPER(ColumnName)='VTOCAE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 28/03/2016 18:04:22 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='VtoCAE', Name='Vencimiento CAE', Description=NULL, Help=NULL WHERE AD_Element_ID=3000273 AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 18:04:22 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET Name='Vencimiento CAE', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000273) AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 18:04:22 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_PrintFormatItem pi SET PrintName='Vencimiento CAE', Name='Vencimiento CAE' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000273)
;

-- 28/03/2016 18:04:30 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element_Trl SET Name='Vencimiento CAE',PrintName='Vencimiento CAE',Updated=TO_DATE('2016-03-28 18:04:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000273 AND AD_Language='es_AR'
;

-- 28/03/2016 18:05:44 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column SET Name='Número de Comprobante', ColumnName='NumeroComprobante',Updated=TO_DATE('2016-03-28 18:05:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001383
;

-- 28/03/2016 18:05:44 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001383
;

-- 28/03/2016 18:05:44 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET Name='Número de Comprobante', Description=NULL, Help=NULL WHERE AD_Column_ID=3001383 AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 18:05:49 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column_Trl SET Name='Número de Comprobante',Updated=TO_DATE('2016-03-28 18:05:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001383 AND AD_Language='es_AR'
;

-- 28/03/2016 18:06:09 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element SET ColumnName='NumeroComprobante', Name='Número de Comprobante', PrintName='Número de Comprobante',Updated=TO_DATE('2016-03-28 18:06:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000277
;

-- 28/03/2016 18:06:09 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000277
;

-- 28/03/2016 18:06:09 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column SET ColumnName='NumeroComprobante', Name='Número de Comprobante', Description=NULL, Help=NULL WHERE AD_Element_ID=3000277
;

-- 28/03/2016 18:06:09 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='NumeroComprobante', Name='Número de Comprobante', Description=NULL, Help=NULL, AD_Element_ID=3000277 WHERE UPPER(ColumnName)='NUMEROCOMPROBANTE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 28/03/2016 18:06:09 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='NumeroComprobante', Name='Número de Comprobante', Description=NULL, Help=NULL WHERE AD_Element_ID=3000277 AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 18:06:09 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET Name='Número de Comprobante', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000277) AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 18:06:09 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_PrintFormatItem pi SET PrintName='Número de Comprobante', Name='Número de Comprobante' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000277)
;

-- 28/03/2016 18:06:16 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element_Trl SET Name='Número de Comprobante',PrintName='Número de Comprobante',Updated=TO_DATE('2016-03-28 18:06:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000277 AND AD_Language='es_AR'
;

-- 28/03/2016 18:07:44 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element SET ColumnName='IdCAE', Name='IdCAE', PrintName='IdCAE',Updated=TO_DATE('2016-03-28 18:07:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000276
;

-- 28/03/2016 18:07:44 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000276
;

-- 28/03/2016 18:07:44 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column SET ColumnName='IdCAE', Name='IdCAE', Description=NULL, Help=NULL WHERE AD_Element_ID=3000276
;

-- 28/03/2016 18:07:44 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='IdCAE', Name='IdCAE', Description=NULL, Help=NULL, AD_Element_ID=3000276 WHERE UPPER(ColumnName)='IDCAE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 28/03/2016 18:07:44 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Process_Para SET ColumnName='IdCAE', Name='IdCAE', Description=NULL, Help=NULL WHERE AD_Element_ID=3000276 AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 18:07:44 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET Name='IdCAE', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000276) AND IsCentrallyMaintained='Y'
;

-- 28/03/2016 18:07:44 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_PrintFormatItem pi SET PrintName='IdCAE', Name='IdCAE' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000276)
;

-- 28/03/2016 18:08:53 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,AD_Org_ID,UpdatedBy,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002136,14,'Y','N','N',3001378,'N','Y',263,'N','LAR','CAE',0,100,'Y',TO_DATE('2016-03-28 18:08:52','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-03-28 18:08:52','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/03/2016 18:08:53 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002136 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/03/2016 18:08:53 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,AD_Org_ID,UpdatedBy,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002137,10,'Y','N','N',3001381,'N','Y',263,'N','LAR','CAE Cbte',0,100,'Y',TO_DATE('2016-03-28 18:08:53','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-03-28 18:08:53','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/03/2016 18:08:53 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002137 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/03/2016 18:08:53 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,AD_Org_ID,UpdatedBy,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002138,255,'Y','N','N',3001380,'N','Y',263,'N','LAR','CAE Error',0,100,'Y',TO_DATE('2016-03-28 18:08:53','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-03-28 18:08:53','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/03/2016 18:08:53 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002138 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/03/2016 18:08:54 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,AD_Org_ID,UpdatedBy,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002139,1,'Y','N','N',3000873,'N','Y',263,'N','LAR','Detail',0,100,'Y',TO_DATE('2016-03-28 18:08:53','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-03-28 18:08:53','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/03/2016 18:08:54 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002139 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/03/2016 18:08:54 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,AD_Org_ID,UpdatedBy,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002140,15,'Y','N','N',3001382,'N','Y',263,'N','LAR','IdCAE',0,100,'Y',TO_DATE('2016-03-28 18:08:54','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-03-28 18:08:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/03/2016 18:08:54 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002140 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/03/2016 18:08:54 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,AD_Org_ID,UpdatedBy,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002141,10,'Y','N','N',3001383,'N','Y',263,'N','LAR','Número de Comprobante',0,100,'Y',TO_DATE('2016-03-28 18:08:54','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-03-28 18:08:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/03/2016 18:08:54 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002141 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/03/2016 18:08:54 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,AD_Org_ID,UpdatedBy,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002142,29,'Y','N','N',3001379,'N','Y',263,'N','LAR','Vencimiento CAE',0,100,'Y',TO_DATE('2016-03-28 18:08:54','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-03-28 18:08:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/03/2016 18:08:54 ART
-- ISSUE #77: Facturación Electronica.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002142 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/03/2016 18:10:36 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002137
;

-- 28/03/2016 18:10:36 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002139
;

-- 28/03/2016 18:10:36 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002140
;

-- 28/03/2016 18:10:36 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002141
;

-- 28/03/2016 18:10:36 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3002136
;

-- 28/03/2016 18:10:36 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3002138
;

-- 28/03/2016 18:10:36 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3002142
;

-- 28/03/2016 18:17:02 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3002142
;

-- 28/03/2016 18:17:02 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3002138
;

-- 28/03/2016 18:17:24 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2016-03-28 18:17:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002142
;

-- 29/03/2016 19:49:49 ART
-- ISSUE #77: Facturación electronica.
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000011,'LAR','C','0','Si se prestan servicios, ingresar 1. Caso contrario, ingresar 0. ','LAR_PrestaServicios_FE',0,0,TO_DATE('2016-03-29 19:49:48','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-03-29 19:49:48','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- 29/03/2016 20:15:52 ART
-- ISSUE #77: Facturación Electronica.
UPDATE AD_Column SET AD_Reference_ID=10,Updated=TO_DATE('2016-03-29 20:15:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001377
;
-- Registración de script
SELECT register_migration_script_lar('0069_ISSUE-77.sql', 'LAR', '') FROM dual
;
