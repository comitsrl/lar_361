-- 05/05/2012 16:24:13 GMT-03:00
-- Fix Generate invoices process by adding POS
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,AD_Reference_Value_ID,AD_Element_ID,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID) VALUES ('N',3000014,0,119,100,'Y',18,45,'Y',3000005,2581,'LAR','POS','C_POS_ID','Y',0,100,TO_DATE('2012-05-05 16:24:12','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-05-05 16:24:12','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 05/05/2012 16:24:13 GMT-03:00
-- Fix Generate invoices process by adding POS
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000014 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 05/05/2012 16:36:08 GMT-03:00
-- Fix Generate invoices process by adding POS
UPDATE AD_Process_Para SET AD_Reference_ID=30,Updated=TO_DATE('2012-05-05 16:36:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=144
;

-- 05/05/2012 16:36:13 GMT-03:00
-- Fix Generate invoices process by adding POS
UPDATE AD_Process_Para SET AD_Reference_ID=30,Updated=TO_DATE('2012-05-05 16:36:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=143
;

