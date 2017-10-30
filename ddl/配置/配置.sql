--------------------------------------------
-- Export file for user C##_BIGDATA@ZZMDM --
-- Created by zhy on 2017/10/13, 11:00:20 --
--------------------------------------------

set define off
spool 配置.log

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
  is '标准代码申请单';
comment on column CODE_APPLY.apply_code
  is '申请单号';
comment on column CODE_APPLY.type
  is '申请类型（0：新增；1：删除：2：修改）';
comment on column CODE_APPLY.status
  is '状态（0：待审批；1：审批不通过；2：审批通过）';
comment on column CODE_APPLY.applicant
  is '申请人';
comment on column CODE_APPLY.apply_release_date
  is '申请发布日期';
comment on column CODE_APPLY.apply_date
  is '申请日期';
comment on column CODE_APPLY.remark
  is '申请备注';
comment on column CODE_APPLY.approval_remark
  is '审批备注';
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
  is '编码分类';
comment on column CODE_CODING_TYPE.coding_type_code
  is '编码分类代号';
comment on column CODE_CODING_TYPE.coding_type_name
  is '编码分类名称';
comment on column CODE_CODING_TYPE.coding_type_parent_code
  is '上级编码';
comment on column CODE_CODING_TYPE.is_last_codeing
  is '是否末级（0：否；1：是）';
comment on column CODE_CODING_TYPE.coding_model
  is '编码性质（0：编码规则；1：标准编码）';
comment on column CODE_CODING_TYPE.standard_identification_code
  is '标准标识号';
comment on column CODE_CODING_TYPE.reference_standard
  is '引用标准';
comment on column CODE_CODING_TYPE.remark
  is '备注';
comment on column CODE_CODING_TYPE.parent_code_type
  is '上级编码类型（0： 信息分类；1：编码分类）';
comment on column CODE_CODING_TYPE.sort
  is '排序';
comment on column CODE_CODING_TYPE.coding_classify
  is '编码分类，0代表标准编码，1代表自定义编码';
comment on column CODE_CODING_TYPE.coding_type_level
  is '编码层级';
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
  is '信息分类';
comment on column CODE_INFO_TYPE.info_type_code
  is '信息分类代号';
comment on column CODE_INFO_TYPE.info_type_name
  is '信息分类名称';
comment on column CODE_INFO_TYPE.corresponding_code
  is '对应分册代号';
comment on column CODE_INFO_TYPE.corresponding_document
  is '对应分册文档';
comment on column CODE_INFO_TYPE.version_number
  is '分册最新版本号';
comment on column CODE_INFO_TYPE.release_date
  is '分册发布日期';
comment on column CODE_INFO_TYPE.implementation_date
  is '分册实施日期';
comment on column CODE_INFO_TYPE.remark
  is '备注';
comment on column CODE_INFO_TYPE.creator
  is '创建人';
comment on column CODE_INFO_TYPE.create_date
  is '创建日期';
comment on column CODE_INFO_TYPE.last_modifier
  is '最后更新人员';
comment on column CODE_INFO_TYPE.last_modified_date
  is '最后更新日期';
comment on column CODE_INFO_TYPE.sort
  is '排序';
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
  is '上层应用表';
comment on column DATA_APPERAPP.apperapp_id
  is '上层应用ID';
comment on column DATA_APPERAPP.appname
  is '应用名称';
comment on column DATA_APPERAPP.appdesc
  is '应用描述';
comment on column DATA_APPERAPP.configstate
  is '状态';
comment on column DATA_APPERAPP.createpersonid
  is '创建人';
comment on column DATA_APPERAPP.createtime
  is '创建时间';
comment on column DATA_APPERAPP.editpersonid
  is '修改人';
comment on column DATA_APPERAPP.edittime
  is '修改时间';
comment on column DATA_APPERAPP.remarks
  is '备注';
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
  is '主数据配置表';
comment on column DATA_CONFIG.config_id
  is '配置ID;';
comment on column DATA_CONFIG.apperapp_id
  is '上层应用ID;如果此条定制为编码定制，此字段为null';
comment on column DATA_CONFIG.tablename
  is '表名称';
comment on column DATA_CONFIG.tablefield
  is '表字段';
comment on column DATA_CONFIG.approvalstate
  is '审批状态:0、待审核,1、有效,2、无效;如果此条定制为编码定制，此字段为null';
comment on column DATA_CONFIG.srvstrategy
  is '服务策略: 1、实时,2、定时;如果此条定制为编码定制，此字段为null';
comment on column DATA_CONFIG.createpersonid
  is '创建人';
comment on column DATA_CONFIG.createtime
  is '创建时间';
comment on column DATA_CONFIG.editpersonid
  is '修改人';
comment on column DATA_CONFIG.edittime
  is '修改时间';
comment on column DATA_CONFIG.remarks
  is '备注';
comment on column DATA_CONFIG.filter_con
  is '过滤条件';
comment on column DATA_CONFIG.servicecycle
  is '服务周期;如果此条定制为编码定制，此字段为null';
comment on column DATA_CONFIG.servicetime
  is '时间间隔';
comment on column DATA_CONFIG.tablecnname
  is '表中文名';
comment on column DATA_CONFIG.tablecnfield
  is '字段中文名';
comment on column DATA_CONFIG.responsetype
  is '响应类型，1:json格式,2:xml格式
';
comment on column DATA_CONFIG.datatype
  is '数据类型（0:主数据集,1:编码）';
comment on column DATA_CONFIG.incr_field
  is '增量字段;如果此条定制为编码定制，此字段为null';
comment on column DATA_CONFIG.viewsql
  is '视图sql;如果此条定制为编码定制，此字段为null';
comment on column DATA_CONFIG.snap
  is '快照对应视图名称';
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
  is '主数据接口访问日志表';
comment on column DATA_LOG.log_id
  is '日志ID';
comment on column DATA_LOG.apperapp_id
  is '上层应用ID';
comment on column DATA_LOG.configcode
  is '编码';
comment on column DATA_LOG.configtype
  is '类型';
comment on column DATA_LOG.tablename
  is '表名称';
comment on column DATA_LOG.tablefield
  is '表字段';
comment on column DATA_LOG.createtime
  is '调用时间';
comment on column DATA_LOG.remarks
  is '备注';
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
  is '外面应用id';
comment on column LOGS.ip_address
  is '外部应用IP地址';
comment on column LOGS.call_status
  is '调用状态';
comment on column LOGS.tablename
  is '定制数据表';
comment on column LOGS.tablefield
  is '定制字段';
comment on column LOGS.end_time
  is '调用完成时间';
comment on column LOGS.data_type
  is '响应数据类型';
comment on column LOGS.status_describe
  is '调用状态信息描述';
comment on column LOGS.start_time
  is '调用开始时间';
comment on column LOGS.startegy
  is '调用策略';
comment on column LOGS.appname
  is '上层应用name';
comment on column LOGS.request_time
  is '请求时间';

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
  is '目标实体属性表';
comment on column META_BUS_ATTRI.bus_attri_id
  is '目标表字段id';
comment on column META_BUS_ATTRI.bus_entity_id
  is '目标实体ID';
comment on column META_BUS_ATTRI.bus_tab_entity
  is '目标实体';
comment on column META_BUS_ATTRI.bus_tab_en_nm
  is '目标实体英文名';
comment on column META_BUS_ATTRI.bus_tab_cn_nm
  is '目标实体中文名';
comment on column META_BUS_ATTRI.bus_attri_en_nm
  is '目标实体属性英文名';
comment on column META_BUS_ATTRI.bus_attri_cn_nm
  is '目标实体属性中文名';
comment on column META_BUS_ATTRI.bus_attri_typ
  is '目标实体属性类型';
comment on column META_BUS_ATTRI.bus_attri_desc
  is '目标实体属性描述';
comment on column META_BUS_ATTRI.bus_tab_fullinfo
  is '目标实体完整信息';
comment on column META_BUS_ATTRI.sub_domain_name
  is '主题域名称';
comment on column META_BUS_ATTRI.sub_domain_code
  is '主题域编码';
comment on column META_BUS_ATTRI.sub_domain_id
  is '主题域Id';
comment on column META_BUS_ATTRI.bus_tab_rourcesys_type
  is '目标实体源类型';
comment on column META_BUS_ATTRI.bus_attri_length
  is '目标实体属性长度';
comment on column META_BUS_ATTRI.null_flag
  is '是否可空（Y:是，N:否)';
comment on column META_BUS_ATTRI.unique_flay
  is '是否主键（Y:是，N:否)';
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
  is '目标实体表';
comment on column META_BUS_ENTITY.bus_entity_id
  is '目标实体ID';
comment on column META_BUS_ENTITY.bus_tab_en_nm
  is '目标实体英文名';
comment on column META_BUS_ENTITY.bus_tab_cn_nm
  is '目标实体中文名';
comment on column META_BUS_ENTITY.bus_tab_uniqueinfo
  is '目标实体唯一标识';
comment on column META_BUS_ENTITY.sub_domain_name
  is '主题域名称';
comment on column META_BUS_ENTITY.sub_domain_id
  is '主题域Id';
comment on column META_BUS_ENTITY.version
  is '版本';
comment on column META_BUS_ENTITY.versionstatus
  is '版本状态(1:有效，0：无效)';
comment on column META_BUS_ENTITY.sub_domain_code
  is '主题域编码';
comment on column META_BUS_ENTITY.bus_tab_datarource_code
  is '目标实体数据源类型';
comment on column META_BUS_ENTITY.collecttime
  is '采集时间';
comment on column META_BUS_ENTITY.opreasonexp
  is '操作原因';
comment on column META_BUS_ENTITY.oppsrsonnel
  is '操作人姓名';

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
  is '数据源配置表';
comment on column META_DATASOURCE_CONFIG.datasource_config_id
  is '数据源id';
comment on column META_DATASOURCE_CONFIG.parent_id
  is '数据源编号父节点';
comment on column META_DATASOURCE_CONFIG.datasource_config_code
  is '数据源编号';
comment on column META_DATASOURCE_CONFIG.datasource_config_name
  is '数据源名称';
comment on column META_DATASOURCE_CONFIG.remark
  is '备注';
comment on column META_DATASOURCE_CONFIG.db_info
  is '数据库信息';
comment on column META_DATASOURCE_CONFIG.sort_index
  is '排序';
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
  is '实体映射信息表';
comment on column META_ENTITY_MAPPING_INFO.id
  is '实体映射id';
comment on column META_ENTITY_MAPPING_INFO.tar_tab_en_nm
  is '目标表英文名称';
comment on column META_ENTITY_MAPPING_INFO.tar_tab_cn_nm
  is '目标表中文名称';
comment on column META_ENTITY_MAPPING_INFO.tar_attri_en_nm
  is '目标表字段英文名称';
comment on column META_ENTITY_MAPPING_INFO.tar_attri_cn_nm
  is '目标表字段中文名称';
comment on column META_ENTITY_MAPPING_INFO.tar_attri_type
  is '目标表字段类型';
comment on column META_ENTITY_MAPPING_INFO.tar_tab_rourcesys_type
  is '目标表数据库类型';
comment on column META_ENTITY_MAPPING_INFO.sub_domain_name
  is '主题域';
comment on column META_ENTITY_MAPPING_INFO.version_code
  is '版本编号';
comment on column META_ENTITY_MAPPING_INFO.valid_flag
  is '有效标识(默认是1,版本还原之后这个就变成0)';
comment on column META_ENTITY_MAPPING_INFO.src_tab_cn_nm
  is '源表中文名称';
comment on column META_ENTITY_MAPPING_INFO.src_attri_en_nm
  is '源字段英文名称';
comment on column META_ENTITY_MAPPING_INFO.src_attri_cn_nm
  is '源字段中文名称';
comment on column META_ENTITY_MAPPING_INFO.src_attri_typ
  is '源表字段类型';
comment on column META_ENTITY_MAPPING_INFO.src_tab_datarource_code
  is '源表数据库类型';
comment on column META_ENTITY_MAPPING_INFO.src_sys_id
  is '源系统id';
comment on column META_ENTITY_MAPPING_INFO.src_sys_name
  is '源系统名称';
comment on column META_ENTITY_MAPPING_INFO.src_firm_parent_id
  is '源厂家id';
comment on column META_ENTITY_MAPPING_INFO.src_firm_parent_code
  is '源厂家名称';
comment on column META_ENTITY_MAPPING_INFO.excel_name
  is '导入excel名称';
comment on column META_ENTITY_MAPPING_INFO.tec_realize
  is '技术实现';
comment on column META_ENTITY_MAPPING_INFO.mapping_rule
  is '映射描述';
comment on column META_ENTITY_MAPPING_INFO.etl_unique_id
  is '抽取批次ID';
comment on column META_ENTITY_MAPPING_INFO.pediod
  is '周期频度';
comment on column META_ENTITY_MAPPING_INFO.etlstrategy
  is 'ETL策略';
comment on column META_ENTITY_MAPPING_INFO.incre_data_extracting
  is '增量抽取标准';
comment on column META_ENTITY_MAPPING_INFO.designer
  is '设计人';
comment on column META_ENTITY_MAPPING_INFO.target_clean_rule
  is '目标清洗规则';
comment on column META_ENTITY_MAPPING_INFO.src_tab_en_nm
  is '源表英文名称';
comment on column META_ENTITY_MAPPING_INFO.sub_domain_id
  is '主题域id';
comment on column META_ENTITY_MAPPING_INFO.upload_time
  is '导入时间';
comment on column META_ENTITY_MAPPING_INFO.sub_domain_code
  is '主题域编码';
comment on column META_ENTITY_MAPPING_INFO.reason_id
  is '操作原因id';

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
  is '映射操作原因表';
comment on column META_ENTITY_MAPPING_REASON.entity_mapping_reason_id
  is '原因id';
comment on column META_ENTITY_MAPPING_REASON.tar_tab_en_nm
  is '目标表英文名';
comment on column META_ENTITY_MAPPING_REASON.tar_tab_cn_nm
  is '目标表中文名';
comment on column META_ENTITY_MAPPING_REASON.sub_domain_id
  is '主题域id';
comment on column META_ENTITY_MAPPING_REASON.sub_domain_name
  is '主题域名称';
comment on column META_ENTITY_MAPPING_REASON.create_new_version
  is '创建的新版本编号';
comment on column META_ENTITY_MAPPING_REASON.database_type
  is '数据库类型';
comment on column META_ENTITY_MAPPING_REASON.version_crate_time
  is '版本创建时间';
comment on column META_ENTITY_MAPPING_REASON.userid
  is '操作员id';
comment on column META_ENTITY_MAPPING_REASON.username
  is '操作员名称';
comment on column META_ENTITY_MAPPING_REASON.operater_reason_desc
  is '操作原因';
comment on column META_ENTITY_MAPPING_REASON.delete_all_flag
  is '删除标志(1表示删除,0表示没有删除)';

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
  is '校验表(存储excel中需要校验的字段等)';
comment on column META_EXCEL_CHECK.mec_id
  is '表主键id';
comment on column META_EXCEL_CHECK.model_code
  is '类型code';
comment on column META_EXCEL_CHECK.model_name
  is '类型名称';
comment on column META_EXCEL_CHECK.model_filed_name
  is '类型下的字段名称';
comment on column META_EXCEL_CHECK.check_type
  is '校验种类(映射的话是EXCEL和EXCELTOP)';
comment on column META_EXCEL_CHECK.sort
  is '排序';
comment on column META_EXCEL_CHECK.sql
  is '判断的sql语句';
comment on column META_EXCEL_CHECK.filed_name
  is '在要导入表中的字段名称';
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
  is '主题域表';
comment on column META_E_SUB_DOMAIN.sub_domain_id
  is '主题域ID';
comment on column META_E_SUB_DOMAIN.sub_domain_name
  is '主题域名称';
comment on column META_E_SUB_DOMAIN.parent_id
  is '主题域父节点';
comment on column META_E_SUB_DOMAIN.sub_domain_code
  is '主题域编码';
comment on column META_E_SUB_DOMAIN.sort_index
  is '排序';

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
  is '目标实体属性表';
comment on column META_E_TAR_ATTRI.tar_attri_id
  is '目标表字段id';
comment on column META_E_TAR_ATTRI.tar_entity_id
  is '目标实体ID';
comment on column META_E_TAR_ATTRI.tar_tab_entity
  is '目标实体';
comment on column META_E_TAR_ATTRI.tar_tab_en_nm
  is '目标实体英文名';
comment on column META_E_TAR_ATTRI.tar_tab_cn_nm
  is '目标实体中文名';
comment on column META_E_TAR_ATTRI.tar_attri_en_nm
  is '目标实体属性英文名';
comment on column META_E_TAR_ATTRI.tar_attri_cn_nm
  is '目标实体属性中文名';
comment on column META_E_TAR_ATTRI.tar_attri_typ
  is '目标实体属性类型';
comment on column META_E_TAR_ATTRI.tar_attri_desc
  is '目标实体属性描述';
comment on column META_E_TAR_ATTRI.tar_tab_fullinfo
  is '目标实体完整信息';
comment on column META_E_TAR_ATTRI.sub_domain_name
  is '主题域名称';
comment on column META_E_TAR_ATTRI.sub_domain_code
  is '主题域编码';
comment on column META_E_TAR_ATTRI.sub_domain_id
  is '主题域Id';
comment on column META_E_TAR_ATTRI.tar_tab_rourcesys_type
  is '目标实体源类型';
comment on column META_E_TAR_ATTRI.tar_attri_length
  is '目标实体属性长度';
comment on column META_E_TAR_ATTRI.null_flag
  is '是否可空（Y:是，N:否)';
comment on column META_E_TAR_ATTRI.unique_flay
  is '是否主键（Y:是，N:否)';

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
  is '目标实体表';
comment on column META_E_TAR_ENTITY.tar_entity_id
  is '目标实体ID';
comment on column META_E_TAR_ENTITY.tar_tab_en_nm
  is '目标实体英文名';
comment on column META_E_TAR_ENTITY.tar_tab_cn_nm
  is '目标实体中文名';
comment on column META_E_TAR_ENTITY.tar_tab_uniqueinfo
  is '目标实体唯一标识';
comment on column META_E_TAR_ENTITY.sub_domain_name
  is '主题域名称';
comment on column META_E_TAR_ENTITY.sub_domain_id
  is '主题域Id';
comment on column META_E_TAR_ENTITY.version
  is '版本';
comment on column META_E_TAR_ENTITY.versionstatus
  is '版本状态(1:有效，0：无效)';
comment on column META_E_TAR_ENTITY.sub_domain_code
  is '主题域编码';
comment on column META_E_TAR_ENTITY.tar_tab_datarource_code
  is '目标实体数据源类型';
comment on column META_E_TAR_ENTITY.collecttime
  is '采集时间';
comment on column META_E_TAR_ENTITY.opreasonexp
  is '操作原因';
comment on column META_E_TAR_ENTITY.oppsrsonnel
  is '操作人姓名';
comment on column META_E_TAR_ENTITY.last_update_date
  is '最后修改日期';

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
  is '配置表主键';
comment on column META_E_TAR_PROCCFG.tablename
  is '表名';
comment on column META_E_TAR_PROCCFG.primarykey
  is '主键列名';

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
  is 'job状态表';
comment on column META_JOB.id
  is '主键';
comment on column META_JOB.name
  is 'job的名称';
comment on column META_JOB.status
  is '状态（0：不执行，1：执行）';
comment on column META_JOB.jobid
  is 'job的id（对应 调度中的id变量）';
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
  is '源实体属性表';
comment on column META_SRC_ATTRI.src_attri_id
  is '源属性id';
comment on column META_SRC_ATTRI.src_tab_entity_id
  is '源实体ID';
comment on column META_SRC_ATTRI.src_tab_entity
  is '源实体名称';
comment on column META_SRC_ATTRI.src_tab_en_nm
  is '源表英文名';
comment on column META_SRC_ATTRI.src_tab_cn_nm
  is '源表中文名';
comment on column META_SRC_ATTRI.src_attri_en_nm
  is '源表属性英文名';
comment on column META_SRC_ATTRI.src_attri_cn_nm
  is '源表属性中文名';
comment on column META_SRC_ATTRI.src_attri_typ
  is '源表属性类型';
comment on column META_SRC_ATTRI.src_attri_desc
  is '源表属性描述';
comment on column META_SRC_ATTRI.src_tab_fullinfo
  is '源表完整信息';
comment on column META_SRC_ATTRI.src_sys_name
  is '源表系统名称';
comment on column META_SRC_ATTRI.src_sys_code
  is '源表系统编号';
comment on column META_SRC_ATTRI.src_sys_id
  is '源系统id';
comment on column META_SRC_ATTRI.src_firm_name
  is '源厂商名称';
comment on column META_SRC_ATTRI.src_firm_code
  is '源厂商编码';
comment on column META_SRC_ATTRI.src_tab_datarource_code
  is '数据源编码';
comment on column META_SRC_ATTRI.src_attri_length
  is '源属性长度';
comment on column META_SRC_ATTRI.null_flag
  is '是否可空（Y:是，N:否)';
comment on column META_SRC_ATTRI.unique_flay
  is '是否主键（Y:是，N:否)';
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
  is '源实体表';
comment on column META_SRC_ENTITY.src_entity_id
  is '源实体ID';
comment on column META_SRC_ENTITY.collecttime
  is '采集日期';
comment on column META_SRC_ENTITY.src_tab_en_nm
  is '源实体英文名';
comment on column META_SRC_ENTITY.src_tab_cn_nm
  is '源实体中文名';
comment on column META_SRC_ENTITY.src_sys_name
  is '源系统名称';
comment on column META_SRC_ENTITY.src_sys_id
  is '源系统ID';
comment on column META_SRC_ENTITY.src_tab_uniqueinfo
  is '源表唯一ID';
comment on column META_SRC_ENTITY.src_firm_name
  is '源厂商名称';
comment on column META_SRC_ENTITY.src_firm_code
  is '源厂商编码';
comment on column META_SRC_ENTITY.src_tab_datarource_code
  is '源数据库编码';
comment on column META_SRC_ENTITY.src_sys_code
  is '源系统编码';
comment on column META_SRC_ENTITY.version
  is '版本';
comment on column META_SRC_ENTITY.versionstatus
  is '版本状态';
comment on column META_SRC_ENTITY.opreasonexp
  is '操作描述';
comment on column META_SRC_ENTITY.oppsrsonnel
  is '操作人姓名';
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
  is '源实体关联表';
comment on column META_SRC_RELATION.src_relation_id
  is '关联ID';
comment on column META_SRC_RELATION.src_relation_version_id
  is '源实体版本id';
comment on column META_SRC_RELATION.mst_src_sys_name
  is '主表系统名称';
comment on column META_SRC_RELATION.mst_src_sys_code
  is '主表系统编码';
comment on column META_SRC_RELATION.mst_src_sys_id
  is '主表系统ID';
comment on column META_SRC_RELATION.mst_firm_name
  is '主表厂商名称';
comment on column META_SRC_RELATION.mst_firm_code
  is '主表厂商编码';
comment on column META_SRC_RELATION.mst_tab_en_nm
  is '主表英文名';
comment on column META_SRC_RELATION.mst_tab_cn_nm
  is '主表中文名';
comment on column META_SRC_RELATION.mst_attri_en_nm
  is '主表字段英文名';
comment on column META_SRC_RELATION.mst_attri_cn_nm
  is '主表字段中文名';
comment on column META_SRC_RELATION.sub_src_sys_name
  is '从表系统名称';
comment on column META_SRC_RELATION.sub_src_sys_code
  is '从表系统编码';
comment on column META_SRC_RELATION.sub_src_sys_id
  is '从表系统ID';
comment on column META_SRC_RELATION.sub_firm_name
  is '从表厂商名称';
comment on column META_SRC_RELATION.sub_firm_code
  is '从表厂商编码';
comment on column META_SRC_RELATION.sub_tab_en_nm
  is '从表英文名';
comment on column META_SRC_RELATION.sub_tab_cn_nm
  is '从表中文名';
comment on column META_SRC_RELATION.sub_attri_en_nm
  is '从表字段英文名';
comment on column META_SRC_RELATION.sub_attri_cn_nm
  is '从表字段中文名';
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
  is '源实体关系版本id';
comment on column META_SRC_RELATION_VERSION.collecttime
  is '采集日期';
comment on column META_SRC_RELATION_VERSION.mst_src_sys_id
  is '主表源系统id';
comment on column META_SRC_RELATION_VERSION.mst_src_sys_name
  is '主表源系统名称';
comment on column META_SRC_RELATION_VERSION.mst_src_sys_code
  is '主表源系统编码';
comment on column META_SRC_RELATION_VERSION.mst_firm_name
  is '主表源厂商名称';
comment on column META_SRC_RELATION_VERSION.mst_firm_code
  is '主表源厂商编码';
comment on column META_SRC_RELATION_VERSION.mst_tab_en_nm
  is '主表英文名';
comment on column META_SRC_RELATION_VERSION.mst_tab_cn_nm
  is '主表中文名';
comment on column META_SRC_RELATION_VERSION.version
  is '版本';
comment on column META_SRC_RELATION_VERSION.versionstatus
  is '版本状态';
comment on column META_SRC_RELATION_VERSION.opreasonexp
  is '操作描述';
comment on column META_SRC_RELATION_VERSION.oppsrsonnel
  is '操作人姓名';
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
  is '来源厂商/系统表';
comment on column META_SRC_SYS.src_sys_id
  is '厂商/系统id';
comment on column META_SRC_SYS.src_sys_code
  is '厂商/系统编码';
comment on column META_SRC_SYS.src_sys_name
  is '厂商/系统名称';
comment on column META_SRC_SYS.src_firm_parent_id
  is '来源厂商id，如果是0的话就是厂商';
comment on column META_SRC_SYS.src_firm_parent_code
  is '来源厂商code';
comment on column META_SRC_SYS.remark
  is '描述';
comment on column META_SRC_SYS.datasource_id
  is '数据库ip';
comment on column META_SRC_SYS.username
  is '用户名';
comment on column META_SRC_SYS.password
  is '密码';
comment on column META_SRC_SYS.sort
  is '排序';
comment on column META_SRC_SYS.data_source
  is '数据类型';

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
  is '主题域表';
comment on column META_SUB_DOMAIN.sub_domain_id
  is '主题域ID';
comment on column META_SUB_DOMAIN.sub_domain_name
  is '主题域名称';
comment on column META_SUB_DOMAIN.parent_id
  is '主题域父节点';
comment on column META_SUB_DOMAIN.sub_domain_code
  is '主题域编码';
comment on column META_SUB_DOMAIN.sort_index
  is '排序';

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
  is '目标实体属性表';
comment on column META_TAR_ATTRI.tar_attri_id
  is '目标表字段id';
comment on column META_TAR_ATTRI.tar_entity_id
  is '目标实体ID';
comment on column META_TAR_ATTRI.tar_tab_entity
  is '目标实体';
comment on column META_TAR_ATTRI.tar_tab_en_nm
  is '目标实体英文名';
comment on column META_TAR_ATTRI.tar_tab_cn_nm
  is '目标实体中文名';
comment on column META_TAR_ATTRI.tar_attri_en_nm
  is '目标实体属性英文名';
comment on column META_TAR_ATTRI.tar_attri_cn_nm
  is '目标实体属性中文名';
comment on column META_TAR_ATTRI.tar_attri_typ
  is '目标实体属性类型';
comment on column META_TAR_ATTRI.tar_attri_desc
  is '目标实体属性描述';
comment on column META_TAR_ATTRI.tar_tab_fullinfo
  is '目标实体完整信息';
comment on column META_TAR_ATTRI.sub_domain_name
  is '主题域名称';
comment on column META_TAR_ATTRI.sub_domain_code
  is '主题域编码';
comment on column META_TAR_ATTRI.sub_domain_id
  is '主题域Id';
comment on column META_TAR_ATTRI.tar_tab_rourcesys_type
  is '目标实体源类型';
comment on column META_TAR_ATTRI.tar_attri_length
  is '目标实体属性长度';
comment on column META_TAR_ATTRI.null_flag
  is '是否可空（Y:是，N:否)';
comment on column META_TAR_ATTRI.unique_flay
  is '是否主键（Y:是，N:否)';
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
  is '目标实体属性临时表';
comment on column META_TAR_ATTRI_TEMP.tar_attri_temp_id
  is '临时目标表字段id';
comment on column META_TAR_ATTRI_TEMP.tar_tab_entity
  is '目标实体';
comment on column META_TAR_ATTRI_TEMP.tar_tab_en_nm
  is '目标实体英文名';
comment on column META_TAR_ATTRI_TEMP.tar_tab_cn_nm
  is '目标实体中文名';
comment on column META_TAR_ATTRI_TEMP.tar_attri_en_nm
  is '目标实体属性英文名';
comment on column META_TAR_ATTRI_TEMP.tar_attri_cn_nm
  is '目标实体属性中文名';
comment on column META_TAR_ATTRI_TEMP.tar_attri_typ
  is '目标实体属性类型';
comment on column META_TAR_ATTRI_TEMP.tar_attri_desc
  is '目标实体属性描述';
comment on column META_TAR_ATTRI_TEMP.tar_tab_fullinfo
  is '目标实体属性完整信息';
comment on column META_TAR_ATTRI_TEMP.sub_domain_name
  is '主题域名称';
comment on column META_TAR_ATTRI_TEMP.sub_domain_code
  is '主题域编码';
comment on column META_TAR_ATTRI_TEMP.sub_domain_id
  is '主题域Id';
comment on column META_TAR_ATTRI_TEMP.tar_tab_rourcesys_type
  is '目标实体源类型';
comment on column META_TAR_ATTRI_TEMP.tar_attri_length
  is '目标实体属性长度';
comment on column META_TAR_ATTRI_TEMP.null_flag
  is '是否可空（Y:是，N:否)';
comment on column META_TAR_ATTRI_TEMP.unique_flay
  is '是否主键（Y:是，N:否)';
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
  is '目标实体表';
comment on column META_TAR_ENTITY.tar_entity_id
  is '目标实体ID';
comment on column META_TAR_ENTITY.tar_tab_en_nm
  is '目标实体英文名';
comment on column META_TAR_ENTITY.tar_tab_cn_nm
  is '目标实体中文名';
comment on column META_TAR_ENTITY.tar_tab_uniqueinfo
  is '目标实体唯一标识';
comment on column META_TAR_ENTITY.sub_domain_name
  is '主题域名称';
comment on column META_TAR_ENTITY.sub_domain_id
  is '主题域Id';
comment on column META_TAR_ENTITY.version
  is '版本';
comment on column META_TAR_ENTITY.versionstatus
  is '版本状态(1:有效，0：无效)';
comment on column META_TAR_ENTITY.sub_domain_code
  is '主题域编码';
comment on column META_TAR_ENTITY.tar_tab_datarource_code
  is '目标实体数据源类型';
comment on column META_TAR_ENTITY.collecttime
  is '采集时间';
comment on column META_TAR_ENTITY.opreasonexp
  is '操作原因';
comment on column META_TAR_ENTITY.oppsrsonnel
  is '操作人姓名';
comment on column META_TAR_ENTITY.last_update_date
  is '最后修改日期';

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
  is '目标实体关联表';
comment on column META_TAR_RELATION.tar_relation_id
  is '关联ID';
comment on column META_TAR_RELATION.tar_relation_version_id
  is '目标实体关系版本id';
comment on column META_TAR_RELATION.mst_sub_domain_name
  is '主表主题域名称';
comment on column META_TAR_RELATION.mst_sub_domain_code
  is '主表主题域编码';
comment on column META_TAR_RELATION.mst_sub_domain_id
  is '主表主题域ID';
comment on column META_TAR_RELATION.mst_tab_en_nm
  is '主表英文名';
comment on column META_TAR_RELATION.mst_tab_cn_nm
  is '主表中文名';
comment on column META_TAR_RELATION.mst_attri_en_nm
  is '主表字段英文名';
comment on column META_TAR_RELATION.mst_attri_cn_nm
  is '主表字段中文名';
comment on column META_TAR_RELATION.sub_sub_domain_name
  is '从表主题域名称';
comment on column META_TAR_RELATION.sub_sub_domain_code
  is '从表主题域编码';
comment on column META_TAR_RELATION.sub_sub_domain_id
  is '从表主题域id';
comment on column META_TAR_RELATION.sub_tab_en_nm
  is '从表英文名';
comment on column META_TAR_RELATION.sub_tab_cn_nm
  is '从表中文名';
comment on column META_TAR_RELATION.sub_attri_en_nm
  is '从表字段英文名';
comment on column META_TAR_RELATION.sub_attri_cn_nm
  is '从表字段中文名';

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
  is '目标实体关系版本id';
comment on column META_TAR_RELATION_VERSION.collecttime
  is '采集日期';
comment on column META_TAR_RELATION_VERSION.mst_sub_domain_id
  is '主表主题域id';
comment on column META_TAR_RELATION_VERSION.mst_sub_domain_name
  is '主表主题域名称';
comment on column META_TAR_RELATION_VERSION.mst_sub_domain_code
  is '主表主题域编码';
comment on column META_TAR_RELATION_VERSION.mst_tab_en_nm
  is '主表英文名';
comment on column META_TAR_RELATION_VERSION.mst_tab_cn_nm
  is '主表中文名';
comment on column META_TAR_RELATION_VERSION.version
  is '版本号';
comment on column META_TAR_RELATION_VERSION.versionstatus
  is '版本状态';
comment on column META_TAR_RELATION_VERSION.opreasonexp
  is '操作描述';
comment on column META_TAR_RELATION_VERSION.oppsrsonnel
  is '操作人姓名';
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
  is '批次id';
comment on column PATCH_CONFIG.patch_code
  is '批次号';
comment on column PATCH_CONFIG.patch_name
  is '批次名称';
comment on column PATCH_CONFIG.tar_tab_enname
  is '主数据表英文名';
comment on column PATCH_CONFIG.tar_tab_cnname
  is '主数据表中文名';
comment on column PATCH_CONFIG.patch_status
  is '是否启用（1为启用，0为不启用）';
comment on column PATCH_CONFIG.patch_remarks
  is '批次说明';
comment on column PATCH_CONFIG.create_data
  is '创建时间';
comment on column PATCH_CONFIG.creator
  is '创建人id';
comment on column PATCH_CONFIG.creatorname
  is '创建人名称';

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
  is '存储过程日志表';
comment on column PROC_LOG.proc_id
  is '存储过程的ID标识';
comment on column PROC_LOG.mark_time
  is '数据日期';
comment on column PROC_LOG.proc_name
  is '存储过程名称';
comment on column PROC_LOG.tab_name
  is '目标表名';
comment on column PROC_LOG.step_name
  is '步骤名称';
comment on column PROC_LOG.begin_time
  is '步骤开始时间';
comment on column PROC_LOG.end_time
  is '步骤结束时间';
comment on column PROC_LOG.log_mess
  is '日志信息';
comment on column PROC_LOG.error_flag
  is '错误标志：1正常，0错误';
comment on column PROC_LOG.effect_rows
  is '有效行';

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
  is '快照配置表';
comment on column SNAP_CONFIG.snap_id
  is '快照id';
comment on column SNAP_CONFIG.snap_name
  is '快照名称';
comment on column SNAP_CONFIG.snap_tabname
  is '快照对应的主数据表名称';
comment on column SNAP_CONFIG.snap_type
  is '快照生成类型（C：周期型，M：手工）';
comment on column SNAP_CONFIG.snap_viewname
  is '快照生成视图名称';
comment on column SNAP_CONFIG.view_type
  is '快照生成的视图所依赖的类型（T：表，V：视图）';
comment on column SNAP_CONFIG.create_time
  is '创建时间';
comment on column SNAP_CONFIG.creator
  is '创建用户';
comment on column SNAP_CONFIG.modified_time
  is '修改时间';
comment on column SNAP_CONFIG.modifiedby
  is '修改用户';
comment on column SNAP_CONFIG.description
  is '描述';
comment on column SNAP_CONFIG.sql_text
  is '存放生成视图的sql语句';
comment on column SNAP_CONFIG.patch_code
  is '批次号';
comment on column SNAP_CONFIG.patch_name
  is '批次名称';
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
  is '快照视图表';
comment on column SNAP_VIEWS.view_id
  is '视图id';
comment on column SNAP_VIEWS.snap_id
  is '快照id';
comment on column SNAP_VIEWS.view_name
  is '视图名称';
comment on column SNAP_VIEWS.create_time
  is '创建时间';
comment on column SNAP_VIEWS.creator
  is '创建用户';

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
  is '主数据集审批配置';
comment on column SYS_MD_APPLY_CFG.cfg_id
  is '配置id';
comment on column SYS_MD_APPLY_CFG.tablename
  is '审批表名';
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
  is '配置表id';
comment on column SYS_MD_CREATE_CFG.tab_en_nm
  is '表英文名';
comment on column SYS_MD_CREATE_CFG.tab_cn_nm
  is '表中文名';
comment on column SYS_MD_CREATE_CFG.procedure
  is '存储过程';
comment on column SYS_MD_CREATE_CFG.description
  is '功能描述';

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
  is '配置id';
comment on column SYS_MD_QUERY_CFG.tab_en_nm
  is '表英文名';
comment on column SYS_MD_QUERY_CFG.tab_cn_nm
  is '表中文名';
comment on column SYS_MD_QUERY_CFG.attri_en_nm
  is '字段英文名';
comment on column SYS_MD_QUERY_CFG.attri_cn_nm
  is '字段中文名';
comment on column SYS_MD_QUERY_CFG.is_display
  is '是否显示（1：是；0：否）';
comment on column SYS_MD_QUERY_CFG.is_query
  is '是否查询（1：是；0：否）';
comment on column SYS_MD_QUERY_CFG.is_edit
  is '是否编辑（1：是；0：否）';
comment on column SYS_MD_QUERY_CFG.query_type
  is '查询类型（text：文本框；select： 下拉框；date：日期框';
comment on column SYS_MD_QUERY_CFG.attri_sort
  is '字段排序';
comment on column SYS_MD_QUERY_CFG.query_attri_sort
  is '查询字段排序';
comment on column SYS_MD_QUERY_CFG.creator
  is '创建者';
comment on column SYS_MD_QUERY_CFG.create_date
  is '创建时间';
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
  is '下拉id';
comment on column SYS_MD_SELECT_CFG.tab_en_nm
  is '表名';
comment on column SYS_MD_SELECT_CFG.attri_en_nm
  is '字段名';
comment on column SYS_MD_SELECT_CFG.value
  is '值';


spool off
