--------------------------------------------
-- Export file for user C##_BIGDATA@ZZMDM --
-- Created by zhy on 2017/10/13, 11:23:48 --
--------------------------------------------

set define off
spool 编码.log

prompt
prompt Creating table CODE_CODING
prompt ==========================
prompt
create table CODE_CODING
(
  coding_code   VARCHAR2(120) not null,
  coding_name   VARCHAR2(120),
  coding_type   VARCHAR2(120),
  coding_level  NUMBER(8),
  apply_code    VARCHAR2(120),
  version       NUMBER(8),
  creator       VARCHAR2(120),
  create_date   DATE,
  parent_coding VARCHAR2(120)
)
;
comment on column CODE_CODING.coding_code
  is '编码代码';
comment on column CODE_CODING.coding_name
  is '编码名称';
comment on column CODE_CODING.coding_type
  is '编码分类';
comment on column CODE_CODING.coding_level
  is '编码层级';
comment on column CODE_CODING.apply_code
  is '申请单号';
comment on column CODE_CODING.version
  is '版本';
comment on column CODE_CODING.creator
  is '创建人';
comment on column CODE_CODING.create_date
  is '创建时间';
comment on column CODE_CODING.parent_coding
  is '上级编码';

prompt
prompt Creating table CODE_CUSTOM
prompt ==========================
prompt
create table CODE_CUSTOM
(
  code_name      VARCHAR2(128),
  code_value     VARCHAR2(100),
  type_code      VARCHAR2(100),
  remarks        VARCHAR2(255),
  sort_id        NUMBER,
  description    VARCHAR2(255),
  creator_id     VARCHAR2(120),
  creator        VARCHAR2(120),
  create_date    DATE,
  modifiedby     VARCHAR2(120),
  modifiedby_id  VARCHAR2(120),
  modified_date  DATE,
  version_status NUMBER,
  version        NUMBER,
  parent_code    VARCHAR2(120)
)
;
comment on column CODE_CUSTOM.code_name
  is '自定义代码名称';
comment on column CODE_CUSTOM.code_value
  is '自定义代码值';
comment on column CODE_CUSTOM.type_code
  is '自定义代码类型编码';
comment on column CODE_CUSTOM.remarks
  is '备注';
comment on column CODE_CUSTOM.sort_id
  is '排序';
comment on column CODE_CUSTOM.description
  is '操作描述';
comment on column CODE_CUSTOM.creator_id
  is '创建者id';
comment on column CODE_CUSTOM.creator
  is '创建者';
comment on column CODE_CUSTOM.create_date
  is '创建日期';
comment on column CODE_CUSTOM.modifiedby
  is '修改人';
comment on column CODE_CUSTOM.modifiedby_id
  is '修改人id';
comment on column CODE_CUSTOM.modified_date
  is '修改日期';
comment on column CODE_CUSTOM.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CODE_CUSTOM.version
  is '版本号';
comment on column CODE_CUSTOM.parent_code
  is '父级编码';


spool off
