ALTER TABLE c_pos ADD isjavapos CHARACTER(1) NOT NULL DEFAULT 'N'
;
-- 29/03/2017 22:47:59 ART
-- ISSUE #86: Implementación de JavaPOS
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000436,'isjavapos','LAR','isjavapos','isjavapos',0,TO_DATE('2017-03-29 22:47:58','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2017-03-29 22:47:58','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 29/03/2017 22:47:59 ART
-- ISSUE #86: Implementación de JavaPOS
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000436 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 29/03/2017 22:47:59 ART
-- ISSUE #86: Implementación de JavaPOS
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002031,748,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000436,'N','Y','N','isjavapos','isjavapos',100,TO_DATE('2017-03-29 22:47:58','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-03-29 22:47:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/03/2017 22:47:59 ART
-- ISSUE #86: Implementación de JavaPOS
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002031 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 29/03/2017 22:48:40 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Element SET ColumnName='IsJavaPOS', Name='IsJavaPOS', PrintName='IsJavaPOS',Updated=TO_DATE('2017-03-29 22:48:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000436
;

-- 29/03/2017 22:48:40 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000436
;

-- 29/03/2017 22:48:40 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Column SET ColumnName='IsJavaPOS', Name='IsJavaPOS', Description=NULL, Help=NULL WHERE AD_Element_ID=3000436
;

-- 29/03/2017 22:48:40 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Process_Para SET ColumnName='IsJavaPOS', Name='IsJavaPOS', Description=NULL, Help=NULL, AD_Element_ID=3000436 WHERE UPPER(ColumnName)='ESJAVAPOS' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 29/03/2017 22:48:40 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Process_Para SET ColumnName='IsJavaPOS', Name='IsJavaPOS', Description=NULL, Help=NULL WHERE AD_Element_ID=3000436 AND IsCentrallyMaintained='Y'
;

-- 29/03/2017 22:48:40 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Field SET Name='IsJavaPOS', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000436) AND IsCentrallyMaintained='Y'
;

-- 29/03/2017 22:48:41 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_PrintFormatItem pi SET PrintName='IsJavaPOS', Name='IsJavaPOS' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000436)
;

-- 29/03/2017 22:50:17 ART
-- ISSUE #86: Implementación de JavaPOS
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003215,1,'Y','N','N',3002031,'N','Y',676,'N','LAR','IsJavaPOS',100,0,TO_DATE('2017-03-29 22:50:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2017-03-29 22:50:16','YYYY-MM-DD HH24:MI:SS'))
;

-- 29/03/2017 22:50:17 ART
-- ISSUE #86: Implementación de JavaPOS
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003215 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 29/03/2017 22:51:53 ART
-- ISSUE #86: Implementación de JavaPOS
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Es JavaPOS',Updated=TO_DATE('2017-03-29 22:51:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003215 AND AD_Language='es_AR'
;

