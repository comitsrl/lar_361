CREATE TABLE adempiere.LAR_LetterRule
(
  AD_Client_ID                  number(10,0) NOT NULL,
  AD_Org_ID                    	number(10,0) NOT NULL,
  Created                      	timestamp NOT NULL,
  CreatedBy                    	number(10,0) NULL,
  Updated                      	timestamp NOT NULL,
  UpdatedBy                    	number(10,0) NOT NULL,
  IsActive                     	char(1) NOT NULL,
  LAR_LetterRule_ID             number(10,0) NOT NULL,
  LAR_DocumentLetter_ID         number(10,0) NOT NULL,
  LCO_TaxPayerType_Vendor_ID    number(10,0) NOT NULL,
  LCO_TaxPayerType_Customer_ID  number(10,0) NOT NULL,
  MaxAmt                        number,
  PRIMARY KEY (LAR_LetterRule_ID)
);

ALTER TABLE LAR_LetterRule ADD
  CONSTRAINT lr_ad_client_fkx FOREIGN KEY (ad_client_id)
      REFERENCES adempiere.ad_client (ad_client_id);

ALTER TABLE LAR_LetterRule ADD
  CONSTRAINT lr_ad_org_fkx FOREIGN KEY (ad_org_id)
      REFERENCES adempiere.ad_org (ad_org_id) MATCH SIMPLE

ALTER TABLE LAR_LetterRule ADD
  CONSTRAINT lr_letter_fkx FOREIGN KEY (LAR_DocumentLetter_ID)
      REFERENCES adempiere.LAR_DocumentLetter(LAR_DocumentLetter_ID);

ALTER TABLE LAR_LetterRule ADD
  CONSTRAINT lr_vendor_fkx FOREIGN KEY (LCO_TaxPayerType_Vendor_ID)
      REFERENCES adempiere.LCO_TaxPayerType(LCO_TaxPayerType_ID);

ALTER TABLE LAR_LetterRule ADD
  CONSTRAINT lr_customer_fkx FOREIGN KEY (LCO_TaxPayerType_Customer_ID)
      REFERENCES adempiere.LCO_TaxPayerType(LCO_TaxPayerType_ID);

ALTER TABLE LAR_LetterRule ADD
  CONSTRAINT lr_unique UNIQUE (AD_Client_ID, LCO_TaxPayerType_Vendor_ID,
          LCO_TaxPayerType_Customer_ID, LAR_DocumentLetter_ID);
