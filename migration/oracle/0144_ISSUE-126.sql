ALTER TABLE C_PaymentTerm ADD COLUMN ValidFrom timestamp without time zone;

-- 25/11/2019 12:07:16 ART
-- ISSUE #126: Campo Vigencia en PaymentTerm.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,Help,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Description,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003555,113,'LAR',0,'N','N','N','The Valid From date indicates the first day of a date range','N',29,'N',16,'N',617,'N','Y','N','Valid from including this date (first day)','Valid from','ValidFrom',100,TO_DATE('2019-11-25 12:07:15','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2019-11-25 12:07:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 25/11/2019 12:07:16 ART
-- ISSUE #126: Campo Vigencia en PaymentTerm.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003555 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 25/11/2019 12:08:00 ART
-- ISSUE #126: Campo Vigencia en PaymentTerm.
UPDATE AD_Column SET AD_Reference_ID=15,Updated=TO_DATE('2019-11-25 12:08:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003555
;

-- 25/11/2019 12:09:40 ART
-- ISSUE #126: Campo Vigencia en PaymentTerm.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,Help,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006658,29,'Y','N','N',3003555,'N','Y',184,'N','The Valid From date indicates the first day of a date range','LAR','Valid from including this date (first day)','Valid from',100,0,TO_DATE('2019-11-25 12:09:40','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,TO_DATE('2019-11-25 12:09:40','YYYY-MM-DD HH24:MI:SS'))
;

-- 25/11/2019 12:09:40 ART
-- ISSUE #126: Campo Vigencia en PaymentTerm.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006658 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 25/11/2019 12:11:11 ART
-- ISSUE #126: Campo Vigencia en PaymentTerm.
UPDATE AD_Field SET DefaultValue='@#Date@',Updated=TO_DATE('2019-11-25 12:11:11','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006658
;

-- 25/11/2019 12:11:59 ART
-- ISSUE #126: Campo Vigencia en PaymentTerm.
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2019-11-25 12:11:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3006658
;

-- 25/11/2019 12:12:11 ART
-- ISSUE #126: Campo Vigencia en PaymentTerm.
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3006658
;

-- 25/11/2019 12:12:11 ART
-- ISSUE #126: Campo Vigencia en PaymentTerm.
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=8662
;

-- 25/11/2019 12:12:11 ART
-- ISSUE #126: Campo Vigencia en PaymentTerm.
UPDATE AD_Field SET SeqNo=250,IsDisplayed='Y' WHERE AD_Field_ID=6553
;

-- Registración de script
SELECT register_migration_script_lar('0144_ISSUE-126.sql', 'LAR', '') FROM dual
;
