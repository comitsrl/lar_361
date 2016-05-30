-- 30/05/2016 8:58:09 ART
-- ISSUE #79: Sub-Tipos de Documentos
UPDATE AD_Field SET DisplayLogic=NULL,Updated=TO_DATE('2016-05-30 08:58:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000030
;

-- 30/05/2016 8:59:41 ART
-- ISSUE #79: Sub-Tipos de Documentos
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Nota de Débito A',Updated=TO_DATE('2016-05-30 08:59:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000008 AND AD_Language='es_AR'
;

-- 30/05/2016 8:59:52 ART
-- ISSUE #79: Sub-Tipos de Documentos
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Nota de Crédito A',Updated=TO_DATE('2016-05-30 08:59:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000009 AND AD_Language='es_AR'
;

-- 30/05/2016 9:00:10 ART
-- ISSUE #79: Sub-Tipos de Documentos
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Recibo A',Updated=TO_DATE('2016-05-30 09:00:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000010 AND AD_Language='es_AR'
;

-- 30/05/2016 9:00:43 ART
-- ISSUE #79: Sub-Tipos de Documentos
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Nota de Venta al contado A',Updated=TO_DATE('2016-05-30 09:00:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000011 AND AD_Language='es_AR'
;

-- 30/05/2016 9:00:52 ART
-- ISSUE #79: Sub-Tipos de Documentos
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Factura B',Updated=TO_DATE('2016-05-30 09:00:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000012 AND AD_Language='es_AR'
;

-- 30/05/2016 9:01:19 ART
-- ISSUE #79: Sub-Tipos de Documentos
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Nota de Débito B',Updated=TO_DATE('2016-05-30 09:01:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000013 AND AD_Language='es_AR'
;

-- 30/05/2016 9:01:33 ART
-- ISSUE #79: Sub-Tipos de Documentos
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Nota de Crédito B',Updated=TO_DATE('2016-05-30 09:01:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000014 AND AD_Language='es_AR'
;

-- 30/05/2016 9:01:43 ART
-- ISSUE #79: Sub-Tipos de Documentos
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Recibo B',Updated=TO_DATE('2016-05-30 09:01:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000015 AND AD_Language='es_AR'
;

-- 30/05/2016 9:01:57 ART
-- ISSUE #79: Sub-Tipos de Documentos
UPDATE AD_Ref_List_Trl SET IsTranslated='Y',Name='Nota de Venta al contado B',Updated=TO_DATE('2016-05-30 09:01:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000016 AND AD_Language='es_AR'
;

-- 30/05/2016 9:05:06 ART
-- ISSUE #79: Sub-Tipos de Documentos
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000084,3000002,'LAR','39','Otros comprobantes A  que cumplen con la RG 1415',TO_DATE('2016-05-30 09:05:06','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-05-30 09:05:06','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 30/05/2016 9:05:06 ART
-- ISSUE #79: Sub-Tipos de Documentos
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000084 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 30/05/2016 9:05:26 ART
-- ISSUE #79: Sub-Tipos de Documentos
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000085,3000002,'LAR','40','Otros comprobantes B  que cumplen con la RG 1415',TO_DATE('2016-05-30 09:05:26','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-05-30 09:05:26','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 30/05/2016 9:05:26 ART
-- ISSUE #79: Sub-Tipos de Documentos
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000085 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 30/05/2016 9:07:45 ART
-- ISSUE #79: Sub-Tipos de Documentos
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000086,3000002,'LAR','81','Tique Factura A',TO_DATE('2016-05-30 09:07:44','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-05-30 09:07:44','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 30/05/2016 9:07:45 ART
-- ISSUE #79: Sub-Tipos de Documentos
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000086 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 30/05/2016 9:07:53 ART
-- ISSUE #79: Sub-Tipos de Documentos
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000087,3000002,'U','82','Tique Factura B',TO_DATE('2016-05-30 09:07:53','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2016-05-30 09:07:53','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 30/05/2016 9:07:53 ART
-- ISSUE #79: Sub-Tipos de Documentos
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000087 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 30/05/2016 9:07:57 ART
-- ISSUE #79: Sub-Tipos de Documentos
UPDATE AD_Ref_List SET EntityType='LAR',Updated=TO_DATE('2016-05-30 09:07:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=3000087
;

-- Registración de script
SELECT register_migration_script_lar('0070_ISSUE-79.sql', 'LAR', '') FROM dual
;
