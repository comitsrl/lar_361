ALTER TABLE C_BankStatement ADD COLUMN LAR_CierreCaja_Origen_ID numeric(10,0);
ALTER TABLE C_BankStatement ADD CONSTRAINT larcierrecajaorigen_cbankstatement FOREIGN KEY (LAR_CierreCaja_Origen_ID)
      REFERENCES C_BankStatement (C_BankStatement_ID) MATCH SIMPLE;

-- 23/08/2017 16:46:17 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000461,'lar_cierrecaja_origen_id','LAR','lar_cierrecaja_origen_id','lar_cierrecaja_origen_id',0,TO_DATE('2017-08-23 16:46:15','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2017-08-23 16:46:15','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 23/08/2017 16:46:17 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000461 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 23/08/2017 16:46:17 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002114,392,'LAR',0,'N','N','N','N',10,'N',19,'N',3000461,'N','Y','N','lar_cierrecaja_origen_id','lar_cierrecaja_origen_id',100,TO_DATE('2017-08-23 16:46:15','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-08-23 16:46:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/08/2017 16:46:17 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002114 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/08/2017 16:47:40 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET Name='Cierre Origen', ColumnName='LAR_CierreCaja_Origen_ID',Updated=TO_DATE('2017-08-23 16:47:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002114
;

-- 23/08/2017 16:47:40 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3002114
;

-- 23/08/2017 16:47:40 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Cierre Origen', Description=NULL, Help=NULL WHERE AD_Column_ID=3002114 AND IsCentrallyMaintained='Y'
;

-- 23/08/2017 16:47:48 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Cierre Origen',Updated=TO_DATE('2017-08-23 16:47:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002114 AND AD_Language='es_AR'
;

-- 23/08/2017 16:48:21 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='LAR_CierreCaja_Origen_ID', Name='Cierre Origen', PrintName='Cierre Origen',Updated=TO_DATE('2017-08-23 16:48:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000461
;

-- 23/08/2017 16:48:21 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000461
;

-- 23/08/2017 16:48:21 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='LAR_CierreCaja_Origen_ID', Name='Cierre Origen', Description=NULL, Help=NULL WHERE AD_Element_ID=3000461
;

-- 23/08/2017 16:48:21 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='LAR_CierreCaja_Origen_ID', Name='Cierre Origen', Description=NULL, Help=NULL, AD_Element_ID=3000461 WHERE UPPER(ColumnName)='LAR_CIERRECAJA_ORIGEN_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 23/08/2017 16:48:21 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='LAR_CierreCaja_Origen_ID', Name='Cierre Origen', Description=NULL, Help=NULL WHERE AD_Element_ID=3000461 AND IsCentrallyMaintained='Y'
;

-- 23/08/2017 16:48:21 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Cierre Origen', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000461) AND IsCentrallyMaintained='Y'
;

-- 23/08/2017 16:48:21 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_PrintFormatItem pi SET PrintName='Cierre Origen', Name='Cierre Origen' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000461)
;

-- 23/08/2017 16:48:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Cierre Origen',PrintName='Cierre Origen',Updated=TO_DATE('2017-08-23 16:48:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000461 AND AD_Language='es_AR'
;

-- 23/08/2017 16:49:35 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3003355,10,'Y','N','N',3002114,'N','Y',3000007,'N','LAR','Cierre Origen',100,0,TO_DATE('2017-08-23 16:49:34','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2017-08-23 16:49:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/08/2017 16:49:35 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003355 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/08/2017 16:49:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003355
;

-- 23/08/2017 21:32:35 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab SET WhereClause='EsCierreCaja=''Y'' AND LAR_CierreCaja_Origen_ID IS NULL',Updated=TO_DATE('2017-08-23 21:32:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000007
;

-- Registración de script
SELECT register_migration_script_lar('0095_ISSUE-80.sql', 'LAR', '')
;
