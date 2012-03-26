--Add Credit Limit Check Behavior
ALTER TABLE C_POS ADD COLUMN IsAllowCreditExceeded CHARACTER(1) NOT NULL DEFAULT 'N'
;

-- Mar 26, 2012 11:03:44 AM ART
-- Add Credit Limit Check Behavior
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000032,'isallowcreditexceeded','LAR','isallowcreditexceeded','isallowcreditexceeded',0,TO_TIMESTAMP('2012-03-26 11:03:43','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-03-26 11:03:43','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- Mar 26, 2012 11:03:44 AM ART
-- Add Credit Limit Check Behavior
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000032 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 26, 2012 11:03:44 AM ART
-- Add Credit Limit Check Behavior
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000139,748,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000032,'N','Y','N','isallowcreditexceeded','isallowcreditexceeded',100,TO_TIMESTAMP('2012-03-26 11:03:43','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-03-26 11:03:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 26, 2012 11:03:44 AM ART
-- Add Credit Limit Check Behavior
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000139 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 26, 2012 11:05:23 AM ART
-- Add Credit Limit Check Behavior
UPDATE AD_Element SET ColumnName='IsAllowCreditExceeded', Name='IsAllowCreditExceeded', PrintName='IsAllowCreditExceeded',Updated=TO_TIMESTAMP('2012-03-26 11:05:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000032
;

-- Mar 26, 2012 11:05:23 AM ART
-- Add Credit Limit Check Behavior
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000032
;

-- Mar 26, 2012 11:05:23 AM ART
-- Add Credit Limit Check Behavior
UPDATE AD_Column SET ColumnName='IsAllowCreditExceeded', Name='IsAllowCreditExceeded', Description=NULL, Help=NULL WHERE AD_Element_ID=3000032
;

-- Mar 26, 2012 11:05:23 AM ART
-- Add Credit Limit Check Behavior
UPDATE AD_Process_Para SET ColumnName='IsAllowCreditExceeded', Name='IsAllowCreditExceeded', Description=NULL, Help=NULL, AD_Element_ID=3000032 WHERE UPPER(ColumnName)='ISALLOWCREDITLIMITEXCEEDED' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Mar 26, 2012 11:05:23 AM ART
-- Add Credit Limit Check Behavior
UPDATE AD_Process_Para SET ColumnName='IsAllowCreditExceeded', Name='IsAllowCreditExceeded', Description=NULL, Help=NULL WHERE AD_Element_ID=3000032 AND IsCentrallyMaintained='Y'
;

-- Mar 26, 2012 11:05:23 AM ART
-- Add Credit Limit Check Behavior
UPDATE AD_Field SET Name='IsAllowCreditExceeded', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000032) AND IsCentrallyMaintained='Y'
;

-- Mar 26, 2012 11:05:23 AM ART
-- Add Credit Limit Check Behavior
UPDATE AD_PrintFormatItem SET PrintName='IsAllowCreditExceeded', Name='IsAllowCreditExceeded' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000032)
;

-- Mar 26, 2012 11:07:12 AM ART
-- Add Credit Limit Check Behavior
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000086,1,'Y','N','N',3000139,'N','Y',676,'N','LAR','IsAllowCreditExceeded',100,0,'Y',TO_TIMESTAMP('2012-03-26 11:07:12','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2012-03-26 11:07:12','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 26, 2012 11:07:12 AM ART
-- Add Credit Limit Check Behavior
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000086 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 26, 2012 11:08:04 AM ART
-- Add Credit Limit Check Behavior
UPDATE AD_Field SET SeqNo=210,IsDisplayed='Y' WHERE AD_Field_ID=3000084
;

-- Mar 26, 2012 11:08:04 AM ART
-- Add Credit Limit Check Behavior
UPDATE AD_Field SET SeqNo=220,IsDisplayed='Y' WHERE AD_Field_ID=3000086
;

-- Mar 26, 2012 11:08:04 AM ART
-- Add Credit Limit Check Behavior
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000085
;

-- Mar 26, 2012 11:08:13 AM ART
-- Add Credit Limit Check Behavior
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2012-03-26 11:08:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000086
;

-- Mar 26, 2012 11:08:17 AM ART
-- Add Credit Limit Check Behavior
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2012-03-26 11:08:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000085
;
