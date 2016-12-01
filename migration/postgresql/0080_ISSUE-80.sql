-- 14/11/2016 19:18:43 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Menu_Trl SET Name='Movimientos de Caja',Updated=TO_TIMESTAMP('2016-11-14 19:18:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=3000183 AND AD_Language='es_AR'
;

-- 14/11/2016 19:19:25 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Window_Trl SET Name='Movimientos de Caja',Updated=TO_TIMESTAMP('2016-11-14 19:19:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Window_ID=3000063 AND AD_Language='es_AR'
;

-- 14/11/2016 19:20:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Tab_Trl SET Name='Movimiento de Caja',Updated=TO_TIMESTAMP('2016-11-14 19:20:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=3000127 AND AD_Language='es_AR'
;

-- 14/11/2016 19:21:59 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Menu SET IsActive='N',Updated=TO_TIMESTAMP('2016-11-14 19:21:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Menu_ID=3000007
;

-- 14/11/2016 19:25:06 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE C_DocType SET PrintName='Movimiento de Caja', Name='Movimiento de Caja',Updated=TO_TIMESTAMP('2016-11-14 19:25:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_DocType_ID=3000159
;

-- 14/11/2016 19:25:06 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE C_DocType_Trl SET DocumentNote=NULL,PrintName='Movimiento de Caja',Name='Movimiento de Caja',IsTranslated='Y' WHERE C_DocType_ID=3000159
;

ALTER TABLE lar_retiroCaja ALTER COLUMN lar_conceptocaja_id DROP NOT NULL;

-- 14/11/2016 21:15:21 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET IsMandatory='N', MandatoryLogic='@Retiro@=Y | @Transferencia@=Y',Updated=TO_TIMESTAMP('2016-11-14 21:15:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001819
;

-- 25/11/2016 21:55:23 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='((SELECT (C_BankStatement.ScrutinizedCashAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''X'')) + (SELECT (C_BankStatement.ScrutinizedCheckAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''Z'', ''K''))) + (SELECT (C_BankStatement.ScrutinizedCreditCardAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''D'', ''C'')))',Updated=TO_TIMESTAMP('2016-11-25 21:55:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000161
;

-- 25/11/2016 21:57:52 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Val_Rule SET Code='C_BankAccount.IsDrawer=''Y'' AND C_BankAccount.IsActive=''Y''',Updated=TO_TIMESTAMP('2016-11-25 21:57:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000034
;

-- 25/11/2016 22:04:33 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Val_Rule SET Code='(C_BankAccount.IsDrawer=''Y'' AND C_BankAccount.AD_Org_ID=@AD_Org_ID@ AND C_BankAccount.IsActive=''Y'')',Updated=TO_TIMESTAMP('2016-11-25 22:04:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000004
;

-- 30/11/2016 19:48:21 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='((SELECT (C_BankStatement.ScrutinizedCashAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''X'')) + (SELECT (C_BankStatement.ScrutinizedCheckAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''Z'', ''K''))) + (SELECT (C_BankStatement.ScrutinizedCreditCardAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''D'', ''C''))))',Updated=TO_TIMESTAMP('2016-11-30 19:48:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000161
;

-- 30/11/2016 19:54:14 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET MandatoryLogic='@TenderType@=''N''',Updated=TO_TIMESTAMP('2016-11-30 19:54:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001865
;

-- 30/11/2016 19:54:56 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET MandatoryLogic='@TenderType@=''A''',Updated=TO_TIMESTAMP('2016-11-30 19:54:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001865
;

-- 30/11/2016 19:56:51 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET MandatoryLogic='@TenderType@=''C''',Updated=TO_TIMESTAMP('2016-11-30 19:56:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001188
;

-- 30/11/2016 19:57:59 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET MandatoryLogic='@TenderType@=''C''',Updated=TO_TIMESTAMP('2016-11-30 19:57:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001205
;

-- 30/11/2016 19:58:46 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET MandatoryLogic='@TenderType@=''D''',Updated=TO_TIMESTAMP('2016-11-30 19:58:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001772
;

-- 30/11/2016 20:00:35 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET MandatoryLogic=NULL,Updated=TO_TIMESTAMP('2016-11-30 20:00:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001188
;

-- 30/11/2016 20:25:26 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET MandatoryLogic='@Retiro@=Y',Updated=TO_TIMESTAMP('2016-11-30 20:25:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001819
;

-- 30/11/2016 20:29:21 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET MandatoryLogic='@Deposito@=''Y''',Updated=TO_TIMESTAMP('2016-11-30 20:29:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001869
;

-- 30/11/2016 20:30:01 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET MandatoryLogic='@Transferencia@=''Y''',Updated=TO_TIMESTAMP('2016-11-30 20:30:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001818
;

-- 01/12/2016 16:30:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET IsMandatory='Y',Updated=TO_TIMESTAMP('2016-12-01 16:30:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000254
;

-- 01/12/2016 16:33:21 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET IsMandatory='Y',Updated=TO_TIMESTAMP('2016-12-01 16:33:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3880
;

-- 01/12/2016 18:15:34 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET MandatoryLogic=NULL,Updated=TO_TIMESTAMP('2016-12-01 18:15:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001205
;

-- 01/12/2016 18:15:50 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET MandatoryLogic='@TenderType@=''C''',Updated=TO_TIMESTAMP('2016-12-01 18:15:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3001188
;

-- 01/12/2016 18:24:36 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET ColumnSQL='((SELECT (C_BankStatement.ScrutinizedCashAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''X'')) + (SELECT (C_BankStatement.ScrutinizedCheckAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''Z'', ''K''))) + (SELECT (C_BankStatement.ScrutinizedCreditCardAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''D'', ''C''))) - C_BankStatement.SaldoInicial)',Updated=TO_TIMESTAMP('2016-12-01 18:24:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000161
;

-- 01/12/2016 19:14:01 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3001624
;

-- 01/12/2016 19:14:01 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000318
;

-- 01/12/2016 19:14:01 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000319
;

-- 01/12/2016 19:14:01 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000320
;

-- 01/12/2016 19:14:01 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000321
;

-- 01/12/2016 19:14:01 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000322
;

-- 01/12/2016 19:14:01 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000886
;

-- 01/12/2016 19:14:01 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000888
;

-- 01/12/2016 19:14:01 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000325
;

-- 01/12/2016 19:14:01 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000326
;

-- 01/12/2016 19:14:01 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000323
;

-- 01/12/2016 19:14:01 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000324
;

-- 01/12/2016 19:14:01 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000328
;

-- 01/12/2016 19:14:01 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000327
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=3000485
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=3000412
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=3000432
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=3000433
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000434
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3002763
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000436
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000437
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000438
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000439
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000440
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000450
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000452
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000453
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000454
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000455
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3002769
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3002770
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3002806
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000458
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000459
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000460
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000461
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000462
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000463
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000464
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000465
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000466
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000467
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000468
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000469
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000470
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000471
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000472
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000473
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000474
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000475
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000476
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000477
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000478
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000479
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000480
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000481
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000482
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000483
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000484
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000492
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000490
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000489
;

-- 01/12/2016 19:17:05 ART
-- Cierre de Cajas
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000491
;

-- Registración de script
SELECT register_migration_script_lar('0080_ISSUE-80', 'LAR', '')
;
