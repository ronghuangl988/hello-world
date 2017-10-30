--------------------------------------------
-- Export file for user C##_BIGDATA@ZZMDM --
-- Created by zhy on 2017/10/13, 11:58:10 --
--------------------------------------------

set define off
spool spss.log

prompt
prompt Creating table SPSS_BUS11
prompt =========================
prompt
create table SPSS_BUS11
(
  日期      VARCHAR2(32) not null,
  小时      NUMBER not null,
  温度      VARCHAR2(12),
  holiday NUMBER(18),
  真实值     NUMBER,
  预测值     NUMBER,
  误差率     NUMBER
)
;
alter table SPSS_BUS11
  add primary key (日期, 小时);

prompt
prompt Creating table SPSS_BUS6
prompt ========================
prompt
create table SPSS_BUS6
(
  日期      VARCHAR2(32) not null,
  小时      NUMBER(18) not null,
  温度      VARCHAR2(12),
  holiday NUMBER(18),
  真实值     NUMBER(10),
  预测值     NUMBER,
  误差率     NUMBER
)
;
alter table SPSS_BUS6
  add primary key (日期, 小时);

prompt
prompt Creating table SPSS_DEFAULT
prompt ===========================
prompt
create table SPSS_DEFAULT
(
  limit_bal                  NUMBER(8),
  sex                        NUMBER(3),
  education                  NUMBER(3),
  marriage                   NUMBER(3),
  age                        NUMBER(4),
  pay                        NUMBER(3),
  bill_diff                  NUMBER(8),
  pay_diff                   NUMBER(8),
  default_payment_next_month NUMBER(3)
)
;

prompt
prompt Creating table SPSS_LINE11
prompt ==========================
prompt
create table SPSS_LINE11
(
  date_time   VARCHAR2(10),
  aday        VARCHAR2(26),
  count       NUMBER(6),
  hour        NUMBER(4),
  weekday     NUMBER(3),
  weather     NUMBER(4),
  temperature VARCHAR2(26),
  wind        NUMBER(3),
  holiday     NUMBER(3)
)
;

prompt
prompt Creating table SPSS_LINE6
prompt =========================
prompt
create table SPSS_LINE6
(
  date_time   VARCHAR2(10),
  aday        VARCHAR2(26),
  count       NUMBER(6),
  hour        NUMBER(4),
  weekday     NUMBER(3),
  weather     NUMBER(4),
  temperature VARCHAR2(26),
  wind        NUMBER(3),
  holiday     NUMBER(3)
)
;

prompt
prompt Creating table SPSS_MODEL_PREDICTION_CFG
prompt ========================================
prompt
create table SPSS_MODEL_PREDICTION_CFG
(
  model_id    VARCHAR2(255),
  model_name  VARCHAR2(255),
  model_table VARCHAR2(255),
  model_url   VARCHAR2(255)
)
;
comment on table SPSS_MODEL_PREDICTION_CFG
  is '模型预测配置表';
comment on column SPSS_MODEL_PREDICTION_CFG.model_id
  is '模型id';
comment on column SPSS_MODEL_PREDICTION_CFG.model_name
  is '模型名称';
comment on column SPSS_MODEL_PREDICTION_CFG.model_table
  is '模型表名';
comment on column SPSS_MODEL_PREDICTION_CFG.model_url
  is '模型url地址';


spool off
