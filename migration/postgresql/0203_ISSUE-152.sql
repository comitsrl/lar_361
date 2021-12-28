ALTER TABLE C_ElementValue
ADD COLUMN  ajustaporinflacion character(1) DEFAULT 'N'::bpchar;

ALTER TABLE C_Period
ADD COLUMN indiceajusteinflacion numeric;

-- Creación del Proceso
-- 27/12/2021 15:47:22 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Description,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES (3000462,'N','N','3','N','N','Y','LAR',0,0,'ar.com.ergio.process.LAR_AjustePorInflacion','N','Genera los asientos con el ajuste correspondiente, si "Solo Genera Reporte" está tildado solo genera la simulación con el reporte y no los asientos.','LAR_Ajuste_por_Inflación','Ajuste por Inflación',0,0,100,TO_TIMESTAMP('2021-12-27 15:47:22','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2021-12-27 15:47:22','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 27/12/2021 15:47:23 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000462 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 27/12/2021 15:49:28 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000765,0,3000462,100,'N',15,10,'Y','LAR','Fecha Inicial','FechaInicial','Y',0,100,TO_TIMESTAMP('2021-12-27 15:49:27','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-12-27 15:49:27','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 27/12/2021 15:49:28 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000765 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 27/12/2021 15:49:56 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000766,0,3000462,100,'N',15,20,'Y','LAR','Fecha Final','FechaFinal','Y',0,100,TO_TIMESTAMP('2021-12-27 15:49:56','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-12-27 15:49:56','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 27/12/2021 15:49:56 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000766 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 27/12/2021 15:51:00 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000767,0,3000462,100,'N',20,30,'Y','''Y''','LAR','Solo Ejecuta Reporte','SoloEjecutaReporte','Y',0,100,TO_TIMESTAMP('2021-12-27 15:50:59','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-12-27 15:50:59','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 27/12/2021 15:51:00 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000767 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 27/12/2021 15:52:29 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,EntityType,ReadOnlyLogic,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000768,0,3000462,100,'N',20,40,'N','''N''','LAR','@SoloEjecutaReporte@=''N''','Genera Asientos','GeneraAsientos','Y',0,100,TO_TIMESTAMP('2021-12-27 15:52:29','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-12-27 15:52:29','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 27/12/2021 15:52:29 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000768 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 27/12/2021 15:53:59 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000769,0,3000462,100,'N',30,50,'Y','LAR','Cuenta','Account_ID','Y',0,100,TO_TIMESTAMP('2021-12-27 15:53:59','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-12-27 15:53:59','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 27/12/2021 15:53:59 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000769 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 27/12/2021 15:54:41 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_Process_Para SET Name='Cuenta RECPAM',Updated=TO_TIMESTAMP('2021-12-27 15:54:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000769
;

-- 27/12/2021 15:54:41 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_Process_Para_Trl SET IsTranslated='N' WHERE AD_Process_Para_ID=3000769
;

-- 27/12/2021 15:55:38 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Menu (AD_Menu_ID,IsSummary,"action",IsSOTrx,IsReadOnly,AD_Process_ID,EntityType,IsCentrallyMaintained,Name,Description,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000412,'N','P','N','N',3000462,'LAR','N','Ajuste por Inflación (RECPAM)','Ajuste por Inflación (RECPAM)',TO_TIMESTAMP('2021-12-27 15:55:37','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2021-12-27 15:55:37','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 27/12/2021 15:55:38 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000412 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 27/12/2021 15:55:38 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000412, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000412)
;

-- 27/12/2021 15:55:43 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_TreeNodeMM SET Parent_ID=3000052, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000055
;

-- 27/12/2021 15:55:43 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_TreeNodeMM SET Parent_ID=3000052, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000088
;

-- 27/12/2021 15:55:43 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_TreeNodeMM SET Parent_ID=3000052, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000210
;

-- 27/12/2021 15:55:43 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_TreeNodeMM SET Parent_ID=3000052, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000053
;

-- 27/12/2021 15:55:43 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_TreeNodeMM SET Parent_ID=3000052, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000093
;

-- 27/12/2021 15:55:43 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_TreeNodeMM SET Parent_ID=3000052, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000412
;

-- 27/12/2021 15:55:43 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_TreeNodeMM SET Parent_ID=3000052, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000058
;

-- 27/12/2021 15:55:44 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_TreeNodeMM SET Parent_ID=3000052, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000055
;

-- 27/12/2021 15:55:44 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_TreeNodeMM SET Parent_ID=3000052, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000088
;

-- 27/12/2021 15:55:44 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_TreeNodeMM SET Parent_ID=3000052, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000210
;

-- 27/12/2021 15:55:44 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_TreeNodeMM SET Parent_ID=3000052, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000053
;

-- 27/12/2021 15:55:44 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_TreeNodeMM SET Parent_ID=3000052, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000093
;

-- 27/12/2021 15:55:44 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_TreeNodeMM SET Parent_ID=3000052, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000058
;

-- 27/12/2021 15:55:44 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_TreeNodeMM SET Parent_ID=3000052, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000412
;

-- 27/12/2021 15:55:44 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_TreeNodeMM SET Parent_ID=3000052, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000058
;

-- Creación tilde Ajuste por inflación en cuentas
-- Creación columna índice en período
-- 27/12/2021 16:26:45 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001233,'indiceajusteinflacion','LAR','indiceajusteinflacion','indiceajusteinflacion',0,TO_TIMESTAMP('2021-12-27 16:26:45','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-12-27 16:26:45','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 27/12/2021 16:26:45 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001233 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/12/2021 16:26:46 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004424,145,'LAR',0,'N','N','N','N',131089,'N',22,'N',3001233,'N','Y','N','indiceajusteinflacion','indiceajusteinflacion',100,TO_TIMESTAMP('2021-12-27 16:26:45','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2021-12-27 16:26:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/12/2021 16:26:46 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004424 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/12/2021 16:27:30 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_Element SET ColumnName='IndiceAjusteInflacion', Name='IndiceAjusteInflacion', PrintName='IndiceAjusteInflacion',Updated=TO_TIMESTAMP('2021-12-27 16:27:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001233
;

-- 27/12/2021 16:27:30 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001233
;

-- 27/12/2021 16:27:30 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_Column SET ColumnName='IndiceAjusteInflacion', Name='IndiceAjusteInflacion', Description=NULL, Help=NULL WHERE AD_Element_ID=3001233
;

-- 27/12/2021 16:27:30 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_Process_Para SET ColumnName='IndiceAjusteInflacion', Name='IndiceAjusteInflacion', Description=NULL, Help=NULL, AD_Element_ID=3001233 WHERE UPPER(ColumnName)='INDICEAJUSTEINFLACION' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 27/12/2021 16:27:30 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_Process_Para SET ColumnName='IndiceAjusteInflacion', Name='IndiceAjusteInflacion', Description=NULL, Help=NULL WHERE AD_Element_ID=3001233 AND IsCentrallyMaintained='Y'
;

-- 27/12/2021 16:27:30 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_Field SET Name='IndiceAjusteInflacion', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001233) AND IsCentrallyMaintained='Y'
;

-- 27/12/2021 16:27:30 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_PrintFormatItem SET PrintName='IndiceAjusteInflacion', Name='IndiceAjusteInflacion' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001233)
;

-- 27/12/2021 16:27:53 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Indic eAjuste Inflación',PrintName='Indice Ajuste Inflación',Updated=TO_TIMESTAMP('2021-12-27 16:27:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001233 AND AD_Language='es_AR'
;

-- 27/12/2021 16:28:01 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_Column SET FieldLength=22,Updated=TO_TIMESTAMP('2021-12-27 16:28:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004424
;

-- 27/12/2021 16:28:06 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007724,22,'Y','N','N',3004424,'N','Y',130,'N','LAR','IndiceAjusteInflacion',100,0,TO_TIMESTAMP('2021-12-27 16:28:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-12-27 16:28:06','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/12/2021 16:28:06 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007724 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/12/2021 16:29:31 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001234,'ajustaporinflacion','LAR','ajustaporinflacion','ajustaporinflacion',0,TO_TIMESTAMP('2021-12-27 16:29:31','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2021-12-27 16:29:31','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 27/12/2021 16:29:31 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001234 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/12/2021 16:29:31 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004425,188,'LAR',0,'N','N','N','N',1,'N',20,'N',3001234,'N','Y','N','ajustaporinflacion','ajustaporinflacion',100,TO_TIMESTAMP('2021-12-27 16:29:31','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2021-12-27 16:29:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/12/2021 16:29:31 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004425 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/12/2021 16:29:55 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_Column SET Name='AjustaPorInflacion', ColumnName='AjustaPorInflacion',Updated=TO_TIMESTAMP('2021-12-27 16:29:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004425
;

-- 27/12/2021 16:29:55 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3004425
;

-- 27/12/2021 16:29:55 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_Field SET Name='AjustaPorInflacion', Description=NULL, Help=NULL WHERE AD_Column_ID=3004425 AND IsCentrallyMaintained='Y'
;

-- 27/12/2021 16:30:12 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_Column_Trl SET Name='Ajusta por Inflacion',Updated=TO_TIMESTAMP('2021-12-27 16:30:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004425 AND AD_Language='es_AR'
;

-- 27/12/2021 16:30:37 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_Element SET ColumnName='AjustaPorInflacion', Name='AjustaPorInflacion', PrintName='AjustaPorInflacion',Updated=TO_TIMESTAMP('2021-12-27 16:30:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001234
;

-- 27/12/2021 16:30:37 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001234
;

-- 27/12/2021 16:30:37 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_Column SET ColumnName='AjustaPorInflacion', Name='AjustaPorInflacion', Description=NULL, Help=NULL WHERE AD_Element_ID=3001234
;

-- 27/12/2021 16:30:37 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_Process_Para SET ColumnName='AjustaPorInflacion', Name='AjustaPorInflacion', Description=NULL, Help=NULL, AD_Element_ID=3001234 WHERE UPPER(ColumnName)='AJUSTAPORINFLACION' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 27/12/2021 16:30:37 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_Process_Para SET ColumnName='AjustaPorInflacion', Name='AjustaPorInflacion', Description=NULL, Help=NULL WHERE AD_Element_ID=3001234 AND IsCentrallyMaintained='Y'
;

-- 27/12/2021 16:30:37 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_Field SET Name='AjustaPorInflacion', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001234) AND IsCentrallyMaintained='Y'
;

-- 27/12/2021 16:30:37 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_PrintFormatItem SET PrintName='AjustaPorInflacion', Name='AjustaPorInflacion' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001234)
;

-- 27/12/2021 16:30:54 ART
-- ISSUE #152: Ajuste por Inflación
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Ajusta por Inflación',PrintName='Ajusta por Inflación',Updated=TO_TIMESTAMP('2021-12-27 16:30:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001234 AND AD_Language='es_AR'
;

-- 27/12/2021 16:31:20 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3007725,1,'Y','N','N',3004425,'N','Y',132,'N','LAR','AjustaPorInflacion',100,0,TO_TIMESTAMP('2021-12-27 16:31:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-12-27 16:31:20','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/12/2021 16:31:20 ART
-- ISSUE #152: Ajuste por Inflación
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007725 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- FIN
-- Creación tilde Ajuste por inflación en cuentas
-- Creación columna índice en período

-- Registración de script
SELECT register_migration_script_lar('0203_ISSUE-152.sql', 'LAR', '')
;
