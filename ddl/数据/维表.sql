--------------------------------------------
-- Export file for user C##_BIGDATA@ZZMDM --
-- Created by zhy on 2017/10/13, 11:22:47 --
--------------------------------------------

set define off
spool 维表.log

prompt
prompt Creating table DIM_AGE_RANGE
prompt ============================
prompt
create table DIM_AGE_RANGE
(
  age_range_code    VARCHAR2(50),
  age_range_name    VARCHAR2(50),
  to_now_months_max NUMBER,
  start_time        VARCHAR2(50),
  end_time          VARCHAR2(50),
  is_valid_flag     INTEGER,
  age_range_type    VARCHAR2(50),
  to_now_months_min NUMBER
)
;
comment on table DIM_AGE_RANGE
  is '年龄段维表';
comment on column DIM_AGE_RANGE.age_range_code
  is '年龄段编码';
comment on column DIM_AGE_RANGE.age_range_name
  is '年龄段名称';
comment on column DIM_AGE_RANGE.to_now_months_max
  is '距今最大月份数';
comment on column DIM_AGE_RANGE.start_time
  is '开始时间';
comment on column DIM_AGE_RANGE.end_time
  is '结束时间';
comment on column DIM_AGE_RANGE.is_valid_flag
  is '是否有效标识';
comment on column DIM_AGE_RANGE.age_range_type
  is '年龄段类型(00：全年龄段，这是在统计不涉及年龄时选的段)';
comment on column DIM_AGE_RANGE.to_now_months_min
  is '距今最小月份数';

prompt
prompt Creating table DIM_CHILDBBEAR_AGE
prompt =================================
prompt
create table DIM_CHILDBBEAR_AGE
(
  is_childbear_age_code VARCHAR2(50),
  is_childbear_age_name VARCHAR2(50)
)
;
comment on table DIM_CHILDBBEAR_AGE
  is '育龄维表';
comment on column DIM_CHILDBBEAR_AGE.is_childbear_age_code
  is '育龄编码';
comment on column DIM_CHILDBBEAR_AGE.is_childbear_age_name
  is '育龄情况';

prompt
prompt Creating table DIM_CHI_REG
prompt ==========================
prompt
create table DIM_CHI_REG
(
  childbearing_age VARCHAR2(10),
  region           VARCHAR2(50)
)
;

prompt
prompt Creating table DIM_ECO_INDEX
prompt ============================
prompt
create table DIM_ECO_INDEX
(
  index_name     VARCHAR2(50),
  index_code     VARCHAR2(50),
  per_index_code VARCHAR2(50),
  rep_type       VARCHAR2(50),
  time           DATE,
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
  latestversion  NUMBER,
  approvalstae   NUMBER,
  bus_date       DATE,
  exa_remarks    VARCHAR2(500)
)
;
comment on table DIM_ECO_INDEX
  is '宏观经济指标编码表';
comment on column DIM_ECO_INDEX.index_name
  is '宏观经济指标名';
comment on column DIM_ECO_INDEX.index_code
  is '宏观经济指标编码';
comment on column DIM_ECO_INDEX.per_index_code
  is '宏观经济父指标编码';
comment on column DIM_ECO_INDEX.rep_type
  is '报表类型';
comment on column DIM_ECO_INDEX.time
  is '时间';
comment on column DIM_ECO_INDEX.sort_id
  is '排序';
comment on column DIM_ECO_INDEX.description
  is '操作描述';
comment on column DIM_ECO_INDEX.creator_id
  is '创建者id';
comment on column DIM_ECO_INDEX.creator
  is '创建者';
comment on column DIM_ECO_INDEX.create_date
  is '创建日期';
comment on column DIM_ECO_INDEX.modifiedby
  is '修改人';
comment on column DIM_ECO_INDEX.modifiedby_id
  is '修改人id';
comment on column DIM_ECO_INDEX.modified_date
  is '修改日期';
comment on column DIM_ECO_INDEX.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column DIM_ECO_INDEX.version
  is '版本号';
comment on column DIM_ECO_INDEX.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column DIM_ECO_INDEX.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column DIM_ECO_INDEX.bus_date
  is '业务日期';
comment on column DIM_ECO_INDEX.exa_remarks
  is '审批备注';

prompt
prompt Creating table DIM_EDUCATION
prompt ============================
prompt
create table DIM_EDUCATION
(
  education_code VARCHAR2(50),
  education_name VARCHAR2(50)
)
;
comment on table DIM_EDUCATION
  is '学历维表';
comment on column DIM_EDUCATION.education_code
  is '学历编码';
comment on column DIM_EDUCATION.education_name
  is '学历名称';

prompt
prompt Creating table DIM_IDT_CTGR
prompt ===========================
prompt
create table DIM_IDT_CTGR
(
  idt_ctgr_code VARCHAR2(50),
  idt_ctgr_name VARCHAR2(50)
)
;
comment on table DIM_IDT_CTGR
  is '行业门类维表';
comment on column DIM_IDT_CTGR.idt_ctgr_code
  is '行业门类编码';
comment on column DIM_IDT_CTGR.idt_ctgr_name
  is '行业门类名称';

prompt
prompt Creating table DIM_INDU_CAT
prompt ===========================
prompt
create table DIM_INDU_CAT
(
  indu_code     VARCHAR2(5),
  indu_name     VARCHAR2(220),
  per_indu_code VARCHAR2(5)
)
;
comment on table DIM_INDU_CAT
  is '行业代码维表';
comment on column DIM_INDU_CAT.indu_code
  is '行业代码';
comment on column DIM_INDU_CAT.indu_name
  is '行业名称';
comment on column DIM_INDU_CAT.per_indu_code
  is '上级行业代码';

prompt
prompt Creating table DIM_LEG_PER_NAME
prompt ===============================
prompt
create table DIM_LEG_PER_NAME
(
  leg_per_code VARCHAR2(50),
  leg_per_name VARCHAR2(100)
)
;

prompt
prompt Creating table DIM_MARRY_STATUS
prompt ===============================
prompt
create table DIM_MARRY_STATUS
(
  marry_status_code VARCHAR2(50),
  marry_status_name VARCHAR2(50)
)
;
comment on table DIM_MARRY_STATUS
  is '婚姻状况维表';
comment on column DIM_MARRY_STATUS.marry_status_code
  is '婚姻状况编码';
comment on column DIM_MARRY_STATUS.marry_status_name
  is '婚姻状况名称';

prompt
prompt Creating table DIM_REGION
prompt =========================
prompt
create table DIM_REGION
(
  region_code     VARCHAR2(50),
  region_name     VARCHAR2(50),
  region_tier     INTEGER,
  parent_code     VARCHAR2(50),
  is_valid_flag   VARCHAR2(2),
  create_time     DATE,
  modify_time     DATE,
  region_formname VARCHAR2(50)
)
;
comment on table DIM_REGION
  is '地区维表';
comment on column DIM_REGION.region_code
  is '地区编码';
comment on column DIM_REGION.region_name
  is '地区名称';
comment on column DIM_REGION.region_tier
  is '级别';
comment on column DIM_REGION.parent_code
  is '父级编码';
comment on column DIM_REGION.is_valid_flag
  is '是否有效标识';
comment on column DIM_REGION.create_time
  is '创建时间';
comment on column DIM_REGION.modify_time
  is '更改时间';
comment on column DIM_REGION.region_formname
  is '地区别名';

prompt
prompt Creating table DIM_REGION_LEVEL
prompt ===============================
prompt
create table DIM_REGION_LEVEL
(
  region_grid_code    VARCHAR2(50),
  region_grid_name    VARCHAR2(50),
  region_village_code VARCHAR2(50),
  region_village_name VARCHAR2(50),
  region_town_code    VARCHAR2(50),
  region_town_name    VARCHAR2(50),
  is_valid_flag       VARCHAR2(2),
  region_formname     VARCHAR2(50)
)
;
comment on table DIM_REGION_LEVEL
  is '地区维表（国标）';
comment on column DIM_REGION_LEVEL.region_grid_code
  is '所属网格编码';
comment on column DIM_REGION_LEVEL.region_grid_name
  is '所属网格名称';
comment on column DIM_REGION_LEVEL.region_village_code
  is '村级代码';
comment on column DIM_REGION_LEVEL.region_village_name
  is '村级名称';
comment on column DIM_REGION_LEVEL.region_town_code
  is '乡镇级代码';
comment on column DIM_REGION_LEVEL.region_town_name
  is '乡镇级名称';
comment on column DIM_REGION_LEVEL.is_valid_flag
  is '是否有效标识';
comment on column DIM_REGION_LEVEL.region_formname
  is '地区别名';

prompt
prompt Creating table DIM_REG_TYPE
prompt ===========================
prompt
create table DIM_REG_TYPE
(
  reg_type_code VARCHAR2(50),
  reg_type_name VARCHAR2(50)
)
;
comment on table DIM_REG_TYPE
  is '登记类型维表';
comment on column DIM_REG_TYPE.reg_type_code
  is '登记类型编码';
comment on column DIM_REG_TYPE.reg_type_name
  is '登记类型名称';

prompt
prompt Creating table DIM_SEX
prompt ======================
prompt
create table DIM_SEX
(
  sex_code VARCHAR2(50),
  sex_name VARCHAR2(50)
)
;
comment on table DIM_SEX
  is '性别维表';
comment on column DIM_SEX.sex_code
  is 'M:男；F:女';
comment on column DIM_SEX.sex_name
  is '性别名称';

prompt
prompt Creating table DIM_YEAR_MONTH
prompt =============================
prompt
create table DIM_YEAR_MONTH
(
  ym_code VARCHAR2(6),
  year    VARCHAR2(4),
  month   VARCHAR2(2),
  time    DATE
)
;
comment on table DIM_YEAR_MONTH
  is '年月维表';
comment on column DIM_YEAR_MONTH.ym_code
  is '年月编码';
comment on column DIM_YEAR_MONTH.year
  is '年份';
comment on column DIM_YEAR_MONTH.month
  is '月份';
comment on column DIM_YEAR_MONTH.time
  is '时间戳';

prompt
prompt Creating table DM_CYLINDER_MON_PLAN
prompt ===================================
prompt
create table DM_CYLINDER_MON_PLAN
(
  product_ym      VARCHAR2(20),
  product_day     VARCHAR2(20),
  plan_cnt        NUMBER,
  input_cnt       NUMBER,
  output_cnt      NUMBER,
  diff_value      NUMBER,
  initial_process NUMBER,
  accum_process   NUMBER
)
;
comment on table DM_CYLINDER_MON_PLAN
  is '缸盖月度产品计划汇总表';
comment on column DM_CYLINDER_MON_PLAN.product_ym
  is '产品生产年月';
comment on column DM_CYLINDER_MON_PLAN.product_day
  is '产品生产日';
comment on column DM_CYLINDER_MON_PLAN.plan_cnt
  is '计划生产量';
comment on column DM_CYLINDER_MON_PLAN.input_cnt
  is '投入实绩';
comment on column DM_CYLINDER_MON_PLAN.output_cnt
  is '产出实绩';
comment on column DM_CYLINDER_MON_PLAN.diff_value
  is '差异';
comment on column DM_CYLINDER_MON_PLAN.initial_process
  is '期初进度';
comment on column DM_CYLINDER_MON_PLAN.accum_process
  is '累计进度';

prompt
prompt Creating table DM_LEG_PER_BASIC_INFO
prompt ====================================
prompt
create table DM_LEG_PER_BASIC_INFO
(
  idt_ctgr_code VARCHAR2(50),
  reg_type_code VARCHAR2(50),
  leg_per_cnt   NUMBER
)
;
comment on column DM_LEG_PER_BASIC_INFO.idt_ctgr_code
  is '行业门类编码';
comment on column DM_LEG_PER_BASIC_INFO.reg_type_code
  is '登记类型编码';
comment on column DM_LEG_PER_BASIC_INFO.leg_per_cnt
  is '法人数';

prompt
prompt Creating table DM_POP_BASIC_INFO
prompt ================================
prompt
create table DM_POP_BASIC_INFO
(
  education_code        VARCHAR2(50),
  is_childbear_age_code VARCHAR2(10),
  marry_status_code     VARCHAR2(50),
  region_code           VARCHAR2(50),
  sex_code              VARCHAR2(50),
  pop_cnt_1             NUMBER,
  age_range_code        VARCHAR2(50),
  pop_cnt_2             NUMBER,
  pop_cnt_3             NUMBER
)
;
comment on table DM_POP_BASIC_INFO
  is '人口统计汇总表';
comment on column DM_POP_BASIC_INFO.education_code
  is '学历';
comment on column DM_POP_BASIC_INFO.is_childbear_age_code
  is '是否育龄妇女';
comment on column DM_POP_BASIC_INFO.marry_status_code
  is '婚姻状况';
comment on column DM_POP_BASIC_INFO.region_code
  is '地区';
comment on column DM_POP_BASIC_INFO.sex_code
  is '性别';
comment on column DM_POP_BASIC_INFO.pop_cnt_1
  is '统计学龄前儿童的人口数';
comment on column DM_POP_BASIC_INFO.age_range_code
  is '年龄段编码';
comment on column DM_POP_BASIC_INFO.pop_cnt_2
  is '统计老年人的人口数';
comment on column DM_POP_BASIC_INFO.pop_cnt_3
  is '统计全年龄段的人口数';


spool off
