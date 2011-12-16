-- Aug 9, 2011 7:57:40 AM MYT
-- M_Storage Qty Allocated field creation for 361
INSERT INTO AD_Element (AD_Client_ID,AD_Element_ID,AD_Org_ID,ColumnName,Created,CreatedBy,EntityType,IsActive,Name,PrintName,Updated,UpdatedBy) VALUES (0,55253,0,'QtyAllocated',TO_TIMESTAMP('2011-08-09 07:57:40','YYYY-MM-DD HH24:MI:SS'),100,'U','Y','QtyAllocated','QtyAllocated',TO_TIMESTAMP('2011-08-09 07:57:40','YYYY-MM-DD HH24:MI:SS'),100)
;

-- Aug 9, 2011 7:57:40 AM MYT
-- M_Storage Qty Allocated field creation for 361
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, Description,Help,Name,PO_Description,PO_Help,PO_Name,PO_PrintName,PrintName, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.Description,t.Help,t.Name,t.PO_Description,t.PO_Help,t.PO_Name,t.PO_PrintName,t.PrintName, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=55253 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- Aug 9, 2011 7:58:03 AM MYT
-- M_Storage Qty Allocated field creation for 361
INSERT INTO AD_Column (AD_Client_ID,AD_Column_ID,AD_Element_ID,AD_Org_ID,AD_Reference_ID,AD_Table_ID,ColumnName,Created,CreatedBy,EntityType,FieldLength,IsActive,IsAllowLogging,IsAlwaysUpdateable,IsAutocomplete,IsEncrypted,IsIdentifier,IsKey,IsMandatory,IsParent,IsSelectionColumn,IsSyncDatabase,IsTranslated,IsUpdateable,Name,SeqNo,Updated,UpdatedBy,Version) VALUES (0,62048,55253,0,29,250,'QtyAllocated',TO_TIMESTAMP('2011-08-09 07:58:03','YYYY-MM-DD HH24:MI:SS'),100,'U',22,'Y','Y','N','N','N','N','N','N','N','N','N','N','Y','QtyAllocated',0,TO_TIMESTAMP('2011-08-09 07:58:03','YYYY-MM-DD HH24:MI:SS'),100,0)
;

-- Aug 9, 2011 7:58:03 AM MYT
-- M_Storage Qty Allocated field creation for 361
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=62048 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- Aug 9, 2011 7:58:18 AM MYT
-- M_Storage Qty Allocated field creation for 361
ALTER TABLE M_Storage ADD COLUMN QtyAllocated NUMERIC DEFAULT NULL 
;

