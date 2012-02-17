ALTER TABLE LCO_WithholdingRuleConf ADD COLUMN PaymentThresholdMin NUMERIC;
ALTER TABLE LCO_WithholdingRuleConf ADD COLUMN IsCalcFromPayment CHARACTER(1) NOT NULL DEFAULT 'N';
ALTER TABLE LCO_WithholdingRuleConf ADD COLUMN C_DocType_ID NUMERIC(10,0);
ALTER TABLE LCO_WithholdingRuleConf ADD CONSTRAINT CDocType_LCOWithholdingRuleConf FOREIGN KEY (C_DocType_ID)
        REFERENCES C_DocType (C_DocType_ID);
