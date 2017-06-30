-- 24/05/2017 19:13:40 ART
-- ISSUE  #77: Facturación Electronica
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000109,3000002,'LAR','11','Factura C',TO_TIMESTAMP('2017-05-24 19:13:39','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-05-24 19:13:39','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 24/05/2017 19:13:40 ART
-- ISSUE  #77: Facturación Electronica
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000109 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 24/05/2017 19:13:57 ART
-- ISSUE  #77: Facturación Electronica
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000110,3000002,'LAR','15','Recibo C',TO_TIMESTAMP('2017-05-24 19:13:57','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-05-24 19:13:57','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 24/05/2017 19:13:57 ART
-- ISSUE  #77: Facturación Electronica
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000110 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 24/05/2017 19:14:18 ART
-- ISSUE  #77: Facturación Electronica
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000111,3000002,'LAR','51','Factura M',TO_TIMESTAMP('2017-05-24 19:14:18','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-05-24 19:14:18','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 24/05/2017 19:14:18 ART
-- ISSUE  #77: Facturación Electronica
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000111 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 24/05/2017 19:14:34 ART
-- ISSUE  #77: Facturación Electronica
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000112,3000002,'LAR','52','Nota de Débito M',TO_TIMESTAMP('2017-05-24 19:14:34','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-05-24 19:14:34','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 24/05/2017 19:14:34 ART
-- ISSUE  #77: Facturación Electronica
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000112 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 24/05/2017 19:14:49 ART
-- ISSUE  #77: Facturación Electronica
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000113,3000002,'LAR','53','Nota de Crédito M',TO_TIMESTAMP('2017-05-24 19:14:49','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-05-24 19:14:49','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 24/05/2017 19:14:49 ART
-- ISSUE  #77: Facturación Electronica
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000113 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 24/05/2017 19:14:59 ART
-- ISSUE  #77: Facturación Electronica
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000114,3000002,'LAR','54','Recibo M',TO_TIMESTAMP('2017-05-24 19:14:59','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-05-24 19:14:59','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 24/05/2017 19:14:59 ART
-- ISSUE  #77: Facturación Electronica
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000114 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 24/05/2017 19:15:15 ART
-- ISSUE  #77: Facturación Electronica
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000115,3000002,'LAR','83','Tique',TO_TIMESTAMP('2017-05-24 19:15:14','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-05-24 19:15:14','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 24/05/2017 19:15:15 ART
-- ISSUE  #77: Facturación Electronica
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000115 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 24/05/2017 19:15:30 ART
-- ISSUE  #77: Facturación Electronica
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000116,3000002,'LAR','111','Tique Factura C',TO_TIMESTAMP('2017-05-24 19:15:30','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-05-24 19:15:30','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 24/05/2017 19:15:30 ART
-- ISSUE  #77: Facturación Electronica
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000116 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 24/05/2017 19:15:40 ART
-- ISSUE  #77: Facturación Electronica
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000117,3000002,'LAR','118','Tique Factura M',TO_TIMESTAMP('2017-05-24 19:15:40','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-05-24 19:15:40','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 24/05/2017 19:15:40 ART
-- ISSUE  #77: Facturación Electronica
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000117 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Registración de script
SELECT register_migration_script_lar('0089_ISSUE-77.sql', 'LAR', '')
;
