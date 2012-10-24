CREATE TABLE adempiere.LAR_DocumentLetter
(
  AD_Client_ID                  number(10,0) NOT NULL,
  AD_Org_ID                    	number(10,0) NOT NULL,
  Created                      	timestamp NOT NULL,
  CreatedBy                    	number(10,0) NULL,
  Updated                      	timestamp NOT NULL,
  UpdatedBy                    	number(10,0) NOT NULL,
  IsActive                     	char(1) NOT NULL,
  LAR_DocumentLetter_ID         number(10,0) NOT NULL,
  Letter                        character(1) NOT NULL,
  Description                   varchar2(255),
  IsDefault                     character(1) DEFAULT 'N' NOT NULL,
  PRIMARY KEY(LAR_DocumentLetter_ID)
);

ALTER TABLE LAR_DocumentLetter ADD
  CONSTRAINT dl_ad_client_fkx FOREIGN KEY (ad_client_id)
      REFERENCES adempiere.ad_client (ad_client_id);

ALTER TABLE LAR_DocumentLetter ADD
  CONSTRAINT dl_ad_org_fkx FOREIGN KEY (ad_org_id)
      REFERENCES adempiere.ad_org (ad_org_id);

ALTER TABLE LAR_DocumentLetter ADD
  CONSTRAINT adorg_letter_idx UNIQUE (ad_client_id , letter);
