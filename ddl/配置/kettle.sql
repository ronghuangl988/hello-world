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
  is 'Դ��ETL������������־��';
comment on column KETTLE_DATA_ERROR_LOG.id_batch
  is '����ID';
comment on column KETTLE_DATA_ERROR_LOG.transname
  is 'ת������';
comment on column KETTLE_DATA_ERROR_LOG.file_name
  is '�ļ�����';
comment on column KETTLE_DATA_ERROR_LOG.src_tabname
  is 'Դ����';
comment on column KETTLE_DATA_ERROR_LOG.sort_id
  is 'Դ�����ļ��������ֶ�';
comment on column KETTLE_DATA_ERROR_LOG.time_stamp
  is '��������';
comment on column KETTLE_DATA_ERROR_LOG.create_time
  is '������ⴴ��ʱ��';
comment on column KETTLE_DATA_ERROR_LOG.errornum
  is '�����¼��';
comment on column KETTLE_DATA_ERROR_LOG.errordesc
  is '��������';
comment on column KETTLE_DATA_ERROR_LOG.errorname
  is '��������';
comment on column KETTLE_DATA_ERROR_LOG.errorcode
  is '�������';

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
  is 'kettle��ҵ����־��';
comment on column KETTLE_JOB_ITEM_LOG.id_batch
  is '����id';
comment on column KETTLE_JOB_ITEM_LOG.channel_id
  is 'ͨ��id';
comment on column KETTLE_JOB_ITEM_LOG.log_date
  is '��־����';
comment on column KETTLE_JOB_ITEM_LOG.transname
  is '��ҵ��';
comment on column KETTLE_JOB_ITEM_LOG.stepname
  is '��ҵ������';
comment on column KETTLE_JOB_ITEM_LOG.lines_read
  is '��';
comment on column KETTLE_JOB_ITEM_LOG.lines_written
  is 'д';
comment on column KETTLE_JOB_ITEM_LOG.lines_updated
  is '����';
comment on column KETTLE_JOB_ITEM_LOG.lines_input
  is '����';
comment on column KETTLE_JOB_ITEM_LOG.lines_output
  is '���';
comment on column KETTLE_JOB_ITEM_LOG.lines_rejected
  is '����';
comment on column KETTLE_JOB_ITEM_LOG.errors
  is '����';
comment on column KETTLE_JOB_ITEM_LOG.result
  is '���';
comment on column KETTLE_JOB_ITEM_LOG.nr_result_rows
  is '�����¼��';
comment on column KETTLE_JOB_ITEM_LOG.nr_result_files
  is '����ļ���';
comment on column KETTLE_JOB_ITEM_LOG.log_field
  is '��ϸ������־';
comment on column KETTLE_JOB_ITEM_LOG.copy_nr
  is '�����Ĳ���';
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
  is 'kettle��ҵ��־��';
comment on column KETTLE_JOB_MAIN_LOG.id_job
  is '��ҵid';
comment on column KETTLE_JOB_MAIN_LOG.channel_id
  is '����id';
comment on column KETTLE_JOB_MAIN_LOG.jobname
  is '��ҵ����';
comment on column KETTLE_JOB_MAIN_LOG.status
  is '״̬';
comment on column KETTLE_JOB_MAIN_LOG.lines_read
  is '��';
comment on column KETTLE_JOB_MAIN_LOG.lines_written
  is 'д';
comment on column KETTLE_JOB_MAIN_LOG.lines_updated
  is '����';
comment on column KETTLE_JOB_MAIN_LOG.lines_input
  is '����';
comment on column KETTLE_JOB_MAIN_LOG.lines_output
  is '���';
comment on column KETTLE_JOB_MAIN_LOG.lines_rejected
  is '����';
comment on column KETTLE_JOB_MAIN_LOG.errors
  is '����';
comment on column KETTLE_JOB_MAIN_LOG.startdate
  is '��������';
comment on column KETTLE_JOB_MAIN_LOG.enddate
  is '��������';
comment on column KETTLE_JOB_MAIN_LOG.logdate
  is '��־����';
comment on column KETTLE_JOB_MAIN_LOG.depdate
  is '��������';
comment on column KETTLE_JOB_MAIN_LOG.replaydate
  is '����ʱ��';
comment on column KETTLE_JOB_MAIN_LOG.log_field
  is '��ϸ������Ϣ';
comment on column KETTLE_JOB_MAIN_LOG.executing_server
  is 'ִ�еķ�����';
comment on column KETTLE_JOB_MAIN_LOG.executing_user
  is 'ִ�е��û�';
comment on column KETTLE_JOB_MAIN_LOG.start_job_entry
  is '��ҵ��ʼ�������';
comment on column KETTLE_JOB_MAIN_LOG.client
  is '�ͻ�������';
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
  is 'kettle��־ͨ����־��';
comment on column KETTLE_JOB_PASS_LOG.id_batch
  is '����id';
comment on column KETTLE_JOB_PASS_LOG.channel_id
  is 'ͨ��id';
comment on column KETTLE_JOB_PASS_LOG.log_date
  is '��־����';
comment on column KETTLE_JOB_PASS_LOG.logging_object_type
  is '����';
comment on column KETTLE_JOB_PASS_LOG.object_name
  is '����';
comment on column KETTLE_JOB_PASS_LOG.object_copy
  is '����';
comment on column KETTLE_JOB_PASS_LOG.repository_directory
  is 'Ŀ¼';
comment on column KETTLE_JOB_PASS_LOG.filename
  is '�ļ���';
comment on column KETTLE_JOB_PASS_LOG.object_id
  is 'id';
comment on column KETTLE_JOB_PASS_LOG.object_revision
  is '�汾';
comment on column KETTLE_JOB_PASS_LOG.parent_channel_id
  is '��ͨ��id';
comment on column KETTLE_JOB_PASS_LOG.root_channel_id
  is '��ͨ��id';

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
  is 'kettleת����־��';
comment on column KETTLE_TRAN_MAIN_LOG.id_batch
  is '����id';
comment on column KETTLE_TRAN_MAIN_LOG.channel_id
  is 'ͨ��id';
comment on column KETTLE_TRAN_MAIN_LOG.transname
  is 'ת������';
comment on column KETTLE_TRAN_MAIN_LOG.status
  is '״̬';
comment on column KETTLE_TRAN_MAIN_LOG.lines_read
  is '��';
comment on column KETTLE_TRAN_MAIN_LOG.lines_written
  is 'д';
comment on column KETTLE_TRAN_MAIN_LOG.lines_updated
  is '����';
comment on column KETTLE_TRAN_MAIN_LOG.lines_input
  is '����';
comment on column KETTLE_TRAN_MAIN_LOG.lines_output
  is '���';
comment on column KETTLE_TRAN_MAIN_LOG.lines_rejected
  is '����';
comment on column KETTLE_TRAN_MAIN_LOG.errors
  is '����';
comment on column KETTLE_TRAN_MAIN_LOG.startdate
  is '��ʼ����';
comment on column KETTLE_TRAN_MAIN_LOG.enddate
  is '��������';
comment on column KETTLE_TRAN_MAIN_LOG.logdate
  is '��־����';
comment on column KETTLE_TRAN_MAIN_LOG.depdate
  is '��������';
comment on column KETTLE_TRAN_MAIN_LOG.replaydate
  is '��ʼʱ��';
comment on column KETTLE_TRAN_MAIN_LOG.log_field
  is '��־��ϸ';
comment on column KETTLE_TRAN_MAIN_LOG.executing_server
  is 'ִ�еķ�����';
comment on column KETTLE_TRAN_MAIN_LOG.executing_user
  is 'ִ�е��û�';
comment on column KETTLE_TRAN_MAIN_LOG.client
  is '�ͻ�������';
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
  is 'kettle������־��';
comment on column KETTLE_TRAN_STEP_LOG.id_batch
  is '����id';
comment on column KETTLE_TRAN_STEP_LOG.channel_id
  is 'ͨ��id';
comment on column KETTLE_TRAN_STEP_LOG.transname
  is 'ת������';
comment on column KETTLE_TRAN_STEP_LOG.stepname
  is '��������';
comment on column KETTLE_TRAN_STEP_LOG.step_copy
  is '����';
comment on column KETTLE_TRAN_STEP_LOG.lines_read
  is '��';
comment on column KETTLE_TRAN_STEP_LOG.lines_written
  is 'д';
comment on column KETTLE_TRAN_STEP_LOG.lines_updated
  is '����';
comment on column KETTLE_TRAN_STEP_LOG.lines_input
  is '����';
comment on column KETTLE_TRAN_STEP_LOG.lines_output
  is '���';
comment on column KETTLE_TRAN_STEP_LOG.lines_rejected
  is '����';
comment on column KETTLE_TRAN_STEP_LOG.errors
  is '����';
comment on column KETTLE_TRAN_STEP_LOG.log_field
  is '��־��ϸ';
comment on column KETTLE_TRAN_STEP_LOG.log_date
  is '��־ʱ��';


spool off
