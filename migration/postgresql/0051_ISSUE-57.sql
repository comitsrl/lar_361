-- 11/02/2013 11:40:25 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Column SET ColumnSQL='(SELECT COALESCE(Sum(TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''D'', ''A'') AND p.IsReceipt = ''Y''))',Updated=TO_TIMESTAMP('2013-02-11 11:40:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000152
;

-- 11/02/2013 12:40:49 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Column SET ColumnSQL='(SELECT COALESCE(Sum(TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''C'' AND IsReceipt = ''Y''))',Updated=TO_TIMESTAMP('2013-02-11 12:40:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000151
;

-- 11/02/2013 12:41:29 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Column SET ColumnSQL='(SELECT COALESCE(Sum(TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''D'', ''A'') AND p.IsReceipt = ''Y'' ))',Updated=TO_TIMESTAMP('2013-02-11 12:41:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000152
;

-- 11/02/2013 12:43:24 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Column SET ColumnSQL='(SELECT (C_BankStatement.ScrutinizedCreditCardAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''C'' AND p.IsReceipt = ''Y'' ))',Updated=TO_TIMESTAMP('2013-02-11 12:43:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000159
;

-- 11/02/2013 12:44:08 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Column SET ColumnSQL='(SELECT (C_BankStatement.ScrutinizedDirectDebitAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''D'' AND p.IsReceipt = ''Y'' ))',Updated=TO_TIMESTAMP('2013-02-11 12:44:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000160
;

-- 11/02/2013 12:45:05 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Column SET ColumnSQL='(SELECT COALESCE(Sum(TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''C'' AND p.IsReceipt = ''Y''))',Updated=TO_TIMESTAMP('2013-02-11 12:45:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000151
;

-- 11/02/2013 12:54:37 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Crear Líneas Desde',Description='El proceso permite seleccionar pagos y cobros para convertirlos en una línea del cierre de caja.',Help='El porceso Crear Líneas Desde genera una nueva línea del cierre de caja basado en la selección de un cobro/pago.',Updated=TO_TIMESTAMP('2013-02-11 12:54:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000161 AND AD_Language='es_AR'
;

-- 11/02/2013 12:58:35 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Acción del documento',Description='El estado que alcanzará el documento luego del proceso',Help='El estado actual se muestra en el campo Estado del Documento. Las opciones son listadas en una ventana emergente.',Updated=TO_TIMESTAMP('2013-02-11 12:58:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000168 AND AD_Language='es_AR'
;

-- 11/02/2013 13:01:46 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field_Trl SET Name='Caja',Description='Caja sobre la cual se realizará el cierre',Help='Todos los movimientos tienen asignada una caja sobre la cual se registra la operación.',Updated=TO_TIMESTAMP('2013-02-11 13:01:46','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000154 AND AD_Language='es_AR'
;

-- 11/02/2013 13:03:40 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Total Cupones TC',Updated=TO_TIMESTAMP('2013-02-11 13:03:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000214 AND AD_Language='es_AR'
;

-- 11/02/2013 13:04:28 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Diferencia Cupones TC',Updated=TO_TIMESTAMP('2013-02-11 13:04:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000213 AND AD_Language='es_AR'
;

-- 11/02/2013 13:05:14 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Total Transferencias',Updated=TO_TIMESTAMP('2013-02-11 13:05:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000216 AND AD_Language='es_AR'
;

-- 11/02/2013 13:06:03 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field_Trl SET Name='Transferencias Contab.',Updated=TO_TIMESTAMP('2013-02-11 13:06:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000221 AND AD_Language='es_AR'
;

-- 11/02/2013 13:06:21 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Diferencia Transferencias',Updated=TO_TIMESTAMP('2013-02-11 13:06:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000215 AND AD_Language='es_AR'
;

-- 11/02/2013 13:11:11 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Nro. Resumen TEF',Description='Número de Resumen de Transferencia Electrónica de Fondos',Help='Información de la Transferencia Electrónica de Fondos',Updated=TO_TIMESTAMP('2013-02-11 13:11:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000165 AND AD_Language='es_AR'
;

-- 11/02/2013 13:11:16 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field SET IsDisplayed='N',Updated=TO_TIMESTAMP('2013-02-11 13:11:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000165
;

-- 11/02/2013 13:13:53 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Fecha TEF',Description='Fecha del resumen de la Transferencia Electrónica de Fondos',Help='Información de la Tranferencia Electrónica de Fondos',Updated=TO_TIMESTAMP('2013-02-11 13:13:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000166 AND AD_Language='es_AR'
;

-- 11/02/2013 13:13:59 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field SET IsDisplayed='N',Updated=TO_TIMESTAMP('2013-02-11 13:13:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000166
;

-- 11/02/2013 13:16:29 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Estado del Documento',Description='Estado actual del Documento',Help='El campo Estado del Documento muestra el estado actual del Documento. Para modificar el Estado utilizar el campo Acción del Documento.',Updated=TO_TIMESTAMP('2013-02-11 13:16:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000167 AND AD_Language='es_AR'
;

-- 11/02/2013 13:18:19 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field_Trl SET IsTranslated='Y',Help='El saldo final es el resultado de operar el Saldo Incial con los cobros y pagos incluidos en el cierre.',Updated=TO_TIMESTAMP('2013-02-11 13:18:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000164 AND AD_Language='es_AR'
;

-- 11/02/2013 13:21:11 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field_Trl SET Name='Saldo del Cierre',Description='Saldo resultante de operar el Saldo Inicial, los movimientos y las diferencias del cierre de caja.',Help='Saldo resultante de operar el Saldo Inicial, los movimientos y las diferencias del cierre de caja.',Updated=TO_TIMESTAMP('2013-02-11 13:21:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000162 AND AD_Language='es_AR'
;

-- 11/02/2013 13:22:33 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field_Trl SET Name='Fecha de Línea',Description='Fecha de la línea del cierre de caja',Updated=TO_TIMESTAMP('2013-02-11 13:22:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000181 AND AD_Language='es_AR'
;

-- 11/02/2013 13:22:52 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field SET IsCentrallyMaintained='N',Updated=TO_TIMESTAMP('2013-02-11 13:22:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000181
;

-- 11/02/2013 13:28:42 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field_Trl SET Name='Importe de la Línea',Description='Importe de la Línea',Help=NULL,Updated=TO_TIMESTAMP('2013-02-11 13:28:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000184 AND AD_Language='es_AR'
;

-- 12/02/2013 8:34:01 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Column SET ColumnSQL='(SELECT (C_BankStatement.ScrutinizedCashAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''X''))',Updated=TO_TIMESTAMP('2013-02-12 08:34:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000158
;

-- 12/02/2013 8:34:17 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Column SET ColumnSQL='(SELECT COALESCE(Sum(TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''X''))',Updated=TO_TIMESTAMP('2013-02-12 08:34:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000150
;

-- 12/02/2013 8:34:54 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Column SET ColumnSQL='(SELECT (C_BankStatement.ScrutinizedCheckAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''K'' AND p.IsReceipt = ''Y''))',Updated=TO_TIMESTAMP('2013-02-12 08:34:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000157
;

-- 12/02/2013 8:35:13 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Column SET ColumnSQL='(SELECT COALESCE(Sum(TrxAmt),0) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType = ''K'' AND p.IsReceipt = ''Y''))',Updated=TO_TIMESTAMP('2013-02-12 08:35:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000149
;

-- 12/02/2013 8:36:22 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Column SET ColumnSQL='(SELECT (C_BankStatement.ScrutinizedDirectDebitAmt - (COALESCE(Sum(TrxAmt),0))) FROM C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID) WHERE (C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID AND p.TenderType IN (''D'', ''A'') AND p.IsReceipt = ''Y'' ))',Updated=TO_TIMESTAMP('2013-02-12 08:36:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000160
;

-- 12/02/2013 8:38:48 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Column SET ColumnSQL='(SELECT ((C_BankStatement.ScrutinizedCheckAmt + C_BankStatement.ScrutinizedCashAmt + C_BankStatement.ScrutinizedCreditCardAmt + C_BankStatement.ScrutinizedDirectDebitAmt) - (COALESCE(Sum(TrxAmt),0))) FROM (C_BankStatementLine sl JOIN C_Payment p ON (sl.C_Payment_ID = p.C_Payment_ID)) WHERE ((C_BankStatement.C_BankStatement_ID = sl.C_BankStatement_ID) AND (p.TenderType IN (''X'',''K'',''C'',''D'',''A''))))',Updated=TO_TIMESTAMP('2013-02-12 08:38:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3000161
;

-- 12/02/2013 10:01:40 ART
-- Minor Changes to Drawer Closing Window
UPDATE AD_Field_Trl SET IsTranslated='Y',Name='Descripción',Description='Descripción opcional del registro',Help='El campo descripción está limitado a 255 caracteres.',Updated=TO_TIMESTAMP('2013-02-12 10:01:40','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000157 AND AD_Language='es_AR'
;

