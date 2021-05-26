-- Posición Arancelaria (Nomeclador Mercosur) y Nomeclador COT
ALTER TABLE M_Product
    ADD COLUMN PosicionArancelaria character varying(14),
    ADD COLUMN NomecladorCOT character varying(6)
;

ALTER TABLE M_InOut ADD COLUMN COTAutorizado character(1) NOT NULL DEFAULT 'N'::bpchar;
ALTER TABLE M_InOut ADD COLUMN NroConexionCOT numeric(2,0) DEFAULT 0;
ALTER TABLE M_InOut ADD COLUMN EntregaTransporte character(1) NOT NULL DEFAULT 'N'::bpchar;
ALTER TABLE M_InOut ADD COLUMN M_Shipper_Intermediario_ID numeric(10,0);
ALTER TABLE M_InOut ADD CONSTRAINT mshipperInter_minout FOREIGN KEY (M_Shipper_Intermediario_ID)
      REFERENCES adempiere.M_Shipper (M_Shipper_ID) MATCH SIMPLE;
ALTER TABLE M_InOut ADD COLUMN Shipper_Location_ID numeric(10,0);
ALTER TABLE M_InOut ADD CONSTRAINT shipperlocation_minout FOREIGN KEY (Shipper_Location_ID)
      REFERENCES adempiere.C_BPartner_Location (C_BPartner_Location_ID) MATCH SIMPLE;

-- Posición Arancelaria y Nomeclador COT
-- 10/05/2021 9:02:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001130,'posicionarancelaria','LAR','posicionarancelaria','posicionarancelaria',0,TO_DATE('2021-05-10 09:02:20','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-05-10 09:02:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 10/05/2021 9:02:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001130 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 10/05/2021 9:02:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003913,208,'LAR',0,'N','N','N','N',12,'N',10,'N',3001130,'N','Y','N','posicionarancelaria','posicionarancelaria',TO_DATE('2021-05-10 09:02:20','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-05-10 09:02:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/05/2021 9:02:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003913 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 10/05/2021 9:02:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001131,'nomecladorcot','LAR','nomecladorcot','nomecladorcot',0,TO_DATE('2021-05-10 09:02:21','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-05-10 09:02:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 10/05/2021 9:02:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001131 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 10/05/2021 9:02:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003914,208,'LAR',0,'N','N','N','N',6,'N',10,'N',3001131,'N','Y','N','nomecladorcot','nomecladorcot',TO_DATE('2021-05-10 09:02:21','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-05-10 09:02:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/05/2021 9:02:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003914 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 10/05/2021 9:02:52 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element SET ColumnName='PosicionArancelaria', Name='PosicionArancelaria', PrintName='PosicionArancelaria',Updated=TO_DATE('2021-05-10 09:02:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001130
;

-- 10/05/2021 9:02:52 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001130
;

-- 10/05/2021 9:02:52 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='PosicionArancelaria', Name='PosicionArancelaria', Description=NULL, Help=NULL WHERE AD_Element_ID=3001130
;

-- 10/05/2021 9:02:52 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='PosicionArancelaria', Name='PosicionArancelaria', Description=NULL, Help=NULL, AD_Element_ID=3001130 WHERE UPPER(ColumnName)='POSICIONARANCELARIA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 10/05/2021 9:02:52 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='PosicionArancelaria', Name='PosicionArancelaria', Description=NULL, Help=NULL WHERE AD_Element_ID=3001130 AND IsCentrallyMaintained='Y'
;

-- 10/05/2021 9:02:52 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='PosicionArancelaria', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001130) AND IsCentrallyMaintained='Y'
;

-- 10/05/2021 9:02:52 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_PrintFormatItem pi SET PrintName='PosicionArancelaria', Name='PosicionArancelaria' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001130)
;

-- 10/05/2021 9:04:28 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Posicion Arancelaria',PrintName='Posicion Arancelaria',Description='Posición Arancelaria AFIP, Nomeclador Mercosur.',Updated=TO_DATE('2021-05-10 09:04:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001130 AND AD_Language='es_AR'
;

-- 10/05/2021 9:05:39 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element SET ColumnName='NomecladorCOT', Name='NomecladorCOT', PrintName='NomecladorCOT',Updated=TO_DATE('2021-05-10 09:05:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001131
;

-- 10/05/2021 9:05:39 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001131
;

-- 10/05/2021 9:05:39 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='NomecladorCOT', Name='NomecladorCOT', Description=NULL, Help=NULL WHERE AD_Element_ID=3001131
;

-- 10/05/2021 9:05:39 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='NomecladorCOT', Name='NomecladorCOT', Description=NULL, Help=NULL, AD_Element_ID=3001131 WHERE UPPER(ColumnName)='NOMECLADORCOT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 10/05/2021 9:05:39 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='NomecladorCOT', Name='NomecladorCOT', Description=NULL, Help=NULL WHERE AD_Element_ID=3001131 AND IsCentrallyMaintained='Y'
;

-- 10/05/2021 9:05:39 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='NomecladorCOT', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001131) AND IsCentrallyMaintained='Y'
;

-- 10/05/2021 9:05:39 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_PrintFormatItem pi SET PrintName='NomecladorCOT', Name='NomecladorCOT' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001131)
;

-- 10/05/2021 9:06:39 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Nomeclador COT',PrintName='Nomeclador COT',Description='Código Nomeclador requerido para la autorización del COT, se recupera de la Posición Arancelaria.',Updated=TO_DATE('2021-05-10 09:06:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001131 AND AD_Language='es_AR'
;

-- 10/05/2021 9:07:32 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007042,6,'Y','N','N',3003914,'N','Y',180,'N','LAR','NomecladorCOT',100,0,TO_DATE('2021-05-10 09:07:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-05-10 09:07:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/05/2021 9:07:32 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007042 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/05/2021 9:07:32 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007043,12,'Y','N','N',3003913,'N','Y',180,'N','LAR','PosicionArancelaria',100,0,TO_DATE('2021-05-10 09:07:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-05-10 09:07:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/05/2021 9:07:32 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007043 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3007043
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3007042
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=1018
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=1019
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=2099
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=2098
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=1316
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=1017
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=1041
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3006606
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=1034
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=1025
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3005339
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=2097
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=5888
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=1026
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=1028
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=1027
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=2587
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=1032
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=1031
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=1319
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=1320
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=1321
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=1322
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=1569
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=5381
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3746
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=5383
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=6130
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=8307
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=6841
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=1568
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=5910
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=5911
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=6343
;

-- 10/05/2021 9:08:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=6344
;

-- 10/05/2021 9:09:10 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-05-10 09:09:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007042
;

-- 10/05/2021 9:23:24 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET FieldLength=14, VFormat='0000.00.00.000',Updated=TO_DATE('2021-05-10 09:23:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003913
;

-- 10/05/2021 11:09:05 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2021-05-10 11:09:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007042
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007029
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=2878
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=56446
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=1107
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=1104
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=1077
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=1103
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=8653
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3005559
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=1098
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=2112
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=2109
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3113
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=1099
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=2593
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=2589
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=1324
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=7038
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=7826
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=7825
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=1112
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=1113
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=1082
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=1083
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=1084
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=6560
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3660
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=2594
;

-- 10/05/2021 11:12:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=1090
;

-- 10/05/2021 11:13:24 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007008
;

-- 10/05/2021 11:13:24 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007010
;

-- 10/05/2021 11:13:24 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=6877
;

-- 10/05/2021 11:13:24 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3007004
;

-- 10/05/2021 11:13:24 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3007009
;

-- 10/05/2021 11:13:24 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3007039
;

-- 10/05/2021 11:13:24 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=4243
;

-- 10/05/2021 11:13:24 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=2930
;

-- 10/05/2021 11:13:24 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=2933
;

-- 10/05/2021 11:13:24 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=7831
;

-- 10/05/2021 11:13:24 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=7829
;

-- 10/05/2021 11:13:24 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=7830
;

-- 10/05/2021 11:13:24 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=7832
;

-- 10/05/2021 11:13:24 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=7828
;

-- 10/05/2021 11:13:24 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=7827
;

-- 10/05/2021 11:13:24 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=2707
;

-- 10/05/2021 11:13:24 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3280
;

-- 10/05/2021 11:13:24 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3281
;

-- 10/05/2021 11:13:24 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=9462
;

-- 10/05/2021 11:13:24 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=5143
;

-- 10/05/2021 11:13:24 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3007041
;

-- 10/05/2021 12:49:46 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsMandatory='Y',Updated=TO_DATE('2021-05-10 12:49:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003913
;

-- 10/05/2021 12:50:34 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124,Updated=TO_DATE('2021-05-10 12:50:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=6877
;

-- 10/05/2021 12:52:20 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2021-05-10 12:52:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007039
;

-- 12/05/2021 18:16:09 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000261,3000002,'LAR','091','Remito R',TO_DATE('2021-05-12 18:16:08','YYYY-MM-DD HH24:MI:SS'),100,TO_DATE('2021-05-12 18:16:08','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 12/05/2021 18:16:09 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000261 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 12/05/2021 18:34:42 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000121,'T','LAR','N','LAR_POS_NOREMITOS_ID',0,0,100,TO_DATE('2021-05-12 18:34:42','YYYY-MM-DD HH24:MI:SS'),'Y',TO_DATE('2021-05-12 18:34:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/05/2021 18:34:42 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000121 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 12/05/2021 18:35:30 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Ref_Table (IsValueDisplayed,WhereClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Updated,Created,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N','C_POS.IsActive=''Y'' AND C_POS.IsShipment=''N''',748,3000121,12745,12749,'LAR',100,TO_DATE('2021-05-12 18:35:30','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-05-12 18:35:30','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 12/05/2021 18:35:53 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Ref_Table SET OrderByClause='C_POS.PosNumber',Updated=TO_DATE('2021-05-12 18:35:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000121
;

-- 12/05/2021 18:37:10 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET AD_Reference_Value_ID=3000121,Updated=TO_DATE('2021-05-12 18:37:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000068
;

-- 12/05/2021 20:09:06 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001132,'cotautorizado','LAR','cotautorizado','cotautorizado',0,TO_DATE('2021-05-12 20:09:05','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-05-12 20:09:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 12/05/2021 20:09:06 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001132 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 12/05/2021 20:09:06 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003916,319,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001132,'N','Y','N','cotautorizado','cotautorizado',TO_DATE('2021-05-12 20:09:05','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-05-12 20:09:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/05/2021 20:09:06 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003916 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 12/05/2021 20:09:06 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001133,'nroconexioncot','LAR','nroconexioncot','nroconexioncot',0,TO_DATE('2021-05-12 20:09:06','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-05-12 20:09:06','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 12/05/2021 20:09:06 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001133 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 12/05/2021 20:09:07 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003917,319,'LAR',0,'N','N','N','N',2,'N',22,'N',3001133,'N','Y','N','nroconexioncot','nroconexioncot',TO_DATE('2021-05-12 20:09:06','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-05-12 20:09:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/05/2021 20:09:07 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003917 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 12/05/2021 20:10:18 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET Name='Nro. de Conexion COT', ColumnName='NroConexionCOT',Updated=TO_DATE('2021-05-12 20:10:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003917
;

-- 12/05/2021 20:10:18 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003917
;

-- 12/05/2021 20:10:18 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Nro. de Conexion COT', Description=NULL, Help=NULL WHERE AD_Column_ID=3003917 AND IsCentrallyMaintained='Y'
;

-- 12/05/2021 20:10:26 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET Name='Nro. de Conexion COT',Updated=TO_DATE('2021-05-12 20:10:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003917 AND AD_Language='es_AR'
;

-- 12/05/2021 20:10:42 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element SET ColumnName='NroConexionCOT', Name='Nro. de Conexion COT', PrintName='Nro. de Conexion COT',Updated=TO_DATE('2021-05-12 20:10:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001133
;

-- 12/05/2021 20:10:42 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001133
;

-- 12/05/2021 20:10:42 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='NroConexionCOT', Name='Nro. de Conexion COT', Description=NULL, Help=NULL WHERE AD_Element_ID=3001133
;

-- 12/05/2021 20:10:42 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='NroConexionCOT', Name='Nro. de Conexion COT', Description=NULL, Help=NULL, AD_Element_ID=3001133 WHERE UPPER(ColumnName)='NROCONEXIONCOT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 12/05/2021 20:10:42 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='NroConexionCOT', Name='Nro. de Conexion COT', Description=NULL, Help=NULL WHERE AD_Element_ID=3001133 AND IsCentrallyMaintained='Y'
;

-- 12/05/2021 20:10:42 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Nro. de Conexion COT', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001133) AND IsCentrallyMaintained='Y'
;

-- 12/05/2021 20:10:42 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_PrintFormatItem pi SET PrintName='Nro. de Conexion COT', Name='Nro. de Conexion COT' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001133)
;

-- 12/05/2021 20:10:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='Nro. de Conexion COT',PrintName='Nro. de Conexion COT',Updated=TO_DATE('2021-05-12 20:10:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001133 AND AD_Language='es_AR'
;

-- 12/05/2021 20:11:42 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET Name='COT Autorizado', ColumnName='COTAutorizado',Updated=TO_DATE('2021-05-12 20:11:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003916
;

-- 12/05/2021 20:11:42 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003916
;

-- 12/05/2021 20:11:42 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='COT Autorizado', Description=NULL, Help=NULL WHERE AD_Column_ID=3003916 AND IsCentrallyMaintained='Y'
;

-- 12/05/2021 20:11:49 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET Name='COT Autorizado',Updated=TO_DATE('2021-05-12 20:11:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003916 AND AD_Language='es_AR'
;

-- 12/05/2021 20:11:59 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element SET ColumnName='COTAutorizado', Name='COT Autorizado', PrintName='COT Autorizado',Updated=TO_DATE('2021-05-12 20:11:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001132
;

-- 12/05/2021 20:11:59 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001132
;

-- 12/05/2021 20:11:59 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='COTAutorizado', Name='COT Autorizado', Description=NULL, Help=NULL WHERE AD_Element_ID=3001132
;

-- 12/05/2021 20:11:59 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='COTAutorizado', Name='COT Autorizado', Description=NULL, Help=NULL, AD_Element_ID=3001132 WHERE UPPER(ColumnName)='COTAUTORIZADO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 12/05/2021 20:11:59 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='COTAutorizado', Name='COT Autorizado', Description=NULL, Help=NULL WHERE AD_Element_ID=3001132 AND IsCentrallyMaintained='Y'
;

-- 12/05/2021 20:11:59 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='COT Autorizado', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001132) AND IsCentrallyMaintained='Y'
;

-- 12/05/2021 20:11:59 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_PrintFormatItem pi SET PrintName='COT Autorizado', Name='COT Autorizado' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001132)
;

-- 12/05/2021 20:12:09 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='COT Autorizado',PrintName='COT Autorizado',Updated=TO_DATE('2021-05-12 20:12:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001132 AND AD_Language='es_AR'
;

-- 12/05/2021 20:12:42 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_DATE('2021-05-12 20:12:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003916
;

-- 12/05/2021 20:14:49 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007045,1,'Y','N','N',3003916,'N','Y',257,'N','LAR','COT Autorizado',100,0,TO_DATE('2021-05-12 20:14:49','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-05-12 20:14:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/05/2021 20:14:49 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007045 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/05/2021 20:14:50 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007046,2,'Y','N','N',3003917,'N','Y',257,'N','LAR','Nro. de Conexion COT',100,0,TO_DATE('2021-05-12 20:14:49','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-05-12 20:14:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 12/05/2021 20:14:50 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007046 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 12/05/2021 20:15:35 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=9462
;

-- 12/05/2021 20:15:35 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007046
;

-- 12/05/2021 20:15:35 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=5143
;

-- 12/05/2021 20:15:35 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3007041
;

-- 12/05/2021 20:15:35 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3007045
;

-- 12/05/2021 20:17:20 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3007045
;

-- 12/05/2021 20:17:20 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3007039
;

-- 12/05/2021 20:17:20 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=4243
;

-- 12/05/2021 20:17:20 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=2930
;

-- 12/05/2021 20:17:20 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=2933
;

-- 12/05/2021 20:17:20 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=7831
;

-- 12/05/2021 20:17:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=7829
;

-- 12/05/2021 20:17:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=7830
;

-- 12/05/2021 20:17:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=7832
;

-- 12/05/2021 20:17:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=7828
;

-- 12/05/2021 20:17:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=7827
;

-- 12/05/2021 20:17:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=2707
;

-- 12/05/2021 20:17:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3280
;

-- 12/05/2021 20:17:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3281
;

-- 12/05/2021 20:17:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=5143
;

-- 12/05/2021 20:17:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3007041
;

-- 12/05/2021 20:17:36 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-05-12 20:17:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007045
;

-- 12/05/2021 20:17:46 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2021-05-12 20:17:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003916
;

-- 12/05/2021 21:03:07 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET AD_Reference_ID=11,Updated=TO_DATE('2021-05-12 21:03:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003917
;

-- 12/05/2021 21:03:58 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124, DisplayLogic='@DeliveryViaRule@=S',Updated=TO_DATE('2021-05-12 21:03:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007045
;

-- 12/05/2021 21:45:46 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ReadOnlyLogic='@DocStatus@!''CO'' & @DocStatus@!''CL''',Updated=TO_DATE('2021-05-12 21:45:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003692
;

-- 12/05/2021 21:47:55 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ReadOnlyLogic=NULL,Updated=TO_DATE('2021-05-12 21:47:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003692
;

-- 12/05/2021 21:49:02 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=S & @EsCOTManual@=N & @DocStatus@=CO & @DocStatus@=C''',Updated=TO_DATE('2021-05-12 21:49:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007004
;

-- 12/05/2021 21:50:22 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=S & @EsCOTManual@=N & @DocStatus@=CO | @DocStatus@=CL',Updated=TO_DATE('2021-05-12 21:50:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007004
;

-- 13/05/2021 18:55:23 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001134,'cotmanual','LAR','cotmanual','cotmanual',0,TO_DATE('2021-05-13 18:55:22','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-05-13 18:55:22','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 13/05/2021 18:55:23 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001134 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 13/05/2021 18:55:23 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003918,319,'LAR',0,'N','N','N','N',60,'N',10,'N',3001134,'N','Y','N','cotmanual','cotmanual',TO_DATE('2021-05-13 18:55:22','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-05-13 18:55:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 13/05/2021 18:55:23 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003918 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 13/05/2021 18:56:00 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET Name='COT Manual', ColumnName='COTManual',Updated=TO_DATE('2021-05-13 18:56:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003918
;

-- 13/05/2021 18:56:00 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003918
;

-- 13/05/2021 18:56:00 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='COT Manual', Description=NULL, Help=NULL WHERE AD_Column_ID=3003918 AND IsCentrallyMaintained='Y'
;

-- 13/05/2021 18:56:05 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET Name='COT Manual',Updated=TO_DATE('2021-05-13 18:56:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003918 AND AD_Language='es_AR'
;

-- 13/05/2021 18:56:17 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element SET ColumnName='COTManual', Name='COT Manual', PrintName='COT Manual',Updated=TO_DATE('2021-05-13 18:56:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001134
;

-- 13/05/2021 18:56:17 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001134
;

-- 13/05/2021 18:56:17 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='COTManual', Name='COT Manual', Description=NULL, Help=NULL WHERE AD_Element_ID=3001134
;

-- 13/05/2021 18:56:17 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='COTManual', Name='COT Manual', Description=NULL, Help=NULL, AD_Element_ID=3001134 WHERE UPPER(ColumnName)='COTMANUAL' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 13/05/2021 18:56:17 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='COTManual', Name='COT Manual', Description=NULL, Help=NULL WHERE AD_Element_ID=3001134 AND IsCentrallyMaintained='Y'
;

-- 13/05/2021 18:56:17 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='COT Manual', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001134) AND IsCentrallyMaintained='Y'
;

-- 13/05/2021 18:56:17 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_PrintFormatItem pi SET PrintName='COT Manual', Name='COT Manual' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001134)
;

-- 13/05/2021 18:56:32 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='COT Manual',PrintName='COT Manual',Updated=TO_DATE('2021-05-13 18:56:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001134 AND AD_Language='es_AR'
;

-- 13/05/2021 18:57:33 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007047,60,'Y','N','N',3003918,'N','Y',257,'N','LAR','COT Manual',100,0,TO_DATE('2021-05-13 18:57:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-05-13 18:57:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 13/05/2021 18:57:33 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007047 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 13/05/2021 19:02:22 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=S & @EsCOTManual@=Y',Updated=TO_DATE('2021-05-13 19:02:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007047
;

-- 13/05/2021 19:02:29 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2021-05-13 19:02:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003918
;

-- 13/05/2021 19:03:17 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2021-05-13 19:03:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007045
;

-- 13/05/2021 19:31:05 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='1=0',Updated=TO_DATE('2021-05-13 19:31:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007045
;

-- 13/05/2021 19:45:46 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@COTAutorizado@=N',Updated=TO_DATE('2021-05-13 19:45:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007041
;

-- 13/05/2021 19:46:09 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=S',Updated=TO_DATE('2021-05-13 19:46:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=6877
;

-- 13/05/2021 19:46:27 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@COTAutorizado@=N & @DeliveryViaRule@=S',Updated=TO_DATE('2021-05-13 19:46:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007041
;

-- 13/05/2021 19:46:45 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3007041
;

-- 13/05/2021 19:46:45 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3007039
;

-- 13/05/2021 19:46:45 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=4243
;

-- 13/05/2021 19:46:45 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=2930
;

-- 13/05/2021 19:46:45 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=2933
;

-- 13/05/2021 19:46:45 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=7831
;

-- 13/05/2021 19:46:45 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=7829
;

-- 13/05/2021 19:46:45 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=7830
;

-- 13/05/2021 19:46:45 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=7832
;

-- 13/05/2021 19:46:45 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=7828
;

-- 13/05/2021 19:46:45 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=7827
;

-- 13/05/2021 19:46:45 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=2707
;

-- 13/05/2021 19:46:45 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3280
;

-- 13/05/2021 19:46:45 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3281
;

-- 13/05/2021 19:46:45 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=5143
;

-- 13/05/2021 19:46:45 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3007047
;

-- 13/05/2021 19:46:51 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-05-13 19:46:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2700
;

-- 13/05/2021 20:06:48 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
DELETE  FROM  AD_Field_Trl WHERE AD_Field_ID=3007047
;

-- 13/05/2021 20:06:48 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
DELETE FROM AD_Field WHERE AD_Field_ID=3007047
;

-- 13/05/2021 20:07:06 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
DELETE  FROM  AD_Column_Trl WHERE AD_Column_ID=3003918
;

-- 13/05/2021 20:07:06 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
DELETE FROM AD_Column WHERE AD_Column_ID=3003918
;

-- 14/05/2021 21:06:12 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003920,319,'LAR',0,'N','N','N','N',60,'N',10,'N',3001134,'N','Y','N','COT Manual','COTManual',TO_DATE('2021-05-14 21:06:11','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-05-14 21:06:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/05/2021 21:06:12 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003920 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/05/2021 21:06:12 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001136,'entregatransporte','LAR','entregatransporte','entregatransporte',0,TO_DATE('2021-05-14 21:06:12','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-05-14 21:06:12','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 14/05/2021 21:06:12 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001136 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 14/05/2021 21:06:13 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003921,319,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001136,'N','Y','N','entregatransporte','entregatransporte',TO_DATE('2021-05-14 21:06:12','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-05-14 21:06:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/05/2021 21:06:13 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003921 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/05/2021 21:06:13 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001137,'m_shipper_intermediario_id','LAR','m_shipper_intermediario_id','m_shipper_intermediario_id',0,TO_DATE('2021-05-14 21:06:13','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-05-14 21:06:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 14/05/2021 21:06:13 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001137 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 14/05/2021 21:06:13 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003922,319,'LAR',0,'N','N','N','N',10,'N',19,'N',3001137,'N','Y','N','m_shipper_intermediario_id','m_shipper_intermediario_id',TO_DATE('2021-05-14 21:06:13','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-05-14 21:06:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/05/2021 21:06:13 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003922 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/05/2021 21:06:13 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001138,'shipper_location_id','LAR','shipper_location_id','shipper_location_id',0,TO_DATE('2021-05-14 21:06:13','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-05-14 21:06:13','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 14/05/2021 21:06:13 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001138 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 14/05/2021 21:06:13 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003923,319,'LAR',0,'N','N','N','N',10,'N',19,'N',3001138,'N','Y','N','shipper_location_id','shipper_location_id',TO_DATE('2021-05-14 21:06:13','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-05-14 21:06:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/05/2021 21:06:13 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003923 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/05/2021 21:06:34 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
DELETE  FROM  AD_Column_Trl WHERE AD_Column_ID=3003920
;

-- 14/05/2021 21:06:34 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
DELETE FROM AD_Column WHERE AD_Column_ID=3003920
;

-- 14/05/2021 21:07:31 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET Name='Entrega en Transporte', ColumnName='EntregaTransporte',Updated=TO_DATE('2021-05-14 21:07:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003921
;

-- 14/05/2021 21:07:31 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003921
;

-- 14/05/2021 21:07:31 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Entrega en Transporte', Description=NULL, Help=NULL WHERE AD_Column_ID=3003921 AND IsCentrallyMaintained='Y'
;

-- 14/05/2021 21:07:41 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET Name='Entrega en Transporte',Updated=TO_DATE('2021-05-14 21:07:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003921 AND AD_Language='es_AR'
;

-- 14/05/2021 21:07:56 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element SET ColumnName='EntregaTransporte', Name='Entrega en Transporte', PrintName='Entrega en Transporte',Updated=TO_DATE('2021-05-14 21:07:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001136
;

-- 14/05/2021 21:07:56 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001136
;

-- 14/05/2021 21:07:56 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='EntregaTransporte', Name='Entrega en Transporte', Description=NULL, Help=NULL WHERE AD_Element_ID=3001136
;

-- 14/05/2021 21:07:56 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='EntregaTransporte', Name='Entrega en Transporte', Description=NULL, Help=NULL, AD_Element_ID=3001136 WHERE UPPER(ColumnName)='ENTREGATRANSPORTE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 14/05/2021 21:07:56 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='EntregaTransporte', Name='Entrega en Transporte', Description=NULL, Help=NULL WHERE AD_Element_ID=3001136 AND IsCentrallyMaintained='Y'
;

-- 14/05/2021 21:07:56 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Entrega en Transporte', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001136) AND IsCentrallyMaintained='Y'
;

-- 14/05/2021 21:07:56 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_PrintFormatItem pi SET PrintName='Entrega en Transporte', Name='Entrega en Transporte' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001136)
;

-- 14/05/2021 21:08:01 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='Entrega en Transporte',PrintName='Entrega en Transporte',Updated=TO_DATE('2021-05-14 21:08:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001136 AND AD_Language='es_AR'
;

-- 14/05/2021 21:09:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000122,'T','LAR','N','LAR_Transportes',0,0,100,TO_DATE('2021-05-14 21:09:47','YYYY-MM-DD HH24:MI:SS'),'Y',TO_DATE('2021-05-14 21:09:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/05/2021 21:09:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000122 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 14/05/2021 21:10:29 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Ref_Table (IsValueDisplayed,OrderByClause,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Updated,Created,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N','Name',253,3000122,2077,2085,'LAR',100,TO_DATE('2021-05-14 21:10:29','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2021-05-14 21:10:29','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 14/05/2021 21:11:02 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET AD_Reference_Value_ID=3000122, AD_Reference_ID=18, Name='Transporte Intermediario', ColumnName='M_Shipper_Intermediario_ID',Updated=TO_DATE('2021-05-14 21:11:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003922
;

-- 14/05/2021 21:11:02 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003922
;

-- 14/05/2021 21:11:02 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Transporte Intermediario', Description=NULL, Help=NULL WHERE AD_Column_ID=3003922 AND IsCentrallyMaintained='Y'
;

-- 14/05/2021 21:12:15 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET Name='Transporte Intermediario',Updated=TO_DATE('2021-05-14 21:12:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003922 AND AD_Language='es_AR'
;

-- 14/05/2021 21:12:30 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element SET ColumnName='M_Shipper_Intermediario_ID', Name='Transporte Intermediario', PrintName='Transporte Intermediario',Updated=TO_DATE('2021-05-14 21:12:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001137
;

-- 14/05/2021 21:12:30 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001137
;

-- 14/05/2021 21:12:30 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='M_Shipper_Intermediario_ID', Name='Transporte Intermediario', Description=NULL, Help=NULL WHERE AD_Element_ID=3001137
;

-- 14/05/2021 21:12:30 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='M_Shipper_Intermediario_ID', Name='Transporte Intermediario', Description=NULL, Help=NULL, AD_Element_ID=3001137 WHERE UPPER(ColumnName)='M_SHIPPER_INTERMEDIARIO_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 14/05/2021 21:12:30 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='M_Shipper_Intermediario_ID', Name='Transporte Intermediario', Description=NULL, Help=NULL WHERE AD_Element_ID=3001137 AND IsCentrallyMaintained='Y'
;

-- 14/05/2021 21:12:30 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Transporte Intermediario', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001137) AND IsCentrallyMaintained='Y'
;

-- 14/05/2021 21:12:30 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_PrintFormatItem pi SET PrintName='Transporte Intermediario', Name='Transporte Intermediario' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001137)
;

-- 14/05/2021 21:12:42 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='Transporte Intermediario',PrintName='Transporte Intermediario',Updated=TO_DATE('2021-05-14 21:12:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001137 AND AD_Language='es_AR'
;

-- 14/05/2021 21:14:53 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET AD_Reference_Value_ID=159, AD_Reference_ID=18, Name='Dirección del Transporte', ColumnName='Shipper_Location_ID',Updated=TO_DATE('2021-05-14 21:14:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003923
;

-- 14/05/2021 21:14:53 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003923
;

-- 14/05/2021 21:14:53 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Dirección del Transporte', Description=NULL, Help=NULL WHERE AD_Column_ID=3003923 AND IsCentrallyMaintained='Y'
;

-- 14/05/2021 21:15:02 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column_Trl SET Name='Dirección del Transporte',Updated=TO_DATE('2021-05-14 21:15:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003923 AND AD_Language='es_AR'
;

-- 14/05/2021 21:15:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element SET ColumnName='Shipper_Location_ID', Name='Dirección del Transporte', PrintName='Dirección del Transporte',Updated=TO_DATE('2021-05-14 21:15:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001138
;

-- 14/05/2021 21:15:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001138
;

-- 14/05/2021 21:15:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET ColumnName='Shipper_Location_ID', Name='Dirección del Transporte', Description=NULL, Help=NULL WHERE AD_Element_ID=3001138
;

-- 14/05/2021 21:15:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='Shipper_Location_ID', Name='Dirección del Transporte', Description=NULL, Help=NULL, AD_Element_ID=3001138 WHERE UPPER(ColumnName)='SHIPPER_LOCATION_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 14/05/2021 21:15:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Process_Para SET ColumnName='Shipper_Location_ID', Name='Dirección del Transporte', Description=NULL, Help=NULL WHERE AD_Element_ID=3001138 AND IsCentrallyMaintained='Y'
;

-- 14/05/2021 21:15:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET Name='Dirección del Transporte', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001138) AND IsCentrallyMaintained='Y'
;

-- 14/05/2021 21:15:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_PrintFormatItem pi SET PrintName='Dirección del Transporte', Name='Dirección del Transporte' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001138)
;

-- 14/05/2021 21:15:33 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Element_Trl SET Name='Dirección del Transporte',PrintName='Dirección del Transporte',Updated=TO_DATE('2021-05-14 21:15:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001138 AND AD_Language='es_AR'
;

-- 14/05/2021 21:16:20 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007049,10,'Y','N','N',3003923,'N','Y',257,'N','LAR','Dirección del Transporte',100,0,TO_DATE('2021-05-14 21:16:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-05-14 21:16:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/05/2021 21:16:20 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007049 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/05/2021 21:16:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007050,1,'Y','N','N',3003921,'N','Y',257,'N','LAR','Entrega en Transporte',100,0,TO_DATE('2021-05-14 21:16:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-05-14 21:16:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/05/2021 21:16:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007050 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/05/2021 21:16:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007051,10,'Y','N','N',3003922,'N','Y',257,'N','LAR','Transporte Intermediario',100,0,TO_DATE('2021-05-14 21:16:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-05-14 21:16:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 14/05/2021 21:16:21 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007051 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/05/2021 21:18:49 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3007050
;

-- 14/05/2021 21:18:49 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3007051
;

-- 14/05/2021 21:18:49 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3007049
;

-- 14/05/2021 21:18:49 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3007039
;

-- 14/05/2021 21:18:49 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=4243
;

-- 14/05/2021 21:18:49 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=2930
;

-- 14/05/2021 21:18:49 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=2933
;

-- 14/05/2021 21:18:49 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=7831
;

-- 14/05/2021 21:18:49 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=7829
;

-- 14/05/2021 21:18:49 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=7830
;

-- 14/05/2021 21:18:49 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=7832
;

-- 14/05/2021 21:18:49 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=7828
;

-- 14/05/2021 21:18:49 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=7827
;

-- 14/05/2021 21:18:49 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=2707
;

-- 14/05/2021 21:18:49 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3280
;

-- 14/05/2021 21:18:49 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3281
;

-- 14/05/2021 21:18:49 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=5143
;

-- 14/05/2021 21:19:06 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-05-14 21:19:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007049
;

-- 14/05/2021 21:20:17 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@DeliveryViaRule@=S',Updated=TO_DATE('2021-05-14 21:20:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007050
;

-- 14/05/2021 21:20:41 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@EntregaTransporte@=Y',Updated=TO_DATE('2021-05-14 21:20:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007051
;

-- 14/05/2021 21:20:52 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET DisplayLogic='@EntregaTransporte@=Y',Updated=TO_DATE('2021-05-14 21:20:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007049
;

-- 14/05/2021 21:21:02 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2021-05-14 21:21:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003923
;

-- 14/05/2021 21:22:10 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2021-05-14 21:22:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003922
;

-- 14/05/2021 21:22:22 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_DATE('2021-05-14 21:22:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003921
;

-- 14/05/2021 21:38:46 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('C_BPartner_Location.C_BPartner_ID = (SELECT s.C_BPartner_ID FROM M_Shipper s WHERE s.M_Shipper_ID = @M_Shipper_Intermediario_ID@) AND C_BPartner_Location.IsShipTo=''Y'' AND C_BPartner_Location.IsActive=''Y''','S',3000089,'LAR','LAR_Shipper_Location',100,100,TO_DATE('2021-05-14 21:38:45','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2021-05-14 21:38:45','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/05/2021 21:39:07 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET AD_Val_Rule_ID=3000089,Updated=TO_DATE('2021-05-14 21:39:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003923
;

-- 14/05/2021 21:57:44 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124,Updated=TO_DATE('2021-05-14 21:57:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007051
;

-- 14/05/2021 21:58:19 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET MandatoryLogic='@EntregaTransporte@=Y',Updated=TO_DATE('2021-05-14 21:58:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003922
;

-- 14/05/2021 21:58:49 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET MandatoryLogic='@EntregaTransporte@=Y',Updated=TO_DATE('2021-05-14 21:58:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003923
;

-- 14/05/2021 21:58:55 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124,Updated=TO_DATE('2021-05-14 21:58:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007049
;

-- 14/05/2021 21:59:05 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET AD_FieldGroup_ID=124,Updated=TO_DATE('2021-05-14 21:59:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007050
;

-- 14/05/2021 22:00:55 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Field SET IsMandatory='Y',Updated=TO_DATE('2021-05-14 22:00:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2943
;

-- 17/05/2021 18:12:35 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Ref_Table SET OrderByClause='M_Shipper.Name',Updated=TO_DATE('2021-05-17 18:12:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000122
;

ALTER TABLE LAR_ConfiguracionFE ADD COLUMN COT character(1) default 'N';
ALTER TABLE LAR_ConfiguracionFE ALTER Servicio DROP NOT NULL;
ALTER TABLE LAR_ConfiguracionFE ALTER TiempoVidaTicket DROP NOT NULL;
ALTER TABLE LAR_ConfiguracionFE ALTER DstDN DROP NOT NULL;
ALTER TABLE LAR_ConfiguracionFE ALTER CMS DROP NOT NULL;
ALTER TABLE LAR_ConfiguracionFE ALTER Concepto DROP NOT NULL;

-- 10/05/2021 18:38:23 ART
-- ISSUE #140: Configuración para WebService ARBA.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003915,3000137,'LAR',0,'N','N','N','N',1,'N',20,'N',3001102,'N','Y','N','COT','COT',TO_DATE('2021-05-10 18:38:22','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2021-05-10 18:38:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/05/2021 18:38:23 ART
-- ISSUE #140: Configuración para WebService ARBA.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003915 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 10/05/2021 18:39:38 ART
-- ISSUE #140: Configuración para WebService ARBA.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007044,1,'Y','N','N',3003915,'N','Y',3000228,'N','LAR','COT',100,0,TO_DATE('2021-05-10 18:39:37','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2021-05-10 18:39:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/05/2021 18:39:38 ART
-- ISSUE #140: Configuración para WebService ARBA.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007044 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/05/2021 18:40:20 ART
-- ISSUE #140: Configuración para WebService ARBA.
UPDATE AD_Field SET DisplayLogic='@COT@=''N''',Updated=TO_DATE('2021-05-10 18:40:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006878
;

-- 10/05/2021 18:44:23 ART
-- ISSUE #140: Configuración para WebService ARBA.
UPDATE AD_Field SET SeqNo=40,IsDisplayed='Y' WHERE AD_Field_ID=3006888
;

-- 10/05/2021 18:44:23 ART
-- ISSUE #140: Configuración para WebService ARBA.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3006878
;

-- 10/05/2021 18:44:23 ART
-- ISSUE #140: Configuración para WebService ARBA.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3007044
;

-- 10/05/2021 18:45:09 ART
-- ISSUE #140: Configuración para WebService ARBA.
UPDATE AD_Field SET DisplayLogic='@COT@=''N''',Updated=TO_DATE('2021-05-10 18:45:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006887
;

-- 10/05/2021 18:45:17 ART
-- ISSUE #140: Configuración para WebService ARBA.
UPDATE AD_Field SET DisplayLogic='@COT@=''N''',Updated=TO_DATE('2021-05-10 18:45:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006881
;

-- 10/05/2021 18:45:29 ART
-- ISSUE #140: Configuración para WebService ARBA.
UPDATE AD_Field SET DisplayLogic='@COT@=''N''',Updated=TO_DATE('2021-05-10 18:45:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006885
;

-- 10/05/2021 18:45:37 ART
-- ISSUE #140: Configuración para WebService ARBA.
UPDATE AD_Field SET DisplayLogic='@COT@=''N''',Updated=TO_DATE('2021-05-10 18:45:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006889
;

-- 10/05/2021 18:45:45 ART
-- ISSUE #140: Configuración para WebService ARBA.
UPDATE AD_Field SET DisplayLogic='@COT@=''N''',Updated=TO_DATE('2021-05-10 18:45:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006890
;

-- 10/05/2021 18:46:46 ART
-- ISSUE #140: Configuración para WebService ARBA.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3006891
;

-- 10/05/2021 18:46:46 ART
-- ISSUE #140: Configuración para WebService ARBA.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3006881
;

-- 10/05/2021 18:46:46 ART
-- ISSUE #140: Configuración para WebService ARBA.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3006885
;

-- 10/05/2021 18:46:53 ART
-- ISSUE #140: Configuración para WebService ARBA.
UPDATE AD_Field SET IsSameLine='N',Updated=TO_DATE('2021-05-10 18:46:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006891
;

-- 10/05/2021 18:47:08 ART
-- ISSUE #140: Configuración para WebService ARBA.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2021-05-10 18:47:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006881
;

-- 17/05/2021 20:03:15 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsMandatory='N', MandatoryLogic='@COT@=N',Updated=TO_DATE('2021-05-17 20:03:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003630
;

-- 17/05/2021 20:03:34 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET MandatoryLogic='@COT@=N',Updated=TO_DATE('2021-05-17 20:03:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003632
;

-- 17/05/2021 20:03:38 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsMandatory='N',Updated=TO_DATE('2021-05-17 20:03:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003632
;

-- 17/05/2021 20:04:01 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsMandatory='N', MandatoryLogic='@COT@=N',Updated=TO_DATE('2021-05-17 20:04:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003639
;

-- 17/05/2021 20:04:13 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsMandatory='N', MandatoryLogic='@COT@=N',Updated=TO_DATE('2021-05-17 20:04:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003629
;

-- 17/05/2021 20:04:28 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsMandatory='N', MandatoryLogic='@COT@=N',Updated=TO_DATE('2021-05-17 20:04:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003624
;

-- 17/05/2021 20:04:39 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Column SET IsMandatory='N', MandatoryLogic='@COT@=N',Updated=TO_DATE('2021-05-17 20:04:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003625
;

-- 17/05/2021 20:10:20 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Menu SET Name='Configuración de Servicios Web Cliente',Updated=TO_DATE('2021-05-17 20:10:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=3000367
;

-- 17/05/2021 20:10:20 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Menu_Trl SET IsTranslated='N' WHERE AD_Menu_ID=3000367
;

-- 17/05/2021 20:10:26 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Menu_Trl SET IsTranslated='Y',Name='Configuración de Servicios Web Cliente',Updated=TO_DATE('2021-05-17 20:10:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=3000367 AND AD_Language='es_AR'
;

-- 17/05/2021 20:10:39 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Window SET Name='Configuración de Servicios Web Cliente',Updated=TO_DATE('2021-05-17 20:10:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Window_ID=3000099
;

-- 17/05/2021 20:10:39 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Window_Trl SET IsTranslated='N' WHERE AD_Window_ID=3000099
;

-- 17/05/2021 20:10:39 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Menu SET Name='Configuración de Servicios Web Cliente', Description=NULL, IsActive='Y',Updated=TO_DATE('2021-05-17 20:10:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=3000367
;

-- 17/05/2021 20:10:39 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Menu_Trl SET IsTranslated='N' WHERE AD_Menu_ID=3000367
;

-- 17/05/2021 20:10:47 ART
-- -- ISSUE #140: Solicitud de COT, para remitos.
UPDATE AD_Window_Trl SET IsTranslated='Y',Name='Configuración de Servicios Web Cliente',Updated=TO_DATE('2021-05-17 20:10:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Window_ID=3000099 AND AD_Language='es_AR'
;

-- Registración de script
SELECT register_migration_script_lar('0171_ISSUE-140.sql', 'LAR', '') FROM dual
;
