ALTER TABLE C_BankStatement ADD COLUMN TotalCheques numeric default 0;
ALTER TABLE C_BankStatement ADD COLUMN DiferenciaCheques numeric DEFAULT 0;
ALTER TABLE C_BankStatement ADD COLUMN TotalDiferencias numeric DEFAULT 0;

-- 08/05/2017 22:07:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab SET WhereClause='C_BankStatement.EsCierreCaja=''Y'' AND C_BankStatement.Name!=''Compensacion Transferencia''',Updated=TO_DATE('2017-05-08 22:07:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000007
;

-- 01/06/2017 1:06:42 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='(SELECT (C_BankStatement.ScrutinizedCheckAmt - ((SELECT COALESCE(Sum(sl.TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''K'',''Z''))) + (COALESCE((SELECT SUM(pa.PayAmt) FROM C_Payment pa WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsOnDrawer=''Y'' AND pa.IsReceipt=''Y'' AND pa.DocStatus IN (''CO'',''CL'') AND pa.TenderType IN (''K'',''Z'') AND pa.C_Payment_ID NOT IN (SELECT sli.C_Payment_ID FROM C_BankStatementLine sli WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)) , 0)) + (COALESCE((SELECT SUM(pa.PayAmt) FROM C_Payment pa WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsReceipt=''N'' AND pa.DocStatus IN (''CO'',''CL'') AND pa.TenderType IN (''K'',''Z'') AND pa.IsReconciled=''N'' AND pa.LAR_PaymentSource_ID > 0 AND pa.LAR_PaymentSource_ID NOT IN (SELECT sli.C_Payment_ID FROM C_BankStatementLine sli WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)) , 0))))) ',Updated=TO_DATE('2017-06-01 01:06:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000157
;

-- 01/06/2017 1:07:08 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='((SELECT COALESCE(Sum(sl.TrxAmt),0)  FROM C_BankStatementLine sl  JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID)  WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''K'',''Z''))) + (COALESCE((SELECT SUM(pa.PayAmt)  FROM C_Payment pa  WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsOnDrawer=''Y'' AND pa.IsReceipt=''Y'' AND pa.DocStatus IN (''CO'',''CL'') AND pa.TenderType IN (''K'',''Z'') AND pa.C_Payment_ID NOT IN (SELECT sli.C_Payment_ID  FROM C_BankStatementLine sli  WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)) , 0)) + (COALESCE((SELECT SUM(pa.PayAmt)  FROM C_Payment pa  WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsReceipt=''N'' AND pa.DocStatus IN (''CO'',''CL'') AND pa.TenderType IN (''K'',''Z'') AND pa.IsReconciled=''N'' AND pa.LAR_PaymentSource_ID > 0 AND pa.LAR_PaymentSource_ID NOT IN (SELECT sli.C_Payment_ID  FROM C_BankStatementLine sli  WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)) , 0)))',Updated=TO_DATE('2017-06-01 01:07:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000149
;

-- 01/06/2017 1:26:55 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='((SELECT (C_BankStatement.ScrutinizedCashAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''X'')) + (SELECT (C_BankStatement.ScrutinizedCheckAmt - ((SELECT COALESCE(Sum(sl.TrxAmt),0)  FROM C_BankStatementLine sl  JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID)  WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''K'',''Z''))) + (COALESCE((SELECT SUM(pa.PayAmt)  FROM C_Payment pa  WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsOnDrawer=''Y'' AND pa.IsReceipt=''Y'' AND pa.DocStatus IN (''CO'',''CL'') AND pa.TenderType IN (''K'',''Z'') AND pa.C_Payment_ID NOT IN (SELECT sli.C_Payment_ID  FROM C_BankStatementLine sli  WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)) , 0)) + (COALESCE((SELECT SUM(pa.PayAmt)  FROM C_Payment pa  WHERE pa.C_BankAccount_ID=C_BankStatement.C_BankAccount_ID AND pa.IsReceipt=''N'' AND pa.DocStatus IN (''CO'',''CL'') AND pa.TenderType IN (''K'',''Z'') AND pa.IsReconciled=''N'' AND pa.LAR_PaymentSource_ID > 0 AND pa.LAR_PaymentSource_ID NOT IN (SELECT sli.C_Payment_ID  FROM C_BankStatementLine sli  WHERE C_BankStatement.C_BankStatement_ID=sli.C_BankStatement_ID)) , 0)))))+ (SELECT (C_BankStatement.ScrutinizedCreditCardAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''D'', ''C''))) - C_BankStatement.SaldoInicial)',Updated=TO_DATE('2017-06-01 01:26:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000161
;

-- 05/06/2017 19:22:42 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000440,'totalcheques','LAR','totalcheques','totalcheques',0,TO_DATE('2017-06-05 19:22:41','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2017-06-05 19:22:41','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 05/06/2017 19:22:42 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000440 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 05/06/2017 19:22:42 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002055,392,'LAR',0,'N','N','N','N',131089,'N',22,'N',3000440,'N','Y','N','totalcheques','totalcheques',100,TO_DATE('2017-06-05 19:22:41','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-06-05 19:22:41','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/06/2017 19:22:42 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002055 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/06/2017 19:26:31 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='TotalCheques', Name='Total Cheques', PrintName='Total Cheques',Updated=TO_DATE('2017-06-05 19:26:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000440
;

-- 05/06/2017 19:26:31 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000440
;

-- 05/06/2017 19:26:31 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='TotalCheques', Name='Total Cheques', Description=NULL, Help=NULL WHERE AD_Element_ID=3000440
;

-- 05/06/2017 19:26:32 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='TotalCheques', Name='Total Cheques', Description=NULL, Help=NULL, AD_Element_ID=3000440 WHERE UPPER(ColumnName)='TOTALCHEQUES' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 05/06/2017 19:26:32 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='TotalCheques', Name='Total Cheques', Description=NULL, Help=NULL WHERE AD_Element_ID=3000440 AND IsCentrallyMaintained='Y'
;

-- 05/06/2017 19:26:32 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Total Cheques', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000440) AND IsCentrallyMaintained='Y'
;

-- 05/06/2017 19:26:32 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_PrintFormatItem pi SET PrintName='Total Cheques', Name='Total Cheques' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000440)
;

-- 05/06/2017 19:26:43 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Total Cheques',PrintName='Total Cheques',Updated=TO_DATE('2017-06-05 19:26:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000440 AND AD_Language='es_AR'
;

-- 05/06/2017 19:26:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Total Cheques',Updated=TO_DATE('2017-06-05 19:26:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002055 AND AD_Language='es_AR'
;

-- 05/06/2017 19:27:37 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003255,131089,'Y','N','N',3002055,'N','Y',3000007,'N','LAR','Total Cheques',100,0,TO_DATE('2017-06-05 19:27:37','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2017-06-05 19:27:37','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/06/2017 19:27:37 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003255 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/06/2017 19:28:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3003255
;

-- 05/06/2017 19:28:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000219
;

-- 05/06/2017 19:28:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000211
;

-- 05/06/2017 19:28:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000210
;

-- 05/06/2017 19:28:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000218
;

-- 05/06/2017 19:28:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000209
;

-- 05/06/2017 19:28:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000214
;

-- 05/06/2017 19:28:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000220
;

-- 05/06/2017 19:28:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000213
;

-- 05/06/2017 19:28:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000216
;

-- 05/06/2017 19:28:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000167
;

-- 05/06/2017 19:28:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000168
;

-- 05/06/2017 19:28:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000169
;

-- 05/06/2017 19:28:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3002686
;

-- 05/06/2017 19:28:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000170
;

-- 05/06/2017 19:28:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3002653
;

-- 05/06/2017 19:30:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3002653
;

-- 05/06/2017 19:32:05 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@DocStatus@=DF',Updated=TO_DATE('2017-06-05 19:32:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000212
;

-- 05/06/2017 19:34:03 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@DocStatus@=CO | @DocStatus@=CL | @DocStatus@=VO',Updated=TO_DATE('2017-06-05 19:34:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003255
;

-- 05/06/2017 19:34:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@DocStatus@=DF | @DocStatus@=IN',Updated=TO_DATE('2017-06-05 19:34:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000212
;

-- 05/06/2017 19:36:48 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLength=40,Updated=TO_DATE('2017-06-05 19:36:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003255
;

-- 05/06/2017 19:38:05 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@DocStatus@=DR | @DocStatus@=IN',Updated=TO_DATE('2017-06-05 19:38:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000212
;

-- 05/06/2017 19:38:15 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLength=22,Updated=TO_DATE('2017-06-05 19:38:15','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003255
;

-- 05/06/2017 19:42:17 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2017-06-05 19:42:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003255
;

-- 05/06/2017 20:07:34 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000441,'diferenciacheques','LAR','diferenciacheques','diferenciacheques',0,TO_DATE('2017-06-05 20:07:34','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2017-06-05 20:07:34','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 05/06/2017 20:07:34 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000441 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 05/06/2017 20:07:35 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002056,392,'LAR',0,'N','N','N','N',131089,'N',22,'N',3000441,'N','Y','N','diferenciacheques','diferenciacheques',100,TO_DATE('2017-06-05 20:07:34','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-06-05 20:07:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/06/2017 20:07:35 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002056 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/06/2017 20:07:35 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000442,'totaldiferencias','LAR','totaldiferencias','totaldiferencias',0,TO_DATE('2017-06-05 20:07:35','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2017-06-05 20:07:35','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 05/06/2017 20:07:35 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000442 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 05/06/2017 20:07:35 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002057,392,'LAR',0,'N','N','N','N',131089,'N',22,'N',3000442,'N','Y','N','totaldiferencias','totaldiferencias',100,TO_DATE('2017-06-05 20:07:35','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2017-06-05 20:07:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/06/2017 20:07:35 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002057 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/06/2017 20:08:18 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET Name='Diferencia Cheques', ColumnName='DiferenciaCheques',Updated=TO_DATE('2017-06-05 20:08:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002056
;

-- 05/06/2017 20:08:18 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3002056
;

-- 05/06/2017 20:08:18 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Diferencia Cheques', Description=NULL, Help=NULL WHERE AD_Column_ID=3002056 AND IsCentrallyMaintained='Y'
;

-- 05/06/2017 20:08:24 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Diferencia Cheques',Updated=TO_DATE('2017-06-05 20:08:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002056 AND AD_Language='es_AR'
;

-- 05/06/2017 20:08:40 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='DiferenciaCheques', Name='Diferencia Cheques', PrintName='Diferencia Cheques',Updated=TO_DATE('2017-06-05 20:08:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000441
;

-- 05/06/2017 20:08:40 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000441
;

-- 05/06/2017 20:08:40 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='DiferenciaCheques', Name='Diferencia Cheques', Description=NULL, Help=NULL WHERE AD_Element_ID=3000441
;

-- 05/06/2017 20:08:41 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='DiferenciaCheques', Name='Diferencia Cheques', Description=NULL, Help=NULL, AD_Element_ID=3000441 WHERE UPPER(ColumnName)='DIFERENCIACHEQUES' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 05/06/2017 20:08:41 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='DiferenciaCheques', Name='Diferencia Cheques', Description=NULL, Help=NULL WHERE AD_Element_ID=3000441 AND IsCentrallyMaintained='Y'
;

-- 05/06/2017 20:08:41 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Diferencia Cheques', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000441) AND IsCentrallyMaintained='Y'
;

-- 05/06/2017 20:08:41 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_PrintFormatItem pi SET PrintName='Diferencia Cheques', Name='Diferencia Cheques' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000441)
;

-- 05/06/2017 20:08:48 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Diferencia Cheques',PrintName='Diferencia Cheques',Updated=TO_DATE('2017-06-05 20:08:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000441 AND AD_Language='es_AR'
;

-- 05/06/2017 20:09:33 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET Name='Total Diferencias', ColumnName='TotalDiferencias',Updated=TO_DATE('2017-06-05 20:09:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002057
;

-- 05/06/2017 20:09:33 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3002057
;

-- 05/06/2017 20:09:33 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Total Diferencias', Description=NULL, Help=NULL WHERE AD_Column_ID=3002057 AND IsCentrallyMaintained='Y'
;

-- 05/06/2017 20:09:38 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column_Trl SET Name='Total Diferencias',Updated=TO_DATE('2017-06-05 20:09:38','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002057 AND AD_Language='es_AR'
;

-- 05/06/2017 20:09:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element SET ColumnName='TotalDiferencias', Name='Total Diferencias', PrintName='Total Diferencias',Updated=TO_DATE('2017-06-05 20:09:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000442
;

-- 05/06/2017 20:09:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000442
;

-- 05/06/2017 20:09:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnName='TotalDiferencias', Name='Total Diferencias', Description=NULL, Help=NULL WHERE AD_Element_ID=3000442
;

-- 05/06/2017 20:09:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='TotalDiferencias', Name='Total Diferencias', Description=NULL, Help=NULL, AD_Element_ID=3000442 WHERE UPPER(ColumnName)='TOTALDIFERENCIAS' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 05/06/2017 20:09:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Process_Para SET ColumnName='TotalDiferencias', Name='Total Diferencias', Description=NULL, Help=NULL WHERE AD_Element_ID=3000442 AND IsCentrallyMaintained='Y'
;

-- 05/06/2017 20:09:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET Name='Total Diferencias', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000442) AND IsCentrallyMaintained='Y'
;

-- 05/06/2017 20:09:53 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_PrintFormatItem pi SET PrintName='Total Diferencias', Name='Total Diferencias' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000442)
;

-- 05/06/2017 20:10:00 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Element_Trl SET Name='Total Diferencias',PrintName='Total Diferencias',Updated=TO_DATE('2017-06-05 20:10:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000442 AND AD_Language='es_AR'
;

-- 05/06/2017 20:10:50 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003256,131089,'Y','N','N',3002056,'N','Y',3000007,'N','LAR','Diferencia Cheques',100,0,TO_DATE('2017-06-05 20:10:50','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2017-06-05 20:10:50','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/06/2017 20:10:50 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003256 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/06/2017 20:10:50 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3003257,131089,'Y','N','N',3002057,'N','Y',3000007,'N','LAR','Total Diferencias',100,0,TO_DATE('2017-06-05 20:10:50','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2017-06-05 20:10:50','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/06/2017 20:10:50 ART
-- ISSUE #80: Cierre de Cajas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3003257 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/06/2017 20:11:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3003257
;

-- 05/06/2017 20:11:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000163
;

-- 05/06/2017 20:11:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000164
;

-- 05/06/2017 20:11:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000212
;

-- 05/06/2017 20:11:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3003255
;

-- 05/06/2017 20:11:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000219
;

-- 05/06/2017 20:11:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000211
;

-- 05/06/2017 20:11:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3003256
;

-- 05/06/2017 20:11:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000210
;

-- 05/06/2017 20:11:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000218
;

-- 05/06/2017 20:11:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000209
;

-- 05/06/2017 20:11:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000214
;

-- 05/06/2017 20:11:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000220
;

-- 05/06/2017 20:11:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000213
;

-- 05/06/2017 20:11:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000216
;

-- 05/06/2017 20:11:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000167
;

-- 05/06/2017 20:11:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000168
;

-- 05/06/2017 20:11:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000169
;

-- 05/06/2017 20:11:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3002686
;

-- 05/06/2017 20:11:27 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000170
;

-- 05/06/2017 20:12:32 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@DocStatus@=DR | @DocStatus@=IN',Updated=TO_DATE('2017-06-05 20:12:32','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000222
;

-- 05/06/2017 20:13:16 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLogic='@DocStatus@=DR | @DocStatus@=IN',Updated=TO_DATE('2017-06-05 20:13:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000211
;

-- 05/06/2017 20:14:01 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET IsSameLine='Y', DisplayLogic='@DocStatus@=CO | @DocStatus@=CL | @DocStatus@=VO',Updated=TO_DATE('2017-06-05 20:14:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003257
;

-- 05/06/2017 20:14:33 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLength=22,Updated=TO_DATE('2017-06-05 20:14:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003257
;

-- 05/06/2017 20:14:54 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Field SET DisplayLength=22, IsSameLine='Y', DisplayLogic='@DocStatus@=CO | @DocStatus@=CL | @DocStatus@=VO',Updated=TO_DATE('2017-06-05 20:14:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3003256
;

-- Registración de script
SELECT register_migration_script_lar('0090_ISSUE-80.sql', 'LAR', '')
;
