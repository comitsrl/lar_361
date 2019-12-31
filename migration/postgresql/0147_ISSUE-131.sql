-- 31/12/2019 12:14:40 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES (3000381,'N','N','3','N','N','Y','LAR',0,0,'extend.src.ar.com.ergio.process.LAR_LiberarOrdenesVenta','N','4000000','Liberar Remito/Orden de Venta',0,0,100,TO_TIMESTAMP('2019-12-31 12:14:39','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2019-12-31 12:14:39','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 31/12/2019 12:14:40 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000381 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 31/12/2019 12:16:08 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000602,0,3000381,100,'N',19,10,'Y','LAR','Socio del Negocio','C_BPartner_ID','Y',0,100,TO_TIMESTAMP('2019-12-31 12:16:08','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-12-31 12:16:08','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 31/12/2019 12:16:08 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000602 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 31/12/2019 12:16:38 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000603,0,3000381,100,'N',19,20,'Y','LAR','Factura','C_Invoice_ID','Y',0,100,TO_TIMESTAMP('2019-12-31 12:16:37','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-12-31 12:16:37','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 31/12/2019 12:16:38 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000603 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 31/12/2019 12:16:58 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
INSERT INTO AD_Menu (AD_Menu_ID,IsSummary,"action",IsSOTrx,IsReadOnly,AD_Process_ID,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000361,'N','P','N','N',3000381,'LAR','Y','Liberar Remito',TO_TIMESTAMP('2019-12-31 12:16:58','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2019-12-31 12:16:58','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 31/12/2019 12:16:58 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000361 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 31/12/2019 12:16:58 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000361, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000361)
;

-- 31/12/2019 12:17:26 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=218
;

-- 31/12/2019 12:17:26 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=153
;

-- 31/12/2019 12:17:26 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=263
;

-- 31/12/2019 12:17:26 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=166
;

-- 31/12/2019 12:17:26 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000361
;

-- 31/12/2019 12:17:26 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=203
;

-- 31/12/2019 12:17:26 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53242
;

-- 31/12/2019 12:17:26 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=236
;

-- 31/12/2019 12:17:26 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=183
;

-- 31/12/2019 12:17:26 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=160
;

-- 31/12/2019 12:17:26 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=278
;

-- 31/12/2019 12:17:26 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53296
;

-- 31/12/2019 12:17:26 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=12, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=345
;

-- 31/12/2019 12:17:26 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=13, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53014
;

-- 31/12/2019 12:17:26 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=14, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000000
;

-- 31/12/2019 12:17:26 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=15, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53108
;

-- 31/12/2019 12:17:26 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=16, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53066
;

-- 31/12/2019 12:17:26 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=0, SeqNo=17, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000361
;

-- 31/12/2019 12:17:38 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=459, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=346
;

-- 31/12/2019 12:17:38 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=459, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53132
;

-- 31/12/2019 12:17:38 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=459, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=193
;

-- 31/12/2019 12:17:38 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=459, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000361
;

-- 31/12/2019 12:17:38 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=459, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=180
;

-- 31/12/2019 12:17:38 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=459, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=494
;

-- 31/12/2019 12:17:38 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_TreeNodeMM SET Parent_ID=459, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=444
;

-- 31/12/2019 12:19:17 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_Process_Para SET AD_Reference_ID=30,Updated=TO_TIMESTAMP('2019-12-31 12:19:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000603
;

-- 31/12/2019 12:19:22 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_Process_Para SET AD_Reference_ID=30,Updated=TO_TIMESTAMP('2019-12-31 12:19:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000602
;

-- 31/12/2019 12:22:08 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_Menu SET IsSOTrx='Y',Updated=TO_TIMESTAMP('2019-12-31 12:22:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=3000361
;

-- 31/12/2019 12:23:58 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_Process SET Help='El proceso, actualizara las líneas de los documentos asociados a la Factura (Remito y/o Orden de Venta), de manera que los mismo puedan ser "Re-Facturados".',Updated=TO_TIMESTAMP('2019-12-31 12:23:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000381
;

-- 31/12/2019 12:23:58 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_Process_Trl SET IsTranslated='N' WHERE AD_Process_ID=3000381
;

-- 31/12/2019 12:23:58 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_Menu SET Name='Liberar Remito/Orden de Venta', Description=NULL, IsActive='Y',Updated=TO_TIMESTAMP('2019-12-31 12:23:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=3000361
;

-- 31/12/2019 12:23:58 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_Menu_Trl SET IsTranslated='N' WHERE AD_Menu_ID=3000361
;

-- 31/12/2019 12:24:59 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_Process SET Description='El proceso, actualizara las líneas de los documentos asociados a la Factura (Remito y/o Orden de Venta), de manera que los mismo puedan ser "Re-Facturados".',Updated=TO_TIMESTAMP('2019-12-31 12:24:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000381
;

-- 31/12/2019 12:24:59 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_Process_Trl SET IsTranslated='N' WHERE AD_Process_ID=3000381
;

-- 31/12/2019 12:24:59 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_Menu SET Name='Liberar Remito/Orden de Venta', Description='El proceso, actualizara las líneas de los documentos asociados a la Factura (Remito y/o Orden de Venta), de manera que los mismo puedan ser "Re-Facturados".', IsActive='Y',Updated=TO_TIMESTAMP('2019-12-31 12:24:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=3000361
;

-- 31/12/2019 12:24:59 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_Menu_Trl SET IsTranslated='N' WHERE AD_Menu_ID=3000361
;

-- 31/12/2019 12:30:17 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_Process SET Classname='ar.com.ergio.process.LAR_LiberarOrdenesVenta',Updated=TO_TIMESTAMP('2019-12-31 12:30:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000381
;

-- 31/12/2019 14:36:10 ART
-- ISSUE #131: Proceso libera Remitos/Ordenes de Venta.
UPDATE AD_Menu SET IsActive='N',Updated=TO_TIMESTAMP('2019-12-31 14:36:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=3000361
;

-- Registración de script
SELECT register_migration_script_lar('0147_ISSUE-131.sql', 'LAR', '')
;
