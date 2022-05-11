ALTER TABLE M_ProductionLine ADD COLUMN EsPerdida character(1) not null default 'N';
ALTER TABLE C_Order ADD COLUMN Prioridad numeric(10,0);

-- 10/05/2022 20:01:22 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001245,'esperdida','LAR','esperdida','esperdida',0,TO_TIMESTAMP('2022-05-10 20:01:21','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2022-05-10 20:01:21','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 10/05/2022 20:01:22 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001245 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 10/05/2022 20:01:22 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004459,326,'LAR',0,'Y','N','N','N',1,'N',20,'N',3001245,'N','Y','N','esperdida','esperdida',TO_TIMESTAMP('2022-05-10 20:01:21','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2022-05-10 20:01:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/05/2022 20:01:22 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004459 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 10/05/2022 20:01:55 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Element SET ColumnName='EsPerdida', Name='Es Perdida', PrintName='Es Perdida',Updated=TO_TIMESTAMP('2022-05-10 20:01:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001245
;

-- 10/05/2022 20:01:55 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001245
;

-- 10/05/2022 20:01:55 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Column SET ColumnName='EsPerdida', Name='Es Perdida', Description=NULL, Help=NULL WHERE AD_Element_ID=3001245
;

-- 10/05/2022 20:01:55 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Process_Para SET ColumnName='EsPerdida', Name='Es Perdida', Description=NULL, Help=NULL, AD_Element_ID=3001245 WHERE UPPER(ColumnName)='ESPERDIDA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 10/05/2022 20:01:55 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Process_Para SET ColumnName='EsPerdida', Name='Es Perdida', Description=NULL, Help=NULL WHERE AD_Element_ID=3001245 AND IsCentrallyMaintained='Y'
;

-- 10/05/2022 20:01:55 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET Name='Es Perdida', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001245) AND IsCentrallyMaintained='Y'
;

-- 10/05/2022 20:01:55 ART
-- PRT 2: Configuración Productos.
UPDATE AD_PrintFormatItem SET PrintName='Es Perdida', Name='Es Perdida' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001245)
;

-- 10/05/2022 20:02:00 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Element_Trl SET Name='Es Perdida',PrintName='Es Perdida',Updated=TO_TIMESTAMP('2022-05-10 20:02:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001245 AND AD_Language='es_AR'
;

-- 10/05/2022 20:02:13 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Column_Trl SET Name='Es Perdida',Updated=TO_TIMESTAMP('2022-05-10 20:02:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004459 AND AD_Language='es_AR'
;

-- 10/05/2022 20:04:35 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007778,1,'Y','N','N',3004459,'N','Y',53345,'N','LAR','Es Perdida',100,0,'Y',TO_TIMESTAMP('2022-05-10 20:04:35','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2022-05-10 20:04:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/05/2022 20:04:35 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007778 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/05/2022 20:06:01 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3007778
;

-- 10/05/2022 20:06:01 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=59837
;

-- 10/05/2022 20:06:01 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=61970
;

-- 10/05/2022 20:06:01 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=59766
;

-- 10/05/2022 20:06:01 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=59765
;

-- 10/05/2022 20:06:01 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=61971
;

-- 10/05/2022 20:06:01 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=59763
;

-- 10/05/2022 20:06:11 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2022-05-10 20:06:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007778
;

-- 10/05/2022 20:09:38 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001246,'prioridad','LAR','prioridad','prioridad',0,TO_TIMESTAMP('2022-05-10 20:09:38','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2022-05-10 20:09:38','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 10/05/2022 20:09:38 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001246 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 10/05/2022 20:09:39 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3004460,259,'LAR',0,'N','N','N','N',10,'N',11,'N',3001246,'N','Y','N','prioridad','prioridad',TO_TIMESTAMP('2022-05-10 20:09:38','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2022-05-10 20:09:38','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/05/2022 20:09:39 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3004460 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 10/05/2022 20:10:18 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Column SET Name='Prioridad', ColumnName='Prioridad',Updated=TO_TIMESTAMP('2022-05-10 20:10:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004460
;

-- 10/05/2022 20:10:18 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3004460
;

-- 10/05/2022 20:10:18 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET Name='Prioridad', Description=NULL, Help=NULL WHERE AD_Column_ID=3004460 AND IsCentrallyMaintained='Y'
;

-- 10/05/2022 20:10:37 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Element SET ColumnName='Prioridad', Name='Prioridad', PrintName='Prioridad',Updated=TO_TIMESTAMP('2022-05-10 20:10:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001246
;

-- 10/05/2022 20:10:37 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001246
;

-- 10/05/2022 20:10:37 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Column SET ColumnName='Prioridad', Name='Prioridad', Description=NULL, Help=NULL WHERE AD_Element_ID=3001246
;

-- 10/05/2022 20:10:37 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Process_Para SET ColumnName='Prioridad', Name='Prioridad', Description=NULL, Help=NULL, AD_Element_ID=3001246 WHERE UPPER(ColumnName)='PRIORIDAD' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 10/05/2022 20:10:37 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Process_Para SET ColumnName='Prioridad', Name='Prioridad', Description=NULL, Help=NULL WHERE AD_Element_ID=3001246 AND IsCentrallyMaintained='Y'
;

-- 10/05/2022 20:10:37 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET Name='Prioridad', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001246) AND IsCentrallyMaintained='Y'
;

-- 10/05/2022 20:10:37 ART
-- PRT 2: Configuración Productos.
UPDATE AD_PrintFormatItem SET PrintName='Prioridad', Name='Prioridad' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001246)
;

-- 10/05/2022 20:10:41 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Element_Trl SET Name='Prioridad',PrintName='Prioridad',Updated=TO_TIMESTAMP('2022-05-10 20:10:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001246 AND AD_Language='es_AR'
;

-- 10/05/2022 20:11:32 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Column_Trl SET Name='Prioridad',Updated=TO_TIMESTAMP('2022-05-10 20:11:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004460 AND AD_Language='es_AR'
;

-- 10/05/2022 20:11:58 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3007779,10,'Y','N','N',3004460,'N','Y',186,'N','LAR','Prioridad',100,0,'Y',TO_TIMESTAMP('2022-05-10 20:11:58','YYYY-MM-DD HH24:MI:SS'),0,TO_TIMESTAMP('2022-05-10 20:11:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 10/05/2022 20:11:58 ART
-- PRT 2: Configuración Productos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3007779 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 10/05/2022 20:16:38 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Column SET DefaultValue='@SQL=SELECT COALESCE(MAX(Prioridad),0)+10 AS DefaultValue FROM C_Order @',Updated=TO_TIMESTAMP('2022-05-10 20:16:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004460
;

-- 10/05/2022 20:17:18 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Column SET DefaultValue='@SQL=SELECT COALESCE(MAX(Prioridad),0)+10 AS DefaultValue FROM C_Order@',Updated=TO_TIMESTAMP('2022-05-10 20:17:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004460
;

-- 10/05/2022 20:18:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=1125
;

-- 10/05/2022 20:18:51 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=1125
;

-- 10/05/2022 20:19:18 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3007779
;

-- 10/05/2022 20:19:18 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=2876
;

-- 10/05/2022 20:19:27 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_TIMESTAMP('2022-05-10 20:19:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2876
;

-- 10/05/2022 20:20:01 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field_Trl SET Name='Fecha de Producción',Description='Fecha Prometida de Producción',Help=NULL,Updated=TO_TIMESTAMP('2022-05-10 20:20:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2876 AND AD_Language='es_AR'
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3007779
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3002015
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3007116
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=1093
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=1094
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=1573
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=2876
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=2590
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=1114
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=2877
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3003388
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=55410
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=55411
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=55412
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=1108
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=1109
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3007026
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3007033
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3007030
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3007031
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3007032
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=1104
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3006998
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=1077
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=1103
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=8653
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3005559
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=1098
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3113
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=1099
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=2593
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=2594
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=1112
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=1113
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=1084
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=1082
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=6560
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=1083
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3660
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=1090
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3007245
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=1324
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=7826
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=7825
;

-- 10/05/2022 20:25:02 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=7038
;

-- 10/05/2022 20:25:39 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2022-05-10 20:25:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=2876
;

-- 10/05/2022 20:25:50 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2022-05-10 20:25:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3007779
;

-- 10/05/2022 20:29:58 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Column SET DefaultValue='@SQL=SELECT COALESCE(MAX(Prioridad),0)+10 AS DefaultValue FROM C_Order WHERE AD_Client_ID = @AD_Client_ID@',Updated=TO_TIMESTAMP('2022-05-10 20:29:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3004460
;

-- 10/05/2022 20:31:08 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Column SET DefaultValue='@#Date@',Updated=TO_TIMESTAMP('2022-05-10 20:31:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3719
;

-- 11/05/2022 17:27:43 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=2876
;

-- 11/05/2022 17:27:43 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3007779
;

-- 11/05/2022 17:27:43 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3002015
;

-- 11/05/2022 17:27:43 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3007116
;

-- 11/05/2022 17:27:43 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=1093
;

-- 11/05/2022 17:27:43 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=1094
;

-- 11/05/2022 17:27:43 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=1573
;

-- 11/05/2022 17:27:43 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=2590
;

-- 11/05/2022 17:27:43 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=1114
;

-- 11/05/2022 17:27:43 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=2877
;

-- 11/05/2022 17:27:43 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3003388
;

-- 11/05/2022 17:27:43 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=55410
;

-- 11/05/2022 17:27:43 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=55411
;

-- 11/05/2022 17:27:43 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=55412
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=1108
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=1109
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3007026
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3007033
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3007030
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3007031
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3007032
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=1104
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3006998
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=1077
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=1103
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=8653
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3005559
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=1098
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3113
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=1099
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=2593
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=2594
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=1112
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=1113
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=1084
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=1082
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=6560
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=1083
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3660
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=1090
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3007245
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=1324
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=7826
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=7825
;

-- 11/05/2022 17:27:44 ART
-- PRT 2: Configuración Productos.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=7038
;

-- Registración de script
SELECT register_migration_script_lar('0211_ISSUE-154.sql', 'LAR', '')
;
