-- Enhancements made by Red1
-- http://sourceforge.net/projects/adempiere/files/Documentation/All%20Documents/JavaPOS.pdf/download

-- Mar 21, 2010 6:01:33 PM EST
-- Java POS enhancements
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,Description,EntityType,Help,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,54134,0,'OSK_KeyLayout_ID',TO_TIMESTAMP('2010-03-21 18:01:25','YYYY-MM-DD HH24:MI:SS'),100,'The key layout to use for on screen keyboard for text fields.','D','If empty, the on screen keyboard will not be used.','Y','On Screen Keyboard layout','On Screen Keyboard layout',TO_TIMESTAMP('2010-03-21 18:01:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 6:01:33 PM EST
-- Java POS enhancements
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=54134 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 21, 2010 6:03:06 PM EST
-- Java POS enhancements
INSERT INTO AD_Reference (AD_Client_ID,AD_Org_ID,AD_Reference_ID,Created,CreatedBy,EntityType,IsActive,IsOrderByValue,Name,Updated,UpdatedBy,ValidationType) VALUES (0,0,53350,TO_TIMESTAMP('2010-03-21 18:02:58','YYYY-MM-DD HH24:MI:SS'),100,'D','Y','N','C_POSKeyLayout',TO_TIMESTAMP('2010-03-21 18:02:58','YYYY-MM-DD HH24:MI:SS'),100,'T')
;

-- Mar 21, 2010 6:03:06 PM EST
-- Java POS enhancements
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=53350 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- Mar 21, 2010 6:03:47 PM EST
-- Java POS enhancements
INSERT INTO AD_Ref_Table (AD_Client_ID,AD_Display,AD_Key,AD_Org_ID,AD_Reference_ID,AD_Table_ID,Created,CreatedBy,EntityType,IsActive,IsValueDisplayed,Updated,UpdatedBy,WhereClause) VALUES (0,12762,12758,0,53350,749,TO_TIMESTAMP('2010-03-21 18:03:47','YYYY-MM-DD HH24:MI:SS'),100,'D','Y','N',TO_TIMESTAMP('2010-03-21 18:03:47','YYYY-MM-DD HH24:MI:SS'),100,'C_POSKeyLayout.IsActive=''Y''')
;

-- Mar 21, 2010 6:04:37 PM EST
-- Java POS enhancements
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Reference_Value_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,59091,54134,0,18,53350,748,'OSK_KeyLayout_ID',TO_TIMESTAMP('2010-03-21 18:04:35','YYYY-MM-DD HH24:MI:SS'),100,'The key layout to use for on screen keyboard for text fields.','D',22,'If empty, the on screen keyboard will not be used.','Y','Y','N','N','N','N','N','N','N','N','N','N','Y','On Screen Keyboard layout',0,TO_TIMESTAMP('2010-03-21 18:04:35','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Mar 21, 2010 6:04:37 PM EST
-- Java POS enhancements
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59091 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 21, 2010 6:04:41 PM EST
-- Java POS enhancements
ALTER TABLE C_POS ADD COLUMN OSK_KeyLayout_ID NUMERIC(10) DEFAULT NULL 
;

-- Mar 21, 2010 6:06:03 PM EST
-- Java POS enhancements
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,Description,EntityType,Help,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,54135,0,'OSNP_KeyLayout_ID',TO_TIMESTAMP('2010-03-21 18:06:02','YYYY-MM-DD HH24:MI:SS'),100,'The key layout to use for on screen number pad for numeric fields.','D','If empty, the on screen numberpad will not be used.','Y','On Screen Number Pad layout','On Screen Number Pad layout',TO_TIMESTAMP('2010-03-21 18:06:02','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 6:06:03 PM EST
-- Java POS enhancements
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=54135 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 21, 2010 6:06:54 PM EST
-- Java POS enhancements
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Reference_Value_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,59092,54135,0,18,53350,748,'OSNP_KeyLayout_ID',TO_TIMESTAMP('2010-03-21 18:06:53','YYYY-MM-DD HH24:MI:SS'),100,'The key layout to use for on screen number pad for numeric fields.','D',22,'If empty, the on screen numberpad will not be used.','Y','Y','N','N','N','N','N','N','N','N','N','N','Y','On Screen Number Pad layout',0,TO_TIMESTAMP('2010-03-21 18:06:53','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Mar 21, 2010 6:06:54 PM EST
-- Java POS enhancements
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59092 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 21, 2010 6:06:56 PM EST
-- Java POS enhancements
ALTER TABLE C_POS ADD COLUMN OSNP_KeyLayout_ID NUMERIC(10) DEFAULT NULL 
;

-- Mar 21, 2010 6:11:36 PM EST
-- Java POS enhancements
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,Description,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,54136,0,'SubKeyLayout_ID',TO_TIMESTAMP('2010-03-21 18:11:35','YYYY-MM-DD HH24:MI:SS'),100,'Key Layout to be displayed when this key is pressed','D','Y','Key Layout','Key Layout',TO_TIMESTAMP('2010-03-21 18:11:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 6:11:36 PM EST
-- Java POS enhancements
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=54136 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 21, 2010 6:12:24 PM EST
-- Java POS enhancements
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Reference_Value_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,59093,54136,0,18,53350,750,'SubKeyLayout_ID',TO_TIMESTAMP('2010-03-21 18:12:23','YYYY-MM-DD HH24:MI:SS'),100,'Key Layout to be displayed when this key is pressed','D',22,'Y','Y','N','N','N','N','N','N','N','N','N','N','Y','Key Layout',0,TO_TIMESTAMP('2010-03-21 18:12:23','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Mar 21, 2010 6:12:24 PM EST
-- Java POS enhancements
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59093 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 21, 2010 6:12:26 PM EST
-- Java POS enhancements
ALTER TABLE C_POSKey ADD COLUMN SubKeyLayout_ID NUMERIC(10) DEFAULT NULL 
;

-- Mar 21, 2010 6:13:03 PM EST
-- Java POS enhancements
UPDATE AD_Column SET IsMandatory='N',Updated=TO_TIMESTAMP('2010-03-21 18:13:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=12773
;

-- Mar 21, 2010 6:13:07 PM EST
-- Java POS enhancements
INSERT INTO t_alter_column values('c_poskey','M_Product_ID','NUMERIC(10)',null,'NULL')
;

-- Mar 21, 2010 6:13:07 PM EST
-- Java POS enhancements
INSERT INTO t_alter_column values('c_poskey','M_Product_ID',null,'NULL',null)
;

-- Mar 21, 2010 6:13:22 PM EST
-- Java POS enhancements
UPDATE AD_Column SET IsMandatory='N',Updated=TO_TIMESTAMP('2010-03-21 18:13:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=12780
;

-- Mar 21, 2010 6:13:23 PM EST
-- Java POS enhancements
INSERT INTO t_alter_column values('c_poskey','Qty','NUMERIC',null,'NULL')
;

-- Mar 21, 2010 6:13:23 PM EST
-- Java POS enhancements
INSERT INTO t_alter_column values('c_poskey','Qty',null,'NULL',null)
;

-- Mar 21, 2010 6:25:18 PM EST
-- Java POS enhancements
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,59094,53475,0,10,750,'Text',TO_TIMESTAMP('2010-03-21 18:25:17','YYYY-MM-DD HH24:MI:SS'),100,'D',22,'Y','Y','N','N','N','N','N','N','N','N','N','N','Y','Text',0,TO_TIMESTAMP('2010-03-21 18:25:17','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Mar 21, 2010 6:25:18 PM EST
-- Java POS enhancements
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59094 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 21, 2010 6:25:20 PM EST
-- Java POS enhancements
ALTER TABLE C_POSKey ADD COLUMN Text VARCHAR(22) DEFAULT NULL 
;

-- Mar 21, 2010 6:27:36 PM EST
-- Java POS enhancements
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,Description,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,54137,0,'SpanX',TO_TIMESTAMP('2010-03-21 18:27:35','YYYY-MM-DD HH24:MI:SS'),100,'Number of columns spanned','D','Y','Column span','Column span',TO_TIMESTAMP('2010-03-21 18:27:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 6:27:36 PM EST
-- Java POS enhancements
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=54137 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 21, 2010 6:27:57 PM EST
-- Java POS enhancements
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,Description,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,54138,0,'SpanY',TO_TIMESTAMP('2010-03-21 18:27:56','YYYY-MM-DD HH24:MI:SS'),100,'Number of rows spanned','D','Y','Row Span','Row Span',TO_TIMESTAMP('2010-03-21 18:27:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 6:27:57 PM EST
-- Java POS enhancements
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=54138 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 21, 2010 6:28:34 PM EST
-- Java POS enhancements
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,59095,54137,0,11,750,'SpanX',TO_TIMESTAMP('2010-03-21 18:28:33','YYYY-MM-DD HH24:MI:SS'),100,'Number of columns spanned','D',10,'Y','Y','N','N','N','N','N','N','N','N','N','N','Y','Column span',0,TO_TIMESTAMP('2010-03-21 18:28:33','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Mar 21, 2010 6:28:34 PM EST
-- Java POS enhancements
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59095 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 21, 2010 6:28:36 PM EST
-- Java POS enhancements
ALTER TABLE C_POSKey ADD COLUMN SpanX NUMERIC(10) DEFAULT NULL 
;

-- Mar 21, 2010 6:28:53 PM EST
-- Java POS enhancements
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,59096,54138,0,11,750,'SpanY',TO_TIMESTAMP('2010-03-21 18:28:53','YYYY-MM-DD HH24:MI:SS'),100,'Number of rows spanned','D',10,'Y','Y','N','N','N','N','N','N','N','N','N','N','Y','Row Span',0,TO_TIMESTAMP('2010-03-21 18:28:53','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Mar 21, 2010 6:28:54 PM EST
-- Java POS enhancements
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59096 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 21, 2010 6:28:55 PM EST
-- Java POS enhancements
ALTER TABLE C_POSKey ADD COLUMN SpanY NUMERIC(10) DEFAULT NULL 
;

-- Mar 21, 2010 6:32:16 PM EST
-- Java POS enhancements
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,59097,1639,0,19,750,'AD_Image_ID',TO_TIMESTAMP('2010-03-21 18:32:15','YYYY-MM-DD HH24:MI:SS'),100,'Image or Icon','D',22,'Images and Icon can be used to display supported graphic formats (gif, jpg, png).
You can either load the image (in the database) or point to a graphic via a URI (i.e. it can point to a resource, http address)','Y','Y','N','N','N','N','N','N','N','N','N','N','Y','Image',0,TO_TIMESTAMP('2010-03-21 18:32:15','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Mar 21, 2010 6:32:16 PM EST
-- Java POS enhancements
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59097 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 21, 2010 6:32:19 PM EST
-- Java POS enhancements
ALTER TABLE C_POSKey ADD COLUMN AD_Image_ID NUMERIC(10) DEFAULT NULL 
;

-- Mar 21, 2010 6:34:18 PM EST
-- Java POS enhancements
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,59098,1789,0,19,750,'AD_PrintFont_ID',TO_TIMESTAMP('2010-03-21 18:34:17','YYYY-MM-DD HH24:MI:SS'),100,'Maintain Print Font','D',22,'Font used for printing','Y','Y','N','N','N','N','N','N','N','N','N','N','Y','Print Font',0,TO_TIMESTAMP('2010-03-21 18:34:17','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Mar 21, 2010 6:34:18 PM EST
-- Java POS enhancements
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59098 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 21, 2010 6:34:20 PM EST
-- Java POS enhancements
ALTER TABLE C_POSKey ADD COLUMN AD_PrintFont_ID NUMERIC(10) DEFAULT NULL 
;

-- Mar 21, 2010 6:38:39 PM EST
-- Java POS enhancements
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,Description,EntityType,Help,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,54139,0,'Columns',TO_TIMESTAMP('2010-03-21 18:38:38','YYYY-MM-DD HH24:MI:SS'),100,'Number of columns','D','The number of columns in the layout grid','Y','Columns','Columns',TO_TIMESTAMP('2010-03-21 18:38:38','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 6:38:39 PM EST
-- Java POS enhancements
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=54139 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 21, 2010 6:39:00 PM EST
-- Java POS enhancements
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,59099,54139,0,11,749,'Columns',TO_TIMESTAMP('2010-03-21 18:38:59','YYYY-MM-DD HH24:MI:SS'),100,'Number of columns','D',10,'The number of columns in the layout grid','Y','Y','N','N','N','N','N','N','N','N','N','N','Y','Columns',0,TO_TIMESTAMP('2010-03-21 18:38:59','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Mar 21, 2010 6:39:00 PM EST
-- Java POS enhancements
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59099 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 21, 2010 6:39:01 PM EST
-- Java POS enhancements
ALTER TABLE C_POSKeyLayout ADD COLUMN Columns NUMERIC(10) DEFAULT NULL 
;

-- Mar 21, 2010 6:43:12 PM EST
-- Java POS enhancements
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,Description,EntityType,Help,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,54140,0,'POSKeyLayoutType',TO_TIMESTAMP('2010-03-21 18:43:11','YYYY-MM-DD HH24:MI:SS'),100,'The type of Key Layout','D','Keyboard: used for POS text field on screen keyboard
Numberpad: used for POS numeric field on screen numberpad
Product: used to quickly add products to POS order','Y','POS Key Layout Type','POS Key Layout Type',TO_TIMESTAMP('2010-03-21 18:43:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 6:43:12 PM EST
-- Java POS enhancements
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=54140 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 21, 2010 6:43:59 PM EST
-- Java POS enhancements
INSERT INTO AD_Reference (AD_Client_ID,AD_Org_ID,AD_Reference_ID,Created,CreatedBy,Description,EntityType,IsActive,IsOrderByValue,Name,Updated,UpdatedBy,ValidationType) VALUES (0,0,53351,TO_TIMESTAMP('2010-03-21 18:43:58','YYYY-MM-DD HH24:MI:SS'),100,'POS Key layout types','D','Y','N','POSKeyLayoutType',TO_TIMESTAMP('2010-03-21 18:43:58','YYYY-MM-DD HH24:MI:SS'),100,'L')
;

-- Mar 21, 2010 6:43:59 PM EST
-- Java POS enhancements
INSERT INTO AD_Reference_Trl (AD_Language,AD_Reference_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Reference_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Reference t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Reference_ID=53351 AND NOT EXISTS (SELECT * FROM AD_Reference_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Reference_ID=t.AD_Reference_ID)
;

-- Mar 21, 2010 6:44:14 PM EST
-- Java POS enhancements
INSERT INTO AD_Ref_List (AD_Client_ID,AD_Org_ID,AD_Reference_ID,AD_Ref_List_ID,Created,CreatedBy,EntityType,IsActive,Name,Updated,UpdatedBy,Value) VALUES (0,0,53351,53578,TO_TIMESTAMP('2010-03-21 18:44:13','YYYY-MM-DD HH24:MI:SS'),100,'D','Y','Keyboard',TO_TIMESTAMP('2010-03-21 18:44:13','YYYY-MM-DD HH24:MI:SS'),100,'K')
;

-- Mar 21, 2010 6:44:14 PM EST
-- Java POS enhancements
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=53578 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 21, 2010 6:44:23 PM EST
-- Java POS enhancements
INSERT INTO AD_Ref_List (AD_Client_ID,AD_Org_ID,AD_Reference_ID,AD_Ref_List_ID,Created,CreatedBy,EntityType,IsActive,Name,Updated,UpdatedBy,Value) VALUES (0,0,53351,53579,TO_TIMESTAMP('2010-03-21 18:44:22','YYYY-MM-DD HH24:MI:SS'),100,'D','Y','Numberpad',TO_TIMESTAMP('2010-03-21 18:44:22','YYYY-MM-DD HH24:MI:SS'),100,'N')
;

-- Mar 21, 2010 6:44:23 PM EST
-- Java POS enhancements
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=53579 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 21, 2010 6:44:31 PM EST
-- Java POS enhancements
INSERT INTO AD_Ref_List (AD_Client_ID,AD_Org_ID,AD_Reference_ID,AD_Ref_List_ID,Created,CreatedBy,EntityType,IsActive,Name,Updated,UpdatedBy,Value) VALUES (0,0,53351,53580,TO_TIMESTAMP('2010-03-21 18:44:31','YYYY-MM-DD HH24:MI:SS'),100,'D','Y','Product',TO_TIMESTAMP('2010-03-21 18:44:31','YYYY-MM-DD HH24:MI:SS'),100,'P')
;

-- Mar 21, 2010 6:44:31 PM EST
-- Java POS enhancements
INSERT INTO AD_Ref_List_Trl (AD_Language,AD_Ref_List_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Ref_List_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Ref_List t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Ref_List_ID=53580 AND NOT EXISTS (SELECT * FROM AD_Ref_List_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Ref_List_ID=t.AD_Ref_List_ID)
;

-- Mar 21, 2010 6:44:48 PM EST
-- Java POS enhancements
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Reference_Value_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,59100,54140,0,17,53351,749,'POSKeyLayoutType',TO_TIMESTAMP('2010-03-21 18:44:47','YYYY-MM-DD HH24:MI:SS'),100,'The type of Key Layout','D',1,'Keyboard: used for POS text field on screen keyboard
Numberpad: used for POS numeric field on screen numberpad
Product: used to quickly add products to POS order','Y','Y','N','N','N','N','N','N','N','N','N','N','Y','POS Key Layout Type',0,TO_TIMESTAMP('2010-03-21 18:44:47','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Mar 21, 2010 6:44:48 PM EST
-- Java POS enhancements
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59100 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 21, 2010 6:44:49 PM EST
-- Java POS enhancements
ALTER TABLE C_POSKeyLayout ADD COLUMN POSKeyLayoutType CHAR(1) DEFAULT NULL 
;

-- Mar 21, 2010 6:45:41 PM EST
-- Java POS enhancements
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,59101,1788,0,19,749,'AD_PrintColor_ID',TO_TIMESTAMP('2010-03-21 18:45:40','YYYY-MM-DD HH24:MI:SS'),100,'Color used for printing and display','D',22,'Colors used for printing and display','Y','Y','N','N','N','N','N','N','N','N','N','N','Y','Print Color',0,TO_TIMESTAMP('2010-03-21 18:45:40','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Mar 21, 2010 6:45:41 PM EST
-- Java POS enhancements
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59101 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 21, 2010 6:45:42 PM EST
-- Java POS enhancements
ALTER TABLE C_POSKeyLayout ADD COLUMN AD_PrintColor_ID NUMERIC(10) DEFAULT NULL 
;

-- Mar 21, 2010 6:46:04 PM EST
-- Java POS enhancements
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,59102,1789,0,19,749,'AD_PrintFont_ID',TO_TIMESTAMP('2010-03-21 18:46:03','YYYY-MM-DD HH24:MI:SS'),100,'Maintain Print Font','D',22,'Font used for printing','Y','Y','N','N','N','N','N','N','N','N','N','N','Y','Print Font',0,TO_TIMESTAMP('2010-03-21 18:46:03','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Mar 21, 2010 6:46:04 PM EST
-- Java POS enhancements
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59102 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 21, 2010 6:46:06 PM EST
-- Java POS enhancements
ALTER TABLE C_POSKeyLayout ADD COLUMN AD_PrintFont_ID NUMERIC(10) DEFAULT NULL 
;

-- Mar 21, 2010 7:40:14 PM EST
-- Java POS enhancements
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,Description,EntityType,Help,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,2210,0,'AutoLogoutTime',TO_TIMESTAMP('2003-10-07 15:10:01','YYYY-MM-DD HH24:MI:SS'),0,'Automatic logout if inactive for this many seconds.','D','Automatic logout disabled if zero.','Y','Auto Logout time','Auto Logout time',TO_TIMESTAMP('2000-01-02 00:00:00','YYYY-MM-DD HH24:MI:SS'),0)
;

-- Mar 21, 2010 7:42:33 PM EST
-- Java POS enhancements
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,Description,EntityType,Help,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,54141,0,'AutoLogoutDelay',TO_TIMESTAMP('2010-03-21 19:42:32','YYYY-MM-DD HH24:MI:SS'),100,'Automatically logout if terminal inactive for this period','D','Measured in seconds, zero for no automatic logout','Y','Auto Logout Delay','Auto Logout Delay',TO_TIMESTAMP('2010-03-21 19:42:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 7:42:33 PM EST
-- Java POS enhancements
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=54141 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Mar 21, 2010 7:42:59 PM EST
-- Java POS enhancements
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,Description,EntityType,FieldLength,Help,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,59103,54141,0,11,748,'AutoLogoutDelay',TO_TIMESTAMP('2010-03-21 19:42:58','YYYY-MM-DD HH24:MI:SS'),100,'Automatically logout if terminal inactive for this period','D',10,'Measured in seconds, zero for no automatic logout','Y','Y','N','N','N','N','N','N','N','N','N','N','Y','Auto Logout Delay',0,TO_TIMESTAMP('2010-03-21 19:42:58','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Mar 21, 2010 7:42:59 PM EST
-- Java POS enhancements
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=59103 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Mar 21, 2010 7:43:01 PM EST
-- Java POS enhancements
ALTER TABLE C_POS ADD COLUMN AutoLogoutDelay NUMERIC(10) DEFAULT NULL 
;

-- Mar 21, 2010 7:43:53 PM EST
-- Java POS enhancements
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,59103,58808,0,676,TO_TIMESTAMP('2010-03-21 19:43:52','YYYY-MM-DD HH24:MI:SS'),100,'Automatically logout if terminal inactive for this period',10,'D','Measured in seconds, zero for no automatic logout','Y','Y','Y','N','N','N','N','N','Auto Logout Delay',TO_TIMESTAMP('2010-03-21 19:43:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 7:43:53 PM EST
-- Java POS enhancements
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=58808 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 21, 2010 7:43:54 PM EST
-- Java POS enhancements
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,59091,58809,0,676,TO_TIMESTAMP('2010-03-21 19:43:53','YYYY-MM-DD HH24:MI:SS'),100,'The key layout to use for on screen keyboard for text fields.',22,'D','If empty, the on screen keyboard will not be used.','Y','Y','Y','N','N','N','N','N','On Screen Keyboard layout',TO_TIMESTAMP('2010-03-21 19:43:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 7:43:54 PM EST
-- Java POS enhancements
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=58809 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 21, 2010 7:43:55 PM EST
-- Java POS enhancements
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,59092,58810,0,676,TO_TIMESTAMP('2010-03-21 19:43:54','YYYY-MM-DD HH24:MI:SS'),100,'The key layout to use for on screen number pad for numeric fields.',22,'D','If empty, the on screen numberpad will not be used.','Y','Y','Y','N','N','N','N','N','On Screen Number Pad layout',TO_TIMESTAMP('2010-03-21 19:43:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 7:43:55 PM EST
-- Java POS enhancements
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=58810 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 21, 2010 7:44:35 PM EST
-- Java POS enhancements
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=58808
;

-- Mar 21, 2010 7:44:35 PM EST
-- Java POS enhancements
UPDATE AD_Field SET SeqNo=170,IsDisplayed='Y' WHERE AD_Field_ID=58809
;

-- Mar 21, 2010 7:44:35 PM EST
-- Java POS enhancements
UPDATE AD_Field SET SeqNo=180,IsDisplayed='Y' WHERE AD_Field_ID=58810
;

-- Mar 21, 2010 7:44:35 PM EST
-- Java POS enhancements
UPDATE AD_Field SET SeqNo=190,IsDisplayed='Y' WHERE AD_Field_ID=10803
;

-- Mar 21, 2010 7:44:35 PM EST
-- Java POS enhancements
UPDATE AD_Field SET SeqNo=200,IsDisplayed='Y' WHERE AD_Field_ID=52017
;

-- Mar 21, 2010 7:44:48 PM EST
-- Java POS enhancements
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2010-03-21 19:44:48','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=58808
;

-- Mar 21, 2010 7:44:51 PM EST
-- Java POS enhancements
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2010-03-21 19:44:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=58810
;

-- Mar 21, 2010 7:45:11 PM EST
-- Java POS enhancements
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,59099,58811,0,677,TO_TIMESTAMP('2010-03-21 19:45:11','YYYY-MM-DD HH24:MI:SS'),100,'Number of columns',10,'D','The number of columns in the layout grid','Y','Y','Y','N','N','N','N','N','Columns',TO_TIMESTAMP('2010-03-21 19:45:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 7:45:11 PM EST
-- Java POS enhancements
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=58811 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 21, 2010 7:45:12 PM EST
-- Java POS enhancements
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,59100,58812,0,677,TO_TIMESTAMP('2010-03-21 19:45:11','YYYY-MM-DD HH24:MI:SS'),100,'The type of Key Layout',1,'D','Keyboard: used for POS text field on screen keyboard
Numberpad: used for POS numeric field on screen numberpad
Product: used to quickly add products to POS order','Y','Y','Y','N','N','N','N','N','POS Key Layout Type',TO_TIMESTAMP('2010-03-21 19:45:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 7:45:12 PM EST
-- Java POS enhancements
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=58812 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 21, 2010 7:45:13 PM EST
-- Java POS enhancements
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,59101,58813,0,677,TO_TIMESTAMP('2010-03-21 19:45:12','YYYY-MM-DD HH24:MI:SS'),100,'Color used for printing and display',22,'D','Colors used for printing and display','Y','Y','Y','N','N','N','N','N','Print Color',TO_TIMESTAMP('2010-03-21 19:45:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 7:45:13 PM EST
-- Java POS enhancements
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=58813 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 21, 2010 7:45:14 PM EST
-- Java POS enhancements
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,59102,58814,0,677,TO_TIMESTAMP('2010-03-21 19:45:13','YYYY-MM-DD HH24:MI:SS'),100,'Maintain Print Font',22,'D','Font used for printing','Y','Y','Y','N','N','N','N','N','Print Font',TO_TIMESTAMP('2010-03-21 19:45:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 7:45:14 PM EST
-- Java POS enhancements
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=58814 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 21, 2010 7:45:29 PM EST
-- Java POS enhancements
UPDATE AD_Field SET SeqNo=70,IsDisplayed='Y' WHERE AD_Field_ID=58812
;

-- Mar 21, 2010 7:45:29 PM EST
-- Java POS enhancements
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=58811
;

-- Mar 21, 2010 7:45:29 PM EST
-- Java POS enhancements
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=58813
;

-- Mar 21, 2010 7:45:29 PM EST
-- Java POS enhancements
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=58814
;

-- Mar 21, 2010 7:45:55 PM EST
-- Java POS enhancements
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2010-03-21 19:45:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=58811
;

-- Mar 21, 2010 7:45:59 PM EST
-- Java POS enhancements
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2010-03-21 19:45:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=58814
;

-- Mar 21, 2010 7:46:34 PM EST
-- Java POS enhancements
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,59095,58815,0,678,TO_TIMESTAMP('2010-03-21 19:46:33','YYYY-MM-DD HH24:MI:SS'),100,'Number of columns spanned',10,'D','Y','Y','Y','N','N','N','N','N','Column span',TO_TIMESTAMP('2010-03-21 19:46:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 7:46:34 PM EST
-- Java POS enhancements
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=58815 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 21, 2010 7:46:35 PM EST
-- Java POS enhancements
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,59097,58816,0,678,TO_TIMESTAMP('2010-03-21 19:46:34','YYYY-MM-DD HH24:MI:SS'),100,'Image or Icon',22,'D','Images and Icon can be used to display supported graphic formats (gif, jpg, png).
You can either load the image (in the database) or point to a graphic via a URI (i.e. it can point to a resource, http address)','Y','Y','Y','N','N','N','N','N','Image',TO_TIMESTAMP('2010-03-21 19:46:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 7:46:35 PM EST
-- Java POS enhancements
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=58816 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 21, 2010 7:46:36 PM EST
-- Java POS enhancements
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,59093,58817,0,678,TO_TIMESTAMP('2010-03-21 19:46:35','YYYY-MM-DD HH24:MI:SS'),100,'Key Layout to be displayed when this key is pressed',22,'D','Y','Y','Y','N','N','N','N','N','Key Layout',TO_TIMESTAMP('2010-03-21 19:46:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 7:46:36 PM EST
-- Java POS enhancements
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=58817 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 21, 2010 7:46:37 PM EST
-- Java POS enhancements
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,Help,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,59098,58818,0,678,TO_TIMESTAMP('2010-03-21 19:46:36','YYYY-MM-DD HH24:MI:SS'),100,'Maintain Print Font',22,'D','Font used for printing','Y','Y','Y','N','N','N','N','N','Print Font',TO_TIMESTAMP('2010-03-21 19:46:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 7:46:37 PM EST
-- Java POS enhancements
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=58818 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 21, 2010 7:46:39 PM EST
-- Java POS enhancements
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,Description,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,59096,58819,0,678,TO_TIMESTAMP('2010-03-21 19:46:37','YYYY-MM-DD HH24:MI:SS'),100,'Number of rows spanned',10,'D','Y','Y','Y','N','N','N','N','N','Row Span',TO_TIMESTAMP('2010-03-21 19:46:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 7:46:39 PM EST
-- Java POS enhancements
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=58819 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 21, 2010 7:46:40 PM EST
-- Java POS enhancements
INSERT INTO AD_Field (AD_Client_ID,AD_Column_ID,AD_Field_ID,AD_Org_ID,AD_Tab_ID,Created,CreatedBy,DisplayLength,EntityType,IsActive,IsCentrallyMaintained,IsDisplayed,IsEncrypted,IsFieldOnly,IsHeading,IsReadOnly,IsSameLine,Name,Updated,UpdatedBy) VALUES (0,59094,58820,0,678,TO_TIMESTAMP('2010-03-21 19:46:39','YYYY-MM-DD HH24:MI:SS'),100,22,'D','Y','Y','Y','N','N','N','N','N','Text',TO_TIMESTAMP('2010-03-21 19:46:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 7:46:40 PM EST
-- Java POS enhancements
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=58820 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- Mar 21, 2010 7:48:01 PM EST
-- Java POS enhancements
UPDATE AD_Field SET SeqNo=80,IsDisplayed='Y' WHERE AD_Field_ID=58817
;

-- Mar 21, 2010 7:48:01 PM EST
-- Java POS enhancements
UPDATE AD_Field SET SeqNo=90,IsDisplayed='Y' WHERE AD_Field_ID=10790
;

-- Mar 21, 2010 7:48:01 PM EST
-- Java POS enhancements
UPDATE AD_Field SET SeqNo=100,IsDisplayed='Y' WHERE AD_Field_ID=10794
;

-- Mar 21, 2010 7:48:01 PM EST
-- Java POS enhancements
UPDATE AD_Field SET SeqNo=110,IsDisplayed='Y' WHERE AD_Field_ID=58820
;

-- Mar 21, 2010 7:48:01 PM EST
-- Java POS enhancements
UPDATE AD_Field SET SeqNo=120,IsDisplayed='Y' WHERE AD_Field_ID=10808
;

-- Mar 21, 2010 7:48:01 PM EST
-- Java POS enhancements
UPDATE AD_Field SET SeqNo=130,IsDisplayed='Y' WHERE AD_Field_ID=58818
;

-- Mar 21, 2010 7:48:01 PM EST
-- Java POS enhancements
UPDATE AD_Field SET SeqNo=140,IsDisplayed='Y' WHERE AD_Field_ID=58815
;

-- Mar 21, 2010 7:48:01 PM EST
-- Java POS enhancements
UPDATE AD_Field SET SeqNo=150,IsDisplayed='Y' WHERE AD_Field_ID=58819
;

-- Mar 21, 2010 7:48:01 PM EST
-- Java POS enhancements
UPDATE AD_Field SET SeqNo=160,IsDisplayed='Y' WHERE AD_Field_ID=58816
;

-- Mar 21, 2010 7:48:39 PM EST
-- Java POS enhancements
UPDATE AD_Field SET DisplayLogic='@POSKeyLayoutType@=''P''',Updated=TO_TIMESTAMP('2010-03-21 19:48:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=10790
;

-- Mar 21, 2010 7:48:42 PM EST
-- Java POS enhancements
UPDATE AD_Field SET DisplayLogic='@POSKeyLayoutType@=''P''',Updated=TO_TIMESTAMP('2010-03-21 19:48:42','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=10794
;

-- Mar 21, 2010 7:48:57 PM EST
-- Java POS enhancements
UPDATE AD_Field SET DisplayLogic='@POSKeyLayoutType@!''P''',Updated=TO_TIMESTAMP('2010-03-21 19:48:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=58820
;

-- Mar 21, 2010 7:49:22 PM EST
-- Java POS enhancements
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2010-03-21 19:49:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=58818
;

-- Mar 21, 2010 7:49:26 PM EST
-- Java POS enhancements
UPDATE AD_Field SET IsSameLine='Y',Updated=TO_TIMESTAMP('2010-03-21 19:49:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Field_ID=58819
;

-- Mar 21, 2010 7:51:37 PM EST
-- Java POS enhancements
UPDATE AD_Column SET DefaultValue='@SQL=SELECT NVL(MAX(SeqNo),0)+10 AS DefaultValue FROM C_POSKey WHERE C_PosKeyLayout_ID=@C_PosKeyLayout_ID@',Updated=TO_TIMESTAMP('2010-03-21 19:51:37','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=12769
;

-- Mar 21, 2010 7:52:54 PM EST
-- Java POS enhancements
INSERT INTO AD_Tab (AD_Client_ID,AD_ColumnSortOrder_ID,AD_ColumnSortYesNo_ID,AD_Org_ID,AD_Tab_ID,AD_Table_ID,AD_Window_ID,Created,CreatedBy,Description,EntityType,HasTree,ImportFields,IsActive,IsAdvancedTab,IsInfoTab,IsInsertRecord,IsReadOnly,IsSingleRow,IsSortTab,IsTranslationTab,Name,Processing,SeqNo,TabLevel,Updated,UpdatedBy) VALUES (0,12769,12774,0,53311,750,339,TO_TIMESTAMP('2010-03-21 19:52:53','YYYY-MM-DD HH24:MI:SS'),100,'Key Sequence','D','N','N','Y','N','N','N','N','N','Y','N','Key Sequence','N',15,0,TO_TIMESTAMP('2010-03-21 19:52:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 7:52:54 PM EST
-- Java POS enhancements
INSERT INTO AD_Tab_Trl (AD_Language,AD_Tab_ID, CommitWarning,Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Tab_ID, t.CommitWarning,t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Tab t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Tab_ID=53311 AND NOT EXISTS (SELECT * FROM AD_Tab_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Tab_ID=t.AD_Tab_ID)
;

-- Mar 21, 2010 7:56:57 PM EST
-- Java POS enhancements
UPDATE AD_Tab SET TabLevel=1,Updated=TO_TIMESTAMP('2010-03-21 19:56:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Tab_ID=53311
;

-- Mar 21, 2010 8:24:52 PM EST
-- Java POS enhancements
UPDATE AD_Column SET DefaultValue='@SQL=SELECT NVL(MAX(SeqNo),0)+10 AS DefaultValue FROM C_POSKey WHERE C_POSKeyLayout_ID=@C_POSKeyLayout_ID@',Updated=TO_TIMESTAMP('2010-03-21 20:24:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=12769
;

-- Mar 21, 2010 8:25:21 PM EST
-- Java POS enhancements
UPDATE AD_Column SET DefaultValue='-1',Updated=TO_TIMESTAMP('2010-03-21 20:25:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=12784
;

-- Mar 21, 2010 8:25:24 PM EST
-- Java POS enhancements
UPDATE AD_Column SET DefaultValue='-1',Updated=TO_TIMESTAMP('2010-03-21 20:25:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=59098
;

-- Mar 21, 2010 7:56:26 PM EST
-- Java POS enhancements
UPDATE C_POSKeyLayout SET AD_PrintColor_ID=111, AD_PrintFont_ID=129, Columns=3, POSKeyLayoutType='P',Updated=TO_TIMESTAMP('2010-03-21 19:56:26','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKeyLayout_ID=100
;

-- Mar 21, 2010 8:19:55 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET AD_PrintColor_ID=103,Updated=TO_TIMESTAMP('2010-03-21 20:19:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=102
;

-- Mar 21, 2010 8:21:08 PM EST
-- Java POS enhancements
INSERT INTO C_POSKeyLayout (AD_Client_ID,AD_Org_ID,AD_PrintColor_ID,AD_PrintFont_ID,Columns,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,POSKeyLayoutType,Updated,UpdatedBy) VALUES (11,0,109,129,10,50000,TO_TIMESTAMP('2010-03-21 20:21:06','YYYY-MM-DD HH24:MI:SS'),100,'Y','Keyboard (en_US)','K',TO_TIMESTAMP('2010-03-21 20:21:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:21:56 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50000,50000,TO_TIMESTAMP('2010-03-21 20:21:55','YYYY-MM-DD HH24:MI:SS'),100,'Y','q',0,0,0,0,'q',TO_TIMESTAMP('2010-03-21 20:21:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:22:24 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,AD_PrintColor_ID,AD_PrintFont_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,100,130,50001,50000,TO_TIMESTAMP('2010-03-21 20:22:23','YYYY-MM-DD HH24:MI:SS'),100,'Y','w',0,1,0,0,'w',TO_TIMESTAMP('2010-03-21 20:22:23','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:22:45 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,Description,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Updated,UpdatedBy) VALUES (11,0,50002,50000,TO_TIMESTAMP('2010-03-21 20:22:44','YYYY-MM-DD HH24:MI:SS'),100,'e','Y','e',0,2,0,0,TO_TIMESTAMP('2010-03-21 20:22:44','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:23:41 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET AD_PrintColor_ID=NULL, AD_PrintFont_ID=NULL,Updated=TO_TIMESTAMP('2010-03-21 20:23:41','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50001
;

-- Mar 21, 2010 8:26:05 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50003,50000,TO_TIMESTAMP('2010-03-21 20:26:03','YYYY-MM-DD HH24:MI:SS'),100,'Y','r',0,30,0,0,'r',TO_TIMESTAMP('2010-03-21 20:26:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:28:40 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50004,50000,TO_TIMESTAMP('2010-03-21 20:28:39','YYYY-MM-DD HH24:MI:SS'),100,'Y','t',0,40,0,0,'t',TO_TIMESTAMP('2010-03-21 20:28:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:28:46 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50005,50000,TO_TIMESTAMP('2010-03-21 20:28:45','YYYY-MM-DD HH24:MI:SS'),100,'Y','y',0,50,0,0,'y',TO_TIMESTAMP('2010-03-21 20:28:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:28:50 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50006,50000,TO_TIMESTAMP('2010-03-21 20:28:49','YYYY-MM-DD HH24:MI:SS'),100,'Y','u',0,60,0,0,'u',TO_TIMESTAMP('2010-03-21 20:28:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:28:55 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50007,50000,TO_TIMESTAMP('2010-03-21 20:28:54','YYYY-MM-DD HH24:MI:SS'),100,'Y','i',0,70,0,0,'i',TO_TIMESTAMP('2010-03-21 20:28:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:29:02 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50008,50000,TO_TIMESTAMP('2010-03-21 20:29:00','YYYY-MM-DD HH24:MI:SS'),100,'Y','o',0,80,0,0,'o',TO_TIMESTAMP('2010-03-21 20:29:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:29:06 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50009,50000,TO_TIMESTAMP('2010-03-21 20:29:05','YYYY-MM-DD HH24:MI:SS'),100,'Y','p',0,90,0,0,'p',TO_TIMESTAMP('2010-03-21 20:29:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:29:13 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50010,50000,TO_TIMESTAMP('2010-03-21 20:29:11','YYYY-MM-DD HH24:MI:SS'),100,'Y','a',0,100,0,0,'a',TO_TIMESTAMP('2010-03-21 20:29:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:29:18 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50011,50000,TO_TIMESTAMP('2010-03-21 20:29:17','YYYY-MM-DD HH24:MI:SS'),100,'Y','s',0,110,0,0,'s',TO_TIMESTAMP('2010-03-21 20:29:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:29:23 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50012,50000,TO_TIMESTAMP('2010-03-21 20:29:21','YYYY-MM-DD HH24:MI:SS'),100,'Y','d',0,120,0,0,'d',TO_TIMESTAMP('2010-03-21 20:29:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:29:27 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50013,50000,TO_TIMESTAMP('2010-03-21 20:29:26','YYYY-MM-DD HH24:MI:SS'),100,'Y','f',0,130,0,0,'f',TO_TIMESTAMP('2010-03-21 20:29:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:29:34 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50014,50000,TO_TIMESTAMP('2010-03-21 20:29:31','YYYY-MM-DD HH24:MI:SS'),100,'Y','g',0,140,0,0,'g',TO_TIMESTAMP('2010-03-21 20:29:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:29:39 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50015,50000,TO_TIMESTAMP('2010-03-21 20:29:38','YYYY-MM-DD HH24:MI:SS'),100,'Y','h',0,150,0,0,'h',TO_TIMESTAMP('2010-03-21 20:29:38','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:29:44 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50016,50000,TO_TIMESTAMP('2010-03-21 20:29:43','YYYY-MM-DD HH24:MI:SS'),100,'Y','j',0,160,0,0,'j',TO_TIMESTAMP('2010-03-21 20:29:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:29:50 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50017,50000,TO_TIMESTAMP('2010-03-21 20:29:48','YYYY-MM-DD HH24:MI:SS'),100,'Y','k',0,170,0,0,'k',TO_TIMESTAMP('2010-03-21 20:29:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:29:58 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50018,50000,TO_TIMESTAMP('2010-03-21 20:29:57','YYYY-MM-DD HH24:MI:SS'),100,'Y','l',0,180,0,0,'l',TO_TIMESTAMP('2010-03-21 20:29:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:41:51 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50019,50000,TO_TIMESTAMP('2010-03-21 20:41:50','YYYY-MM-DD HH24:MI:SS'),100,'Y','z',0,190,0,0,'z',TO_TIMESTAMP('2010-03-21 20:41:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:41:58 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50020,50000,TO_TIMESTAMP('2010-03-21 20:41:56','YYYY-MM-DD HH24:MI:SS'),100,'Y','x',0,200,0,0,'x',TO_TIMESTAMP('2010-03-21 20:41:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:42:03 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50021,50000,TO_TIMESTAMP('2010-03-21 20:42:02','YYYY-MM-DD HH24:MI:SS'),100,'Y','c',0,210,0,0,'c',TO_TIMESTAMP('2010-03-21 20:42:02','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:42:09 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50022,50000,TO_TIMESTAMP('2010-03-21 20:42:08','YYYY-MM-DD HH24:MI:SS'),100,'Y','v',0,220,0,0,'v',TO_TIMESTAMP('2010-03-21 20:42:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:42:14 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50023,50000,TO_TIMESTAMP('2010-03-21 20:42:13','YYYY-MM-DD HH24:MI:SS'),100,'Y','b',0,230,0,0,'b',TO_TIMESTAMP('2010-03-21 20:42:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:42:20 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50024,50000,TO_TIMESTAMP('2010-03-21 20:42:18','YYYY-MM-DD HH24:MI:SS'),100,'Y','n',0,240,0,0,'n',TO_TIMESTAMP('2010-03-21 20:42:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:42:33 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50025,50000,TO_TIMESTAMP('2010-03-21 20:42:32','YYYY-MM-DD HH24:MI:SS'),100,'Y','m',0,250,0,0,'m',TO_TIMESTAMP('2010-03-21 20:42:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:43:25 PM EST
-- Java POS enhancements
UPDATE C_POSKeyLayout SET Name='Keyboard lowercase (en_US)',Updated=TO_TIMESTAMP('2010-03-21 20:43:25','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKeyLayout_ID=50000
;

-- Mar 21, 2010 8:43:34 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50026,50000,TO_TIMESTAMP('2010-03-21 20:43:34','YYYY-MM-DD HH24:MI:SS'),100,'Y','1',0,260,0,0,'1',TO_TIMESTAMP('2010-03-21 20:43:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:43:39 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50027,50000,TO_TIMESTAMP('2010-03-21 20:43:38','YYYY-MM-DD HH24:MI:SS'),100,'Y','2',0,270,0,0,'2',TO_TIMESTAMP('2010-03-21 20:43:38','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:43:43 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50028,50000,TO_TIMESTAMP('2010-03-21 20:43:42','YYYY-MM-DD HH24:MI:SS'),100,'Y','3',0,280,0,0,'3',TO_TIMESTAMP('2010-03-21 20:43:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:43:48 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50029,50000,TO_TIMESTAMP('2010-03-21 20:43:47','YYYY-MM-DD HH24:MI:SS'),100,'Y','4',0,290,0,0,'4',TO_TIMESTAMP('2010-03-21 20:43:47','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:43:52 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50030,50000,TO_TIMESTAMP('2010-03-21 20:43:51','YYYY-MM-DD HH24:MI:SS'),100,'Y','5',0,300,0,0,'5',TO_TIMESTAMP('2010-03-21 20:43:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:43:57 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50031,50000,TO_TIMESTAMP('2010-03-21 20:43:56','YYYY-MM-DD HH24:MI:SS'),100,'Y','6',0,310,0,0,'6',TO_TIMESTAMP('2010-03-21 20:43:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:44:01 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50032,50000,TO_TIMESTAMP('2010-03-21 20:44:00','YYYY-MM-DD HH24:MI:SS'),100,'Y','7',0,320,0,0,'7',TO_TIMESTAMP('2010-03-21 20:44:00','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:44:06 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50033,50000,TO_TIMESTAMP('2010-03-21 20:44:05','YYYY-MM-DD HH24:MI:SS'),100,'Y','8',0,330,0,0,'8',TO_TIMESTAMP('2010-03-21 20:44:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:44:10 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50034,50000,TO_TIMESTAMP('2010-03-21 20:44:10','YYYY-MM-DD HH24:MI:SS'),100,'Y','9',0,340,0,0,'9',TO_TIMESTAMP('2010-03-21 20:44:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:44:16 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50035,50000,TO_TIMESTAMP('2010-03-21 20:44:15','YYYY-MM-DD HH24:MI:SS'),100,'Y','0',0,350,0,0,'0',TO_TIMESTAMP('2010-03-21 20:44:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:52:42 PM EST
-- Java POS enhancements
INSERT INTO C_POSKeyLayout (AD_Client_ID,AD_Org_ID,AD_PrintColor_ID,AD_PrintFont_ID,Columns,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,POSKeyLayoutType,Updated,UpdatedBy) VALUES (11,11,113,129,10,50001,TO_TIMESTAMP('2010-03-21 20:52:41','YYYY-MM-DD HH24:MI:SS'),100,'Y','Keyboard UPPERCASE (en_US)','K',TO_TIMESTAMP('2010-03-21 20:52:41','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:52:55 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50036,50001,TO_TIMESTAMP('2010-03-21 20:52:54','YYYY-MM-DD HH24:MI:SS'),100,'Y','Q',0,10,0,0,'Q',TO_TIMESTAMP('2010-03-21 20:52:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:53:00 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50037,50001,TO_TIMESTAMP('2010-03-21 20:52:59','YYYY-MM-DD HH24:MI:SS'),100,'Y','W',0,20,0,0,'W',TO_TIMESTAMP('2010-03-21 20:52:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:53:05 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50038,50001,TO_TIMESTAMP('2010-03-21 20:53:04','YYYY-MM-DD HH24:MI:SS'),100,'Y','E',0,30,0,0,'E',TO_TIMESTAMP('2010-03-21 20:53:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:53:09 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50039,50001,TO_TIMESTAMP('2010-03-21 20:53:08','YYYY-MM-DD HH24:MI:SS'),100,'Y','R',0,40,0,0,'R',TO_TIMESTAMP('2010-03-21 20:53:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:53:14 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50040,50001,TO_TIMESTAMP('2010-03-21 20:53:13','YYYY-MM-DD HH24:MI:SS'),100,'Y','T',0,50,0,0,'T',TO_TIMESTAMP('2010-03-21 20:53:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:53:18 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50041,50001,TO_TIMESTAMP('2010-03-21 20:53:18','YYYY-MM-DD HH24:MI:SS'),100,'Y','Y',0,60,0,0,'Y',TO_TIMESTAMP('2010-03-21 20:53:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:53:23 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50042,50001,TO_TIMESTAMP('2010-03-21 20:53:22','YYYY-MM-DD HH24:MI:SS'),100,'Y','U',0,70,0,0,'U',TO_TIMESTAMP('2010-03-21 20:53:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:53:29 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50043,50001,TO_TIMESTAMP('2010-03-21 20:53:27','YYYY-MM-DD HH24:MI:SS'),100,'Y','I',0,80,0,0,'I',TO_TIMESTAMP('2010-03-21 20:53:27','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:53:34 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50044,50001,TO_TIMESTAMP('2010-03-21 20:53:33','YYYY-MM-DD HH24:MI:SS'),100,'Y','O',0,90,0,0,'O',TO_TIMESTAMP('2010-03-21 20:53:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:53:40 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50045,50001,TO_TIMESTAMP('2010-03-21 20:53:37','YYYY-MM-DD HH24:MI:SS'),100,'Y','P',0,100,0,0,'P',TO_TIMESTAMP('2010-03-21 20:53:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:53:44 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50046,50001,TO_TIMESTAMP('2010-03-21 20:53:44','YYYY-MM-DD HH24:MI:SS'),100,'Y','A',0,110,0,0,'A',TO_TIMESTAMP('2010-03-21 20:53:44','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:53:50 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50047,50001,TO_TIMESTAMP('2010-03-21 20:53:48','YYYY-MM-DD HH24:MI:SS'),100,'Y','S',0,120,0,0,'S',TO_TIMESTAMP('2010-03-21 20:53:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:53:54 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50048,50001,TO_TIMESTAMP('2010-03-21 20:53:53','YYYY-MM-DD HH24:MI:SS'),100,'Y','D',0,130,0,0,'D',TO_TIMESTAMP('2010-03-21 20:53:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:53:58 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50049,50001,TO_TIMESTAMP('2010-03-21 20:53:57','YYYY-MM-DD HH24:MI:SS'),100,'Y','F',0,140,0,0,'F',TO_TIMESTAMP('2010-03-21 20:53:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:54:03 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50050,50001,TO_TIMESTAMP('2010-03-21 20:54:02','YYYY-MM-DD HH24:MI:SS'),100,'Y','G',0,150,0,0,'G',TO_TIMESTAMP('2010-03-21 20:54:02','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:54:08 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50051,50001,TO_TIMESTAMP('2010-03-21 20:54:07','YYYY-MM-DD HH24:MI:SS'),100,'Y','H',0,160,0,0,'H',TO_TIMESTAMP('2010-03-21 20:54:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:54:13 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50052,50001,TO_TIMESTAMP('2010-03-21 20:54:12','YYYY-MM-DD HH24:MI:SS'),100,'Y','J',0,170,0,0,'J',TO_TIMESTAMP('2010-03-21 20:54:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:54:17 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50053,50001,TO_TIMESTAMP('2010-03-21 20:54:16','YYYY-MM-DD HH24:MI:SS'),100,'Y','K',0,180,0,0,'K',TO_TIMESTAMP('2010-03-21 20:54:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:54:21 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50054,50001,TO_TIMESTAMP('2010-03-21 20:54:21','YYYY-MM-DD HH24:MI:SS'),100,'Y','L',0,190,0,0,'L',TO_TIMESTAMP('2010-03-21 20:54:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:54:26 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50055,50001,TO_TIMESTAMP('2010-03-21 20:54:25','YYYY-MM-DD HH24:MI:SS'),100,'Y','Z',0,200,0,0,'Z',TO_TIMESTAMP('2010-03-21 20:54:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 8:54:31 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50056,50001,TO_TIMESTAMP('2010-03-21 20:54:30','YYYY-MM-DD HH24:MI:SS'),100,'Y','X',0,210,0,0,'X',TO_TIMESTAMP('2010-03-21 20:54:30','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:32:08 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50057,50001,TO_TIMESTAMP('2010-03-21 21:32:06','YYYY-MM-DD HH24:MI:SS'),100,'Y','C',0,220,0,0,'C',TO_TIMESTAMP('2010-03-21 21:32:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:32:12 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50058,50001,TO_TIMESTAMP('2010-03-21 21:32:11','YYYY-MM-DD HH24:MI:SS'),100,'Y','V',0,230,0,0,'V',TO_TIMESTAMP('2010-03-21 21:32:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:32:17 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50059,50001,TO_TIMESTAMP('2010-03-21 21:32:16','YYYY-MM-DD HH24:MI:SS'),100,'Y','B',0,240,0,0,'B',TO_TIMESTAMP('2010-03-21 21:32:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:32:21 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50060,50001,TO_TIMESTAMP('2010-03-21 21:32:21','YYYY-MM-DD HH24:MI:SS'),100,'Y','N',0,250,0,0,'N',TO_TIMESTAMP('2010-03-21 21:32:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:32:26 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50061,50001,TO_TIMESTAMP('2010-03-21 21:32:25','YYYY-MM-DD HH24:MI:SS'),100,'Y','M',0,260,0,0,'M',TO_TIMESTAMP('2010-03-21 21:32:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:33:07 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,SubKeyLayout_ID,Text,Updated,UpdatedBy) VALUES (11,11,50062,50001,TO_TIMESTAMP('2010-03-21 21:33:06','YYYY-MM-DD HH24:MI:SS'),100,'Y','abc',0,270,0,0,50000,NULL,TO_TIMESTAMP('2010-03-21 21:33:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:33:18 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50063,50001,TO_TIMESTAMP('2010-03-21 21:33:17','YYYY-MM-DD HH24:MI:SS'),100,'Y','SPACE',0,280,0,0,' ',TO_TIMESTAMP('2010-03-21 21:33:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:33:39 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,SubKeyLayout_ID,Updated,UpdatedBy) VALUES (11,0,50064,50000,TO_TIMESTAMP('2010-03-21 21:33:38','YYYY-MM-DD HH24:MI:SS'),100,'Y','ABC',0,360,0,0,50001,TO_TIMESTAMP('2010-03-21 21:33:38','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:33:49 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,0,50065,50000,TO_TIMESTAMP('2010-03-21 21:33:48','YYYY-MM-DD HH24:MI:SS'),100,'Y','SPACE',0,370,0,0,' ',TO_TIMESTAMP('2010-03-21 21:33:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:34:21 PM EST
-- Java POS enhancements
UPDATE C_POS SET OSK_KeyLayout_ID=50000,Updated=TO_TIMESTAMP('2010-03-21 21:34:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POS_ID=100
;

-- Mar 21, 2010 9:34:48 PM EST
-- Java POS enhancements
INSERT INTO C_POSKeyLayout (AD_Client_ID,AD_Org_ID,AD_PrintColor_ID,AD_PrintFont_ID,Columns,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,POSKeyLayoutType,Updated,UpdatedBy) VALUES (11,11,100,130,0,50002,TO_TIMESTAMP('2010-03-21 21:34:48','YYYY-MM-DD HH24:MI:SS'),100,'Y','Numberpad','N',TO_TIMESTAMP('2010-03-21 21:34:48','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:34:53 PM EST
-- Java POS enhancements
UPDATE C_POSKeyLayout SET AD_PrintFont_ID=129,Updated=TO_TIMESTAMP('2010-03-21 21:34:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKeyLayout_ID=50002
;

-- Mar 21, 2010 9:35:10 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50066,50002,TO_TIMESTAMP('2010-03-21 21:35:09','YYYY-MM-DD HH24:MI:SS'),100,'Y','7',0,10,0,0,'7',TO_TIMESTAMP('2010-03-21 21:35:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:35:14 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50067,50002,TO_TIMESTAMP('2010-03-21 21:35:14','YYYY-MM-DD HH24:MI:SS'),100,'Y','8',0,20,0,0,'8',TO_TIMESTAMP('2010-03-21 21:35:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:35:19 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50068,50002,TO_TIMESTAMP('2010-03-21 21:35:18','YYYY-MM-DD HH24:MI:SS'),100,'Y','9',0,30,0,0,'9',TO_TIMESTAMP('2010-03-21 21:35:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:35:26 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50069,50002,TO_TIMESTAMP('2010-03-21 21:35:25','YYYY-MM-DD HH24:MI:SS'),100,'Y','4',0,40,0,0,'4',TO_TIMESTAMP('2010-03-21 21:35:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:35:31 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50070,50002,TO_TIMESTAMP('2010-03-21 21:35:30','YYYY-MM-DD HH24:MI:SS'),100,'Y','5',0,50,0,0,'5',TO_TIMESTAMP('2010-03-21 21:35:30','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:35:36 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50071,50002,TO_TIMESTAMP('2010-03-21 21:35:35','YYYY-MM-DD HH24:MI:SS'),100,'Y','6',0,60,0,0,'6',TO_TIMESTAMP('2010-03-21 21:35:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:35:41 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50072,50002,TO_TIMESTAMP('2010-03-21 21:35:40','YYYY-MM-DD HH24:MI:SS'),100,'Y','1',0,70,0,0,'1',TO_TIMESTAMP('2010-03-21 21:35:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:35:46 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50073,50002,TO_TIMESTAMP('2010-03-21 21:35:45','YYYY-MM-DD HH24:MI:SS'),100,'Y','2',0,80,0,0,'2',TO_TIMESTAMP('2010-03-21 21:35:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:35:51 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50074,50002,TO_TIMESTAMP('2010-03-21 21:35:50','YYYY-MM-DD HH24:MI:SS'),100,'Y','3',0,90,0,0,'3',TO_TIMESTAMP('2010-03-21 21:35:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:36:05 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50075,50002,TO_TIMESTAMP('2010-03-21 21:36:04','YYYY-MM-DD HH24:MI:SS'),100,'Y','C',0,100,0,0,'C',TO_TIMESTAMP('2010-03-21 21:36:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:36:12 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50076,50002,TO_TIMESTAMP('2010-03-21 21:36:11','YYYY-MM-DD HH24:MI:SS'),100,'Y','0',0,110,0,0,'0',TO_TIMESTAMP('2010-03-21 21:36:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:36:22 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50077,50002,TO_TIMESTAMP('2010-03-21 21:36:22','YYYY-MM-DD HH24:MI:SS'),100,'Y','.',0,120,0,0,'.',TO_TIMESTAMP('2010-03-21 21:36:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 9:36:30 PM EST
-- Java POS enhancements
UPDATE C_POSKeyLayout SET Columns=3,Updated=TO_TIMESTAMP('2010-03-21 21:36:30','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKeyLayout_ID=50002
;
-- Mar 21, 2010 9:40:12 PM EST
-- Java POS enhancements
UPDATE C_POS SET OSNP_KeyLayout_ID=50002,Updated=TO_TIMESTAMP('2010-03-21 21:40:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POS_ID=100
;

-- Mar 21, 2010 9:40:21 PM EST
-- Java POS enhancements
DELETE FROM PP_MRP WHERE C_OrderLine_ID=? AND AD_Client_ID=?
;

-- Mar 21, 2010 9:40:21 PM EST
-- Java POS enhancements
DELETE FROM C_OrderLine WHERE C_OrderLine_ID=1000001
;

-- Mar 21, 2010 9:40:21 PM EST
-- Java POS enhancements
DELETE FROM C_OrderTax WHERE C_Order_ID=1000001 AND C_Tax_ID=105
;

-- Mar 21, 2010 9:40:21 PM EST
-- Java POS enhancements
UPDATE C_Order SET TotalLines=(SELECT COALESCE(SUM(LineNetAmt),0) FROM C_OrderLine il WHERE C_Order.C_Order_ID=il.C_Order_ID) WHERE C_Order_ID=1000001
;

-- Mar 21, 2010 9:40:21 PM EST
-- Java POS enhancements
UPDATE C_Order SET GrandTotal=TotalLines+(SELECT COALESCE(SUM(TaxAmt),0) FROM C_OrderTax it WHERE C_Order.C_Order_ID=it.C_Order_ID) WHERE C_Order_ID=1000001
;

-- Mar 21, 2010 9:40:21 PM EST
-- Java POS enhancements
DELETE FROM PP_MRP WHERE C_Order_ID=? AND AD_Client_ID=?
;

-- Mar 21, 2010 9:40:21 PM EST
-- Java POS enhancements
DELETE FROM AD_Attachment WHERE AD_Table_ID=? AND Record_ID IN (SELECT C_OrderLine_ID FROM C_OrderLine WHERE C_Order_ID=?)
;

-- Mar 21, 2010 9:40:21 PM EST
-- Java POS enhancements
DELETE FROM AD_Archive WHERE AD_Table_ID=? AND Record_ID IN (SELECT C_OrderLine_ID FROM C_OrderLine WHERE C_Order_ID=?)
;

-- Mar 21, 2010 9:40:21 PM EST
-- Java POS enhancements
DELETE FROM K_Index WHERE AD_Table_ID=? AND Record_ID IN (SELECT C_OrderLine_ID FROM C_OrderLine WHERE C_Order_ID=?)
;

-- Mar 21, 2010 9:40:21 PM EST
-- Java POS enhancements
DELETE FROM AD_Note WHERE AD_Table_ID=? AND Record_ID IN (SELECT C_OrderLine_ID FROM C_OrderLine WHERE C_Order_ID=?)
;

-- Mar 21, 2010 9:40:21 PM EST
-- Java POS enhancements
DELETE FROM C_Order WHERE C_Order_ID=1000001
;

-- Mar 21, 2010 9:41:49 PM EST
-- Java POS enhancements
UPDATE C_POSKeyLayout SET AD_PrintColor_ID=103,Updated=TO_TIMESTAMP('2010-03-21 21:41:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKeyLayout_ID=50002
;

-- Mar 21, 2010 10:50:02 PM EST
-- Java POS enhancements
UPDATE C_POSKeyLayout SET AD_PrintColor_ID=109,Updated=TO_TIMESTAMP('2010-03-21 22:50:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKeyLayout_ID=50001
;

-- Mar 21, 2010 10:50:19 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50078,50001,TO_TIMESTAMP('2010-03-21 22:50:18','YYYY-MM-DD HH24:MI:SS'),100,'Y','1',0,290,0,0,'1',TO_TIMESTAMP('2010-03-21 22:50:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 10:50:24 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50079,50001,TO_TIMESTAMP('2010-03-21 22:50:23','YYYY-MM-DD HH24:MI:SS'),100,'Y','2',0,300,0,0,'2',TO_TIMESTAMP('2010-03-21 22:50:23','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 10:50:33 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50080,50001,TO_TIMESTAMP('2010-03-21 22:50:32','YYYY-MM-DD HH24:MI:SS'),100,'Y','3',0,310,0,0,'3',TO_TIMESTAMP('2010-03-21 22:50:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 10:50:41 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50081,50001,TO_TIMESTAMP('2010-03-21 22:50:37','YYYY-MM-DD HH24:MI:SS'),100,'Y','4',0,320,0,0,'4',TO_TIMESTAMP('2010-03-21 22:50:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 10:50:48 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50082,50001,TO_TIMESTAMP('2010-03-21 22:50:46','YYYY-MM-DD HH24:MI:SS'),100,'Y','5',0,330,0,0,'5',TO_TIMESTAMP('2010-03-21 22:50:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 10:50:53 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50083,50001,TO_TIMESTAMP('2010-03-21 22:50:52','YYYY-MM-DD HH24:MI:SS'),100,'Y','6',0,340,0,0,'6',TO_TIMESTAMP('2010-03-21 22:50:52','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 10:50:58 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50084,50001,TO_TIMESTAMP('2010-03-21 22:50:57','YYYY-MM-DD HH24:MI:SS'),100,'Y','7',0,350,0,0,'7',TO_TIMESTAMP('2010-03-21 22:50:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 10:51:02 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50085,50001,TO_TIMESTAMP('2010-03-21 22:51:02','YYYY-MM-DD HH24:MI:SS'),100,'Y','8',0,360,0,0,'8',TO_TIMESTAMP('2010-03-21 22:51:02','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 10:51:07 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50086,50001,TO_TIMESTAMP('2010-03-21 22:51:06','YYYY-MM-DD HH24:MI:SS'),100,'Y','9',0,370,0,0,'9',TO_TIMESTAMP('2010-03-21 22:51:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 10:51:14 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,50087,50001,TO_TIMESTAMP('2010-03-21 22:51:13','YYYY-MM-DD HH24:MI:SS'),100,'Y','0',0,380,0,0,'0',TO_TIMESTAMP('2010-03-21 22:51:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 10:52:08 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=10,IsActive='Y' WHERE C_POSKey_ID=50078
;

-- Mar 21, 2010 10:52:08 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=20,IsActive='Y' WHERE C_POSKey_ID=50079
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=30,IsActive='Y' WHERE C_POSKey_ID=50080
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=40,IsActive='Y' WHERE C_POSKey_ID=50081
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=50,IsActive='Y' WHERE C_POSKey_ID=50082
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=60,IsActive='Y' WHERE C_POSKey_ID=50083
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=70,IsActive='Y' WHERE C_POSKey_ID=50084
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=80,IsActive='Y' WHERE C_POSKey_ID=50085
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=90,IsActive='Y' WHERE C_POSKey_ID=50086
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=100,IsActive='Y' WHERE C_POSKey_ID=50087
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=110,IsActive='Y' WHERE C_POSKey_ID=50036
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=120,IsActive='Y' WHERE C_POSKey_ID=50037
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=130,IsActive='Y' WHERE C_POSKey_ID=50038
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=140,IsActive='Y' WHERE C_POSKey_ID=50039
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=150,IsActive='Y' WHERE C_POSKey_ID=50040
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=160,IsActive='Y' WHERE C_POSKey_ID=50041
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=170,IsActive='Y' WHERE C_POSKey_ID=50042
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=180,IsActive='Y' WHERE C_POSKey_ID=50043
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=190,IsActive='Y' WHERE C_POSKey_ID=50044
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=200,IsActive='Y' WHERE C_POSKey_ID=50045
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=210,IsActive='Y' WHERE C_POSKey_ID=50046
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=220,IsActive='Y' WHERE C_POSKey_ID=50047
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=230,IsActive='Y' WHERE C_POSKey_ID=50048
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=240,IsActive='Y' WHERE C_POSKey_ID=50049
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=250,IsActive='Y' WHERE C_POSKey_ID=50050
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=260,IsActive='Y' WHERE C_POSKey_ID=50051
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=270,IsActive='Y' WHERE C_POSKey_ID=50052
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=280,IsActive='Y' WHERE C_POSKey_ID=50053
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=290,IsActive='Y' WHERE C_POSKey_ID=50054
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=300,IsActive='Y' WHERE C_POSKey_ID=50062
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=310,IsActive='Y' WHERE C_POSKey_ID=50055
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=320,IsActive='Y' WHERE C_POSKey_ID=50056
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=330,IsActive='Y' WHERE C_POSKey_ID=50057
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=340,IsActive='Y' WHERE C_POSKey_ID=50058
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=350,IsActive='Y' WHERE C_POSKey_ID=50059
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=360,IsActive='Y' WHERE C_POSKey_ID=50060
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=370,IsActive='Y' WHERE C_POSKey_ID=50061
;

-- Mar 21, 2010 10:52:09 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=380,IsActive='Y' WHERE C_POSKey_ID=50063
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=10,IsActive='Y' WHERE C_POSKey_ID=50026
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=20,IsActive='Y' WHERE C_POSKey_ID=50027
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=30,IsActive='Y' WHERE C_POSKey_ID=50028
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=40,IsActive='Y' WHERE C_POSKey_ID=50029
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=50,IsActive='Y' WHERE C_POSKey_ID=50030
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=60,IsActive='Y' WHERE C_POSKey_ID=50031
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=70,IsActive='Y' WHERE C_POSKey_ID=50032
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=80,IsActive='Y' WHERE C_POSKey_ID=50033
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=90,IsActive='Y' WHERE C_POSKey_ID=50034
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=100,IsActive='Y' WHERE C_POSKey_ID=50035
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=110,IsActive='Y' WHERE C_POSKey_ID=50000
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=120,IsActive='Y' WHERE C_POSKey_ID=50001
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=130,IsActive='Y' WHERE C_POSKey_ID=50002
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=140,IsActive='Y' WHERE C_POSKey_ID=50003
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=150,IsActive='Y' WHERE C_POSKey_ID=50004
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=160,IsActive='Y' WHERE C_POSKey_ID=50005
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=170,IsActive='Y' WHERE C_POSKey_ID=50006
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=180,IsActive='Y' WHERE C_POSKey_ID=50007
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=190,IsActive='Y' WHERE C_POSKey_ID=50008
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=200,IsActive='Y' WHERE C_POSKey_ID=50009
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=210,IsActive='Y' WHERE C_POSKey_ID=50010
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=220,IsActive='Y' WHERE C_POSKey_ID=50011
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=230,IsActive='Y' WHERE C_POSKey_ID=50012
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=240,IsActive='Y' WHERE C_POSKey_ID=50013
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=250,IsActive='Y' WHERE C_POSKey_ID=50014
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=260,IsActive='Y' WHERE C_POSKey_ID=50015
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=270,IsActive='Y' WHERE C_POSKey_ID=50016
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=280,IsActive='Y' WHERE C_POSKey_ID=50017
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=290,IsActive='Y' WHERE C_POSKey_ID=50018
;

-- Mar 21, 2010 10:52:46 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=300,IsActive='Y' WHERE C_POSKey_ID=50064
;

-- Mar 21, 2010 10:52:47 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=310,IsActive='Y' WHERE C_POSKey_ID=50019
;

-- Mar 21, 2010 10:52:47 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=320,IsActive='Y' WHERE C_POSKey_ID=50020
;

-- Mar 21, 2010 10:52:47 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=330,IsActive='Y' WHERE C_POSKey_ID=50021
;

-- Mar 21, 2010 10:52:47 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=340,IsActive='Y' WHERE C_POSKey_ID=50022
;

-- Mar 21, 2010 10:52:47 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=350,IsActive='Y' WHERE C_POSKey_ID=50023
;

-- Mar 21, 2010 10:52:47 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=360,IsActive='Y' WHERE C_POSKey_ID=50024
;

-- Mar 21, 2010 10:52:47 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=370,IsActive='Y' WHERE C_POSKey_ID=50025
;

-- Mar 21, 2010 10:52:47 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET SeqNo=380,IsActive='Y' WHERE C_POSKey_ID=50065
;

-- Mar 21, 2010 10:59:21 PM EST
-- Java POS enhancements
UPDATE C_POSKeyLayout SET AD_PrintFont_ID=122, Columns=4, Description=NULL,Updated=TO_TIMESTAMP('2010-03-21 22:59:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKeyLayout_ID=100
;

-- Mar 21, 2010 11:00:08 PM EST
-- Java POS enhancements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Qty,SeqNo,SpanX,SpanY,Updated,UpdatedBy) VALUES (11,11,50088,100,TO_TIMESTAMP('2010-03-21 23:00:06','YYYY-MM-DD HH24:MI:SS'),100,'Y',148,'T-shirt GL',0,13,0,0,TO_TIMESTAMP('2010-03-21 23:00:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 21, 2010 11:00:22 PM EST
-- Java POS enhancements
UPDATE C_POSKey SET AD_Image_ID=103,Updated=TO_TIMESTAMP('2010-03-21 23:00:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50088
;

-- Second script

-- Mar 24, 2010 9:47:27 AM EST
-- Java POS improvements
INSERT INTO AD_Process (AccessLevel,AD_Client_ID,AD_Org_ID,AD_Process_ID,Classname,CopyFromProcess,Created,CreatedBy,Description,EntityType,IsActive,IsBetaFunctionality,IsDirectPrint,IsReport,IsServerProcess,Name,ShowHelp,Statistic_Count,Statistic_Seconds,Updated,UpdatedBy,Value) VALUES ('1',0,0,53202,'org.compiere.process.POSKeyGenerate','N',TO_TIMESTAMP('2010-03-24 09:47:24','YYYY-MM-DD HH24:MI:SS'),100,'Generate POS Keys from products.','D','Y','N','N','N','N','POS Key Generate','Y',0,0,TO_TIMESTAMP('2010-03-24 09:47:24','YYYY-MM-DD HH24:MI:SS'),100,'C_POSKeyGenerate')
;

-- Mar 24, 2010 9:47:27 AM EST
-- Java POS improvements
INSERT INTO AD_Process_Trl (AD_Language,AD_Process_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_ID=53202 AND NOT EXISTS (SELECT * FROM AD_Process_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_ID=t.AD_Process_ID)
;

-- Mar 24, 2010 9:48:46 AM EST
-- Java POS improvements
INSERT INTO AD_Process_Para (AD_Client_ID,AD_Element_ID,AD_Org_ID,AD_Process_ID,AD_Process_Para_ID,AD_Reference_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsCentrallyMaintained,IsMandatory,IsRange,Name,SeqNo,Updated,UpdatedBy) VALUES (0,2583,0,53202,53405,19,'C_POSKeyLayout_ID',TO_TIMESTAMP('2010-03-24 09:48:45','YYYY-MM-DD HH24:MI:SS'),100,'D',10,'Y','Y','N','N','POS Key Layout',10,TO_TIMESTAMP('2010-03-24 09:48:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 9:48:46 AM EST
-- Java POS improvements
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=53405 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- Mar 24, 2010 9:49:40 AM EST
-- Java POS improvements
INSERT INTO AD_Process_Para (AD_Client_ID,AD_Element_ID,AD_Org_ID,AD_Process_ID,AD_Process_Para_ID,AD_Reference_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsCentrallyMaintained,IsMandatory,IsRange,Name,SeqNo,Updated,UpdatedBy) VALUES (0,453,0,53202,53406,19,'M_Product_Category_ID',TO_TIMESTAMP('2010-03-24 09:49:37','YYYY-MM-DD HH24:MI:SS'),100,'D',10,'Y','Y','N','N','Product Category',20,TO_TIMESTAMP('2010-03-24 09:49:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 9:49:40 AM EST
-- Java POS improvements
INSERT INTO AD_Process_Para_Trl (AD_Language,AD_Process_Para_ID, Description,Help,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Process_Para_ID, t.Description,t.Help,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Process_Para t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Process_Para_ID=53406 AND NOT EXISTS (SELECT * FROM AD_Process_Para_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Process_Para_ID=t.AD_Process_Para_ID)
;

-- Mar 24, 2010 9:49:43 AM EST
-- Java POS improvements
UPDATE AD_Process_Para SET IsMandatory='Y',Updated=TO_TIMESTAMP('2010-03-24 09:49:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_Para_ID=53405
;

-- Mar 24, 2010 9:56:32 AM EST
-- Java POS improvements
INSERT INTO AD_Menu ("action",AD_Client_ID,AD_Menu_ID,AD_Org_ID,AD_Process_ID,Created,CreatedBy,Description,EntityType,IsActive,IsReadOnly,IsSOTrx,IsSummary,Name,Updated,UpdatedBy) VALUES ('P',0,53269,0,53202,TO_TIMESTAMP('2010-03-24 09:56:31','YYYY-MM-DD HH24:MI:SS'),100,NULL,'D','Y','N','N','N','POS Key Generate',TO_TIMESTAMP('2010-03-24 09:56:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 9:56:32 AM EST
-- Java POS improvements
INSERT INTO AD_Menu_Trl (AD_Language,AD_Menu_ID, Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Menu_ID, t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Menu t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Menu_ID=53269 AND NOT EXISTS (SELECT * FROM AD_Menu_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Menu_ID=t.AD_Menu_ID)
;

-- Mar 24, 2010 9:56:32 AM EST
-- Java POS improvements
INSERT INTO AD_TreeNodeMM (AD_Client_ID,AD_Org_ID, IsActive,Created,CreatedBy,Updated,UpdatedBy, AD_Tree_ID, Node_ID, Parent_ID, SeqNo) SELECT t.AD_Client_ID, 0, 'Y', CURRENT_TIMESTAMP, 100, CURRENT_TIMESTAMP, 100,t.AD_Tree_ID, 53269, 0, 999 FROM AD_Tree t WHERE t.AD_Client_ID=0 AND t.IsActive='Y' AND t.IsAllNodes='Y' AND t.TreeType='MM' AND NOT EXISTS (SELECT * FROM AD_TreeNodeMM e WHERE e.AD_Tree_ID=t.AD_Tree_ID AND Node_ID=53269)
;

-- Mar 24, 2010 9:56:36 AM EST
-- Java POS improvements
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=0, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=52001
;

-- Mar 24, 2010 9:56:36 AM EST
-- Java POS improvements
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=1, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=460
;

-- Mar 24, 2010 9:56:36 AM EST
-- Java POS improvements
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=2, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=301
;

-- Mar 24, 2010 9:56:36 AM EST
-- Java POS improvements
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=3, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53249
;

-- Mar 24, 2010 9:56:36 AM EST
-- Java POS improvements
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=4, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=129
;

-- Mar 24, 2010 9:56:36 AM EST
-- Java POS improvements
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=5, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=543
;

-- Mar 24, 2010 9:56:36 AM EST
-- Java POS improvements
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=6, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=195
;

-- Mar 24, 2010 9:56:36 AM EST
-- Java POS improvements
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=7, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53223
;

-- Mar 24, 2010 9:56:36 AM EST
-- Java POS improvements
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=8, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=407
;

-- Mar 24, 2010 9:56:36 AM EST
-- Java POS improvements
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=9, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=406
;

-- Mar 24, 2010 9:56:36 AM EST
-- Java POS improvements
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=10, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=335
;

-- Mar 24, 2010 9:56:36 AM EST
-- Java POS improvements
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=11, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=436
;

-- Mar 24, 2010 9:56:36 AM EST
-- Java POS improvements
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=12, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=507
;

-- Mar 24, 2010 9:56:36 AM EST
-- Java POS improvements
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=13, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=448
;

-- Mar 24, 2010 9:56:36 AM EST
-- Java POS improvements
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=14, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=449
;

-- Mar 24, 2010 9:56:36 AM EST
-- Java POS improvements
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=15, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=492
;

-- Mar 24, 2010 9:56:36 AM EST
-- Java POS improvements
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=16, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=53269
;

-- Mar 24, 2010 9:56:36 AM EST
-- Java POS improvements
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=17, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=491
;

-- Mar 24, 2010 9:56:36 AM EST
-- Java POS improvements
UPDATE AD_TreeNodeMM SET Parent_ID=457, SeqNo=18, Updated=CURRENT_TIMESTAMP WHERE AD_Tree_ID=10 AND Node_ID=419
;

-- Mar 24, 2010 10:02:43 AM EST
-- Java POS improvements
UPDATE AD_Process SET Classname='org.compiere.process.PosKeyGenerate',Updated=TO_TIMESTAMP('2010-03-24 10:02:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Process_ID=53202
;

-- Mar 24, 2010 11:02:09 AM EST
-- Java POS improvements
INSERT INTO AD_Message (AD_Client_ID,AD_Message_ID,AD_Org_ID,Created,CreatedBy,EntityType,IsActive,MsgText,MsgTip,MsgType,Updated,UpdatedBy,Value) VALUES (0,52072,0,TO_TIMESTAMP('2008-03-26 13:20:02','YYYY-MM-DD HH24:MI:SS'),100,'D','Y','Subtotal',NULL,'I',TO_TIMESTAMP('2008-03-26 13:20:02','YYYY-MM-DD HH24:MI:SS'),100,'SubTotal')
;

-- Mar 24, 2010 11:03:05 AM EST
-- Java POS improvements
INSERT INTO AD_Message (AD_Client_ID,AD_Message_ID,AD_Org_ID,Created,CreatedBy,EntityType,IsActive,MsgText,MsgType,Updated,UpdatedBy,Value) VALUES (0,53096,0,TO_TIMESTAMP('2010-03-24 11:02:58','YYYY-MM-DD HH24:MI:SS'),100,'D','Y','Subtotal','I',TO_TIMESTAMP('2010-03-24 11:02:58','YYYY-MM-DD HH24:MI:SS'),100,'SubTotal')
;

-- Mar 24, 2010 11:03:05 AM EST
-- Java POS improvements
INSERT INTO AD_Message_Trl (AD_Language,AD_Message_ID, MsgText,MsgTip, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Message_ID, t.MsgText,t.MsgTip, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Message t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Message_ID=53096 AND NOT EXISTS (SELECT * FROM AD_Message_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Message_ID=t.AD_Message_ID)
;

-- Mar 24, 2010 11:04:48 AM EST
-- Java POS improvements
INSERT INTO AD_Message (AD_Client_ID,AD_Message_ID,AD_Org_ID,Created,CreatedBy,EntityType,IsActive,MsgText,MsgType,Updated,UpdatedBy,Value) VALUES (0,53097,0,TO_TIMESTAMP('2010-03-24 11:04:47','YYYY-MM-DD HH24:MI:SS'),100,'D','Y','Tender Amount','I',TO_TIMESTAMP('2010-03-24 11:04:47','YYYY-MM-DD HH24:MI:SS'),100,'AmountTendered')
;

-- Mar 24, 2010 11:04:48 AM EST
-- Java POS improvements
INSERT INTO AD_Message_Trl (AD_Language,AD_Message_ID, MsgText,MsgTip, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Message_ID, t.MsgText,t.MsgTip, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Message t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Message_ID=53097 AND NOT EXISTS (SELECT * FROM AD_Message_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Message_ID=t.AD_Message_ID)
;

-- Mar 24, 2010 11:05:04 AM EST
-- Java POS improvements
INSERT INTO AD_Message (AD_Client_ID,AD_Message_ID,AD_Org_ID,Created,CreatedBy,EntityType,IsActive,MsgText,MsgType,Updated,UpdatedBy,Value) VALUES (0,53098,0,TO_TIMESTAMP('2010-03-24 11:05:03','YYYY-MM-DD HH24:MI:SS'),100,'D','Y','Change','I',TO_TIMESTAMP('2010-03-24 11:05:03','YYYY-MM-DD HH24:MI:SS'),100,'AmountReturned')
;

-- Mar 24, 2010 11:05:04 AM EST
-- Java POS improvements
INSERT INTO AD_Message_Trl (AD_Language,AD_Message_ID, MsgText,MsgTip, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Message_ID, t.MsgText,t.MsgTip, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Message t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Message_ID=53098 AND NOT EXISTS (SELECT * FROM AD_Message_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Message_ID=t.AD_Message_ID)
;

-- Mar 24, 2010 10:01:46 AM EST
-- Java POS improvements
INSERT INTO C_POSKeyLayout (AD_Client_ID,AD_Org_ID,AD_PrintColor_ID,AD_PrintFont_ID,Columns,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,POSKeyLayoutType,Updated,UpdatedBy) VALUES (11,0,104,129,4,50003,TO_TIMESTAMP('2010-03-24 10:01:41','YYYY-MM-DD HH24:MI:SS'),100,'Y','All Products','P',TO_TIMESTAMP('2010-03-24 10:01:41','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:07:53 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50092,50003,TO_TIMESTAMP('2010-03-24 10:07:50','YYYY-MM-DD HH24:MI:SS'),100,'Y',50019,'Assembly Area',TO_TIMESTAMP('2010-03-24 10:07:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:07:54 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50093,50003,TO_TIMESTAMP('2010-03-24 10:07:53','YYYY-MM-DD HH24:MI:SS'),100,'Y',128,'Azalea Bush',TO_TIMESTAMP('2010-03-24 10:07:53','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:07:55 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50094,50003,TO_TIMESTAMP('2010-03-24 10:07:54','YYYY-MM-DD HH24:MI:SS'),100,'Y',50016,'Back Leg',TO_TIMESTAMP('2010-03-24 10:07:54','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:07:56 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50095,50003,TO_TIMESTAMP('2010-03-24 10:07:55','YYYY-MM-DD HH24:MI:SS'),100,'Y',50005,'Back Support',TO_TIMESTAMP('2010-03-24 10:07:55','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:07:57 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50096,50003,TO_TIMESTAMP('2010-03-24 10:07:56','YYYY-MM-DD HH24:MI:SS'),100,'Y',50013,'Bag 50 Kg',TO_TIMESTAMP('2010-03-24 10:07:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:07:57 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50097,50003,TO_TIMESTAMP('2010-03-24 10:07:57','YYYY-MM-DD HH24:MI:SS'),100,'Y',50014,'Bag 70 Kg',TO_TIMESTAMP('2010-03-24 10:07:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:07:59 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50098,50003,TO_TIMESTAMP('2010-03-24 10:07:57','YYYY-MM-DD HH24:MI:SS'),100,'Y',50021,'Chrome Subcontract Area',TO_TIMESTAMP('2010-03-24 10:07:57','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:07:59 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50099,50003,TO_TIMESTAMP('2010-03-24 10:07:59','YYYY-MM-DD HH24:MI:SS'),100,'Y',146,'How To Plant',TO_TIMESTAMP('2010-03-24 10:07:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:02 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50100,50003,TO_TIMESTAMP('2010-03-24 10:07:59','YYYY-MM-DD HH24:MI:SS'),100,'Y',50026,'Dry Area',TO_TIMESTAMP('2010-03-24 10:07:59','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:03 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50101,50003,TO_TIMESTAMP('2010-03-24 10:08:02','YYYY-MM-DD HH24:MI:SS'),100,'Y',124,'Elm Tree',TO_TIMESTAMP('2010-03-24 10:08:02','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:04 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50102,50003,TO_TIMESTAMP('2010-03-24 10:08:03','YYYY-MM-DD HH24:MI:SS'),100,'Y',50008,'Lawn Fertilizer',TO_TIMESTAMP('2010-03-24 10:08:03','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:05 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50103,50003,TO_TIMESTAMP('2010-03-24 10:08:04','YYYY-MM-DD HH24:MI:SS'),100,'Y',136,'Fertilizer #50',TO_TIMESTAMP('2010-03-24 10:08:04','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:06 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50104,50003,TO_TIMESTAMP('2010-03-24 10:08:05','YYYY-MM-DD HH24:MI:SS'),100,'Y',50007,'Fertilizer #70',TO_TIMESTAMP('2010-03-24 10:08:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:07 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50105,50003,TO_TIMESTAMP('2010-03-24 10:08:06','YYYY-MM-DD HH24:MI:SS'),100,'Y',50027,'Fertilizer Inspection Area',TO_TIMESTAMP('2010-03-24 10:08:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:08 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50106,50003,TO_TIMESTAMP('2010-03-24 10:08:07','YYYY-MM-DD HH24:MI:SS'),100,'Y',50018,'Fertilizer Plant',TO_TIMESTAMP('2010-03-24 10:08:07','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:09 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50107,50003,TO_TIMESTAMP('2010-03-24 10:08:08','YYYY-MM-DD HH24:MI:SS'),100,'Y',50015,'Front Leg',TO_TIMESTAMP('2010-03-24 10:08:08','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:10 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50108,50003,TO_TIMESTAMP('2010-03-24 10:08:09','YYYY-MM-DD HH24:MI:SS'),100,'Y',50023,'Furniture Plant',TO_TIMESTAMP('2010-03-24 10:08:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:11 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50109,50003,TO_TIMESTAMP('2010-03-24 10:08:10','YYYY-MM-DD HH24:MI:SS'),100,'Y',125,'Grass Seed Container',TO_TIMESTAMP('2010-03-24 10:08:10','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:12 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50110,50003,TO_TIMESTAMP('2010-03-24 10:08:11','YYYY-MM-DD HH24:MI:SS'),100,'Y',138,'Hoe 4 ft',TO_TIMESTAMP('2010-03-24 10:08:11','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:13 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50111,50003,TO_TIMESTAMP('2010-03-24 10:08:12','YYYY-MM-DD HH24:MI:SS'),100,'Y',129,'Holly Bush',TO_TIMESTAMP('2010-03-24 10:08:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:14 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50112,50003,TO_TIMESTAMP('2010-03-24 10:08:13','YYYY-MM-DD HH24:MI:SS'),100,'Y',50022,'Inspection Area',TO_TIMESTAMP('2010-03-24 10:08:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:15 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50113,50003,TO_TIMESTAMP('2010-03-24 10:08:14','YYYY-MM-DD HH24:MI:SS'),100,'Y',132,'Mary Consultant',TO_TIMESTAMP('2010-03-24 10:08:14','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:16 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50114,50003,TO_TIMESTAMP('2010-03-24 10:08:15','YYYY-MM-DD HH24:MI:SS'),100,'Y',50025,'Mixed Area',TO_TIMESTAMP('2010-03-24 10:08:15','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:17 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50115,50003,TO_TIMESTAMP('2010-03-24 10:08:16','YYYY-MM-DD HH24:MI:SS'),100,'Y',137,'Mulch 10#',TO_TIMESTAMP('2010-03-24 10:08:16','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:18 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50116,50003,TO_TIMESTAMP('2010-03-24 10:08:17','YYYY-MM-DD HH24:MI:SS'),100,'Y',50009,'Nitrogen',TO_TIMESTAMP('2010-03-24 10:08:17','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:18 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50117,50003,TO_TIMESTAMP('2010-03-24 10:08:18','YYYY-MM-DD HH24:MI:SS'),100,'Y',123,'Oak Tree',TO_TIMESTAMP('2010-03-24 10:08:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:19 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50118,50003,TO_TIMESTAMP('2010-03-24 10:08:18','YYYY-MM-DD HH24:MI:SS'),100,'Y',50024,'Packing Production Line',TO_TIMESTAMP('2010-03-24 10:08:18','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:22 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50119,50003,TO_TIMESTAMP('2010-03-24 10:08:19','YYYY-MM-DD HH24:MI:SS'),100,'Y',50020,'Paint Area',TO_TIMESTAMP('2010-03-24 10:08:19','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:23 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50120,50003,TO_TIMESTAMP('2010-03-24 10:08:22','YYYY-MM-DD HH24:MI:SS'),100,'Y',145,'Patio Furniture Set',TO_TIMESTAMP('2010-03-24 10:08:22','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:24 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50121,50003,TO_TIMESTAMP('2010-03-24 10:08:23','YYYY-MM-DD HH24:MI:SS'),100,'Y',50000,'Assembly Back Leg',TO_TIMESTAMP('2010-03-24 10:08:23','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:25 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50122,50003,TO_TIMESTAMP('2010-03-24 10:08:24','YYYY-MM-DD HH24:MI:SS'),100,'Y',133,'Patio Chair',TO_TIMESTAMP('2010-03-24 10:08:24','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:25 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50123,50003,TO_TIMESTAMP('2010-03-24 10:08:25','YYYY-MM-DD HH24:MI:SS'),100,'Y',50001,'Assembly Front Leg',TO_TIMESTAMP('2010-03-24 10:08:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:26 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50124,50003,TO_TIMESTAMP('2010-03-24 10:08:25','YYYY-MM-DD HH24:MI:SS'),100,'Y',50010,'Phosphorus',TO_TIMESTAMP('2010-03-24 10:08:25','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:27 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50125,50003,TO_TIMESTAMP('2010-03-24 10:08:26','YYYY-MM-DD HH24:MI:SS'),100,'Y',126,'Planting Service',TO_TIMESTAMP('2010-03-24 10:08:26','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:28 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50126,50003,TO_TIMESTAMP('2010-03-24 10:08:27','YYYY-MM-DD HH24:MI:SS'),100,'Y',130,'Plum Tree',TO_TIMESTAMP('2010-03-24 10:08:27','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:29 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50127,50003,TO_TIMESTAMP('2010-03-24 10:08:28','YYYY-MM-DD HH24:MI:SS'),100,'Y',50012,'Potassium',TO_TIMESTAMP('2010-03-24 10:08:28','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:30 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50128,50003,TO_TIMESTAMP('2010-03-24 10:08:29','YYYY-MM-DD HH24:MI:SS'),100,'Y',134,'Patio Table',TO_TIMESTAMP('2010-03-24 10:08:29','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:31 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50129,50003,TO_TIMESTAMP('2010-03-24 10:08:30','YYYY-MM-DD HH24:MI:SS'),100,'Y',139,'Rake Bamboo',TO_TIMESTAMP('2010-03-24 10:08:30','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:32 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50130,50003,TO_TIMESTAMP('2010-03-24 10:08:31','YYYY-MM-DD HH24:MI:SS'),100,'Y',140,'Rake Metal',TO_TIMESTAMP('2010-03-24 10:08:31','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:33 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50131,50003,TO_TIMESTAMP('2010-03-24 10:08:32','YYYY-MM-DD HH24:MI:SS'),100,'Y',127,'Rose Bush',TO_TIMESTAMP('2010-03-24 10:08:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:34 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50132,50003,TO_TIMESTAMP('2010-03-24 10:08:33','YYYY-MM-DD HH24:MI:SS'),100,'Y',135,'Patio Sun Screen',TO_TIMESTAMP('2010-03-24 10:08:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:35 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50133,50003,TO_TIMESTAMP('2010-03-24 10:08:34','YYYY-MM-DD HH24:MI:SS'),100,'Y',50002,'#6-32 x 3/8 Socket Head Cap Screw',TO_TIMESTAMP('2010-03-24 10:08:34','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:36 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50134,50003,TO_TIMESTAMP('2010-03-24 10:08:35','YYYY-MM-DD HH24:MI:SS'),100,'Y',50004,'Seat',TO_TIMESTAMP('2010-03-24 10:08:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:37 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50135,50003,TO_TIMESTAMP('2010-03-24 10:08:36','YYYY-MM-DD HH24:MI:SS'),100,'Y',143,'Grass Seeder',TO_TIMESTAMP('2010-03-24 10:08:36','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:38 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50136,50003,TO_TIMESTAMP('2010-03-24 10:08:37','YYYY-MM-DD HH24:MI:SS'),100,'Y',122,'Standard',TO_TIMESTAMP('2010-03-24 10:08:37','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:39 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50137,50003,TO_TIMESTAMP('2010-03-24 10:08:38','YYYY-MM-DD HH24:MI:SS'),100,'Y',144,'Lawn Tiller',TO_TIMESTAMP('2010-03-24 10:08:38','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:40 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50138,50003,TO_TIMESTAMP('2010-03-24 10:08:39','YYYY-MM-DD HH24:MI:SS'),100,'Y',142,'Transplanter',TO_TIMESTAMP('2010-03-24 10:08:39','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:41 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50139,50003,TO_TIMESTAMP('2010-03-24 10:08:40','YYYY-MM-DD HH24:MI:SS'),100,'Y',131,'Travel cost',TO_TIMESTAMP('2010-03-24 10:08:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:42 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50140,50003,TO_TIMESTAMP('2010-03-24 10:08:41','YYYY-MM-DD HH24:MI:SS'),100,'Y',148,'TShirt - Green Large',TO_TIMESTAMP('2010-03-24 10:08:41','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:43 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50141,50003,TO_TIMESTAMP('2010-03-24 10:08:42','YYYY-MM-DD HH24:MI:SS'),100,'Y',147,'TShirt - Red Large',TO_TIMESTAMP('2010-03-24 10:08:42','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:44 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50142,50003,TO_TIMESTAMP('2010-03-24 10:08:43','YYYY-MM-DD HH24:MI:SS'),100,'Y',50003,'Ultra Glue',TO_TIMESTAMP('2010-03-24 10:08:43','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:45 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50143,50003,TO_TIMESTAMP('2010-03-24 10:08:44','YYYY-MM-DD HH24:MI:SS'),100,'Y',141,'Weeder',TO_TIMESTAMP('2010-03-24 10:08:44','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:08:46 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Updated,UpdatedBy) VALUES (11,11,50144,50003,TO_TIMESTAMP('2010-03-24 10:08:45','YYYY-MM-DD HH24:MI:SS'),100,'Y',50017,'Whater',TO_TIMESTAMP('2010-03-24 10:08:45','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=0,IsActive='N' WHERE C_POSKey_ID=50133
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=0,IsActive='N' WHERE C_POSKey_ID=50092
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=0,IsActive='N' WHERE C_POSKey_ID=50121
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=0,IsActive='N' WHERE C_POSKey_ID=50123
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=0,IsActive='N' WHERE C_POSKey_ID=50094
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=0,IsActive='N' WHERE C_POSKey_ID=50095
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=0,IsActive='N' WHERE C_POSKey_ID=50098
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=0,IsActive='N' WHERE C_POSKey_ID=50100
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=0,IsActive='N' WHERE C_POSKey_ID=50105
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=0,IsActive='N' WHERE C_POSKey_ID=50106
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=0,IsActive='N' WHERE C_POSKey_ID=50108
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=0,IsActive='N' WHERE C_POSKey_ID=50112
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=0,IsActive='N' WHERE C_POSKey_ID=50114
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=0,IsActive='N' WHERE C_POSKey_ID=50118
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=0,IsActive='N' WHERE C_POSKey_ID=50119
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=0,IsActive='N' WHERE C_POSKey_ID=50134
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=0,IsActive='N' WHERE C_POSKey_ID=50136
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=0,IsActive='N' WHERE C_POSKey_ID=50144
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=10,IsActive='Y' WHERE C_POSKey_ID=50093
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=20,IsActive='Y' WHERE C_POSKey_ID=50096
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=30,IsActive='Y' WHERE C_POSKey_ID=50097
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=40,IsActive='Y' WHERE C_POSKey_ID=50101
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=50,IsActive='Y' WHERE C_POSKey_ID=50103
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=60,IsActive='Y' WHERE C_POSKey_ID=50104
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=70,IsActive='Y' WHERE C_POSKey_ID=50107
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=80,IsActive='Y' WHERE C_POSKey_ID=50109
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=90,IsActive='Y' WHERE C_POSKey_ID=50135
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=100,IsActive='Y' WHERE C_POSKey_ID=50110
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=110,IsActive='Y' WHERE C_POSKey_ID=50111
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=120,IsActive='Y' WHERE C_POSKey_ID=50099
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=130,IsActive='Y' WHERE C_POSKey_ID=50102
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=140,IsActive='Y' WHERE C_POSKey_ID=50137
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=150,IsActive='Y' WHERE C_POSKey_ID=50113
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=160,IsActive='Y' WHERE C_POSKey_ID=50115
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=170,IsActive='Y' WHERE C_POSKey_ID=50116
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=180,IsActive='Y' WHERE C_POSKey_ID=50117
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=190,IsActive='Y' WHERE C_POSKey_ID=50122
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=200,IsActive='Y' WHERE C_POSKey_ID=50120
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=210,IsActive='Y' WHERE C_POSKey_ID=50132
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=220,IsActive='Y' WHERE C_POSKey_ID=50128
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=230,IsActive='Y' WHERE C_POSKey_ID=50124
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=240,IsActive='Y' WHERE C_POSKey_ID=50125
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=250,IsActive='Y' WHERE C_POSKey_ID=50126
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=260,IsActive='Y' WHERE C_POSKey_ID=50127
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=270,IsActive='Y' WHERE C_POSKey_ID=50129
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=280,IsActive='Y' WHERE C_POSKey_ID=50130
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=290,IsActive='Y' WHERE C_POSKey_ID=50131
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=300,IsActive='Y' WHERE C_POSKey_ID=50138
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=310,IsActive='Y' WHERE C_POSKey_ID=50139
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=320,IsActive='Y' WHERE C_POSKey_ID=50140
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=330,IsActive='Y' WHERE C_POSKey_ID=50141
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=340,IsActive='Y' WHERE C_POSKey_ID=50142
;

-- Mar 24, 2010 10:18:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=350,IsActive='Y' WHERE C_POSKey_ID=50143
;

-- Mar 24, 2010 10:18:49 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:18:49','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50093
;

-- Mar 24, 2010 10:18:51 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:18:51','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50096
;

-- Mar 24, 2010 10:18:52 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:18:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50097
;

-- Mar 24, 2010 10:18:52 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:18:52','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50101
;

-- Mar 24, 2010 10:18:53 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:18:53','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50103
;

-- Mar 24, 2010 10:18:54 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:18:54','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50104
;

-- Mar 24, 2010 10:18:55 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:18:55','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50107
;

-- Mar 24, 2010 10:18:56 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:18:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50109
;

-- Mar 24, 2010 10:18:56 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:18:56','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50135
;

-- Mar 24, 2010 10:18:57 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:18:57','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50110
;

-- Mar 24, 2010 10:18:58 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:18:58','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50111
;

-- Mar 24, 2010 10:18:59 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:18:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50099
;

-- Mar 24, 2010 10:19:00 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:00','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50102
;

-- Mar 24, 2010 10:19:01 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50137
;

-- Mar 24, 2010 10:19:02 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:02','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50113
;

-- Mar 24, 2010 10:19:03 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50115
;

-- Mar 24, 2010 10:19:04 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50116
;

-- Mar 24, 2010 10:19:04 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:04','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50117
;

-- Mar 24, 2010 10:19:05 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50122
;

-- Mar 24, 2010 10:19:06 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50120
;

-- Mar 24, 2010 10:19:07 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:07','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50132
;

-- Mar 24, 2010 10:19:08 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50128
;

-- Mar 24, 2010 10:19:10 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:10','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50124
;

-- Mar 24, 2010 10:19:12 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50125
;

-- Mar 24, 2010 10:19:12 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:12','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50126
;

-- Mar 24, 2010 10:19:13 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50127
;

-- Mar 24, 2010 10:19:14 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:14','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50129
;

-- Mar 24, 2010 10:19:16 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:16','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50130
;

-- Mar 24, 2010 10:19:18 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:18','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50131
;

-- Mar 24, 2010 10:19:20 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:20','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50138
;

-- Mar 24, 2010 10:19:21 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50139
;

-- Mar 24, 2010 10:19:22 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50140
;

-- Mar 24, 2010 10:19:22 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:22','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50141
;

-- Mar 24, 2010 10:19:23 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:23','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50142
;

-- Mar 24, 2010 10:19:27 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:19:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50143
;

-- Mar 24, 2010 10:20:45 AM EST
-- Java POS improvements
UPDATE C_POSKey SET Qty=1.000000000000,Updated=TO_TIMESTAMP('2010-03-24 10:20:45','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50088
;

-- Mar 24, 2010 10:21:14 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,SubKeyLayout_ID,Updated,UpdatedBy) VALUES (11,11,50145,100,TO_TIMESTAMP('2010-03-24 10:21:13','YYYY-MM-DD HH24:MI:SS'),100,'Y','All Products',0,23,4,0,50003,TO_TIMESTAMP('2010-03-24 10:21:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:22:17 AM EST
-- Java POS improvements
UPDATE C_POSKeyLayout SET AD_PrintColor_ID=111,Updated=TO_TIMESTAMP('2010-03-24 10:22:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKeyLayout_ID=50003
;

-- Mar 24, 2010 10:22:57 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,AD_PrintColor_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,SubKeyLayout_ID,Updated,UpdatedBy) VALUES (11,11,111,50146,50003,TO_TIMESTAMP('2010-03-24 10:22:56','YYYY-MM-DD HH24:MI:SS'),100,'Y','Popular Items',0,360,0,0,100,TO_TIMESTAMP('2010-03-24 10:22:56','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:23:03 AM EST
-- Java POS improvements
UPDATE C_POSKeyLayout SET AD_PrintColor_ID=103,Updated=TO_TIMESTAMP('2010-03-24 10:23:03','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKeyLayout_ID=50003
;

-- Mar 24, 2010 10:23:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET AD_PrintColor_ID=103,Updated=TO_TIMESTAMP('2010-03-24 10:23:17','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50145
;

-- Mar 24, 2010 10:34:12 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Qty,SeqNo,SpanX,SpanY,Updated,UpdatedBy) VALUES (11,11,50147,100,TO_TIMESTAMP('2010-03-24 10:34:09','YYYY-MM-DD HH24:MI:SS'),100,'Y',124,'Elm Tree',1.000000000000,33,0,0,TO_TIMESTAMP('2010-03-24 10:34:09','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:34:28 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Qty,SeqNo,SpanX,SpanY,Updated,UpdatedBy) VALUES (11,11,50148,100,TO_TIMESTAMP('2010-03-24 10:34:27','YYYY-MM-DD HH24:MI:SS'),100,'Y',130,'Plum Tree',1.000000000000,43,0,0,TO_TIMESTAMP('2010-03-24 10:34:27','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:34:45 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Qty,SeqNo,SpanX,SpanY,Updated,UpdatedBy) VALUES (11,11,50149,100,TO_TIMESTAMP('2010-03-24 10:34:44','YYYY-MM-DD HH24:MI:SS'),100,'Y',129,'Holly Bush',1.000000000000,53,0,0,TO_TIMESTAMP('2010-03-24 10:34:44','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:34:59 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Qty,SeqNo,SpanX,SpanY,Updated,UpdatedBy) VALUES (11,11,50150,100,TO_TIMESTAMP('2010-03-24 10:34:58','YYYY-MM-DD HH24:MI:SS'),100,'Y',127,'Rose Bush',1.000000000000,63,0,0,TO_TIMESTAMP('2010-03-24 10:34:58','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:35:47 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Qty,SeqNo,SpanX,SpanY,Updated,UpdatedBy) VALUES (11,11,50151,100,TO_TIMESTAMP('2010-03-24 10:35:46','YYYY-MM-DD HH24:MI:SS'),100,'Y',143,'Grass seeder',1.000000000000,73,0,0,TO_TIMESTAMP('2010-03-24 10:35:46','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:36:07 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Qty,SeqNo,SpanX,SpanY,Updated,UpdatedBy) VALUES (11,11,50152,100,TO_TIMESTAMP('2010-03-24 10:36:06','YYYY-MM-DD HH24:MI:SS'),100,'Y',144,'Lawn Tiller',1.000000000000,83,0,0,TO_TIMESTAMP('2010-03-24 10:36:06','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:36:22 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Qty,SeqNo,SpanX,SpanY,Updated,UpdatedBy) VALUES (11,11,50153,100,TO_TIMESTAMP('2010-03-24 10:36:21','YYYY-MM-DD HH24:MI:SS'),100,'Y',139,'Rake Bamboo',1.000000000000,93,0,0,TO_TIMESTAMP('2010-03-24 10:36:21','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:36:34 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Qty,SeqNo,SpanX,SpanY,Updated,UpdatedBy) VALUES (11,11,50154,100,TO_TIMESTAMP('2010-03-24 10:36:33','YYYY-MM-DD HH24:MI:SS'),100,'Y',140,'Rake Metal',1.000000000000,103,0,0,TO_TIMESTAMP('2010-03-24 10:36:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:36:50 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Qty,SeqNo,SpanX,SpanY,Updated,UpdatedBy) VALUES (11,11,50155,100,TO_TIMESTAMP('2010-03-24 10:36:49','YYYY-MM-DD HH24:MI:SS'),100,'Y',141,'Weeder',1.000000000000,113,0,0,TO_TIMESTAMP('2010-03-24 10:36:49','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:37:14 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Qty,SeqNo,SpanX,SpanY,Updated,UpdatedBy) VALUES (11,11,50156,100,TO_TIMESTAMP('2010-03-24 10:37:13','YYYY-MM-DD HH24:MI:SS'),100,'Y',148,'Tshirt GL',1.000000000000,123,0,0,TO_TIMESTAMP('2010-03-24 10:37:13','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:37:33 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Qty,SeqNo,SpanX,SpanY,Updated,UpdatedBy) VALUES (11,11,50157,100,TO_TIMESTAMP('2010-03-24 10:37:32','YYYY-MM-DD HH24:MI:SS'),100,'Y',147,'Tshirt RL',1.000000000000,133,0,0,TO_TIMESTAMP('2010-03-24 10:37:32','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:37:52 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Qty,SeqNo,SpanX,SpanY,Updated,UpdatedBy) VALUES (11,11,50158,100,TO_TIMESTAMP('2010-03-24 10:37:51','YYYY-MM-DD HH24:MI:SS'),100,'Y',145,'Patio Set',1.000000000000,143,0,0,TO_TIMESTAMP('2010-03-24 10:37:51','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:38:13 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,M_Product_ID,Name,Qty,SeqNo,SpanX,SpanY,Updated,UpdatedBy) VALUES (11,11,50159,100,TO_TIMESTAMP('2010-03-24 10:38:12','YYYY-MM-DD HH24:MI:SS'),100,'Y',146,'How to Plant',1.000000000000,153,0,0,TO_TIMESTAMP('2010-03-24 10:38:12','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:39:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=10,IsActive='Y' WHERE C_POSKey_ID=50145
;

-- Mar 24, 2010 10:39:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=20,IsActive='Y' WHERE C_POSKey_ID=100
;

-- Mar 24, 2010 10:39:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=30,IsActive='Y' WHERE C_POSKey_ID=50149
;

-- Mar 24, 2010 10:39:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=40,IsActive='Y' WHERE C_POSKey_ID=50150
;

-- Mar 24, 2010 10:39:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=50,IsActive='Y' WHERE C_POSKey_ID=102
;

-- Mar 24, 2010 10:39:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=60,IsActive='Y' WHERE C_POSKey_ID=50088
;

-- Mar 24, 2010 10:39:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=70,IsActive='Y' WHERE C_POSKey_ID=101
;

-- Mar 24, 2010 10:39:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=80,IsActive='Y' WHERE C_POSKey_ID=50147
;

-- Mar 24, 2010 10:39:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=90,IsActive='Y' WHERE C_POSKey_ID=50148
;

-- Mar 24, 2010 10:39:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=100,IsActive='Y' WHERE C_POSKey_ID=50157
;

-- Mar 24, 2010 10:39:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=110,IsActive='Y' WHERE C_POSKey_ID=50151
;

-- Mar 24, 2010 10:39:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=120,IsActive='Y' WHERE C_POSKey_ID=50152
;

-- Mar 24, 2010 10:39:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=130,IsActive='Y' WHERE C_POSKey_ID=50153
;

-- Mar 24, 2010 10:39:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=140,IsActive='Y' WHERE C_POSKey_ID=50154
;

-- Mar 24, 2010 10:39:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=150,IsActive='Y' WHERE C_POSKey_ID=50155
;

-- Mar 24, 2010 10:39:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=160,IsActive='Y' WHERE C_POSKey_ID=50156
;

-- Mar 24, 2010 10:39:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=170,IsActive='Y' WHERE C_POSKey_ID=50158
;

-- Mar 24, 2010 10:39:17 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=180,IsActive='Y' WHERE C_POSKey_ID=50159
;

-- Mar 24, 2010 10:39:24 AM EST
-- Java POS improvements
DELETE FROM C_POSKey WHERE C_POSKey_ID=50156
;

-- Mar 24, 2010 10:44:25 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=50,IsActive='Y' WHERE C_POSKey_ID=50088
;

-- Mar 24, 2010 10:44:25 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=60,IsActive='Y' WHERE C_POSKey_ID=101
;

-- Mar 24, 2010 10:44:25 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=70,IsActive='Y' WHERE C_POSKey_ID=50147
;

-- Mar 24, 2010 10:44:25 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=80,IsActive='Y' WHERE C_POSKey_ID=50148
;

-- Mar 24, 2010 10:44:25 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=90,IsActive='Y' WHERE C_POSKey_ID=50157
;

-- Mar 24, 2010 10:44:25 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=100,IsActive='Y' WHERE C_POSKey_ID=50151
;

-- Mar 24, 2010 10:44:25 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=110,IsActive='Y' WHERE C_POSKey_ID=50152
;

-- Mar 24, 2010 10:44:25 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=120,IsActive='Y' WHERE C_POSKey_ID=50153
;

-- Mar 24, 2010 10:44:25 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=130,IsActive='Y' WHERE C_POSKey_ID=50154
;

-- Mar 24, 2010 10:44:25 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=140,IsActive='Y' WHERE C_POSKey_ID=50155
;

-- Mar 24, 2010 10:44:25 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=150,IsActive='Y' WHERE C_POSKey_ID=50158
;

-- Mar 24, 2010 10:44:25 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=160,IsActive='Y' WHERE C_POSKey_ID=50159
;

-- Mar 24, 2010 10:44:25 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=170,IsActive='Y' WHERE C_POSKey_ID=102
;

-- Mar 24, 2010 10:45:09 AM EST
-- Java POS improvements
UPDATE C_POSKey SET AD_PrintColor_ID=102,Updated=TO_TIMESTAMP('2010-03-24 10:45:09','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50149
;

-- Mar 24, 2010 10:45:13 AM EST
-- Java POS improvements
UPDATE C_POSKey SET AD_PrintColor_ID=102,Updated=TO_TIMESTAMP('2010-03-24 10:45:13','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50150
;

-- Mar 24, 2010 10:45:29 AM EST
-- Java POS improvements
UPDATE C_POSKey SET AD_PrintColor_ID=113,Updated=TO_TIMESTAMP('2010-03-24 10:45:29','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=101
;

-- Mar 24, 2010 10:45:33 AM EST
-- Java POS improvements
UPDATE C_POSKey SET AD_PrintColor_ID=113,Updated=TO_TIMESTAMP('2010-03-24 10:45:33','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50147
;

-- Mar 24, 2010 10:45:39 AM EST
-- Java POS improvements
UPDATE C_POSKey SET AD_PrintColor_ID=113,Updated=TO_TIMESTAMP('2010-03-24 10:45:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKey_ID=50148
;

-- Mar 24, 2010 10:51:53 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,AD_PrintColor_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,102,50160,50002,TO_TIMESTAMP('2010-03-24 10:51:50','YYYY-MM-DD HH24:MI:SS'),100,'Y','10',0,130,0,0,'10',TO_TIMESTAMP('2010-03-24 10:51:50','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:52:06 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,AD_PrintColor_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,102,50161,50002,TO_TIMESTAMP('2010-03-24 10:52:05','YYYY-MM-DD HH24:MI:SS'),100,'Y','20',0,140,0,0,'20',TO_TIMESTAMP('2010-03-24 10:52:05','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:52:22 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,AD_PrintColor_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,102,50162,50002,TO_TIMESTAMP('2010-03-24 10:52:20','YYYY-MM-DD HH24:MI:SS'),100,'Y','50',0,150,0,0,'50',TO_TIMESTAMP('2010-03-24 10:52:20','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:52:34 AM EST
-- Java POS improvements
INSERT INTO C_POSKey (AD_Client_ID,AD_Org_ID,AD_PrintColor_ID,C_POSKey_ID,C_POSKeyLayout_ID,Created,CreatedBy,IsActive,Name,Qty,SeqNo,SpanX,SpanY,Text,Updated,UpdatedBy) VALUES (11,11,102,50163,50002,TO_TIMESTAMP('2010-03-24 10:52:33','YYYY-MM-DD HH24:MI:SS'),100,'Y','100',0,160,0,0,'100',TO_TIMESTAMP('2010-03-24 10:52:33','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Mar 24, 2010 10:52:53 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=40,IsActive='Y' WHERE C_POSKey_ID=50160
;

-- Mar 24, 2010 10:52:53 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=50,IsActive='Y' WHERE C_POSKey_ID=50069
;

-- Mar 24, 2010 10:52:53 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=60,IsActive='Y' WHERE C_POSKey_ID=50070
;

-- Mar 24, 2010 10:52:53 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=70,IsActive='Y' WHERE C_POSKey_ID=50071
;

-- Mar 24, 2010 10:52:53 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=80,IsActive='Y' WHERE C_POSKey_ID=50161
;

-- Mar 24, 2010 10:52:53 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=90,IsActive='Y' WHERE C_POSKey_ID=50072
;

-- Mar 24, 2010 10:52:53 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=100,IsActive='Y' WHERE C_POSKey_ID=50073
;

-- Mar 24, 2010 10:52:53 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=110,IsActive='Y' WHERE C_POSKey_ID=50074
;

-- Mar 24, 2010 10:52:53 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=120,IsActive='Y' WHERE C_POSKey_ID=50162
;

-- Mar 24, 2010 10:52:53 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=130,IsActive='Y' WHERE C_POSKey_ID=50075
;

-- Mar 24, 2010 10:52:53 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=140,IsActive='Y' WHERE C_POSKey_ID=50076
;

-- Mar 24, 2010 10:52:53 AM EST
-- Java POS improvements
UPDATE C_POSKey SET SeqNo=150,IsActive='Y' WHERE C_POSKey_ID=50077
;

-- Mar 24, 2010 10:53:01 AM EST
-- Java POS improvements
UPDATE C_POSKeyLayout SET Columns=4,Updated=TO_TIMESTAMP('2010-03-24 10:53:01','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE C_POSKeyLayout_ID=50002
;

-- Mar 24, 2010 4:08:39 PM EST
-- Java POS improvements
UPDATE AD_Column SET AD_Reference_ID=32,Updated=TO_TIMESTAMP('2010-03-24 16:08:39','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=59097
;

