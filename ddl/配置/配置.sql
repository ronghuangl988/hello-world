--------------------------------------------
-- Export file for user C##_BIGDATA@ZZMDM --
-- Created by zhy on 2017/10/13, 11:00:20 --
--------------------------------------------

set define off
spool ����.log

prompt
prompt Creating table CODE_APPLY
prompt =========================
prompt
create table CODE_APPLY
(
  apply_code         VARCHAR2(120) not null,
  type               NUMBER(1),
  status             NUMBER(1),
  applicant          VARCHAR2(120),
  apply_release_date DATE,
  apply_date         DATE,
  remark             VARCHAR2(255),
  approval_remark    VARCHAR2(255)
)
;
comment on table CODE_APPLY
  is '��׼�������뵥';
comment on column CODE_APPLY.apply_code
  is '���뵥��';
comment on column CODE_APPLY.type
  is '�������ͣ�0��������1��ɾ����2���޸ģ�';
comment on column CODE_APPLY.status
  is '״̬��0����������1��������ͨ����2������ͨ����';
comment on column CODE_APPLY.applicant
  is '������';
comment on column CODE_APPLY.apply_release_date
  is '���뷢������';
comment on column CODE_APPLY.apply_date
  is '��������';
comment on column CODE_APPLY.remark
  is '���뱸ע';
comment on column CODE_APPLY.approval_remark
  is '������ע';
alter table CODE_APPLY
  add constraint CODE_APPLY_PK primary key (APPLY_CODE);

prompt
prompt Creating table CODE_CODING_TYPE
prompt ===============================
prompt
create table CODE_CODING_TYPE
(
  coding_type_code             VARCHAR2(120) not null,
  coding_type_name             VARCHAR2(120),
  coding_type_parent_code      VARCHAR2(120),
  is_last_codeing              NUMBER(1),
  coding_model                 NUMBER(1),
  standard_identification_code VARCHAR2(120),
  reference_standard           VARCHAR2(120),
  remark                       VARCHAR2(255),
  parent_code_type             NUMBER(1),
  sort                         NUMBER(8),
  coding_classify              VARCHAR2(20),
  coding_type_level            NUMBER
)
;
comment on table CODE_CODING_TYPE
  is '�������';
comment on column CODE_CODING_TYPE.coding_type_code
  is '����������';
comment on column CODE_CODING_TYPE.coding_type_name
  is '�����������';
comment on column CODE_CODING_TYPE.coding_type_parent_code
  is '�ϼ�����';
comment on column CODE_CODING_TYPE.is_last_codeing
  is '�Ƿ�ĩ����0����1���ǣ�';
comment on column CODE_CODING_TYPE.coding_model
  is '�������ʣ�0���������1����׼���룩';
comment on column CODE_CODING_TYPE.standard_identification_code
  is '��׼��ʶ��';
comment on column CODE_CODING_TYPE.reference_standard
  is '���ñ�׼';
comment on column CODE_CODING_TYPE.remark
  is '��ע';
comment on column CODE_CODING_TYPE.parent_code_type
  is '�ϼ��������ͣ�0�� ��Ϣ���ࣻ1��������ࣩ';
comment on column CODE_CODING_TYPE.sort
  is '����';
comment on column CODE_CODING_TYPE.coding_classify
  is '������࣬0�����׼���룬1�����Զ������';
comment on column CODE_CODING_TYPE.coding_type_level
  is '����㼶';
alter table CODE_CODING_TYPE
  add constraint CODE_CODING_TYPE_PK primary key (CODING_TYPE_CODE);

prompt
prompt Creating table CODE_INFO_TYPE
prompt =============================
prompt
create table CODE_INFO_TYPE
(
  info_type_code         VARCHAR2(120) not null,
  info_type_name         VARCHAR2(120),
  corresponding_code     VARCHAR2(120),
  corresponding_document VARCHAR2(255),
  version_number         VARCHAR2(120),
  release_date           DATE,
  implementation_date    DATE,
  remark                 VARCHAR2(255),
  creator                VARCHAR2(120),
  create_date            DATE,
  last_modifier          VARCHAR2(120),
  last_modified_date     DATE,
  sort                   NUMBER(8)
)
;
comment on table CODE_INFO_TYPE
  is '��Ϣ����';
comment on column CODE_INFO_TYPE.info_type_code
  is '��Ϣ�������';
comment on column CODE_INFO_TYPE.info_type_name
  is '��Ϣ��������';
comment on column CODE_INFO_TYPE.corresponding_code
  is '��Ӧ�ֲ����';
comment on column CODE_INFO_TYPE.corresponding_document
  is '��Ӧ�ֲ��ĵ�';
comment on column CODE_INFO_TYPE.version_number
  is '�ֲ����°汾��';
comment on column CODE_INFO_TYPE.release_date
  is '�ֲᷢ������';
comment on column CODE_INFO_TYPE.implementation_date
  is '�ֲ�ʵʩ����';
comment on column CODE_INFO_TYPE.remark
  is '��ע';
comment on column CODE_INFO_TYPE.creator
  is '������';
comment on column CODE_INFO_TYPE.create_date
  is '��������';
comment on column CODE_INFO_TYPE.last_modifier
  is '��������Ա';
comment on column CODE_INFO_TYPE.last_modified_date
  is '����������';
comment on column CODE_INFO_TYPE.sort
  is '����';
alter table CODE_INFO_TYPE
  add constraint CODE_INFO_TYPE_PK primary key (INFO_TYPE_CODE);

prompt
prompt Creating table DATA_APPERAPP
prompt ============================
prompt
create table DATA_APPERAPP
(
  apperapp_id    NUMBER(10) not null,
  appname        VARCHAR2(100),
  appdesc        VARCHAR2(500),
  configstate    NUMBER(2),
  createpersonid NUMBER(10),
  createtime     DATE,
  editpersonid   NUMBER(10),
  edittime       DATE,
  remarks        VARCHAR2(500)
)
;
comment on table DATA_APPERAPP
  is '�ϲ�Ӧ�ñ�';
comment on column DATA_APPERAPP.apperapp_id
  is '�ϲ�Ӧ��ID';
comment on column DATA_APPERAPP.appname
  is 'Ӧ������';
comment on column DATA_APPERAPP.appdesc
  is 'Ӧ������';
comment on column DATA_APPERAPP.configstate
  is '״̬';
comment on column DATA_APPERAPP.createpersonid
  is '������';
comment on column DATA_APPERAPP.createtime
  is '����ʱ��';
comment on column DATA_APPERAPP.editpersonid
  is '�޸���';
comment on column DATA_APPERAPP.edittime
  is '�޸�ʱ��';
comment on column DATA_APPERAPP.remarks
  is '��ע';
alter table DATA_APPERAPP
  add constraint PK_DATA_APPERAPP primary key (APPERAPP_ID);

prompt
prompt Creating table DATA_CONFIG
prompt ==========================
prompt
create table DATA_CONFIG
(
  config_id      NUMBER(10) not null,
  apperapp_id    VARCHAR2(200),
  tablename      VARCHAR2(500),
  tablefield     VARCHAR2(4000),
  approvalstate  NUMBER(2),
  srvstrategy    NUMBER(2),
  createpersonid NUMBER(10),
  createtime     DATE,
  editpersonid   NUMBER(10),
  edittime       DATE,
  remarks        VARCHAR2(500),
  filter_con     VARCHAR2(200),
  servicecycle   VARCHAR2(20),
  servicetime    VARCHAR2(200),
  tablecnname    VARCHAR2(500),
  tablecnfield   VARCHAR2(4000),
  responsetype   VARCHAR2(20),
  datatype       VARCHAR2(20),
  incr_field     VARCHAR2(80),
  viewsql        VARCHAR2(500),
  snap           VARCHAR2(500)
)
;
comment on table DATA_CONFIG
  is '���������ñ�';
comment on column DATA_CONFIG.config_id
  is '����ID;';
comment on column DATA_CONFIG.apperapp_id
  is '�ϲ�Ӧ��ID;�����������Ϊ���붨�ƣ����ֶ�Ϊnull';
comment on column DATA_CONFIG.tablename
  is '������';
comment on column DATA_CONFIG.tablefield
  is '���ֶ�';
comment on column DATA_CONFIG.approvalstate
  is '����״̬:0�������,1����Ч,2����Ч;�����������Ϊ���붨�ƣ����ֶ�Ϊnull';
comment on column DATA_CONFIG.srvstrategy
  is '�������: 1��ʵʱ,2����ʱ;�����������Ϊ���붨�ƣ����ֶ�Ϊnull';
comment on column DATA_CONFIG.createpersonid
  is '������';
comment on column DATA_CONFIG.createtime
  is '����ʱ��';
comment on column DATA_CONFIG.editpersonid
  is '�޸���';
comment on column DATA_CONFIG.edittime
  is '�޸�ʱ��';
comment on column DATA_CONFIG.remarks
  is '��ע';
comment on column DATA_CONFIG.filter_con
  is '��������';
comment on column DATA_CONFIG.servicecycle
  is '��������;�����������Ϊ���붨�ƣ����ֶ�Ϊnull';
comment on column DATA_CONFIG.servicetime
  is 'ʱ����';
comment on column DATA_CONFIG.tablecnname
  is '��������';
comment on column DATA_CONFIG.tablecnfield
  is '�ֶ�������';
comment on column DATA_CONFIG.responsetype
  is '��Ӧ���ͣ�1:json��ʽ,2:xml��ʽ
';
comment on column DATA_CONFIG.datatype
  is '�������ͣ�0:�����ݼ�,1:���룩';
comment on column DATA_CONFIG.incr_field
  is '�����ֶ�;�����������Ϊ���붨�ƣ����ֶ�Ϊnull';
comment on column DATA_CONFIG.viewsql
  is '��ͼsql;�����������Ϊ���붨�ƣ����ֶ�Ϊnull';
comment on column DATA_CONFIG.snap
  is '���ն�Ӧ��ͼ����';
alter table DATA_CONFIG
  add constraint PK_DATA_CONFIG primary key (CONFIG_ID);

prompt
prompt Creating table DATA_LOG
prompt =======================
prompt
create table DATA_LOG
(
  log_id      NUMBER(10) not null,
  apperapp_id NUMBER(10) not null,
  configcode  VARCHAR2(30) not null,
  configtype  VARCHAR2(30),
  tablename   VARCHAR2(500),
  tablefield  VARCHAR2(4000),
  createtime  DATE,
  remarks     VARCHAR2(500)
)
;
comment on table DATA_LOG
  is '�����ݽӿڷ�����־��';
comment on column DATA_LOG.log_id
  is '��־ID';
comment on column DATA_LOG.apperapp_id
  is '�ϲ�Ӧ��ID';
comment on column DATA_LOG.configcode
  is '����';
comment on column DATA_LOG.configtype
  is '����';
comment on column DATA_LOG.tablename
  is '������';
comment on column DATA_LOG.tablefield
  is '���ֶ�';
comment on column DATA_LOG.createtime
  is '����ʱ��';
comment on column DATA_LOG.remarks
  is '��ע';
alter table DATA_LOG
  add constraint PK_DATA_LOG primary key (LOG_ID);

prompt
prompt Creating table LOGS
prompt ===================
prompt
create table LOGS
(
  id              NUMBER not null,
  apperapp_id     VARCHAR2(30),
  ip_address      VARCHAR2(30),
  call_status     VARCHAR2(30),
  tablename       VARCHAR2(1000),
  tablefield      VARCHAR2(1000),
  end_time        VARCHAR2(20),
  data_type       VARCHAR2(20),
  status_describe VARCHAR2(1000),
  start_time      VARCHAR2(1000),
  startegy        VARCHAR2(20),
  appname         VARCHAR2(20),
  request_time    VARCHAR2(20)
)
;
comment on column LOGS.apperapp_id
  is '����Ӧ��id';
comment on column LOGS.ip_address
  is '�ⲿӦ��IP��ַ';
comment on column LOGS.call_status
  is '����״̬';
comment on column LOGS.tablename
  is '�������ݱ�';
comment on column LOGS.tablefield
  is '�����ֶ�';
comment on column LOGS.end_time
  is '�������ʱ��';
comment on column LOGS.data_type
  is '��Ӧ��������';
comment on column LOGS.status_describe
  is '����״̬��Ϣ����';
comment on column LOGS.start_time
  is '���ÿ�ʼʱ��';
comment on column LOGS.startegy
  is '���ò���';
comment on column LOGS.appname
  is '�ϲ�Ӧ��name';
comment on column LOGS.request_time
  is '����ʱ��';

prompt
prompt Creating table META_BUS_ATTRI
prompt =============================
prompt
create table META_BUS_ATTRI
(
  bus_attri_id           VARCHAR2(32) not null,
  bus_entity_id          VARCHAR2(32) not null,
  bus_tab_entity         VARCHAR2(100) not null,
  bus_tab_en_nm          VARCHAR2(100) not null,
  bus_tab_cn_nm          VARCHAR2(100),
  bus_attri_en_nm        VARCHAR2(100) not null,
  bus_attri_cn_nm        VARCHAR2(100),
  bus_attri_typ          VARCHAR2(100) not null,
  bus_attri_desc         VARCHAR2(100),
  bus_tab_fullinfo       VARCHAR2(100),
  sub_domain_name        VARCHAR2(100) not null,
  sub_domain_code        VARCHAR2(100),
  sub_domain_id          VARCHAR2(100) not null,
  bus_tab_rourcesys_type VARCHAR2(100),
  bus_attri_length       VARCHAR2(20),
  null_flag              CHAR(1),
  unique_flay            CHAR(1)
)
;
comment on table META_BUS_ATTRI
  is 'Ŀ��ʵ�����Ա�';
comment on column META_BUS_ATTRI.bus_attri_id
  is 'Ŀ����ֶ�id';
comment on column META_BUS_ATTRI.bus_entity_id
  is 'Ŀ��ʵ��ID';
comment on column META_BUS_ATTRI.bus_tab_entity
  is 'Ŀ��ʵ��';
comment on column META_BUS_ATTRI.bus_tab_en_nm
  is 'Ŀ��ʵ��Ӣ����';
comment on column META_BUS_ATTRI.bus_tab_cn_nm
  is 'Ŀ��ʵ��������';
comment on column META_BUS_ATTRI.bus_attri_en_nm
  is 'Ŀ��ʵ������Ӣ����';
comment on column META_BUS_ATTRI.bus_attri_cn_nm
  is 'Ŀ��ʵ������������';
comment on column META_BUS_ATTRI.bus_attri_typ
  is 'Ŀ��ʵ����������';
comment on column META_BUS_ATTRI.bus_attri_desc
  is 'Ŀ��ʵ����������';
comment on column META_BUS_ATTRI.bus_tab_fullinfo
  is 'Ŀ��ʵ��������Ϣ';
comment on column META_BUS_ATTRI.sub_domain_name
  is '����������';
comment on column META_BUS_ATTRI.sub_domain_code
  is '���������';
comment on column META_BUS_ATTRI.sub_domain_id
  is '������Id';
comment on column META_BUS_ATTRI.bus_tab_rourcesys_type
  is 'Ŀ��ʵ��Դ����';
comment on column META_BUS_ATTRI.bus_attri_length
  is 'Ŀ��ʵ�����Գ���';
comment on column META_BUS_ATTRI.null_flag
  is '�Ƿ�ɿգ�Y:�ǣ�N:��)';
comment on column META_BUS_ATTRI.unique_flay
  is '�Ƿ�������Y:�ǣ�N:��)';
alter table META_BUS_ATTRI
  add primary key (BUS_ATTRI_ID);

prompt
prompt Creating table META_BUS_ATTRI_TEMP
prompt ==================================
prompt
create table META_BUS_ATTRI_TEMP
(
  bus_attri_id           VARCHAR2(32) not null,
  bus_entity_id          VARCHAR2(32) not null,
  bus_tab_entity         VARCHAR2(100) not null,
  bus_tab_en_nm          VARCHAR2(100) not null,
  bus_tab_cn_nm          VARCHAR2(100),
  bus_attri_en_nm        VARCHAR2(100) not null,
  bus_attri_cn_nm        VARCHAR2(100),
  bus_attri_typ          VARCHAR2(100) not null,
  bus_attri_desc         VARCHAR2(100),
  bus_tab_fullinfo       VARCHAR2(100),
  sub_domain_name        VARCHAR2(100) not null,
  sub_domain_code        VARCHAR2(100),
  sub_domain_id          VARCHAR2(100) not null,
  bus_tab_rourcesys_type VARCHAR2(100),
  bus_attri_length       VARCHAR2(20),
  null_flag              CHAR(1),
  unique_flay            CHAR(1)
)
;

prompt
prompt Creating table META_BUS_ENTITY
prompt ==============================
prompt
create table META_BUS_ENTITY
(
  bus_entity_id           VARCHAR2(32) not null,
  bus_tab_en_nm           VARCHAR2(100) not null,
  bus_tab_cn_nm           VARCHAR2(100) not null,
  bus_tab_uniqueinfo      VARCHAR2(100),
  sub_domain_name         VARCHAR2(100) not null,
  sub_domain_id           VARCHAR2(100) not null,
  version                 NUMBER not null,
  versionstatus           NUMBER not null,
  sub_domain_code         VARCHAR2(100),
  bus_tab_datarource_code VARCHAR2(100),
  collecttime             DATE,
  opreasonexp             VARCHAR2(100),
  oppsrsonnel             VARCHAR2(100)
)
;
comment on table META_BUS_ENTITY
  is 'Ŀ��ʵ���';
comment on column META_BUS_ENTITY.bus_entity_id
  is 'Ŀ��ʵ��ID';
comment on column META_BUS_ENTITY.bus_tab_en_nm
  is 'Ŀ��ʵ��Ӣ����';
comment on column META_BUS_ENTITY.bus_tab_cn_nm
  is 'Ŀ��ʵ��������';
comment on column META_BUS_ENTITY.bus_tab_uniqueinfo
  is 'Ŀ��ʵ��Ψһ��ʶ';
comment on column META_BUS_ENTITY.sub_domain_name
  is '����������';
comment on column META_BUS_ENTITY.sub_domain_id
  is '������Id';
comment on column META_BUS_ENTITY.version
  is '�汾';
comment on column META_BUS_ENTITY.versionstatus
  is '�汾״̬(1:��Ч��0����Ч)';
comment on column META_BUS_ENTITY.sub_domain_code
  is '���������';
comment on column META_BUS_ENTITY.bus_tab_datarource_code
  is 'Ŀ��ʵ������Դ����';
comment on column META_BUS_ENTITY.collecttime
  is '�ɼ�ʱ��';
comment on column META_BUS_ENTITY.opreasonexp
  is '����ԭ��';
comment on column META_BUS_ENTITY.oppsrsonnel
  is '����������';

prompt
prompt Creating table META_BUS_ENTITY_TEMP
prompt ===================================
prompt
create table META_BUS_ENTITY_TEMP
(
  bus_entity_id           VARCHAR2(32) not null,
  bus_tab_en_nm           VARCHAR2(100) not null,
  bus_tab_cn_nm           VARCHAR2(100) not null,
  bus_tab_uniqueinfo      VARCHAR2(100),
  sub_domain_name         VARCHAR2(100) not null,
  sub_domain_id           VARCHAR2(100) not null,
  version                 NUMBER not null,
  versionstatus           NUMBER not null,
  sub_domain_code         VARCHAR2(100),
  bus_tab_datarource_code VARCHAR2(100),
  collecttime             DATE,
  opreasonexp             VARCHAR2(100),
  oppsrsonnel             VARCHAR2(100)
)
;

prompt
prompt Creating table META_DATASOURCE_CONFIG
prompt =====================================
prompt
create table META_DATASOURCE_CONFIG
(
  datasource_config_id   VARCHAR2(32) not null,
  parent_id              NUMBER(32) not null,
  datasource_config_code VARCHAR2(32) not null,
  datasource_config_name VARCHAR2(128) not null,
  remark                 VARCHAR2(256),
  db_info                VARCHAR2(64),
  sort_index             NUMBER
)
;
comment on table META_DATASOURCE_CONFIG
  is '����Դ���ñ�';
comment on column META_DATASOURCE_CONFIG.datasource_config_id
  is '����Դid';
comment on column META_DATASOURCE_CONFIG.parent_id
  is '����Դ��Ÿ��ڵ�';
comment on column META_DATASOURCE_CONFIG.datasource_config_code
  is '����Դ���';
comment on column META_DATASOURCE_CONFIG.datasource_config_name
  is '����Դ����';
comment on column META_DATASOURCE_CONFIG.remark
  is '��ע';
comment on column META_DATASOURCE_CONFIG.db_info
  is '���ݿ���Ϣ';
comment on column META_DATASOURCE_CONFIG.sort_index
  is '����';
alter table META_DATASOURCE_CONFIG
  add constraint META_DATASOURCE_CONFIG_PK primary key (DATASOURCE_CONFIG_ID);

prompt
prompt Creating table META_ENTITY_MAPPING_INFO
prompt =======================================
prompt
create table META_ENTITY_MAPPING_INFO
(
  id                      VARCHAR2(32) not null,
  tar_tab_en_nm           VARCHAR2(200),
  tar_tab_cn_nm           VARCHAR2(200),
  tar_attri_en_nm         VARCHAR2(200),
  tar_attri_cn_nm         VARCHAR2(200),
  tar_attri_type          VARCHAR2(200),
  tar_tab_rourcesys_type  VARCHAR2(200),
  sub_domain_name         VARCHAR2(200),
  version_code            NUMBER,
  valid_flag              NUMBER(1),
  src_tab_cn_nm           VARCHAR2(200),
  src_attri_en_nm         VARCHAR2(200),
  src_attri_cn_nm         VARCHAR2(200),
  src_attri_typ           VARCHAR2(200),
  src_tab_datarource_code VARCHAR2(200),
  src_sys_id              VARCHAR2(32),
  src_sys_name            VARCHAR2(128),
  src_firm_parent_id      VARCHAR2(20),
  src_firm_parent_code    VARCHAR2(200),
  excel_name              VARCHAR2(2000),
  tec_realize             VARCHAR2(2000),
  mapping_rule            VARCHAR2(2000),
  etl_unique_id           VARCHAR2(500),
  pediod                  VARCHAR2(1),
  etlstrategy             VARCHAR2(200),
  incre_data_extracting   VARCHAR2(200),
  designer                VARCHAR2(30),
  target_clean_rule       VARCHAR2(300),
  src_tab_en_nm           VARCHAR2(200),
  sub_domain_id           VARCHAR2(100),
  upload_time             DATE,
  sub_domain_code         VARCHAR2(20),
  reason_id               VARCHAR2(32)
)
;
comment on table META_ENTITY_MAPPING_INFO
  is 'ʵ��ӳ����Ϣ��';
comment on column META_ENTITY_MAPPING_INFO.id
  is 'ʵ��ӳ��id';
comment on column META_ENTITY_MAPPING_INFO.tar_tab_en_nm
  is 'Ŀ���Ӣ������';
comment on column META_ENTITY_MAPPING_INFO.tar_tab_cn_nm
  is 'Ŀ�����������';
comment on column META_ENTITY_MAPPING_INFO.tar_attri_en_nm
  is 'Ŀ����ֶ�Ӣ������';
comment on column META_ENTITY_MAPPING_INFO.tar_attri_cn_nm
  is 'Ŀ����ֶ���������';
comment on column META_ENTITY_MAPPING_INFO.tar_attri_type
  is 'Ŀ����ֶ�����';
comment on column META_ENTITY_MAPPING_INFO.tar_tab_rourcesys_type
  is 'Ŀ������ݿ�����';
comment on column META_ENTITY_MAPPING_INFO.sub_domain_name
  is '������';
comment on column META_ENTITY_MAPPING_INFO.version_code
  is '�汾���';
comment on column META_ENTITY_MAPPING_INFO.valid_flag
  is '��Ч��ʶ(Ĭ����1,�汾��ԭ֮������ͱ��0)';
comment on column META_ENTITY_MAPPING_INFO.src_tab_cn_nm
  is 'Դ����������';
comment on column META_ENTITY_MAPPING_INFO.src_attri_en_nm
  is 'Դ�ֶ�Ӣ������';
comment on column META_ENTITY_MAPPING_INFO.src_attri_cn_nm
  is 'Դ�ֶ���������';
comment on column META_ENTITY_MAPPING_INFO.src_attri_typ
  is 'Դ���ֶ�����';
comment on column META_ENTITY_MAPPING_INFO.src_tab_datarource_code
  is 'Դ�����ݿ�����';
comment on column META_ENTITY_MAPPING_INFO.src_sys_id
  is 'Դϵͳid';
comment on column META_ENTITY_MAPPING_INFO.src_sys_name
  is 'Դϵͳ����';
comment on column META_ENTITY_MAPPING_INFO.src_firm_parent_id
  is 'Դ����id';
comment on column META_ENTITY_MAPPING_INFO.src_firm_parent_code
  is 'Դ��������';
comment on column META_ENTITY_MAPPING_INFO.excel_name
  is '����excel����';
comment on column META_ENTITY_MAPPING_INFO.tec_realize
  is '����ʵ��';
comment on column META_ENTITY_MAPPING_INFO.mapping_rule
  is 'ӳ������';
comment on column META_ENTITY_MAPPING_INFO.etl_unique_id
  is '��ȡ����ID';
comment on column META_ENTITY_MAPPING_INFO.pediod
  is '����Ƶ��';
comment on column META_ENTITY_MAPPING_INFO.etlstrategy
  is 'ETL����';
comment on column META_ENTITY_MAPPING_INFO.incre_data_extracting
  is '������ȡ��׼';
comment on column META_ENTITY_MAPPING_INFO.designer
  is '�����';
comment on column META_ENTITY_MAPPING_INFO.target_clean_rule
  is 'Ŀ����ϴ����';
comment on column META_ENTITY_MAPPING_INFO.src_tab_en_nm
  is 'Դ��Ӣ������';
comment on column META_ENTITY_MAPPING_INFO.sub_domain_id
  is '������id';
comment on column META_ENTITY_MAPPING_INFO.upload_time
  is '����ʱ��';
comment on column META_ENTITY_MAPPING_INFO.sub_domain_code
  is '���������';
comment on column META_ENTITY_MAPPING_INFO.reason_id
  is '����ԭ��id';

prompt
prompt Creating table META_ENTITY_MAPPING_REASON
prompt =========================================
prompt
create table META_ENTITY_MAPPING_REASON
(
  entity_mapping_reason_id VARCHAR2(32) not null,
  tar_tab_en_nm            VARCHAR2(200),
  tar_tab_cn_nm            VARCHAR2(200),
  sub_domain_id            VARCHAR2(100) not null,
  sub_domain_name          VARCHAR2(128),
  create_new_version       NUMBER,
  database_type            VARCHAR2(20),
  version_crate_time       VARCHAR2(200),
  userid                   VARCHAR2(20),
  username                 VARCHAR2(20),
  operater_reason_desc     VARCHAR2(200),
  delete_all_flag          NUMBER(1)
)
;
comment on table META_ENTITY_MAPPING_REASON
  is 'ӳ�����ԭ���';
comment on column META_ENTITY_MAPPING_REASON.entity_mapping_reason_id
  is 'ԭ��id';
comment on column META_ENTITY_MAPPING_REASON.tar_tab_en_nm
  is 'Ŀ���Ӣ����';
comment on column META_ENTITY_MAPPING_REASON.tar_tab_cn_nm
  is 'Ŀ���������';
comment on column META_ENTITY_MAPPING_REASON.sub_domain_id
  is '������id';
comment on column META_ENTITY_MAPPING_REASON.sub_domain_name
  is '����������';
comment on column META_ENTITY_MAPPING_REASON.create_new_version
  is '�������°汾���';
comment on column META_ENTITY_MAPPING_REASON.database_type
  is '���ݿ�����';
comment on column META_ENTITY_MAPPING_REASON.version_crate_time
  is '�汾����ʱ��';
comment on column META_ENTITY_MAPPING_REASON.userid
  is '����Աid';
comment on column META_ENTITY_MAPPING_REASON.username
  is '����Ա����';
comment on column META_ENTITY_MAPPING_REASON.operater_reason_desc
  is '����ԭ��';
comment on column META_ENTITY_MAPPING_REASON.delete_all_flag
  is 'ɾ����־(1��ʾɾ��,0��ʾû��ɾ��)';

prompt
prompt Creating table META_EXCEL_CHECK
prompt ===============================
prompt
create table META_EXCEL_CHECK
(
  mec_id           VARCHAR2(32) not null,
  model_code       VARCHAR2(200),
  model_name       VARCHAR2(200),
  model_filed_name VARCHAR2(200),
  check_type       VARCHAR2(32),
  sort             NUMBER,
  sql              VARCHAR2(300),
  filed_name       VARCHAR2(40)
)
;
comment on table META_EXCEL_CHECK
  is 'У���(�洢excel����ҪУ����ֶε�)';
comment on column META_EXCEL_CHECK.mec_id
  is '������id';
comment on column META_EXCEL_CHECK.model_code
  is '����code';
comment on column META_EXCEL_CHECK.model_name
  is '��������';
comment on column META_EXCEL_CHECK.model_filed_name
  is '�����µ��ֶ�����';
comment on column META_EXCEL_CHECK.check_type
  is 'У������(ӳ��Ļ���EXCEL��EXCELTOP)';
comment on column META_EXCEL_CHECK.sort
  is '����';
comment on column META_EXCEL_CHECK.sql
  is '�жϵ�sql���';
comment on column META_EXCEL_CHECK.filed_name
  is '��Ҫ������е��ֶ�����';
alter table META_EXCEL_CHECK
  add primary key (MEC_ID);

prompt
prompt Creating table META_E_SUB_DOMAIN
prompt ================================
prompt
create table META_E_SUB_DOMAIN
(
  sub_domain_id   VARCHAR2(100) not null,
  sub_domain_name VARCHAR2(128),
  parent_id       VARCHAR2(100) not null,
  sub_domain_code VARCHAR2(20),
  sort_index      NUMBER
)
;
comment on table META_E_SUB_DOMAIN
  is '�������';
comment on column META_E_SUB_DOMAIN.sub_domain_id
  is '������ID';
comment on column META_E_SUB_DOMAIN.sub_domain_name
  is '����������';
comment on column META_E_SUB_DOMAIN.parent_id
  is '�����򸸽ڵ�';
comment on column META_E_SUB_DOMAIN.sub_domain_code
  is '���������';
comment on column META_E_SUB_DOMAIN.sort_index
  is '����';

prompt
prompt Creating table META_E_TAR_ATTRI
prompt ===============================
prompt
create table META_E_TAR_ATTRI
(
  tar_attri_id           VARCHAR2(32) not null,
  tar_entity_id          VARCHAR2(32) not null,
  tar_tab_entity         VARCHAR2(100) not null,
  tar_tab_en_nm          VARCHAR2(100) not null,
  tar_tab_cn_nm          VARCHAR2(100),
  tar_attri_en_nm        VARCHAR2(100) not null,
  tar_attri_cn_nm        VARCHAR2(100),
  tar_attri_typ          VARCHAR2(100) not null,
  tar_attri_desc         VARCHAR2(100),
  tar_tab_fullinfo       VARCHAR2(100),
  sub_domain_name        VARCHAR2(100) not null,
  sub_domain_code        VARCHAR2(100),
  sub_domain_id          VARCHAR2(100) not null,
  tar_tab_rourcesys_type VARCHAR2(100),
  tar_attri_length       VARCHAR2(20),
  null_flag              CHAR(1),
  unique_flay            CHAR(1)
)
;
comment on table META_E_TAR_ATTRI
  is 'Ŀ��ʵ�����Ա�';
comment on column META_E_TAR_ATTRI.tar_attri_id
  is 'Ŀ����ֶ�id';
comment on column META_E_TAR_ATTRI.tar_entity_id
  is 'Ŀ��ʵ��ID';
comment on column META_E_TAR_ATTRI.tar_tab_entity
  is 'Ŀ��ʵ��';
comment on column META_E_TAR_ATTRI.tar_tab_en_nm
  is 'Ŀ��ʵ��Ӣ����';
comment on column META_E_TAR_ATTRI.tar_tab_cn_nm
  is 'Ŀ��ʵ��������';
comment on column META_E_TAR_ATTRI.tar_attri_en_nm
  is 'Ŀ��ʵ������Ӣ����';
comment on column META_E_TAR_ATTRI.tar_attri_cn_nm
  is 'Ŀ��ʵ������������';
comment on column META_E_TAR_ATTRI.tar_attri_typ
  is 'Ŀ��ʵ����������';
comment on column META_E_TAR_ATTRI.tar_attri_desc
  is 'Ŀ��ʵ����������';
comment on column META_E_TAR_ATTRI.tar_tab_fullinfo
  is 'Ŀ��ʵ��������Ϣ';
comment on column META_E_TAR_ATTRI.sub_domain_name
  is '����������';
comment on column META_E_TAR_ATTRI.sub_domain_code
  is '���������';
comment on column META_E_TAR_ATTRI.sub_domain_id
  is '������Id';
comment on column META_E_TAR_ATTRI.tar_tab_rourcesys_type
  is 'Ŀ��ʵ��Դ����';
comment on column META_E_TAR_ATTRI.tar_attri_length
  is 'Ŀ��ʵ�����Գ���';
comment on column META_E_TAR_ATTRI.null_flag
  is '�Ƿ�ɿգ�Y:�ǣ�N:��)';
comment on column META_E_TAR_ATTRI.unique_flay
  is '�Ƿ�������Y:�ǣ�N:��)';

prompt
prompt Creating table META_E_TAR_ENTITY
prompt ================================
prompt
create table META_E_TAR_ENTITY
(
  tar_entity_id           VARCHAR2(32) not null,
  tar_tab_en_nm           VARCHAR2(100) not null,
  tar_tab_cn_nm           VARCHAR2(100) not null,
  tar_tab_uniqueinfo      VARCHAR2(100),
  sub_domain_name         VARCHAR2(100) not null,
  sub_domain_id           VARCHAR2(100) not null,
  version                 NUMBER not null,
  versionstatus           NUMBER not null,
  sub_domain_code         VARCHAR2(100),
  tar_tab_datarource_code VARCHAR2(100),
  collecttime             DATE,
  opreasonexp             VARCHAR2(100),
  oppsrsonnel             VARCHAR2(100),
  last_update_date        DATE
)
;
comment on table META_E_TAR_ENTITY
  is 'Ŀ��ʵ���';
comment on column META_E_TAR_ENTITY.tar_entity_id
  is 'Ŀ��ʵ��ID';
comment on column META_E_TAR_ENTITY.tar_tab_en_nm
  is 'Ŀ��ʵ��Ӣ����';
comment on column META_E_TAR_ENTITY.tar_tab_cn_nm
  is 'Ŀ��ʵ��������';
comment on column META_E_TAR_ENTITY.tar_tab_uniqueinfo
  is 'Ŀ��ʵ��Ψһ��ʶ';
comment on column META_E_TAR_ENTITY.sub_domain_name
  is '����������';
comment on column META_E_TAR_ENTITY.sub_domain_id
  is '������Id';
comment on column META_E_TAR_ENTITY.version
  is '�汾';
comment on column META_E_TAR_ENTITY.versionstatus
  is '�汾״̬(1:��Ч��0����Ч)';
comment on column META_E_TAR_ENTITY.sub_domain_code
  is '���������';
comment on column META_E_TAR_ENTITY.tar_tab_datarource_code
  is 'Ŀ��ʵ������Դ����';
comment on column META_E_TAR_ENTITY.collecttime
  is '�ɼ�ʱ��';
comment on column META_E_TAR_ENTITY.opreasonexp
  is '����ԭ��';
comment on column META_E_TAR_ENTITY.oppsrsonnel
  is '����������';
comment on column META_E_TAR_ENTITY.last_update_date
  is '����޸�����';

prompt
prompt Creating table META_E_TAR_PROCCFG
prompt =================================
prompt
create table META_E_TAR_PROCCFG
(
  cfgid      VARCHAR2(32),
  tablename  VARCHAR2(255),
  primarykey VARCHAR2(255)
)
;
comment on column META_E_TAR_PROCCFG.cfgid
  is '���ñ�����';
comment on column META_E_TAR_PROCCFG.tablename
  is '����';
comment on column META_E_TAR_PROCCFG.primarykey
  is '��������';

prompt
prompt Creating table META_JOB
prompt =======================
prompt
create table META_JOB
(
  id     VARCHAR2(32) not null,
  name   VARCHAR2(200),
  status INTEGER,
  jobid  VARCHAR2(32)
)
;
comment on table META_JOB
  is 'job״̬��';
comment on column META_JOB.id
  is '����';
comment on column META_JOB.name
  is 'job������';
comment on column META_JOB.status
  is '״̬��0����ִ�У�1��ִ�У�';
comment on column META_JOB.jobid
  is 'job��id����Ӧ �����е�id������';
alter table META_JOB
  add constraint META_JOB_PK primary key (ID);

prompt
prompt Creating table META_SRC_ATTRI
prompt =============================
prompt
create table META_SRC_ATTRI
(
  src_attri_id            VARCHAR2(32) not null,
  src_tab_entity_id       VARCHAR2(32) not null,
  src_tab_entity          VARCHAR2(100),
  src_tab_en_nm           VARCHAR2(250) not null,
  src_tab_cn_nm           VARCHAR2(250),
  src_attri_en_nm         VARCHAR2(250) not null,
  src_attri_cn_nm         VARCHAR2(250),
  src_attri_typ           VARCHAR2(250),
  src_attri_desc          VARCHAR2(250),
  src_tab_fullinfo        VARCHAR2(250),
  src_sys_name            VARCHAR2(250) not null,
  src_sys_code            VARCHAR2(250),
  src_sys_id              VARCHAR2(250) not null,
  src_firm_name           VARCHAR2(250) not null,
  src_firm_code           VARCHAR2(250),
  src_tab_datarource_code VARCHAR2(250),
  src_attri_length        VARCHAR2(20),
  null_flag               CHAR(1),
  unique_flay             CHAR(1)
)
;
comment on table META_SRC_ATTRI
  is 'Դʵ�����Ա�';
comment on column META_SRC_ATTRI.src_attri_id
  is 'Դ����id';
comment on column META_SRC_ATTRI.src_tab_entity_id
  is 'Դʵ��ID';
comment on column META_SRC_ATTRI.src_tab_entity
  is 'Դʵ������';
comment on column META_SRC_ATTRI.src_tab_en_nm
  is 'Դ��Ӣ����';
comment on column META_SRC_ATTRI.src_tab_cn_nm
  is 'Դ��������';
comment on column META_SRC_ATTRI.src_attri_en_nm
  is 'Դ������Ӣ����';
comment on column META_SRC_ATTRI.src_attri_cn_nm
  is 'Դ������������';
comment on column META_SRC_ATTRI.src_attri_typ
  is 'Դ����������';
comment on column META_SRC_ATTRI.src_attri_desc
  is 'Դ����������';
comment on column META_SRC_ATTRI.src_tab_fullinfo
  is 'Դ��������Ϣ';
comment on column META_SRC_ATTRI.src_sys_name
  is 'Դ��ϵͳ����';
comment on column META_SRC_ATTRI.src_sys_code
  is 'Դ��ϵͳ���';
comment on column META_SRC_ATTRI.src_sys_id
  is 'Դϵͳid';
comment on column META_SRC_ATTRI.src_firm_name
  is 'Դ��������';
comment on column META_SRC_ATTRI.src_firm_code
  is 'Դ���̱���';
comment on column META_SRC_ATTRI.src_tab_datarource_code
  is '����Դ����';
comment on column META_SRC_ATTRI.src_attri_length
  is 'Դ���Գ���';
comment on column META_SRC_ATTRI.null_flag
  is '�Ƿ�ɿգ�Y:�ǣ�N:��)';
comment on column META_SRC_ATTRI.unique_flay
  is '�Ƿ�������Y:�ǣ�N:��)';
alter table META_SRC_ATTRI
  add primary key (SRC_ATTRI_ID);

prompt
prompt Creating table META_SRC_ATTRI_TEMP
prompt ==================================
prompt
create table META_SRC_ATTRI_TEMP
(
  src_attri_temp_id       VARCHAR2(32),
  src_tab_entity_id       VARCHAR2(32),
  src_tab_entity          VARCHAR2(100),
  src_tab_en_nm           VARCHAR2(250),
  src_tab_cn_nm           VARCHAR2(250),
  src_attri_en_nm         VARCHAR2(250),
  src_attri_cn_nm         VARCHAR2(250),
  src_attri_typ           VARCHAR2(250),
  src_attri_desc          VARCHAR2(250),
  src_tab_fullinfo        VARCHAR2(250),
  src_sys_name            VARCHAR2(250),
  src_sys_code            VARCHAR2(250),
  src_sys_id              VARCHAR2(250),
  src_firm_name           VARCHAR2(250),
  src_firm_code           VARCHAR2(250),
  src_tab_datarource_code VARCHAR2(250),
  src_attri_length        VARCHAR2(20),
  null_flag               CHAR(1),
  unique_flay             CHAR(1)
)
;

prompt
prompt Creating table META_SRC_ENTITY
prompt ==============================
prompt
create table META_SRC_ENTITY
(
  src_entity_id           VARCHAR2(32) not null,
  collecttime             DATE,
  src_tab_en_nm           VARCHAR2(100) not null,
  src_tab_cn_nm           VARCHAR2(100),
  src_sys_name            VARCHAR2(100),
  src_sys_id              VARCHAR2(100) not null,
  src_tab_uniqueinfo      VARCHAR2(100),
  src_firm_name           VARCHAR2(100),
  src_firm_code           VARCHAR2(100),
  src_tab_datarource_code VARCHAR2(100),
  src_sys_code            VARCHAR2(100),
  version                 NUMBER not null,
  versionstatus           NUMBER not null,
  opreasonexp             VARCHAR2(100),
  oppsrsonnel             VARCHAR2(100)
)
;
comment on table META_SRC_ENTITY
  is 'Դʵ���';
comment on column META_SRC_ENTITY.src_entity_id
  is 'Դʵ��ID';
comment on column META_SRC_ENTITY.collecttime
  is '�ɼ�����';
comment on column META_SRC_ENTITY.src_tab_en_nm
  is 'Դʵ��Ӣ����';
comment on column META_SRC_ENTITY.src_tab_cn_nm
  is 'Դʵ��������';
comment on column META_SRC_ENTITY.src_sys_name
  is 'Դϵͳ����';
comment on column META_SRC_ENTITY.src_sys_id
  is 'ԴϵͳID';
comment on column META_SRC_ENTITY.src_tab_uniqueinfo
  is 'Դ��ΨһID';
comment on column META_SRC_ENTITY.src_firm_name
  is 'Դ��������';
comment on column META_SRC_ENTITY.src_firm_code
  is 'Դ���̱���';
comment on column META_SRC_ENTITY.src_tab_datarource_code
  is 'Դ���ݿ����';
comment on column META_SRC_ENTITY.src_sys_code
  is 'Դϵͳ����';
comment on column META_SRC_ENTITY.version
  is '�汾';
comment on column META_SRC_ENTITY.versionstatus
  is '�汾״̬';
comment on column META_SRC_ENTITY.opreasonexp
  is '��������';
comment on column META_SRC_ENTITY.oppsrsonnel
  is '����������';
alter table META_SRC_ENTITY
  add primary key (SRC_ENTITY_ID);

prompt
prompt Creating table META_SRC_RELATION
prompt ================================
prompt
create table META_SRC_RELATION
(
  src_relation_id         VARCHAR2(100) not null,
  src_relation_version_id VARCHAR2(100) not null,
  mst_src_sys_name        VARCHAR2(100) not null,
  mst_src_sys_code        VARCHAR2(100) not null,
  mst_src_sys_id          VARCHAR2(100) not null,
  mst_firm_name           VARCHAR2(100),
  mst_firm_code           VARCHAR2(100),
  mst_tab_en_nm           VARCHAR2(100) not null,
  mst_tab_cn_nm           VARCHAR2(100) not null,
  mst_attri_en_nm         VARCHAR2(100) not null,
  mst_attri_cn_nm         VARCHAR2(100) not null,
  sub_src_sys_name        VARCHAR2(100) not null,
  sub_src_sys_code        VARCHAR2(100) not null,
  sub_src_sys_id          VARCHAR2(100) not null,
  sub_firm_name           VARCHAR2(100),
  sub_firm_code           VARCHAR2(100),
  sub_tab_en_nm           VARCHAR2(100) not null,
  sub_tab_cn_nm           VARCHAR2(100) not null,
  sub_attri_en_nm         VARCHAR2(100) not null,
  sub_attri_cn_nm         VARCHAR2(100) not null
)
;
comment on table META_SRC_RELATION
  is 'Դʵ�������';
comment on column META_SRC_RELATION.src_relation_id
  is '����ID';
comment on column META_SRC_RELATION.src_relation_version_id
  is 'Դʵ��汾id';
comment on column META_SRC_RELATION.mst_src_sys_name
  is '����ϵͳ����';
comment on column META_SRC_RELATION.mst_src_sys_code
  is '����ϵͳ����';
comment on column META_SRC_RELATION.mst_src_sys_id
  is '����ϵͳID';
comment on column META_SRC_RELATION.mst_firm_name
  is '����������';
comment on column META_SRC_RELATION.mst_firm_code
  is '�����̱���';
comment on column META_SRC_RELATION.mst_tab_en_nm
  is '����Ӣ����';
comment on column META_SRC_RELATION.mst_tab_cn_nm
  is '����������';
comment on column META_SRC_RELATION.mst_attri_en_nm
  is '�����ֶ�Ӣ����';
comment on column META_SRC_RELATION.mst_attri_cn_nm
  is '�����ֶ�������';
comment on column META_SRC_RELATION.sub_src_sys_name
  is '�ӱ�ϵͳ����';
comment on column META_SRC_RELATION.sub_src_sys_code
  is '�ӱ�ϵͳ����';
comment on column META_SRC_RELATION.sub_src_sys_id
  is '�ӱ�ϵͳID';
comment on column META_SRC_RELATION.sub_firm_name
  is '�ӱ�������';
comment on column META_SRC_RELATION.sub_firm_code
  is '�ӱ��̱���';
comment on column META_SRC_RELATION.sub_tab_en_nm
  is '�ӱ�Ӣ����';
comment on column META_SRC_RELATION.sub_tab_cn_nm
  is '�ӱ�������';
comment on column META_SRC_RELATION.sub_attri_en_nm
  is '�ӱ��ֶ�Ӣ����';
comment on column META_SRC_RELATION.sub_attri_cn_nm
  is '�ӱ��ֶ�������';
alter table META_SRC_RELATION
  add constraint META_SRC_RELATION_PK primary key (SRC_RELATION_ID);

prompt
prompt Creating table META_SRC_RELATION_VERSION
prompt ========================================
prompt
create table META_SRC_RELATION_VERSION
(
  src_relation_version_id VARCHAR2(100) not null,
  collecttime             DATE,
  mst_src_sys_id          VARCHAR2(100) not null,
  mst_src_sys_name        VARCHAR2(100),
  mst_src_sys_code        VARCHAR2(100),
  mst_firm_name           VARCHAR2(100),
  mst_firm_code           VARCHAR2(100),
  mst_tab_en_nm           VARCHAR2(100) not null,
  mst_tab_cn_nm           VARCHAR2(100),
  version                 NUMBER not null,
  versionstatus           NUMBER not null,
  opreasonexp             VARCHAR2(255),
  oppsrsonnel             VARCHAR2(100)
)
;
comment on column META_SRC_RELATION_VERSION.src_relation_version_id
  is 'Դʵ���ϵ�汾id';
comment on column META_SRC_RELATION_VERSION.collecttime
  is '�ɼ�����';
comment on column META_SRC_RELATION_VERSION.mst_src_sys_id
  is '����Դϵͳid';
comment on column META_SRC_RELATION_VERSION.mst_src_sys_name
  is '����Դϵͳ����';
comment on column META_SRC_RELATION_VERSION.mst_src_sys_code
  is '����Դϵͳ����';
comment on column META_SRC_RELATION_VERSION.mst_firm_name
  is '����Դ��������';
comment on column META_SRC_RELATION_VERSION.mst_firm_code
  is '����Դ���̱���';
comment on column META_SRC_RELATION_VERSION.mst_tab_en_nm
  is '����Ӣ����';
comment on column META_SRC_RELATION_VERSION.mst_tab_cn_nm
  is '����������';
comment on column META_SRC_RELATION_VERSION.version
  is '�汾';
comment on column META_SRC_RELATION_VERSION.versionstatus
  is '�汾״̬';
comment on column META_SRC_RELATION_VERSION.opreasonexp
  is '��������';
comment on column META_SRC_RELATION_VERSION.oppsrsonnel
  is '����������';
alter table META_SRC_RELATION_VERSION
  add constraint META_SRC_RELATION_VERSION_PK primary key (SRC_RELATION_VERSION_ID);

prompt
prompt Creating table META_SRC_SYS
prompt ===========================
prompt
create table META_SRC_SYS
(
  src_sys_id           VARCHAR2(4) not null,
  src_sys_code         VARCHAR2(32),
  src_sys_name         VARCHAR2(128),
  src_firm_parent_id   VARCHAR2(32) not null,
  src_firm_parent_code VARCHAR2(20),
  remark               VARCHAR2(256),
  datasource_id        VARCHAR2(20),
  username             VARCHAR2(30),
  password             VARCHAR2(30),
  sort                 NUMBER,
  data_source          VARCHAR2(120)
)
;
comment on table META_SRC_SYS
  is '��Դ����/ϵͳ��';
comment on column META_SRC_SYS.src_sys_id
  is '����/ϵͳid';
comment on column META_SRC_SYS.src_sys_code
  is '����/ϵͳ����';
comment on column META_SRC_SYS.src_sys_name
  is '����/ϵͳ����';
comment on column META_SRC_SYS.src_firm_parent_id
  is '��Դ����id�������0�Ļ����ǳ���';
comment on column META_SRC_SYS.src_firm_parent_code
  is '��Դ����code';
comment on column META_SRC_SYS.remark
  is '����';
comment on column META_SRC_SYS.datasource_id
  is '���ݿ�ip';
comment on column META_SRC_SYS.username
  is '�û���';
comment on column META_SRC_SYS.password
  is '����';
comment on column META_SRC_SYS.sort
  is '����';
comment on column META_SRC_SYS.data_source
  is '��������';

prompt
prompt Creating table META_SUB_DOMAIN
prompt ==============================
prompt
create table META_SUB_DOMAIN
(
  sub_domain_id   VARCHAR2(100) not null,
  sub_domain_name VARCHAR2(128),
  parent_id       VARCHAR2(100) not null,
  sub_domain_code VARCHAR2(20),
  sort_index      NUMBER
)
;
comment on table META_SUB_DOMAIN
  is '�������';
comment on column META_SUB_DOMAIN.sub_domain_id
  is '������ID';
comment on column META_SUB_DOMAIN.sub_domain_name
  is '����������';
comment on column META_SUB_DOMAIN.parent_id
  is '�����򸸽ڵ�';
comment on column META_SUB_DOMAIN.sub_domain_code
  is '���������';
comment on column META_SUB_DOMAIN.sort_index
  is '����';

prompt
prompt Creating table META_TAR_ATTRI
prompt =============================
prompt
create table META_TAR_ATTRI
(
  tar_attri_id           VARCHAR2(32) not null,
  tar_entity_id          VARCHAR2(32) not null,
  tar_tab_entity         VARCHAR2(100) not null,
  tar_tab_en_nm          VARCHAR2(100) not null,
  tar_tab_cn_nm          VARCHAR2(100),
  tar_attri_en_nm        VARCHAR2(100) not null,
  tar_attri_cn_nm        VARCHAR2(100),
  tar_attri_typ          VARCHAR2(100) not null,
  tar_attri_desc         VARCHAR2(100),
  tar_tab_fullinfo       VARCHAR2(100),
  sub_domain_name        VARCHAR2(100) not null,
  sub_domain_code        VARCHAR2(100),
  sub_domain_id          VARCHAR2(100) not null,
  tar_tab_rourcesys_type VARCHAR2(100),
  tar_attri_length       VARCHAR2(20),
  null_flag              CHAR(1),
  unique_flay            CHAR(1)
)
;
comment on table META_TAR_ATTRI
  is 'Ŀ��ʵ�����Ա�';
comment on column META_TAR_ATTRI.tar_attri_id
  is 'Ŀ����ֶ�id';
comment on column META_TAR_ATTRI.tar_entity_id
  is 'Ŀ��ʵ��ID';
comment on column META_TAR_ATTRI.tar_tab_entity
  is 'Ŀ��ʵ��';
comment on column META_TAR_ATTRI.tar_tab_en_nm
  is 'Ŀ��ʵ��Ӣ����';
comment on column META_TAR_ATTRI.tar_tab_cn_nm
  is 'Ŀ��ʵ��������';
comment on column META_TAR_ATTRI.tar_attri_en_nm
  is 'Ŀ��ʵ������Ӣ����';
comment on column META_TAR_ATTRI.tar_attri_cn_nm
  is 'Ŀ��ʵ������������';
comment on column META_TAR_ATTRI.tar_attri_typ
  is 'Ŀ��ʵ����������';
comment on column META_TAR_ATTRI.tar_attri_desc
  is 'Ŀ��ʵ����������';
comment on column META_TAR_ATTRI.tar_tab_fullinfo
  is 'Ŀ��ʵ��������Ϣ';
comment on column META_TAR_ATTRI.sub_domain_name
  is '����������';
comment on column META_TAR_ATTRI.sub_domain_code
  is '���������';
comment on column META_TAR_ATTRI.sub_domain_id
  is '������Id';
comment on column META_TAR_ATTRI.tar_tab_rourcesys_type
  is 'Ŀ��ʵ��Դ����';
comment on column META_TAR_ATTRI.tar_attri_length
  is 'Ŀ��ʵ�����Գ���';
comment on column META_TAR_ATTRI.null_flag
  is '�Ƿ�ɿգ�Y:�ǣ�N:��)';
comment on column META_TAR_ATTRI.unique_flay
  is '�Ƿ�������Y:�ǣ�N:��)';
alter table META_TAR_ATTRI
  add primary key (TAR_ATTRI_ID);

prompt
prompt Creating table META_TAR_ATTRI_TEMP
prompt ==================================
prompt
create table META_TAR_ATTRI_TEMP
(
  tar_attri_temp_id      VARCHAR2(32) not null,
  tar_tab_entity         VARCHAR2(100) not null,
  tar_tab_en_nm          VARCHAR2(100) not null,
  tar_tab_cn_nm          VARCHAR2(100),
  tar_attri_en_nm        VARCHAR2(100) not null,
  tar_attri_cn_nm        VARCHAR2(100),
  tar_attri_typ          VARCHAR2(100) not null,
  tar_attri_desc         VARCHAR2(100),
  tar_tab_fullinfo       VARCHAR2(100),
  sub_domain_name        VARCHAR2(100) not null,
  sub_domain_code        VARCHAR2(100),
  sub_domain_id          VARCHAR2(100) not null,
  tar_tab_rourcesys_type VARCHAR2(100),
  tar_attri_length       VARCHAR2(20),
  null_flag              CHAR(1),
  unique_flay            CHAR(1)
)
;
comment on table META_TAR_ATTRI_TEMP
  is 'Ŀ��ʵ��������ʱ��';
comment on column META_TAR_ATTRI_TEMP.tar_attri_temp_id
  is '��ʱĿ����ֶ�id';
comment on column META_TAR_ATTRI_TEMP.tar_tab_entity
  is 'Ŀ��ʵ��';
comment on column META_TAR_ATTRI_TEMP.tar_tab_en_nm
  is 'Ŀ��ʵ��Ӣ����';
comment on column META_TAR_ATTRI_TEMP.tar_tab_cn_nm
  is 'Ŀ��ʵ��������';
comment on column META_TAR_ATTRI_TEMP.tar_attri_en_nm
  is 'Ŀ��ʵ������Ӣ����';
comment on column META_TAR_ATTRI_TEMP.tar_attri_cn_nm
  is 'Ŀ��ʵ������������';
comment on column META_TAR_ATTRI_TEMP.tar_attri_typ
  is 'Ŀ��ʵ����������';
comment on column META_TAR_ATTRI_TEMP.tar_attri_desc
  is 'Ŀ��ʵ����������';
comment on column META_TAR_ATTRI_TEMP.tar_tab_fullinfo
  is 'Ŀ��ʵ������������Ϣ';
comment on column META_TAR_ATTRI_TEMP.sub_domain_name
  is '����������';
comment on column META_TAR_ATTRI_TEMP.sub_domain_code
  is '���������';
comment on column META_TAR_ATTRI_TEMP.sub_domain_id
  is '������Id';
comment on column META_TAR_ATTRI_TEMP.tar_tab_rourcesys_type
  is 'Ŀ��ʵ��Դ����';
comment on column META_TAR_ATTRI_TEMP.tar_attri_length
  is 'Ŀ��ʵ�����Գ���';
comment on column META_TAR_ATTRI_TEMP.null_flag
  is '�Ƿ�ɿգ�Y:�ǣ�N:��)';
comment on column META_TAR_ATTRI_TEMP.unique_flay
  is '�Ƿ�������Y:�ǣ�N:��)';
alter table META_TAR_ATTRI_TEMP
  add primary key (TAR_ATTRI_TEMP_ID);

prompt
prompt Creating table META_TAR_ENTITY
prompt ==============================
prompt
create table META_TAR_ENTITY
(
  tar_entity_id           VARCHAR2(32) not null,
  tar_tab_en_nm           VARCHAR2(100) not null,
  tar_tab_cn_nm           VARCHAR2(100) not null,
  tar_tab_uniqueinfo      VARCHAR2(100),
  sub_domain_name         VARCHAR2(100) not null,
  sub_domain_id           VARCHAR2(100) not null,
  version                 NUMBER not null,
  versionstatus           NUMBER not null,
  sub_domain_code         VARCHAR2(100),
  tar_tab_datarource_code VARCHAR2(100),
  collecttime             DATE,
  opreasonexp             VARCHAR2(100),
  oppsrsonnel             VARCHAR2(100),
  last_update_date        DATE
)
;
comment on table META_TAR_ENTITY
  is 'Ŀ��ʵ���';
comment on column META_TAR_ENTITY.tar_entity_id
  is 'Ŀ��ʵ��ID';
comment on column META_TAR_ENTITY.tar_tab_en_nm
  is 'Ŀ��ʵ��Ӣ����';
comment on column META_TAR_ENTITY.tar_tab_cn_nm
  is 'Ŀ��ʵ��������';
comment on column META_TAR_ENTITY.tar_tab_uniqueinfo
  is 'Ŀ��ʵ��Ψһ��ʶ';
comment on column META_TAR_ENTITY.sub_domain_name
  is '����������';
comment on column META_TAR_ENTITY.sub_domain_id
  is '������Id';
comment on column META_TAR_ENTITY.version
  is '�汾';
comment on column META_TAR_ENTITY.versionstatus
  is '�汾״̬(1:��Ч��0����Ч)';
comment on column META_TAR_ENTITY.sub_domain_code
  is '���������';
comment on column META_TAR_ENTITY.tar_tab_datarource_code
  is 'Ŀ��ʵ������Դ����';
comment on column META_TAR_ENTITY.collecttime
  is '�ɼ�ʱ��';
comment on column META_TAR_ENTITY.opreasonexp
  is '����ԭ��';
comment on column META_TAR_ENTITY.oppsrsonnel
  is '����������';
comment on column META_TAR_ENTITY.last_update_date
  is '����޸�����';

prompt
prompt Creating table META_TAR_RELATION
prompt ================================
prompt
create table META_TAR_RELATION
(
  tar_relation_id         VARCHAR2(100) not null,
  tar_relation_version_id VARCHAR2(100),
  mst_sub_domain_name     VARCHAR2(100) not null,
  mst_sub_domain_code     VARCHAR2(100),
  mst_sub_domain_id       VARCHAR2(100) not null,
  mst_tab_en_nm           VARCHAR2(100) not null,
  mst_tab_cn_nm           VARCHAR2(100),
  mst_attri_en_nm         VARCHAR2(100) not null,
  mst_attri_cn_nm         VARCHAR2(100),
  sub_sub_domain_name     VARCHAR2(100) not null,
  sub_sub_domain_code     VARCHAR2(100),
  sub_sub_domain_id       VARCHAR2(100) not null,
  sub_tab_en_nm           VARCHAR2(100) not null,
  sub_tab_cn_nm           VARCHAR2(100),
  sub_attri_en_nm         VARCHAR2(100) not null,
  sub_attri_cn_nm         VARCHAR2(100)
)
;
comment on table META_TAR_RELATION
  is 'Ŀ��ʵ�������';
comment on column META_TAR_RELATION.tar_relation_id
  is '����ID';
comment on column META_TAR_RELATION.tar_relation_version_id
  is 'Ŀ��ʵ���ϵ�汾id';
comment on column META_TAR_RELATION.mst_sub_domain_name
  is '��������������';
comment on column META_TAR_RELATION.mst_sub_domain_code
  is '�������������';
comment on column META_TAR_RELATION.mst_sub_domain_id
  is '����������ID';
comment on column META_TAR_RELATION.mst_tab_en_nm
  is '����Ӣ����';
comment on column META_TAR_RELATION.mst_tab_cn_nm
  is '����������';
comment on column META_TAR_RELATION.mst_attri_en_nm
  is '�����ֶ�Ӣ����';
comment on column META_TAR_RELATION.mst_attri_cn_nm
  is '�����ֶ�������';
comment on column META_TAR_RELATION.sub_sub_domain_name
  is '�ӱ�����������';
comment on column META_TAR_RELATION.sub_sub_domain_code
  is '�ӱ����������';
comment on column META_TAR_RELATION.sub_sub_domain_id
  is '�ӱ�������id';
comment on column META_TAR_RELATION.sub_tab_en_nm
  is '�ӱ�Ӣ����';
comment on column META_TAR_RELATION.sub_tab_cn_nm
  is '�ӱ�������';
comment on column META_TAR_RELATION.sub_attri_en_nm
  is '�ӱ��ֶ�Ӣ����';
comment on column META_TAR_RELATION.sub_attri_cn_nm
  is '�ӱ��ֶ�������';

prompt
prompt Creating table META_TAR_RELATION_VERSION
prompt ========================================
prompt
create table META_TAR_RELATION_VERSION
(
  tar_relation_version_id VARCHAR2(100) not null,
  collecttime             DATE,
  mst_sub_domain_id       VARCHAR2(100) not null,
  mst_sub_domain_name     VARCHAR2(100),
  mst_sub_domain_code     VARCHAR2(100),
  mst_tab_en_nm           VARCHAR2(100),
  mst_tab_cn_nm           VARCHAR2(100),
  version                 NUMBER not null,
  versionstatus           NUMBER not null,
  opreasonexp             VARCHAR2(100),
  oppsrsonnel             VARCHAR2(100)
)
;
comment on column META_TAR_RELATION_VERSION.tar_relation_version_id
  is 'Ŀ��ʵ���ϵ�汾id';
comment on column META_TAR_RELATION_VERSION.collecttime
  is '�ɼ�����';
comment on column META_TAR_RELATION_VERSION.mst_sub_domain_id
  is '����������id';
comment on column META_TAR_RELATION_VERSION.mst_sub_domain_name
  is '��������������';
comment on column META_TAR_RELATION_VERSION.mst_sub_domain_code
  is '�������������';
comment on column META_TAR_RELATION_VERSION.mst_tab_en_nm
  is '����Ӣ����';
comment on column META_TAR_RELATION_VERSION.mst_tab_cn_nm
  is '����������';
comment on column META_TAR_RELATION_VERSION.version
  is '�汾��';
comment on column META_TAR_RELATION_VERSION.versionstatus
  is '�汾״̬';
comment on column META_TAR_RELATION_VERSION.opreasonexp
  is '��������';
comment on column META_TAR_RELATION_VERSION.oppsrsonnel
  is '����������';
alter table META_TAR_RELATION_VERSION
  add constraint META_TAR_RELATION_VERSION_PK primary key (TAR_RELATION_VERSION_ID);

prompt
prompt Creating table PATCH_CONFIG
prompt ===========================
prompt
create table PATCH_CONFIG
(
  patch_id       VARCHAR2(32),
  patch_code     VARCHAR2(255),
  patch_name     VARCHAR2(520),
  tar_tab_enname VARCHAR2(1000),
  tar_tab_cnname VARCHAR2(1000),
  patch_status   VARCHAR2(1),
  patch_remarks  VARCHAR2(1000),
  create_data    DATE,
  creator        VARCHAR2(32),
  creatorname    VARCHAR2(500)
)
;
comment on column PATCH_CONFIG.patch_id
  is '����id';
comment on column PATCH_CONFIG.patch_code
  is '���κ�';
comment on column PATCH_CONFIG.patch_name
  is '��������';
comment on column PATCH_CONFIG.tar_tab_enname
  is '�����ݱ�Ӣ����';
comment on column PATCH_CONFIG.tar_tab_cnname
  is '�����ݱ�������';
comment on column PATCH_CONFIG.patch_status
  is '�Ƿ����ã�1Ϊ���ã�0Ϊ�����ã�';
comment on column PATCH_CONFIG.patch_remarks
  is '����˵��';
comment on column PATCH_CONFIG.create_data
  is '����ʱ��';
comment on column PATCH_CONFIG.creator
  is '������id';
comment on column PATCH_CONFIG.creatorname
  is '����������';

prompt
prompt Creating table PROC_LOG
prompt =======================
prompt
create table PROC_LOG
(
  proc_id     NUMBER,
  mark_time   VARCHAR2(10),
  proc_name   VARCHAR2(32),
  tab_name    VARCHAR2(32),
  step_name   VARCHAR2(100),
  begin_time  VARCHAR2(30),
  end_time    VARCHAR2(30),
  log_mess    VARCHAR2(500),
  error_flag  VARCHAR2(4),
  effect_rows NUMBER
)
;
comment on table PROC_LOG
  is '�洢������־��';
comment on column PROC_LOG.proc_id
  is '�洢���̵�ID��ʶ';
comment on column PROC_LOG.mark_time
  is '��������';
comment on column PROC_LOG.proc_name
  is '�洢��������';
comment on column PROC_LOG.tab_name
  is 'Ŀ�����';
comment on column PROC_LOG.step_name
  is '��������';
comment on column PROC_LOG.begin_time
  is '���迪ʼʱ��';
comment on column PROC_LOG.end_time
  is '�������ʱ��';
comment on column PROC_LOG.log_mess
  is '��־��Ϣ';
comment on column PROC_LOG.error_flag
  is '�����־��1������0����';
comment on column PROC_LOG.effect_rows
  is '��Ч��';

prompt
prompt Creating table SNAP_CONFIG
prompt ==========================
prompt
create table SNAP_CONFIG
(
  snap_id       VARCHAR2(255) not null,
  snap_name     VARCHAR2(255) not null,
  snap_tabname  VARCHAR2(255) not null,
  snap_type     VARCHAR2(255),
  snap_viewname VARCHAR2(255) not null,
  view_type     VARCHAR2(255),
  create_time   DATE,
  creator       VARCHAR2(255),
  modified_time DATE,
  modifiedby    VARCHAR2(255),
  description   VARCHAR2(255),
  sql_text      VARCHAR2(1000),
  patch_code    VARCHAR2(255),
  patch_name    VARCHAR2(520)
)
;
comment on table SNAP_CONFIG
  is '�������ñ�';
comment on column SNAP_CONFIG.snap_id
  is '����id';
comment on column SNAP_CONFIG.snap_name
  is '��������';
comment on column SNAP_CONFIG.snap_tabname
  is '���ն�Ӧ�������ݱ�����';
comment on column SNAP_CONFIG.snap_type
  is '�����������ͣ�C�������ͣ�M���ֹ���';
comment on column SNAP_CONFIG.snap_viewname
  is '����������ͼ����';
comment on column SNAP_CONFIG.view_type
  is '�������ɵ���ͼ�����������ͣ�T����V����ͼ��';
comment on column SNAP_CONFIG.create_time
  is '����ʱ��';
comment on column SNAP_CONFIG.creator
  is '�����û�';
comment on column SNAP_CONFIG.modified_time
  is '�޸�ʱ��';
comment on column SNAP_CONFIG.modifiedby
  is '�޸��û�';
comment on column SNAP_CONFIG.description
  is '����';
comment on column SNAP_CONFIG.sql_text
  is '���������ͼ��sql���';
comment on column SNAP_CONFIG.patch_code
  is '���κ�';
comment on column SNAP_CONFIG.patch_name
  is '��������';
alter table SNAP_CONFIG
  add constraint SNAP_CONFIG_UK1 unique (SNAP_NAME);
alter table SNAP_CONFIG
  add constraint SNAP_CONFIG_UK2 unique (SNAP_VIEWNAME);

prompt
prompt Creating table SNAP_VIEWS
prompt =========================
prompt
create table SNAP_VIEWS
(
  view_id     VARCHAR2(255),
  snap_id     VARCHAR2(255),
  view_name   VARCHAR2(255),
  create_time DATE,
  creator     VARCHAR2(255)
)
;
comment on table SNAP_VIEWS
  is '������ͼ��';
comment on column SNAP_VIEWS.view_id
  is '��ͼid';
comment on column SNAP_VIEWS.snap_id
  is '����id';
comment on column SNAP_VIEWS.view_name
  is '��ͼ����';
comment on column SNAP_VIEWS.create_time
  is '����ʱ��';
comment on column SNAP_VIEWS.creator
  is '�����û�';

prompt
prompt Creating table SYS_E_QUERY_CFG
prompt ==============================
prompt
create table SYS_E_QUERY_CFG
(
  cfg_id           VARCHAR2(255) not null,
  tab_en_nm        VARCHAR2(255),
  tab_cn_nm        VARCHAR2(255),
  attri_en_nm      VARCHAR2(255),
  attri_cn_nm      VARCHAR2(255),
  is_display       NUMBER,
  is_query         NUMBER,
  is_edit          NUMBER,
  query_type       VARCHAR2(255),
  attri_sort       NUMBER,
  query_attri_sort NUMBER,
  creator          VARCHAR2(255),
  create_date      DATE
)
;

prompt
prompt Creating table SYS_E_SELECT_CFG
prompt ===============================
prompt
create table SYS_E_SELECT_CFG
(
  select_id   VARCHAR2(255),
  tab_en_nm   VARCHAR2(255),
  attri_en_nm VARCHAR2(255),
  value       VARCHAR2(255)
)
;

prompt
prompt Creating table SYS_MD_APPLY_CFG
prompt ===============================
prompt
create table SYS_MD_APPLY_CFG
(
  cfg_id    VARCHAR2(120) not null,
  tablename VARCHAR2(120)
)
;
comment on table SYS_MD_APPLY_CFG
  is '�����ݼ���������';
comment on column SYS_MD_APPLY_CFG.cfg_id
  is '����id';
comment on column SYS_MD_APPLY_CFG.tablename
  is '��������';
alter table SYS_MD_APPLY_CFG
  add constraint SYS_MD_APPLY_CFG_PK primary key (CFG_ID);

prompt
prompt Creating table SYS_MD_CREATE_CFG
prompt ================================
prompt
create table SYS_MD_CREATE_CFG
(
  cfg_id      VARCHAR2(255),
  tab_en_nm   VARCHAR2(255),
  tab_cn_nm   VARCHAR2(255),
  procedure   VARCHAR2(255),
  description VARCHAR2(255)
)
;
comment on column SYS_MD_CREATE_CFG.cfg_id
  is '���ñ�id';
comment on column SYS_MD_CREATE_CFG.tab_en_nm
  is '��Ӣ����';
comment on column SYS_MD_CREATE_CFG.tab_cn_nm
  is '��������';
comment on column SYS_MD_CREATE_CFG.procedure
  is '�洢����';
comment on column SYS_MD_CREATE_CFG.description
  is '��������';

prompt
prompt Creating table SYS_MD_QUERY_CFG
prompt ===============================
prompt
create table SYS_MD_QUERY_CFG
(
  cfg_id           VARCHAR2(255) not null,
  tab_en_nm        VARCHAR2(255),
  tab_cn_nm        VARCHAR2(255),
  attri_en_nm      VARCHAR2(255),
  attri_cn_nm      VARCHAR2(255),
  is_display       NUMBER,
  is_query         NUMBER,
  is_edit          NUMBER,
  query_type       VARCHAR2(255),
  attri_sort       NUMBER,
  query_attri_sort NUMBER,
  creator          VARCHAR2(255),
  create_date      DATE
)
;
comment on column SYS_MD_QUERY_CFG.cfg_id
  is '����id';
comment on column SYS_MD_QUERY_CFG.tab_en_nm
  is '��Ӣ����';
comment on column SYS_MD_QUERY_CFG.tab_cn_nm
  is '��������';
comment on column SYS_MD_QUERY_CFG.attri_en_nm
  is '�ֶ�Ӣ����';
comment on column SYS_MD_QUERY_CFG.attri_cn_nm
  is '�ֶ�������';
comment on column SYS_MD_QUERY_CFG.is_display
  is '�Ƿ���ʾ��1���ǣ�0����';
comment on column SYS_MD_QUERY_CFG.is_query
  is '�Ƿ��ѯ��1���ǣ�0����';
comment on column SYS_MD_QUERY_CFG.is_edit
  is '�Ƿ�༭��1���ǣ�0����';
comment on column SYS_MD_QUERY_CFG.query_type
  is '��ѯ���ͣ�text���ı���select�� ������date�����ڿ�';
comment on column SYS_MD_QUERY_CFG.attri_sort
  is '�ֶ�����';
comment on column SYS_MD_QUERY_CFG.query_attri_sort
  is '��ѯ�ֶ�����';
comment on column SYS_MD_QUERY_CFG.creator
  is '������';
comment on column SYS_MD_QUERY_CFG.create_date
  is '����ʱ��';
alter table SYS_MD_QUERY_CFG
  add constraint SYS_MD_QUERY_CFG1_PK primary key (CFG_ID);

prompt
prompt Creating table SYS_MD_SELECT_CFG
prompt ================================
prompt
create table SYS_MD_SELECT_CFG
(
  select_id   VARCHAR2(255),
  tab_en_nm   VARCHAR2(255),
  attri_en_nm VARCHAR2(255),
  value       VARCHAR2(255)
)
;
comment on column SYS_MD_SELECT_CFG.select_id
  is '����id';
comment on column SYS_MD_SELECT_CFG.tab_en_nm
  is '����';
comment on column SYS_MD_SELECT_CFG.attri_en_nm
  is '�ֶ���';
comment on column SYS_MD_SELECT_CFG.value
  is 'ֵ';


spool off
