--Add Columns to C_Payment
ALTER TABLE C_Payment
ADD COLUMN TargetAccount		character varying(60),
ADD COLUMN isbounced 			Char(1) NULL DEFAULT 'N'::bpchar,
ADD COLUMN isdeposited 			Char(1) NULL DEFAULT 'N'::bpchar
;

-- 25/08/2012 11:06:07 ART
-- Modify On Drawer Checks Window
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000084,'TargetAccount','LAR','TargetAccount','TargetAccount',0,TO_TIMESTAMP('2012-08-25 11:06:07','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-08-25 11:06:07','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 25/08/2012 11:06:07 ART
-- Modify On Drawer Checks Window
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000084 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 25/08/2012 11:07:28 ART
-- Modify On Drawer Checks Window
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000085,'IsBounced','LAR','IsBounced','IsBounced',0,TO_TIMESTAMP('2012-08-25 11:07:28','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-08-25 11:07:28','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 25/08/2012 11:07:28 ART
-- Modify On Drawer Checks Window
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000085 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 25/08/2012 11:07:51 ART
-- Modify On Drawer Checks Window
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3000086,'IsDeposited','LAR','IsDeposited','IsDeposited',0,TO_TIMESTAMP('2012-08-25 11:07:51','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2012-08-25 11:07:51','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 25/08/2012 11:07:51 ART
-- Modify On Drawer Checks Window
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000086 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;


-- 14/05/2012 8:37:08 ART
-- Modify On Drawer Checks Window
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000273,335,'LAR',0,'N','N','N','N',60,'N',10,'N',3000084,'N','Y','N','targetaccount','targetaccount',0,TO_TIMESTAMP('2012-05-14 08:37:08','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-05-14 08:37:08','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 14/05/2012 8:37:08 ART
-- Modify On Drawer Checks Window
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000273 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/05/2012 8:37:09 ART
-- Modify On Drawer Checks Window
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000274,335,'LAR',0,'N','N','N','N',1,'N',20,'N',3000085,'N','Y','N','isbounced','isbounced',0,TO_TIMESTAMP('2012-05-14 08:37:08','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-05-14 08:37:08','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 14/05/2012 8:37:09 ART
-- Modify On Drawer Checks Window
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000274 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/05/2012 8:37:09 ART
-- Modify On Drawer Checks Window
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000275,335,'LAR',0,'N','N','N','N',1,'N',20,'N',3000086,'N','Y','N','isdeposited','isdeposited',0,TO_TIMESTAMP('2012-05-14 08:37:09','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_TIMESTAMP('2012-05-14 08:37:09','YYYY-MM-DD HH24:MI:SS'),0)
;

-- 14/05/2012 8:37:09 ART
-- Modify On Drawer Checks Window
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000275 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 14/05/2012 8:37:59 ART
-- Modify On Drawer Checks Window
UPDATE AD_Element SET ColumnName='IsBounced', Name='IsBounced', Description='Mark if the check was bounced.', PrintName='IsBounced',Updated=TO_TIMESTAMP('2012-05-14 08:37:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Element_ID=3000085
;

-- 14/05/2012 8:37:59 ART
-- Modify On Drawer Checks Window
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000085
;

-- 14/05/2012 8:37:59 ART
-- Modify On Drawer Checks Window
UPDATE AD_Column SET ColumnName='IsBounced', Name='IsBounced', Description='Mark if the check was bounced.', Help=NULL WHERE AD_Element_ID=3000085
;

-- 14/05/2012 8:37:59 ART
-- Modify On Drawer Checks Window
UPDATE AD_Process_Para SET ColumnName='IsBounced', Name='IsBounced', Description='Mark if the check was bounced.', Help=NULL, AD_Element_ID=3000085 WHERE UPPER(ColumnName)='ISBOUNCED' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 14/05/2012 8:37:59 ART
-- Modify On Drawer Checks Window
UPDATE AD_Process_Para SET ColumnName='IsBounced', Name='IsBounced', Description='Mark if the check was bounced.', Help=NULL WHERE AD_Element_ID=3000085 AND IsCentrallyMaintained='Y'
;

-- 14/05/2012 8:37:59 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET Name='IsBounced', Description='Mark if the check was bounced.', Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000085) AND IsCentrallyMaintained='Y'
;

-- 14/05/2012 8:37:59 ART
-- Modify On Drawer Checks Window
UPDATE AD_PrintFormatItem SET PrintName='IsBounced', Name='IsBounced' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000085)
;

-- 14/05/2012 8:38:23 ART
-- Modify On Drawer Checks Window
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_TIMESTAMP('2012-05-14 08:38:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000274
;

-- 14/05/2012 8:39:10 ART
-- Modify On Drawer Checks Window
UPDATE AD_Element SET ColumnName='IsDeposited', Name='IsDeposited', PrintName='IsDeposited',Updated=TO_TIMESTAMP('2012-05-14 08:39:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Element_ID=3000086
;

-- 14/05/2012 8:39:10 ART
-- Modify On Drawer Checks Window
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000086
;

-- 14/05/2012 8:39:10 ART
-- Modify On Drawer Checks Window
UPDATE AD_Column SET ColumnName='IsDeposited', Name='IsDeposited', Description=NULL, Help=NULL WHERE AD_Element_ID=3000086
;

-- 14/05/2012 8:39:10 ART
-- Modify On Drawer Checks Window
UPDATE AD_Process_Para SET ColumnName='IsDeposited', Name='IsDeposited', Description=NULL, Help=NULL, AD_Element_ID=3000086 WHERE UPPER(ColumnName)='ISDEPOSITED' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 14/05/2012 8:39:10 ART
-- Modify On Drawer Checks Window
UPDATE AD_Process_Para SET ColumnName='IsDeposited', Name='IsDeposited', Description=NULL, Help=NULL WHERE AD_Element_ID=3000086 AND IsCentrallyMaintained='Y'
;

-- 14/05/2012 8:39:10 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET Name='IsDeposited', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000086) AND IsCentrallyMaintained='Y'
;

-- 14/05/2012 8:39:10 ART
-- Modify On Drawer Checks Window
UPDATE AD_PrintFormatItem SET PrintName='IsDeposited', Name='IsDeposited' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000086)
;

-- 14/05/2012 8:39:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Element SET Description='Mark if a check was deposited.',Updated=TO_TIMESTAMP('2012-05-14 08:39:31','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Element_ID=3000086
;

-- 14/05/2012 8:39:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000086
;

-- 14/05/2012 8:39:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Column SET ColumnName='IsDeposited', Name='IsDeposited', Description='Mark if a check was deposited.', Help=NULL WHERE AD_Element_ID=3000086
;

-- 14/05/2012 8:39:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Process_Para SET ColumnName='IsDeposited', Name='IsDeposited', Description='Mark if a check was deposited.', Help=NULL, AD_Element_ID=3000086 WHERE UPPER(ColumnName)='ISDEPOSITED' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 14/05/2012 8:39:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Process_Para SET ColumnName='IsDeposited', Name='IsDeposited', Description='Mark if a check was deposited.', Help=NULL WHERE AD_Element_ID=3000086 AND IsCentrallyMaintained='Y'
;

-- 14/05/2012 8:39:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET Name='IsDeposited', Description='Mark if a check was deposited.', Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000086) AND IsCentrallyMaintained='Y'
;

-- 14/05/2012 8:40:22 ART
-- Modify On Drawer Checks Window
UPDATE AD_Element SET ColumnName='TargetAccount', Name='TargetAccount', Description='Account where the check was deposited.', PrintName='TargetAccount',Updated=TO_TIMESTAMP('2012-05-14 08:40:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Element_ID=3000084
;

-- 14/05/2012 8:40:22 ART
-- Modify On Drawer Checks Window
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000084
;

-- 14/05/2012 8:40:22 ART
-- Modify On Drawer Checks Window
UPDATE AD_Column SET ColumnName='TargetAccount', Name='TargetAccount', Description='Account where the check was deposited.', Help=NULL WHERE AD_Element_ID=3000084
;

-- 14/05/2012 8:40:22 ART
-- Modify On Drawer Checks Window
UPDATE AD_Process_Para SET ColumnName='TargetAccount', Name='TargetAccount', Description='Account where the check was deposited.', Help=NULL, AD_Element_ID=3000084 WHERE UPPER(ColumnName)='TARGETACCOUNT' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 14/05/2012 8:40:22 ART
-- Modify On Drawer Checks Window
UPDATE AD_Process_Para SET ColumnName='TargetAccount', Name='TargetAccount', Description='Account where the check was deposited.', Help=NULL WHERE AD_Element_ID=3000084 AND IsCentrallyMaintained='Y'
;

-- 14/05/2012 8:40:22 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET Name='TargetAccount', Description='Account where the check was deposited.', Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000084) AND IsCentrallyMaintained='Y'
;

-- 14/05/2012 8:40:22 ART
-- Modify On Drawer Checks Window
UPDATE AD_PrintFormatItem SET PrintName='TargetAccount', Name='TargetAccount' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3000084)
;

-- 14/05/2012 8:41:21 ART
-- Modify On Drawer Checks Window
UPDATE AD_Tab SET WhereClause='IsReceipt=''Y'' AND C_BPartner_ID is not null AND TenderType=''K'' AND IsReconciled=''N'' AND Docstatus !=''DR''',Updated=TO_TIMESTAMP('2012-05-14 08:41:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Tab_ID=3000018
;

-- 14/05/2012 8:41:37 ART
-- Modify On Drawer Checks Window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000609,1,'Y','N','N',3000274,'N','Y',3000018,'N','LAR','Mark if the check was bounced.','IsBounced',0,0,TO_TIMESTAMP('2012-05-14 08:41:36','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_TIMESTAMP('2012-05-14 08:41:36','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/05/2012 8:41:37 ART
-- Modify On Drawer Checks Window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000609 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/05/2012 8:41:37 ART
-- Modify On Drawer Checks Window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000610,1,'Y','N','N',3000275,'N','Y',3000018,'N','LAR','Mark if a check was deposited.','IsDeposited',0,0,TO_TIMESTAMP('2012-05-14 08:41:37','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_TIMESTAMP('2012-05-14 08:41:37','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/05/2012 8:41:37 ART
-- Modify On Drawer Checks Window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000610 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/05/2012 8:41:37 ART
-- Modify On Drawer Checks Window
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Description,Name,UpdatedBy,AD_Org_ID,Created,IsActive,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3000611,60,'Y','N','N',3000273,'N','Y',3000018,'N','LAR','Account where the check was deposited.','TargetAccount',0,0,TO_TIMESTAMP('2012-05-14 08:41:37','YYYY-MM-DD HH24:MI:SS'),'Y',0,0,TO_TIMESTAMP('2012-05-14 08:41:37','YYYY-MM-DD HH24:MI:SS'))
;

-- 14/05/2012 8:41:37 ART
-- Modify On Drawer Checks Window
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000611 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000554
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000593
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000553
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=280,IsDisplayed='Y' WHERE AD_Field_ID=3000555
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=290,IsDisplayed='Y' WHERE AD_Field_ID=3000556
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=300,IsDisplayed='Y' WHERE AD_Field_ID=3000557
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=310,IsDisplayed='Y' WHERE AD_Field_ID=3000558
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=320,IsDisplayed='Y' WHERE AD_Field_ID=3000559
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=330,IsDisplayed='Y' WHERE AD_Field_ID=3000560
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=340,IsDisplayed='Y' WHERE AD_Field_ID=3000561
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=350,IsDisplayed='Y' WHERE AD_Field_ID=3000562
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=360,IsDisplayed='Y' WHERE AD_Field_ID=3000563
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=370,IsDisplayed='Y' WHERE AD_Field_ID=3000564
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=380,IsDisplayed='Y' WHERE AD_Field_ID=3000565
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=390,IsDisplayed='Y' WHERE AD_Field_ID=3000566
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=400,IsDisplayed='Y' WHERE AD_Field_ID=3000567
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=410,IsDisplayed='Y' WHERE AD_Field_ID=3000568
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=420,IsDisplayed='Y' WHERE AD_Field_ID=3000569
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=430,IsDisplayed='Y' WHERE AD_Field_ID=3000570
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=440,IsDisplayed='Y' WHERE AD_Field_ID=3000571
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=450,IsDisplayed='Y' WHERE AD_Field_ID=3000572
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=460,IsDisplayed='Y' WHERE AD_Field_ID=3000573
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=470,IsDisplayed='Y' WHERE AD_Field_ID=3000574
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=480,IsDisplayed='Y' WHERE AD_Field_ID=3000575
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=490,IsDisplayed='Y' WHERE AD_Field_ID=3000576
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=500,IsDisplayed='Y' WHERE AD_Field_ID=3000577
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=510,IsDisplayed='Y' WHERE AD_Field_ID=3000578
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=520,IsDisplayed='Y' WHERE AD_Field_ID=3000579
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=530,IsDisplayed='Y' WHERE AD_Field_ID=3000580
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=540,IsDisplayed='Y' WHERE AD_Field_ID=3000581
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=550,IsDisplayed='Y' WHERE AD_Field_ID=3000582
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=560,IsDisplayed='Y' WHERE AD_Field_ID=3000583
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=570,IsDisplayed='Y' WHERE AD_Field_ID=3000584
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=580,IsDisplayed='Y' WHERE AD_Field_ID=3000585
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=590,IsDisplayed='Y' WHERE AD_Field_ID=3000586
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=600,IsDisplayed='Y' WHERE AD_Field_ID=3000587
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=610,IsDisplayed='Y' WHERE AD_Field_ID=3000588
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000589
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000590
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000591
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000592
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000595
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3000609
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=3000610
;

-- 14/05/2012 8:43:31 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=690,IsDisplayed='Y' WHERE AD_Field_ID=3000611
;

-- 14/05/2012 8:43:50 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2012-05-14 08:43:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000592
;

-- 14/05/2012 8:43:56 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET IsSameLine='N',Updated=TO_TIMESTAMP('2012-05-14 08:43:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000595
;

-- 14/05/2012 8:47:25 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET DisplayLogic='@TenderType@=''K''',Updated=TO_TIMESTAMP('2012-05-14 08:47:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000595
;

-- 14/05/2012 8:47:36 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3000589
;

-- 14/05/2012 8:47:36 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=620,IsDisplayed='Y' WHERE AD_Field_ID=3000590
;

-- 14/05/2012 8:47:36 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=630,IsDisplayed='Y' WHERE AD_Field_ID=3000591
;

-- 14/05/2012 8:47:36 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=640,IsDisplayed='Y' WHERE AD_Field_ID=3000592
;

-- 14/05/2012 8:47:36 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=650,IsDisplayed='Y' WHERE AD_Field_ID=3000595
;

-- 14/05/2012 8:47:36 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=660,IsDisplayed='Y' WHERE AD_Field_ID=3000609
;

-- 14/05/2012 8:47:36 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=670,IsDisplayed='Y' WHERE AD_Field_ID=3000610
;

-- 14/05/2012 8:47:36 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET SeqNo=680,IsDisplayed='Y' WHERE AD_Field_ID=3000611
;

-- 14/05/2012 8:48:53 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET IsSameLine='Y', DisplayLogic='@IsOnDrawer@=''N'' & @IsDeposited@=''N''',Updated=TO_TIMESTAMP('2012-05-14 08:48:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000609
;

-- 14/05/2012 8:49:22 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET DisplayLogic='@IsOnDrawer@=''N'' & @IsBounced@=''N''',Updated=TO_TIMESTAMP('2012-05-14 08:49:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000610
;

-- 14/05/2012 8:49:34 ART
-- Modify On Drawer Checks Window
UPDATE AD_Field SET IsSameLine='Y', DisplayLogic='@IsOnDrawer@=''N'' & @IsDeposited@=''Y''',Updated=TO_TIMESTAMP('2012-05-14 08:49:34','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Field_ID=3000611
;

-- 14/05/2012 8:50:23 ART
-- Modify On Drawer Checks Window
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_TIMESTAMP('2012-05-14 08:50:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000273
;

-- 14/05/2012 8:50:36 ART
-- Modify On Drawer Checks Window
UPDATE AD_Column SET IsAlwaysUpdateable='Y',Updated=TO_TIMESTAMP('2012-05-14 08:50:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=0 WHERE AD_Column_ID=3000275
;

