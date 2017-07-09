-- Crea la Columna para el Nuevo Botón en la cabecera de Pagos
ALTER TABLE LAR_PaymentHeader
ADD COLUMN CalculaRetencion character(1);

-- 06/07/2017 20:19:56 ART
-- ISSUE #81: Retenciones en Pagos
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000458,'calcularetencion','LAR','calcularetencion','calcularetencion',0,TO_TIMESTAMP('2017-07-06 20:19:55','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2017-07-06 20:19:55','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 06/07/2017 20:19:56 ART
-- ISSUE #81: Retenciones en Pagos
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000458 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 06/07/2017 20:19:57 ART
-- ISSUE #81: Retenciones en Pagos
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002111,3000010,'LAR',0,'N','N','N','N',1,'N',20,'N',3000458,'N','Y','N','calcularetencion','calcularetencion',100,TO_TIMESTAMP('2017-07-06 20:19:55','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2017-07-06 20:19:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 06/07/2017 20:19:57 ART
-- ISSUE #81: Retenciones en Pagos
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002111 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 06/07/2017 20:20:45 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Element SET ColumnName='CalculaRetencion', Name='CalculaRetencion',Updated=TO_TIMESTAMP('2017-07-06 20:20:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000458
;

-- 06/07/2017 20:20:45 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000458
;

-- 06/07/2017 20:20:45 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Column SET ColumnName='CalculaRetencion', Name='CalculaRetencion', Description=NULL, Help=NULL WHERE AD_Element_ID=3000458
;

-- 06/07/2017 20:20:45 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Process_Para SET ColumnName='CalculaRetencion', Name='CalculaRetencion', Description=NULL, Help=NULL, AD_Element_ID=3000458 WHERE UPPER(ColumnName)='CALCULARETENCION' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 06/07/2017 20:20:45 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Process_Para SET ColumnName='CalculaRetencion', Name='CalculaRetencion', Description=NULL, Help=NULL WHERE AD_Element_ID=3000458 AND IsCentrallyMaintained='Y'
;

-- 06/07/2017 20:20:45 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET Name='CalculaRetencion', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000458) AND IsCentrallyMaintained='Y'
;

-- 06/07/2017 20:20:45 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_PrintFormatItem SET PrintName='calcularetencion', Name='CalculaRetencion' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000458)
;

-- 06/07/2017 20:21:00 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Element_Trl SET IsTranslated='Y',Name='Calcula Retencion',PrintName='Calcula Retencion',Updated=TO_TIMESTAMP('2017-07-06 20:21:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000458 AND AD_Language='es_AR'
;

-- 06/07/2017 20:21:07 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Element_Trl SET Name='Calcula Retención',PrintName='Calcula Retención',Updated=TO_TIMESTAMP('2017-07-06 20:21:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000458 AND AD_Language='es_AR'
;

-- 06/07/2017 20:23:37 ART
-- ISSUE #81: Retenciones en Pagos
INSERT INTO AD_Process (AD_Process_ID,IsDirectPrint,IsReport,AccessLevel,IsBetaFunctionality,IsServerProcess,ShowHelp,EntityType,Statistic_Seconds,Statistic_Count,Classname,Value,Name,AD_Org_ID,AD_Client_ID,UpdatedBy,Created,CreatedBy,Updated,IsActive) VALUES (3000213,'N','N','3','N','N','Y','LAR',6521,78,'ar.com.ergio.process.LAR_CalcularRetencion','LAR_Calcula_Retencion','Calcula Retención sobre Cabecera de Pago',0,0,100,TO_TIMESTAMP('2017-07-06 20:23:31','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-07-06 20:23:31','YYYY-MM-DD HH24:MI:SS'),'Y')
;

-- 06/07/2017 20:23:37 ART
-- ISSUE #81: Retenciones en Pagos
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=3000213 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- 06/07/2017 20:24:43 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Column SET AD_Reference_ID=28, AD_Process_ID=3000213,Updated=TO_TIMESTAMP('2017-07-06 20:24:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002111
;

-- 06/07/2017 20:25:30 ART
-- ISSUE #81: Retenciones en Pagos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003315,1,'Y','N','N',3002111,'N','Y',3000015,'N','LAR','CalculaRetencion',100,0,TO_TIMESTAMP('2017-07-06 20:25:24','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2017-07-06 20:25:24','YYYY-MM-DD HH24:MI:SS'))
;

-- 06/07/2017 20:25:30 ART
-- ISSUE #81: Retenciones en Pagos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003315 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 06/07/2017 20:25:31 ART
-- ISSUE #81: Retenciones en Pagos
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003316,14,'Y','N','N',3000969,'N','Y',3000015,'N','U','ReceiptHeaderTotalInvAmt',100,0,TO_TIMESTAMP('2017-07-06 20:25:30','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2017-07-06 20:25:30','YYYY-MM-DD HH24:MI:SS'))
;

-- 06/07/2017 20:25:31 ART
-- ISSUE #81: Retenciones en Pagos
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003316 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 06/07/2017 20:25:48 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000387
;

-- 06/07/2017 20:25:48 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003316
;

-- 06/07/2017 20:25:48 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001294
;

-- 06/07/2017 20:25:48 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000400
;

-- 06/07/2017 20:25:48 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000599
;

-- 06/07/2017 20:25:48 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000401
;

-- 06/07/2017 20:25:48 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000600
;

-- 06/07/2017 20:25:48 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3001147
;

-- 06/07/2017 20:25:48 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3001142
;

-- 06/07/2017 20:25:48 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000402
;

-- 06/07/2017 20:25:48 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3003315
;

-- 06/07/2017 20:30:01 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000599
;

-- 06/07/2017 20:30:01 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000401
;

-- 06/07/2017 20:30:01 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000400
;

-- 06/07/2017 20:30:01 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000600
;

-- 06/07/2017 20:30:01 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3001147
;

-- 06/07/2017 20:30:01 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3001142
;

-- 06/07/2017 20:30:01 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000402
;

-- 06/07/2017 20:30:01 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3003315
;

-- 06/07/2017 20:30:37 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3001147
;

-- 06/07/2017 20:30:37 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3003315
;

-- 06/07/2017 20:30:37 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000600
;

-- 06/07/2017 20:30:37 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3001142
;

-- 06/07/2017 20:30:37 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000402
;

-- 06/07/2017 20:30:43 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2017-07-06 20:30:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003315
;

-- 06/07/2017 20:31:46 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2017-07-06 20:31:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000401
;

-- 06/07/2017 20:35:22 ART
-- ISSUE #81: Retenciones en Pagos
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Calcula Retención',Description='Realiza el cálculo del importe de la retención pero no genera el pago retención ni el certificado correspondiente.',Help='Tiene la funcionalidad de previsualizar el importe de la retención, sin generar ni pago retención ni su certificado correspondiente.',Updated=TO_TIMESTAMP('2017-07-06 20:35:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003315 AND AD_Language='es_AR'
;

-- Crea la referencia y letra M
-- 09/07/2017 13:38:27 ART
-- ISSUE #81: Retenciones en Pagos
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000147,3000003,'LAR','M','M',TO_TIMESTAMP('2017-07-09 13:38:18','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-07-09 13:38:18','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 09/07/2017 13:38:27 ART
-- ISSUE #81: Retenciones en Pagos
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000147 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 09/07/2017 13:42:13 ART
-- ISSUE #81: Retenciones en Pagos
INSERT INTO LAR_DocumentLetter (LAR_DocumentLetter_ID,AD_Client_ID,AD_Org_ID,Created,CreatedBy,Updated,UpdatedBy,IsActive,IsDefault,Letter) VALUES (3000000,1000000,0,TO_TIMESTAMP('2017-07-09 13:42:13','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-07-09 13:42:13','YYYY-MM-DD HH24:MI:SS'),100,'Y','N','M')
;


-- Registración de script
SELECT register_migration_script_lar('0092_ISSUE-81.sql', 'LAR', '')
;
