ALTER TABLE C_Payment ADD COLUMN NroCuotas numeric(2,0);

ALTER TABLE LAR_Tarjeta_Credito ADD COLUMN EsChequeEmitido character(1) NOT NULL DEFAULT 'N'::bpchar;
ALTER TABLE LAR_Tarjeta_Credito ADD CONSTRAINT lar_tarjeta_credito_eschequeemitido_check CHECK (eschequeemitido = ANY (ARRAY['Y'::bpchar, 'N'::bpchar]));

ALTER TABLE LAR_TenderType_BankAccount ADD COLUMN LAR_Cheque_Emitido_ID numeric(10,0);
ALTER TABLE LAR_TenderType_BankAccount ADD CONSTRAINT lartendertypebankaccount_larchequeemitido_fkey FOREIGN KEY (LAR_Cheque_Emitido_ID)
      REFERENCES LAR_Tarjeta_Credito (LAR_Tarjeta_Credito_ID) MATCH SIMPLE;

ALTER TABLE C_Payment ADD COLUMN LAR_Cheque_Emitido_ID numeric(10,0);
ALTER TABLE C_Payment ADD CONSTRAINT cpayment_larchequeemitido_fkey FOREIGN KEY (LAR_Cheque_Emitido_ID)
      REFERENCES LAR_Tarjeta_Credito (LAR_Tarjeta_Credito_ID) MATCH SIMPLE;

-- 27/06/2017 18:14:20 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000447,'nrocuotas','LAR','nrocuotas','nrocuotas',0,TO_TIMESTAMP('2017-06-27 18:14:20','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2017-06-27 18:14:20','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 27/06/2017 18:14:20 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000447 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/06/2017 18:14:21 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002077,335,'LAR',0,'N','N','N','N',2,'N',22,'N',3000447,'N','Y','N','nrocuotas','nrocuotas',100,TO_TIMESTAMP('2017-06-27 18:14:20','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2017-06-27 18:14:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/06/2017 18:14:21 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002077 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/06/2017 18:15:05 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Column SET Name='Nro Cuotas', ColumnName='NroCuotas',Updated=TO_TIMESTAMP('2017-06-27 18:15:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002077
;

-- 27/06/2017 18:15:05 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3002077
;

-- 27/06/2017 18:15:05 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET Name='Nro Cuotas', Description=NULL, Help=NULL WHERE AD_Column_ID=3002077 AND IsCentrallyMaintained='Y'
;

-- 27/06/2017 18:15:16 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Column SET Name='Nro. Cuotas',Updated=TO_TIMESTAMP('2017-06-27 18:15:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002077
;

-- 27/06/2017 18:15:16 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3002077
;

-- 27/06/2017 18:15:16 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET Name='Nro. Cuotas', Description=NULL, Help=NULL WHERE AD_Column_ID=3002077 AND IsCentrallyMaintained='Y'
;

-- 27/06/2017 18:15:21 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Column_Trl SET Name='Nro. Cuotas',Updated=TO_TIMESTAMP('2017-06-27 18:15:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002077 AND AD_Language='es_AR'
;

-- 27/06/2017 18:15:40 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Element SET ColumnName='NroCuotas', Name='Nro. Cuotas', PrintName='Nro. Cuotas',Updated=TO_TIMESTAMP('2017-06-27 18:15:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000447
;

-- 27/06/2017 18:15:40 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000447
;

-- 27/06/2017 18:15:40 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Column SET ColumnName='NroCuotas', Name='Nro. Cuotas', Description=NULL, Help=NULL WHERE AD_Element_ID=3000447
;

-- 27/06/2017 18:15:40 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Process_Para SET ColumnName='NroCuotas', Name='Nro. Cuotas', Description=NULL, Help=NULL, AD_Element_ID=3000447 WHERE UPPER(ColumnName)='NROCUOTAS' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 27/06/2017 18:15:40 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Process_Para SET ColumnName='NroCuotas', Name='Nro. Cuotas', Description=NULL, Help=NULL WHERE AD_Element_ID=3000447 AND IsCentrallyMaintained='Y'
;

-- 27/06/2017 18:15:40 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET Name='Nro. Cuotas', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000447) AND IsCentrallyMaintained='Y'
;

-- 27/06/2017 18:15:40 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_PrintFormatItem SET PrintName='Nro. Cuotas', Name='Nro. Cuotas' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000447)
;

-- 27/06/2017 18:15:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Element_Trl SET Name='Nro. Cuotas',PrintName='Nro. Cuotas',Updated=TO_TIMESTAMP('2017-06-27 18:15:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000447 AND AD_Language='es_AR'
;

-- 27/06/2017 18:17:16 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Column SET AD_Reference_ID=17,Updated=TO_TIMESTAMP('2017-06-27 18:17:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002077
;

-- 27/06/2017 18:17:59 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000059,'L','LAR','N','Nro Cuotas',0,0,100,TO_TIMESTAMP('2017-06-27 18:17:59','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2017-06-27 18:17:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/06/2017 18:17:59 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000059 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 27/06/2017 18:18:32 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000119,3000059,'LAR','1','1',TO_TIMESTAMP('2017-06-27 18:18:31','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-06-27 18:18:31','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:18:32 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000119 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:18:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000120,3000059,'LAR','2','2',TO_TIMESTAMP('2017-06-27 18:18:46','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-06-27 18:18:46','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:18:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000120 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:19:04 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000121,3000059,'LAR','3','3',TO_TIMESTAMP('2017-06-27 18:19:04','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-06-27 18:19:04','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:19:04 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000121 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:19:14 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000122,3000059,'LAR','4','4',TO_TIMESTAMP('2017-06-27 18:19:14','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-06-27 18:19:14','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:19:14 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000122 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:19:22 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000123,3000059,'LAR','5','5',TO_TIMESTAMP('2017-06-27 18:19:22','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-06-27 18:19:22','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:19:22 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000123 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:19:31 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000124,3000059,'LAR','6','6',TO_TIMESTAMP('2017-06-27 18:19:31','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-06-27 18:19:31','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:19:31 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000124 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:19:41 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000125,3000059,'LAR','7','7',TO_TIMESTAMP('2017-06-27 18:19:40','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-06-27 18:19:40','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:19:41 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000125 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:19:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000126,3000059,'LAR','8','8',TO_TIMESTAMP('2017-06-27 18:19:48','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-06-27 18:19:48','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:19:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000126 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:19:56 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000127,3000059,'LAR','9','9',TO_TIMESTAMP('2017-06-27 18:19:56','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-06-27 18:19:56','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:19:56 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000127 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:20:07 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000128,3000059,'LAR','10','10',TO_TIMESTAMP('2017-06-27 18:20:07','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-06-27 18:20:07','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:20:07 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000128 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:20:16 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000129,3000059,'LAR','11','11',TO_TIMESTAMP('2017-06-27 18:20:15','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-06-27 18:20:15','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:20:16 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000129 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:20:32 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000130,3000059,'LAR','12','12',TO_TIMESTAMP('2017-06-27 18:20:32','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-06-27 18:20:32','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:20:32 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000130 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:20:44 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000131,3000059,'LAR','13','13',TO_TIMESTAMP('2017-06-27 18:20:44','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-06-27 18:20:44','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:20:44 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000131 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:20:58 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000132,3000059,'LAR','14','14',TO_TIMESTAMP('2017-06-27 18:20:58','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-06-27 18:20:58','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:20:58 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000132 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:21:06 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000133,3000059,'LAR','15','15',TO_TIMESTAMP('2017-06-27 18:21:05','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-06-27 18:21:05','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:21:06 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000133 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:21:30 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000134,3000059,'LAR','16','16',TO_TIMESTAMP('2017-06-27 18:21:30','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-06-27 18:21:30','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:21:30 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000134 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:21:42 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000135,3000059,'LAR','17','17',TO_TIMESTAMP('2017-06-27 18:21:42','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-06-27 18:21:42','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:21:42 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000135 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:21:59 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List (AD_Ref_List_ID,AD_Reference_ID,EntityType,Value,Name,Updated,CreatedBy,Created,UpdatedBy,AD_Org_ID,IsActive,AD_Client_ID) VALUES (3000136,3000059,'LAR','18','18',TO_TIMESTAMP('2017-06-27 18:21:59','YYYY-MM-DD HH24:MI:SS'),100,TO_TIMESTAMP('2017-06-27 18:21:59','YYYY-MM-DD HH24:MI:SS'),100,0,'Y',0)
;

-- 27/06/2017 18:21:59 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=3000136 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- 27/06/2017 18:22:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Column SET AD_Reference_Value_ID=3000059,Updated=TO_TIMESTAMP('2017-06-27 18:22:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002077
;

-- 27/06/2017 18:30:13 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('AD_Ref_List.Value <= (SELECT LAR_Plan_Pago.Cuota_Final FROM LAR_Plan_Pago WHERE LAR_Plan_Pago.LAR_Plan_Pago_ID=@LAR_Plan_Pago_ID@)','S',3000047,'LAR','Nro Cuotas',100,100,TO_TIMESTAMP('2017-06-27 18:30:13','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_TIMESTAMP('2017-06-27 18:30:13','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/06/2017 18:31:29 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Val_Rule SET Code='AD_Ref_List.Value <= (SELECT LAR_Plan_Pago.Cuota_Final FROM LAR_Plan_Pago WHERE LAR_Plan_Pago.LAR_Plan_Pago_ID=@LAR_Plan_Pago_ID@) AND
AD_Ref_List.Value >= (SELECT LAR_Plan_Pago.Cuota_Inicial FROM LAR_Plan_Pago WHERE LAR_Plan_Pago.LAR_Plan_Pago_ID=@LAR_Plan_Pago_ID@)',Updated=TO_TIMESTAMP('2017-06-27 18:31:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000047
;

-- 27/06/2017 18:32:01 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Column SET AD_Val_Rule_ID=3000047,Updated=TO_TIMESTAMP('2017-06-27 18:32:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002077
;

-- 27/06/2017 19:16:49 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003293,2,'Y','N','N',3002077,'N','Y',3000013,'N','LAR','Nro. Cuotas',100,0,TO_TIMESTAMP('2017-06-27 19:16:49','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2017-06-27 19:16:49','YYYY-MM-DD HH24:MI:SS'))
;

-- 27/06/2017 19:16:49 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003293 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3003293
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3003009
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000336
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000337
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000338
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000339
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000340
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000341
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000342
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000343
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000344
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000345
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000346
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000347
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000348
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000349
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000350
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000351
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000352
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000353
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000354
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000355
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000357
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000358
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000359
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000360
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000363
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000302
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000364
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3000362
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=3000289
;

-- 27/06/2017 19:18:46 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=690,IsDisplayed='Y' WHERE AD_Field_ID=3000366
;

-- 28/06/2017 18:13:23 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3003293
;

-- 28/06/2017 18:13:23 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000329
;

-- 28/06/2017 18:13:23 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000330
;

-- 28/06/2017 18:13:23 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000331
;

-- 28/06/2017 18:13:23 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000332
;

-- 28/06/2017 18:13:23 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000335
;

-- 28/06/2017 18:13:23 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000356
;

-- 28/06/2017 18:13:50 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2017-06-28 18:13:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003293
;

-- 28/06/2017 18:16:52 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003303,2,'Y','N','N',3002077,'N','Y',3000024,'N','LAR','Nro. Cuotas',100,0,TO_TIMESTAMP('2017-06-28 18:16:52','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2017-06-28 18:16:52','YYYY-MM-DD HH24:MI:SS'))
;

-- 28/06/2017 18:16:53 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003303 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;
-- 28/06/2017 18:23:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3003303
;

-- 28/06/2017 18:23:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000819
;

-- 28/06/2017 18:23:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000820
;

-- 28/06/2017 18:23:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000821
;

-- 28/06/2017 18:23:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000822
;

-- 28/06/2017 18:23:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000825
;

-- 28/06/2017 18:23:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000846
;

-- 28/06/2017 18:23:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000826
;

-- 28/06/2017 18:23:47 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000827
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000828
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3003010
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000829
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000830
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000831
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000832
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000833
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000834
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000835
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000836
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000837
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000838
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000839
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000840
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000841
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000842
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000843
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000844
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000845
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000847
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000848
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000849
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000850
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000851
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000852
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000857
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000855
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000856
;

-- 28/06/2017 18:23:48 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000858
;

-- 28/06/2017 18:24:12 ART
-- ISSUE #80: Nro de Cuotas en Recibos.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2017-06-28 18:24:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003303
;

-- 29/06/2017 16:58:28 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000456,'eschequeemitido','LAR','eschequeemitido','eschequeemitido',0,TO_TIMESTAMP('2017-06-29 16:58:28','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2017-06-29 16:58:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 29/06/2017 16:58:28 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000456 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 29/06/2017 16:58:28 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002108,3000031,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000456,'N','Y','N','eschequeemitido','eschequeemitido',100,TO_TIMESTAMP('2017-06-29 16:58:28','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2017-06-29 16:58:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/06/2017 16:58:28 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002108 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 29/06/2017 16:59:09 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Column SET Name='Es Cheque Emitido', ColumnName='EsChequeEmitido',Updated=TO_TIMESTAMP('2017-06-29 16:59:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002108
;

-- 29/06/2017 16:59:09 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3002108
;

-- 29/06/2017 16:59:09 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET Name='Es Cheque Emitido', Description=NULL, Help=NULL WHERE AD_Column_ID=3002108 AND IsCentrallyMaintained='Y'
;

-- 29/06/2017 16:59:19 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Column_Trl SET Name='Es Cheque Emitido',Updated=TO_TIMESTAMP('2017-06-29 16:59:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002108 AND AD_Language='es_AR'
;

-- 29/06/2017 16:59:44 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Element SET ColumnName='EsChequeEmitido', Name='Es Cheque Emitido', PrintName='Es Cheque Emitido',Updated=TO_TIMESTAMP('2017-06-29 16:59:44','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000456
;

-- 29/06/2017 16:59:44 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000456
;

-- 29/06/2017 16:59:44 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Column SET ColumnName='EsChequeEmitido', Name='Es Cheque Emitido', Description=NULL, Help=NULL WHERE AD_Element_ID=3000456
;

-- 29/06/2017 16:59:44 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Process_Para SET ColumnName='EsChequeEmitido', Name='Es Cheque Emitido', Description=NULL, Help=NULL, AD_Element_ID=3000456 WHERE UPPER(ColumnName)='ESCHEQUEEMITIDO' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 29/06/2017 16:59:44 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Process_Para SET ColumnName='EsChequeEmitido', Name='Es Cheque Emitido', Description=NULL, Help=NULL WHERE AD_Element_ID=3000456 AND IsCentrallyMaintained='Y'
;

-- 29/06/2017 16:59:44 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET Name='Es Cheque Emitido', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000456) AND IsCentrallyMaintained='Y'
;

-- 29/06/2017 16:59:44 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_PrintFormatItem SET PrintName='Es Cheque Emitido', Name='Es Cheque Emitido' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000456)
;

-- 29/06/2017 16:59:57 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Element_Trl SET Name='Es Cheque Emitido',PrintName='Es Cheque Emitido',Updated=TO_TIMESTAMP('2017-06-29 16:59:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000456 AND AD_Language='es_AR'
;

-- 29/06/2017 17:01:36 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003310,1,'Y','N','N',3002108,'N','Y',3000052,'N','LAR','Es Cheque Emitido',100,0,TO_TIMESTAMP('2017-06-29 17:01:36','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2017-06-29 17:01:36','YYYY-MM-DD HH24:MI:SS'))
;

-- 29/06/2017 17:01:36 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003310 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 29/06/2017 17:01:45 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3003310
;

-- 29/06/2017 17:01:45 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3001860
;

-- 29/06/2017 17:02:01 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2017-06-29 17:02:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003310
;

-- 29/06/2017 17:03:12 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET DisplayLogic='@EsDeposito@=N & @EsChequeEmitido@=N',Updated=TO_TIMESTAMP('2017-06-29 17:03:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3001957
;

-- 29/06/2017 17:09:34 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000457,'lar_cheque_emitido_id','LAR','lar_cheque_emitido_id','lar_cheque_emitido_id',0,TO_TIMESTAMP('2017-06-29 17:09:33','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2017-06-29 17:09:33','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 29/06/2017 17:09:34 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000457 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 29/06/2017 17:09:34 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002109,335,'LAR',0,'N','N','N','N',10,'N',19,'N',3000457,'N','Y','N','lar_cheque_emitido_id','lar_cheque_emitido_id',100,TO_TIMESTAMP('2017-06-29 17:09:33','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2017-06-29 17:09:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/06/2017 17:09:34 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002109 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 29/06/2017 17:10:47 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Column SET Name='Tipo de Cheque Emitido', ColumnName='LAR_Cheque_Emitido_ID',Updated=TO_TIMESTAMP('2017-06-29 17:10:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002109
;

-- 29/06/2017 17:10:47 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3002109
;

-- 29/06/2017 17:10:47 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET Name='Tipo de Cheque Emitido', Description=NULL, Help=NULL WHERE AD_Column_ID=3002109 AND IsCentrallyMaintained='Y'
;

-- 29/06/2017 17:11:05 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Column_Trl SET Name='Tipo de Cheque Emitido',Updated=TO_TIMESTAMP('2017-06-29 17:11:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002109 AND AD_Language='es_AR'
;

-- 29/06/2017 17:11:30 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Element SET ColumnName='LAR_Cheque_Emitido_ID', Name='Tipo de Cheque Emitido', PrintName='Tipo de Cheque Emitido',Updated=TO_TIMESTAMP('2017-06-29 17:11:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000457
;

-- 29/06/2017 17:11:30 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000457
;

-- 29/06/2017 17:11:30 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Column SET ColumnName='LAR_Cheque_Emitido_ID', Name='Tipo de Cheque Emitido', Description=NULL, Help=NULL WHERE AD_Element_ID=3000457
;

-- 29/06/2017 17:11:30 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Process_Para SET ColumnName='LAR_Cheque_Emitido_ID', Name='Tipo de Cheque Emitido', Description=NULL, Help=NULL, AD_Element_ID=3000457 WHERE UPPER(ColumnName)='LAR_CHEQUE_EMITIDO_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 29/06/2017 17:11:30 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Process_Para SET ColumnName='LAR_Cheque_Emitido_ID', Name='Tipo de Cheque Emitido', Description=NULL, Help=NULL WHERE AD_Element_ID=3000457 AND IsCentrallyMaintained='Y'
;

-- 29/06/2017 17:11:30 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET Name='Tipo de Cheque Emitido', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000457) AND IsCentrallyMaintained='Y'
;

-- 29/06/2017 17:11:30 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_PrintFormatItem SET PrintName='Tipo de Cheque Emitido', Name='Tipo de Cheque Emitido' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000457)
;

-- 29/06/2017 17:11:39 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Element_Trl SET Name='Tipo de Cheque Emitido',PrintName='Tipo de Cheque Emitido',Updated=TO_TIMESTAMP('2017-06-29 17:11:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000457 AND AD_Language='es_AR'
;

-- 29/06/2017 17:14:42 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Reference (AD_Reference_ID,ValidationType,EntityType,IsOrderByValue,Name,AD_Client_ID,AD_Org_ID,CreatedBy,Updated,IsActive,Created,UpdatedBy) VALUES (3000062,'T','LAR','N','Tipos de Cheques Emitidos',0,0,100,TO_TIMESTAMP('2017-06-29 17:14:42','YYYY-MM-DD HH24:MI:SS'),'Y',TO_TIMESTAMP('2017-06-29 17:14:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/06/2017 17:14:42 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Help,Name,Description, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Help,t.Name,t.Description, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=3000062 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- 29/06/2017 17:15:30 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Ref_Table (IsValueDisplayed,AD_Table_ID,AD_Reference_ID,AD_Key,AD_Display,EntityType,CreatedBy,Updated,Created,AD_Client_ID,UpdatedBy,AD_Org_ID,IsActive) VALUES ('N',3000031,3000062,3001045,3001053,'LAR',100,TO_TIMESTAMP('2017-06-29 17:15:30','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2017-06-29 17:15:30','YYYY-MM-DD HH24:MI:SS'),0,100,0,'Y')
;

-- 29/06/2017 17:17:20 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Ref_Table SET WhereClause='LAR_Tarjeta_Credito.EsChequeEmitido=''Y''',Updated=TO_TIMESTAMP('2017-06-29 17:17:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Reference_ID=3000062
;

-- 29/06/2017 17:17:49 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Column SET AD_Reference_Value_ID=3000062, AD_Reference_ID=18,Updated=TO_TIMESTAMP('2017-06-29 17:17:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002109
;

-- 29/06/2017 17:18:43 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003311,29,'Y','N','N',3001958,'N','Y',3000016,'N','LAR','Fecha de Venc. Cheque',100,0,TO_TIMESTAMP('2017-06-29 17:18:43','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2017-06-29 17:18:43','YYYY-MM-DD HH24:MI:SS'))
;

-- 29/06/2017 17:18:43 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003311 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 29/06/2017 17:18:43 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003312,2,'Y','N','N',3002077,'N','Y',3000016,'N','LAR','Nro. Cuotas',100,0,TO_TIMESTAMP('2017-06-29 17:18:43','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2017-06-29 17:18:43','YYYY-MM-DD HH24:MI:SS'))
;

-- 29/06/2017 17:18:43 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003312 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 29/06/2017 17:18:44 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003313,10,'Y','N','N',3002109,'N','Y',3000016,'N','LAR','Tipo de Cheque Emitido',100,0,TO_TIMESTAMP('2017-06-29 17:18:43','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2017-06-29 17:18:43','YYYY-MM-DD HH24:MI:SS'))
;

-- 29/06/2017 17:18:44 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003313 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3003312
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=60,IsDisplayed='Y' WHERE AD_Field_ID=3000485
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3000412
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3000432
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000433
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000434
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3002763
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000436
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000437
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000438
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000439
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000440
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000435
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000441
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000442
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000443
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000444
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000445
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000450
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000452
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000453
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000454
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3002020
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3003313
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000458
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000459
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000460
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000461
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000462
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000463
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000464
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000465
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000466
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000467
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000468
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000469
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000470
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000471
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000472
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000473
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000474
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000475
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000476
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000477
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000478
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000479
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000480
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000481
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000482
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000483
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000484
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000492
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000490
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000489
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000491
;

-- 29/06/2017 17:22:25 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3003311
;

-- 29/06/2017 17:25:58 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000455
;

-- 29/06/2017 17:25:58 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3003311
;

-- 29/06/2017 17:27:27 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3003313
;

-- 29/06/2017 17:27:27 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000452
;

-- 29/06/2017 17:27:27 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000453
;

-- 29/06/2017 17:27:27 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000454
;

-- 29/06/2017 17:27:27 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000455
;

-- 29/06/2017 17:27:27 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3003311
;

-- 29/06/2017 17:27:27 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3002769
;

-- 29/06/2017 17:27:27 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3002770
;

-- 29/06/2017 17:27:27 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3002806
;

-- 04/07/2017 22:09:27 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002110,3000034,'LAR',0,'N','N','N','N',10,'N',19,'N',3000457,'N','Y','N','Tipo de Cheque Emitido','LAR_Cheque_Emitido_ID',100,TO_TIMESTAMP('2017-07-04 22:09:26','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2017-07-04 22:09:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 04/07/2017 22:09:27 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002110 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 04/07/2017 22:11:46 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003314,10,'Y','N','N',3002110,'N','Y',3000055,'N','LAR','Tipo de Cheque Emitido',100,0,TO_TIMESTAMP('2017-07-04 22:11:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2017-07-04 22:11:46','YYYY-MM-DD HH24:MI:SS'))
;

-- 04/07/2017 22:11:46 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003314 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 04/07/2017 22:13:03 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET DisplayLogic='@TenderType@=K',Updated=TO_TIMESTAMP('2017-07-04 22:13:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003314
;

-- 04/07/2017 22:18:29 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Column SET MandatoryLogic='@TenderType@=K',Updated=TO_TIMESTAMP('2017-07-04 22:18:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002109
;

-- 04/07/2017 12:00:47 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET DisplayLogic='@TenderType@=''K''',Updated=TO_TIMESTAMP('2017-07-04 12:00:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003313
;

-- 04/07/2017 12:02:34 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Field SET DisplayLogic='@TenderType@=''K'' | @TenderType@=''Z''',Updated=TO_TIMESTAMP('2017-07-04 12:02:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003311
;

-- 07/07/2017 18:54:32 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Column SET ColumnSQL='((SELECT COALESCE(Sum(sl.TrxAmt),0)  FROM C_BankStatementLine sl  JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''K'',''Z'') AND p.LAR_Cheque_Emitido_ID IS NULL))  + (COALESCE((SELECT SUM(pa.PayAmt)  FROM C_Payment pa  WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsOnDrawer=''Y'' AND pa.IsReceipt=''Y'' AND pa.DocStatus IN (''CO'',''CL'') AND pa.TenderType IN (''K'',''Z'') AND pa.C_Payment_ID NOT IN (SELECT sli.C_Payment_ID  FROM C_BankStatementLine sli  WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)) , 0)) + (COALESCE((SELECT SUM(pa.PayAmt)  FROM C_Payment pa  WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsReceipt=''N'' AND pa.DocStatus IN (''CO'',''CL'') AND pa.TenderType IN (''K'',''Z'') AND pa.IsReconciled=''N'' AND pa.LAR_Cheque_Emitido_ID IS NULL AND pa.LAR_PaymentSource_ID > 0 AND pa.LAR_PaymentSource_ID NOT IN (SELECT sli.C_Payment_ID  FROM C_BankStatementLine sli  WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)) , 0)))',Updated=TO_TIMESTAMP('2017-07-07 18:54:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000149
;

-- 07/07/2017 18:55:14 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Column SET ColumnSQL='(SELECT (C_BankStatement.ScrutinizedCheckAmt  - ((SELECT COALESCE(Sum(sl.TrxAmt),0)        FROM C_BankStatementLine sl        JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID)        WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''K'',''Z'') AND p.LAR_Cheque_Emitido_ID IS NULL))        + (COALESCE((SELECT SUM(pa.PayAmt) FROM C_Payment pa WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsOnDrawer=''Y'' AND pa.IsReceipt=''Y'' AND pa.DocStatus IN (''CO'',''CL'') AND pa.TenderType IN (''K'',''Z'') AND pa.C_Payment_ID NOT IN (SELECT sli.C_Payment_ID FROM C_BankStatementLine sli WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)) , 0))       + (COALESCE((SELECT SUM(pa.PayAmt) FROM C_Payment pa WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsReceipt=''N'' AND pa.DocStatus IN (''CO'',''CL'') AND pa.TenderType IN (''K'',''Z'') AND pa.IsReconciled=''N'' AND pa.LAR_Cheque_Emitido_ID IS NULL AND pa.LAR_PaymentSource_ID > 0 AND pa.LAR_PaymentSource_ID NOT IN (SELECT sli.C_Payment_ID FROM C_BankStatementLine sli WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)) , 0)))))',Updated=TO_TIMESTAMP('2017-07-07 18:55:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000157
;

-- 07/07/2017 18:55:59 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Column SET ColumnSQL='((SELECT (C_BankStatement.ScrutinizedCashAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''X''))  + (SELECT (C_BankStatement.ScrutinizedCheckAmt - ((SELECT COALESCE(Sum(sl.TrxAmt),0)  FROM C_BankStatementLine sl  JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID)  WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''K'',''Z'') AND p.LAR_Cheque_Emitido_ID IS NULL)) 	+ (COALESCE((SELECT SUM(pa.PayAmt)  FROM C_Payment pa  WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsOnDrawer=''Y'' AND pa.IsReceipt=''Y'' AND pa.DocStatus IN (''CO'',''CL'') AND pa.TenderType IN (''K'',''Z'') AND pa.C_Payment_ID NOT IN (SELECT sli.C_Payment_ID  FROM C_BankStatementLine sli  WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)) , 0)) 	+ (COALESCE((SELECT SUM(pa.PayAmt)  FROM C_Payment pa  WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsReceipt=''N'' AND pa.DocStatus IN (''CO'',''CL'') AND pa.TenderType IN (''K'',''Z'') AND pa.IsReconciled=''N'' AND pa.LAR_Cheque_Emitido_ID IS NULL AND pa.LAR_PaymentSource_ID > 0 AND pa.LAR_PaymentSource_ID NOT IN (SELECT sli.C_Payment_ID  FROM C_BankStatementLine sli  WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)) , 0))))) + (SELECT (C_BankStatement.ScrutinizedCreditCardAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''D'', ''C''))) - C_BankStatement.SaldoInicial)',Updated=TO_TIMESTAMP('2017-07-07 18:55:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000161
;

-- 07/07/2017 19:00:31 ART
-- ISSUE #80: Forma de pago "Cheque Emitido".
UPDATE AD_Column SET AD_Reference_Value_ID=3000062, AD_Reference_ID=18,Updated=TO_TIMESTAMP('2017-07-07 19:00:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002110
;

-- Registración de script
SELECT register_migration_script_lar('0091_ISSUE-80.sql', 'LAR', '')
;
