-- 29/01/2016 10:11:45 ART
-- ISSUE #76: Letra Documentos
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000074,3000003,'LAR','T','T',TO_TIMESTAMP('2016-01-29 10:11:44','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2016-01-29 10:11:44','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 29/01/2016 10:11:45 ART
-- ISSUE #76: Letra Documentos
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000074 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Registración de Script
SELECT register_migration_script_lar('0068_ISSUE-76.sql','LAR','')
;
