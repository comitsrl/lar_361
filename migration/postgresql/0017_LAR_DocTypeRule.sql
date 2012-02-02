/* Tipos de Documento a Emitir según el Tipo de Contribuyente
Author: ACF - OPENBIZ
Fecha: 12/11/2008
*/

CREATE TABLE LAR_DocTypeRule
(
 LAR_DocTypeRule_ID numeric(10) NOT NULL,
 AD_Client_ID numeric(10) NOT NULL,
 AD_Org_ID numeric(10) NOT NULL,
 IsActive char(1) NOT NULL DEFAULT 'Y'::bpchar,
 Created timestamp NOT NULL DEFAULT now(),
 CreatedBy numeric(10) NOT NULL,
 Updated timestamp NOT NULL DEFAULT now(),
 UpdatedBy numeric(10) NOT NULL,
 C_DocType_ID numeric(10) NOT NULL,
 DiscriminateTax char(1) NOT NULL DEFAULT 'Y'::bpchar,
 LAR_TipoContribFrom_ID numeric(10) NOT NULL,
 LAR_TipoContribTo_ID numeric(10) NOT NULL,

 CONSTRAINT LAR_DocTypeRule_pkey PRIMARY KEY (LAR_DocTypeRule_ID),
 CONSTRAINT LAR_DocTypeRule_isactive_check CHECK (IsActive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
 CONSTRAINT LAR_DocTypeRule_discriminatetax_check CHECK (DiscriminateTax = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
 CONSTRAINT LAR_DocTypeRule_doctype FOREIGN KEY(C_DocType_ID)
    REFERENCES C_DocType(C_DocType_ID),
 CONSTRAINT LAR_DocTypeRule_tipocontribfrom FOREIGN KEY(LAR_TipoContribFrom_ID)
    REFERENCES LAR_TipoContribuyente(LAR_TipoContribuyente_ID),
 CONSTRAINT LAR_DocTypeRule_tipocontribto FOREIGN KEY(LAR_TipoContribTo_ID)
    REFERENCES LAR_TipoContribuyente(LAR_TipoContribuyente_ID)
);
