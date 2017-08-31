ALTER TABLE LAR_RetiroCaja ADD COLUMN ExtraccionBancaria character(1) NOT NULL DEFAULT 'N'::bpchar;
ALTER TABLE LAR_RetiroCaja ADD CONSTRAINT lar_retirocaja_extraccionbancaria_check CHECK (ExtraccionBancaria = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));
ALTER TABLE LAR_RetiroCaja ALTER COLUMN C_BankAccountFrom_ID DROP NOT NULL;

ALTER TABLE LAR_RetiroCaja ADD COLUMN CuentaOrigen_ID numeric(10,0);
ALTER TABLE LAR_RetiroCaja ADD CONSTRAINT cuentaorigenid_larretirocaja FOREIGN KEY (CuentaOrigen_ID)
      REFERENCES C_BankAccount (C_BankAccount_ID) MATCH SIMPLE;

-- 31/08/2017 17:33:08 ART
-- ISSUE #80: Extracción Bancaria.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000464,'extraccionbancaria','LAR','extraccionbancaria','extraccionbancaria',0,TO_TIMESTAMP('2017-08-31 17:33:08','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2017-08-31 17:33:08','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 31/08/2017 17:33:08 ART
-- ISSUE #80: Extracción Bancaria.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000464 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 31/08/2017 17:33:09 ART
-- ISSUE #80: Extracción Bancaria.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002120,3000081,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000464,'N','Y','N','extraccionbancaria','extraccionbancaria',100,TO_TIMESTAMP('2017-08-31 17:33:08','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2017-08-31 17:33:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/08/2017 17:33:09 ART
-- ISSUE #80: Extracción Bancaria.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002120 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/08/2017 17:33:09 ART
-- ISSUE #80: Extracción Bancaria.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000465,'cuentaorigen_id','LAR','cuentaorigen_id','cuentaorigen_id',0,TO_TIMESTAMP('2017-08-31 17:33:09','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2017-08-31 17:33:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 31/08/2017 17:33:09 ART
-- ISSUE #80: Extracción Bancaria.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000465 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 31/08/2017 17:33:09 ART
-- ISSUE #80: Extracción Bancaria.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002121,3000081,'LAR',0,'N','N','N','N',10,'N',19,'N',3000465,'N','Y','N','cuentaorigen_id','cuentaorigen_id',100,TO_TIMESTAMP('2017-08-31 17:33:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2017-08-31 17:33:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/08/2017 17:33:09 ART
-- ISSUE #80: Extracción Bancaria.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002121 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/08/2017 17:35:08 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Element SET ColumnName='CuentaOrigen_ID', Name='Cuenta Origen', PrintName='Cuenta Origen',Updated=TO_TIMESTAMP('2017-08-31 17:35:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000465
;

-- 31/08/2017 17:35:08 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000465
;

-- 31/08/2017 17:35:08 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Column SET ColumnName='CuentaOrigen_ID', Name='Cuenta Origen', Description=NULL, Help=NULL WHERE AD_Element_ID=3000465
;

-- 31/08/2017 17:35:08 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Process_Para SET ColumnName='CuentaOrigen_ID', Name='Cuenta Origen', Description=NULL, Help=NULL, AD_Element_ID=3000465 WHERE UPPER(ColumnName)='CUENTAORIGEN_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 31/08/2017 17:35:08 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Process_Para SET ColumnName='CuentaOrigen_ID', Name='Cuenta Origen', Description=NULL, Help=NULL WHERE AD_Element_ID=3000465 AND IsCentrallyMaintained='Y'
;

-- 31/08/2017 17:35:08 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET Name='Cuenta Origen', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000465) AND IsCentrallyMaintained='Y'
;

-- 31/08/2017 17:35:08 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_PrintFormatItem SET PrintName='Cuenta Origen', Name='Cuenta Origen' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000465)
;

-- 31/08/2017 17:35:17 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Element_Trl SET Name='Cuenta Origen',PrintName='Cuenta Origen',Updated=TO_TIMESTAMP('2017-08-31 17:35:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000465 AND AD_Language='es_AR'
;

-- 31/08/2017 17:35:46 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Column SET AD_Reference_Value_ID=53283, AD_Reference_ID=18, AD_Val_Rule_ID=3000033, Name='Cuenta Origen', ColumnName='CuentaOrigen_ID',Updated=TO_TIMESTAMP('2017-08-31 17:35:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002121
;

-- 31/08/2017 17:35:55 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Column_Trl SET Name='Cuenta Origen',Updated=TO_TIMESTAMP('2017-08-31 17:35:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002121 AND AD_Language='es_AR'
;

-- 31/08/2017 17:40:09 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Column SET Name='Extracción Bancaria', ColumnName='ExtraccionbBancaria',Updated=TO_TIMESTAMP('2017-08-31 17:40:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002120
;

-- 31/08/2017 17:40:09 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3002120
;

-- 31/08/2017 17:40:09 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET Name='Extracción Bancaria', Description=NULL, Help=NULL WHERE AD_Column_ID=3002120 AND IsCentrallyMaintained='Y'
;

-- 31/08/2017 17:40:25 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Element SET ColumnName='ExtraccionBancaria', Name='Extracción Bancaria', PrintName='Extracción Bancaria',Updated=TO_TIMESTAMP('2017-08-31 17:40:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000464
;

-- 31/08/2017 17:40:25 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000464
;

-- 31/08/2017 17:40:25 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Column SET ColumnName='ExtraccionBancaria', Name='Extracción Bancaria', Description=NULL, Help=NULL WHERE AD_Element_ID=3000464
;

-- 31/08/2017 17:40:25 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Process_Para SET ColumnName='ExtraccionBancaria', Name='Extracción Bancaria', Description=NULL, Help=NULL, AD_Element_ID=3000464 WHERE UPPER(ColumnName)='EXTRACCIONBANCARIA' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 31/08/2017 17:40:25 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Process_Para SET ColumnName='ExtraccionBancaria', Name='Extracción Bancaria', Description=NULL, Help=NULL WHERE AD_Element_ID=3000464 AND IsCentrallyMaintained='Y'
;

-- 31/08/2017 17:40:25 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET Name='Extracción Bancaria', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000464) AND IsCentrallyMaintained='Y'
;

-- 31/08/2017 17:40:25 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_PrintFormatItem SET PrintName='Extracción Bancaria', Name='Extracción Bancaria' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000464)
;

-- 31/08/2017 17:40:31 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Element_Trl SET Name='Extracción Bancaria',PrintName='Extracción Bancaria',Updated=TO_TIMESTAMP('2017-08-31 17:40:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000464 AND AD_Language='es_AR'
;

-- 31/08/2017 17:41:49 ART
-- ISSUE #80: Extracción Bancaria.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003365,10,'Y','N','N',3002121,'N','Y',3000127,'N','LAR','Cuenta Origen',100,0,TO_TIMESTAMP('2017-08-31 17:41:49','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2017-08-31 17:41:49','YYYY-MM-DD HH24:MI:SS'))
;

-- 31/08/2017 17:41:49 ART
-- ISSUE #80: Extracción Bancaria.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003365 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/08/2017 17:41:49 ART
-- ISSUE #80: Extracción Bancaria.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003366,1,'Y','N','N',3002120,'N','Y',3000127,'N','LAR','Extracción Bancaria',100,0,TO_TIMESTAMP('2017-08-31 17:41:49','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2017-08-31 17:41:49','YYYY-MM-DD HH24:MI:SS'))
;

-- 31/08/2017 17:41:49 ART
-- ISSUE #80: Extracción Bancaria.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003366 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 31/08/2017 17:42:32 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET SeqNo=50,IsDisplayed='Y' WHERE AD_Field_ID=3003365
;

-- 31/08/2017 17:42:32 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3002740
;

-- 31/08/2017 17:42:32 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3002816
;

-- 31/08/2017 17:42:32 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3002750
;

-- 31/08/2017 17:42:32 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3002752
;

-- 31/08/2017 17:42:32 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3003366
;

-- 31/08/2017 17:42:32 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3002814
;

-- 31/08/2017 17:42:32 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3002815
;

-- 31/08/2017 17:42:32 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3002743
;

-- 31/08/2017 17:42:32 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3002754
;

-- 31/08/2017 17:42:32 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3002748
;

-- 31/08/2017 17:42:32 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3002744
;

-- 31/08/2017 17:42:32 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3002787
;

-- 31/08/2017 17:42:32 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3002747
;

-- 31/08/2017 17:42:32 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3002746
;

-- 31/08/2017 17:42:32 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3002739
;

-- 31/08/2017 17:44:01 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET IsSameLine='Y', DisplayLogic='@ExtraccionBancaria@=Y',Updated=TO_TIMESTAMP('2017-08-31 17:44:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003365
;

-- 31/08/2017 17:46:18 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET DisplayLogic='@Retiro@=Y | @Transferencia@=Y | @Deposito@=Y',Updated=TO_TIMESTAMP('2017-08-31 17:46:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002741
;

-- 31/08/2017 17:47:21 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET DisplayLogic='@Transferencia@=N & @Deposito@=N & @ExtraccionBancaria@=N',Updated=TO_TIMESTAMP('2017-08-31 17:47:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002750
;

-- 31/08/2017 17:47:57 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET DisplayLogic='@Retiro@=N & @Deposito@=N & @ExtraccionBancaria@=N',Updated=TO_TIMESTAMP('2017-08-31 17:47:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002752
;

-- 31/08/2017 17:48:57 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET DisplayLogic='@Retiro@=N & @Transferencia@=N & @ExtraccionBancaria@=N',Updated=TO_TIMESTAMP('2017-08-31 17:48:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002814
;

-- 31/08/2017 17:49:33 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET DisplayLogic='@Retiro@=N & @Deposito@=N & @Transferencia@=N',Updated=TO_TIMESTAMP('2017-08-31 17:49:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003366
;

-- 31/08/2017 17:51:56 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Column SET IsMandatory='N',Updated=TO_TIMESTAMP('2017-08-31 17:51:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001817
;

-- 31/08/2017 17:53:01 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Column SET MandatoryLogic='@Retiro@=Y | @Transferencia@=Y | @Deposito@=Y',Updated=TO_TIMESTAMP('2017-08-31 17:53:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001817
;

-- 31/08/2017 17:54:18 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Column SET MandatoryLogic='@ExtraccionBancaria@=Y',Updated=TO_TIMESTAMP('2017-08-31 17:54:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002121
;

-- 31/08/2017 17:54:26 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_TIMESTAMP('2017-08-31 17:54:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002121
;

-- 31/08/2017 17:54:42 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_TIMESTAMP('2017-08-31 17:54:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001869
;

-- 31/08/2017 17:55:06 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_TIMESTAMP('2017-08-31 17:55:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001817
;

-- 31/08/2017 17:55:14 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_TIMESTAMP('2017-08-31 17:55:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001818
;

-- 31/08/2017 17:55:39 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_TIMESTAMP('2017-08-31 17:55:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002120
;

-- 31/08/2017 17:55:52 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_TIMESTAMP('2017-08-31 17:55:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001867
;

-- 31/08/2017 17:56:02 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_TIMESTAMP('2017-08-31 17:56:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001868
;

-- 31/08/2017 17:56:21 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_TIMESTAMP('2017-08-31 17:56:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001823
;

-- 31/08/2017 17:56:29 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Column SET IsSelectionColumn='Y',Updated=TO_TIMESTAMP('2017-08-31 17:56:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001824
;

-- 31/08/2017 20:04:45 ART
-- ISSUE #80: Extracción Bancaria.
UPDATE AD_Field SET DisplayLogic='@ExtraccionBancaria@=N',Updated=TO_TIMESTAMP('2017-08-31 20:04:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3002787
;

-- Registración de script
SELECT register_migration_script_lar('0096_ISSUE-80.sql', 'LAR', '')
;
