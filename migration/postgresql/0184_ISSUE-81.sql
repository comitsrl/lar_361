-- 21/07/2021 13:27:27 ART
-- BUG #377: Ajustes de Ventanas y traducciones
UPDATE AD_Column SET MandatoryLogic='@IsSOTrx@=N & @TenderType@=K & @EsRetencionSufrida@=N',Updated=TO_TIMESTAMP('2021-07-21 13:27:27','YYYY-MM-DD HH24:MI:SS'),UpdatedBy=100 WHERE AD_Column_ID=3002109
;

-- Registración de script
SELECT register_migration_script_lar('0184_ISSUE-81.sql', 'LAR', '')
;
