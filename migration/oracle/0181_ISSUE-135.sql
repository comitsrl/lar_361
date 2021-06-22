ALTER TABLE C_Invoice ADD COLUMN CopiarLineasOrigen character(1);
ALTER TABLE C_Order ADD COLUMN CopiarLineasOrigen character(1);

-- 18/06/2021 19:39:36 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3001144,'copiarlineasorigen','LAR','copiarlineasorigen','copiarlineasorigen',0,TO_DATE('2021-06-18 19:39:35','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-06-18 19:39:35','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 18/06/2021 19:39:36 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001144 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 18/06/2021 19:39:36 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003978,318,'LAR',0,'N','N','N','N',1,'N',20,'N',3001144,'N','Y','N','copiarlineasorigen','copiarlineasorigen',100,TO_DATE('2021-06-18 19:39:35','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-06-18 19:39:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/06/2021 19:39:36 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003978 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 18/06/2021 19:41:12 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Column SET AD_Reference_ID=28, Name='Copiar Líneas desde Factura Origen', ColumnName='CopiarLineasOrigen',Updated=TO_DATE('2021-06-18 19:41:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003978
;

-- 18/06/2021 19:41:12 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003978
;

-- 18/06/2021 19:41:12 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET Name='Copiar Líneas desde Factura Origen', Description=NULL, Help=NULL WHERE AD_Column_ID=3003978 AND IsCentrallyMaintained='Y'
;

-- 18/06/2021 19:41:43 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Element SET ColumnName='CopiarLineasOrigen', Name='Copiar Líneas desde Factura Origen', PrintName='Copiar Líneas desde Factura Origen',Updated=TO_DATE('2021-06-18 19:41:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001144
;

-- 18/06/2021 19:41:43 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001144
;

-- 18/06/2021 19:41:43 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Column SET ColumnName='CopiarLineasOrigen', Name='Copiar Líneas desde Factura Origen', Description=NULL, Help=NULL WHERE AD_Element_ID=3001144
;

-- 18/06/2021 19:41:43 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Process_Para SET ColumnName='CopiarLineasOrigen', Name='Copiar Líneas desde Factura Origen', Description=NULL, Help=NULL, AD_Element_ID=3001144 WHERE UPPER(ColumnName)='COPIARLINEASORIGEN' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 18/06/2021 19:41:43 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Process_Para SET ColumnName='CopiarLineasOrigen', Name='Copiar Líneas desde Factura Origen', Description=NULL, Help=NULL WHERE AD_Element_ID=3001144 AND IsCentrallyMaintained='Y'
;

-- 18/06/2021 19:41:43 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET Name='Copiar Líneas desde Factura Origen', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001144) AND IsCentrallyMaintained='Y'
;

-- 18/06/2021 19:41:43 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_PrintFormatItem pi SET PrintName='Copiar Líneas desde Factura Origen', Name='Copiar Líneas desde Factura Origen' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001144)
;

-- 18/06/2021 19:41:49 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Element_Trl SET Name='Copiar Líneas desde Factura Origen',PrintName='Copiar Líneas desde Factura Origen',Updated=TO_DATE('2021-06-18 19:41:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001144 AND AD_Language='es_AR'
;

-- 18/06/2021 19:42:10 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Column_Trl SET Name='Copiar Líneas desde Factura Origen',Updated=TO_DATE('2021-06-18 19:42:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003978 AND AD_Language='es_AR'
;

-- 18/06/2021 19:42:47 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007076,1,'Y','N','N',3003978,'N','Y',263,'N','LAR','Copiar Líneas desde Factura Origen',100,0,TO_DATE('2021-06-18 19:42:47','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-06-18 19:42:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 18/06/2021 19:42:47 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007076 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/06/2021 19:43:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET DisplayLogic='@TargetDocBaseType@=''ARC'' | @DocSubTypeCAE@=202 | @DocSubTypeCAE@=2 | @DocSubTypeCAE@=207 | @DocSubTypeCAE@=7 | @DocSubTypeCAE@=212 | @DocSubTypeCAE@=52',Updated=TO_DATE('2021-06-18 19:43:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007076
;

-- 18/06/2021 19:47:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,Description,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES (3000421,'N','N','1','N','N','Y','LAR',2605,1379,'ar.com.ergio.process.LAR_CopiarLineasFacturaOrigen','Copiar líneas desde Factura Origen.','LAR_CopiarLineasFacturaOrigen','LAR_CopiarLineasFacturaOrigen',0,0,100,TO_DATE('2021-06-18 19:47:37','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2021-06-18 19:47:37','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 18/06/2021 19:47:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000421 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 18/06/2021 19:49:09 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Column SET AD_Process_ID=3000421,Updated=TO_DATE('2021-06-18 19:49:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003978
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=2779
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3007076
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=2961
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3007000
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=2765
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=2770
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=8648
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3005560
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=2763
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=2953
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3273
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=2956
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3112
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=2774
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=2764
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=2768
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3001994
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=6935
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=2775
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=7794
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=7795
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=2786
;

-- 18/06/2021 19:50:37 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3006572
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=1000017
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=2778
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=2780
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=1000016
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=2771
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=6564
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=2777
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=8657
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3663
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=10485
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=13700
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3899
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000025
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000026
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=60970
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000605
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=53257
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000027
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3004048
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=53258
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000028
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3002136
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3002142
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3002138
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3274
;

-- 18/06/2021 19:50:38 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3006683
;

-- 18/06/2021 19:50:52 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-06-18 19:50:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007076
;

-- 18/06/2021 20:00:02 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Column SET Callout=NULL,Updated=TO_DATE('2021-06-18 20:00:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000265
;

-- 22/06/2021 18:40:55 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003979,259,'LAR',0,'N','N','N','N',1,'N',20,'N',3001144,'N','Y','N','Copiar Líneas desde Factura Origen','CopiarLineasOrigen',100,TO_DATE('2021-06-22 18:40:54','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2021-06-22 18:40:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/06/2021 18:40:55 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003979 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/06/2021 18:42:17 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,Description,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES (3000423,'N','N','1','N','N','Y','U',2612,1383,'ar.com.ergio.process.LAR_CopiarLineasFacturaOrigenON','Copiar líneas desde Factura Origen.','LAR_CopiarLineasFacturaOrigenON','LAR_CopiarLineasFacturaOrigenON',0,0,100,TO_DATE('2021-06-22 18:42:16','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2021-06-22 18:42:16','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 22/06/2021 18:42:17 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000423 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 22/06/2021 18:42:49 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Column SET AD_Reference_ID=28, AD_Process_ID=3000423,Updated=TO_DATE('2021-06-22 18:42:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003979
;

-- 22/06/2021 18:43:25 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007116,1,'Y','N','N',3003979,'N','Y',186,'N','LAR','Copiar Líneas desde Factura Origen',100,0,TO_DATE('2021-06-22 18:43:25','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-06-22 18:43:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/06/2021 18:43:25 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007116 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3007116
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=2590
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=6561
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=1572
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=6558
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=2877
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=1110
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=1114
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3003388
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=10124
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=55410
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=55411
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=55412
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=1108
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=1109
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=2878
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=56446
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=1107
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3007026
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3007033
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3007030
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3007031
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3007032
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=1104
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3006998
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=1077
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=1103
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=8653
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3005559
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=1098
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3272
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=2112
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=2109
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3113
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=1099
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=56906
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3001993
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=2593
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=2589
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=1324
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=7038
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=7826
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=7825
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=2594
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=1112
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=1113
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=1082
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=1084
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=60922
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=6560
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=1083
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3660
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=1090
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3004046
;

-- 22/06/2021 18:45:45 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3001597
;

-- 22/06/2021 18:48:19 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Column SET Callout=NULL,Updated=TO_DATE('2021-06-22 18:48:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001210
;

-- 22/06/2021 20:25:13 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-06-22 20:25:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007116
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007116
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=2590
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=6561
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=1572
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=6558
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=2877
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=1110
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=1114
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3003388
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=10124
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=55410
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=55411
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=55412
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=1108
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=1109
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=2878
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=56446
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=1107
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3007026
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3007033
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3007030
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3007031
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3007032
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=1104
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3006998
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=1077
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=1103
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=8653
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3005559
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=1098
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3272
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=2112
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=2109
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3113
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=1099
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=56906
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3001993
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=2593
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=2589
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=1324
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=7038
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=7826
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=7825
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=2594
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=1112
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=1113
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=1082
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=1084
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=60922
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=6560
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=1083
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3660
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=1090
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3004046
;

-- 22/06/2021 20:25:42 ART
-- ISSUE #135: Compatibilizar mensajes al usuario, con la versión Web del ERP.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3001597
;

-- Registración de script
SELECT register_migration_script_lar('0181_ISSUE-135.sql', 'LAR', '') FROM dual
;
