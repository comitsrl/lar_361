-- 07/04/2026
-- Ajuste constraint para C_BankAccount.LAR_CodigoDependencia:
-- permitir alfanumericos y espacios (1 a 15 caracteres), manteniendo NULL permitido.

ALTER TABLE C_BankAccount
DROP CONSTRAINT IF EXISTS c_bankaccount_codigodep_chk
;

ALTER TABLE C_BankAccount
ADD CONSTRAINT c_bankaccount_codigodep_chk
CHECK (
    LAR_CodigoDependencia IS NULL
    OR LAR_CodigoDependencia ~ '^[A-Za-z0-9 ]{1,15}$'
)
;

-- Registración de script
SELECT register_migration_script_lar('0246_ISSUE-155.sql', 'LAR', '')
;
