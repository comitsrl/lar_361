-- 05/01/2021 20:15:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006919,20,'Y','N','N',3000148,'N','Y',329,'N','The Tender Type indicates the method of payment (ACH or Direct Deposit, Credit Card, Check, Direct Debit)','U','Method of Payment','Tender type',100,0,TO_TIMESTAMP('2021-01-05 20:15:24','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-01-05 20:15:24','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/01/2021 20:15:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006919 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/01/2021 20:15:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006920,1,'Y','N','N',3000145,'N','Y',329,'N','The transferred checkbox indicates if the transactions associated with this document should be transferred to the General Ledger.','LAR','Transferred to General Ledger (i.e. accounted)','Transferred',100,0,TO_TIMESTAMP('2021-01-05 20:15:25','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-01-05 20:15:25','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/01/2021 20:15:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006920 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/01/2021 20:15:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006921,10,'Y','N','N',3001779,'N','Y',329,'N','The User identifies a unique user in the system. This could be an internal user or a business partner contact','LAR','User within the system - Internal or Business Partner Contact','User/Contact',100,0,TO_TIMESTAMP('2021-01-05 20:15:25','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-01-05 20:15:25','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/01/2021 20:15:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006921 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/01/2021 20:15:48 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006920
;

-- 05/01/2021 20:15:48 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006921
;

-- 05/01/2021 20:15:48 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3006919
;

-- 05/01/2021 20:16:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET EntityType='LAR',Updated=TO_TIMESTAMP('2021-01-05 20:16:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006919
;

-- 05/01/2021 20:46:31 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3006919
;

-- 05/01/2021 20:46:31 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=4011
;

-- 05/01/2021 20:46:31 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=4009
;

-- 05/01/2021 20:46:31 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=4013
;

-- 05/01/2021 20:46:31 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=6863
;

-- 05/01/2021 20:46:31 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=6864
;

-- 05/01/2021 20:46:31 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=8936
;

-- 05/01/2021 20:46:31 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=8359
;

-- 05/01/2021 20:46:31 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=8935
;

-- 05/01/2021 20:46:31 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=8934
;

-- 05/01/2021 20:46:31 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=8356
;

-- 05/01/2021 20:46:31 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=8358
;

-- 05/01/2021 20:46:31 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=8694
;

-- 05/01/2021 20:46:31 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=8692
;

-- 05/01/2021 20:46:31 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=8361
;

-- 05/01/2021 20:46:31 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=8360
;

-- 05/01/2021 20:46:31 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=8362
;

-- 05/01/2021 20:46:31 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=8691
;

-- 05/01/2021 20:46:31 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=8689
;

-- 05/01/2021 20:46:31 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=8688
;

-- 05/01/2021 20:46:31 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=8693
;

-- 05/01/2021 20:50:48 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT p.LAR_Tarjeta_Credito_ID FROM C_Payment p WHERE C_BankStatementLine.C_Payment_ID = p.C_Payment_ID)',3003678,393,'LAR',0,'N','N','N',0,'N',20,'N',19,'N','N',3000209,'N','Y','N','N','N','Tarjeta de Crédito','LAR_Tarjeta_Credito_ID','N',100,TO_TIMESTAMP('2021-01-05 20:50:47','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2021-01-05 20:50:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/01/2021 20:50:48 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003678 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/01/2021 20:51:48 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006922,20,'Y','N','N',3003678,'N','Y',329,'N','LAR','Tarjeta de Crédito',100,0,TO_TIMESTAMP('2021-01-05 20:51:48','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-01-05 20:51:48','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/01/2021 20:51:48 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006922 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/01/2021 20:52:03 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3006922
;

-- 05/01/2021 20:52:03 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=4011
;

-- 05/01/2021 20:52:03 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=4009
;

-- 05/01/2021 20:52:03 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=4013
;

-- 05/01/2021 20:52:03 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=6863
;

-- 05/01/2021 20:52:03 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=6864
;

-- 05/01/2021 20:52:03 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=8936
;

-- 05/01/2021 20:52:03 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=8359
;

-- 05/01/2021 20:52:03 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=8935
;

-- 05/01/2021 20:52:03 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=8934
;

-- 05/01/2021 20:52:04 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=8356
;

-- 05/01/2021 20:52:04 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=8358
;

-- 05/01/2021 20:52:04 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=8694
;

-- 05/01/2021 20:52:04 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=8692
;

-- 05/01/2021 20:52:04 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=8361
;

-- 05/01/2021 20:52:04 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=8360
;

-- 05/01/2021 20:52:04 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=8362
;

-- 05/01/2021 20:52:04 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=8691
;

-- 05/01/2021 20:52:04 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=8689
;

-- 05/01/2021 20:52:04 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=8688
;

-- 05/01/2021 20:52:04 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=8693
;

-- 05/01/2021 20:52:19 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2021-01-05 20:52:19','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006922
;

-- 05/01/2021 20:52:49 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET DisplayLogic='@TenderType@=''C''',Updated=TO_TIMESTAMP('2021-01-05 20:52:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006922
;

-- 05/01/2021 21:00:46 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006923,20,'Y','N','N',3003678,'N','Y',3000008,'N','LAR','Tarjeta de Crédito',100,0,TO_TIMESTAMP('2021-01-05 21:00:46','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-01-05 21:00:46','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/01/2021 21:00:46 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006923 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3006923
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000187
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000188
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000189
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000190
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000191
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000192
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000193
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000194
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000195
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000196
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000197
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000198
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000199
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000200
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000201
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000202
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000203
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000204
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000205
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000206
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000207
;

-- 05/01/2021 21:01:01 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3002683
;

-- 05/01/2021 21:01:42 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET IsSameLine='Y', DisplayLogic='@TenderType@=''C''',Updated=TO_TIMESTAMP('2021-01-05 21:01:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006923
;

-- 05/01/2021 21:09:08 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3000185
;

-- 05/01/2021 21:09:08 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000184
;

-- 05/01/2021 21:09:08 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3002684
;

-- 05/01/2021 21:09:08 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000186
;

-- 05/01/2021 21:09:08 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000187
;

-- 05/01/2021 21:09:08 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000208
;

-- 05/01/2021 21:09:08 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3006923
;

-- 05/01/2021 21:16:42 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
INSERT INTO AD_Column (ColumnSQL,AD_Column_ID,AD_Table_ID,EntityType,Version,AD_Reference_Value_ID,IsMandatory,IsTranslated,IsIdentifier,SeqNo,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsSyncDatabase,IsKey,AD_Element_ID,IsAutocomplete,IsAllowLogging,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,IsAllowCopy,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES ('(SELECT p.LAR_Tarjeta_Debito_ID FROM C_Payment p WHERE C_BankStatementLine.C_Payment_ID = p.C_Payment_ID)',3003679,393,'LAR',0,3000046,'N','N','N',0,'N',20,'N',18,'N','N',3000338,'N','Y','N','N','N','Tarjeta de Debito','LAR_Tarjeta_Debito_ID','N',100,TO_TIMESTAMP('2021-01-05 21:16:42','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2021-01-05 21:16:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 05/01/2021 21:16:42 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003679 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 05/01/2021 21:17:59 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006924,20,'Y','N','N',3003679,'N','Y',329,'N','LAR','Tarjeta de Debito',100,0,TO_TIMESTAMP('2021-01-05 21:17:58','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-01-05 21:17:58','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/01/2021 21:17:59 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006924 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/01/2021 21:18:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3006924
;

-- 05/01/2021 21:18:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=4011
;

-- 05/01/2021 21:18:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=4009
;

-- 05/01/2021 21:18:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=4013
;

-- 05/01/2021 21:18:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=6863
;

-- 05/01/2021 21:18:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=6864
;

-- 05/01/2021 21:18:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=8936
;

-- 05/01/2021 21:18:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=8359
;

-- 05/01/2021 21:18:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=8935
;

-- 05/01/2021 21:18:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=8934
;

-- 05/01/2021 21:18:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=8356
;

-- 05/01/2021 21:18:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=8358
;

-- 05/01/2021 21:18:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=8694
;

-- 05/01/2021 21:18:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=8692
;

-- 05/01/2021 21:18:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=8361
;

-- 05/01/2021 21:18:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=8360
;

-- 05/01/2021 21:18:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=8362
;

-- 05/01/2021 21:18:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=8691
;

-- 05/01/2021 21:18:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=8689
;

-- 05/01/2021 21:18:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=8688
;

-- 05/01/2021 21:18:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=8693
;

-- 05/01/2021 21:18:54 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET IsSameLine='Y', DisplayLogic='@TenderType@=''D''',Updated=TO_TIMESTAMP('2021-01-05 21:18:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006924
;

-- 05/01/2021 21:19:09 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006925,20,'Y','N','N',3003679,'N','Y',3000008,'N','LAR','Tarjeta de Debito',100,0,TO_TIMESTAMP('2021-01-05 21:19:09','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_TIMESTAMP('2021-01-05 21:19:09','YYYY-MM-DD HH24:MI:SS'))
;

-- 05/01/2021 21:19:09 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006925 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 05/01/2021 21:19:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3006925
;

-- 05/01/2021 21:19:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000188
;

-- 05/01/2021 21:19:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000189
;

-- 05/01/2021 21:19:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000190
;

-- 05/01/2021 21:19:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000191
;

-- 05/01/2021 21:19:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000192
;

-- 05/01/2021 21:19:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000193
;

-- 05/01/2021 21:19:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000194
;

-- 05/01/2021 21:19:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000195
;

-- 05/01/2021 21:19:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000196
;

-- 05/01/2021 21:19:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000197
;

-- 05/01/2021 21:19:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000198
;

-- 05/01/2021 21:19:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000199
;

-- 05/01/2021 21:19:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000200
;

-- 05/01/2021 21:19:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000201
;

-- 05/01/2021 21:19:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000202
;

-- 05/01/2021 21:19:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000203
;

-- 05/01/2021 21:19:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000204
;

-- 05/01/2021 21:19:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000205
;

-- 05/01/2021 21:19:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000206
;

-- 05/01/2021 21:19:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000207
;

-- 05/01/2021 21:19:25 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3002683
;

-- 05/01/2021 21:19:55 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET IsSameLine='Y', DisplayLogic='@TenderType@=''D''',Updated=TO_TIMESTAMP('2021-01-05 21:19:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006925
;

-- 05/01/2021 21:20:24 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2021-01-05 21:20:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006923
;

-- 05/01/2021 21:20:29 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2021-01-05 21:20:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006925
;

-- 05/01/2021 21:20:39 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2021-01-05 21:20:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006924
;

-- 05/01/2021 21:20:43 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2021-01-05 21:20:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006922
;

-- 05/01/2021 21:20:47 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_TIMESTAMP('2021-01-05 21:20:47','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006919
;

-- 06/01/2021 18:52:33 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('C_BankAccount.IsDrawer=''Y'' AND C_BankAccount.IsActive=''Y'' AND C_BankAccount.AD_Org_ID = #@AD_Org_ID@','S',3000085,'LAR','Cajas por Org',100,100,TO_TIMESTAMP('2021-01-06 18:52:32','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_TIMESTAMP('2021-01-06 18:52:32','YYYY-MM-DD HH24:MI:SS'))
;

-- 06/01/2021 18:54:37 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Field SET AD_Val_Rule_ID=3000085,Updated=TO_TIMESTAMP('2021-01-06 18:54:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000154
;

-- 06/01/2021 18:57:28 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Val_Rule SET Code='C_BankAccount.IsDrawer=''Y'' AND C_BankAccount.IsActive=''Y'' AND C_BankAccount.AD_Org_ID=#@AD_Org_ID@',Updated=TO_TIMESTAMP('2021-01-06 18:57:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000085
;

-- 06/01/2021 18:58:07 ART
-- ISSUE #80: Modificaciones en ventana Estado de Cuentas.
UPDATE AD_Val_Rule SET Code='C_BankAccount.IsDrawer=''Y'' AND C_BankAccount.IsActive=''Y'' AND C_BankAccount.AD_Org_ID=@#AD_Org_ID@',Updated=TO_TIMESTAMP('2021-01-06 18:58:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Val_Rule_ID=3000085
;

-- Registración de script
SELECT register_migration_script_lar('0160_ISSUE-80.sql', 'LAR', '')
;
