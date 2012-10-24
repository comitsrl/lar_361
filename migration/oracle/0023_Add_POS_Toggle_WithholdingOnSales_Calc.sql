--Add toggle withholding on sales
ALTER TABLE C_POS ADD IsGenerateWithholdingOnSale CHARACTER(1) DEFAULT 'N' NOT NULL
;

-- Mar 26, 2012 5:32:39 PM GMT-03:00
-- Add toggle withholding on sales
INSERT INTO AD_Element (ColumnName,AD_Element_ID,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES ('isgeneratewithholdingonsale',3000036,'LAR','isgeneratewithholdingonsale','isgeneratewithholdingonsale',0,TO_DATE('2012-03-26 17:32:38','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2012-03-26 17:32:38','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- Mar 26, 2012 5:32:39 PM GMT-03:00
-- Add toggle withholding on sales
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Help,PO_Description,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Help,t.PO_Description,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3000036 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 26, 2012 5:32:40 PM GMT-03:00
-- Add toggle withholding on sales
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,Version,IsMandatory,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,CreatedBy,Updated,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3000144,748,'LAR',0,'Y','N','N','N',1,'N',20,'N',3000036,'N','Y','N','isgeneratewithholdingonsale','isgeneratewithholdingonsale',100,TO_DATE('2012-03-26 17:32:38','YYYY-MM-DD HH24:MI:SS'),0,0,'Y',TO_DATE('2012-03-26 17:32:38','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 26, 2012 5:32:40 PM GMT-03:00
-- Add toggle withholding on sales
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3000144 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 26, 2012 5:33:43 PM GMT-03:00
-- Add toggle withholding on sales
UPDATE AD_Element SET ColumnName='IsGenerateWithholdingOnSale', Name='IsGenerateWithholdingOnSale', PrintName='IsGenerateWithholdingOnSale',Updated=TO_DATE('2012-03-26 17:33:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3000036
;

-- Mar 26, 2012 5:33:43 PM GMT-03:00
-- Add toggle withholding on sales
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3000036
;

-- Mar 26, 2012 5:33:43 PM GMT-03:00
-- Add toggle withholding on sales
UPDATE AD_Column SET ColumnName='IsGenerateWithholdingOnSale', Name='IsGenerateWithholdingOnSale', Description=NULL, Help=NULL WHERE AD_Element_ID=3000036
;

-- Mar 26, 2012 5:33:43 PM GMT-03:00
-- Add toggle withholding on sales
UPDATE AD_Process_Para SET ColumnName='IsGenerateWithholdingOnSale', Name='IsGenerateWithholdingOnSale', Description=NULL, Help=NULL, AD_Element_ID=3000036 WHERE UPPER(ColumnName)='ISGENERATEWITHHOLDINGONSALE' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- Mar 26, 2012 5:33:43 PM GMT-03:00
-- Add toggle withholding on sales
UPDATE AD_Process_Para SET ColumnName='IsGenerateWithholdingOnSale', Name='IsGenerateWithholdingOnSale', Description=NULL, Help=NULL WHERE AD_Element_ID=3000036 AND IsCentrallyMaintained='Y'
;

-- Mar 26, 2012 5:33:43 PM GMT-03:00
-- Add toggle withholding on sales
UPDATE AD_Field SET Name='IsGenerateWithholdingOnSale', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3000036) AND IsCentrallyMaintained='Y'
;

-- Mar 26, 2012 5:33:43 PM GMT-03:00
-- Add toggle withholding on sales
UPDATE AD_PrintFormatItem pi SET PrintName='IsGenerateWithholdingOnSale', Name='IsGenerateWithholdingOnSale' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=pi.AD_Column_ID AND c.AD_Element_ID=3000036)
;

-- Mar 26, 2012 5:34:43 PM GMT-03:00
-- Add toggle withholding on sales
INSERT INTO AD_Field (IsEncrypted,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,AD_Field_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',1,'Y','N','N',3000144,'N','Y',676,3000087,'N','LAR','IsGenerateWithholdingOnSale',100,0,'Y',TO_DATE('2012-03-26 17:34:42','YYYY-MM-DD HH24:MI:SS'),0,100,TO_DATE('2012-03-26 17:34:42','YYYY-MM-DD HH24:MI:SS'))
;

-- Mar 26, 2012 5:34:43 PM GMT-03:00
-- Add toggle withholding on sales
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3000087 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 26, 2012 6:22:39 PM GMT-03:00
-- Add toggle withholding on sales
UPDATE AD_Field SET SeqNo=230,IsDisplayed='Y' WHERE AD_Field_ID=3000087
;

-- Mar 26, 2012 6:22:39 PM GMT-03:00
-- Add toggle withholding on sales
UPDATE AD_Field SET SeqNo=240,IsDisplayed='Y' WHERE AD_Field_ID=3000085
;

-- Mar 26, 2012 6:23:06 PM GMT-03:00
-- Add toggle withholding on sales
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_DATE('2012-03-26 18:23:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=3000085
;
