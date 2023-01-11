-- 01/10/2022 10:16:26 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,CopyFromProcess,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,CreatedBy,Updated,Created,IsActive) VALUES (3000500,'N','N','3','N','N','Y','LAR',0,0,'ar.com.ergio.process.LAR_CreacionPDV','N','LAR_CreacionPDV','LAR_CreacionPDV',0,0,100,100,TO_DATE('2022-10-01 10:16:26','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-10-01 10:16:26','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 01/10/2022 10:16:26 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000500 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 01/10/2022 10:33:18 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000833,0,3000500,100,'N',11,10,'N','LAR','Numero Punto de venta','nroPDV','Y',0,100,TO_DATE('2022-10-01 10:33:18','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-10-01 10:33:18','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 01/10/2022 10:33:18 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000833 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;


 
-- 14/10/2022 21:15:51 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000156,'T','LAR','N','LAR AD_Org (all)',0,0,100,TO_DATE('2022-10-14 21:15:51','YYYY-MM-DD HH24:MI:SS'),'Y',TO_DATE('2022-10-14 21:15:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/10/2022 21:15:51 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000156 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 14/10/2022 21:17:25 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Ref_Table (IsValueDisplayed,OrderByClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Updated,Created,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N','AD_Org.Value',155,3000156,528,522,'LAR',100,TO_DATE('2022-10-14 21:17:25','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-10-14 21:17:25','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 14/10/2022 21:25:10 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,AD_Val_Rule_ID,SeqNo,IsMandatory,AD_Reference_Value_ID,DefaultValue,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000848,0,3000500,100,'N',18,202,20,'N',3000156,'-1','LAR','Organizacion','ad_org_id','Y',0,100,TO_DATE('2022-10-14 21:25:09','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-10-14 21:25:09','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 14/10/2022 21:25:10 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000848 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 14/10/2022 21:27:17 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,EntityType,DisplayLogic,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000849,0,3000500,100,'N',20,30,'N','N','LAR','@esFiscal@=''N'' & @esMiles@=''N''','Es Electronico?','esElectronico','Y',0,100,TO_DATE('2022-10-14 21:27:16','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-10-14 21:27:16','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 14/10/2022 21:27:17 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000849 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 14/10/2022 21:29:10 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,EntityType,DisplayLogic,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000850,0,3000500,100,'N',20,40,'N','N','LAR','@esElectronico@=''N'' & @esMiles@=''N''','Es fiscal?','esFiscal','Y',0,100,TO_DATE('2022-10-14 21:29:10','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-10-14 21:29:10','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 14/10/2022 21:29:10 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000850 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 14/10/2022 21:31:52 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000157,'T','LAR','N','LAR Fiscal Printers',0,0,100,TO_DATE('2022-10-14 21:31:52','YYYY-MM-DD HH24:MI:SS'),'Y',TO_DATE('2022-10-14 21:31:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/10/2022 21:31:52 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000157 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 14/10/2022 21:33:56 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Ref_Table (IsValueDisplayed,WhereClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Updated,Created,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N','LAR_Fiscal_Printer.AD_Client_ID=@AD_Client_ID@',3000001,3000157,3000012,3000021,'LAR',100,TO_DATE('2022-10-14 21:33:56','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-10-14 21:33:56','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 14/10/2022 21:34:28 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,AD_Reference_Value_ID,EntityType,DisplayLogic,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000851,0,3000500,100,'N',18,50,'Y',3000157,'LAR','@esFiscal@=''Y''','Controlador Fiscal','lar_fiscalprinter_id','Y',0,100,TO_DATE('2022-10-14 21:34:28','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-10-14 21:34:28','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 14/10/2022 21:34:28 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000851 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 14/10/2022 21:36:19 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,EntityType,DisplayLogic,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000852,0,3000500,100,'N',20,60,'N','''N''','LAR','@esFiscal@=''N'' & @esElectronico@=''N''','Es Miles?','esMiles','Y',0,100,TO_DATE('2022-10-14 21:36:19','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-10-14 21:36:19','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 14/10/2022 21:36:19 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000852 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 14/10/2022 21:41:30 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,AD_Val_Rule_ID,SeqNo,IsMandatory,AD_Reference_Value_ID,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000853,0,3000500,100,'N',18,189,70,'N',197,'LAR','Deposito','M_Wharehouse_ID','Y',0,100,TO_DATE('2022-10-14 21:41:30','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-10-14 21:41:30','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 14/10/2022 21:41:30 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000853 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 14/10/2022 21:44:33 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('M_Wharehouse.AD_Org_ID=@AD_Org_ID@','S',3000123,'U','LAR M_Warehouse Org ',100,100,TO_DATE('2022-10-14 21:44:33','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2022-10-14 21:44:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/10/2022 21:44:53 ART
-- ISSUE #158: proceso de creacion de PDV
UPDATE AD_Process_Para SET AD_Val_Rule_ID=3000123,Updated=TO_DATE('2022-10-14 21:44:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000853
;

-- 14/10/2022 21:47:23 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('C_BankAccount.AD_Client_ID=@AD_Client_ID@','S',3000124,'LAR','LAR_BankAccount of Client (inc 0)',100,100,TO_DATE('2022-10-14 21:47:23','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2022-10-14 21:47:23','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/10/2022 21:47:43 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,AD_Reference_Value_ID,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000854,0,3000500,100,'N',18,80,'Y',53283,'LAR','Caja','caja','Y',0,100,TO_DATE('2022-10-14 21:47:43','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-10-14 21:47:43','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 14/10/2022 21:47:43 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000854 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 14/10/2022 21:49:18 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,AD_Val_Rule_ID,SeqNo,IsMandatory,AD_Reference_Value_ID,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000855,0,3000500,100,'N',18,116,90,'Y',166,'LAR','Lista de precios','listaPrecios','Y',0,100,TO_DATE('2022-10-14 21:49:18','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-10-14 21:49:18','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 14/10/2022 21:49:18 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000855 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 14/10/2022 21:50:07 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000856,0,3000500,100,'N',20,100,'N','''N''','LAR','Crear Remito','crearRemito','Y',0,100,TO_DATE('2022-10-14 21:50:07','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-10-14 21:50:07','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 14/10/2022 21:50:07 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000856 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 14/10/2022 22:13:58 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,Description,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('C_DocType.DocBaseType=''MMS'' & C_DocType.IsActive=''Y''','S',3000125,'LAR','LAR C_DocType (MMS)','Levanta los tipos de remitos',100,100,TO_DATE('2022-10-14 22:13:58','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2022-10-14 22:13:58','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/10/2022 22:14:04 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,AD_Reference_Value_ID,EntityType,DisplayLogic,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000857,0,3000500,100,'N',18,110,'Y',3000029,'LAR','@crearRemito@=''N''','Remito a utilizar','remito','Y',0,100,TO_DATE('2022-10-14 22:14:04','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-10-14 22:14:04','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 14/10/2022 22:14:04 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000857 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 14/10/2022 22:14:24 ART
-- ISSUE #158: proceso de creacion de PDV
UPDATE AD_Process_Para SET AD_Val_Rule_ID=3000125,Updated=TO_DATE('2022-10-14 22:14:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000857
;

-- 14/10/2022 22:15:09 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000858,0,3000500,100,'N',20,120,'N','''N''','LAR','Crear Recibo','crearRecibo','Y',0,100,TO_DATE('2022-10-14 22:15:09','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-10-14 22:15:09','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 14/10/2022 22:15:09 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000858 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 14/10/2022 22:18:34 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,Description,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('C_DocType.DocBaseType=''ARR'' & C_DocType.IsActive=''Y''','S',3000126,'U','LAR C_DocType (ARR)','Levanta los tipos de remitos',100,100,TO_DATE('2022-10-14 22:18:33','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2022-10-14 22:18:33','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/10/2022 22:18:38 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,AD_Val_Rule_ID,SeqNo,IsMandatory,AD_Reference_Value_ID,EntityType,DisplayLogic,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000859,0,3000500,100,'N',18,3000125,130,'Y',170,'LAR','@crearRecibo@=''N''','Recibo a utilizar','recibo','Y',0,100,TO_DATE('2022-10-14 22:18:38','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2022-10-14 22:18:38','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 14/10/2022 22:18:38 ART
-- ISSUE #158: proceso de creacion de PDV
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000859 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- Registración de script
SELECT register_migration_script_lar('0214_ISSUE-158.sql', 'LAR', '')
;

-- 05/01/2023 11:53:30 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET ColumnName='NroPDV',Updated=TO_DATE('2023-01-05 11:53:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000833
;

-- 05/01/2023 11:53:46 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET ColumnName='AD_Org_ID',Updated=TO_DATE('2023-01-05 11:53:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000848
;

-- 05/01/2023 11:53:54 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET ColumnName='EsElectronico',Updated=TO_DATE('2023-01-05 11:53:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000849
;

-- 05/01/2023 11:54:00 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET ColumnName='EsFiscal',Updated=TO_DATE('2023-01-05 11:54:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000850
;

-- 05/01/2023 11:54:15 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET ColumnName='LAR_FiscalPrinter_ID',Updated=TO_DATE('2023-01-05 11:54:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000851
;

-- 05/01/2023 11:54:21 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET ColumnName='EsMiles',Updated=TO_DATE('2023-01-05 11:54:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000852
;

-- 05/01/2023 11:54:48 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET ColumnName='C_BankAccount_ID',Updated=TO_DATE('2023-01-05 11:54:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000854
;

-- 05/01/2023 11:55:04 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET ColumnName='M_PriceList_ID',Updated=TO_DATE('2023-01-05 11:55:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000855
;

-- 05/01/2023 11:55:11 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET ColumnName='CrearRemito',Updated=TO_DATE('2023-01-05 11:55:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000856
;

-- 05/01/2023 11:59:56 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET ColumnName='C_DocType_InOut_ID',Updated=TO_DATE('2023-01-05 11:59:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000857
;

-- 05/01/2023 12:00:10 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET ColumnName='CrearRecibo',Updated=TO_DATE('2023-01-05 12:00:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000858
;

-- 05/01/2023 12:00:45 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET DisplayLogic='@CrearRecibo@=''N''', ColumnName='C_DocType_Payment_ID',Updated=TO_DATE('2023-01-05 12:00:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000859
;

-- 05/01/2023 12:01:04 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET DisplayLogic='@CrearRemito@=''N''',Updated=TO_DATE('2023-01-05 12:01:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000857
;

-- 05/01/2023 12:01:35 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET DisplayLogic='@EsFiscal@=''N'' & @EsElectronico@=''N''',Updated=TO_DATE('2023-01-05 12:01:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000852
;

-- 05/01/2023 12:01:43 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET DisplayLogic='@EsFiscal@=''Y''',Updated=TO_DATE('2023-01-05 12:01:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000851
;

-- 05/01/2023 12:01:54 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET DisplayLogic='@EsElectronico@=''N'' & @EsMiles@=''N''',Updated=TO_DATE('2023-01-05 12:01:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000850
;

-- 05/01/2023 12:02:07 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET DisplayLogic='@EsFiscal@=''N'' & @EsMiles@=''N''',Updated=TO_DATE('2023-01-05 12:02:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000849
;

-- 05/01/2023 13:10:29 ART
-- ISSUE #158: Proceso de creacion de PDVs
INSERT INTO AD_Menu (AD_Menu_ID,IsSummary,Action,IsSOTrx,IsReadOnly,AD_Process_ID,EntityType,IsCentrallyMaintained,Name,Created,IsActive,UpdatedBy,AD_Client_ID,CreatedBy,Updated,AD_Org_ID) VALUES (3000463,'N','P','N','N',3000500,'LAR','Y','Crear Punto de Venta',TO_DATE('2023-01-05 13:10:28','YYYY-MM-DD HH24:MI:SS'),'Y',100,0,100,TO_DATE('2023-01-05 13:10:28','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 05/01/2023 13:10:29 ART
-- ISSUE #158: Proceso de creacion de PDVs
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=3000463 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- 05/01/2023 13:10:29 ART
-- ISSUE #158: Proceso de creacion de PDVs
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', SysDate, 100, SysDate, 100,t.AD_Tree_ID, 3000463, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=3000463)
;

-- 05/01/2023 13:10:36 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=0, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000463
;

-- 05/01/2023 13:10:36 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=1, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000008
;

-- 05/01/2023 13:10:36 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=2, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000002
;

-- 05/01/2023 13:10:36 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=3, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000369
;

-- 05/01/2023 13:10:36 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_TreeNodeMM SET Parent_ID=3000000, SeqNo=4, Updated=SysDate WHERE AD_Tree_ID=10 AND Node_ID=3000001
;

-- 06/01/2023 8:54:49 ART
-- ISSUE #158: Proceso de creacion de PDVs
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000162,'T','LAR','N','LAR_M_PriceList for Client',0,0,100,TO_DATE('2023-01-06 08:54:48','YYYY-MM-DD HH24:MI:SS'),'Y',TO_DATE('2023-01-06 08:54:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 06/01/2023 8:54:49 ART
-- ISSUE #158: Proceso de creacion de PDVs
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000162 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 06/01/2023 8:55:30 ART
-- ISSUE #158: Proceso de creacion de PDVs
INSERT INTO AD_Ref_Table (IsValueDisplayed,WhereClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Updated,Created,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N','M_PriceList.AD_Client_ID=@#AD_Client_ID@',255,3000162,2100,2108,'LAR',100,TO_DATE('2023-01-06 08:55:30','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-01-06 08:55:30','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 06/01/2023 8:55:46 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET AD_Val_Rule_ID=NULL, AD_Reference_Value_ID=3000162,Updated=TO_DATE('2023-01-06 08:55:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000855
;

-- 06/01/2023 18:03:23 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Val_Rule SET Code='C_DocType.DocBaseType=''MMS'' AND C_DocType.IsActive=''Y'' AND C_DocType.AD_Client_ID=''#@''',Updated=TO_DATE('2023-01-06 18:03:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000125
;

-- 06/01/2023 18:06:38 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Val_Rule SET Code='C_DocType.DocBaseType=''MMS'' AND C_DocType.IsActive=''Y'' AND C_DocType.AD_Client_ID=''@#AD_Client_ID@''',Updated=TO_DATE('2023-01-06 18:06:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000125
;

-- 06/01/2023 18:06:48 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET AD_Reference_Value_ID=170,Updated=TO_DATE('2023-01-06 18:06:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000857
;

-- 06/01/2023 18:07:42 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Val_Rule SET Code='C_DocType.DocBaseType=''ARR'' AND C_DocType.IsActive=''Y'' AND C_DocType.AD_Client_ID=''@#AD_Client_ID@''',Updated=TO_DATE('2023-01-06 18:07:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000126
;

-- 06/01/2023 18:07:46 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Val_Rule SET EntityType='LAR',Updated=TO_DATE('2023-01-06 18:07:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000126
;

-- 06/01/2023 18:07:56 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET AD_Val_Rule_ID=3000126,Updated=TO_DATE('2023-01-06 18:07:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000859
;

-- 06/01/2023 18:37:42 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Ref_Table SET WhereClause='AD_Org.IsSummary=''N''',Updated=TO_DATE('2023-01-06 18:37:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000156
;

-- 06/01/2023 19:19:36 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET IsMandatory='Y',Updated=TO_DATE('2023-01-06 19:19:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000833
;

-- 06/01/2023 19:19:47 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET IsMandatory='Y',Updated=TO_DATE('2023-01-06 19:19:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000848
;

-- 06/01/2023 19:20:05 ART
-- ISSUE #158: Proceso de creacion de PDVs
UPDATE AD_Process_Para SET IsMandatory='Y',Updated=TO_DATE('2023-01-06 19:20:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000853
;

-- Registración de script
SELECT register_migration_script_lar('0214_ISSUE-158.sql', 'LAR', '') FROM dual
;
