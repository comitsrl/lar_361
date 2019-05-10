-- 10/05/2019 14:43:23 ART
-- ISSUE #77: Traducción de mensajes de error de Facturación Electronica.
INSERT INTO AD_Message (CreatedBy,MsgType,MsgText,AD_Message_ID,EntityType,Value,IsActive,Updated,AD_Client_ID,AD_Org_ID,Created,UpdatedBy) VALUES (100,'E','RuntimeError: ns1:cms.cert.expired: Certificado expirado',3000035,'LAR','RuntimeError: ns1:cms.cert.expired: Certificado expirado','Y',TO_TIMESTAMP('2019-05-10 14:43:22','YYYY-MM-DD HH24:MI:SS'),0,0,TO_TIMESTAMP('2019-05-10 14:43:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/05/2019 14:43:23 ART
-- ISSUE #77: Traducción de mensajes de error de Facturación Electronica.
INSERT INTO AD_Message_Trl (AD_Language,AD_Message_ID, MsgText,MsgTip, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Message_ID, t.MsgText,t.MsgTip, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Message t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Message_ID=3000035 AND NOT EXISTS (SELECT * FROM AD_Message_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Message_ID=t.AD_Message_ID)
;

-- 10/05/2019 14:43:39 ART
-- ISSUE #77: Traducción de mensajes de error de Facturación Electronica.
UPDATE AD_Message_Trl SET MsgText='Certificado expirado',Updated=TO_TIMESTAMP('2019-05-10 14:43:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Message_ID=3000035 AND AD_Language='es_AR'
;

-- 10/05/2019 14:51:22 ART
-- ISSUE #77: Traducción de mensajes de error de Facturación Electronica.
INSERT INTO AD_Message (CreatedBy,MsgType,MsgText,AD_Message_ID,EntityType,Value,IsActive,Updated,AD_Client_ID,AD_Org_ID,Created,UpdatedBy) VALUES (100,'E','httplib2.ServerNotFoundError: Unable to find the server at wsaahomo.afip.gov.ar',3000036,'LAR','httplib2.ServerNotFoundError: Unable to find the server at wsaahomo.afip.gov.ar','Y',TO_TIMESTAMP('2019-05-10 14:51:22','YYYY-MM-DD HH24:MI:SS'),0,0,TO_TIMESTAMP('2019-05-10 14:51:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/05/2019 14:51:22 ART
-- ISSUE #77: Traducción de mensajes de error de Facturación Electronica.
INSERT INTO AD_Message_Trl (AD_Language,AD_Message_ID, MsgText,MsgTip, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Message_ID, t.MsgText,t.MsgTip, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Message t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Message_ID=3000036 AND NOT EXISTS (SELECT * FROM AD_Message_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Message_ID=t.AD_Message_ID)
;

-- 10/05/2019 14:54:28 ART
-- ISSUE #77: Traducción de mensajes de error de Facturación Electronica.
UPDATE AD_Message_Trl SET MsgText='No fue posible conectar con el servicio wsaahomo.afip.gov.ar',Updated=TO_TIMESTAMP('2019-05-10 14:54:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Message_ID=3000036 AND AD_Language='es_AR'
;

-- 10/05/2019 16:08:28 ART
-- ISSUE #77: Traducción de mensajes de error de Facturación Electronica.
INSERT INTO AD_Message (CreatedBy,MsgType,MsgText,AD_Message_ID,EntityType,Value,IsActive,Updated,AD_Client_ID,AD_Org_ID,Created,UpdatedBy) VALUES (100,'E','httplib2.ServerNotFoundError: Unable to find the server at wsaa.afip.gov.ar',3000037,'LAR','httplib2.ServerNotFoundError: Unable to find the server at wsaa.afip.gov.ar','Y',TO_TIMESTAMP('2019-05-10 16:08:28','YYYY-MM-DD HH24:MI:SS'),0,0,TO_TIMESTAMP('2019-05-10 16:08:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/05/2019 16:08:28 ART
-- ISSUE #77: Traducción de mensajes de error de Facturación Electronica.
INSERT INTO AD_Message_Trl (AD_Language,AD_Message_ID, MsgText,MsgTip, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Message_ID, t.MsgText,t.MsgTip, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Message t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Message_ID=3000037 AND NOT EXISTS (SELECT * FROM AD_Message_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Message_ID=t.AD_Message_ID)
;

-- 10/05/2019 16:09:24 ART
-- ISSUE #77: Traducción de mensajes de error de Facturación Electronica.
UPDATE AD_Message_Trl SET MsgText='No fue posible conectar al servicio wsaa.afip.gov.ar',Updated=TO_TIMESTAMP('2019-05-10 16:09:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Message_ID=3000037 AND AD_Language='es_AR'
;

-- 10/05/2019 16:09:50 ART
-- ISSUE #77: Traducción de mensajes de error de Facturación Electronica.
UPDATE AD_Message_Trl SET MsgText='No fue posible conectar con el servicio wsaa.afip.gov.ar',Updated=TO_TIMESTAMP('2019-05-10 16:09:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Message_ID=3000037 AND AD_Language='es_AR'
;

-- 10/05/2019 16:21:18 ART
-- ISSUE #77: Traducción de mensajes de error de Facturación Electronica.
INSERT INTO AD_Message (CreatedBy,MsgType,MsgText,AD_Message_ID,EntityType,Value,IsActive,Updated,AD_Client_ID,AD_Org_ID,Created,UpdatedBy) VALUES (100,'E','httplib2.ServerNotFoundError: Unable to find the server at servicios1.afip.gov.ar',3000038,'LAR','httplib2.ServerNotFoundError: Unable to find the server at servicios1.afip.gov.ar','Y',TO_TIMESTAMP('2019-05-10 16:21:17','YYYY-MM-DD HH24:MI:SS'),0,0,TO_TIMESTAMP('2019-05-10 16:21:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/05/2019 16:21:18 ART
-- ISSUE #77: Traducción de mensajes de error de Facturación Electronica.
INSERT INTO AD_Message_Trl (AD_Language,AD_Message_ID, MsgText,MsgTip, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Message_ID, t.MsgText,t.MsgTip, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Message t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Message_ID=3000038 AND NOT EXISTS (SELECT * FROM AD_Message_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Message_ID=t.AD_Message_ID)
;

-- 10/05/2019 16:21:58 ART
-- ISSUE #77: Traducción de mensajes de error de Facturación Electronica.
UPDATE AD_Message_Trl SET MsgText='No fue posible conectar con el servicio servicios1.afip.gov.ar',Updated=TO_TIMESTAMP('2019-05-10 16:21:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Message_ID=3000038 AND AD_Language='es_AR'
;

-- Registración de script
SELECT register_migration_script_lar('0129_ISSUE-77.sql', 'LAR', '')
;
