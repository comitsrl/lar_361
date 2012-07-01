-- 01/07/2012 16:27:13 ART
-- Add Ad_Org table reference, list all but summary orgs.
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,Description,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000018,'T','LAR','N','AD_Org (list all but summary)','Organization selection',0,0,100,TO_DATE('2012-07-01 16:27:09','YYYY-MM-DD HH24:MI:SS'),'Y',TO_DATE('2012-07-01 16:27:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 01/07/2012 16:27:13 ART
-- Add Ad_Org table reference, list all but summary orgs.
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000018 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 01/07/2012 16:28:40 ART
-- Add Ad_Org table reference, list all but summary orgs.
INSERT INTO AD_Ref_Table (IsValueDisplayed,WhereClause,OrderByClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Created,Updated,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N','IsSummary = ''N''','AD_Org.value',155,3000018,528,522,'LAR',100,TO_DATE('2012-07-01 16:28:40','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-07-01 16:28:40','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

