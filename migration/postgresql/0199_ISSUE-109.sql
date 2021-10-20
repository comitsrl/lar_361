-- 20/10/2021 17:54:05 ART
-- ISSUE #109: Filtro de Listas de precios, para alta de SdN.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('M_PriceList.EsListaMadre = ''N'' AND M_PriceList.IsSOPriceList = ''Y''','S',3000109,'LAR','M_PriceList Venta',100,100,TO_TIMESTAMP('2021-10-20 17:54:04','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_TIMESTAMP('2021-10-20 17:54:04','YYYY-MM-DD HH24:MI:SS'))
;

-- 20/10/2021 17:54:24 ART
-- ISSUE #109: Filtro de Listas de precios, para alta de SdN.
UPDATE AD_Column SET AD_Val_Rule_ID=3000109,Updated=TO_TIMESTAMP('2021-10-20 17:54:24','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=2930
;

-- 20/10/2021 17:55:12 ART
-- ISSUE #109: Filtro de Listas de precios, para alta de SdN.
INSERT INTO AD_Val_Rule (Code,Type,AD_Val_Rule_ID,EntityType,Name,CreatedBy,UpdatedBy,Updated,AD_Client_ID,IsActive,AD_Org_ID,Created) VALUES ('M_PriceList.EsListaMadre = ''N'' AND M_PriceList.IsSOPriceList = ''N''','S',3000110,'LAR','M_PriceList Compras',100,100,TO_TIMESTAMP('2021-10-20 17:55:12','YYYY-MM-DD HH24:MI:SS'),0,'Y',0,TO_TIMESTAMP('2021-10-20 17:55:12','YYYY-MM-DD HH24:MI:SS'))
;

-- 20/10/2021 17:59:05 ART
-- ISSUE #109: Filtro de Listas de precios, para alta de SdN.
UPDATE AD_Column SET AD_Val_Rule_ID=3000110,Updated=TO_TIMESTAMP('2021-10-20 17:59:05','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=2931
;

-- Registración de script
SELECT register_migration_script_lar('0199_ISSUE-109.sql', 'LAR', '')
;
