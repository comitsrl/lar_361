-- 14/10/2020 19:42:14 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,CopyFromProcess,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES (3000402,'N','N','3','N','N','Y','LAR',0,0,'N','4000000','Consultar Datos FE',0,0,100,TO_TIMESTAMP('2020-10-14 19:42:14','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2020-10-14 19:42:14','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 14/10/2020 19:42:14 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000402 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 14/10/2020 19:43:55 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process SET Classname='ar.com.comit.factura.electronica.ConsultarDocumentosFE',Updated=TO_TIMESTAMP('2020-10-14 19:43:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000402
;

-- 14/10/2020 19:44:52 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000664,0,3000402,100,'N',11,10,'N','LAR','PDV','C_Pos_ID','Y',0,100,TO_TIMESTAMP('2020-10-14 19:44:52','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2020-10-14 19:44:52','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 14/10/2020 19:44:52 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000664 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 14/10/2020 19:46:00 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000665,3,3000402,100,'N',11,20,'N','LAR','TipoCbte','C_DocType_ID','Y',0,100,TO_TIMESTAMP('2020-10-14 19:46:00','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2020-10-14 19:46:00','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 14/10/2020 19:46:00 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000665 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 14/10/2020 19:46:06 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET FieldLength=2,Updated=TO_TIMESTAMP('2020-10-14 19:46:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000664
;

-- 14/10/2020 19:46:46 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000666,30,3000402,100,'N',11,30,'N','LAR','DocumentNo','DocumentNo','Y',0,100,TO_TIMESTAMP('2020-10-14 19:46:46','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2020-10-14 19:46:46','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 14/10/2020 19:46:46 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000666 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 14/10/2020 19:47:33 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Menu (AD_Menu_ID,IsSummary,"action",IsSOTrx,IsReadOnly,AD_Process_ID,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000377,'N','P','N','N',3000402,'LAR','Y','Consultar Datos FE',TO_TIMESTAMP('2020-10-14 19:47:33','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2020-10-14 19:47:33','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 14/10/2020 19:47:33 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000377 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 14/10/2020 19:47:33 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000377, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000377)
;

-- Registración de script
SELECT register_migration_script_lar('0158_ISSUE-77.sql', 'LAR', '')
;
