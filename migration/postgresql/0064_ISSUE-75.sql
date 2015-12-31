-- Creación de la nueva columna Source_Invoice_ID
-- En la tabla C_Order
ALTER TABLE C_Order ADD COLUMN
Source_Invoice_ID numeric(10,0);

--Se agega la nueva columna al DA
-- 22/12/2015 8:54:00 ART
-- ISSUE #75: Orden de Nota de Crédito
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001210,259,'LAR',0,'N','N','N','N',10,'N',19,'N',3000079,'N','Y','N','Source_Invoice_ID','Source_Invoice_ID',100,TO_TIMESTAMP('2015-12-22 08:53:59','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2015-12-22 08:53:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 22/12/2015 8:54:00 ART
-- ISSUE #75: Orden de Nota de Crédito
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001210 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/12/2015 8:58:38 ART
-- ISSUE #75: Orden de Nota de Crédito
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,SeqNo,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,DisplayLogic,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002015,10,'Y','N','N',3001210,'N',570,'N',186,'N','@DocSubTypeSO@=''WI''','LAR','Source_Order_ID',100,0,TO_TIMESTAMP('2015-12-22 08:58:37','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2015-12-22 08:58:37','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/12/2015 8:58:38 ART
-- ISSUE #75: Orden de Nota de Crédito
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002015 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/12/2015 9:01:34 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Column SET AD_Reference_Value_ID=3000012, AD_Reference_ID=30,Updated=TO_TIMESTAMP('2015-12-22 09:01:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001210
;

-- 22/12/2015 9:01:42 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_TIMESTAMP('2015-12-22 09:01:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001210
;

-- 22/12/2015 9:01:53 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET Name='Source_Invoice_ID',Updated=TO_TIMESTAMP('2015-12-22 09:01:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002015
;

-- 22/12/2015 9:01:53 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field_Trl SET IsTranslated='N' WHERE AD_Field_ID=3002015
;

-- 22/12/2015 9:03:37 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field_Trl SET IsTranslated='Y',Description='Factura Origen',Updated=TO_TIMESTAMP('2015-12-22 09:03:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002015 AND AD_Language='es_AR'
;

-- 22/12/2015 9:03:56 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field_Trl SET Name='Factura Origen',Description='Factura a partir de la cual se generará la Nota de Crédito',Updated=TO_TIMESTAMP('2015-12-22 09:03:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002015 AND AD_Language='es_AR'
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3002015
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=6562
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=1094
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=1573
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=6559
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=2590
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=6561
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=1572
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=6558
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=2877
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=1110
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=1114
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=10124
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=55410
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=55411
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=55412
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=1108
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=1109
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=2878
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=56446
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=1107
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=1104
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=1077
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=1103
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=8653
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=1098
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3272
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=2112
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=2109
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3113
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=1099
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=56906
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=2593
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=2589
;

-- 22/12/2015 9:06:09 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=1324
;

-- 22/12/2015 9:06:10 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=7038
;

-- 22/12/2015 9:06:10 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=7826
;

-- 22/12/2015 9:06:10 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=7825
;

-- 22/12/2015 9:06:10 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=1112
;

-- 22/12/2015 9:06:10 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=1113
;

-- 22/12/2015 9:06:10 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=1082
;

-- 22/12/2015 9:06:10 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=1084
;

-- 22/12/2015 9:06:10 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=60922
;

-- 22/12/2015 9:06:10 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=6560
;

-- 22/12/2015 9:06:10 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=1083
;

-- 22/12/2015 9:06:10 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3660
;

-- 22/12/2015 9:06:10 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3001597
;

-- 22/12/2015 9:06:10 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=60972
;

-- 22/12/2015 9:06:10 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000750
;

-- 22/12/2015 9:06:10 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=1090
;

-- 22/12/2015 9:26:36 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET DisplayLogic='@C_DocTypeTarget_ID@=1000130 | @C_DocTypeTarget_ID@=1000131 | @C_DocTypeTarget_ID@=1000133 | @C_DocTypeTarget_ID@=1000134',Updated=TO_TIMESTAMP('2015-12-22 09:26:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002015
;

-- 22/12/2015 9:31:58 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Column SET MandatoryLogic='@C_DocTypeTarget_ID@=1000130 | @C_DocTypeTarget_ID@=1000131 | @C_DocTypeTarget_ID@=1000133 | @C_DocTypeTarget_ID@=1000134',Updated=TO_TIMESTAMP('2015-12-22 09:31:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001210
;

-- 22/12/2015 9:34:43 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=1093
;

-- 22/12/2015 9:34:43 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=6562
;

-- 22/12/2015 9:34:43 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=1094
;

-- 22/12/2015 9:34:43 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=1573
;

-- 22/12/2015 9:34:43 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=6559
;

-- 22/12/2015 9:34:43 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3002015
;

-- Se referencia el Callout para Source_Invoice_ID
-- 28/12/2015 20:09:14 ART
-- ISSUE #75: Orden de Nota de Crédito
UPDATE AD_Column SET Callout='ar.com.ergio.model.LAR_Callouts.copiaLineasDesdeFacturaOrigen',Updated=TO_TIMESTAMP('2015-12-28 20:09:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001210
;

-- Registración de Script
SELECT register_migration_script_lar('0064_ISSUE-75.sql','LAR','')
;
