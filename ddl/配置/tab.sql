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
  is '数据库表空间使用情况表';
comment on column TAB_DATASPACE.dbname
  is '表名称';
comment on column TAB_DATASPACE.dbsize
  is '表大小';
comment on column TAB_DATASPACE.collecttime
  is '收集日期';
comment on column TAB_DATASPACE.monthstep
  is '月增长量';
comment on column TAB_DATASPACE.yearhstep
  is '年增长量';

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
  is '主题域结构变化统计表';
comment on column TAB_DATASTRUCTURE_CHANGE.subjectdomain
  is '主题域名称';
comment on column TAB_DATASTRUCTURE_CHANGE.addtabnumber
  is '新增表数量';
comment on column TAB_DATASTRUCTURE_CHANGE.reducetabnumber
  is '减少表数量';
comment on column TAB_DATASTRUCTURE_CHANGE.changetabnumber
  is '变化表数量';
comment on column TAB_DATASTRUCTURE_CHANGE.collecttime
  is '收集时间';

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
  is 'ETL异常信息表';
comment on column TAB_ETL_EXCEPTION_MSG.job_id
  is '异常结点ID';
comment on column TAB_ETL_EXCEPTION_MSG.job_name
  is '异常结点名称';
comment on column TAB_ETL_EXCEPTION_MSG.job_full_path
  is '异常结点全路径';
comment on column TAB_ETL_EXCEPTION_MSG.exception_msg
  is '异常信息';
comment on column TAB_ETL_EXCEPTION_MSG.effect_scale
  is '异常影响范围';
comment on column TAB_ETL_EXCEPTION_MSG.mapping_table_ddl
  is '异常表结构';
comment on column TAB_ETL_EXCEPTION_MSG.occurred_time
  is '异常发生时间';

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
  is 'ETL日志表（定义结构，不存储数据）';
comment on column TAB_ETL_LOG.job_id
  is 'ETL作业ID';
comment on column TAB_ETL_LOG.job_name
  is 'ETL作业名称';
comment on column TAB_ETL_LOG.job_exec_full_path
  is 'ETL作业执行路径';
comment on column TAB_ETL_LOG.job_start_dt
  is '作业开始时间';
comment on column TAB_ETL_LOG.job_end_dt
  is '作业结束时间';
comment on column TAB_ETL_LOG.job_status
  is '作业状态';
comment on column TAB_ETL_LOG.job_status_detl
  is '作业状态详细信息';
comment on column TAB_ETL_LOG.job_category
  is '作业类型';
comment on column TAB_ETL_LOG.job_mapping_tname
  is '作业对应表名';
comment on column TAB_ETL_LOG.job_frequentness
  is '作业频度';
comment on column TAB_ETL_LOG.job_effect_row
  is '作业影响的行数';
comment on column TAB_ETL_LOG.job_desc
  is 'ETL作业描述';
comment on column TAB_ETL_LOG.etl_dt
  is 'ETL日志记录日期';
comment on column TAB_ETL_LOG.scanning_state
  is '扫描状态';

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
  is '作业类型配置表';
comment on column TAB_JOB_CATEGORY_CFG.job_category_code
  is '作业类型编码';
comment on column TAB_JOB_CATEGORY_CFG.job_category_desc
  is '作业类型描述';
comment on column TAB_JOB_CATEGORY_CFG.job_category_unifycode
  is '作业类型统一编码';
comment on column TAB_JOB_CATEGORY_CFG.job_category_unifyname
  is '作业类型统一名称';
comment on column TAB_JOB_CATEGORY_CFG.job_category_comments
  is '作业类型编码具体描述';

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
  is '作业配置表';
comment on column TAB_JOB_CONFIG.node_code
  is '节点编码，jobid，和节点名称组成联合主键';
comment on column TAB_JOB_CONFIG.node_name
  is 'JOB名称';
comment on column TAB_JOB_CONFIG.parent_node_code
  is '父节点编码';
comment on column TAB_JOB_CONFIG.parent_node_name
  is '父节点名称';
comment on column TAB_JOB_CONFIG.dependent_node_code
  is '依赖节点编码';
comment on column TAB_JOB_CONFIG.node_category_code
  is '节点类型编码：
0.任务(多个job)
1.DS工作流（job）
2.DS结点作业（tran）
3.存储过程
4.命令行作业';
comment on column TAB_JOB_CONFIG.en_table_name
  is '对应表英文名';
comment on column TAB_JOB_CONFIG.data_level_code
  is '数据层编码：
1.接口层
2.目标层';
comment on column TAB_JOB_CONFIG.job_frequentness
  is '作业频度';
comment on column TAB_JOB_CONFIG.monitor_flag
  is '是否需要监控或遍历标识：
-1、job未编译  
0、不遍历 
1、遍历';
comment on column TAB_JOB_CONFIG.split_program_flag
  is '是否拆分程序加载数据：
0、不拆分程序加载数据
1、拆分程序加载数据';
comment on column TAB_JOB_CONFIG.job_desc
  is 'ETL作业描述';
comment on column TAB_JOB_CONFIG.alias
  is '别名(kettle中为原名，存储过程加上所属层级和系统或主题的编码)';
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
  is '作业配置表';
comment on column TAB_JOB_CONFIG_BAK.node_code
  is '节点编码，jobid，和节点名称组成联合主键';
comment on column TAB_JOB_CONFIG_BAK.node_name
  is 'JOB名称';
comment on column TAB_JOB_CONFIG_BAK.parent_node_code
  is '父节点编码';
comment on column TAB_JOB_CONFIG_BAK.parent_node_name
  is '父节点名称';
comment on column TAB_JOB_CONFIG_BAK.dependent_node_code
  is '依赖节点编码';
comment on column TAB_JOB_CONFIG_BAK.node_category_code
  is '节点类型编码：
0.任务(多个job)
1.DS工作流（job）
2.DS结点作业（tran）
3.存储过程
4.命令行作业';
comment on column TAB_JOB_CONFIG_BAK.en_table_name
  is '对应表英文名';
comment on column TAB_JOB_CONFIG_BAK.data_level_code
  is '数据层编码：
1.接口层
2.目标层';
comment on column TAB_JOB_CONFIG_BAK.job_frequentness
  is '作业频度';
comment on column TAB_JOB_CONFIG_BAK.monitor_flag
  is '是否需要监控或遍历标识：
-1、job未编译  
0、不遍历 
1、遍历';
comment on column TAB_JOB_CONFIG_BAK.split_program_flag
  is '是否拆分程序加载数据：
0、不拆分程序加载数据
1、拆分程序加载数据';
comment on column TAB_JOB_CONFIG_BAK.job_desc
  is 'ETL作业描述';

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
  is '作业状态配置表';
comment on column TAB_JOB_STATUS_CFG.job_status_code
  is '作业状态编码';
comment on column TAB_JOB_STATUS_CFG.job_status_desc
  is '作业状态描述';
comment on column TAB_JOB_STATUS_CFG.job_status_unifycode
  is '作业状类型一编码';
comment on column TAB_JOB_STATUS_CFG.job_status_unifyname
  is '作业状统一名称';
comment on column TAB_JOB_STATUS_CFG.job_status_comments
  is '作业状态编码具体描述';


spool off
