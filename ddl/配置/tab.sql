--------------------------------------------
-- Export file for user C##_BIGDATA@ZZMDM --
-- Created by zhy on 2017/10/13, 11:02:48 --
--------------------------------------------

set define off
spool tab.log

prompt
prompt Creating table TAB_DATASPACE
prompt ============================
prompt
create table TAB_DATASPACE
(
  dbname      VARCHAR2(20),
  dbsize      NUMBER,
  collecttime DATE,
  monthstep   NUMBER,
  yearhstep   NUMBER
)
;
comment on table TAB_DATASPACE
  is '���ݿ��ռ�ʹ�������';
comment on column TAB_DATASPACE.dbname
  is '������';
comment on column TAB_DATASPACE.dbsize
  is '���С';
comment on column TAB_DATASPACE.collecttime
  is '�ռ�����';
comment on column TAB_DATASPACE.monthstep
  is '��������';
comment on column TAB_DATASPACE.yearhstep
  is '��������';

prompt
prompt Creating table TAB_DATASTRUCTURE_CHANGE
prompt =======================================
prompt
create table TAB_DATASTRUCTURE_CHANGE
(
  subjectdomain   VARCHAR2(100) not null,
  addtabnumber    NUMBER,
  reducetabnumber NUMBER,
  changetabnumber NUMBER,
  collecttime     DATE
)
;
comment on table TAB_DATASTRUCTURE_CHANGE
  is '������ṹ�仯ͳ�Ʊ�';
comment on column TAB_DATASTRUCTURE_CHANGE.subjectdomain
  is '����������';
comment on column TAB_DATASTRUCTURE_CHANGE.addtabnumber
  is '����������';
comment on column TAB_DATASTRUCTURE_CHANGE.reducetabnumber
  is '���ٱ�����';
comment on column TAB_DATASTRUCTURE_CHANGE.changetabnumber
  is '�仯������';
comment on column TAB_DATASTRUCTURE_CHANGE.collecttime
  is '�ռ�ʱ��';

prompt
prompt Creating table TAB_ETL_EXCEPTION_MSG
prompt ====================================
prompt
create table TAB_ETL_EXCEPTION_MSG
(
  job_id            VARCHAR2(1000) not null,
  job_name          VARCHAR2(200) not null,
  job_full_path     VARCHAR2(2000),
  exception_msg     VARCHAR2(2000),
  effect_scale      VARCHAR2(1000),
  mapping_table_ddl VARCHAR2(200),
  occurred_time     DATE
)
;
comment on table TAB_ETL_EXCEPTION_MSG
  is 'ETL�쳣��Ϣ��';
comment on column TAB_ETL_EXCEPTION_MSG.job_id
  is '�쳣���ID';
comment on column TAB_ETL_EXCEPTION_MSG.job_name
  is '�쳣�������';
comment on column TAB_ETL_EXCEPTION_MSG.job_full_path
  is '�쳣���ȫ·��';
comment on column TAB_ETL_EXCEPTION_MSG.exception_msg
  is '�쳣��Ϣ';
comment on column TAB_ETL_EXCEPTION_MSG.effect_scale
  is '�쳣Ӱ�췶Χ';
comment on column TAB_ETL_EXCEPTION_MSG.mapping_table_ddl
  is '�쳣��ṹ';
comment on column TAB_ETL_EXCEPTION_MSG.occurred_time
  is '�쳣����ʱ��';

prompt
prompt Creating table TAB_ETL_LOG
prompt ==========================
prompt
create table TAB_ETL_LOG
(
  job_id             VARCHAR2(500) not null,
  job_name           VARCHAR2(500) not null,
  job_exec_full_path VARCHAR2(2000),
  job_start_dt       DATE,
  job_end_dt         DATE,
  job_status         VARCHAR2(10),
  job_status_detl    VARCHAR2(2000),
  job_category       VARCHAR2(500),
  job_mapping_tname  VARCHAR2(500),
  job_frequentness   VARCHAR2(10),
  job_effect_row     NUMBER,
  job_desc           VARCHAR2(2000),
  etl_dt             DATE,
  scanning_state     VARCHAR2(20) not null
)
;
comment on table TAB_ETL_LOG
  is 'ETL��־������ṹ�����洢���ݣ�';
comment on column TAB_ETL_LOG.job_id
  is 'ETL��ҵID';
comment on column TAB_ETL_LOG.job_name
  is 'ETL��ҵ����';
comment on column TAB_ETL_LOG.job_exec_full_path
  is 'ETL��ҵִ��·��';
comment on column TAB_ETL_LOG.job_start_dt
  is '��ҵ��ʼʱ��';
comment on column TAB_ETL_LOG.job_end_dt
  is '��ҵ����ʱ��';
comment on column TAB_ETL_LOG.job_status
  is '��ҵ״̬';
comment on column TAB_ETL_LOG.job_status_detl
  is '��ҵ״̬��ϸ��Ϣ';
comment on column TAB_ETL_LOG.job_category
  is '��ҵ����';
comment on column TAB_ETL_LOG.job_mapping_tname
  is '��ҵ��Ӧ����';
comment on column TAB_ETL_LOG.job_frequentness
  is '��ҵƵ��';
comment on column TAB_ETL_LOG.job_effect_row
  is '��ҵӰ�������';
comment on column TAB_ETL_LOG.job_desc
  is 'ETL��ҵ����';
comment on column TAB_ETL_LOG.etl_dt
  is 'ETL��־��¼����';
comment on column TAB_ETL_LOG.scanning_state
  is 'ɨ��״̬';

prompt
prompt Creating table TAB_JOB_CATEGORY_CFG
prompt ===================================
prompt
create table TAB_JOB_CATEGORY_CFG
(
  job_category_code      VARCHAR2(200),
  job_category_desc      VARCHAR2(2000),
  job_category_unifycode VARCHAR2(200),
  job_category_unifyname VARCHAR2(200),
  job_category_comments  VARCHAR2(1000)
)
;
comment on table TAB_JOB_CATEGORY_CFG
  is '��ҵ�������ñ�';
comment on column TAB_JOB_CATEGORY_CFG.job_category_code
  is '��ҵ���ͱ���';
comment on column TAB_JOB_CATEGORY_CFG.job_category_desc
  is '��ҵ��������';
comment on column TAB_JOB_CATEGORY_CFG.job_category_unifycode
  is '��ҵ����ͳһ����';
comment on column TAB_JOB_CATEGORY_CFG.job_category_unifyname
  is '��ҵ����ͳһ����';
comment on column TAB_JOB_CATEGORY_CFG.job_category_comments
  is '��ҵ���ͱ����������';

prompt
prompt Creating table TAB_JOB_CONFIG
prompt =============================
prompt
create table TAB_JOB_CONFIG
(
  node_code           VARCHAR2(500) not null,
  node_name           VARCHAR2(500) not null,
  parent_node_code    VARCHAR2(500),
  parent_node_name    VARCHAR2(500),
  dependent_node_code VARCHAR2(1000),
  node_category_code  VARCHAR2(500),
  en_table_name       VARCHAR2(500),
  data_level_code     VARCHAR2(500),
  job_frequentness    VARCHAR2(500),
  monitor_flag        NUMBER,
  split_program_flag  CHAR(1 CHAR),
  job_desc            VARCHAR2(2000 CHAR),
  alias               VARCHAR2(500)
)
;
comment on table TAB_JOB_CONFIG
  is '��ҵ���ñ�';
comment on column TAB_JOB_CONFIG.node_code
  is '�ڵ���룬jobid���ͽڵ����������������';
comment on column TAB_JOB_CONFIG.node_name
  is 'JOB����';
comment on column TAB_JOB_CONFIG.parent_node_code
  is '���ڵ����';
comment on column TAB_JOB_CONFIG.parent_node_name
  is '���ڵ�����';
comment on column TAB_JOB_CONFIG.dependent_node_code
  is '�����ڵ����';
comment on column TAB_JOB_CONFIG.node_category_code
  is '�ڵ����ͱ��룺
0.����(���job)
1.DS��������job��
2.DS�����ҵ��tran��
3.�洢����
4.��������ҵ';
comment on column TAB_JOB_CONFIG.en_table_name
  is '��Ӧ��Ӣ����';
comment on column TAB_JOB_CONFIG.data_level_code
  is '���ݲ���룺
1.�ӿڲ�
2.Ŀ���';
comment on column TAB_JOB_CONFIG.job_frequentness
  is '��ҵƵ��';
comment on column TAB_JOB_CONFIG.monitor_flag
  is '�Ƿ���Ҫ��ػ������ʶ��
-1��jobδ����  
0�������� 
1������';
comment on column TAB_JOB_CONFIG.split_program_flag
  is '�Ƿ��ֳ���������ݣ�
0������ֳ����������
1����ֳ����������';
comment on column TAB_JOB_CONFIG.job_desc
  is 'ETL��ҵ����';
comment on column TAB_JOB_CONFIG.alias
  is '����(kettle��Ϊԭ�����洢���̼��������㼶��ϵͳ������ı���)';
alter table TAB_JOB_CONFIG
  add primary key (NODE_CODE, NODE_NAME);

prompt
prompt Creating table TAB_JOB_CONFIG_BAK
prompt =================================
prompt
create table TAB_JOB_CONFIG_BAK
(
  node_code           VARCHAR2(500) not null,
  node_name           VARCHAR2(500) not null,
  parent_node_code    VARCHAR2(500),
  parent_node_name    VARCHAR2(500),
  dependent_node_code VARCHAR2(1000),
  node_category_code  VARCHAR2(500),
  en_table_name       VARCHAR2(500),
  data_level_code     VARCHAR2(500),
  job_frequentness    VARCHAR2(500),
  monitor_flag        NUMBER,
  split_program_flag  CHAR(1 CHAR),
  job_desc            VARCHAR2(2000 CHAR)
)
;
comment on table TAB_JOB_CONFIG_BAK
  is '��ҵ���ñ�';
comment on column TAB_JOB_CONFIG_BAK.node_code
  is '�ڵ���룬jobid���ͽڵ����������������';
comment on column TAB_JOB_CONFIG_BAK.node_name
  is 'JOB����';
comment on column TAB_JOB_CONFIG_BAK.parent_node_code
  is '���ڵ����';
comment on column TAB_JOB_CONFIG_BAK.parent_node_name
  is '���ڵ�����';
comment on column TAB_JOB_CONFIG_BAK.dependent_node_code
  is '�����ڵ����';
comment on column TAB_JOB_CONFIG_BAK.node_category_code
  is '�ڵ����ͱ��룺
0.����(���job)
1.DS��������job��
2.DS�����ҵ��tran��
3.�洢����
4.��������ҵ';
comment on column TAB_JOB_CONFIG_BAK.en_table_name
  is '��Ӧ��Ӣ����';
comment on column TAB_JOB_CONFIG_BAK.data_level_code
  is '���ݲ���룺
1.�ӿڲ�
2.Ŀ���';
comment on column TAB_JOB_CONFIG_BAK.job_frequentness
  is '��ҵƵ��';
comment on column TAB_JOB_CONFIG_BAK.monitor_flag
  is '�Ƿ���Ҫ��ػ������ʶ��
-1��jobδ����  
0�������� 
1������';
comment on column TAB_JOB_CONFIG_BAK.split_program_flag
  is '�Ƿ��ֳ���������ݣ�
0������ֳ����������
1����ֳ����������';
comment on column TAB_JOB_CONFIG_BAK.job_desc
  is 'ETL��ҵ����';

prompt
prompt Creating table TAB_JOB_STATUS_CFG
prompt =================================
prompt
create table TAB_JOB_STATUS_CFG
(
  job_status_code      VARCHAR2(200),
  job_status_desc      VARCHAR2(2000),
  job_status_unifycode VARCHAR2(200),
  job_status_unifyname VARCHAR2(200),
  job_status_comments  VARCHAR2(1000)
)
;
comment on table TAB_JOB_STATUS_CFG
  is '��ҵ״̬���ñ�';
comment on column TAB_JOB_STATUS_CFG.job_status_code
  is '��ҵ״̬����';
comment on column TAB_JOB_STATUS_CFG.job_status_desc
  is '��ҵ״̬����';
comment on column TAB_JOB_STATUS_CFG.job_status_unifycode
  is '��ҵ״����һ����';
comment on column TAB_JOB_STATUS_CFG.job_status_unifyname
  is '��ҵ״ͳһ����';
comment on column TAB_JOB_STATUS_CFG.job_status_comments
  is '��ҵ״̬�����������';


spool off
