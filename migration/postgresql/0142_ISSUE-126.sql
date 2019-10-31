-- 31/10/2019 15:28:30 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
INSERT INTO C_Charge (IsSameCurrency,IsSameTax,C_TaxCategory_ID,ChargeAmt,C_Charge_ID,IsTaxIncluded,Name,AD_Org_ID,CreatedBy,IsActive,Created,UpdatedBy,Updated,AD_Client_ID) VALUES ('N','N',1000001,0,1000002,'N','Desc. Financiero por Pago',1000000,100,'Y',TO_TIMESTAMP('2019-10-31 15:28:30','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2019-10-31 15:28:30','YYYY-MM-DD HH24:MI:SS'),1000000)
;

-- 31/10/2019 15:28:30 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
INSERT INTO C_Charge_Trl (AD_Language,C_Charge_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.C_Charge_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, C_Charge t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.C_Charge_ID=1000002 AND NOT EXISTS (SELECT * FROM C_Charge_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.C_Charge_ID=t.C_Charge_ID)
;

-- 31/10/2019 15:28:30 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
INSERT INTO C_Charge_Acct (C_Charge_ID, C_AcctSchema_ID, AD_Client_ID,AD_Org_ID,IsActive, Created,CreatedBy,Updated,UpdatedBy ,Ch_Expense_Acct,Ch_Revenue_Acct) SELECT 1000002, p.C_AcctSchema_ID, p.AD_Client_ID,0,'Y', CURRENT_TIMESTAMP,100,CURRENT_TIMESTAMP,100,p.Ch_Expense_Acct,p.Ch_Revenue_Acct FROM C_AcctSchema_Default p WHERE p.AD_Client_ID=1000000 AND NOT EXISTS (SELECT * FROM C_Charge_Acct e WHERE e.C_AcctSchema_ID=p.C_AcctSchema_ID AND e.C_Charge_ID=1000002)
;

-- 31/10/2019 15:30:09 ART
-- ISSUE #126: Generar Nota de Crédito automatica, al completar recibo con descuento.
INSERT INTO AD_SysConfig (AD_SysConfig_ID,EntityType,ConfigurationLevel,Value,Description,Name,Created,Updated,AD_Client_ID,AD_Org_ID,CreatedBy,UpdatedBy,IsActive) VALUES (3000053,'LAR','C','1000002','Ingresar el ID del cargo a utilizar, en Nota de Crédito Automatica en Recibos con descuentos.','LAR_CargoNCAutomatica_Recibo',TO_TIMESTAMP('2019-10-31 15:30:08','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2019-10-31 15:30:08','YYYY-MM-DD HH24:MI:SS'),1000000,0,100,100,'Y')
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

-- Registración de script
SELECT register_migration_script_lar('0142_ISSUE-126.sql', 'LAR', '')
;
