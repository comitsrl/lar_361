-- 05/08/2019 18:29:26 ART
-- ISSUE #47: Desactivar versiones anteriores de Lista de Precios.
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,AD_Client_ID,AD_Org_ID,Created,Updated,CreatedBy,UpdatedBy,IsActive) VALUES (3000049,'LAR','C','30','Ingresar la cantidad de días a los cuales, se desean desactivar las versiones de lista de precios antiguas.','LAR_DiasDesactivar_VersionesListaPrecios',1000000,0,TO_DATE('2019-08-05 18:29:26','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2019-08-05 18:29:26','YYYY-MM-DD HH24:MI:SS'),100,100,'Y')
;

-- 05/08/2019 20:08:53 ART
-- ISSUE #47: Desactivar versiones anteriores de Lista de Precios.
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES (3000368,'N','N','3','N','Y','S','LAR',23,20,'ar.com.ergio.process.LAR_DesactivarVersionesListaPrecios','N','4000001','Desactivar Versiones de Lista de Precios',0,0,100,TO_DATE('2019-08-05 20:08:52','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2019-08-05 20:08:52','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 05/08/2019 20:08:53 ART
-- ISSUE #47: Desactivar versiones anteriores de Lista de Precios.
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000368 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 05/08/2019 20:44:07 ART
-- ISSUE #47: Desactivar versiones anteriores de Lista de Precios.
INSERT INTO AD_Scheduler (KeepLogDays,Supervisor_ID,DateLastRun,DateNextRun,AD_Scheduler_ID,AD_Process_ID,Processing,IsIgnoreProcessingTime,Frequency,FrequencyType,ScheduleType,Name,Updated,UpdatedBy,Created,CreatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (7,0,TO_DATE('2019-07-29 07:00:24','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2019-07-30 07:00:24','YYYY-MM-DD HH24:MI:SS'),4000001,3000368,'N','N',1,'D','F','Desactivar Versiones de Lista de Precios',TO_DATE('2019-08-05 20:44:07','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2019-08-05 20:44:07','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',1000000)
;

-- Registración de script
SELECT register_migration_script_lar('0136_ISSUE-47.sql', 'LAR', '') FROM dual
;
