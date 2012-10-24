ALTER TABLE LCO_WithholdingRuleConf ADD PaymentThresholdMin NUMERIC;
ALTER TABLE LCO_WithholdingRuleConf ADD IsCalcFromPayment CHARACTER(1) DEFAULT 'N' NOT NULL;
ALTER TABLE LCO_WithholdingRuleConf ADD C_DocType_ID NUMERIC(10,0);
ALTER TABLE LCO_WithholdingRuleConf ADD CONSTRAINT whr_doctype_fkx FOREIGN KEY (C_DocType_ID)
        REFERENCES C_DocType (C_DocType_ID);
