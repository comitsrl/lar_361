-- 12/09/2012 13:57:01 ART
-- Correción de anulación de documentos durante la impresion fiscal
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Value,Name,AD_Org_ID,AD_Client_ID,Created,CreatedBy,Updated,UpdatedBy,IsActive) VALUES (3000037,'N','N','3','N','N','Y','LAR',0,0,'ar.com.ergio.process.PosOrderGlobalVoiding','N','LAR_PosOrderGlobalVoiding','LAR_PosOrderGlobalVoiding',0,0,TO_DATE('2012-09-12 13:56:58','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2012-09-12 13:56:58','YYYY-MM-DD HH24:MI:SS'),100,'Y')
;

-- 12/09/2012 13:57:01 ART
-- Correción de anulación de documentos durante la impresion fiscal
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000037 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 12/09/2012 14:09:01 ART
-- Correción de anulación de documentos durante la impresion fiscal
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,AD_Element_ID,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID) VALUES ('N',3000038,0,3000037,100,'Y',30,10,'Y',558,'LAR','Order ID','C_Order_ID','Y',0,100,TO_DATE('2012-09-12 14:09:01','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-09-12 14:09:01','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 12/09/2012 14:09:01 ART
-- Correción de anulación de documentos durante la impresion fiscal
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000038 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;
