--------------------------------------------
-- Export file for user C##_BIGDATA@ZZMDM --
-- Created by zhy on 2017/10/13, 11:22:47 --
--------------------------------------------

set define off
spool ά��.log

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
  is '�����ά��';
comment on column DIM_AGE_RANGE.age_range_code
  is '����α���';
comment on column DIM_AGE_RANGE.age_range_name
  is '���������';
comment on column DIM_AGE_RANGE.to_now_months_max
  is '�������·���';
comment on column DIM_AGE_RANGE.start_time
  is '��ʼʱ��';
comment on column DIM_AGE_RANGE.end_time
  is '����ʱ��';
comment on column DIM_AGE_RANGE.is_valid_flag
  is '�Ƿ���Ч��ʶ';
comment on column DIM_AGE_RANGE.age_range_type
  is '���������(00��ȫ����Σ�������ͳ�Ʋ��漰����ʱѡ�Ķ�)';
comment on column DIM_AGE_RANGE.to_now_months_min
  is '�����С�·���';

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
  is '����ά��';
comment on column DIM_CHILDBBEAR_AGE.is_childbear_age_code
  is '�������';
comment on column DIM_CHILDBBEAR_AGE.is_childbear_age_name
  is '�������';

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
  is '��۾���ָ������';
comment on column DIM_ECO_INDEX.index_name
  is '��۾���ָ����';
comment on column DIM_ECO_INDEX.index_code
  is '��۾���ָ�����';
comment on column DIM_ECO_INDEX.per_index_code
  is '��۾��ø�ָ�����';
comment on column DIM_ECO_INDEX.rep_type
  is '��������';
comment on column DIM_ECO_INDEX.time
  is 'ʱ��';
comment on column DIM_ECO_INDEX.sort_id
  is '����';
comment on column DIM_ECO_INDEX.description
  is '��������';
comment on column DIM_ECO_INDEX.creator_id
  is '������id';
comment on column DIM_ECO_INDEX.creator
  is '������';
comment on column DIM_ECO_INDEX.create_date
  is '��������';
comment on column DIM_ECO_INDEX.modifiedby
  is '�޸���';
comment on column DIM_ECO_INDEX.modifiedby_id
  is '�޸���id';
comment on column DIM_ECO_INDEX.modified_date
  is '�޸�����';
comment on column DIM_ECO_INDEX.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column DIM_ECO_INDEX.version
  is '�汾��';
comment on column DIM_ECO_INDEX.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column DIM_ECO_INDEX.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column DIM_ECO_INDEX.bus_date
  is 'ҵ������';
comment on column DIM_ECO_INDEX.exa_remarks
  is '������ע';

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
  is 'ѧ��ά��';
comment on column DIM_EDUCATION.education_code
  is 'ѧ������';
comment on column DIM_EDUCATION.education_name
  is 'ѧ������';

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
  is '��ҵ����ά��';
comment on column DIM_IDT_CTGR.idt_ctgr_code
  is '��ҵ�������';
comment on column DIM_IDT_CTGR.idt_ctgr_name
  is '��ҵ��������';

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
  is '��ҵ����ά��';
comment on column DIM_INDU_CAT.indu_code
  is '��ҵ����';
comment on column DIM_INDU_CAT.indu_name
  is '��ҵ����';
comment on column DIM_INDU_CAT.per_indu_code
  is '�ϼ���ҵ����';

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
  is '����״��ά��';
comment on column DIM_MARRY_STATUS.marry_status_code
  is '����״������';
comment on column DIM_MARRY_STATUS.marry_status_name
  is '����״������';

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
  is '����ά��';
comment on column DIM_REGION.region_code
  is '��������';
comment on column DIM_REGION.region_name
  is '��������';
comment on column DIM_REGION.region_tier
  is '����';
comment on column DIM_REGION.parent_code
  is '��������';
comment on column DIM_REGION.is_valid_flag
  is '�Ƿ���Ч��ʶ';
comment on column DIM_REGION.create_time
  is '����ʱ��';
comment on column DIM_REGION.modify_time
  is '����ʱ��';
comment on column DIM_REGION.region_formname
  is '��������';

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
  is '����ά�����꣩';
comment on column DIM_REGION_LEVEL.region_grid_code
  is '�����������';
comment on column DIM_REGION_LEVEL.region_grid_name
  is '������������';
comment on column DIM_REGION_LEVEL.region_village_code
  is '�弶����';
comment on column DIM_REGION_LEVEL.region_village_name
  is '�弶����';
comment on column DIM_REGION_LEVEL.region_town_code
  is '���򼶴���';
comment on column DIM_REGION_LEVEL.region_town_name
  is '��������';
comment on column DIM_REGION_LEVEL.is_valid_flag
  is '�Ƿ���Ч��ʶ';
comment on column DIM_REGION_LEVEL.region_formname
  is '��������';

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
  is '�Ǽ�����ά��';
comment on column DIM_REG_TYPE.reg_type_code
  is '�Ǽ����ͱ���';
comment on column DIM_REG_TYPE.reg_type_name
  is '�Ǽ���������';

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
  is '�Ա�ά��';
comment on column DIM_SEX.sex_code
  is 'M:�У�F:Ů';
comment on column DIM_SEX.sex_name
  is '�Ա�����';

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
  is '����ά��';
comment on column DIM_YEAR_MONTH.ym_code
  is '���±���';
comment on column DIM_YEAR_MONTH.year
  is '���';
comment on column DIM_YEAR_MONTH.month
  is '�·�';
comment on column DIM_YEAR_MONTH.time
  is 'ʱ���';

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
  is '�׸��¶Ȳ�Ʒ�ƻ����ܱ�';
comment on column DM_CYLINDER_MON_PLAN.product_ym
  is '��Ʒ��������';
comment on column DM_CYLINDER_MON_PLAN.product_day
  is '��Ʒ������';
comment on column DM_CYLINDER_MON_PLAN.plan_cnt
  is '�ƻ�������';
comment on column DM_CYLINDER_MON_PLAN.input_cnt
  is 'Ͷ��ʵ��';
comment on column DM_CYLINDER_MON_PLAN.output_cnt
  is '����ʵ��';
comment on column DM_CYLINDER_MON_PLAN.diff_value
  is '����';
comment on column DM_CYLINDER_MON_PLAN.initial_process
  is '�ڳ�����';
comment on column DM_CYLINDER_MON_PLAN.accum_process
  is '�ۼƽ���';

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
  is '��ҵ�������';
comment on column DM_LEG_PER_BASIC_INFO.reg_type_code
  is '�Ǽ����ͱ���';
comment on column DM_LEG_PER_BASIC_INFO.leg_per_cnt
  is '������';

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
  is '�˿�ͳ�ƻ��ܱ�';
comment on column DM_POP_BASIC_INFO.education_code
  is 'ѧ��';
comment on column DM_POP_BASIC_INFO.is_childbear_age_code
  is '�Ƿ����举Ů';
comment on column DM_POP_BASIC_INFO.marry_status_code
  is '����״��';
comment on column DM_POP_BASIC_INFO.region_code
  is '����';
comment on column DM_POP_BASIC_INFO.sex_code
  is '�Ա�';
comment on column DM_POP_BASIC_INFO.pop_cnt_1
  is 'ͳ��ѧ��ǰ��ͯ���˿���';
comment on column DM_POP_BASIC_INFO.age_range_code
  is '����α���';
comment on column DM_POP_BASIC_INFO.pop_cnt_2
  is 'ͳ�������˵��˿���';
comment on column DM_POP_BASIC_INFO.pop_cnt_3
  is 'ͳ��ȫ����ε��˿���';


spool off
