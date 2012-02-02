/* Tabla con los Tipos de contribuyente segun AFIP (Resp. Inscripto, Monotributo, etc.)
Author: ACF - OPENBIZ
Fecha: 12/11/2008
*/

CREATE TABLE LAR_TipoContribuyente (
  LAR_TipoContribuyente_ID numeric(10) NOT NULL,
  AD_Client_ID numeric(10) NOT NULL,
  AD_Org_ID numeric(10) NOT NULL,
  IsActive char(1) NOT NULL DEFAULT 'Y'::bpchar,
  Created timestamp NOT NULL DEFAULT now(),
  CreatedBy numeric(10) NOT NULL,
  Updated timestamp NOT NULL DEFAULT now(),
  UpdatedBy numeric(10) NOT NULL,
  Name varchar(60) NOT NULL,
  Value varchar(40) NOT NULL,
  Description varchar(255),
  CodeAFIP numeric(3),
  DiscriminateTax char(1) NOT NULL DEFAULT 'Y'::bpchar,
  LAR_ClaseDocumento_ID numeric(10),

  CONSTRAINT LAR_TipoContribuyente_pkey PRIMARY KEY (LAR_TipoContribuyente_ID),
  CONSTRAINT LAR_TipoContribuyente_isactive_check CHECK (IsActive = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
  CONSTRAINT LAR_TipoContribuyente_discriminatetax_check CHECK (DiscriminateTax = ANY (ARRAY['Y'::bpchar, 'N'::bpchar])),
  CONSTRAINT LAR_tipocontribuyente_clasedoc FOREIGN KEY (LAR_ClaseDocumento_ID) REFERENCES LAR_ClaseDocumento (LAR_ClaseDocumento_ID)
);

-- AD_REFERENCE para LAR_ClaseDocumento_ID
INSERT INTO adempiere.AD_Reference(ad_reference_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, validationtype, vformat, entitytype, isorderbyvalue)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=14),  -- AD_Reference_ID
 0, 0, 'Y', '2010-08-30 17:22:21.0', 100, '2010-09-02 21:51:50.0', 100, 'LAR_ClaseDocumento', 'Clase de Documento', 'Clase de Documento (DNI, CUIT, CUIL, etc.)', 'T', NULL, 'LAR', 'N');

INSERT INTO adempiere.AD_Reference_Trl(ad_reference_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=14),  -- AD_Reference_ID
 'es_AR', 0, 0, 'Y', '2010-08-30 17:22:21.0', 100, '2010-09-02 21:52:07.888', 100, 'LAR_ClaseDocumento', 'Clase de Documento', 'Clase de Documento (DNI, CUIT, CUIL, etc.)', 'N');

INSERT INTO adempiere.AD_Ref_Table(ad_reference_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, ad_table_id, ad_key, ad_display, isvaluedisplayed, whereclause, orderbyclause, entitytype, ad_window_id)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=14),  -- AD_Reference_ID
 0, 0, 'Y', '2010-08-30 17:22:37.0', 100, '2010-09-02 21:52:35.0', 100,
(SELECT AD_Table_ID FROM adempiere.AD_Table WHERE TableName = 'LAR_ClaseDocumento'), -- AD_Table_ID
(SELECT AD_Column_ID FROM adempiere.AD_Column WHERE ColumnName = 'LAR_ClaseDocumento_ID' AND AD_Table_ID = (SELECT AD_Table_ID FROM adempiere.AD_Table WHERE TableName = 'LAR_ClaseDocumento')), -- AD_Column_ID
(SELECT AD_Column_ID FROM adempiere.AD_Column WHERE ColumnName = 'Name' AND AD_Table_ID = (SELECT AD_Table_ID FROM adempiere.AD_Table WHERE TableName = 'LAR_ClaseDocumento')), -- AD_Column_ID
'N', 'LAR_ClaseDocumento.IsActive=''Y''', NULL, 'LAR', NULL);
--

-- AD_Table
INSERT INTO adempiere.AD_Table(ad_table_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, tablename, isview, accesslevel, entitytype, ad_window_id, ad_val_rule_id, loadseq, issecurityenabled, isdeleteable, ishighvolume, importtable, ischangelog, replicationtype, po_window_id, copycolumnsfromtable, iscentrallymaintained)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
 0, 0, 'Y', '2010-08-30 16:18:42.0', 100, '2010-08-30 16:18:42.0', 100, 'Tipo Contribuyente', 'Tipo de contribuyente', 'Indica el tipo de contribuyente para la AFIP', 'LAR_TipoContribuyente', 'N', '6', 'LAR', NULL, NULL, 0, 'N', 'Y', 'N', 'N', 'N', 'L', NULL, 'N', 'Y');

INSERT INTO adempiere.AD_Table_Trl(ad_table_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
 'es_AR', 0, 0, 'Y', '2010-08-30 16:18:42.0', 100, '2010-08-30 16:18:42.0', 100, 'Tipo Contribuyente', 'N');
--

-- AD_Window
INSERT INTO adempiere.AD_Window(ad_window_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, windowtype, issotrx, entitytype, processing, ad_image_id, ad_color_id, isdefault, winheight, winwidth, isbetafunctionality)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=27),  -- AD_Window_ID
 0, 0, 'Y', '2010-08-30 16:38:58.0', 100, '2010-08-30 16:38:58.0', 100, 'Tipo Contribuyente', 'Tipo de contribuyente', 'Almacena los tipos de contribuyentes segun AFIP', 'M', 'Y', 'LAR', 'N', NULL, NULL, 'N', 0, 0, 'N');

INSERT INTO adempiere.AD_Window_Trl(ad_window_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=27),  -- AD_Window_ID
 'es_AR', 0, 0, 'Y', '2010-08-30 16:38:58.0', 100, '2010-08-30 16:38:58.0', 100, 'Tipo Contribuyente', 'Tipo de contribuyente', 'Almacena los tipos de contribuyentes segun AFIP', 'N');

-- AD_Tab
INSERT INTO adempiere.AD_Tab(ad_tab_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, ad_table_id, ad_window_id, seqno, tablevel, issinglerow, isinfotab, istranslationtab, isreadonly, ad_column_id, hastree, whereclause, orderbyclause, commitwarning, ad_process_id, processing, ad_image_id, importfields, ad_columnsortorder_id, ad_columnsortyesno_id, issorttab, entitytype, included_tab_id, readonlylogic, displaylogic, isinsertrecord, isadvancedtab, parent_column_id)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID
 0, 0, 'Y', '2010-08-30 16:39:26.0', 100, '2010-08-30 16:39:26.0', 100, 'Tipo Contribuyente', 'Tipos de contribuyente', 'Almacena los tipos de contribuyentes segun AFIP',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=27),  -- AD_Window_ID
10, 0, 'N', 'N', 'N', 'N', NULL, 'N', NULL, NULL, NULL, NULL, 'N', NULL, 'N', NULL, NULL, 'N', 'LAR', NULL, NULL, NULL, 'Y', 'N', NULL);

INSERT INTO adempiere.AD_Tab_Trl(ad_tab_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, commitwarning, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID
 'es_AR', 0, 0, 'Y', '2010-08-30 16:39:26.0', 100, '2010-08-30 16:39:26.0', 100, 'Tipo Contribuyente', 'Tipos de contribuyente', 'Almacena los tipos de contribuyentes segun AFIP', NULL, 'N');
--

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
0, 0, 'Y', '2010-08-30 16:37:44.0', '2010-08-30 16:37:44.0', 100, 100, 'Client', 'Client/Tenant for this installation.', 'A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.', 0, 'LAR', 'AD_Client_ID',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
19, NULL, NULL, 10, NULL, 'N', 'N', 'Y', 'N', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 102, NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
'es_AR', 0, 0, 'Y', '2010-08-30 16:37:44.0', 100, '2010-08-30 16:37:44.0', 100, 'Compañía', 'N');


INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2010-08-30 16:39:41.0', 100, '2010-08-30 16:41:02.0', 100, 'Client', 'Client/Tenant for this installation.', 'A Client is a company or a legal entity. You cannot share data between Clients. Tenant is a synonym for Client.', 'Y',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 NULL, 'Y', NULL, 25, 'N', 10, NULL, 'N', 'N', 'N', 'N', 'LAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2010-08-30 16:39:41.0', 100, '2010-09-02 22:17:36.423245', 100, 'Compañía', 'Cliente para esta instalación', 'Compañía ó entidad legal', 'N');

UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field
UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column
--

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
0, 0, 'Y', '2010-08-30 16:37:45.0', '2010-08-30 16:37:45.0', 100, 100, 'Organization', 'Organizational entity within client', 'An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.', 0, 'LAR', 'AD_Org_ID',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
19, NULL, NULL, 10, NULL, 'N', 'N', 'Y', 'N', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 113, NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
'es_AR', 0, 0, 'Y', '2010-08-30 16:37:45.0', 100, '2010-08-30 16:37:45.0', 100, 'Organización', 'N');

INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2010-08-30 16:39:42.0', 100, '2010-08-30 16:41:07.0', 100, 'Organization', 'Organizational entity within client', 'An organization is a unit of your client or legal entity - examples are store, department. You can share data between organizations.', 'Y',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 NULL, 'Y', NULL, 25, 'N', 20, NULL, 'Y', 'N', 'N', 'N', 'LAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2010-08-30 16:39:42.0', 100, '2010-09-02 22:17:36.423245', 100, 'Organización', 'Entidad organizacional dentro de la compañía', 'Una organización es una unidad de la compañía ó entidad legal - Ej. Tiendas y departamentos.', 'N');

UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field
UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column
--

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
0, 0, 'Y', '2010-08-30 16:37:45.0', '2010-08-30 16:37:45.0', 100, 100, 'Search Key', 'Search key for the record in the format required - must be unique', 'A search key allows you a fast method of finding a particular record.
If you leave the search key empty, the system automatically creates a numeric number.  The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).', 0, 'LAR', 'Value',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
10, NULL, NULL, 40, NULL, 'N', 'N', 'Y', 'Y', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 620, NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
'es_AR', 0, 0, 'Y', '2010-08-30 16:37:45.0', 100, '2010-08-30 16:37:45.0', 100, 'Clave de Búsqueda', 'N');

INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2010-08-30 16:39:42.0', 100, '2010-08-30 16:40:37.0', 100, 'Search Key', 'Search key for the record in the format required - must be unique', 'A search key allows you a fast method of finding a particular record.
If you leave the search key empty, the system automatically creates a numeric number.  The document sequence used for this fallback number is defined in the "Maintain Sequence" window with the name "DocumentNo_<TableName>", where TableName is the actual name of the table (e.g. C_Order).', 'Y',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 NULL, 'Y', NULL, 10, 'N', 30, NULL, 'N', 'N', 'N', 'N', 'LAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2010-08-30 16:39:42.0', 100, '2010-09-02 22:17:36.423245', 100, 'Clave de Búsqueda', 'Clave de búsqueda para el registro en el formato requerido; debe ser única', 'Una clave de búsqueda le permite a usted un método rápido de encontrar un registro en particular', 'N');

UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field
UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column
--

INSERT INTO adempiere.AD_Element(ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=188),  --  AD_Element_ID
 0, 0, 'Y', '2010-08-30 16:12:59.0', 100, '2010-08-30 16:12:59.0', 100, 'CodeAFIP', 'LAR', 'Codigo AFIP', 'Codigo AFIP', 'Codigo segun AFIP', 'Indica el codigo para la AFIP', NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Element_Trl(ad_element_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, printname, description, help, po_name, po_printname, po_description, po_help, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=188),  --  AD_Element_ID
 'es_AR', 0, 0, 'Y', '2010-08-30 16:12:59.0', 100, '2010-08-30 16:12:59.0', 100, 'Codigo AFIP', 'Codigo AFIP', 'Codigo segun AFIP', 'Indica el codigo para la AFIP', NULL, NULL, NULL, NULL, 'N');

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
0, 0, 'Y', '2010-08-30 16:37:45.0', '2010-09-02 21:48:41.0', 100, 100, 'Codigo AFIP', 'Codigo segun AFIP', 'Indica el codigo para la AFIP', 0, 'LAR', 'CodeAFIP',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
11, NULL, NULL, 3, NULL, 'N', 'N', 'N', 'Y', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=188),  --  AD_Element_ID
NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
'es_AR', 0, 0, 'Y', '2010-08-30 16:37:45.0', 100, '2010-08-30 16:37:45.0', 100, 'Codigo AFIP', 'N');

INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2010-08-30 16:39:41.0', 100, '2010-08-30 16:40:41.0', 100, 'Codigo AFIP', 'Codigo segun AFIP', 'Indica el codigo para la AFIP', 'Y',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 NULL, 'Y', NULL, 3, 'N', 40, NULL, 'Y', 'N', 'N', 'N', 'LAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2010-08-30 16:39:41.0', 100, '2010-08-30 16:39:41.0', 100, 'Codigo AFIP', 'Codigo segun AFIP', 'Indica el codigo para la AFIP', 'N');

UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field
UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column
UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=188;  -- AD_Element
--

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
0, 0, 'Y', '2010-08-30 16:37:45.0', '2010-08-30 16:37:45.0', 100, 100, 'Name', 'Alphanumeric identifier of the entity', 'The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.', 0, 'LAR', 'Name',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
10, NULL, NULL, 60, NULL, 'N', 'N', 'Y', 'Y', NULL, 'Y', 1, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 469, NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
'es_AR', 0, 0, 'Y', '2010-08-30 16:37:45.0', 100, '2010-08-30 16:37:45.0', 100, 'Nombre', 'N');

INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2010-08-30 16:39:42.0', 100, '2010-08-30 16:39:42.0', 100, 'Name', 'Alphanumeric identifier of the entity', 'The name of an entity (record) is used as an default search option in addition to the search key. The name is up to 60 characters in length.', 'Y',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 NULL, 'Y', NULL, 60, 'N', 50, NULL, 'N', 'N', 'N', 'N', 'LAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2010-08-30 16:39:42.0', 100, '2010-09-02 22:17:36.423245', 100, 'Nombre', 'Identificador alfanumérico de la entidad.', 'El nombre de una entidad (registro) se usa como una opción de búsqueda predeterminada adicional a la clave de búsqueda. El nombre es de hasta 60 caracteres de longitud.', 'N');

UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field
UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column
--

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
0, 0, 'Y', '2010-08-30 16:37:45.0', '2010-08-30 16:37:45.0', 100, 100, 'Description', 'Optional short description of the record', 'A description is limited to 255 characters.', 0, 'LAR', 'Description',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
10, NULL, NULL, 255, NULL, 'N', 'N', 'N', 'Y', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 275, NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
'es_AR', 0, 0, 'Y', '2010-08-30 16:37:45.0', 100, '2010-08-30 16:37:45.0', 100, 'Descripción', 'N');

INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2010-08-30 16:39:42.0', 100, '2010-08-30 16:39:42.0', 100, 'Description', 'Optional short description of the record', 'A description is limited to 255 characters.', 'Y',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 NULL, 'Y', NULL, 255, 'N', 60, NULL, 'N', 'N', 'N', 'N', 'LAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2010-08-30 16:39:42.0', 100, '2010-09-02 22:17:36.423245', 100, 'Descripción', 'Descripción corta opcional del registro', 'Una descripción esta limitada a 255 caracteres', 'N');

UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field
UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column
--

INSERT INTO adempiere.AD_Element(ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=188),  --  AD_Element_ID
 0, 0, 'Y', '2010-08-30 16:14:22.0', 100, '2010-08-30 16:14:22.0', 100, 'DiscriminateTax', 'LAR', 'Discrimina I.V.A.', 'Discrimina I.V.A.', 'Discrimina el I.V.A.', 'Indica si se discrimina I.V.A. para este contribuyente', NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Element_Trl(ad_element_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, printname, description, help, po_name, po_printname, po_description, po_help, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=188),  --  AD_Element_ID
 'es_AR', 0, 0, 'Y', '2010-08-30 16:14:22.0', 100, '2010-08-30 16:14:22.0', 100, 'Discrimina I.V.A.', 'Discrimina I.V.A.', 'Discrimina el I.V.A.', 'Indica si se discrimina I.V.A. para este contribuyente', NULL, NULL, NULL, NULL, 'N');

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
0, 0, 'Y', '2010-08-30 16:37:45.0', '2010-08-30 16:37:45.0', 100, 100, 'Discrimina I.V.A.', 'Discrimina el I.V.A.', 'Indica si se discrimina I.V.A. para este contribuyente', 0, 'LAR', 'DiscriminateTax',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
20, NULL, NULL, 1, NULL, 'N', 'N', 'Y', 'Y', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=188),  --  AD_Element_ID
NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
'es_AR', 0, 0, 'Y', '2010-08-30 16:37:45.0', 100, '2010-08-30 16:37:45.0', 100, 'Discrimina I.V.A.', 'N');

INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2010-08-30 16:39:42.0', 100, '2010-08-30 16:39:42.0', 100, 'Discrimina I.V.A.', 'Discrimina el I.V.A.', 'Indica si se discrimina I.V.A. para este contribuyente', 'Y',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 NULL, 'Y', NULL, 1, 'N', 70, NULL, 'N', 'N', 'N', 'N', 'LAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2010-08-30 16:39:42.0', 100, '2010-08-30 16:39:42.0', 100, 'Discrimina I.V.A.', 'Discrimina el I.V.A.', 'Indica si se discrimina I.V.A. para este contribuyente', 'N');

UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field
UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column
UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=188;  -- AD_Element
--

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
0, 0, 'Y', '2010-08-30 16:37:45.0', '2010-08-30 17:22:45.0', 100, 100, 'Clase Documento', 'Clase de Documento del contribuyente', 'Indica la clase de documento del contribuyente (CUIT, CUIL, DNI, etc.)', 0, 'LAR', 'LAR_ClaseDocumento_ID',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
18,
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=14),  -- AD_Reference_ID
NULL, 10, NULL, 'N', 'N', 'N', 'Y', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N',
(SELECT AD_Element_ID FROM adempiere.AD_Column WHERE ColumnName = 'LAR_ClaseDocumento_ID' AND AD_Table_ID = (SELECT AD_Table_ID FROM adempiere.AD_Table WHERE TableName='LAR_ClaseDocumento')), -- AD_Element_ID ya estaba definido
NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
'es_AR', 0, 0, 'Y', '2010-08-30 16:37:45.0', 100, '2010-08-30 16:37:45.0', 100, 'Clase Documento', 'N');

INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2010-08-30 16:39:41.0', 100, '2010-08-30 16:40:56.0', 100, 'Clase Documento', 'Clase de Documento del contribuyente', 'Indica la clase de documento del contribuyente (CUIT, CUIL, DNI, etc.)', 'Y',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 NULL, 'Y', NULL, 25, 'N', 80, NULL, 'Y', 'N', 'N', 'N', 'LAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2010-08-30 16:39:41.0', 100, '2010-08-30 16:39:41.0', 100, 'Clase Documento', 'Clase de Documento del contribuyente', 'Indica la clase de documento del contribuyente (CUIT, CUIL, DNI, etc.)', 'N');

UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field
UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=14;  -- AD_Reference
UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column
--

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
0, 0, 'Y', '2010-08-30 16:37:45.0', '2010-08-30 16:37:45.0', 100, 100, 'Active', 'The record is active in the system', 'There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.', 0, 'LAR', 'IsActive',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
20, NULL, NULL, 1, NULL, 'N', 'N', 'Y', 'Y', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 348, NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
'es_AR', 0, 0, 'Y', '2010-08-30 16:37:45.0', 100, '2010-08-30 16:37:45.0', 100, 'Activo', 'N');

INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2010-08-30 16:39:41.0', 100, '2010-08-30 16:39:41.0', 100, 'Active', 'The record is active in the system', 'There are two methods of making records unavailable in the system: One is to delete the record, the other is to de-activate the record. A de-activated record is not available for selection, but available for reports.
There are two reasons for de-activating and not deleting records:
(1) The system requires the record for audit purposes.
(2) The record is referenced by other records. E.g., you cannot delete a Business Partner, if there are invoices for this partner record existing. You de-activate the Business Partner and prevent that this record is used for future entries.', 'Y',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 NULL, 'Y', NULL, 1, 'N', 90, NULL, 'N', 'N', 'N', 'N', 'LAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2010-08-30 16:39:41.0', 100, '2010-09-02 22:17:36.423245', 100, 'Activo', 'El registro está activo en el sistema', 'Hay dos métodos para que los registros no estén disponibles en el sistema: Uno es eliminar el registro; el otro es desactivarlo. Un registro desactivado no está disponible para selección; pero está disponible para Informes', 'N');

UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field
UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column
--

INSERT INTO adempiere.AD_Element(ad_element_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, columnname, entitytype, name, printname, description, help, po_name, po_printname, po_description, po_help)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=188),  --  AD_Element_ID
 0, 0, 'Y', '2010-08-30 16:12:15.0', 100, '2010-08-30 16:12:15.0', 100, 'LAR_TipoContribuyente_ID', 'LAR', 'Tipo Contribuyente', 'Tipo Contribuyente', 'Tipo de contribuyente', 'Indica el tipo de contribuyente para AFIP', NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Element_Trl(ad_element_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, printname, description, help, po_name, po_printname, po_description, po_help, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=188),  --  AD_Element_ID
 'es_AR', 0, 0, 'Y', '2010-08-30 16:12:15.0', 100, '2010-08-30 16:12:15.0', 100, 'Tipo Contribuyente', 'Tipo Contribuyente', 'Tipo de contribuyente', 'Indica el tipo de contribuyente para AFIP', NULL, NULL, NULL, NULL, 'N');

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
0, 0, 'Y', '2010-08-30 16:37:44.0', '2010-08-30 16:37:44.0', 100, 100, 'Tipo Contribuyente', 'Tipo de contribuyente', 'Indica el tipo de contribuyente para AFIP', 0, 'LAR', 'LAR_TipoContribuyente_ID',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
13, NULL, NULL, 10, NULL, 'Y', 'N', 'Y', 'N', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=188),  --  AD_Element_ID
NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
'es_AR', 0, 0, 'Y', '2010-08-30 16:37:44.0', 100, '2010-08-30 16:37:44.0', 100, 'Tipo Contribuyente', 'N');

INSERT INTO adempiere.AD_Field(ad_field_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, iscentrallymaintained, ad_tab_id, ad_column_id, ad_fieldgroup_id, isdisplayed, displaylogic, displaylength, isreadonly, seqno, sortno, issameline, isheading, isfieldonly, isencrypted, entitytype, obscuretype, ad_reference_id, ismandatory, included_tab_id, defaultvalue, ad_reference_value_id, ad_val_rule_id, infofactoryclass)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 0, 0, 'Y', '2010-08-30 16:39:42.0', 100, '2010-08-30 16:39:42.0', 100, 'Tipo Contribuyente', 'Tipo de contribuyente', 'Indica el tipo de contribuyente para AFIP', 'Y',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=19),  --  AD_Tab_ID
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
 NULL, 'N', NULL, 10, 'N', NULL, NULL, 'N', 'N', 'N', 'N', 'LAR', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

INSERT INTO adempiere.AD_Field_Trl(ad_field_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, help, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=4),  --  AD_Field_ID
 'es_AR', 0, 0, 'Y', '2010-08-30 16:39:42.0', 100, '2010-08-30 16:39:42.0', 100, 'Tipo Contribuyente', 'Tipo de contribuyente', 'Indica el tipo de contribuyente para AFIP', 'N');

UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=4;	-- AD_Field
UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column
UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=188;  -- AD_Element
--

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
0, 0, 'Y', '2010-08-30 16:37:45.0', '2010-08-30 16:37:45.0', 100, 100, 'Created', 'Date this record was created', 'The Created field indicates the date that this record was created.', 0, 'LAR', 'Created',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
16, NULL, NULL, 29, NULL, 'N', 'N', 'Y', 'N', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 245, NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
'es_AR', 0, 0, 'Y', '2010-08-30 16:37:45.0', 100, '2010-08-30 16:37:45.0', 100, 'Creado', 'N');

UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column
--

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
0, 0, 'Y', '2010-08-30 16:37:45.0', '2010-08-30 16:37:45.0', 100, 100, 'Created By', 'User who created this records', 'The Created By field indicates the user who created this record.', 0, 'LAR', 'CreatedBy',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
18, 110, NULL, 10, NULL, 'N', 'N', 'Y', 'N', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 246, NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
'es_AR', 0, 0, 'Y', '2010-08-30 16:37:45.0', 100, '2010-08-30 16:37:45.0', 100, 'Creado Por', 'N');

UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column
--

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
0, 0, 'Y', '2010-08-30 16:37:45.0', '2010-08-30 16:37:45.0', 100, 100, 'Updated', 'Date this record was updated', 'The Updated field indicates the date that this record was updated.', 0, 'LAR', 'Updated',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
16, NULL, NULL, 29, NULL, 'N', 'N', 'Y', 'N', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 607, NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
'es_AR', 0, 0, 'Y', '2010-08-30 16:37:45.0', 100, '2010-08-30 16:37:45.0', 100, 'Actualizado', 'N');

UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column
--

INSERT INTO adempiere.AD_Column(ad_column_id, ad_client_id, ad_org_id, isactive, created, updated, createdby, updatedby, name, description, help, version, entitytype, columnname, ad_table_id, ad_reference_id, ad_reference_value_id, ad_val_rule_id, fieldlength, defaultvalue, iskey, isparent, ismandatory, isupdateable, readonlylogic, isidentifier, seqno, istranslated, isencrypted, callout, vformat, valuemin, valuemax, isselectioncolumn, ad_element_id, ad_process_id, issyncdatabase, isalwaysupdateable, columnsql, mandatorylogic, infofactoryclass, isautocomplete, isallowlogging, formatpattern)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
0, 0, 'Y', '2010-08-30 16:37:45.0', '2010-08-30 16:37:45.0', 100, 100, 'Updated By', 'User who updated this records', 'The Updated By field indicates the user who updated this record.', 0, 'LAR', 'UpdatedBy',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=21),  -- AD_Table_ID
18, 110, NULL, 10, NULL, 'N', 'N', 'Y', 'N', NULL, 'N', NULL, 'N', 'N', NULL, NULL, NULL, NULL, 'N', 608, NULL, 'N', 'N', NULL, NULL, NULL, 'N', 'Y', NULL);

INSERT INTO adempiere.AD_Column_Trl(ad_column_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=3),  --  AD_Column_ID
'es_AR', 0, 0, 'Y', '2010-08-30 16:37:45.0', 100, '2010-08-30 16:37:45.0', 100, 'Actualizado por', 'N');

UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=3;  -- AD_Column
--
-- Inserta la ventana en AD_Menu
INSERT INTO adempiere.AD_Menu(ad_menu_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, name, updatedby, description, issummary, issotrx, isreadonly, action, ad_window_id, ad_workflow_id, ad_task_id, ad_process_id, ad_form_id, ad_workbench_id, entitytype, iscentrallymaintained)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=7),  -- AD_Menu_ID
 0, 0, 'Y', '2010-08-30 16:41:31.0', 100, '2010-08-30 16:41:31.0', 'Tipo Contribuyente', 100, 'Tipo de contribuyente', 'N', 'N', 'N', 'W',
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=27),  -- AD_Window_ID
NULL, NULL, NULL, NULL, NULL, 'LAR', 'Y');

INSERT INTO adempiere.AD_Menu_Trl(ad_menu_id, ad_language, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, istranslated)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=7),  -- AD_Menu_ID
 'es_AR', 0, 0, 'Y', '2010-08-30 16:41:31.0', 100, '2010-08-30 16:41:31.0', 100, 'Tipo Contribuyente', 'Tipo de contribuyente', 'N');

INSERT INTO adempiere.AD_TreeNodeMM(ad_tree_id, node_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, parent_id, seqno)
  VALUES(10,
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=7),  -- AD_Menu_ID
0, 0, 'Y', '2010-08-30 16:41:31.273716', 100, '2010-08-30 16:41:35.895573', 100,
(SELECT AD_Menu_ID FROM AD_Menu WHERE UPPER(name) = 'LOCALIZACION ARGENTINA'),
0);


UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=7;  -- AD_Menu
--

UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=21;  --  AD_Table
UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=19;  -- AD_Tab
UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=27;  -- AD_Window
--

-- AD_Sequence
-- Inserta tabla LAR_TipoContribuyente en AD_Sequence
INSERT INTO adempiere.AD_Sequence(ad_sequence_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, description, vformat, isautosequence, incrementno, startno, currentnext, currentnextsys, isaudited, istableid, prefix, suffix, startnewyear, datecolumn, decimalpattern)
  VALUES(
(SELECT CurrentNext FROM adempiere.AD_Sequence WHERE AD_Sequence_ID=16),  -- AD_Sequence_ID
0, 0, 'Y', '2010-08-24 23:29:25.0', 100, '2010-08-24 23:29:25.0', 100, 'LAR_TipoContribuyente', 'Table LAR_TipoContribuyente', NULL, 'Y', 1, 1000000,  1000000, 50000, 'N', 'Y', NULL, NULL, 'N', NULL, NULL);

UPDATE adempiere.AD_Sequence SET CurrentNext = CurrentNext + 1 WHERE AD_Sequence_ID=16;  --  AD_Sequence

--
--FIN ACTUALIZA DICCIONARIO

-- Tipos de Contribuyente segun AFIP
INSERT INTO adempiere.LAR_TipoContribuyente(lar_tipocontribuyente_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, value, description, codeafip, discriminatetax, LAR_ClaseDocumento_ID)
  VALUES(1000000, 0, 0, 'Y', '2008-04-08 16:03:12.0', 100, '2008-04-08 16:03:12.0', 100, 'IVA Responsable Inscripto', 'RI', NULL, 1, 'Y', (SELECT LAR_ClaseDocumento_ID FROM adempiere.LAR_ClaseDocumento WHERE Value ='80'));
INSERT INTO adempiere.LAR_TipoContribuyente(lar_tipocontribuyente_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, value, description, codeafip, discriminatetax, LAR_ClaseDocumento_ID)
  VALUES(1000001, 0, 0, 'Y', '2008-04-08 16:03:38.0', 100, '2008-04-08 16:03:38.0', 100, 'IVA Responsable No Inscripto', 'RNI', NULL, 2, 'N', (SELECT LAR_ClaseDocumento_ID FROM adempiere.LAR_ClaseDocumento WHERE Value ='80'));
INSERT INTO adempiere.LAR_TipoContribuyente(lar_tipocontribuyente_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, value, description, codeafip, discriminatetax, LAR_ClaseDocumento_ID)
  VALUES(1000002, 0, 0, 'Y', '2008-04-08 16:04:02.0', 100, '2008-04-08 16:04:02.0', 100, 'IVA No Responsable', 'NR', NULL, 3, 'N', NULL);
INSERT INTO adempiere.LAR_TipoContribuyente(lar_tipocontribuyente_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, value, description, codeafip, discriminatetax, LAR_ClaseDocumento_ID)
  VALUES(1000003, 0, 0, 'Y', '2008-04-08 16:04:26.0', 100, '2008-04-08 16:04:26.0', 100, 'IVA Sujeto Exento', 'EX', NULL, 4, 'N', (SELECT LAR_ClaseDocumento_ID FROM adempiere.LAR_ClaseDocumento WHERE Value ='80'));
INSERT INTO adempiere.LAR_TipoContribuyente(lar_tipocontribuyente_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, value, description, codeafip, discriminatetax, LAR_ClaseDocumento_ID)
  VALUES(1000004, 0, 0, 'Y', '2008-04-08 16:04:45.0', 100, '2008-04-08 16:04:45.0', 100, 'Consumidor Final', 'CF', NULL, 5, 'N', NULL);
INSERT INTO adempiere.LAR_TipoContribuyente(lar_tipocontribuyente_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, value, description, codeafip, discriminatetax, LAR_ClaseDocumento_ID)
  VALUES(1000005, 0, 0, 'Y', '2008-04-08 16:05:13.0', 100, '2008-04-08 16:05:13.0', 100, 'Responsable Monotributo', 'RM', NULL, 6, 'N', (SELECT LAR_ClaseDocumento_ID FROM adempiere.LAR_ClaseDocumento WHERE Value ='80'));
INSERT INTO adempiere.LAR_TipoContribuyente(lar_tipocontribuyente_id, ad_client_id, ad_org_id, isactive, created, createdby, updated, updatedby, name, value, description, codeafip, discriminatetax, LAR_ClaseDocumento_ID)
  VALUES(1000006, 0, 0, 'Y', '2008-04-08 16:05:38.0', 100, '2008-04-08 16:05:38.0', 100, 'Sujeto No Categorizado', 'NC', NULL, 7, 'N', NULL);

-- Actualiza AD_Sequence para LAR_ClaseDocumento en AD_Sequence
UPDATE adempiere.AD_Sequence SET CurrentNext = (SELECT Max(LAR_ClaseDocumento_ID)+1 FROM adempiere.LAR_ClaseDocumento)
WHERE AD_Sequence_ID=(SELECT AD_Sequence_ID FROM adempiere.AD_Sequence WHERE Name = 'LAR_TipoContribuyente');  -- AD_Sequence para LAR_TipoContribuyente
