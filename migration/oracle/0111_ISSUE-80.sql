-- 27/07/2018 19:04:23 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,CreatedBy,UpdatedBy,AD_Org_ID) VALUES (3000869,'saldofinal','LAR','saldofinal','saldofinal',0,TO_DATE('2018-07-27 19:04:22','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2018-07-27 19:04:22','YYYY-MM-DD HH24:MI:SS'),'Y',100,100,0)
;

-- 27/07/2018 19:04:24 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000869 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 27/07/2018 19:04:24 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3002970,392,'LAR',0,'N','N','N','N',131089,'N',22,'N',3000869,'N','Y','N','saldofinal','saldofinal',100,TO_DATE('2018-07-27 19:04:22','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2018-07-27 19:04:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2018 19:04:24 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3002970 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 27/07/2018 19:04:55 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Column SET Name='Saldo del Cierre', ColumnName='SaldoFinal',Updated=TO_DATE('2018-07-27 19:04:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002970
;

-- 27/07/2018 19:04:55 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3002970
;

-- 27/07/2018 19:04:55 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET Name='Saldo del Cierre', Description=NULL, Help=NULL WHERE AD_Column_ID=3002970 AND IsCentrallyMaintained='Y'
;

-- 27/07/2018 19:05:04 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Column SET FieldLength=20,Updated=TO_DATE('2018-07-27 19:05:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002970
;

-- 27/07/2018 19:05:16 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Column SET AD_Reference_ID=37,Updated=TO_DATE('2018-07-27 19:05:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002970
;

-- 27/07/2018 19:05:21 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Column_Trl SET Name='Saldo del Cierre',Updated=TO_DATE('2018-07-27 19:05:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002970 AND AD_Language='es_AR'
;

-- 27/07/2018 19:05:35 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Element SET ColumnName='SaldoFinal', Name='Saldo del Cierre', PrintName='Saldo del Cierre',Updated=TO_DATE('2018-07-27 19:05:35','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000869
;

-- 27/07/2018 19:05:35 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000869
;

-- 27/07/2018 19:05:35 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Column SET ColumnName='SaldoFinal', Name='Saldo del Cierre', Description=NULL, Help=NULL WHERE AD_Element_ID=3000869
;

-- 27/07/2018 19:05:36 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Process_Para SET ColumnName='SaldoFinal', Name='Saldo del Cierre', Description=NULL, Help=NULL, AD_Element_ID=3000869 WHERE UPPER(ColumnName)='SALDOFINAL' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 27/07/2018 19:05:36 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Process_Para SET ColumnName='SaldoFinal', Name='Saldo del Cierre', Description=NULL, Help=NULL WHERE AD_Element_ID=3000869 AND IsCentrallyMaintained='Y'
;

-- 27/07/2018 19:05:36 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET Name='Saldo del Cierre', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000869) AND IsCentrallyMaintained='Y'
;

-- 27/07/2018 19:05:36 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_PrintFormatItem pi SET PrintName='Saldo del Cierre', Name='Saldo del Cierre' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000869)
;

-- 27/07/2018 19:05:41 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Element_Trl SET Name='Saldo del Cierre',PrintName='Saldo del Cierre',Updated=TO_DATE('2018-07-27 19:05:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000869 AND AD_Language='es_AR'
;

-- 27/07/2018 19:06:33 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,Updated,CreatedBy) VALUES ('N',3005562,20,'Y','N','N',3002970,'N','Y',3000007,'N','LAR','Saldo del Cierre',100,0,TO_DATE('2018-07-27 19:06:32','YYYY-MM-DD HH24:MI:SS'),'Y',0,TO_DATE('2018-07-27 19:06:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 27/07/2018 19:06:33 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3005562 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 27/07/2018 19:07:05 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3005562
;

-- 27/07/2018 19:07:05 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3000212
;

-- 27/07/2018 19:07:05 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3003255
;

-- 27/07/2018 19:07:05 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000219
;

-- 27/07/2018 19:07:05 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3000211
;

-- 27/07/2018 19:07:05 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3003256
;

-- 27/07/2018 19:07:05 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000210
;

-- 27/07/2018 19:07:05 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000218
;

-- 27/07/2018 19:07:05 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000209
;

-- 27/07/2018 19:07:05 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000214
;

-- 27/07/2018 19:07:05 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000220
;

-- 27/07/2018 19:07:06 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000213
;

-- 27/07/2018 19:07:06 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000216
;

-- 27/07/2018 19:07:06 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000167
;

-- 27/07/2018 19:07:06 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000168
;

-- 27/07/2018 19:07:06 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000169
;

-- 27/07/2018 19:07:06 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3002686
;

-- 27/07/2018 19:07:06 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000170
;

-- 27/07/2018 19:08:04 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3005562
;

-- 27/07/2018 19:08:04 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000164
;

-- 27/07/2018 19:08:18 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3005562
;

-- 27/07/2018 19:08:18 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3000222
;

-- 27/07/2018 19:08:18 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3003257
;

-- 27/07/2018 19:08:18 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000163
;

-- 27/07/2018 19:08:38 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000162
;

-- 27/07/2018 19:08:38 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=3005562
;

-- 27/07/2018 19:08:38 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=3000222
;

-- 27/07/2018 19:08:38 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=3003257
;

-- 27/07/2018 19:08:38 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=3000163
;

-- 27/07/2018 19:08:38 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=3000164
;

-- 27/07/2018 19:08:38 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=3000212
;

-- 27/07/2018 19:08:38 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=3003255
;

-- 27/07/2018 19:08:38 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=3000219
;

-- 27/07/2018 19:08:38 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=3000211
;

-- 27/07/2018 19:08:38 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=3003256
;

-- 27/07/2018 19:08:38 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000210
;

-- 27/07/2018 19:08:39 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000218
;

-- 27/07/2018 19:08:39 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000209
;

-- 27/07/2018 19:08:39 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000214
;

-- 27/07/2018 19:08:39 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=3000220
;

-- 27/07/2018 19:08:39 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=260,IsDisplayed='Y' WHERE AD_Field_ID=3000213
;

-- 27/07/2018 19:08:39 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=270,IsDisplayed='Y' WHERE AD_Field_ID=3000216
;

-- 27/07/2018 19:08:39 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000167
;

-- 27/07/2018 19:08:39 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000168
;

-- 27/07/2018 19:08:39 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000169
;

-- 27/07/2018 19:08:39 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3002686
;

-- 27/07/2018 19:08:39 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000170
;

-- 27/07/2018 19:24:27 ART
-- ISSUE #80: Columna Saldo Final, para cierres de caja.
UPDATE AD_Field SET IsReadOnly='Y',Updated=TO_DATE('2018-07-27 19:24:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3005562
;

-- Registración de script
SELECT register_migration_script_lar('0111_ISSUE-80.sql', 'LAR', '') FROM dual
;
