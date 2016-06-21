ALTER TABLE C_BankStatement ADD COLUMN SaldoInicial numeric DEFAULT 0;
ALTER TABLE C_BankStatement ADD COLUMN EsCierreCaja character(1) NOT NULL DEFAULT 'N'::bpchar;
ALTER TABLE C_BankStatement ADD CONSTRAINT c_bankstatement_escierrecaja_check CHECK (EsCierreCaja = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));
ALTER TABLE C_BankStatement ADD COLUMN Transferido character(1) NOT NULL DEFAULT 'N'::bpchar;
ALTER TABLE C_BankStatement ADD CONSTRAINT c_bankstatement_transferido_check CHECK (Transferido = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));

ALTER TABLE C_BankAccount ADD COLUMN EsCajaPrincipal character(1) NOT NULL DEFAULT 'N'::bpchar;
ALTER TABLE C_BankAccount ADD CONSTRAINT c_bankaccount_escajaprincipal_check CHECK (EsCajaPrincipal = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));
ALTER TABLE C_BankAccount ADD COLUMN CajaPrincipal_ID numeric(10,0);
ALTER TABLE C_BankAccount ADD CONSTRAINT cbankaccount_cbankaccount FOREIGN KEY (CajaPrincipal_ID)
      REFERENCES C_BankAccount (C_BankAccount_ID) MATCH SIMPLE;

-- 01/06/2016 22:11:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000326,'saldoinicial','LAR','saldoinicial','saldoinicial',0,TO_TIMESTAMP('2016-06-01 22:11:16','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-06-01 22:11:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 01/06/2016 22:11:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000326 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 01/06/2016 22:11:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001757,392,'LAR',0,'N','N','N','N',131089,'N',22,'N',3000326,'N','Y','N','saldoinicial','saldoinicial',100,TO_TIMESTAMP('2016-06-01 22:11:16','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-06-01 22:11:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 01/06/2016 22:11:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001757 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 01/06/2016 22:11:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000327,'escierrecaja','LAR','escierrecaja','escierrecaja',0,TO_TIMESTAMP('2016-06-01 22:11:16','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-06-01 22:11:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 01/06/2016 22:11:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000327 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 01/06/2016 22:11:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001758,392,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000327,'N','Y','N','escierrecaja','escierrecaja',100,TO_TIMESTAMP('2016-06-01 22:11:16','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-06-01 22:11:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 01/06/2016 22:11:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001758 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 01/06/2016 22:12:01 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET Name='Es Cierre de Caja', ColumnName='EsCierreCaja',Updated=TO_TIMESTAMP('2016-06-01 22:12:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001758
;

-- 01/06/2016 22:12:01 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001758
;

-- 01/06/2016 22:12:01 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Es Cierre de Caja', Description=NULL, Help=NULL WHERE AD_Column_ID=3001758 AND IsCentrallyMaintained='Y'
;

-- 01/06/2016 22:12:13 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Es Cierre de Caja',Updated=TO_TIMESTAMP('2016-06-01 22:12:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001758 AND AD_Language='es_AR'
;

-- 01/06/2016 22:12:32 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='EsCierreCaja', Name='Es Cierre de Caja', PrintName='Es Cierre de Caja',Updated=TO_TIMESTAMP('2016-06-01 22:12:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000327
;

-- 01/06/2016 22:12:32 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000327
;

-- 01/06/2016 22:12:32 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='EsCierreCaja', Name='Es Cierre de Caja', Description=NULL, Help=NULL WHERE AD_Element_ID=3000327
;

-- 01/06/2016 22:12:32 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='EsCierreCaja', Name='Es Cierre de Caja', Description=NULL, Help=NULL, AD_Element_ID=3000327 WHERE UPPER(ColumnName)='ESCIERRECAJA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 01/06/2016 22:12:32 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='EsCierreCaja', Name='Es Cierre de Caja', Description=NULL, Help=NULL WHERE AD_Element_ID=3000327 AND IsCentrallyMaintained='Y'
;

-- 01/06/2016 22:12:32 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Es Cierre de Caja', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000327) AND IsCentrallyMaintained='Y'
;

-- 01/06/2016 22:12:32 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_PrintFormatItem SET PrintName='Es Cierre de Caja', Name='Es Cierre de Caja' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000327)
;

-- 01/06/2016 22:12:38 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Es Cierre de Caja',PrintName='Es Cierre de Caja',Updated=TO_TIMESTAMP('2016-06-01 22:12:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000327 AND AD_Language='es_AR'
;

-- 01/06/2016 22:13:35 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_ID=12, Name='Saldo Inicial', ColumnName='SaldoInicial',Updated=TO_TIMESTAMP('2016-06-01 22:13:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001757
;

-- 01/06/2016 22:13:35 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001757
;

-- 01/06/2016 22:13:35 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Saldo Inicial', Description=NULL, Help=NULL WHERE AD_Column_ID=3001757 AND IsCentrallyMaintained='Y'
;

-- 01/06/2016 22:13:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Saldo Inicial',Updated=TO_TIMESTAMP('2016-06-01 22:13:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001757 AND AD_Language='es_AR'
;

-- 01/06/2016 22:14:21 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='SaldoInicial', Name='Saldo Inicial', PrintName='Saldo Inicial',Updated=TO_TIMESTAMP('2016-06-01 22:14:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000326
;

-- 01/06/2016 22:14:21 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000326
;

-- 01/06/2016 22:14:21 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='SaldoInicial', Name='Saldo Inicial', Description=NULL, Help=NULL WHERE AD_Element_ID=3000326
;

-- 01/06/2016 22:14:21 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='SaldoInicial', Name='Saldo Inicial', Description=NULL, Help=NULL, AD_Element_ID=3000326 WHERE UPPER(ColumnName)='SALDOINICIAL' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 01/06/2016 22:14:21 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='SaldoInicial', Name='Saldo Inicial', Description=NULL, Help=NULL WHERE AD_Element_ID=3000326 AND IsCentrallyMaintained='Y'
;

-- 01/06/2016 22:14:21 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Saldo Inicial', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000326) AND IsCentrallyMaintained='Y'
;

-- 01/06/2016 22:14:21 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_PrintFormatItem SET PrintName='Saldo Inicial', Name='Saldo Inicial' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000326)
;

-- 01/06/2016 22:14:28 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Saldo Inicial',PrintName='Saldo Inicial',Updated=TO_TIMESTAMP('2016-06-01 22:14:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000326 AND AD_Language='es_AR'
;

-- 01/06/2016 22:20:09 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002653,1,'Y','N','N',3001758,'N','Y',3000007,'N','LAR','Es Cierre de Caja',100,0,'Y',TO_TIMESTAMP('2016-06-01 22:20:09','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-06-01 22:20:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 01/06/2016 22:20:09 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002653 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 01/06/2016 22:20:09 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002654,131089,'Y','N','N',3001757,'N','Y',3000007,'N','LAR','Saldo Inicial',100,0,'Y',TO_TIMESTAMP('2016-06-01 22:20:09','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-06-01 22:20:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 01/06/2016 22:20:09 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002654 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 01/06/2016 22:20:45 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000160
;

-- 01/06/2016 22:20:45 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000166
;

-- 01/06/2016 22:20:45 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000165
;

-- 01/06/2016 22:20:45 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3002654
;

-- 01/06/2016 22:20:45 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000167
;

-- 01/06/2016 22:20:45 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000168
;

-- 01/06/2016 22:20:45 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000169
;

-- 01/06/2016 22:20:45 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000170
;

-- 01/06/2016 22:20:45 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3002653
;

-- 01/06/2016 22:22:41 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DefaultValue='Y',Updated=TO_TIMESTAMP('2016-06-01 22:22:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002653
;

-- 01/06/2016 22:25:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_TIMESTAMP('2016-06-01 22:25:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002654
;

-- 01/06/2016 22:38:16 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET IsDisplayed='N',Updated=TO_TIMESTAMP('2016-06-01 22:38:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002653
;

-- 02/06/2016 17:20:23 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000255,0,3000001,100,'N',19,80,'Y','@sql=SELECT b.C_BankStatement_ID FROM C_BankStatement b WHERE b.C_BankAccount_ID=@','LAR','C_BankSatatement_ID','C_BankSatatement_ID','Y',0,100,TO_TIMESTAMP('2016-06-02 17:20:22','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-06-02 17:20:22','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 02/06/2016 17:20:23 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000255 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 02/06/2016 17:21:29 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET DefaultValue='@sql=SELECT b.C_BankStatement_ID FROM C_BankStatement b WHERE b.C_BankAccount_ID=@From_C_BankAccount_ID@', Name='BankStatement',Updated=TO_TIMESTAMP('2016-06-02 17:21:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000255
;

-- 02/06/2016 17:21:29 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para_Trl SET IsTranslated='N' WHERE AD_Process_Para_ID=3000255
;

-- 02/06/2016 17:22:39 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET AD_Reference_ID=18,Updated=TO_TIMESTAMP('2016-06-02 17:22:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000255
;

-- 02/06/2016 17:26:33 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET DefaultValue='@sql=SELECT b.C_BankStatement_ID FROM C_BankStatement b WHERE b.C_BankAccount_ID=@Bank Account From@',Updated=TO_TIMESTAMP('2016-06-02 17:26:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000255
;

-- 02/06/2016 17:30:02 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET DefaultValue='@SQL=SELECT b.C_BankStatement_ID FROM C_BankStatement b WHERE b.C_BankAccount_ID=@Bank Account From@', ColumnName='C_BankStatement_ID',Updated=TO_TIMESTAMP('2016-06-02 17:30:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000255
;

-- 02/06/2016 17:31:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET DefaultValue='@SQL=SELECT b.C_BankStatement_ID FROM C_BankStatement b WHERE b.C_BankAccount_ID=@From_C_BankAccount_ID@',Updated=TO_TIMESTAMP('2016-06-02 17:31:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000255
;

-- 02/06/2016 17:34:43 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Val_Rule (Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('S',3000030,'LAR','BankStatement',100,100,TO_TIMESTAMP('2016-06-02 17:34:42','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_TIMESTAMP('2016-06-02 17:34:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/06/2016 17:36:01 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET DefaultValue=NULL,Updated=TO_TIMESTAMP('2016-06-02 17:36:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000255
;

-- 02/06/2016 17:36:38 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Val_Rule SET Code='C_BankStatement.C_BankAccount_ID=@From_C_BankAccount_ID@',Updated=TO_TIMESTAMP('2016-06-02 17:36:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000030
;

-- 02/06/2016 17:36:57 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET AD_Val_Rule_ID=3000030,Updated=TO_TIMESTAMP('2016-06-02 17:36:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000255
;

-- 02/06/2016 19:21:56 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000328,'transferido','LAR','transferido','transferido',0,TO_TIMESTAMP('2016-06-02 19:21:55','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-06-02 19:21:55','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 02/06/2016 19:21:56 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000328 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 02/06/2016 19:21:56 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001759,392,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000328,'N','Y','N','transferido','transferido',100,TO_TIMESTAMP('2016-06-02 19:21:55','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-06-02 19:21:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/06/2016 19:21:56 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001759 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/06/2016 19:22:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET Name='Transferido', ColumnName='Transferido',Updated=TO_TIMESTAMP('2016-06-02 19:22:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001759
;

-- 02/06/2016 19:22:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001759
;

-- 02/06/2016 19:22:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Transferido', Description=NULL, Help=NULL WHERE AD_Column_ID=3001759 AND IsCentrallyMaintained='Y'
;

-- 02/06/2016 19:22:57 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Transferido',Updated=TO_TIMESTAMP('2016-06-02 19:22:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001759 AND AD_Language='es_AR'
;

-- 02/06/2016 19:23:05 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='Transferido', Name='Transferido', PrintName='Transferido',Updated=TO_TIMESTAMP('2016-06-02 19:23:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000328
;

-- 02/06/2016 19:23:05 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000328
;

-- 02/06/2016 19:23:05 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='Transferido', Name='Transferido', Description=NULL, Help=NULL WHERE AD_Element_ID=3000328
;

-- 02/06/2016 19:23:05 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='Transferido', Name='Transferido', Description=NULL, Help=NULL, AD_Element_ID=3000328 WHERE UPPER(ColumnName)='TRANSFERIDO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 02/06/2016 19:23:05 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='Transferido', Name='Transferido', Description=NULL, Help=NULL WHERE AD_Element_ID=3000328 AND IsCentrallyMaintained='Y'
;

-- 02/06/2016 19:23:05 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Transferido', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000328) AND IsCentrallyMaintained='Y'
;

-- 02/06/2016 19:23:05 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_PrintFormatItem SET PrintName='Transferido', Name='Transferido' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000328)
;

-- 02/06/2016 19:23:11 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Transferido',PrintName='Transferido',Updated=TO_TIMESTAMP('2016-06-02 19:23:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000328 AND AD_Language='es_AR'
;

-- 02/06/2016 19:24:42 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002655,1,'Y','N','N',3001759,'N','Y',3000007,'N','LAR','Transferido',100,0,'Y',TO_TIMESTAMP('2016-06-02 19:24:42','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-06-02 19:24:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/06/2016 19:24:42 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002655 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/06/2016 19:25:16 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET IsDisplayed='N',Updated=TO_TIMESTAMP('2016-06-02 19:25:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002655
;

-- 02/06/2016 19:26:52 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Val_Rule SET Code='C_BankStatement.C_BankAccount_ID=@From_C_BankAccount_ID@ AND C_BankStatement.Transferido=Y',Updated=TO_TIMESTAMP('2016-06-02 19:26:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000030
;

-- 02/06/2016 19:27:34 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Val_Rule SET Code='C_BankStatement.C_BankAccount_ID=@From_C_BankAccount_ID@ AND C_BankStatement.Transferido=''N''',Updated=TO_TIMESTAMP('2016-06-02 19:27:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000030
;

-- 03/06/2016 9:41:31 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Ref_Table SET AD_Display=62513,Updated=TO_TIMESTAMP('2016-06-03 09:41:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000009
;

-- 03/06/2016 10:22:02 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab SET WhereClause='C_BankStatement.EsCierreCaja=''Y''',Updated=TO_TIMESTAMP('2016-06-03 10:22:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000007
;

-- 03/06/2016 10:24:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab SET WhereClause='C_BankStatement.EsCierreCaja=''N''',Updated=TO_TIMESTAMP('2016-06-03 10:24:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=328
;

-- 09/06/2016 20:53:18 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000334,'escajaprincipal','LAR','escajaprincipal','escajaprincipal',0,TO_TIMESTAMP('2016-06-09 20:53:17','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-06-09 20:53:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 09/06/2016 20:53:18 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000334 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 09/06/2016 20:53:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001765,297,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000334,'N','Y','N','escajaprincipal','escajaprincipal',100,TO_TIMESTAMP('2016-06-09 20:53:17','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-06-09 20:53:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/06/2016 20:53:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001765 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/06/2016 20:53:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000335,'cajaprincipal_id','LAR','cajaprincipal_id','cajaprincipal_id',0,TO_TIMESTAMP('2016-06-09 20:53:19','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2016-06-09 20:53:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 09/06/2016 20:53:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000335 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 09/06/2016 20:53:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001766,297,'LAR',0,'N','N','N','N',10,'N',19,'N',3000335,'N','Y','N','cajaprincipal_id','cajaprincipal_id',100,TO_TIMESTAMP('2016-06-09 20:53:19','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2016-06-09 20:53:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/06/2016 20:53:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001766 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/06/2016 20:54:29 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET Name='Caja Principal', ColumnName='CajaPrincipal_ID',Updated=TO_TIMESTAMP('2016-06-09 20:54:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001766
;

-- 09/06/2016 20:54:29 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001766
;

-- 09/06/2016 20:54:29 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Caja Principal', Description=NULL, Help=NULL WHERE AD_Column_ID=3001766 AND IsCentrallyMaintained='Y'
;

-- 09/06/2016 20:54:38 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Caja Principal',Updated=TO_TIMESTAMP('2016-06-09 20:54:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001766 AND AD_Language='es_AR'
;

-- 09/06/2016 20:55:12 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='CajaPrincipal_ID', Name='Caja Principal', PrintName='Caja Principal',Updated=TO_TIMESTAMP('2016-06-09 20:55:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000335
;

-- 09/06/2016 20:55:12 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000335
;

-- 09/06/2016 20:55:12 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='CajaPrincipal_ID', Name='Caja Principal', Description=NULL, Help=NULL WHERE AD_Element_ID=3000335
;

-- 09/06/2016 20:55:12 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='CajaPrincipal_ID', Name='Caja Principal', Description=NULL, Help=NULL, AD_Element_ID=3000335 WHERE UPPER(ColumnName)='CAJAPRINCIPAL_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 09/06/2016 20:55:12 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='CajaPrincipal_ID', Name='Caja Principal', Description=NULL, Help=NULL WHERE AD_Element_ID=3000335 AND IsCentrallyMaintained='Y'
;

-- 09/06/2016 20:55:12 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Caja Principal', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000335) AND IsCentrallyMaintained='Y'
;

-- 09/06/2016 20:55:12 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_PrintFormatItem SET PrintName='Caja Principal', Name='Caja Principal' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000335)
;

-- 09/06/2016 20:55:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Caja Principal',PrintName='Caja Principal',Updated=TO_TIMESTAMP('2016-06-09 20:55:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000335 AND AD_Language='es_AR'
;

-- 09/06/2016 20:56:47 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET Name='Es Caja Principal', ColumnName='EsCajaPrincipal',Updated=TO_TIMESTAMP('2016-06-09 20:56:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001765
;

-- 09/06/2016 20:56:47 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3001765
;

-- 09/06/2016 20:56:47 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Es Caja Principal', Description=NULL, Help=NULL WHERE AD_Column_ID=3001765 AND IsCentrallyMaintained='Y'
;

-- 09/06/2016 20:56:59 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Es Caja Principal',Updated=TO_TIMESTAMP('2016-06-09 20:56:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001765 AND AD_Language='es_AR'
;

-- 09/06/2016 20:57:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='EsCajaPrincipal', Name='Es Caja Principal', PrintName='Es Caja Principal',Updated=TO_TIMESTAMP('2016-06-09 20:57:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000334
;

-- 09/06/2016 20:57:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000334
;

-- 09/06/2016 20:57:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='EsCajaPrincipal', Name='Es Caja Principal', Description=NULL, Help=NULL WHERE AD_Element_ID=3000334
;

-- 09/06/2016 20:57:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='EsCajaPrincipal', Name='Es Caja Principal', Description=NULL, Help=NULL, AD_Element_ID=3000334 WHERE UPPER(ColumnName)='ESCAJAPRINCIPAL' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 09/06/2016 20:57:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='EsCajaPrincipal', Name='Es Caja Principal', Description=NULL, Help=NULL WHERE AD_Element_ID=3000334 AND IsCentrallyMaintained='Y'
;

-- 09/06/2016 20:57:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Es Caja Principal', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000334) AND IsCentrallyMaintained='Y'
;

-- 09/06/2016 20:57:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_PrintFormatItem SET PrintName='Es Caja Principal', Name='Es Caja Principal' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000334)
;

-- 09/06/2016 20:57:48 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Es Caja Principal',PrintName='Es Caja Principal',Updated=TO_TIMESTAMP('2016-06-09 20:57:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000334 AND AD_Language='es_AR'
;

-- 09/06/2016 21:02:01 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002674,10,'Y','N','N',3001766,'N','Y',228,'N','LAR','Caja Principal',100,0,'Y',TO_TIMESTAMP('2016-06-09 21:02:01','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-06-09 21:02:01','YYYY-MM-DD HH24:MI:SS'))
;

-- 09/06/2016 21:02:01 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002674 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/06/2016 21:02:01 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002675,1,'Y','N','N',3001765,'N','Y',228,'N','LAR','Es Caja Principal',100,0,'Y',TO_TIMESTAMP('2016-06-09 21:02:01','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2016-06-09 21:02:01','YYYY-MM-DD HH24:MI:SS'))
;

-- 09/06/2016 21:02:01 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002675 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/06/2016 21:02:38 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=2220
;

-- 09/06/2016 21:02:38 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=2221
;

-- 09/06/2016 21:02:38 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000089
;

-- 09/06/2016 21:02:38 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3002674
;

-- 09/06/2016 21:02:38 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3002675
;

-- 09/06/2016 21:03:47 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2016-06-09 21:03:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002675
;

-- 09/06/2016 21:05:54 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@IsDrawer@=''Y'' & @EsCajaPrincipal@=''N''',Updated=TO_TIMESTAMP('2016-06-09 21:05:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002674
;

-- 09/06/2016 21:09:47 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@IsDrawer@=''Y''',Updated=TO_TIMESTAMP('2016-06-09 21:09:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002675
;

-- 09/06/2016 21:22:43 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_Value_ID=53283, AD_Reference_ID=18,Updated=TO_TIMESTAMP('2016-06-09 21:22:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001766
;

-- Registración de script
SELECT register_migration_script_lar('0072_ISSUE-80', 'LAR', '')
;
