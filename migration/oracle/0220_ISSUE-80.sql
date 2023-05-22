ALTER TABLE C_BankStatement ADD COLUMN ScrutinizedBilleteraDigital numeric NOT NULL DEFAULT 0;

-- 21/05/2023 23:44:03 ART
-- BUG #377: Ajustes de Ventanas y traducciones
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001394,'scrutinizedbilleteradigital','LAR','scrutinizedbilleteradigital','scrutinizedbilleteradigital',0,TO_DATE('2023-05-21 23:44:01','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-05-21 23:44:01','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 21/05/2023 23:44:03 ART
-- BUG #377: Ajustes de Ventanas y traducciones
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, PO_Description,Help,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.PO_Description,t.Help,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001394 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 21/05/2023 23:44:03 ART
-- BUG #377: Ajustes de Ventanas y traducciones
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,IsMandatory,Version,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3005575,392,'LAR','Y',0,'N','N','N',14,'N',22,'N',3001394,'N','Y','N','scrutinizedbilleteradigital','scrutinizedbilleteradigital',TO_DATE('2023-05-21 23:44:01','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2023-05-21 23:44:01','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/05/2023 23:44:03 ART
-- BUG #377: Ajustes de Ventanas y traducciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005575 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 21/05/2023 23:44:40 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Column SET Name='ScrutinizedBilleteraDigital', ColumnName='ScrutinizedBilleteraDigital',Updated=TO_DATE('2023-05-21 23:44:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005575
;

-- 21/05/2023 23:44:40 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3005575
;

-- 21/05/2023 23:44:40 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET Name='ScrutinizedBilleteraDigital', Description=NULL, Help=NULL WHERE AD_Column_ID=3005575 AND IsCentrallyMaintained='Y'
;

-- 21/05/2023 23:45:22 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Column SET Name='Billetera Digital Contabilizado',Updated=TO_DATE('2023-05-21 23:45:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005575
;

-- 21/05/2023 23:45:22 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3005575
;

-- 21/05/2023 23:45:22 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET Name='Billetera Digital Contabilizado', Description=NULL, Help=NULL WHERE AD_Column_ID=3005575 AND IsCentrallyMaintained='Y'
;

-- 21/05/2023 23:45:31 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Column_Trl SET Name='Billetera Digital Contabilizado',Updated=TO_DATE('2023-05-21 23:45:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005575 AND AD_Language='es_AR'
;

-- 21/05/2023 23:45:57 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Element SET ColumnName='ScrutinizedBilleteraDigital', Name='Billetera Digital Contabilizado', PrintName='Billetera Digital Contabilizado',Updated=TO_DATE('2023-05-21 23:45:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001394
;

-- 21/05/2023 23:45:57 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001394
;

-- 21/05/2023 23:45:57 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Column SET ColumnName='ScrutinizedBilleteraDigital', Name='Billetera Digital Contabilizado', Description=NULL, Help=NULL WHERE AD_Element_ID=3001394
;

-- 21/05/2023 23:45:57 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Process_Para SET ColumnName='ScrutinizedBilleteraDigital', Name='Billetera Digital Contabilizado', Description=NULL, Help=NULL, AD_Element_ID=3001394 WHERE UPPER(ColumnName)='SCRUTINIZEDBILLETERADIGITAL' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 21/05/2023 23:45:57 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Process_Para SET ColumnName='ScrutinizedBilleteraDigital', Name='Billetera Digital Contabilizado', Description=NULL, Help=NULL WHERE AD_Element_ID=3001394 AND IsCentrallyMaintained='Y'
;

-- 21/05/2023 23:45:57 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET Name='Billetera Digital Contabilizado', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001394) AND IsCentrallyMaintained='Y'
;

-- 21/05/2023 23:45:57 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_PrintFormatItem pi SET PrintName='Billetera Digital Contabilizado', Name='Billetera Digital Contabilizado' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3001394)
;

-- 21/05/2023 23:46:05 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Element_Trl SET Name='Billetera Digital Contabilizado',PrintName='Billetera Digital Contabilizado',Updated=TO_DATE('2023-05-21 23:46:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001394 AND AD_Language='es_AR'
;

-- 21/05/2023 23:46:25 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Column SET AD_Reference_ID=12,Updated=TO_DATE('2023-05-21 23:46:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3005575
;

-- 21/05/2023 23:50:05 ART
-- BUG #377: Ajustes de Ventanas y traducciones
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001395,'BilleteraDigitalDifference','LAR','Diferencia Billetera Digital','Diferencia Billetera Digital',0,TO_DATE('2023-05-21 23:50:04','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023-05-21 23:50:04','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 21/05/2023 23:50:05 ART
-- BUG #377: Ajustes de Ventanas y traducciones
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, PO_Description,Help,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.PO_Description,t.Help,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001395 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 21/05/2023 23:50:49 ART
-- BUG #377: Ajustes de Ventanas y traducciones
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,IsMandatory,Version,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT (C_BankStatement.ScrutinizedBilleteraDigital - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''Q''))',3005576,392,'LAR','N',0,'N','N',0,'N',22,'N',12,'N','N',3001395,'N','Y','N','N','N','Diferencia Billetera Digital','BilleteraDigitalDifference','N',TO_DATE('2023-05-21 23:50:49','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_DATE('2023-05-21 23:50:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 21/05/2023 23:50:49 ART
-- BUG #377: Ajustes de Ventanas y traducciones
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3005576 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 22/05/2023 0:01:01 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Column SET ColumnSQL='((SELECT (C_BankStatement.ScrutinizedCashAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''X'')) + (SELECT (C_BankStatement.ScrutinizedCheckAmt - ((SELECT COALESCE(Sum(sl.TrxAmt),0) FROM C_BankStatementLine sl  JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''K'',''Z'') AND p.LAR_Cheque_Emitido_ID IS NULL AND p.EsElectronico = ''N'')) + (COALESCE((SELECT SUM(pa.PayAmt)  FROM C_Payment pa WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsOnDrawer=''Y'' AND pa.IsReceipt=''Y'' AND pa.DocStatus IN (''CO'',''CL'') AND pa.TenderType IN (''K'',''Z'') AND pa.EsElectronico = ''N'' AND pa.C_Payment_ID NOT IN (SELECT sli.C_Payment_ID  FROM C_BankStatementLine sli  WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)) , 0)) + (COALESCE((SELECT SUM(pa.PayAmt) FROM C_Payment pa WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsReceipt=''N'' AND pa.DocStatus IN (''CO'',''CL'') AND pa.TenderType IN (''K'',''Z'') AND pa.EsElectronico = ''N'' AND pa.IsReconciled=''N'' AND pa.LAR_Cheque_Emitido_ID IS NULL AND pa.LAR_PaymentSource_ID > 0 AND pa.LAR_PaymentSource_ID NOT IN (SELECT sli.C_Payment_ID  FROM C_BankStatementLine sli  WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)) , 0))))) + (SELECT (C_BankStatement.ScrutinizedCreditCardAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''D'', ''C''))) + (SELECT COALESCE(Sum(TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''Q'')) - C_BankStatement.SaldoInicial)',Updated=TO_DATE('2023-05-22 00:01:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000161
;

-- 22/05/2023 0:01:58 ART
-- BUG #377: Ajustes de Ventanas y traducciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,AD_Tab_ID,IsCentrallyMaintained,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008596,14,'Y','N','N',3005575,'N',3000007,'Y','N','LAR','Billetera Digital Contabilizado',100,0,'Y',TO_DATE('2023-05-22 00:01:57','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2023-05-22 00:01:57','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/05/2023 0:01:58 ART
-- BUG #377: Ajustes de Ventanas y traducciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008596 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/05/2023 0:01:58 ART
-- BUG #377: Ajustes de Ventanas y traducciones
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,AD_Tab_ID,IsCentrallyMaintained,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3008597,22,'Y','N','N',3005576,'N',3000007,'Y','N','LAR','Diferencia Billetera Digital',100,0,'Y',TO_DATE('2023-05-22 00:01:58','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2023-05-22 00:01:58','YYYY-MM-DD HH24:MI:SS'))
;

-- 22/05/2023 0:01:58 ART
-- BUG #377: Ajustes de Ventanas y traducciones
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3008597 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 22/05/2023 0:02:21 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3008596
;

-- 22/05/2023 0:02:21 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3008597
;

-- 22/05/2023 0:02:21 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000167
;

-- 22/05/2023 0:02:21 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000168
;

-- 22/05/2023 0:02:21 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000169
;

-- 22/05/2023 0:02:21 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3002686
;

-- 22/05/2023 0:02:21 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000170
;

-- 22/05/2023 0:02:41 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2023-05-22 00:02:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008596
;

-- 22/05/2023 0:02:47 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2023-05-22 00:02:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3008597
;

-- 22/05/2023 0:08:14 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Column SET ColumnSQL='((SELECT (C_BankStatement.ScrutinizedCashAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''X'')) + (SELECT (C_BankStatement.ScrutinizedCheckAmt - ((SELECT COALESCE(Sum(sl.TrxAmt),0) FROM C_BankStatementLine sl  JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''K'',''Z'') AND p.LAR_Cheque_Emitido_ID IS NULL AND p.EsElectronico = ''N'')) + (COALESCE((SELECT SUM(pa.PayAmt)  FROM C_Payment pa WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsOnDrawer=''Y'' AND pa.IsReceipt=''Y'' AND pa.DocStatus IN (''CO'',''CL'') AND pa.TenderType IN (''K'',''Z'') AND pa.EsElectronico = ''N'' AND pa.C_Payment_ID NOT IN (SELECT sli.C_Payment_ID  FROM C_BankStatementLine sli  WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)) , 0)) + (COALESCE((SELECT SUM(pa.PayAmt) FROM C_Payment pa WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsReceipt=''N'' AND pa.DocStatus IN (''CO'',''CL'') AND pa.TenderType IN (''K'',''Z'') AND pa.EsElectronico = ''N'' AND pa.IsReconciled=''N'' AND pa.LAR_Cheque_Emitido_ID IS NULL AND pa.LAR_PaymentSource_ID > 0 AND pa.LAR_PaymentSource_ID NOT IN (SELECT sli.C_Payment_ID  FROM C_BankStatementLine sli  WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)) , 0))))) + (SELECT (C_BankStatement.ScrutinizedCreditCardAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''D'', ''C'')) + (SELECT COALESCE(Sum(TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''Q''))) - C_BankStatement.SaldoInicial)',Updated=TO_DATE('2023-05-22 00:08:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000161
;

-- 22/05/2023 0:12:09 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Column SET ColumnSQL='((SELECT (C_BankStatement.ScrutinizedCashAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''X'')) + (SELECT (C_BankStatement.ScrutinizedCheckAmt - ((SELECT COALESCE(Sum(sl.TrxAmt),0) FROM C_BankStatementLine sl  JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''K'',''Z'') AND p.LAR_Cheque_Emitido_ID IS NULL AND p.EsElectronico = ''N'')) + (COALESCE((SELECT SUM(pa.PayAmt)  FROM C_Payment pa WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsOnDrawer=''Y'' AND pa.IsReceipt=''Y'' AND pa.DocStatus IN (''CO'',''CL'') AND pa.TenderType IN (''K'',''Z'') AND pa.EsElectronico = ''N'' AND pa.C_Payment_ID NOT IN (SELECT sli.C_Payment_ID  FROM C_BankStatementLine sli  WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)) , 0)) + (COALESCE((SELECT SUM(pa.PayAmt) FROM C_Payment pa WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsReceipt=''N'' AND pa.DocStatus IN (''CO'',''CL'') AND pa.TenderType IN (''K'',''Z'') AND pa.EsElectronico = ''N'' AND pa.IsReconciled=''N'' AND pa.LAR_Cheque_Emitido_ID IS NULL AND pa.LAR_PaymentSource_ID > 0 AND pa.LAR_PaymentSource_ID NOT IN (SELECT sli.C_Payment_ID  FROM C_BankStatementLine sli  WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)) , 0))))) + (SELECT (C_BankStatement.ScrutinizedCreditCardAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''D'', ''C''))) + (SELECT COALESCE(Sum(TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''Q'')) - C_BankStatement.SaldoInicial)',Updated=TO_DATE('2023-05-22 00:12:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000161
;

-- 22/05/2023 1:16:08 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Column SET ColumnSQL='((SELECT(C_BankStatement.ScrutinizedCashAmt-(COALESCE(Sum(TrxAmt),0)))FROM C_BankStatementLine sl JOIN C_Payment p ON(sl.C_Payment_ID=p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID=sl.C_BankStatement_ID AND p.TenderType=''X'')) + (SELECT (C_BankStatement.ScrutinizedCheckAmt - ((SELECT COALESCE(Sum(sl.TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID=p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN(''K'',''Z'') AND p.LAR_Cheque_Emitido_ID IS NULL AND p.EsElectronico=''N'')) + (COALESCE((SELECT SUM(pa.PayAmt) FROM C_Payment pa WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsOnDrawer=''Y'' AND pa.IsReceipt=''Y'' AND pa.DocStatus IN(''CO'',''CL'') AND pa.TenderType IN(''K'',''Z'') AND pa.EsElectronico = ''N'' AND pa.C_Payment_ID NOT IN(SELECT sli.C_Payment_ID FROM C_BankStatementLine sli WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)),0)) + (COALESCE((SELECT SUM(pa.PayAmt) FROM C_Payment pa WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsReceipt=''N'' AND pa.DocStatus IN(''CO'',''CL'') AND pa.TenderType IN(''K'',''Z'') AND pa.EsElectronico=''N'' AND pa.IsReconciled=''N'' AND pa.LAR_Cheque_Emitido_ID IS NULL AND pa.LAR_PaymentSource_ID>0 AND pa.LAR_PaymentSource_ID NOT IN(SELECT sli.C_Payment_ID FROM C_BankStatementLine sli WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)),0))))) + (SELECT(C_BankStatement.ScrutinizedCreditCardAmt -(COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON(sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID=sl.C_BankStatement_ID AND p.TenderType IN(''D'', ''C''))) + (SELECT (C_BankStatement.ScrutinizedBilleteraDigital - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID=sl.C_BankStatement_ID AND p.TenderType=''Q'')) - C_BankStatement.SaldoInicial)',Updated=TO_DATE('2023-05-22 01:16:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000161
;

-- 22/05/2023 1:22:26 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Column SET ColumnSQL='((SELECT(C_BankStatement.ScrutinizedCashAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON(sl.C_Payment_ID=p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID=sl.C_BankStatement_ID AND p.TenderType=''X'')) + (SELECT(C_BankStatement.ScrutinizedCheckAmt - ((SELECT COALESCE(Sum(sl.TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID=p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN(''K'',''Z'') AND p.LAR_Cheque_Emitido_ID IS NULL AND p.EsElectronico=''N'')) + (COALESCE((SELECT SUM(pa.PayAmt) FROM C_Payment pa WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsOnDrawer=''Y'' AND pa.IsReceipt=''Y'' AND pa.DocStatus IN(''CO'',''CL'') AND pa.TenderType IN(''K'',''Z'') AND pa.EsElectronico = ''N'' AND pa.C_Payment_ID NOT IN(SELECT sli.C_Payment_ID FROM C_BankStatementLine sli WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)),0)) + (COALESCE((SELECT SUM(pa.PayAmt) FROM C_Payment pa WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsReceipt=''N'' AND pa.DocStatus IN(''CO'',''CL'') AND pa.TenderType IN(''K'',''Z'') AND pa.EsElectronico=''N'' AND pa.IsReconciled=''N'' AND pa.LAR_Cheque_Emitido_ID IS NULL AND pa.LAR_PaymentSource_ID>0 AND pa.LAR_PaymentSource_ID NOT IN(SELECT sli.C_Payment_ID FROM C_BankStatementLine sli WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)),0))))) + (SELECT(C_BankStatement.ScrutinizedCreditCardAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON(sl.C_Payment_ID=p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID=sl.C_BankStatement_ID AND p.TenderType IN(''D'',''C''))) + (SELECT (C_BankStatement.ScrutinizedBilleteraDigital - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID=p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID=sl.C_BankStatement_ID AND p.TenderType=''Q'')) - C_BankStatement.SaldoInicial)',Updated=TO_DATE('2023-05-22 01:22:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000161
;

-- 22/05/2023 1:37:32 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Column SET ColumnSQL='((SELECT (C_BankStatement.ScrutinizedCashAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID=p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID=sl.C_BankStatement_ID AND p.TenderType=''X'')) + (SELECT (C_BankStatement.ScrutinizedCheckAmt - ((SELECT COALESCE(Sum(sl.TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID=sl.C_BankStatement_ID AND p.TenderType IN (''K'',''Z'') AND p.LAR_Cheque_Emitido_ID IS NULL AND p.EsElectronico=''N'')) + (COALESCE((SELECT SUM(pa.PayAmt) FROM C_Payment pa WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsOnDrawer=''Y'' AND pa.IsReceipt=''Y'' AND pa.DocStatus IN (''CO'',''CL'') AND pa.TenderType IN (''K'',''Z'') AND pa.EsElectronico=''N'' AND pa.C_Payment_ID NOT IN (SELECT sli.C_Payment_ID FROM C_BankStatementLine sli WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)),0)) + (COALESCE((SELECT SUM(pa.PayAmt) FROM C_Payment pa WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsReceipt=''N'' AND pa.DocStatus IN (''CO'',''CL'') AND pa.TenderType IN (''K'',''Z'') AND pa.EsElectronico=''N'' AND pa.IsReconciled=''N'' AND pa.LAR_Cheque_Emitido_ID IS NULL AND pa.LAR_PaymentSource_ID > 0 AND pa.LAR_PaymentSource_ID NOT IN (SELECT sli.C_Payment_ID FROM C_BankStatementLine sli WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)),0))))) + (SELECT (C_BankStatement.ScrutinizedCreditCardAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID=p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID=sl.C_BankStatement_ID AND p.TenderType IN (''D'',''C''))) + (SELECT (C_BankStatement.ScrutinizedBilleteraDigital - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID=p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID=sl.C_BankStatement_ID AND p.TenderType=''Q'')) - C_BankStatement.SaldoInicial)',Updated=TO_DATE('2023-05-22 01:37:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000161
;

-- Registración de script
SELECT register_migration_script_lar('0219_ISSUE-80.sql', 'LAR', '') FROM dual
;
