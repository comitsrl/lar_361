CREATE TABLE adempiere.LAR_DocumentLetter
(
  AD_Client_ID                  numeric(10,0) NOT NULL,
  AD_Org_ID                    	numeric(10,0) NOT NULL,
  Created                      	timestamp NOT NULL,
  CreatedBy                    	numeric(10,0) NULL,
  Updated                      	timestamp NOT NULL,
  UpdatedBy                    	numeric(10,0) NOT NULL,
  IsActive                     	char(1) NOT NULL,
  LAR_DocumentLetter_ID         numeric(10,0) NOT NULL,
  Letter                        character(1) NOT NULL,
  Description                   character varying(255),
  IsDefault                     character(1) NOT NULL DEFAULT 'N'::bpchar,

  PRIMARY KEY(LAR_DocumentLetter_ID),
  CONSTRAINT adclient_lardocumentletter FOREIGN KEY (ad_client_id)
      REFERENCES adempiere.ad_client (ad_client_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT adorg_lardocumentletter FOREIGN KEY (ad_org_id)
      REFERENCES adempiere.ad_org (ad_org_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT adorg_letter_idx UNIQUE (ad_client_id , letter)
);
