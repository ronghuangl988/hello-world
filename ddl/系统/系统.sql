--------------------------------------------
-- Export file for user C##_BIGDATA@ZZMDM --
-- Created by zhy on 2017/10/13, 10:57:01 --
--------------------------------------------

set define off
spool 系统.log

prompt
prompt Creating table SYS_LOG
prompt ======================
prompt
create table SYS_LOG
(
  sys_logid      INTEGER not null,
  url            VARCHAR2(100),
  operation_time DATE not null,
  ip             VARCHAR2(50),
  path           VARCHAR2(255) not null,
  menuitem       VARCHAR2(50) not null,
  user_name      VARCHAR2(50),
  user_id        NUMBER(10)
)
;
comment on column SYS_LOG.sys_logid
  is '日志主键';
comment on column SYS_LOG.url
  is '系统操作路径：如：command/opcommand';
comment on column SYS_LOG.operation_time
  is '操作时间';
comment on column SYS_LOG.ip
  is '操作者的ip地址';
comment on column SYS_LOG.path
  is '操作路径：如  系统管理 --< 日志管理 --< 查看日志';
comment on column SYS_LOG.menuitem
  is '菜单名称  具体操作哪个菜单';
comment on column SYS_LOG.user_name
  is '用户名称 ';
comment on column SYS_LOG.user_id
  is '用户id';
alter table SYS_LOG
  add primary key (SYS_LOGID);

prompt
prompt Creating table SYS_MENU
prompt =======================
prompt
create table SYS_MENU
(
  menuid      NUMBER(10) not null,
  createby    VARCHAR2(50 CHAR),
  createtime  TIMESTAMP(6),
  description VARCHAR2(300 CHAR),
  menuicon    VARCHAR2(100 CHAR),
  menuname    VARCHAR2(50 CHAR),
  menustatus  NUMBER(10),
  menutarget  VARCHAR2(50 CHAR),
  menutype    VARCHAR2(10 CHAR),
  menuurl     VARCHAR2(100 CHAR),
  sortnum     NUMBER(10),
  updateby    VARCHAR2(50 CHAR),
  updatetime  TIMESTAMP(6),
  reskey      VARCHAR2(255),
  checked     NUMBER(6)
)
;
alter table SYS_MENU
  add primary key (MENUID);

prompt
prompt Creating table SYS_MENUITEM
prompt ===========================
prompt
create table SYS_MENUITEM
(
  itemid       NUMBER(10) not null,
  createby     VARCHAR2(50 CHAR),
  createtime   TIMESTAMP(6),
  description  VARCHAR2(300 CHAR),
  itemicon     VARCHAR2(100 CHAR),
  itemname     VARCHAR2(50 CHAR),
  itemstatus   NUMBER(10),
  itemtarget   VARCHAR2(50 CHAR),
  itemtype     VARCHAR2(10 CHAR),
  itemurl      VARCHAR2(2000),
  menuid       NUMBER(10),
  pageid       NUMBER(10),
  parentitemid NUMBER(10),
  sortnum      NUMBER(10),
  updateby     VARCHAR2(50 CHAR),
  updatetime   TIMESTAMP(6),
  reskey       VARCHAR2(255),
  checked      NUMBER(6)
)
;
alter table SYS_MENUITEM
  add primary key (ITEMID);

prompt
prompt Creating table SYS_MENUITEM_BAK
prompt ===============================
prompt
create table SYS_MENUITEM_BAK
(
  itemid       NUMBER(10) not null,
  createby     VARCHAR2(50 CHAR),
  createtime   TIMESTAMP(6),
  description  VARCHAR2(300 CHAR),
  itemicon     VARCHAR2(100 CHAR),
  itemname     VARCHAR2(50 CHAR),
  itemstatus   NUMBER(10),
  itemtarget   VARCHAR2(50 CHAR),
  itemtype     VARCHAR2(10 CHAR),
  itemurl      VARCHAR2(100 CHAR),
  menuid       NUMBER(10),
  pageid       NUMBER(10),
  parentitemid NUMBER(10),
  sortnum      NUMBER(10),
  updateby     VARCHAR2(50 CHAR),
  updatetime   TIMESTAMP(6),
  reskey       VARCHAR2(255),
  checked      NUMBER(6)
)
;

prompt
prompt Creating table SYS_MENUITEM_BAK1
prompt ================================
prompt
create table SYS_MENUITEM_BAK1
(
  itemid       NUMBER(10) not null,
  createby     VARCHAR2(50 CHAR),
  createtime   TIMESTAMP(6),
  description  VARCHAR2(300 CHAR),
  itemicon     VARCHAR2(100 CHAR),
  itemname     VARCHAR2(50 CHAR),
  itemstatus   NUMBER(10),
  itemtarget   VARCHAR2(50 CHAR),
  itemtype     VARCHAR2(10 CHAR),
  itemurl      VARCHAR2(100 CHAR),
  menuid       NUMBER(10),
  pageid       NUMBER(10),
  parentitemid NUMBER(10),
  sortnum      NUMBER(10),
  updateby     VARCHAR2(50 CHAR),
  updatetime   TIMESTAMP(6),
  reskey       VARCHAR2(255),
  checked      NUMBER(6)
)
;

prompt
prompt Creating table SYS_MODEL
prompt ========================
prompt
create table SYS_MODEL
(
  sys_model_code      VARCHAR2(4) not null,
  sys_model_name      VARCHAR2(30),
  src_sys_id          VARCHAR2(4),
  sys_model_parent_id VARCHAR2(4),
  create_user         NUMBER,
  create_time         TIMESTAMP(6),
  update_user         NUMBER,
  update_time         TIMESTAMP(6),
  sort_id             NUMBER
)
;
comment on table SYS_MODEL
  is '系统模块表';
comment on column SYS_MODEL.sys_model_code
  is '系统模块code';
comment on column SYS_MODEL.sys_model_name
  is '系统模块名称';
comment on column SYS_MODEL.src_sys_id
  is '所属系统id';
comment on column SYS_MODEL.sys_model_parent_id
  is '上级模块id';
comment on column SYS_MODEL.create_user
  is '创建用户';
comment on column SYS_MODEL.create_time
  is '创建时间';
comment on column SYS_MODEL.update_user
  is '更新用户';
comment on column SYS_MODEL.update_time
  is '更新时间';
comment on column SYS_MODEL.sort_id
  is '排序';
alter table SYS_MODEL
  add constraint MODEL_CODE primary key (SYS_MODEL_CODE);

prompt
prompt Creating table SYS_RESOURCE
prompt ===========================
prompt
create table SYS_RESOURCE
(
  resourceid  NUMBER(20) not null,
  resname     VARCHAR2(10),
  parentid    NUMBER(20),
  reskey      VARCHAR2(100),
  resurl      VARCHAR2(255),
  icon        VARCHAR2(255),
  description VARCHAR2(100),
  checked     INTEGER
)
;
alter table SYS_RESOURCE
  add primary key (RESOURCEID);

prompt
prompt Creating table SYS_ROLE
prompt =======================
prompt
create table SYS_ROLE
(
  roleid      VARCHAR2(100) not null,
  name        VARCHAR2(100),
  description VARCHAR2(255),
  createtime  DATE,
  updatetime  DATE,
  num         NUMBER
)
;

prompt
prompt Creating table SYS_ROLE_MENU
prompt ============================
prompt
create table SYS_ROLE_MENU
(
  roleid     VARCHAR2(100),
  menuitemid NUMBER
)
;

prompt
prompt Creating table SYS_ROLE_MENUITEM
prompt ================================
prompt
create table SYS_ROLE_MENUITEM
(
  rolemenuitemid NUMBER(30),
  roleid         NUMBER(30),
  menuitemid     NUMBER(30)
)
;

prompt
prompt Creating table SYS_TEMP_FBT
prompt ===========================
prompt
create global temporary table SYS_TEMP_FBT
(
  schema      VARCHAR2(32),
  object_name VARCHAR2(32),
  object#     NUMBER,
  rid         UROWID(4000),
  action      CHAR(1)
)
on commit preserve rows;

prompt
prompt Creating table SYS_USER
prompt =======================
prompt
create table SYS_USER
(
  userid          NUMBER(10) not null,
  username        VARCHAR2(255 CHAR),
  userpass        VARCHAR2(255 CHAR),
  credentialssalt VARCHAR2(255),
  createtime      TIMESTAMP(0),
  locked          INTEGER,
  description     VARCHAR2(255),
  roleid          NVARCHAR2(200),
  useraccount     VARCHAR2(200),
  updatetime      DATE
)
;
alter table SYS_USER
  add primary key (USERID);

prompt
prompt Creating table SYS_USER_MENU
prompt ============================
prompt
create table SYS_USER_MENU
(
  userid NUMBER,
  menuid NUMBER
)
;

prompt
prompt Creating table SYS_USER_MENUITEM
prompt ================================
prompt
create table SYS_USER_MENUITEM
(
  usermenuitemid NUMBER(30),
  userid         NUMBER(30),
  menuitemid     NUMBER(30)
)
;


spool off
