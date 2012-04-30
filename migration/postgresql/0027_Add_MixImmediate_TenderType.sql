-- 30/04/2012 15:05:36 GMT-03:00
-- Add fiscal printing code to Process_Invoice WF
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,UpdatedBy,Created,CreatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000030,214,'LAR','B','MixImmeditate',TO_TIMESTAMP('2012-04-30 15:05:34','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2012-04-30 15:05:34','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 30/04/2012 15:05:36 GMT-03:00
-- Add fiscal printing code to Process_Invoice WF
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000030 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;
