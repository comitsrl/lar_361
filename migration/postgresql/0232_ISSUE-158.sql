-- 10/04/2025 11:12:55 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,Updated,UpdatedBy,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('AD_Role.AD_Client_ID=@#AD_Client_ID@ AND AD_Role.IsManual=''Y''','S',3000153,'LAR','AD_Role of Client - Manual only',100,TO_TIMESTAMP('2025-04-10 11:12:55','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0,TO_TIMESTAMP('2025-04-10 11:12:55','YYYY-MM-DD HH24:MI:SS'))
;

-- 10/04/2025 11:14:30 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,AD_Val_Rule_ID,SeqNo,IsMandatory,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3001070,0,3000500,100,'N',19,3000153,140,'N','LAR','Role','AD_Role_ID','Y',0,100,TO_TIMESTAMP('2025-04-10 11:14:30','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2025-04-10 11:14:30','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 10/04/2025 11:14:30 ART
-- ADP #2: Migracion de datos
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3001070 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- Registración de script
SELECT register_migration_script_lar('0232_ISSUE-158.sql', 'LAR', '') FROM dual
;
