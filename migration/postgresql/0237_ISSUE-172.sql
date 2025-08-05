-- 04/08/2025 23:51:27 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
INSERT INTO AD_Process (Help,AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Description,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES ('Este proceso cerrara todas las ordenes que tengan cantidades reservadas.
Si se utilizan las marcas "Negativas" o "Solo Entregadas", el proceso puede ser útil para la corrección de documentos procesados con errores.',3000612,'N','N','3','N','N','Y','LAR',0,0,'ar.com.ergio.process.LAR_CerrarOVReservadas','N','Cerrar Ordenes de Venta con Cantidad Reservadas (Quitar de Reserva).','LAR_CerrarOVReservadas','LAR_CerrarOVReservadas',0,0,100,TO_TIMESTAMP('2025-08-04 23:51:26','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2025-08-04 23:51:26','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 04/08/2025 23:51:27 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000612 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 04/08/2025 23:52:04 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
UPDATE AD_Process_Trl SET IsTranslated='Y',Name='Cerrar Ordenes Reservadas',Updated=TO_TIMESTAMP('2025-08-04 23:52:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000612 AND AD_Language='es_AR'
;

-- 04/08/2025 23:55:12 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,Help,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,AD_Val_Rule_ID,SeqNo,IsMandatory,AD_Reference_Value_ID,AD_Element_ID,EntityType,Name,ColumnName,Description,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001120,0,'An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.',3000612,100,'Y',19,202,10,'N',130,113,'LAR','Organization','AD_Org_ID','Organizational entity within client','Y',0,100,TO_TIMESTAMP('2025-08-04 23:55:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-08-04 23:55:12','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 04/08/2025 23:55:12 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001120 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 04/08/2025 23:56:26 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,Help,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,AD_Element_ID,EntityType,Name,ColumnName,Description,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001121,0,'The Date From indicates the starting date of a range.',3000612,100,'Y',15,20,'N',1581,'U','Date From','DateFrom','Starting date for a range','Y',0,100,TO_TIMESTAMP('2025-08-04 23:56:26','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-08-04 23:56:26','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 04/08/2025 23:56:26 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001121 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 04/08/2025 23:56:54 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,Help,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,AD_Element_ID,EntityType,Name,ColumnName,Description,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001122,0,'The Date To indicates the end date of a range (inclusive)',3000612,100,'Y',15,30,'N',1582,'U','Date To','DateTo','End date of a date range','Y',0,100,TO_TIMESTAMP('2025-08-04 23:56:53','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-08-04 23:56:53','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 04/08/2025 23:56:54 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001122 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 04/08/2025 23:58:51 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,AD_Element_ID,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001123,0,3000612,100,'Y',20,40,'Y','''Y''',367,'LAR','Delivered','IsDelivered','Y',0,100,TO_TIMESTAMP('2025-08-04 23:58:51','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-08-04 23:58:51','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 04/08/2025 23:58:51 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001123 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 04/08/2025 23:59:36 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
UPDATE AD_Process_Para SET Name='Solo Entregadas', Description='Cerrar solo Ordenes de Venta totalemente Entregadas.',Updated=TO_TIMESTAMP('2025-08-04 23:59:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3001123
;

-- 04/08/2025 23:59:36 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
UPDATE AD_Process_Para_Trl SET IsTranslated='N' WHERE AD_Process_Para_ID=3001123
;

-- 04/08/2025 23:59:40 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
UPDATE AD_Process_Para SET IsCentrallyMaintained='N',Updated=TO_TIMESTAMP('2025-08-04 23:59:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3001123
;

-- 04/08/2025 23:59:58 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
UPDATE AD_Process_Para_Trl SET IsTranslated='Y',Name='Solo Entregadas',Description='Cerrar solo Ordenes de Venta totalemente Entregadas.',Updated=TO_TIMESTAMP('2025-08-04 23:59:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3001123 AND AD_Language='es_AR'
;

-- 05/08/2025 0:00:59 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,EntityType,Name,ColumnName,Description,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001124,0,3000612,100,'N',20,50,'Y','''Y''','LAR','Solo Negativas','Negativas','Cerrar solo Ordenes de Venta con cantidades reservadas negativas','Y',0,100,TO_TIMESTAMP('2025-08-05 00:00:59','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-08-05 00:00:59','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 05/08/2025 0:00:59 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001124 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 05/08/2025 0:01:04 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
UPDATE AD_Process_Para_Trl SET IsTranslated='Y',Updated=TO_TIMESTAMP('2025-08-05 00:01:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3001124 AND AD_Language='es_AR'
;

-- 05/08/2025 0:03:49 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
INSERT INTO AD_Menu (AD_Menu_ID,IsSummary,"action",IsSOTrx,IsReadOnly,AD_Process_ID,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000560,'N','P','Y','N',3000612,'LAR','Y','Cerrar OV con Cantidades Reservadas',TO_TIMESTAMP('2025-08-05 00:03:49','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_TIMESTAMP('2025-08-05 00:03:49','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 05/08/2025 0:03:49 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000560 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 05/08/2025 0:03:49 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 3000560, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000560)
;

-- 05/08/2025 0:04:05 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000361
;

-- 05/08/2025 0:04:05 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000560
;

-- 05/08/2025 0:04:05 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000556
;

-- 05/08/2025 0:04:05 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000533
;

-- 05/08/2025 0:04:05 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000476
;

-- 05/08/2025 0:04:05 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000463
;

-- 05/08/2025 0:04:05 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000008
;

-- 05/08/2025 0:04:05 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000002
;

-- 05/08/2025 0:04:05 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000369
;

-- 05/08/2025 0:04:05 ART
-- ADP #172: Cerrar Ordenes con cantidades Reservadas.
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=3000001
;

-- Registración de script
SELECT register_migration_script_lar('0237_ISSUE-172.sql', 'LAR', '')
;
