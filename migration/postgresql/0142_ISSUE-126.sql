-- 31/10/2019 15:28:30 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
INSERT INTO C_Charge (IsSameCurrency,IsSameTax,C_TaxCategory_ID,ChargeAmt,C_Charge_ID,IsTaxIncluded,Name,AD_Org_ID,CreatedBy,IsActive,Created,UpdatedBy,Updated,AD_Client_ID) VALUES ('N','N',1000001,0,4000002,'N','Desc. Financiero por Pago',1000000,100,'Y',TO_TIMESTAMP('2019-10-31 15:28:30','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2019-10-31 15:28:30','YYYY-MM-DD HH24:MI:SS'),1000000)
;

-- 31/10/2019 15:28:30 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
INSERT INTO C_Charge_Trl (AD_Language,C_Charge_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.C_Charge_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, C_Charge t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.C_Charge_ID=4000002 AND NOT EXISTS (SELECT * FROM C_Charge_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Charge_ID=t.C_Charge_ID)
;

-- 31/10/2019 15:28:30 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
INSERT INTO C_Charge_Acct (C_Charge_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,Ch_Expense_Acct,Ch_Revenue_Acct) SELECT 4000002, p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.Ch_Expense_Acct,p.Ch_Revenue_Acct FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=1000000 AND NOT EXISTS (SELECT * FROM C_Charge_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID AND e.C_Charge_ID=4000002)
;

-- 31/10/2019 15:30:09 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,Created,Updated,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,IsActive) VALUES (3000053,'LAR','C','4000002','Ingresar el ID del cargo a utilizar, en Nota de Crédito Automatica en Recibos con descuentos.','LAR_CargoNCAutomatica_Recibo',TO_TIMESTAMP('2019-10-31 15:30:08','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-10-31 15:30:08','YYYY-MM-DD HH24:MI:SS'),1000000,0,100,100,'Y')
;

-- 31/10/2019 15:36:59 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,Created,Updated,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,IsActive) VALUES (3000054,'LAR','C','A','Ingresar la letra G, si se desea generar la Nota de Crédito automática. Ingresar P, si ademas de generar la NC, se desea procesarla. Ingresar A, para generar la NC, procesarla y asignarla a la factura con descuento. Para desactivar ingrese, D. ','LAR_GenerarNC_EnRecibos',TO_TIMESTAMP('2019-10-31 15:36:59','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-10-31 15:36:59','YYYY-MM-DD HH24:MI:SS'),1000000,0,100,100,'Y')
;

-- 31/10/2019 18:03:30 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2019-10-31 18:03:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000321
;

-- 31/10/2019 18:04:02 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2019-10-31 18:04:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000813
;

ALTER TABLE LAR_PaymentHeader ADD COLUMN LAR_NotaCredito_ID numeric(10,0);
ALTER TABLE LAR_PaymentHeader ADD CONSTRAINT notacredito_payheader FOREIGN KEY (LAR_NotaCredito_ID)
      REFERENCES C_Invoice (C_Invoice_ID) MATCH SIMPLE;

-- 31/10/2019 18:25:49 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001047,'lar_notacredito_id','LAR','lar_notacredito_id','lar_notacredito_id',0,TO_TIMESTAMP('2019-10-31 18:25:49','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-10-31 18:25:49','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 31/10/2019 18:25:49 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, PO_Description,Help,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.PO_Description,t.Help,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001047 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 31/10/2019 18:25:50 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,IsMandatory,Version,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003532,3000010,'LAR','N',0,'N','N','N',10,'N',19,'N',3001047,'N','Y','N','lar_notacredito_id','lar_notacredito_id',TO_TIMESTAMP('2019-10-31 18:25:49','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2019-10-31 18:25:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2019 18:25:50 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003532 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 31/10/2019 18:26:59 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000113,'T','LAR','N','Nota de Crédito',0,0,100,TO_TIMESTAMP('2019-10-31 18:26:59','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2019-10-31 18:26:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 31/10/2019 18:26:59 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000113 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 31/10/2019 18:28:10 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
INSERT INTO AD_Ref_Table (IsValueDisplayed,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Updated,Created,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N',318,3000113,3484,3492,'LAR',100,TO_TIMESTAMP('2019-10-31 18:28:10','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-10-31 18:28:10','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 31/10/2019 18:28:30 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
UPDATE AD_Column SET AD_Reference_Value_ID=3000113, AD_Reference_ID=18, Name='Nota de Crédito', ColumnName='LAR_NotaCredito_ID',Updated=TO_TIMESTAMP('2019-10-31 18:28:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003532
;

-- 31/10/2019 18:28:30 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003532
;

-- 31/10/2019 18:28:30 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
UPDATE AD_Field SET Name='Nota de Crédito', Description=NULL, Help=NULL WHERE AD_Column_ID=3003532 AND IsCentrallyMaintained='Y'
;

-- 31/10/2019 18:29:00 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
UPDATE AD_Column_Trl SET Name='Nota de Crédito',Updated=TO_TIMESTAMP('2019-10-31 18:29:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003532 AND AD_Language='es_AR'
;

-- 31/10/2019 18:29:30 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
UPDATE AD_Element SET ColumnName='LAR_NotaCredito_ID', Name='Nota de Crédito', PrintName='Nota de Crédito',Updated=TO_TIMESTAMP('2019-10-31 18:29:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001047
;

-- 31/10/2019 18:29:30 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001047
;

-- 31/10/2019 18:29:30 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
UPDATE AD_Column SET ColumnName='LAR_NotaCredito_ID', Name='Nota de Crédito', Description=NULL, Help=NULL WHERE AD_Element_ID=3001047
;

-- 31/10/2019 18:29:30 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
UPDATE AD_Process_Para SET ColumnName='LAR_NotaCredito_ID', Name='Nota de Crédito', Description=NULL, Help=NULL, AD_Element_ID=3001047 WHERE UPPER(ColumnName)='LAR_NOTACREDITO_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 31/10/2019 18:29:30 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
UPDATE AD_Process_Para SET ColumnName='LAR_NotaCredito_ID', Name='Nota de Crédito', Description=NULL, Help=NULL WHERE AD_Element_ID=3001047 AND IsCentrallyMaintained='Y'
;

-- 31/10/2019 18:29:30 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
UPDATE AD_Field SET Name='Nota de Crédito', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001047) AND IsCentrallyMaintained='Y'
;

-- 31/10/2019 18:29:30 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
UPDATE AD_PrintFormatItem SET PrintName='Nota de Crédito', Name='Nota de Crédito' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001047)
;

-- 31/10/2019 18:29:35 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
UPDATE AD_Element_Trl SET Name='Nota de Crédito',PrintName='Nota de Crédito',Updated=TO_TIMESTAMP('2019-10-31 18:29:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001047 AND AD_Language='es_AR'
;

-- Registración de script
SELECT register_migration_script_lar('0142_ISSUE-126.sql', 'LAR', '')
;
