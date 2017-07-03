ALTER TABLE C_Payment ADD COLUMN NroCuotas numeric(2,0);

-- 27/06/2017 18:14:20 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000447,'nrocuotas','LAR','nrocuotas','nrocuotas',0,TO_DATE('2017-06-27 18:14:20','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2017-06-27 18:14:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 27/06/2017 18:14:20 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000447 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/06/2017 18:14:21 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002077,335,'LAR',0,'N','N','N','N',2,'N',22,'N',3000447,'N','Y','N','nrocuotas','nrocuotas',100,TO_DATE('2017-06-27 18:14:20','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-06-27 18:14:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/06/2017 18:14:21 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002077 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/06/2017 18:15:05 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Column SET Name='Nro Cuotas', ColumnName='NroCuotas',Updated=TO_DATE('2017-06-27 18:15:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002077
;

-- 27/06/2017 18:15:05 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3002077
;

-- 27/06/2017 18:15:05 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET Name='Nro Cuotas', Description=NULL, Help=NULL WHERE AD_Column_ID=3002077 AND IsCentrallyMaintained='Y'
;

-- 27/06/2017 18:15:16 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Column SET Name='Nro. Cuotas',Updated=TO_DATE('2017-06-27 18:15:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002077
;

-- 27/06/2017 18:15:16 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3002077
;

-- 27/06/2017 18:15:16 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET Name='Nro. Cuotas', Description=NULL, Help=NULL WHERE AD_Column_ID=3002077 AND IsCentrallyMaintained='Y'
;

-- 27/06/2017 18:15:21 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Column_Trl SET Name='Nro. Cuotas',Updated=TO_DATE('2017-06-27 18:15:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002077 AND AD_Language='es_AR'
;

-- 27/06/2017 18:15:40 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Element SET ColumnName='NroCuotas', Name='Nro. Cuotas', PrintName='Nro. Cuotas',Updated=TO_DATE('2017-06-27 18:15:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000447
;

-- 27/06/2017 18:15:40 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000447
;

-- 27/06/2017 18:15:40 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Column SET ColumnName='NroCuotas', Name='Nro. Cuotas', Description=NULL, Help=NULL WHERE AD_Element_ID=3000447
;

-- 27/06/2017 18:15:40 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Process_Para SET ColumnName='NroCuotas', Name='Nro. Cuotas', Description=NULL, Help=NULL, AD_Element_ID=3000447 WHERE UPPER(ColumnName)='NROCUOTAS' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 27/06/2017 18:15:40 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Process_Para SET ColumnName='NroCuotas', Name='Nro. Cuotas', Description=NULL, Help=NULL WHERE AD_Element_ID=3000447 AND IsCentrallyMaintained='Y'
;

-- 27/06/2017 18:15:40 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET Name='Nro. Cuotas', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000447) AND IsCentrallyMaintained='Y'
;

-- 27/06/2017 18:15:40 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_PrintFormatItem pi SET PrintName='Nro. Cuotas', Name='Nro. Cuotas' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000447)
;

-- 27/06/2017 18:15:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Element_Trl SET Name='Nro. Cuotas',PrintName='Nro. Cuotas',Updated=TO_DATE('2017-06-27 18:15:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000447 AND AD_Language='es_AR'
;

-- 27/06/2017 18:17:16 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Column SET AD_Reference_ID=17,Updated=TO_DATE('2017-06-27 18:17:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002077
;

-- 27/06/2017 18:17:59 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000059,'L','LAR','N','Nro Cuotas',0,0,100,TO_DATE('2017-06-27 18:17:59','YYYY-MM-DD HH24:MI:SS'),'Y',TO_DATE('2017-06-27 18:17:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/06/2017 18:17:59 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000059 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 27/06/2017 18:18:32 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000119,3000059,'LAR','1','1',TO_DATE('2017-06-27 18:18:31','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2017-06-27 18:18:31','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:18:32 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000119 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:18:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000120,3000059,'LAR','2','2',TO_DATE('2017-06-27 18:18:46','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2017-06-27 18:18:46','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:18:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000120 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:19:04 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000121,3000059,'LAR','3','3',TO_DATE('2017-06-27 18:19:04','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2017-06-27 18:19:04','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:19:04 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000121 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:19:14 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000122,3000059,'LAR','4','4',TO_DATE('2017-06-27 18:19:14','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2017-06-27 18:19:14','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:19:14 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000122 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:19:22 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000123,3000059,'LAR','5','5',TO_DATE('2017-06-27 18:19:22','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2017-06-27 18:19:22','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:19:22 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000123 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:19:31 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000124,3000059,'LAR','6','6',TO_DATE('2017-06-27 18:19:31','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2017-06-27 18:19:31','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:19:31 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000124 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:19:41 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000125,3000059,'LAR','7','7',TO_DATE('2017-06-27 18:19:40','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2017-06-27 18:19:40','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:19:41 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000125 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:19:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000126,3000059,'LAR','8','8',TO_DATE('2017-06-27 18:19:48','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2017-06-27 18:19:48','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:19:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000126 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:19:56 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000127,3000059,'LAR','9','9',TO_DATE('2017-06-27 18:19:56','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2017-06-27 18:19:56','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:19:56 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000127 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:20:07 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000128,3000059,'LAR','10','10',TO_DATE('2017-06-27 18:20:07','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2017-06-27 18:20:07','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:20:07 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000128 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:20:16 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000129,3000059,'LAR','11','11',TO_DATE('2017-06-27 18:20:15','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2017-06-27 18:20:15','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:20:16 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000129 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:20:32 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000130,3000059,'LAR','12','12',TO_DATE('2017-06-27 18:20:32','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2017-06-27 18:20:32','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:20:32 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000130 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:20:44 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000131,3000059,'LAR','13','13',TO_DATE('2017-06-27 18:20:44','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2017-06-27 18:20:44','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:20:44 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000131 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:20:58 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000132,3000059,'LAR','14','14',TO_DATE('2017-06-27 18:20:58','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2017-06-27 18:20:58','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:20:58 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000132 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:21:06 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000133,3000059,'LAR','15','15',TO_DATE('2017-06-27 18:21:05','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2017-06-27 18:21:05','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:21:06 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000133 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:21:30 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000134,3000059,'LAR','16','16',TO_DATE('2017-06-27 18:21:30','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2017-06-27 18:21:30','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:21:30 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000134 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:21:42 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000135,3000059,'LAR','17','17',TO_DATE('2017-06-27 18:21:42','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2017-06-27 18:21:42','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:21:42 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000135 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:21:59 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000136,3000059,'LAR','18','18',TO_DATE('2017-06-27 18:21:59','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2017-06-27 18:21:59','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:21:59 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000136 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:22:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Column SET AD_Reference_Value_ID=3000059,Updated=TO_DATE('2017-06-27 18:22:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002077
;

-- 27/06/2017 18:30:13 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('AD_Ref_List.Value <= (SELECT LAR_Plan_Pago.Cuota_Final FROM LAR_Plan_Pago WHERE LAR_Plan_Pago.LAR_Plan_Pago_ID=@LAR_Plan_Pago_ID@)','S',3000047,'LAR','Nro Cuotas',100,100,TO_DATE('2017-06-27 18:30:13','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2017-06-27 18:30:13','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/06/2017 18:31:29 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Val_Rule SET Code='AD_Ref_List.Value <= (SELECT LAR_Plan_Pago.Cuota_Final FROM LAR_Plan_Pago WHERE LAR_Plan_Pago.LAR_Plan_Pago_ID=@LAR_Plan_Pago_ID@) AND
AD_Ref_List.Value >= (SELECT LAR_Plan_Pago.Cuota_Inicial FROM LAR_Plan_Pago WHERE LAR_Plan_Pago.LAR_Plan_Pago_ID=@LAR_Plan_Pago_ID@)',Updated=TO_DATE('2017-06-27 18:31:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000047
;

-- 27/06/2017 18:32:01 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Column SET AD_Val_Rule_ID=3000047,Updated=TO_DATE('2017-06-27 18:32:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002077
;

-- 27/06/2017 19:16:49 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003293,2,'Y','N','N',3002077,'N','Y',3000013,'N','LAR','Nro. Cuotas',100,0,TO_DATE('2017-06-27 19:16:49','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2017-06-27 19:16:49','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/06/2017 19:16:49 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003293 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3003293
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3003009
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000336
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000337
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000338
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000339
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000340
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000341
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000342
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000343
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000344
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000345
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000346
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000347
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000348
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000349
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000350
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000351
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000352
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000353
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000354
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000355
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000357
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000358
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000359
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000360
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000363
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000302
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3000362
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=3000289
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=690,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- 28/06/2017 18:13:23 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3003293
;

-- 28/06/2017 18:13:23 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000329
;

-- 28/06/2017 18:13:23 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000330
;

-- 28/06/2017 18:13:23 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000331
;

-- 28/06/2017 18:13:23 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000332
;

-- 28/06/2017 18:13:23 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000335
;

-- 28/06/2017 18:13:23 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000356
;

-- 28/06/2017 18:13:50 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2017-06-28 18:13:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003293
;

-- 28/06/2017 18:16:52 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003303,2,'Y','N','N',3002077,'N','Y',3000024,'N','LAR','Nro. Cuotas',100,0,TO_DATE('2017-06-28 18:16:52','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2017-06-28 18:16:52','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/06/2017 18:16:53 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003303 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 28/06/2017 18:23:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3003303
;

-- 28/06/2017 18:23:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000819
;

-- 28/06/2017 18:23:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000820
;

-- 28/06/2017 18:23:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000821
;

-- 28/06/2017 18:23:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000822
;

-- 28/06/2017 18:23:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000825
;

-- 28/06/2017 18:23:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000846
;

-- 28/06/2017 18:23:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000826
;

-- 28/06/2017 18:23:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000827
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000828
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3003010
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000829
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000830
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000831
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000832
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000833
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000834
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000835
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000836
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000837
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000838
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000839
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000840
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000841
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000842
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000843
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000844
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000845
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000847
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000848
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000849
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000850
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000851
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000852
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000857
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000855
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000856
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000858
;

-- 28/06/2017 18:24:12 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2017-06-28 18:24:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003303
;

-- Registración de script
SELECT register_migration_script_lar('0091_ISSUE-80.sql', 'LAR', '') FROM dual
;
