ALTER TABLE lco_withholdingcalc ADD COLUMN paymentthresholdmin NUMERIC;
ALTER TABLE lco_withholdingcalc ADD COLUMN iscalcfrompayment CHARACTER(1) NOT NULL DEFAULT 'N';
