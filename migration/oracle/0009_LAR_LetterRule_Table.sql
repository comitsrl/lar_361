CREATE TABLE adempiere.LAR_LetterRule
(
  AD_Client_ID                  numeric(10,0) NOT NULL,
  AD_Org_ID                    	numeric(10,0) NOT NULL,
  Created                      	timestamp NOT NULL,
  CreatedBy                    	numeric(10,0) NULL,
  Updated                      	timestamp NOT NULL,
  UpdatedBy                    	numeric(10,0) NOT NULL,
  IsActive                     	char(1) NOT NULL,
  LAR_LetterRule_ID             numeric(10,0) NOT NULL,
  LAR_DocumentLetter_ID         numeric(10,0) NOT NULL,
  LCO_TaxPayerType_Vendor_ID    numeric(10,0) NOT NULL,
  LCO_TaxPayerType_Customer_ID  numeric(10,0) NOT NULL,
  MaxAmt                        numeric,

  PRIMARY KEY (LAR_LetterRule_ID),
  CONSTRAINT adclient_lardocumentletter FOREIGN KEY (ad_client_id)
      REFERENCES adempiere.ad_client (ad_client_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT adorg_lardocumentletter FOREIGN KEY (ad_org_id)
      REFERENCES adempiere.ad_org (ad_org_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lardocumentletter_larletterrule FOREIGN KEY (LAR_DocumentLetter_ID)
      REFERENCES adempiere.LAR_DocumentLetter(LAR_DocumentLetter_ID) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lcotaxpayertype_vendor_larletterrule FOREIGN KEY (LCO_TaxPayerType_Vendor_ID)
      REFERENCES adempiere.LCO_TaxPayerType(LCO_TaxPayerType_ID) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT lcotaxpayertype_customer_larletterrule FOREIGN KEY (LCO_TaxPayerType_Customer_ID)
      REFERENCES adempiere.LCO_TaxPayerType(LCO_TaxPayerType_ID) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT larletterrule_documentletter_idx UNIQUE (AD_Client_ID, LCO_TaxPayerType_Vendor_ID,
          LCO_TaxPayerType_Customer_ID, LAR_DocumentLetter_ID)
)
