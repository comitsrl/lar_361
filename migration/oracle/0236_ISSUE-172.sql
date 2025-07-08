-- 18/06/2025 16:58:04 ART
-- ISSUE #172: Proceso Vaciar Stock.
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES (3000608,'N','N','3','N','N','Y','LAR',0,0,'ar.com.ergio.process.LAR_VaciarStock','N','4000000','LAR_VaciarStock',0,0,100,TO_DATE('2025-06-18 16:58:03','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2025-06-18 16:58:03','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 18/06/2025 16:58:04 ART
-- ISSUE #172: Proceso Vaciar Stock.
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000608 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 18/06/2025 16:58:18 ART
-- ISSUE #172: Proceso Vaciar Stock.
UPDATE AD_Process SET Value='LAR_VaciarStock',Updated=TO_DATE('2025-06-18 16:58:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000608
;

-- 18/06/2025 17:05:06 ART
-- ISSUE #172: Proceso Vaciar Stock.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001098,0,3000608,100,'N',18,10,'N','LAR','Depósito','M_Warehouse_ID','Y',0,100,TO_DATE('2025-06-18 17:05:05','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-06-18 17:05:05','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 18/06/2025 17:05:06 ART
-- ISSUE #172: Proceso Vaciar Stock.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001098 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 18/06/2025 17:05:42 ART
-- ISSUE #172: Proceso Vaciar Stock.
UPDATE AD_Process_Para SET AD_Val_Rule_ID=3000123, IsMandatory='Y', AD_Reference_Value_ID=197,Updated=TO_DATE('2025-06-18 17:05:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3001098
;

-- 18/06/2025 17:06:53 ART
-- ISSUE #172: Proceso Vaciar Stock.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,AD_Val_Rule_ID,SeqNo,IsMandatory,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001099,0,3000608,100,'N',30,231,20,'Y','LAR','Producto','M_Product_ID','Y',0,100,TO_DATE('2025-06-18 17:06:53','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-06-18 17:06:53','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 18/06/2025 17:06:53 ART
-- ISSUE #172: Proceso Vaciar Stock.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001099 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 18/06/2025 17:07:52 ART
-- ISSUE #172: Proceso Vaciar Stock.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001100,0,3000608,100,'N',20,30,'N','N','LAR','Anular Órdenes con Reserva','AnularOrden','Y',0,100,TO_DATE('2025-06-18 17:07:51','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2025-06-18 17:07:51','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 18/06/2025 17:07:52 ART
-- ISSUE #172: Proceso Vaciar Stock.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001100 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 18/06/2025 17:08:46 ART
-- ISSUE #172: Proceso Vaciar Stock.
INSERT INTO AD_Menu (AD_Menu_ID,IsSummary,Action,IsSOTrx,IsReadOnly,AD_Process_ID,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000556,'N','P','N','N',3000608,'LAR','Y','LAR_VaciarStock',TO_DATE('2025-06-18 17:08:46','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_DATE('2025-06-18 17:08:46','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 18/06/2025 17:08:46 ART
-- ISSUE #172: Proceso Vaciar Stock.
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000556 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 18/06/2025 17:08:46 ART
-- ISSUE #172: Proceso Vaciar Stock.
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', SysDate, 100, SysDate, 100,t.AD_Tree_ID, 3000556, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000556)
;

-- 18/06/2025 17:08:53 ART
-- ISSUE #172: Proceso Vaciar Stock.
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000556
;

-- 18/06/2025 17:08:53 ART
-- ISSUE #172: Proceso Vaciar Stock.
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=4000004
;

-- 18/06/2025 17:08:53 ART
-- ISSUE #172: Proceso Vaciar Stock.
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=2, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000463
;

-- 18/06/2025 17:08:53 ART
-- ISSUE #172: Proceso Vaciar Stock.
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=3, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000513
;

-- 18/06/2025 17:08:53 ART
-- ISSUE #172: Proceso Vaciar Stock.
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=4, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000466
;

-- 18/06/2025 17:08:53 ART
-- ISSUE #172: Proceso Vaciar Stock.
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=5, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000008
;

-- 18/06/2025 17:08:53 ART
-- ISSUE #172: Proceso Vaciar Stock.
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=6, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000002
;

-- 18/06/2025 17:08:53 ART
-- ISSUE #172: Proceso Vaciar Stock.
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=7, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000369
;

-- 18/06/2025 17:08:53 ART
-- ISSUE #172: Proceso Vaciar Stock.
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=8, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000001
;

-- Registración de script
SELECT register_migration_script_lar('0236_ISSUE-172.sql', 'LAR', '') FROM dual
;

