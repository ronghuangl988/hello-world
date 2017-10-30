--------------------------------------------
-- Export file for user C##_BIGDATA@ZZMDM --
-- Created by zhy on 2017/10/13, 11:21:44 --
--------------------------------------------

set define off
spool kettle.log

prompt
prompt Creating table KETTLE_DATA_ERROR_LOG
prompt ====================================
prompt
create table KETTLE_DATA_ERROR_LOG
(
  id_batch    VARCHAR2(50),
  transname   VARCHAR2(50),
  file_name   VARCHAR2(50),
  src_tabname VARCHAR2(50),
  sort_id     INTEGER,
  time_stamp  DATE,
  create_time DATE,
  errornum    VARCHAR2(50),
  errordesc   VARCHAR2(1000),
  errorname   VARCHAR2(50),
  errorcode   VARCHAR2(50)
)
;
comment on table KETTLE_DATA_ERROR_LOG
  is '源表ETL入库错误数据日志表';
comment on column KETTLE_DATA_ERROR_LOG.id_batch
  is '批次ID';
comment on column KETTLE_DATA_ERROR_LOG.transname
  is '转换名称';
comment on column KETTLE_DATA_ERROR_LOG.file_name
  is '文件名称';
comment on column KETTLE_DATA_ERROR_LOG.src_tabname
  is '源表名';
comment on column KETTLE_DATA_ERROR_LOG.sort_id
  is '源数据文件的排序字段';
comment on column KETTLE_DATA_ERROR_LOG.time_stamp
  is '数据日期';
comment on column KETTLE_DATA_ERROR_LOG.create_time
  is '数据入库创建时间';
comment on column KETTLE_DATA_ERROR_LOG.errornum
  is '错误记录数';
comment on column KETTLE_DATA_ERROR_LOG.errordesc
  is '错误描述';
comment on column KETTLE_DATA_ERROR_LOG.errorname
  is '错误列名';
comment on column KETTLE_DATA_ERROR_LOG.errorcode
  is '错误编码';

prompt
prompt Creating table KETTLE_JOB_ITEM_LOG
prompt ==================================
prompt
create table KETTLE_JOB_ITEM_LOG
(
  id_batch        INTEGER,
  channel_id      VARCHAR2(255),
  log_date        DATE,
  transname       VARCHAR2(255),
  stepname        VARCHAR2(255),
  lines_read      INTEGER,
  lines_written   INTEGER,
  lines_updated   INTEGER,
  lines_input     INTEGER,
  lines_output    INTEGER,
  lines_rejected  INTEGER,
  errors          INTEGER,
  result          CHAR(1),
  nr_result_rows  INTEGER,
  nr_result_files INTEGER,
  log_field       CLOB,
  copy_nr         INTEGER
)
;
comment on table KETTLE_JOB_ITEM_LOG
  is 'kettle作业项日志表';
comment on column KETTLE_JOB_ITEM_LOG.id_batch
  is '批次id';
comment on column KETTLE_JOB_ITEM_LOG.channel_id
  is '通道id';
comment on column KETTLE_JOB_ITEM_LOG.log_date
  is '日志日期';
comment on column KETTLE_JOB_ITEM_LOG.transname
  is '作业名';
comment on column KETTLE_JOB_ITEM_LOG.stepname
  is '作业项名称';
comment on column KETTLE_JOB_ITEM_LOG.lines_read
  is '读';
comment on column KETTLE_JOB_ITEM_LOG.lines_written
  is '写';
comment on column KETTLE_JOB_ITEM_LOG.lines_updated
  is '更新';
comment on column KETTLE_JOB_ITEM_LOG.lines_input
  is '输入';
comment on column KETTLE_JOB_ITEM_LOG.lines_output
  is '输出';
comment on column KETTLE_JOB_ITEM_LOG.lines_rejected
  is '舍弃';
comment on column KETTLE_JOB_ITEM_LOG.errors
  is '错误';
comment on column KETTLE_JOB_ITEM_LOG.result
  is '结果';
comment on column KETTLE_JOB_ITEM_LOG.nr_result_rows
  is '结果记录数';
comment on column KETTLE_JOB_ITEM_LOG.nr_result_files
  is '结果文件数';
comment on column KETTLE_JOB_ITEM_LOG.log_field
  is '详细步骤日志';
comment on column KETTLE_JOB_ITEM_LOG.copy_nr
  is '拷贝的步骤';
create index IDX_KETTLE_JOB_ITEM_LOG_1 on KETTLE_JOB_ITEM_LOG (ID_BATCH);

prompt
prompt Creating table KETTLE_JOB_MAIN_LOG
prompt ==================================
prompt
create table KETTLE_JOB_MAIN_LOG
(
  id_job           INTEGER,
  channel_id       VARCHAR2(255),
  jobname          VARCHAR2(255),
  status           VARCHAR2(15),
  lines_read       INTEGER,
  lines_written    INTEGER,
  lines_updated    INTEGER,
  lines_input      INTEGER,
  lines_output     INTEGER,
  lines_rejected   INTEGER,
  errors           INTEGER,
  startdate        DATE,
  enddate          DATE,
  logdate          DATE,
  depdate          DATE,
  replaydate       DATE,
  log_field        CLOB,
  executing_server VARCHAR2(255),
  executing_user   VARCHAR2(255),
  start_job_entry  VARCHAR2(255),
  client           VARCHAR2(255)
)
;
comment on table KETTLE_JOB_MAIN_LOG
  is 'kettle作业日志表';
comment on column KETTLE_JOB_MAIN_LOG.id_job
  is '作业id';
comment on column KETTLE_JOB_MAIN_LOG.channel_id
  is '批次id';
comment on column KETTLE_JOB_MAIN_LOG.jobname
  is '作业名称';
comment on column KETTLE_JOB_MAIN_LOG.status
  is '状态';
comment on column KETTLE_JOB_MAIN_LOG.lines_read
  is '读';
comment on column KETTLE_JOB_MAIN_LOG.lines_written
  is '写';
comment on column KETTLE_JOB_MAIN_LOG.lines_updated
  is '更新';
comment on column KETTLE_JOB_MAIN_LOG.lines_input
  is '输入';
comment on column KETTLE_JOB_MAIN_LOG.lines_output
  is '输出';
comment on column KETTLE_JOB_MAIN_LOG.lines_rejected
  is '舍弃';
comment on column KETTLE_JOB_MAIN_LOG.errors
  is '错误';
comment on column KETTLE_JOB_MAIN_LOG.startdate
  is '启动日期';
comment on column KETTLE_JOB_MAIN_LOG.enddate
  is '结束日期';
comment on column KETTLE_JOB_MAIN_LOG.logdate
  is '日志日期';
comment on column KETTLE_JOB_MAIN_LOG.depdate
  is '依赖日期';
comment on column KETTLE_JOB_MAIN_LOG.replaydate
  is '启动时间';
comment on column KETTLE_JOB_MAIN_LOG.log_field
  is '详细步骤信息';
comment on column KETTLE_JOB_MAIN_LOG.executing_server
  is '执行的服务器';
comment on column KETTLE_JOB_MAIN_LOG.executing_user
  is '执行的用户';
comment on column KETTLE_JOB_MAIN_LOG.start_job_entry
  is '作业开始项的名称';
comment on column KETTLE_JOB_MAIN_LOG.client
  is '客户端名称';
create index IDX_KETTLE_JOB_MAIN_LOG_1 on KETTLE_JOB_MAIN_LOG (ID_JOB);
create index IDX_KETTLE_JOB_MAIN_LOG_2 on KETTLE_JOB_MAIN_LOG (ERRORS, STATUS, JOBNAME);

prompt
prompt Creating table KETTLE_JOB_PASS_LOG
prompt ==================================
prompt
create table KETTLE_JOB_PASS_LOG
(
  id_batch             INTEGER,
  channel_id           VARCHAR2(255),
  log_date             DATE,
  logging_object_type  VARCHAR2(255),
  object_name          VARCHAR2(255),
  object_copy          VARCHAR2(255),
  repository_directory VARCHAR2(255),
  filename             VARCHAR2(255),
  object_id            VARCHAR2(255),
  object_revision      VARCHAR2(255),
  parent_channel_id    VARCHAR2(255),
  root_channel_id      VARCHAR2(255)
)
;
comment on table KETTLE_JOB_PASS_LOG
  is 'kettle日志通道日志表';
comment on column KETTLE_JOB_PASS_LOG.id_batch
  is '批次id';
comment on column KETTLE_JOB_PASS_LOG.channel_id
  is '通道id';
comment on column KETTLE_JOB_PASS_LOG.log_date
  is '日志日期';
comment on column KETTLE_JOB_PASS_LOG.logging_object_type
  is '类型';
comment on column KETTLE_JOB_PASS_LOG.object_name
  is '名称';
comment on column KETTLE_JOB_PASS_LOG.object_copy
  is '复制';
comment on column KETTLE_JOB_PASS_LOG.repository_directory
  is '目录';
comment on column KETTLE_JOB_PASS_LOG.filename
  is '文件名';
comment on column KETTLE_JOB_PASS_LOG.object_id
  is 'id';
comment on column KETTLE_JOB_PASS_LOG.object_revision
  is '版本';
comment on column KETTLE_JOB_PASS_LOG.parent_channel_id
  is '父通道id';
comment on column KETTLE_JOB_PASS_LOG.root_channel_id
  is '根通道id';

prompt
prompt Creating table KETTLE_TRAN_MAIN_LOG
prompt ===================================
prompt
create table KETTLE_TRAN_MAIN_LOG
(
  id_batch         INTEGER,
  channel_id       VARCHAR2(255),
  transname        VARCHAR2(255),
  status           VARCHAR2(15),
  lines_read       INTEGER,
  lines_written    INTEGER,
  lines_updated    INTEGER,
  lines_input      INTEGER,
  lines_output     INTEGER,
  lines_rejected   INTEGER,
  errors           INTEGER,
  startdate        DATE,
  enddate          DATE,
  logdate          DATE,
  depdate          DATE,
  replaydate       DATE,
  log_field        CLOB,
  executing_server VARCHAR2(255),
  executing_user   VARCHAR2(255),
  client           VARCHAR2(255)
)
;
comment on table KETTLE_TRAN_MAIN_LOG
  is 'kettle转换日志表';
comment on column KETTLE_TRAN_MAIN_LOG.id_batch
  is '批次id';
comment on column KETTLE_TRAN_MAIN_LOG.channel_id
  is '通道id';
comment on column KETTLE_TRAN_MAIN_LOG.transname
  is '转换名称';
comment on column KETTLE_TRAN_MAIN_LOG.status
  is '状态';
comment on column KETTLE_TRAN_MAIN_LOG.lines_read
  is '读';
comment on column KETTLE_TRAN_MAIN_LOG.lines_written
  is '写';
comment on column KETTLE_TRAN_MAIN_LOG.lines_updated
  is '更新';
comment on column KETTLE_TRAN_MAIN_LOG.lines_input
  is '输入';
comment on column KETTLE_TRAN_MAIN_LOG.lines_output
  is '输出';
comment on column KETTLE_TRAN_MAIN_LOG.lines_rejected
  is '舍弃';
comment on column KETTLE_TRAN_MAIN_LOG.errors
  is '错误';
comment on column KETTLE_TRAN_MAIN_LOG.startdate
  is '开始日期';
comment on column KETTLE_TRAN_MAIN_LOG.enddate
  is '结束日期';
comment on column KETTLE_TRAN_MAIN_LOG.logdate
  is '日志日期';
comment on column KETTLE_TRAN_MAIN_LOG.depdate
  is '依赖日期';
comment on column KETTLE_TRAN_MAIN_LOG.replaydate
  is '开始时间';
comment on column KETTLE_TRAN_MAIN_LOG.log_field
  is '日志详细';
comment on column KETTLE_TRAN_MAIN_LOG.executing_server
  is '执行的服务器';
comment on column KETTLE_TRAN_MAIN_LOG.executing_user
  is '执行的用户';
comment on column KETTLE_TRAN_MAIN_LOG.client
  is '客户端名称';
create index IDX_KETTLE_TRAN_MAIN_LOG_1 on KETTLE_TRAN_MAIN_LOG (ID_BATCH);
create index IDX_KETTLE_TRAN_MAIN_LOG_2 on KETTLE_TRAN_MAIN_LOG (ERRORS, STATUS, TRANSNAME);

prompt
prompt Creating table KETTLE_TRAN_METRICS_LOG
prompt ======================================
prompt
create table KETTLE_TRAN_METRICS_LOG
(
  id_batch            INTEGER,
  channel_id          VARCHAR2(255),
  log_date            DATE,
  metrics_date        DATE,
  metrics_code        VARCHAR2(255),
  metrics_description VARCHAR2(255),
  metrics_subject     VARCHAR2(255),
  metrics_type        VARCHAR2(255),
  metrics_value       INTEGER
)
;

prompt
prompt Creating table KETTLE_TRAN_PASS_LOG
prompt ===================================
prompt
create table KETTLE_TRAN_PASS_LOG
(
  id_batch             INTEGER,
  channel_id           VARCHAR2(255),
  log_date             DATE,
  logging_object_type  VARCHAR2(255),
  object_name          VARCHAR2(255),
  object_copy          VARCHAR2(255),
  repository_directory VARCHAR2(255),
  filename             VARCHAR2(255),
  object_id            VARCHAR2(255),
  object_revision      VARCHAR2(255),
  parent_channel_id    VARCHAR2(255),
  root_channel_id      VARCHAR2(255)
)
;

prompt
prompt Creating table KETTLE_TRAN_RUN_LOG
prompt ==================================
prompt
create table KETTLE_TRAN_RUN_LOG
(
  id_batch           INTEGER,
  seq_nr             INTEGER,
  logdate            DATE,
  transname          VARCHAR2(255),
  stepname           VARCHAR2(255),
  step_copy          INTEGER,
  lines_read         INTEGER,
  lines_written      INTEGER,
  lines_updated      INTEGER,
  lines_input        INTEGER,
  lines_output       INTEGER,
  lines_rejected     INTEGER,
  errors             INTEGER,
  input_buffer_rows  INTEGER,
  output_buffer_rows INTEGER
)
;

prompt
prompt Creating table KETTLE_TRAN_STEP_LOG
prompt ===================================
prompt
create table KETTLE_TRAN_STEP_LOG
(
  id_batch       INTEGER,
  channel_id     VARCHAR2(255),
  transname      VARCHAR2(255),
  stepname       VARCHAR2(255),
  step_copy      INTEGER,
  lines_read     INTEGER,
  lines_written  INTEGER,
  lines_updated  INTEGER,
  lines_input    INTEGER,
  lines_output   INTEGER,
  lines_rejected INTEGER,
  errors         INTEGER,
  log_field      CLOB,
  log_date       DATE
)
;
comment on table KETTLE_TRAN_STEP_LOG
  is 'kettle步骤日志表';
comment on column KETTLE_TRAN_STEP_LOG.id_batch
  is '批次id';
comment on column KETTLE_TRAN_STEP_LOG.channel_id
  is '通道id';
comment on column KETTLE_TRAN_STEP_LOG.transname
  is '转换名称';
comment on column KETTLE_TRAN_STEP_LOG.stepname
  is '步骤名称';
comment on column KETTLE_TRAN_STEP_LOG.step_copy
  is '复制';
comment on column KETTLE_TRAN_STEP_LOG.lines_read
  is '读';
comment on column KETTLE_TRAN_STEP_LOG.lines_written
  is '写';
comment on column KETTLE_TRAN_STEP_LOG.lines_updated
  is '更新';
comment on column KETTLE_TRAN_STEP_LOG.lines_input
  is '输入';
comment on column KETTLE_TRAN_STEP_LOG.lines_output
  is '输出';
comment on column KETTLE_TRAN_STEP_LOG.lines_rejected
  is '舍弃';
comment on column KETTLE_TRAN_STEP_LOG.errors
  is '错误';
comment on column KETTLE_TRAN_STEP_LOG.log_field
  is '日志详细';
comment on column KETTLE_TRAN_STEP_LOG.log_date
  is '日志时间';


spool off
