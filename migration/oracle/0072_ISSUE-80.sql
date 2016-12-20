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
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000326,'saldoinicial','LAR','saldoinicial','saldoinicial',0,TO_DATE('2016-06-01 22:11:16','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-06-01 22:11:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 01/06/2016 22:11:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000326 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 01/06/2016 22:11:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001757,392,'LAR',0,'N','N','N','N',131089,'N',22,'N',3000326,'N','Y','N','saldoinicial','saldoinicial',100,TO_DATE('2016-06-01 22:11:16','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-06-01 22:11:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 01/06/2016 22:11:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001757 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 01/06/2016 22:11:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000327,'escierrecaja','LAR','escierrecaja','escierrecaja',0,TO_DATE('2016-06-01 22:11:16','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-06-01 22:11:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 01/06/2016 22:11:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000327 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 01/06/2016 22:11:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001758,392,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000327,'N','Y','N','escierrecaja','escierrecaja',100,TO_DATE('2016-06-01 22:11:16','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-06-01 22:11:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 01/06/2016 22:11:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001758 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 01/06/2016 22:12:01 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET Name='Es Cierre de Caja', ColumnName='EsCierreCaja',Updated=TO_DATE('2016-06-01 22:12:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001758
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
UPDATE AD_Column_Trl SET Name='Es Cierre de Caja',Updated=TO_DATE('2016-06-01 22:12:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001758 AND AD_Language='es_AR'
;

-- 01/06/2016 22:12:32 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='EsCierreCaja', Name='Es Cierre de Caja', PrintName='Es Cierre de Caja',Updated=TO_DATE('2016-06-01 22:12:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000327
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
UPDATE AD_PrintFormatItem pi SET PrintName='Es Cierre de Caja', Name='Es Cierre de Caja' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000327)
;

-- 01/06/2016 22:12:38 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Es Cierre de Caja',PrintName='Es Cierre de Caja',Updated=TO_DATE('2016-06-01 22:12:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000327 AND AD_Language='es_AR'
;

-- 01/06/2016 22:13:35 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_ID=12, Name='Saldo Inicial', ColumnName='SaldoInicial',Updated=TO_DATE('2016-06-01 22:13:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001757
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
UPDATE AD_Column_Trl SET Name='Saldo Inicial',Updated=TO_DATE('2016-06-01 22:13:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001757 AND AD_Language='es_AR'
;

-- 01/06/2016 22:14:21 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='SaldoInicial', Name='Saldo Inicial', PrintName='Saldo Inicial',Updated=TO_DATE('2016-06-01 22:14:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000326
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
UPDATE AD_PrintFormatItem pi SET PrintName='Saldo Inicial', Name='Saldo Inicial' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000326)
;

-- 01/06/2016 22:14:28 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Saldo Inicial',PrintName='Saldo Inicial',Updated=TO_DATE('2016-06-01 22:14:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000326 AND AD_Language='es_AR'
;

-- 01/06/2016 22:20:09 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002653,1,'Y','N','N',3001758,'N','Y',3000007,'N','LAR','Es Cierre de Caja',100,0,'Y',TO_DATE('2016-06-01 22:20:09','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-06-01 22:20:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 01/06/2016 22:20:09 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002653 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 01/06/2016 22:20:09 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002654,131089,'Y','N','N',3001757,'N','Y',3000007,'N','LAR','Saldo Inicial',100,0,'Y',TO_DATE('2016-06-01 22:20:09','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-06-01 22:20:09','YYYY-MM-DD HH24:MI:SS'))
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
UPDATE AD_Field SET DefaultValue='Y',Updated=TO_DATE('2016-06-01 22:22:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002653
;

-- 01/06/2016 22:25:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLength=20,Updated=TO_DATE('2016-06-01 22:25:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002654
;

-- 01/06/2016 22:38:16 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET IsDisplayed='N',Updated=TO_DATE('2016-06-01 22:38:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002653
;

-- 02/06/2016 17:20:23 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Process_Para (IsRange,AD_Process_Para_ID,FieldLength,AD_Process_ID,CreatedBy,IsCentrallyMaintained,AD_Reference_ID,SeqNo,IsMandatory,DefaultValue,EntityType,Name,ColumnName,IsActive,AD_Client_ID,UpdatedBy,Updated,Created,AD_Org_ID,IsEncrypted) VALUES ('N',3000255,0,3000001,100,'N',19,80,'Y','@sql=SELECT b.C_BankStatement_ID FROM C_BankStatement b WHERE b.C_BankAccount_ID=@','LAR','C_BankSatatement_ID','C_BankSatatement_ID','Y',0,100,TO_DATE('2016-06-02 17:20:22','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-06-02 17:20:22','YYYY-MM-DD HH24:MI:SS'),0,'N')
;

-- 02/06/2016 17:20:23 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=3000255 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- 02/06/2016 17:21:29 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET DefaultValue='@sql=SELECT b.C_BankStatement_ID FROM C_BankStatement b WHERE b.C_BankAccount_ID=@From_C_BankAccount_ID@', Name='BankStatement',Updated=TO_DATE('2016-06-02 17:21:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000255
;

-- 02/06/2016 17:21:29 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para_Trl SET IsTranslated='N' WHERE AD_Process_Para_ID=3000255
;

-- 02/06/2016 17:22:39 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET AD_Reference_ID=18,Updated=TO_DATE('2016-06-02 17:22:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000255
;

-- 02/06/2016 17:26:33 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET DefaultValue='@sql=SELECT b.C_BankStatement_ID FROM C_BankStatement b WHERE b.C_BankAccount_ID=@Bank Account From@',Updated=TO_DATE('2016-06-02 17:26:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000255
;

-- 02/06/2016 17:30:02 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET DefaultValue='@SQL=SELECT b.C_BankStatement_ID FROM C_BankStatement b WHERE b.C_BankAccount_ID=@Bank Account From@', ColumnName='C_BankStatement_ID',Updated=TO_DATE('2016-06-02 17:30:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000255
;

-- 02/06/2016 17:31:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET DefaultValue='@SQL=SELECT b.C_BankStatement_ID FROM C_BankStatement b WHERE b.C_BankAccount_ID=@From_C_BankAccount_ID@',Updated=TO_DATE('2016-06-02 17:31:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000255
;

-- 02/06/2016 17:34:43 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Val_Rule (Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('S',3000030,'LAR','BankStatement',100,100,TO_DATE('2016-06-02 17:34:42','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2016-06-02 17:34:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/06/2016 17:36:01 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET DefaultValue=NULL,Updated=TO_DATE('2016-06-02 17:36:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000255
;

-- 02/06/2016 17:36:38 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Val_Rule SET Code='C_BankStatement.C_BankAccount_ID=@From_C_BankAccount_ID@',Updated=TO_DATE('2016-06-02 17:36:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000030
;

-- 02/06/2016 17:36:57 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET AD_Val_Rule_ID=3000030,Updated=TO_DATE('2016-06-02 17:36:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000255
;

-- 02/06/2016 19:21:56 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000328,'transferido','LAR','transferido','transferido',0,TO_DATE('2016-06-02 19:21:55','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-06-02 19:21:55','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 02/06/2016 19:21:56 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000328 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 02/06/2016 19:21:56 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001759,392,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000328,'N','Y','N','transferido','transferido',100,TO_DATE('2016-06-02 19:21:55','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-06-02 19:21:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 02/06/2016 19:21:56 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001759 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 02/06/2016 19:22:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET Name='Transferido', ColumnName='Transferido',Updated=TO_DATE('2016-06-02 19:22:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001759
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
UPDATE AD_Column_Trl SET Name='Transferido',Updated=TO_DATE('2016-06-02 19:22:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001759 AND AD_Language='es_AR'
;

-- 02/06/2016 19:23:05 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='Transferido', Name='Transferido', PrintName='Transferido',Updated=TO_DATE('2016-06-02 19:23:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000328
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
UPDATE AD_PrintFormatItem pi SET PrintName='Transferido', Name='Transferido' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000328)
;

-- 02/06/2016 19:23:11 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Transferido',PrintName='Transferido',Updated=TO_DATE('2016-06-02 19:23:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000328 AND AD_Language='es_AR'
;

-- 02/06/2016 19:24:42 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002655,1,'Y','N','N',3001759,'N','Y',3000007,'N','LAR','Transferido',100,0,'Y',TO_DATE('2016-06-02 19:24:42','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-06-02 19:24:42','YYYY-MM-DD HH24:MI:SS'))
;

-- 02/06/2016 19:24:42 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002655 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 02/06/2016 19:25:16 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET IsDisplayed='N',Updated=TO_DATE('2016-06-02 19:25:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002655
;

-- 02/06/2016 19:26:52 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Val_Rule SET Code='C_BankStatement.C_BankAccount_ID=@From_C_BankAccount_ID@ AND C_BankStatement.Transferido=Y',Updated=TO_DATE('2016-06-02 19:26:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000030
;

-- 02/06/2016 19:27:34 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Val_Rule SET Code='C_BankStatement.C_BankAccount_ID=@From_C_BankAccount_ID@ AND C_BankStatement.Transferido=''N''',Updated=TO_DATE('2016-06-02 19:27:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000030
;

-- 03/06/2016 9:41:31 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Ref_Table SET AD_Display=62513,Updated=TO_DATE('2016-06-03 09:41:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000009
;

-- 03/06/2016 10:22:02 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab SET WhereClause='C_BankStatement.EsCierreCaja=''Y''',Updated=TO_DATE('2016-06-03 10:22:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000007
;

-- 03/06/2016 10:24:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab SET WhereClause='C_BankStatement.EsCierreCaja=''N''',Updated=TO_DATE('2016-06-03 10:24:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=328
;

-- 09/06/2016 20:53:18 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000334,'escajaprincipal','LAR','escajaprincipal','escajaprincipal',0,TO_DATE('2016-06-09 20:53:17','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-06-09 20:53:17','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 09/06/2016 20:53:18 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000334 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 09/06/2016 20:53:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001765,297,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000334,'N','Y','N','escajaprincipal','escajaprincipal',100,TO_DATE('2016-06-09 20:53:17','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-06-09 20:53:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/06/2016 20:53:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001765 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/06/2016 20:53:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000335,'cajaprincipal_id','LAR','cajaprincipal_id','cajaprincipal_id',0,TO_DATE('2016-06-09 20:53:19','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-06-09 20:53:19','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 09/06/2016 20:53:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000335 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 09/06/2016 20:53:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001766,297,'LAR',0,'N','N','N','N',10,'N',19,'N',3000335,'N','Y','N','cajaprincipal_id','cajaprincipal_id',100,TO_DATE('2016-06-09 20:53:19','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-06-09 20:53:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 09/06/2016 20:53:19 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001766 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 09/06/2016 20:54:29 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET Name='Caja Principal', ColumnName='CajaPrincipal_ID',Updated=TO_DATE('2016-06-09 20:54:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001766
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
UPDATE AD_Column_Trl SET Name='Caja Principal',Updated=TO_DATE('2016-06-09 20:54:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001766 AND AD_Language='es_AR'
;

-- 09/06/2016 20:55:12 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='CajaPrincipal_ID', Name='Caja Principal', PrintName='Caja Principal',Updated=TO_DATE('2016-06-09 20:55:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000335
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
UPDATE AD_PrintFormatItem pi SET PrintName='Caja Principal', Name='Caja Principal' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000335)
;

-- 09/06/2016 20:55:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Caja Principal',PrintName='Caja Principal',Updated=TO_DATE('2016-06-09 20:55:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000335 AND AD_Language='es_AR'
;

-- 09/06/2016 20:56:47 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET Name='Es Caja Principal', ColumnName='EsCajaPrincipal',Updated=TO_DATE('2016-06-09 20:56:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001765
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
UPDATE AD_Column_Trl SET Name='Es Caja Principal',Updated=TO_DATE('2016-06-09 20:56:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001765 AND AD_Language='es_AR'
;

-- 09/06/2016 20:57:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='EsCajaPrincipal', Name='Es Caja Principal', PrintName='Es Caja Principal',Updated=TO_DATE('2016-06-09 20:57:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000334
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
UPDATE AD_PrintFormatItem pi SET PrintName='Es Caja Principal', Name='Es Caja Principal' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000334)
;

-- 09/06/2016 20:57:48 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Es Caja Principal',PrintName='Es Caja Principal',Updated=TO_DATE('2016-06-09 20:57:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000334 AND AD_Language='es_AR'
;

-- 09/06/2016 21:02:01 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002674,10,'Y','N','N',3001766,'N','Y',228,'N','LAR','Caja Principal',100,0,'Y',TO_DATE('2016-06-09 21:02:01','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-06-09 21:02:01','YYYY-MM-DD HH24:MI:SS'))
;

-- 09/06/2016 21:02:01 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002674 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 09/06/2016 21:02:01 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002675,1,'Y','N','N',3001765,'N','Y',228,'N','LAR','Es Caja Principal',100,0,'Y',TO_DATE('2016-06-09 21:02:01','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-06-09 21:02:01','YYYY-MM-DD HH24:MI:SS'))
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
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2016-06-09 21:03:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002675
;

-- 09/06/2016 21:05:54 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@IsDrawer@=''Y'' & @EsCajaPrincipal@=''N''',Updated=TO_DATE('2016-06-09 21:05:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002674
;

-- 09/06/2016 21:09:47 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@IsDrawer@=''Y''',Updated=TO_DATE('2016-06-09 21:09:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002675
;

-- 09/06/2016 21:22:43 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET AD_Reference_Value_ID=53283, AD_Reference_ID=18,Updated=TO_DATE('2016-06-09 21:22:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001766
;

ALTER TABLE C_BankStatement ADD COLUMN MensajeImportante character varying(255);

-- 23/06/2016 15:57:55 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Column SET DefaultValue='@SysDate@',Updated=TO_DATE('2016-06-23 15:57:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=5214
;

-- 23/06/2016 16:13:22 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('C_BankAccount.IsDrawer=''N''','S',3000033,'LAR','Cuentas Bancarias',100,100,TO_DATE('2016-06-23 16:13:22','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2016-06-23 16:13:22','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/06/2016 16:13:45 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET AD_Reference_ID=18, AD_Val_Rule_ID=3000033,Updated=TO_DATE('2016-06-23 16:13:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3994
;

-- 23/06/2016 16:33:03 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Column SET AD_Val_Rule_ID=3000033,Updated=TO_DATE('2016-06-23 16:33:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001087
;

-- 23/06/2016 16:42:18 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('C_BankAccount.IsDrawer=''Y''','S',3000034,'LAR','Cajas',100,100,TO_DATE('2016-06-23 16:42:17','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2016-06-23 16:42:17','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/06/2016 16:42:43 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET AD_Reference_ID=18, AD_Val_Rule_ID=3000034,Updated=TO_DATE('2016-06-23 16:42:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000154
;

-- 23/06/2016 17:00:19 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Window_Trl SET IsTranslated='Y',Name='Cierre de Cajas',Description='Cierre de Cajas',Help='La ventana Cierre de Cajas permite realizar una conciliación del dinero, cupones, cheques etc con lo registrado en el Sistema.',Updated=TO_DATE('2016-06-23 17:00:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Window_ID=3000005 AND AD_Language='es_AR'
;

-- 23/06/2016 17:01:20 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Menu_Trl SET IsTranslated='Y',Name='Cierre de Cajas',Updated=TO_DATE('2016-06-23 17:01:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=3000009 AND AD_Language='es_AR'
;

-- 23/06/2016 17:08:45 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Tab_Trl SET IsTranslated='Y',Name='Cierre de Cajas',Description='Cierre de Cajas',Help=NULL,Updated=TO_DATE('2016-06-23 17:08:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000007 AND AD_Language='es_AR'
;

-- 23/06/2016 17:09:51 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Tab_Trl SET IsTranslated='Y',Name='Línea Cierre de Cajas',Description='Línea Cierre de Cajas',Help=NULL,Updated=TO_DATE('2016-06-23 17:09:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000008 AND AD_Language='es_AR'
;

-- 23/06/2016 17:46:19 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Updated=TO_DATE('2016-06-23 17:46:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000154 AND AD_Language='es_AR'
;

-- 23/06/2016 17:47:45 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET IsCentrallyMaintained='Y',Updated=TO_DATE('2016-06-23 17:47:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000155
;

-- 23/06/2016 17:50:40 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Fecha',Description='Fecha',Updated=TO_DATE('2016-06-23 17:50:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000156 AND AD_Language='es_AR'
;

-- 23/06/2016 17:51:28 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET IsCentrallyMaintained='Y',Updated=TO_DATE('2016-06-23 17:51:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000157
;

-- 23/06/2016 17:53:23 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Updated=TO_DATE('2016-06-23 17:53:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000162 AND AD_Language='es_AR'
;

-- 23/06/2016 17:54:20 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Total Diferencias',Updated=TO_DATE('2016-06-23 17:54:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000222 AND AD_Language='es_AR'
;

-- 23/06/2016 17:55:52 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET Name='Saldo Final',Description='Saldo Final',Updated=TO_DATE('2016-06-23 17:55:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000164 AND AD_Language='es_AR'
;

-- 23/06/2016 17:56:37 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Total Cheques',Updated=TO_DATE('2016-06-23 17:56:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000212 AND AD_Language='es_AR'
;

-- 23/06/2016 17:57:05 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Cheques Contabilizados',Updated=TO_DATE('2016-06-23 17:57:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000219 AND AD_Language='es_AR'
;

-- 23/06/2016 17:57:36 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Diferencia Cheques',Updated=TO_DATE('2016-06-23 17:57:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000211 AND AD_Language='es_AR'
;

-- 23/06/2016 17:58:04 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Total Efectivo',Updated=TO_DATE('2016-06-23 17:58:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000210 AND AD_Language='es_AR'
;

-- 23/06/2016 17:58:46 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Efectivo Contabilizado',Updated=TO_DATE('2016-06-23 17:58:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000218 AND AD_Language='es_AR'
;

-- 23/06/2016 17:59:07 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Diferencia Efectivo',Updated=TO_DATE('2016-06-23 17:59:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000209 AND AD_Language='es_AR'
;

-- 23/06/2016 18:01:07 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Cupones T.C. Contabilizados',Updated=TO_DATE('2016-06-23 18:01:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000220 AND AD_Language='es_AR'
;

-- 23/06/2016 18:02:24 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Updated=TO_DATE('2016-06-23 18:02:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000221 AND AD_Language='es_AR'
;

-- 23/06/2016 18:04:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Aprovado',Updated=TO_DATE('2016-06-23 18:04:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000169 AND AD_Language='es_AR'
;

-- 23/06/2016 18:07:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Updated=TO_DATE('2016-06-23 18:07:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000177 AND AD_Language='es_AR'
;

-- 23/06/2016 18:10:23 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Updated=TO_DATE('2016-06-23 18:10:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000181 AND AD_Language='es_AR'
;

-- 23/06/2016 18:10:49 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Updated=TO_DATE('2016-06-23 18:10:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000182 AND AD_Language='es_AR'
;

-- 23/06/2016 18:12:25 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Forma de Pago',Updated=TO_DATE('2016-06-23 18:12:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000208 AND AD_Language='es_AR'
;

-- 23/06/2016 18:12:45 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Updated=TO_DATE('2016-06-23 18:12:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000187 AND AD_Language='es_AR'
;

-- 23/06/2016 18:13:25 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Updated=TO_DATE('2016-06-23 18:13:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000189 AND AD_Language='es_AR'
;

-- 23/06/2016 18:14:07 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Updated=TO_DATE('2016-06-23 18:14:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000195 AND AD_Language='es_AR'
;

-- 23/06/2016 18:14:14 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Updated=TO_DATE('2016-06-23 18:14:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000196 AND AD_Language='es_AR'
;

-- 23/06/2016 18:52:36 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Process_Trl SET IsTranslated='Y',Name='Transferencia de Caja',Updated=TO_DATE('2016-06-23 18:52:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000001 AND AD_Language='es_AR'
;

-- 23/06/2016 19:01:08 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Process_Para_Trl SET IsTranslated='Y',Name='Cuenta Origen',Updated=TO_DATE('2016-06-23 19:01:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000000 AND AD_Language='es_AR'
;

-- 23/06/2016 19:03:05 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Process_Para_Trl SET IsTranslated='Y',Updated=TO_DATE('2016-06-23 19:03:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000003 AND AD_Language='es_AR'
;

-- 23/06/2016 19:03:16 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Process_Para_Trl SET IsTranslated='Y',Updated=TO_DATE('2016-06-23 19:03:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000004 AND AD_Language='es_AR'
;

-- 23/06/2016 19:03:25 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Process_Para_Trl SET IsTranslated='Y',Updated=TO_DATE('2016-06-23 19:03:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000005 AND AD_Language='es_AR'
;

-- 23/06/2016 19:03:38 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Process_Para_Trl SET IsTranslated='Y',Updated=TO_DATE('2016-06-23 19:03:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000007 AND AD_Language='es_AR'
;

-- 23/06/2016 19:06:05 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Process_Para_Trl SET IsTranslated='Y',Updated=TO_DATE('2016-06-23 19:06:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000255 AND AD_Language='es_AR'
;

-- 23/06/2016 19:06:34 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Process_Para_Trl SET Name='Cierre de Caja',Updated=TO_DATE('2016-06-23 19:06:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000255 AND AD_Language='es_AR'
;

-- 23/06/2016 19:06:49 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Process_Para_Trl SET Name='Caja Origen',Updated=TO_DATE('2016-06-23 19:06:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000000 AND AD_Language='es_AR'
;

-- 23/06/2016 19:25:43 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Process_Para SET AD_Val_Rule_ID=3000034,Updated=TO_DATE('2016-06-23 19:25:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000000
;

-- 23/06/2016 19:29:29 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('C_BankAccount.EsCajaPrincipal=''Y''','S',3000035,'LAR','Cajas Principales',100,100,TO_DATE('2016-06-23 19:29:29','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2016-06-23 19:29:29','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/06/2016 19:30:57 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Column SET AD_Val_Rule_ID=3000035,Updated=TO_DATE('2016-06-23 19:30:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001766
;

-- 23/06/2016 19:33:44 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Element SET Name='Es Caja', PrintName='Es Caja',Updated=TO_DATE('2016-06-23 19:33:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000037
;

-- 23/06/2016 19:33:44 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000037
;

-- 23/06/2016 19:33:44 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Column SET ColumnName='IsDrawer', Name='Es Caja', Description=NULL, Help=NULL WHERE AD_Element_ID=3000037
;

-- 23/06/2016 19:33:45 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Process_Para SET ColumnName='IsDrawer', Name='Es Caja', Description=NULL, Help=NULL, AD_Element_ID=3000037 WHERE UPPER(ColumnName)='ISDRAWER' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 23/06/2016 19:33:45 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Process_Para SET ColumnName='IsDrawer', Name='Es Caja', Description=NULL, Help=NULL WHERE AD_Element_ID=3000037 AND IsCentrallyMaintained='Y'
;

-- 23/06/2016 19:33:45 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET Name='Es Caja', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000037) AND IsCentrallyMaintained='Y'
;

-- 23/06/2016 19:33:45 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_PrintFormatItem pi SET PrintName='Es Caja', Name='Es Caja' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000037)
;

-- 23/06/2016 19:33:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Element_Trl SET Name='Es Caja',PrintName='Es Caja',Updated=TO_DATE('2016-06-23 19:33:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000037 AND AD_Language='es_AR'
;

-- 23/06/2016 19:34:05 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Column_Trl SET Name='Es Caja',Updated=TO_DATE('2016-06-23 19:34:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000147 AND AD_Language='es_AR'
;

-- 23/06/2016 19:35:04 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET Name='Es Caja',Updated=TO_DATE('2016-06-23 19:35:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000089 AND AD_Language='es_AR'
;

-- 23/06/2016 21:39:24 ART
-- ISSUE #80: Cierre de Caja.
DELETE  FROM  AD_Process_Para_Trl WHERE AD_Process_Para_ID=3000001
;

-- 23/06/2016 21:39:24 ART
-- ISSUE #80: Cierre de Caja.
DELETE FROM AD_Process_Para WHERE AD_Process_Para_ID=3000001
;

-- 23/06/2016 21:42:53 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Table SET AD_Window_ID=3000026,Updated=TO_DATE('2016-06-23 21:42:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000031
;

-- 23/06/2016 21:48:19 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Table SET AD_Window_ID=3000009,Updated=TO_DATE('2016-06-23 21:48:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=3000010
;

-- 23/06/2016 21:56:29 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT UpdatedBy FROM C_Payment WHERE C_Payment_ID=C_BankStatementLine.C_Payment_ID)',3001779,393,'U',0,'N','N','N',0,'The User identifies a unique user in the system. This could be an internal user or a business partner contact','N',10,'N',19,'N','N',138,'N','Y','N','N','N','User within the system - Internal or Business Partner Contact','User/Contact','AD_User_ID','N',100,TO_DATE('2016-06-23 21:56:28','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-06-23 21:56:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 23/06/2016 21:56:29 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001779 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 23/06/2016 21:56:38 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Column_Trl SET Name='Cajero',IsTranslated='Y',Updated=TO_DATE('2016-06-23 21:56:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001779 AND AD_Language='es_AR'
;

-- 23/06/2016 21:57:05 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Column_Trl SET IsTranslated='N',Updated=TO_DATE('2016-06-23 21:57:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001779 AND AD_Language='es_AR'
;

-- 23/06/2016 21:57:35 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002683,1,'Y','N','N',3000145,'N','Y',3000008,'N','The transferred checkbox indicates if the transactions associated with this document should be transferred to the General Ledger.','LAR','Transferred to General Ledger (i.e. accounted)','Transferred',100,0,'Y',TO_DATE('2016-06-23 21:57:35','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-06-23 21:57:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/06/2016 21:57:35 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002683 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/06/2016 21:57:35 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002684,10,'Y','N','N',3001779,'N','Y',3000008,'N','The User identifies a unique user in the system. This could be an internal user or a business partner contact','U','User within the system - Internal or Business Partner Contact','User/Contact',100,0,'Y',TO_DATE('2016-06-23 21:57:35','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-06-23 21:57:35','YYYY-MM-DD HH24:MI:SS'))
;

-- 23/06/2016 21:57:35 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002684 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3002684
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000208
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000187
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000188
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000189
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000190
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000191
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000192
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000193
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000194
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000195
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000196
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000197
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000198
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000199
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000200
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000201
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000202
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000203
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000204
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000205
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000206
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000207
;

-- 23/06/2016 22:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3002683
;

-- 23/06/2016 22:00:53 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Transferido',Updated=TO_DATE('2016-06-23 22:00:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002683 AND AD_Language='es_AR'
;

-- 23/06/2016 22:01:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_DATE('2016-06-23 22:01:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002684
;

-- 23/06/2016 22:01:23 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET Name='Cajero',Updated=TO_DATE('2016-06-23 22:01:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002684 AND AD_Language='es_AR'
;

-- 23/06/2016 22:01:25 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET IsTranslated='Y',Updated=TO_DATE('2016-06-23 22:01:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002684 AND AD_Language='es_AR'
;

-- 23/06/2016 22:02:12 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2016-06-23 22:02:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002684
;

-- 23/06/2016 22:02:24 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET EntityType='LAR',Updated=TO_DATE('2016-06-23 22:02:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002684
;

-- 23/06/2016 22:03:16 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Column SET EntityType='LAR',Updated=TO_DATE('2016-06-23 22:03:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001779
;

-- 24/06/2016 15:21:52 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('AD_Ref_List.Value <> ''X''  AND AD_Ref_List.Value <> ''T'' AND AD_Ref_List.Value <> ''Y'' AND AD_Ref_List.Value <> ''Z''','S',3000037,'LAR','TenderType - Cuenta Bancaria',100,100,TO_DATE('2016-06-24 15:21:51','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2016-06-24 15:21:51','YYYY-MM-DD HH24:MI:SS'))
;

-- 24/06/2016 15:22:48 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Column SET AD_Val_Rule_ID=3000037,Updated=TO_DATE('2016-06-24 15:22:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001086
;

-- 27/06/2016 20:50:32 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET IsCentrallyMaintained='Y',Updated=TO_DATE('2016-06-27 20:50:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000152
;

-- 27/06/2016 20:50:37 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET IsCentrallyMaintained='Y',Updated=TO_DATE('2016-06-27 20:50:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000153
;

-- 27/06/2016 20:54:54 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET Description='Los movimientos de caja serán transferidos a la caja Principal. Si se tratase de una Caja Principal, los movimientos de caja serán transferidos a las cuentas bancarias correspondientes, según la forma de pago.',Updated=TO_DATE('2016-06-27 20:54:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000168 AND AD_Language='es_AR'
;

-- 27/06/2016 20:59:03 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Process_Trl SET IsTranslated='Y',Name='Cierre de Controlador Fiscal',Updated=TO_DATE('2016-06-27 20:59:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000013 AND AD_Language='es_AR'
;

-- 27/06/2016 21:00:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Menu_Trl SET IsTranslated='Y',Name='Cierre de Controlador Fiscal',Updated=TO_DATE('2016-06-27 21:00:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=3000016 AND AD_Language='es_AR'
;

-- 27/06/2016 21:01:45 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Process_Para_Trl SET IsTranslated='Y',Name='Tipo de Cierre',Updated=TO_DATE('2016-06-27 21:01:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=3000012 AND AD_Language='es_AR'
;

-- 27/06/2016 21:13:41 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Ref_List_Trl SET Name='Depósito Directo',Updated=TO_DATE('2016-06-27 21:13:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Ref_List_ID=402 AND AD_Language='es_AR'
;

-- 29/06/2016 17:55:30 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field_Trl SET Help='Los movimientos de caja serán transferidos a la caja Principal. Si se tratase de una Caja Principal, los movimientos de caja serán transferidos a las cuentas bancarias correspondientes, según la forma de pago.',Updated=TO_DATE('2016-06-29 17:55:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000168 AND AD_Language='es_AR'
;

-- 29/06/2016 17:56:23 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Process SET Help='Los movimientos de caja serán transferidos a la caja Principal. Si se tratase de una Caja Principal, los movimientos de caja serán transferidos a las cuentas bancarias correspondientes, según la forma de pago.', Description='Transferencia de Valores.',Updated=TO_DATE('2016-06-29 17:56:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000001
;

-- 29/06/2016 17:56:23 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Process_Trl SET IsTranslated='N' WHERE AD_Process_ID=3000001
;

-- 29/06/2016 17:56:23 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Menu SET Name='LAR_DrawerTransfer', Description='Transferencia de Valores.', IsActive='Y',Updated=TO_DATE('2016-06-29 17:56:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=3000007
;

-- 29/06/2016 17:56:23 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Menu_Trl SET IsTranslated='N' WHERE AD_Menu_ID=3000007
;

-- 29/06/2016 17:56:43 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Process_Trl SET Description='Transferencia de Valores.',Help='Los movimientos de caja serán transferidos a la caja Principal. Si se tratase de una Caja Principal, los movimientos de caja serán transferidos a las cuentas bancarias correspondientes, según la forma de pago.',Updated=TO_DATE('2016-06-29 17:56:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000001 AND AD_Language='es_AR'
;

-- 29/06/2016 17:57:38 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Process SET Help=NULL, Description='Los movimientos de caja serán transferidos a la caja Principal. Si se tratase de una Caja Principal, los movimientos de caja serán transferidos a las cuentas bancarias correspondientes, según la forma de pago.',Updated=TO_DATE('2016-06-29 17:57:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000001
;

-- 29/06/2016 17:57:38 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Process_Trl SET IsTranslated='N' WHERE AD_Process_ID=3000001
;

-- 29/06/2016 17:57:38 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Menu SET Name='LAR_DrawerTransfer', Description='Los movimientos de caja serán transferidos a la caja Principal. Si se tratase de una Caja Principal, los movimientos de caja serán transferidos a las cuentas bancarias correspondientes, según la forma de pago.', IsActive='Y',Updated=TO_DATE('2016-06-29 17:57:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=3000007
;

-- 29/06/2016 17:57:38 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Menu_Trl SET IsTranslated='N' WHERE AD_Menu_ID=3000007
;

-- 29/06/2016 17:57:52 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Process_Trl SET Description='Los movimientos de caja serán transferidos a la caja Principal. Si se tratase de una Caja Principal, los movimientos de caja serán transferidos a las cuentas bancarias correspondientes, según la forma de pago.',Help=NULL,Updated=TO_DATE('2016-06-29 17:57:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=3000001 AND AD_Language='es_AR'
;

-- 29/06/2016 18:34:12 ART
-- ISSUE #80: Cierre de Caja.
DELETE  FROM  AD_Process_Para_Trl WHERE AD_Process_Para_ID=3000003
;

-- 29/06/2016 18:34:12 ART
-- ISSUE #80: Cierre de Caja.
DELETE FROM AD_Process_Para WHERE AD_Process_Para_ID=3000003
;

-- 29/06/2016 18:34:16 ART
-- ISSUE #80: Cierre de Caja.
DELETE  FROM  AD_Process_Para_Trl WHERE AD_Process_Para_ID=3000004
;

-- 29/06/2016 18:34:16 ART
-- ISSUE #80: Cierre de Caja.
DELETE FROM AD_Process_Para WHERE AD_Process_Para_ID=3000004
;

-- 29/06/2016 18:34:20 ART
-- ISSUE #80: Cierre de Caja.
DELETE  FROM  AD_Process_Para_Trl WHERE AD_Process_Para_ID=3000005
;

-- 29/06/2016 18:34:20 ART
-- ISSUE #80: Cierre de Caja.
DELETE FROM AD_Process_Para WHERE AD_Process_Para_ID=3000005
;

-- 29/06/2016 18:49:08 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_SysConfig SET Value='http://soporte.comit.com.ar/cgi-bin/get_ID',Updated=TO_DATE('2016-06-29 18:49:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_SysConfig_ID=50004
;

-- 29/06/2016 18:49:16 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000344,'mensajeimportante','LAR','mensajeimportante','mensajeimportante',0,TO_DATE('2016-06-29 18:49:15','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2016-06-29 18:49:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 29/06/2016 18:49:16 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000344 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 29/06/2016 18:49:16 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3001783,392,'LAR',0,'N','N','N','N',255,'N',10,'N',3000344,'N','Y','N','mensajeimportante','mensajeimportante',100,TO_DATE('2016-06-29 18:49:15','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2016-06-29 18:49:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/06/2016 18:49:16 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3001783 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 29/06/2016 18:50:30 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Element SET ColumnName='MensajeImportante', Name='Mensaje Importante', PrintName='Mensaje Importante',Updated=TO_DATE('2016-06-29 18:50:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000344
;

-- 29/06/2016 18:50:30 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000344
;

-- 29/06/2016 18:50:30 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Column SET ColumnName='MensajeImportante', Name='Mensaje Importante', Description=NULL, Help=NULL WHERE AD_Element_ID=3000344
;

-- 29/06/2016 18:50:30 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Process_Para SET ColumnName='MensajeImportante', Name='Mensaje Importante', Description=NULL, Help=NULL, AD_Element_ID=3000344 WHERE UPPER(ColumnName)='MENSAJEIMPORTANTE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 29/06/2016 18:50:30 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Process_Para SET ColumnName='MensajeImportante', Name='Mensaje Importante', Description=NULL, Help=NULL WHERE AD_Element_ID=3000344 AND IsCentrallyMaintained='Y'
;

-- 29/06/2016 18:50:30 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET Name='Mensaje Importante', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000344) AND IsCentrallyMaintained='Y'
;

-- 29/06/2016 18:50:30 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_PrintFormatItem pi SET PrintName='Mensaje Importante', Name='Mensaje Importante' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000344)
;

-- 29/06/2016 18:50:41 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Element_Trl SET Name='Mensaje Importante',PrintName='Mensaje Importante',Updated=TO_DATE('2016-06-29 18:50:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000344 AND AD_Language='es_AR'
;

-- 29/06/2016 18:50:57 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Column SET FieldLength=0, AD_Reference_ID=36, Name='Mensaje Importante', ColumnName='MensajeImportante',Updated=TO_DATE('2016-06-29 18:50:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001783
;

-- 29/06/2016 18:51:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Column_Trl SET Name='Mensaje Importante',Updated=TO_DATE('2016-06-29 18:51:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001783 AND AD_Language='es_AR'
;

-- 29/06/2016 18:51:46 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Column SET IsUpdateable='N',Updated=TO_DATE('2016-06-29 18:51:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001783
;

-- 29/06/2016 18:54:09 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002686,0,'Y','N','N',3001783,'N','Y',3000007,'N','LAR','Mensaje Importante',100,0,'Y',TO_DATE('2016-06-29 18:54:09','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2016-06-29 18:54:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 29/06/2016 18:54:09 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002686 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 29/06/2016 18:54:30 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002653
;

-- 29/06/2016 18:54:30 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3002686
;

-- 29/06/2016 18:54:30 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000170
;

-- 29/06/2016 18:55:24 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET IsSameLine='Y', IsReadOnly='Y', DisplayLogic='@DocStatus@=DR', DefaultValue='Los movimientos de caja serán transferidos a la caja Principal. Si se tratase de una Caja Principal, los movimientos de caja serán transferidos a las cuentas bancarias correspondientes, según la forma de pago.',Updated=TO_DATE('2016-06-29 18:55:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002686
;

-- 29/06/2016 18:56:38 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET DefaultValue=NULL,Updated=TO_DATE('2016-06-29 18:56:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002686
;

-- 29/06/2016 18:57:56 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Column SET DefaultValue='Los movimientos de caja serán transferidos a la caja Principal. Si se tratase de una Caja Principal los movimientos de caja serán transferidos a las cuentas bancarias correspondientes según la forma de pago.',Updated=TO_DATE('2016-06-29 18:57:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001783
;

-- 29/06/2016 18:59:25 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Column SET FieldLength=255, AD_Reference_ID=14,Updated=TO_DATE('2016-06-29 18:59:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001783
;

-- 29/06/2016 19:00:11 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Column SET FieldLength=0, AD_Reference_ID=36,Updated=TO_DATE('2016-06-29 19:00:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001783
;

-- 29/06/2016 19:01:23 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Column SET FieldLength=255, AD_Reference_ID=14,Updated=TO_DATE('2016-06-29 19:01:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001783
;

-- 18/07/2016 17:07:27 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002718,10,'Y','N','N',3001205,'N','Y',3000013,'N','LAR','Plan de Pago',100,0,TO_DATE('2016-07-18 17:07:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-07-18 17:07:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/07/2016 17:07:27 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002718 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/07/2016 17:07:27 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002719,10,'Y','N','N',3001188,'N','Y',3000013,'N','LAR','Tarjeta de Crédito',100,0,TO_DATE('2016-07-18 17:07:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-07-18 17:07:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/07/2016 17:07:27 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002719 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/07/2016 17:07:28 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002720,10,'Y','N','N',3001772,'N','Y',3000013,'N','LAR','Tarjeta de Debito',100,0,TO_DATE('2016-07-18 17:07:27','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-07-18 17:07:27','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/07/2016 17:07:28 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002720 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002718
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3002719
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3001954
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3002720
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000334
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000335
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000336
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000337
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000338
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000339
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000340
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000341
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000342
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000343
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000344
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000345
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000346
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000347
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000348
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000349
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000350
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000351
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000352
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000353
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000354
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000355
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000356
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000357
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000358
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000359
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000360
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000363
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000302
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000362
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000289
;

-- 18/07/2016 17:08:50 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- 18/07/2016 17:09:13 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET DisplayLogic='@TenderType@=C',Updated=TO_DATE('2016-07-18 17:09:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002719
;

-- 18/07/2016 17:09:22 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET DisplayLogic='@TenderType@=D',Updated=TO_DATE('2016-07-18 17:09:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002720
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000333
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001954
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3002719
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3002720
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000334
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000335
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000336
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000337
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000338
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000339
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000340
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000341
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000342
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000343
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000344
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000345
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000346
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000347
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000348
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000349
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000350
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000351
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000352
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000353
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000354
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000355
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000356
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000357
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000358
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000359
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000360
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000363
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000302
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000362
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000289
;

-- 18/07/2016 17:10:06 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- 18/07/2016 17:19:53 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002721,10,'Y','N','N',3000816,'N','Y',3000024,'N','LAR','C_TaxWithholding_ID',100,0,TO_DATE('2016-07-18 17:19:53','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-07-18 17:19:53','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/07/2016 17:19:53 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002721 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/07/2016 17:19:53 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002722,1,'Y','N','N',3001179,'N','Y',3000024,'N','LAR','DebitCardType',100,0,TO_DATE('2016-07-18 17:19:53','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-07-18 17:19:53','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/07/2016 17:19:53 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002722 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/07/2016 17:19:54 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002723,1,'Y','N','N',3000832,'N','Y',3000024,'N','LAR','EsRetencionIIBB',100,0,TO_DATE('2016-07-18 17:19:53','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-07-18 17:19:53','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/07/2016 17:19:54 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002723 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/07/2016 17:19:54 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002724,1,'Y','N','N',3000965,'N','Y',3000024,'N','LAR','EsRetencionSufrida',100,0,TO_DATE('2016-07-18 17:19:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-07-18 17:19:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/07/2016 17:19:54 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002724 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/07/2016 17:19:54 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002725,1,'Y','N','N',3000825,'N','Y',3000024,'N','LAR','IsBounced',100,0,TO_DATE('2016-07-18 17:19:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-07-18 17:19:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/07/2016 17:19:54 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002725 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/07/2016 17:19:54 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002726,1,'Y','N','N',3000826,'N','Y',3000024,'N','LAR','IsDeposited',100,0,TO_DATE('2016-07-18 17:19:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-07-18 17:19:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/07/2016 17:19:54 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002726 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/07/2016 17:19:54 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002727,10,'Y','N','N',3001205,'N','Y',3000024,'N','LAR','Plan de Pago',100,0,TO_DATE('2016-07-18 17:19:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-07-18 17:19:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/07/2016 17:19:54 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002727 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/07/2016 17:19:54 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002728,60,'Y','N','N',3000824,'N','Y',3000024,'N','LAR','TargetAccount',100,0,TO_DATE('2016-07-18 17:19:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-07-18 17:19:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/07/2016 17:19:54 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002728 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/07/2016 17:19:54 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002729,10,'Y','N','N',3001188,'N','Y',3000024,'N','LAR','Tarjeta de Crédito',100,0,TO_DATE('2016-07-18 17:19:54','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-07-18 17:19:54','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/07/2016 17:19:54 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002729 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/07/2016 17:19:55 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002730,10,'Y','N','N',3001772,'N','Y',3000024,'N','LAR','Tarjeta de Debito',100,0,TO_DATE('2016-07-18 17:19:55','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-07-18 17:19:55','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/07/2016 17:19:55 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002730 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/07/2016 17:19:55 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002731,20,'Y','N','N',3000820,'N','Y',3000024,'N','LAR','WithholdingCertNo',100,0,TO_DATE('2016-07-18 17:19:55','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-07-18 17:19:55','YYYY-MM-DD HH24:MI:SS'))
;

-- 18/07/2016 17:19:55 ART
-- ISSUE #80: Cierre de Caja.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002731 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002721
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002722
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002723
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002724
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002725
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002726
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000853
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002727
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002728
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002731
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000854
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3002729
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3002730
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000824
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000825
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000826
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000827
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000828
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000829
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000830
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000831
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000832
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000833
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000834
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000835
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000836
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000837
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000838
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000839
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000840
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000841
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000842
;

-- 18/07/2016 17:26:42 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000843
;

-- 18/07/2016 17:26:43 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000844
;

-- 18/07/2016 17:26:43 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000845
;

-- 18/07/2016 17:26:43 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000846
;

-- 18/07/2016 17:26:43 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000847
;

-- 18/07/2016 17:26:43 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000848
;

-- 18/07/2016 17:26:43 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000849
;

-- 18/07/2016 17:26:43 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000850
;

-- 18/07/2016 17:26:43 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000851
;

-- 18/07/2016 17:26:43 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000852
;

-- 18/07/2016 17:26:43 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000857
;

-- 18/07/2016 17:26:43 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000855
;

-- 18/07/2016 17:26:43 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000856
;

-- 18/07/2016 17:26:43 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000858
;

-- 18/07/2016 17:27:00 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET DisplayLogic='@TenderType@=C',Updated=TO_DATE('2016-07-18 17:27:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002729
;

-- 18/07/2016 17:27:14 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET DisplayLogic='@TenderType@=D',Updated=TO_DATE('2016-07-18 17:27:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002730
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000823
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3002729
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3002730
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000824
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000825
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000826
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000827
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000828
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000829
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000830
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000831
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000832
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000833
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000834
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000835
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000836
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000837
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000838
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000839
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000840
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000841
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000842
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000843
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000844
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000845
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000846
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000847
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000848
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000849
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000850
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000851
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000852
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000857
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000855
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000856
;

-- 18/07/2016 17:27:21 ART
-- ISSUE #80: Cierre de Caja.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000858
;

-- 04/08/2016 16:38:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Table SET AD_Window_ID=1000005,Updated=TO_DATE('2016-08-04 16:38:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=335
;

-- 04/08/2016 16:39:05 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Table SET PO_Window_ID=195,Updated=TO_DATE('2016-08-04 16:39:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Table_ID=335
;

-- 04/08/2016 16:44:09 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000215
;

-- 04/08/2016 16:44:09 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000221
;

-- 04/08/2016 16:44:09 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000167
;

-- 04/08/2016 16:44:09 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000168
;

-- 04/08/2016 16:44:09 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000169
;

-- 04/08/2016 16:44:09 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3002686
;

-- 04/08/2016 16:44:09 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000170
;

-- 04/08/2016 16:51:01 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Val_Rule (Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('S',3000038,'LAR','Forma de Pago',100,100,TO_DATE('2016-08-04 16:51:00','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_DATE('2016-08-04 16:51:00','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 16:56:04 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Val_Rule SET Code='AD_Ref_List.Value <> ''N'' AND AD_Ref_List.Value <> ''O'' AD_Ref_List.Value <> ''Y''',Updated=TO_DATE('2016-08-04 16:56:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000038
;

-- 04/08/2016 16:57:04 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Val_Rule SET Code='AD_Ref_List.Value <> ''N'' AND AD_Ref_List.Value <> ''O'' AND AD_Ref_List.Value <> ''Y''',Updated=TO_DATE('2016-08-04 16:57:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000038
;

-- 04/08/2016 16:57:09 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET AD_Reference_ID=17, AD_Reference_Value_ID=214, AD_Val_Rule_ID=3000038,Updated=TO_DATE('2016-08-04 16:57:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000450
;

-- 04/08/2016 16:58:37 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET AD_Reference_ID=17, AD_Reference_Value_ID=214, AD_Val_Rule_ID=3000038,Updated=TO_DATE('2016-08-04 16:58:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=4056
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002758
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3002759
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3002760
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=1000233
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=1000234
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=1000235
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=1000236
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=1000237
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=1000238
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=1000239
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=1000240
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=1000241
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=1000242
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=1000243
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=1000244
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=1000245
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=1000246
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=1000247
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=1000248
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=1000249
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=1000250
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=1000251
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=1000252
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=1000253
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=1000254
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=1000255
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=1000256
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=1000257
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=1000258
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=1000259
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=1000260
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=1000261
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=1000262
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=690,IsDisplayed='Y' WHERE AD_Field_ID=1000263
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=700,IsDisplayed='Y' WHERE AD_Field_ID=1000264
;

-- 04/08/2016 19:29:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=710,IsDisplayed='Y' WHERE AD_Field_ID=3001944
;

-- 04/08/2016 19:29:54 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=720,IsDisplayed='Y' WHERE AD_Field_ID=3001953
;

-- 04/08/2016 19:29:54 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=730,IsDisplayed='Y' WHERE AD_Field_ID=3001945
;

-- 04/08/2016 19:29:54 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=740,IsDisplayed='Y' WHERE AD_Field_ID=3001949
;

-- 04/08/2016 19:29:54 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=750,IsDisplayed='Y' WHERE AD_Field_ID=3001950
;

-- 04/08/2016 19:29:54 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=760,IsDisplayed='Y' WHERE AD_Field_ID=3001946
;

-- 04/08/2016 19:29:54 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=770,IsDisplayed='Y' WHERE AD_Field_ID=3001947
;

-- 04/08/2016 19:29:54 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=780,IsDisplayed='Y' WHERE AD_Field_ID=3001951
;

-- 04/08/2016 19:29:54 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=790,IsDisplayed='Y' WHERE AD_Field_ID=3001952
;

-- 04/08/2016 19:29:54 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=800,IsDisplayed='Y' WHERE AD_Field_ID=3001948
;

-- 04/08/2016 19:30:22 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=C',Updated=TO_DATE('2016-08-04 19:30:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002759
;

-- 04/08/2016 19:30:32 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=D',Updated=TO_DATE('2016-08-04 19:30:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002760
;

-- 04/08/2016 19:30:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=1000232
;

-- 04/08/2016 19:30:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3002759
;

-- 04/08/2016 19:30:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3002760
;

-- 04/08/2016 19:30:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=1000233
;

-- 04/08/2016 19:30:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=1000234
;

-- 04/08/2016 19:30:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=1000235
;

-- 04/08/2016 19:30:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=1000236
;

-- 04/08/2016 19:30:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=1000237
;

-- 04/08/2016 19:30:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=1000238
;

-- 04/08/2016 19:30:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=1000239
;

-- 04/08/2016 19:30:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=1000240
;

-- 04/08/2016 19:30:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=1000241
;

-- 04/08/2016 19:30:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=1000242
;

-- 04/08/2016 19:30:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=1000243
;

-- 04/08/2016 19:30:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=1000244
;

-- 04/08/2016 19:30:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=1000245
;

-- 04/08/2016 19:30:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=1000246
;

-- 04/08/2016 19:30:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=1000247
;

-- 04/08/2016 19:30:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=1000248
;

-- 04/08/2016 19:30:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=1000249
;

-- 04/08/2016 19:30:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=1000250
;

-- 04/08/2016 19:30:49 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=1000251
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=1000252
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=1000253
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=1000254
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=1000255
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=1000256
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=1000257
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=1000258
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=1000259
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=1000260
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=1000261
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=1000262
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=1000263
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=690,IsDisplayed='Y' WHERE AD_Field_ID=1000264
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=700,IsDisplayed='Y' WHERE AD_Field_ID=3001944
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=710,IsDisplayed='Y' WHERE AD_Field_ID=3001953
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=720,IsDisplayed='Y' WHERE AD_Field_ID=3001945
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=730,IsDisplayed='Y' WHERE AD_Field_ID=3001949
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=740,IsDisplayed='Y' WHERE AD_Field_ID=3001950
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=750,IsDisplayed='Y' WHERE AD_Field_ID=3001946
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=760,IsDisplayed='Y' WHERE AD_Field_ID=3001947
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=770,IsDisplayed='Y' WHERE AD_Field_ID=3001951
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=780,IsDisplayed='Y' WHERE AD_Field_ID=3001952
;

-- 04/08/2016 19:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=790,IsDisplayed='Y' WHERE AD_Field_ID=3001948
;

-- 04/08/2016 19:31:15 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002761,10,'Y','N','N',3000816,'N','Y',3000016,'N','LAR','C_TaxWithholding_ID',100,0,TO_DATE('2016-08-04 19:31:14','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-08-04 19:31:14','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 19:31:15 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002761 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/08/2016 19:31:15 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002762,1,'Y','N','N',3001179,'N','Y',3000016,'N','LAR','DebitCardType',100,0,TO_DATE('2016-08-04 19:31:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-08-04 19:31:15','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 19:31:15 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002762 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/08/2016 19:31:15 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002763,1,'Y','N','N',3000832,'N','Y',3000016,'N','LAR','EsRetencionIIBB',100,0,TO_DATE('2016-08-04 19:31:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-08-04 19:31:15','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 19:31:15 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002763 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/08/2016 19:31:15 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002764,1,'Y','N','N',3000965,'N','Y',3000016,'N','LAR','EsRetencionSufrida',100,0,TO_DATE('2016-08-04 19:31:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-08-04 19:31:15','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 19:31:15 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002764 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/08/2016 19:31:15 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002765,1,'Y','N','N',3000825,'N','Y',3000016,'N','LAR','IsBounced',100,0,TO_DATE('2016-08-04 19:31:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-08-04 19:31:15','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 19:31:15 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002765 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/08/2016 19:31:15 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002766,1,'Y','N','N',3000826,'N','Y',3000016,'N','LAR','IsDeposited',100,0,TO_DATE('2016-08-04 19:31:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-08-04 19:31:15','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 19:31:15 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002766 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/08/2016 19:31:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002767,10,'Y','N','N',3001205,'N','Y',3000016,'N','LAR','Plan de Pago',100,0,TO_DATE('2016-08-04 19:31:15','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-08-04 19:31:15','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 19:31:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002767 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/08/2016 19:31:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002768,60,'Y','N','N',3000824,'N','Y',3000016,'N','LAR','TargetAccount',100,0,TO_DATE('2016-08-04 19:31:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-08-04 19:31:16','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 19:31:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002768 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/08/2016 19:31:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002769,10,'Y','N','N',3001188,'N','Y',3000016,'N','LAR','Tarjeta de Crédito',100,0,TO_DATE('2016-08-04 19:31:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-08-04 19:31:16','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 19:31:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002769 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/08/2016 19:31:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002770,10,'Y','N','N',3001772,'N','Y',3000016,'N','LAR','Tarjeta de Debito',100,0,TO_DATE('2016-08-04 19:31:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-08-04 19:31:16','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 19:31:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002770 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/08/2016 19:31:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002771,20,'Y','N','N',3000820,'N','Y',3000016,'N','LAR','WithholdingCertNo',100,0,TO_DATE('2016-08-04 19:31:16','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-08-04 19:31:16','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 19:31:16 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002771 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002761
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002762
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002763
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002764
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002765
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002766
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002767
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002768
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002771
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3002769
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3002770
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000457
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000458
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000459
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000460
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000461
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000462
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000463
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000464
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000465
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000466
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000467
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000468
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000469
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000470
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000471
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000472
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000473
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000474
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000475
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000476
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000477
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000478
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000479
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000480
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000481
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000482
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000483
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000484
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000485
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000491
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000492
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000490
;

-- 04/08/2016 19:33:19 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000488
;

-- 04/08/2016 19:33:36 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=C',Updated=TO_DATE('2016-08-04 19:33:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002769
;

-- 04/08/2016 19:33:48 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=D',Updated=TO_DATE('2016-08-04 19:33:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002770
;

-- 04/08/2016 19:33:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000456
;

-- 04/08/2016 19:33:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3002769
;

-- 04/08/2016 19:33:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3002770
;

-- 04/08/2016 19:33:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000457
;

-- 04/08/2016 19:33:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000458
;

-- 04/08/2016 19:33:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000459
;

-- 04/08/2016 19:33:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000460
;

-- 04/08/2016 19:33:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000461
;

-- 04/08/2016 19:33:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000462
;

-- 04/08/2016 19:33:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000463
;

-- 04/08/2016 19:33:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000464
;

-- 04/08/2016 19:33:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000465
;

-- 04/08/2016 19:33:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000466
;

-- 04/08/2016 19:33:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000467
;

-- 04/08/2016 19:33:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000468
;

-- 04/08/2016 19:33:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000469
;

-- 04/08/2016 19:33:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000470
;

-- 04/08/2016 19:33:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000471
;

-- 04/08/2016 19:33:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000472
;

-- 04/08/2016 19:33:57 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000473
;

-- 04/08/2016 19:33:57 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000474
;

-- 04/08/2016 19:33:57 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000475
;

-- 04/08/2016 19:33:57 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000476
;

-- 04/08/2016 19:33:57 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000477
;

-- 04/08/2016 19:33:57 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000478
;

-- 04/08/2016 19:33:57 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000479
;

-- 04/08/2016 19:33:57 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000480
;

-- 04/08/2016 19:33:57 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000481
;

-- 04/08/2016 19:33:57 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000482
;

-- 04/08/2016 19:33:57 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000483
;

-- 04/08/2016 19:33:57 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000484
;

-- 04/08/2016 19:33:57 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000485
;

-- 04/08/2016 19:33:57 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000491
;

-- 04/08/2016 19:33:57 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000492
;

-- 04/08/2016 19:33:57 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000490
;

-- 04/08/2016 19:33:57 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000488
;

-- 04/08/2016 19:34:31 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002772,10,'Y','N','N',3000816,'N','Y',3000031,'N','LAR','C_TaxWithholding_ID',100,0,TO_DATE('2016-08-04 19:34:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-08-04 19:34:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 19:34:31 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002772 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/08/2016 19:34:31 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002773,1,'Y','N','N',3001179,'N','Y',3000031,'N','LAR','DebitCardType',100,0,TO_DATE('2016-08-04 19:34:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-08-04 19:34:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 19:34:31 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002773 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/08/2016 19:34:31 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002774,1,'Y','N','N',3000832,'N','Y',3000031,'N','LAR','EsRetencionIIBB',100,0,TO_DATE('2016-08-04 19:34:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-08-04 19:34:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 19:34:31 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002774 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/08/2016 19:34:31 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002775,1,'Y','N','N',3000965,'N','Y',3000031,'N','LAR','EsRetencionSufrida',100,0,TO_DATE('2016-08-04 19:34:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-08-04 19:34:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 19:34:31 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002775 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/08/2016 19:34:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002776,1,'Y','N','N',3000825,'N','Y',3000031,'N','LAR','IsBounced',100,0,TO_DATE('2016-08-04 19:34:31','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-08-04 19:34:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 19:34:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002776 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/08/2016 19:34:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002777,1,'Y','N','N',3000826,'N','Y',3000031,'N','LAR','IsDeposited',100,0,TO_DATE('2016-08-04 19:34:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-08-04 19:34:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 19:34:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002777 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/08/2016 19:34:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002778,10,'Y','N','N',3001205,'N','Y',3000031,'N','LAR','Plan de Pago',100,0,TO_DATE('2016-08-04 19:34:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-08-04 19:34:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 19:34:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002778 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/08/2016 19:34:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002779,60,'Y','N','N',3000824,'N','Y',3000031,'N','LAR','TargetAccount',100,0,TO_DATE('2016-08-04 19:34:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-08-04 19:34:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 19:34:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002779 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/08/2016 19:34:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002780,10,'Y','N','N',3001188,'N','Y',3000031,'N','LAR','Tarjeta de Crédito',100,0,TO_DATE('2016-08-04 19:34:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-08-04 19:34:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 19:34:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002780 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/08/2016 19:34:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002781,10,'Y','N','N',3001772,'N','Y',3000031,'N','LAR','Tarjeta de Debito',100,0,TO_DATE('2016-08-04 19:34:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-08-04 19:34:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 19:34:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002781 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/08/2016 19:34:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3002782,20,'Y','N','N',3000820,'N','Y',3000031,'N','LAR','WithholdingCertNo',100,0,TO_DATE('2016-08-04 19:34:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2016-08-04 19:34:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/08/2016 19:34:32 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3002782 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002772
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002773
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002774
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002775
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002776
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002777
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002778
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002779
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002782
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3002780
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3002781
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3001225
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3001226
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3001227
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3001228
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3001229
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3001230
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3001231
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3001232
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3001233
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3001234
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3001235
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3001236
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3001237
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3001238
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3001239
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3001240
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3001241
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3001242
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3001243
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3001244
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3001245
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3001246
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3001247
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3001248
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3001249
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3001250
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3001251
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3001252
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3001253
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3001254
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3001255
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3001256
;

-- 04/08/2016 19:35:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3001257
;

-- 04/08/2016 19:36:11 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=C',Updated=TO_DATE('2016-08-04 19:36:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002780
;

-- 04/08/2016 19:36:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=D',Updated=TO_DATE('2016-08-04 19:36:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002781
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3001224
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3002780
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3002781
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3001225
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3001226
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3001227
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3001228
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3001229
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3001230
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3001231
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3001232
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3001233
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3001234
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3001235
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3001236
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3001237
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3001238
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3001239
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3001240
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3001241
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3001242
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3001243
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3001244
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3001245
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3001246
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3001247
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3001248
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3001249
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3001250
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3001251
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3001252
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3001253
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3001254
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3001255
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3001256
;

-- 04/08/2016 19:36:58 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3001257
;

-- 17/08/2016 18:47:17 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET IsUpdateable='N',Updated=TO_DATE('2016-08-17 18:47:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=4917
;

-- Registración de script
SELECT register_migration_script_lar('0072_ISSUE-80.sql', 'LAR', '') FROM dual
;
