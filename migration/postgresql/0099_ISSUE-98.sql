ALTER TABLE C_AllocationLine ADD COLUMN NotaCredito_ID numeric(10,0);

ALTER TABLE C_AllocationLine ADD CONSTRAINT notacredito_callocationline FOREIGN KEY (NotaCredito_ID)
      REFERENCES C_Invoice (C_Invoice_ID) MATCH SIMPLE;

-- 06/11/2017 17:52:06 ART
-- BUG #402: Utilizar Nota de Credito como forma de pago, en el POS.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000496,'notacredito_id','LAR','notacredito_id','notacredito_id',0,TO_TIMESTAMP('2017-11-06 17:52:05','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2017-11-06 17:52:05','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 06/11/2017 17:52:06 ART
-- BUG #402: Utilizar Nota de Credito como forma de pago, en el POS.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000496 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 06/11/2017 17:54:26 ART
-- BUG #402: Utilizar Nota de Credito como forma de pago, en el POS.
UPDATE AD_Element SET ColumnName='NotaCredito_ID', Name='Nota de Crédito', PrintName='Nota de Crédito',Updated=TO_TIMESTAMP('2017-11-06 17:54:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000496
;

-- 06/11/2017 17:54:26 ART
-- BUG #402: Utilizar Nota de Credito como forma de pago, en el POS.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000496
;

-- 06/11/2017 17:54:26 ART
-- BUG #402: Utilizar Nota de Credito como forma de pago, en el POS.
UPDATE AD_Column SET ColumnName='NotaCredito_ID', Name='Nota de Crédito', Description=NULL, Help=NULL WHERE AD_Element_ID=3000496
;

-- 06/11/2017 17:54:26 ART
-- BUG #402: Utilizar Nota de Credito como forma de pago, en el POS.
UPDATE AD_Process_Para SET ColumnName='NotaCredito_ID', Name='Nota de Crédito', Description=NULL, Help=NULL, AD_Element_ID=3000496 WHERE UPPER(ColumnName)='NOTACREDITO_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 06/11/2017 17:54:26 ART
-- BUG #402: Utilizar Nota de Credito como forma de pago, en el POS.
UPDATE AD_Process_Para SET ColumnName='NotaCredito_ID', Name='Nota de Crédito', Description=NULL, Help=NULL WHERE AD_Element_ID=3000496 AND IsCentrallyMaintained='Y'
;

-- 06/11/2017 17:54:26 ART
-- BUG #402: Utilizar Nota de Credito como forma de pago, en el POS.
UPDATE AD_Field SET Name='Nota de Crédito', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000496) AND IsCentrallyMaintained='Y'
;

-- 06/11/2017 17:54:26 ART
-- BUG #402: Utilizar Nota de Credito como forma de pago, en el POS.
UPDATE AD_PrintFormatItem SET PrintName='Nota de Crédito', Name='Nota de Crédito' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000496)
;

-- 06/11/2017 17:54:34 ART
-- BUG #402: Utilizar Nota de Credito como forma de pago, en el POS.
UPDATE AD_Element_Trl SET Name='Nota de Crédito',PrintName='Nota de Crédito',Updated=TO_TIMESTAMP('2017-11-06 17:54:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000496 AND AD_Language='es_AR'
;

-- 09/11/2017 17:07:47 ART
-- BUG #402: Utilizar Nota de Credito como forma de pago, en el POS.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002197,390,'LAR',0,'N','N','N','N',10,'N',19,'N',3000496,'N','Y','N','Nota de Crédito','NotaCredito_ID',100,TO_TIMESTAMP('2017-11-09 17:07:46','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2017-11-09 17:07:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/11/2017 17:07:47 ART
-- BUG #402: Utilizar Nota de Credito como forma de pago, en el POS.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002197 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/11/2017 17:12:40 ART
-- BUG #402: Utilizar Nota de Credito como forma de pago, en el POS.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003721,10,'Y','N','N',3002197,'N','Y',349,'N','LAR','Nota de Crédito',100,0,'Y',TO_TIMESTAMP('2017-11-09 17:12:39','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2017-11-09 17:12:39','YYYY-MM-DD HH24:MI:SS'))
;

-- 09/11/2017 17:12:40 ART
-- BUG #402: Utilizar Nota de Credito como forma de pago, en el POS.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003721 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/11/2017 17:14:45 ART
-- BUG #402: Utilizar Nota de Credito como forma de pago, en el POS.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3003721
;

-- 09/11/2017 17:14:45 ART
-- BUG #402: Utilizar Nota de Credito como forma de pago, en el POS.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=4374
;

-- 09/11/2017 17:14:45 ART
-- BUG #402: Utilizar Nota de Credito como forma de pago, en el POS.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=4387
;

-- 09/11/2017 17:14:45 ART
-- BUG #402: Utilizar Nota de Credito como forma de pago, en el POS.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=4380
;

-- 09/11/2017 17:15:09 ART
-- BUG #402: Utilizar Nota de Credito como forma de pago, en el POS.
UPDATE AD_Field SET IsSameLine='Y', IsReadOnly='Y',Updated=TO_TIMESTAMP('2017-11-09 17:15:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003721
;

-- 09/11/2017 17:17:22 ART
-- BUG #402: Utilizar Nota de Credito como forma de pago, en el POS.
UPDATE AD_Column SET AD_Reference_Value_ID=336, AD_Reference_ID=18,Updated=TO_TIMESTAMP('2017-11-09 17:17:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002197
;

-- Registración de script
SELECT register_migration_script_lar('0099_ISSUE-98.sql', 'LAR', '')
;
