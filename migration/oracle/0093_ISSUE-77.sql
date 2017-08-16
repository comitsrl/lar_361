-- 16/08/2017 15:38:29 ART
-- ISSUE #77: Código tipo de Documento
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,Created,CreatedBy,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000148,3000002,'LAR','66','Despacho de Importación',TO_DATE('2017-08-16 15:38:28','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2017-08-16 15:38:28','YYYY-MM-DD HH24:MI:SS'),100,100,0,'Y',0)
;

-- 16/08/2017 15:38:29 ART
-- ISSUE #77: Código tipo de Documento
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000148 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Registración de script
SELECT register_migration_script_lar('0093_ISSUE-77.sql', 'LAR', '')
;
