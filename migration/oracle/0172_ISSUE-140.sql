-- Posición Arancelaria (Nomeclador Mercosur) y Nomeclador COT
ALTER TABLE M_Product
    ADD COLUMN PosicionArancelaria character varying(14),
    ADD COLUMN NomecladorCOT character varying(6)
;

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

-- Registración de script
SELECT register_migration_script_lar('0171_ISSUE-140.sql', 'LAR', '') FROM dual
;
