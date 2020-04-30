ALTER TABLE C_BankStatement ADD COLUMN CobroEfectivo_ID numeric(10,0);
ALTER TABLE C_BankStatement ADD CONSTRAINT cobroefectivo_cbankstatement FOREIGN KEY (CobroEfectivo_ID)
      REFERENCES C_Payment (C_Payment_ID) MATCH SIMPLE;

-- 20/04/2020 16:47:36 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_TIMESTAMP('2020-04-20 16:47:36','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=12925
;

-- 20/04/2020 16:47:43 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_TIMESTAMP('2020-04-20 16:47:43','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=5355
;

-- 22/04/2020 18:37:08 ART
-- ISSUE #80: Cierre de Cajas.
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_TIMESTAMP('2020-04-22 18:37:08','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=5496
;

-- 28/04/2020 20:42:06 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Column SET IsAllowCopy='N',Updated=TO_TIMESTAMP('2020-04-28 20:42:06','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=5401
;

-- 29/04/2020 20:37:36 ART
-- ISSUE #80: Optimización Cierres de Caja.
INSERT INTO AD_Element (AD_Element_ID,ColumnName,EntityType,Name,PrintName,AD_Client_ID,Created,Updated,IsActive,AD_Org_ID,CreatedBy,UpdatedBy) VALUES (3001068,'cobroefectivo_id','LAR','cobroefectivo_id','cobroefectivo_id',0,TO_TIMESTAMP('2020-04-29 20:37:35','YYYY-MM-DD HH24:MI:SS'),TO_TIMESTAMP('2020-04-29 20:37:35','YYYY-MM-DD HH24:MI:SS'),'Y',0,100,100)
;

-- 29/04/2020 20:37:36 ART
-- ISSUE #80: Optimización Cierres de Caja.
INSERT INTO AD_Element_Trl (AD_Language,AD_Element_ID, PO_Description,Help,PO_Help,Name,Description,PrintName,PO_PrintName,PO_Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Element_ID, t.PO_Description,t.Help,t.PO_Help,t.Name,t.Description,t.PrintName,t.PO_PrintName,t.PO_Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Element t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Element_ID=3001068 AND NOT EXISTS (SELECT * FROM AD_Element_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Element_ID=t.AD_Element_ID)
;

-- 29/04/2020 20:37:37 ART
-- ISSUE #80: Optimización Cierres de Caja.
INSERT INTO AD_Column (AD_Column_ID,AD_Table_ID,EntityType,IsMandatory,Version,IsTranslated,IsIdentifier,IsParent,FieldLength,IsSelectionColumn,AD_Reference_ID,IsKey,AD_Element_ID,IsEncrypted,IsUpdateable,IsAlwaysUpdateable,Name,ColumnName,Updated,CreatedBy,AD_Client_ID,AD_Org_ID,IsActive,Created,UpdatedBy) VALUES (3003615,392,'LAR','N',0,'N','N','N',10,'N',19,'N',3001068,'N','Y','N','cobroefectivo_id','cobroefectivo_id',TO_TIMESTAMP('2020-04-29 20:37:35','YYYY-MM-DD HH24:MI:SS'),100,0,0,'Y',TO_TIMESTAMP('2020-04-29 20:37:35','YYYY-MM-DD HH24:MI:SS'),100)
;

-- 29/04/2020 20:37:37 ART
-- ISSUE #80: Optimización Cierres de Caja.
INSERT INTO AD_Column_Trl (AD_Language,AD_Column_ID, Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Column_ID, t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Column t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Column_ID=3003615 AND NOT EXISTS (SELECT * FROM AD_Column_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Column_ID=t.AD_Column_ID)
;

-- 29/04/2020 20:38:50 ART
-- ISSUE #80: Optimización Cierres de Caja.
UPDATE AD_Column SET AD_Reference_Value_ID=343, AD_Reference_ID=18, Name='Mov. de Transferencia en Efectivo', ColumnName='CobroEfectivo_ID',Updated=TO_TIMESTAMP('2020-04-29 20:38:50','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003615
;

-- 29/04/2020 20:38:50 ART
-- ISSUE #80: Optimización Cierres de Caja.
UPDATE AD_Column_Trl SET IsTranslated='N' WHERE AD_Column_ID=3003615
;

-- 29/04/2020 20:38:50 ART
-- ISSUE #80: Optimización Cierres de Caja.
UPDATE AD_Field SET Name='Mov. de Transferencia en Efectivo', Description=NULL, Help=NULL WHERE AD_Column_ID=3003615 AND IsCentrallyMaintained='Y'
;

-- 29/04/2020 20:38:59 ART
-- ISSUE #80: Optimización Cierres de Caja.
UPDATE AD_Column_Trl SET Name='Mov. de Transferencia en Efectivo',Updated=TO_TIMESTAMP('2020-04-29 20:38:59','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3003615 AND AD_Language='es_AR'
;

-- 29/04/2020 20:39:21 ART
-- ISSUE #80: Optimización Cierres de Caja.
UPDATE AD_Element SET ColumnName='CobroEfectivo_ID', Name='Mov. de Transferencia en Efectivo', PrintName='Mov. de Transferencia en Efectivo',Updated=TO_TIMESTAMP('2020-04-29 20:39:21','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001068
;

-- 29/04/2020 20:39:21 ART
-- ISSUE #80: Optimización Cierres de Caja.
UPDATE AD_Element_Trl SET IsTranslated='N' WHERE AD_Element_ID=3001068
;

-- 29/04/2020 20:39:21 ART
-- ISSUE #80: Optimización Cierres de Caja.
UPDATE AD_Column SET ColumnName='CobroEfectivo_ID', Name='Mov. de Transferencia en Efectivo', Description=NULL, Help=NULL WHERE AD_Element_ID=3001068
;

-- 29/04/2020 20:39:21 ART
-- ISSUE #80: Optimización Cierres de Caja.
UPDATE AD_Process_Para SET ColumnName='CobroEfectivo_ID', Name='Mov. de Transferencia en Efectivo', Description=NULL, Help=NULL, AD_Element_ID=3001068 WHERE UPPER(ColumnName)='COBROEFECTIVO_ID' AND IsCentrallyMaintained='Y' AND AD_Element_ID IS NULL
;

-- 29/04/2020 20:39:21 ART
-- ISSUE #80: Optimización Cierres de Caja.
UPDATE AD_Process_Para SET ColumnName='CobroEfectivo_ID', Name='Mov. de Transferencia en Efectivo', Description=NULL, Help=NULL WHERE AD_Element_ID=3001068 AND IsCentrallyMaintained='Y'
;

-- 29/04/2020 20:39:21 ART
-- ISSUE #80: Optimización Cierres de Caja.
UPDATE AD_Field SET Name='Mov. de Transferencia en Efectivo', Description=NULL, Help=NULL WHERE AD_Column_ID IN (SELECT AD_Column_ID FROM AD_Column WHERE AD_Element_ID=3001068) AND IsCentrallyMaintained='Y'
;

-- 29/04/2020 20:39:21 ART
-- ISSUE #80: Optimización Cierres de Caja.
UPDATE AD_PrintFormatItem SET PrintName='Mov. de Transferencia en Efectivo', Name='Mov. de Transferencia en Efectivo' WHERE IsCentrallyMaintained='Y' AND EXISTS (SELECT * FROM AD_Column c WHERE c.AD_Column_ID=AD_PrintFormatItem.AD_Column_ID AND c.AD_Element_ID=3001068)
;

-- 29/04/2020 20:39:28 ART
-- ISSUE #80: Optimización Cierres de Caja.
UPDATE AD_Element_Trl SET Name='Mov. de Transferencia en Efectivo',PrintName='Mov. de Transferencia en Efectivo',Updated=TO_TIMESTAMP('2020-04-29 20:39:28','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Element_ID=3001068 AND AD_Language='es_AR'
;

-- 29/04/2020 20:40:31 ART
-- ISSUE #80: Optimización Cierres de Caja.
INSERT INTO AD_Field (IsEncrypted,AD_Field_ID,DisplayLength,IsDisplayed,IsSameLine,IsHeading,AD_Column_ID,IsFieldOnly,IsCentrallyMaintained,AD_Tab_ID,IsReadOnly,EntityType,Name,UpdatedBy,AD_Org_ID,IsActive,Created,AD_Client_ID,CreatedBy,Updated) VALUES ('N',3006875,10,'Y','N','N',3003615,'N','Y',3000007,'N','LAR','Mov. de Transferencia en Efectivo',100,0,'Y',TO_TIMESTAMP('2020-04-29 20:40:31','YYYY-MM-DD HH24:MI:SS'),0,100,TO_TIMESTAMP('2020-04-29 20:40:31','YYYY-MM-DD HH24:MI:SS'))
;

-- 29/04/2020 20:40:31 ART
-- ISSUE #80: Optimización Cierres de Caja.
INSERT INTO AD_Field_Trl (AD_Language,AD_Field_ID, Help,Description,Name, IsTranslated,AD_Client_ID,AD_Org_ID,Created,Createdby,Updated,UpdatedBy) SELECT l.AD_Language,t.AD_Field_ID, t.Help,t.Description,t.Name, 'N',t.AD_Client_ID,t.AD_Org_ID,t.Created,t.Createdby,t.Updated,t.UpdatedBy FROM AD_Language l, AD_Field t WHERE l.IsActive='Y' AND l.IsSystemLanguage='Y' AND l.IsBaseLanguage='N' AND t.AD_Field_ID=3006875 AND NOT EXISTS (SELECT * FROM AD_Field_Trl tt WHERE tt.AD_Language=l.AD_Language AND tt.AD_Field_ID=t.AD_Field_ID)
;

-- 29/04/2020 20:40:45 ART
-- ISSUE #80: Optimización Cierres de Caja.
UPDATE AD_Field SET SeqNo=0,IsDisplayed='N' WHERE AD_Field_ID=3006875
;

-- Registración de script
SELECT register_migration_script_lar('0152_ISSUE-80.sql', 'LAR', '')
;
