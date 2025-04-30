-- 26/04/2025 13:18:12 ART
-- ISSUE #158: Agregar formato de impresion y documentos MiPyME
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001071,0,3000500,100,'N',19,150,'N','LAR','Formato de Impresión para Factura','AD_PrintFormat_ID','Y',0,100,TO_TIMESTAMP('2025-04-26 13:18:12','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-04-26 13:18:12','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 26/04/2025 13:18:12 ART
-- ISSUE #158: Agregar formato de impresion y documentos MiPyME
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001071 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 28/04/2025 17:05:00 ART
-- ISSUE #158: Agregar formato de impresion y documentos MiPyME
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,EntityType,DisplayLogic,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001072,0,3000500,100,'N',20,35,'N','N','LAR','@EsElectronico@=''Y''','Crear Documentos MiPyME','EsMiPyME','Y',0,100,TO_TIMESTAMP('2025-04-28 17:05:00','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-04-28 17:05:00','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 28/04/2025 17:05:00 ART
-- ISSUE #158: Agregar formato de impresion y documentos MiPyME
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001072 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- Registración de script
SELECT register_migration_script_lar('0233_ISSUE-158.sql', 'LAR', '')
;

