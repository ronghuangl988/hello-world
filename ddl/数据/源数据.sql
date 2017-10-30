--------------------------------------------
-- Export file for user C##_BIGDATA@ZZMDM --
-- Created by zhy on 2017/10/13, 13:03:28 --
--------------------------------------------

set define off
spool 源数据.log

prompt
prompt Creating table SRC0108_FIN_BALANCES_INDEX
prompt =========================================
prompt
create table SRC0108_FIN_BALANCES_INDEX
(
  pro_name    VARCHAR2(50),
  parent_code VARCHAR2(10),
  pro_code    VARCHAR2(10),
  time        DATE
)
;
comment on table SRC0108_FIN_BALANCES_INDEX
  is '财政收支指标表';
comment on column SRC0108_FIN_BALANCES_INDEX.pro_name
  is '财政收支指标名称';
comment on column SRC0108_FIN_BALANCES_INDEX.parent_code
  is '财政收支父指标代码';
comment on column SRC0108_FIN_BALANCES_INDEX.pro_code
  is '财政收支指标代码';
comment on column SRC0108_FIN_BALANCES_INDEX.time
  is '时间戳';

prompt
prompt Creating table SRC0108_FIN_BALANCES_INDEX_BAK
prompt =============================================
prompt
create table SRC0108_FIN_BALANCES_INDEX_BAK
(
  pro_name    VARCHAR2(50),
  parent_code VARCHAR2(10),
  pro_code    VARCHAR2(10),
  time        DATE,
  bus_date    DATE
)
;
comment on table SRC0108_FIN_BALANCES_INDEX_BAK
  is '财政收支指标表';
comment on column SRC0108_FIN_BALANCES_INDEX_BAK.pro_name
  is '财政收支指标名称';
comment on column SRC0108_FIN_BALANCES_INDEX_BAK.parent_code
  is '财政收支父指标代码';
comment on column SRC0108_FIN_BALANCES_INDEX_BAK.pro_code
  is '财政收支指标代码';
comment on column SRC0108_FIN_BALANCES_INDEX_BAK.time
  is '时间戳';
comment on column SRC0108_FIN_BALANCES_INDEX_BAK.bus_date
  is '业务日期';

prompt
prompt Creating table SRC0108_FIN_BALANCES_M
prompt =====================================
prompt
create table SRC0108_FIN_BALANCES_M
(
  id           VARCHAR2(20),
  this_mon     NUMBER,
  pre_mon_sum  NUMBER,
  this_yer_bud NUMBER,
  per_com      NUMBER,
  last_yer_mon NUMBER,
  gro_rate     NUMBER,
  months       VARCHAR2(10),
  pro_code     VARCHAR2(10),
  time         DATE,
  sort_id      NUMBER
)
;
comment on table SRC0108_FIN_BALANCES_M
  is '财政收支数据表';
comment on column SRC0108_FIN_BALANCES_M.id
  is '主键';
comment on column SRC0108_FIN_BALANCES_M.this_mon
  is '本月数据（万元）';
comment on column SRC0108_FIN_BALANCES_M.pre_mon_sum
  is '本年累计数（包括本月、单位万元）';
comment on column SRC0108_FIN_BALANCES_M.this_yer_bud
  is '本年预算数（万元）';
comment on column SRC0108_FIN_BALANCES_M.per_com
  is '完成率';
comment on column SRC0108_FIN_BALANCES_M.last_yer_mon
  is '上年同期累计数（万元）';
comment on column SRC0108_FIN_BALANCES_M.gro_rate
  is '同比增长';
comment on column SRC0108_FIN_BALANCES_M.months
  is '时间（月份）';
comment on column SRC0108_FIN_BALANCES_M.pro_code
  is '指标代码，关联财政收支指标表';
comment on column SRC0108_FIN_BALANCES_M.time
  is '时间戳';
comment on column SRC0108_FIN_BALANCES_M.sort_id
  is '排序字段';

prompt
prompt Creating table SRC0108_FIN_BALANCES_M_BAK
prompt =========================================
prompt
create table SRC0108_FIN_BALANCES_M_BAK
(
  this_mon     NUMBER,
  pre_mon_sum  NUMBER,
  this_yer_bud NUMBER,
  per_com      NUMBER,
  last_yer_mon NUMBER,
  gro_rate     NUMBER,
  months       VARCHAR2(10),
  pro_code     VARCHAR2(10),
  time         DATE,
  sort_id      NUMBER,
  bus_date     DATE,
  id           VARCHAR2(20)
)
;
comment on table SRC0108_FIN_BALANCES_M_BAK
  is '财政收支数据表';
comment on column SRC0108_FIN_BALANCES_M_BAK.this_mon
  is '本月数据（万元）';
comment on column SRC0108_FIN_BALANCES_M_BAK.pre_mon_sum
  is '本年累计数（包括本月、单位万元）';
comment on column SRC0108_FIN_BALANCES_M_BAK.this_yer_bud
  is '本年预算数（万元）';
comment on column SRC0108_FIN_BALANCES_M_BAK.per_com
  is '完成率';
comment on column SRC0108_FIN_BALANCES_M_BAK.last_yer_mon
  is '上年同期累计数（万元）';
comment on column SRC0108_FIN_BALANCES_M_BAK.gro_rate
  is '同比增长';
comment on column SRC0108_FIN_BALANCES_M_BAK.months
  is '时间（月份）';
comment on column SRC0108_FIN_BALANCES_M_BAK.pro_code
  is '项目代码，关联财政收支项目表';
comment on column SRC0108_FIN_BALANCES_M_BAK.time
  is '时间戳';
comment on column SRC0108_FIN_BALANCES_M_BAK.sort_id
  is '排序字段';
comment on column SRC0108_FIN_BALANCES_M_BAK.bus_date
  is '业务日期';
comment on column SRC0108_FIN_BALANCES_M_BAK.id
  is '主键';

prompt
prompt Creating table SRC0108_SOCECO_INDI_INDEX
prompt ========================================
prompt
create table SRC0108_SOCECO_INDI_INDEX
(
  entry_name VARCHAR2(50),
  code       VARCHAR2(50),
  time       DATE,
  sort_id    NUMBER
)
;
comment on table SRC0108_SOCECO_INDI_INDEX
  is '主要社会经济指标综合编码表';
comment on column SRC0108_SOCECO_INDI_INDEX.entry_name
  is '项目名称';
comment on column SRC0108_SOCECO_INDI_INDEX.code
  is '编码';
comment on column SRC0108_SOCECO_INDI_INDEX.time
  is '更新时间';
comment on column SRC0108_SOCECO_INDI_INDEX.sort_id
  is '排序';

prompt
prompt Creating table SRC0108_SOCECO_INDI_INDEX_BAK
prompt ============================================
prompt
create table SRC0108_SOCECO_INDI_INDEX_BAK
(
  entry_name VARCHAR2(50),
  code       VARCHAR2(50),
  time       DATE,
  sort_id    NUMBER,
  bus_date   DATE
)
;
comment on table SRC0108_SOCECO_INDI_INDEX_BAK
  is '主要社会经济指标综合编码表';
comment on column SRC0108_SOCECO_INDI_INDEX_BAK.entry_name
  is '项目名称';
comment on column SRC0108_SOCECO_INDI_INDEX_BAK.code
  is '编码';
comment on column SRC0108_SOCECO_INDI_INDEX_BAK.time
  is '更新时间';
comment on column SRC0108_SOCECO_INDI_INDEX_BAK.sort_id
  is '排序';
comment on column SRC0108_SOCECO_INDI_INDEX_BAK.bus_date
  is '业务日期';

prompt
prompt Creating table SRC0108_SOCECO_INDI_Q
prompt ====================================
prompt
create table SRC0108_SOCECO_INDI_Q
(
  id            VARCHAR2(20),
  code          VARCHAR2(50),
  unit          VARCHAR2(50),
  cur_month_val NUMBER,
  cur_year_val  NUMBER,
  last_year_val NUMBER,
  yoy_growth    NUMBER,
  dz_grow_rate  NUMBER,
  dz_com_rate   VARCHAR2(50),
  zz_plan_task  NUMBER,
  zz_com_rate   NUMBER,
  notes         VARCHAR2(100),
  input_date    VARCHAR2(50),
  time          DATE,
  sort_id       NUMBER
)
;
comment on table SRC0108_SOCECO_INDI_Q
  is '主要社会经济指标综合表';
comment on column SRC0108_SOCECO_INDI_Q.id
  is '主键';
comment on column SRC0108_SOCECO_INDI_Q.code
  is '社会经济指标综合编码';
comment on column SRC0108_SOCECO_INDI_Q.unit
  is '单位';
comment on column SRC0108_SOCECO_INDI_Q.cur_month_val
  is '本月完成数';
comment on column SRC0108_SOCECO_INDI_Q.cur_year_val
  is '1-本月累计数';
comment on column SRC0108_SOCECO_INDI_Q.last_year_val
  is '上年累计数';
comment on column SRC0108_SOCECO_INDI_Q.yoy_growth
  is '同比增长';
comment on column SRC0108_SOCECO_INDI_Q.dz_grow_rate
  is '年计划任务  计划(增速)';
comment on column SRC0108_SOCECO_INDI_Q.dz_com_rate
  is '年计划任务 完成率（说明）';
comment on column SRC0108_SOCECO_INDI_Q.zz_plan_task
  is '年计划任务 计划';
comment on column SRC0108_SOCECO_INDI_Q.zz_com_rate
  is '年计划任务 完成率';
comment on column SRC0108_SOCECO_INDI_Q.notes
  is '备注';
comment on column SRC0108_SOCECO_INDI_Q.input_date
  is '年月';
comment on column SRC0108_SOCECO_INDI_Q.time
  is '更新时间';
comment on column SRC0108_SOCECO_INDI_Q.sort_id
  is '排序';

prompt
prompt Creating table SRC0108_SOCECO_INDI_Q_BAK
prompt ========================================
prompt
create table SRC0108_SOCECO_INDI_Q_BAK
(
  code          VARCHAR2(50),
  unit          VARCHAR2(50),
  cur_month_val NUMBER,
  cur_year_val  NUMBER,
  last_year_val NUMBER,
  yoy_growth    NUMBER,
  dz_grow_rate  NUMBER,
  dz_com_rate   VARCHAR2(50),
  zz_plan_task  NUMBER,
  zz_com_rate   NUMBER,
  notes         VARCHAR2(100),
  input_date    VARCHAR2(50),
  time          DATE,
  sort_id       NUMBER,
  bus_date      DATE,
  id            VARCHAR2(20)
)
;
comment on table SRC0108_SOCECO_INDI_Q_BAK
  is '主要社会经济指标综合表';
comment on column SRC0108_SOCECO_INDI_Q_BAK.code
  is '社会经济指标综合编码';
comment on column SRC0108_SOCECO_INDI_Q_BAK.unit
  is '单位';
comment on column SRC0108_SOCECO_INDI_Q_BAK.cur_month_val
  is '本月完成数';
comment on column SRC0108_SOCECO_INDI_Q_BAK.cur_year_val
  is '1-本月累计数';
comment on column SRC0108_SOCECO_INDI_Q_BAK.last_year_val
  is '上年累计数';
comment on column SRC0108_SOCECO_INDI_Q_BAK.yoy_growth
  is '同比增长';
comment on column SRC0108_SOCECO_INDI_Q_BAK.dz_grow_rate
  is '年计划任务  计划(增速)';
comment on column SRC0108_SOCECO_INDI_Q_BAK.dz_com_rate
  is '年计划任务 完成率（说明）';
comment on column SRC0108_SOCECO_INDI_Q_BAK.zz_plan_task
  is '年计划任务 计划';
comment on column SRC0108_SOCECO_INDI_Q_BAK.zz_com_rate
  is '年计划任务 完成率';
comment on column SRC0108_SOCECO_INDI_Q_BAK.notes
  is '备注';
comment on column SRC0108_SOCECO_INDI_Q_BAK.input_date
  is '年月';
comment on column SRC0108_SOCECO_INDI_Q_BAK.time
  is '更新时间';
comment on column SRC0108_SOCECO_INDI_Q_BAK.sort_id
  is '排序';
comment on column SRC0108_SOCECO_INDI_Q_BAK.bus_date
  is '业务日期';
comment on column SRC0108_SOCECO_INDI_Q_BAK.id
  is '主键';

prompt
prompt Creating table SRC0117_POP_BAISHA
prompt =================================
prompt
create table SRC0117_POP_BAISHA
(
  gen_grid      VARCHAR2(50),
  jur_area      VARCHAR2(50),
  jur_code      VARCHAR2(50),
  mng_type      VARCHAR2(50),
  pop_type      VARCHAR2(50),
  fam_num       VARCHAR2(50),
  home_addr     VARCHAR2(100),
  fix_ttl       VARCHAR2(50),
  mb_phone      VARCHAR2(50),
  rel_hsh       VARCHAR2(50),
  hsh_status    VARCHAR2(50),
  pop_name      VARCHAR2(50),
  pop_sex       VARCHAR2(50),
  birthday      DATE,
  dom_type      VARCHAR2(50),
  account_no    VARCHAR2(100),
  nation        VARCHAR2(50),
  deg_edu       VARCHAR2(50),
  occupation    VARCHAR2(50),
  work_unit     VARCHAR2(50),
  reg_code      VARCHAR2(50),
  domicile      VARCHAR2(500),
  hs_tel        VARCHAR2(50),
  isonlychild   VARCHAR2(50),
  office_tel    VARCHAR2(50),
  fa_name       VARCHAR2(50),
  ma_name       VARCHAR2(50),
  mar_status    VARCHAR2(50),
  mar_date      DATE,
  spouse_name   VARCHAR2(50),
  spouse_birth  DATE,
  spouse_no     VARCHAR2(50),
  child_num     VARCHAR2(20),
  boy_num       VARCHAR2(20),
  girl_num      VARCHAR2(20),
  issue_date    DATE,
  discipline    VARCHAR2(20),
  ctp_mea       VARCHAR2(50),
  cont_date     DATE,
  cont_note     VARCHAR2(100),
  is_wmcheck    VARCHAR2(20),
  isglo_cer     VARCHAR2(50),
  current_addr  VARCHAR2(100),
  landlord_name VARCHAR2(50),
  landlord_id   VARCHAR2(50),
  isspouse_loc  VARCHAR2(50),
  spouse_dom    VARCHAR2(50),
  pop_status    VARCHAR2(50),
  pop_ctg       VARCHAR2(50),
  obtain_date   DATE,
  exit_date     DATE,
  reg_date      DATE,
  leave_date    DATE,
  height        VARCHAR2(50),
  form_name     VARCHAR2(50),
  occu_type     VARCHAR2(50),
  pol_visage    VARCHAR2(50),
  note          VARCHAR2(500),
  rel_beli      VARCHAR2(50),
  nationality   VARCHAR2(50),
  time          DATE,
  sort_id       NUMBER
)
;
comment on table SRC0117_POP_BAISHA
  is '白沙人口信息';
comment on column SRC0117_POP_BAISHA.gen_grid
  is '所属网格';
comment on column SRC0117_POP_BAISHA.jur_area
  is '管辖区域';
comment on column SRC0117_POP_BAISHA.jur_code
  is '管辖区域代码';
comment on column SRC0117_POP_BAISHA.mng_type
  is '管理类型';
comment on column SRC0117_POP_BAISHA.pop_type
  is '人口类型';
comment on column SRC0117_POP_BAISHA.fam_num
  is '家庭编号';
comment on column SRC0117_POP_BAISHA.home_addr
  is '家庭地址';
comment on column SRC0117_POP_BAISHA.fix_ttl
  is '固定电话';
comment on column SRC0117_POP_BAISHA.mb_phone
  is '移动电话';
comment on column SRC0117_POP_BAISHA.rel_hsh
  is '与户主关系';
comment on column SRC0117_POP_BAISHA.hsh_status
  is '人户状态';
comment on column SRC0117_POP_BAISHA.pop_name
  is '姓名';
comment on column SRC0117_POP_BAISHA.pop_sex
  is '性别';
comment on column SRC0117_POP_BAISHA.birthday
  is '出生日期';
comment on column SRC0117_POP_BAISHA.dom_type
  is '证件类型';
comment on column SRC0117_POP_BAISHA.account_no
  is '证件号';
comment on column SRC0117_POP_BAISHA.nation
  is '民族';
comment on column SRC0117_POP_BAISHA.deg_edu
  is '文化程度';
comment on column SRC0117_POP_BAISHA.occupation
  is '职业';
comment on column SRC0117_POP_BAISHA.work_unit
  is '工作单位';
comment on column SRC0117_POP_BAISHA.reg_code
  is '户籍地代码';
comment on column SRC0117_POP_BAISHA.domicile
  is '户籍地';
comment on column SRC0117_POP_BAISHA.hs_tel
  is '户籍地联系电话';
comment on column SRC0117_POP_BAISHA.isonlychild
  is '是否独子';
comment on column SRC0117_POP_BAISHA.office_tel
  is '办公电话';
comment on column SRC0117_POP_BAISHA.fa_name
  is '父亲姓名';
comment on column SRC0117_POP_BAISHA.ma_name
  is '母亲姓名';
comment on column SRC0117_POP_BAISHA.mar_status
  is '婚姻状况';
comment on column SRC0117_POP_BAISHA.mar_date
  is '婚姻日期';
comment on column SRC0117_POP_BAISHA.spouse_name
  is '配偶名字';
comment on column SRC0117_POP_BAISHA.spouse_birth
  is '配偶出生日期';
comment on column SRC0117_POP_BAISHA.spouse_no
  is '配偶身份证';
comment on column SRC0117_POP_BAISHA.child_num
  is '现孩数';
comment on column SRC0117_POP_BAISHA.boy_num
  is '现男孩数';
comment on column SRC0117_POP_BAISHA.girl_num
  is '现女孩数';
comment on column SRC0117_POP_BAISHA.issue_date
  is '发证日期';
comment on column SRC0117_POP_BAISHA.discipline
  is '是否违纪';
comment on column SRC0117_POP_BAISHA.ctp_mea
  is '节育措施';
comment on column SRC0117_POP_BAISHA.cont_date
  is '节育日期';
comment on column SRC0117_POP_BAISHA.cont_note
  is '节育备注';
comment on column SRC0117_POP_BAISHA.is_wmcheck
  is '是否需要妇检';
comment on column SRC0117_POP_BAISHA.isglo_cer
  is '有无光荣证';
comment on column SRC0117_POP_BAISHA.current_addr
  is '现居住地址';
comment on column SRC0117_POP_BAISHA.landlord_name
  is '房东姓名';
comment on column SRC0117_POP_BAISHA.landlord_id
  is '房东身份证';
comment on column SRC0117_POP_BAISHA.isspouse_loc
  is '配偶是否本地';
comment on column SRC0117_POP_BAISHA.spouse_dom
  is '配偶户籍地';
comment on column SRC0117_POP_BAISHA.pop_status
  is '人员状态';
comment on column SRC0117_POP_BAISHA.pop_ctg
  is '人员类别';
comment on column SRC0117_POP_BAISHA.obtain_date
  is '入户时间';
comment on column SRC0117_POP_BAISHA.exit_date
  is '出户时间';
comment on column SRC0117_POP_BAISHA.reg_date
  is '登记日期';
comment on column SRC0117_POP_BAISHA.leave_date
  is '离籍时间';
comment on column SRC0117_POP_BAISHA.height
  is '身高';
comment on column SRC0117_POP_BAISHA.form_name
  is '曾用名';
comment on column SRC0117_POP_BAISHA.occu_type
  is '职业类别';
comment on column SRC0117_POP_BAISHA.pol_visage
  is '政治面貌';
comment on column SRC0117_POP_BAISHA.note
  is '备注';
comment on column SRC0117_POP_BAISHA.rel_beli
  is '宗教信仰';
comment on column SRC0117_POP_BAISHA.nationality
  is '国籍';
comment on column SRC0117_POP_BAISHA.time
  is '更新时间';
comment on column SRC0117_POP_BAISHA.sort_id
  is '排序';

prompt
prompt Creating table SRC0117_POP_BAISHA_BAK
prompt =====================================
prompt
create table SRC0117_POP_BAISHA_BAK
(
  gen_grid      VARCHAR2(50),
  jur_area      VARCHAR2(50),
  jur_code      VARCHAR2(50),
  mng_type      VARCHAR2(50),
  pop_type      VARCHAR2(50),
  fam_num       VARCHAR2(50),
  home_addr     VARCHAR2(100),
  fix_ttl       VARCHAR2(50),
  mb_phone      VARCHAR2(50),
  rel_hsh       VARCHAR2(50),
  hsh_status    VARCHAR2(50),
  pop_name      VARCHAR2(50),
  pop_sex       VARCHAR2(50),
  birthday      DATE,
  dom_type      VARCHAR2(50),
  account_no    VARCHAR2(100),
  nation        VARCHAR2(50),
  deg_edu       VARCHAR2(50),
  occupation    VARCHAR2(50),
  work_unit     VARCHAR2(50),
  reg_code      VARCHAR2(50),
  domicile      VARCHAR2(500),
  hs_tel        VARCHAR2(50),
  isonlychild   VARCHAR2(50),
  office_tel    VARCHAR2(50),
  fa_name       VARCHAR2(50),
  ma_name       VARCHAR2(50),
  mar_status    VARCHAR2(50),
  mar_date      DATE,
  spouse_name   VARCHAR2(50),
  spouse_birth  DATE,
  spouse_no     VARCHAR2(50),
  child_num     VARCHAR2(20),
  boy_num       VARCHAR2(20),
  girl_num      VARCHAR2(20),
  issue_date    DATE,
  discipline    VARCHAR2(20),
  ctp_mea       VARCHAR2(50),
  cont_date     DATE,
  cont_note     VARCHAR2(100),
  is_wmcheck    VARCHAR2(20),
  isglo_cer     VARCHAR2(50),
  current_addr  VARCHAR2(100),
  landlord_name VARCHAR2(50),
  landlord_id   VARCHAR2(50),
  isspouse_loc  VARCHAR2(50),
  spouse_dom    VARCHAR2(50),
  pop_status    VARCHAR2(50),
  pop_ctg       VARCHAR2(50),
  obtain_date   DATE,
  exit_date     DATE,
  reg_date      DATE,
  leave_date    DATE,
  height        VARCHAR2(50),
  form_name     VARCHAR2(50),
  occu_type     VARCHAR2(50),
  pol_visage    VARCHAR2(50),
  note          VARCHAR2(500),
  rel_beli      VARCHAR2(50),
  nationality   VARCHAR2(50),
  time          DATE,
  sort_id       NUMBER,
  bus_date      DATE
)
;
comment on table SRC0117_POP_BAISHA_BAK
  is '白沙人口信息';
comment on column SRC0117_POP_BAISHA_BAK.gen_grid
  is '所属网格';
comment on column SRC0117_POP_BAISHA_BAK.jur_area
  is '管辖区域';
comment on column SRC0117_POP_BAISHA_BAK.jur_code
  is '管辖区域代码';
comment on column SRC0117_POP_BAISHA_BAK.mng_type
  is '管理类型';
comment on column SRC0117_POP_BAISHA_BAK.pop_type
  is '人口类型';
comment on column SRC0117_POP_BAISHA_BAK.fam_num
  is '家庭编号';
comment on column SRC0117_POP_BAISHA_BAK.home_addr
  is '家庭地址';
comment on column SRC0117_POP_BAISHA_BAK.fix_ttl
  is '固定电话';
comment on column SRC0117_POP_BAISHA_BAK.mb_phone
  is '移动电话';
comment on column SRC0117_POP_BAISHA_BAK.rel_hsh
  is '与户主关系';
comment on column SRC0117_POP_BAISHA_BAK.hsh_status
  is '人户状态';
comment on column SRC0117_POP_BAISHA_BAK.pop_name
  is '姓名';
comment on column SRC0117_POP_BAISHA_BAK.pop_sex
  is '性别';
comment on column SRC0117_POP_BAISHA_BAK.birthday
  is '出生日期';
comment on column SRC0117_POP_BAISHA_BAK.dom_type
  is '证件类型';
comment on column SRC0117_POP_BAISHA_BAK.account_no
  is '证件号';
comment on column SRC0117_POP_BAISHA_BAK.nation
  is '民族';
comment on column SRC0117_POP_BAISHA_BAK.deg_edu
  is '文化程度';
comment on column SRC0117_POP_BAISHA_BAK.occupation
  is '职业';
comment on column SRC0117_POP_BAISHA_BAK.work_unit
  is '工作单位';
comment on column SRC0117_POP_BAISHA_BAK.reg_code
  is '户籍地代码';
comment on column SRC0117_POP_BAISHA_BAK.domicile
  is '户籍地';
comment on column SRC0117_POP_BAISHA_BAK.hs_tel
  is '户籍地联系电话';
comment on column SRC0117_POP_BAISHA_BAK.isonlychild
  is '是否独子';
comment on column SRC0117_POP_BAISHA_BAK.office_tel
  is '办公电话';
comment on column SRC0117_POP_BAISHA_BAK.fa_name
  is '父亲姓名';
comment on column SRC0117_POP_BAISHA_BAK.ma_name
  is '母亲姓名';
comment on column SRC0117_POP_BAISHA_BAK.mar_status
  is '婚姻状况';
comment on column SRC0117_POP_BAISHA_BAK.mar_date
  is '婚姻日期';
comment on column SRC0117_POP_BAISHA_BAK.spouse_name
  is '配偶名字';
comment on column SRC0117_POP_BAISHA_BAK.spouse_birth
  is '配偶出生日期';
comment on column SRC0117_POP_BAISHA_BAK.spouse_no
  is '配偶身份证';
comment on column SRC0117_POP_BAISHA_BAK.child_num
  is '现孩数';
comment on column SRC0117_POP_BAISHA_BAK.boy_num
  is '现男孩数';
comment on column SRC0117_POP_BAISHA_BAK.girl_num
  is '现女孩数';
comment on column SRC0117_POP_BAISHA_BAK.issue_date
  is '发证日期';
comment on column SRC0117_POP_BAISHA_BAK.discipline
  is '是否违纪';
comment on column SRC0117_POP_BAISHA_BAK.ctp_mea
  is '节育措施';
comment on column SRC0117_POP_BAISHA_BAK.cont_date
  is '节育日期';
comment on column SRC0117_POP_BAISHA_BAK.cont_note
  is '节育备注';
comment on column SRC0117_POP_BAISHA_BAK.is_wmcheck
  is '是否需要妇检';
comment on column SRC0117_POP_BAISHA_BAK.isglo_cer
  is '有无光荣证';
comment on column SRC0117_POP_BAISHA_BAK.current_addr
  is '现居住地址';
comment on column SRC0117_POP_BAISHA_BAK.landlord_name
  is '房东姓名';
comment on column SRC0117_POP_BAISHA_BAK.landlord_id
  is '房东身份证';
comment on column SRC0117_POP_BAISHA_BAK.isspouse_loc
  is '配偶是否本地';
comment on column SRC0117_POP_BAISHA_BAK.spouse_dom
  is '配偶户籍地';
comment on column SRC0117_POP_BAISHA_BAK.pop_status
  is '人员状态';
comment on column SRC0117_POP_BAISHA_BAK.pop_ctg
  is '人员类别';
comment on column SRC0117_POP_BAISHA_BAK.obtain_date
  is '入户时间';
comment on column SRC0117_POP_BAISHA_BAK.exit_date
  is '出户时间';
comment on column SRC0117_POP_BAISHA_BAK.reg_date
  is '登记日期';
comment on column SRC0117_POP_BAISHA_BAK.leave_date
  is '离籍时间';
comment on column SRC0117_POP_BAISHA_BAK.height
  is '身高';
comment on column SRC0117_POP_BAISHA_BAK.form_name
  is '曾用名';
comment on column SRC0117_POP_BAISHA_BAK.occu_type
  is '职业类别';
comment on column SRC0117_POP_BAISHA_BAK.pol_visage
  is '政治面貌';
comment on column SRC0117_POP_BAISHA_BAK.note
  is '备注';
comment on column SRC0117_POP_BAISHA_BAK.rel_beli
  is '宗教信仰';
comment on column SRC0117_POP_BAISHA_BAK.nationality
  is '国籍';
comment on column SRC0117_POP_BAISHA_BAK.time
  is '更新时间';
comment on column SRC0117_POP_BAISHA_BAK.sort_id
  is '排序';
comment on column SRC0117_POP_BAISHA_BAK.bus_date
  is '业务日期';

prompt
prompt Creating table SRC0117_POP_CULT
prompt ===============================
prompt
create table SRC0117_POP_CULT
(
  pop_name    VARCHAR2(50),
  account_no  VARCHAR2(50),
  gen_grid    VARCHAR2(50),
  fm_unit     VARCHAR2(50),
  unit_phone  VARCHAR2(50),
  unit_person VARCHAR2(50),
  com_treat   VARCHAR2(50),
  join_chur   VARCHAR2(50),
  church      VARCHAR2(50),
  mem_list    VARCHAR2(50),
  ch_perf     VARCHAR2(50),
  ec_cyle     VARCHAR2(50),
  visttime    DATE,
  time        DATE,
  sort_id     NUMBER
)
;
comment on table SRC0117_POP_CULT
  is '邪派人员信息表';
comment on column SRC0117_POP_CULT.pop_name
  is '姓名';
comment on column SRC0117_POP_CULT.account_no
  is '身份证号码';
comment on column SRC0117_POP_CULT.gen_grid
  is '所属网格';
comment on column SRC0117_POP_CULT.fm_unit
  is '原工作单位';
comment on column SRC0117_POP_CULT.unit_phone
  is '单位联系电话';
comment on column SRC0117_POP_CULT.unit_person
  is '单位联络人';
comment on column SRC0117_POP_CULT.com_treat
  is '打击处理情况';
comment on column SRC0117_POP_CULT.join_chur
  is '参加教派';
comment on column SRC0117_POP_CULT.church
  is '教派中任何职';
comment on column SRC0117_POP_CULT.mem_list
  is '小组人员名单';
comment on column SRC0117_POP_CULT.ch_perf
  is '打击处理情况及现实表现';
comment on column SRC0117_POP_CULT.ec_cyle
  is '执行周期';
comment on column SRC0117_POP_CULT.visttime
  is '走访时间';
comment on column SRC0117_POP_CULT.time
  is '更新时间';
comment on column SRC0117_POP_CULT.sort_id
  is '排序';

prompt
prompt Creating table SRC0117_POP_CULT_BAK
prompt ===================================
prompt
create table SRC0117_POP_CULT_BAK
(
  pop_name    VARCHAR2(50),
  account_no  VARCHAR2(50),
  gen_grid    VARCHAR2(50),
  fm_unit     VARCHAR2(50),
  unit_phone  VARCHAR2(50),
  unit_person VARCHAR2(50),
  com_treat   VARCHAR2(50),
  join_chur   VARCHAR2(50),
  church      VARCHAR2(50),
  mem_list    VARCHAR2(50),
  ch_perf     VARCHAR2(50),
  ec_cyle     VARCHAR2(50),
  visttime    DATE,
  time        DATE,
  sort_id     NUMBER,
  bus_date    DATE
)
;
comment on table SRC0117_POP_CULT_BAK
  is '邪派人员信息表';
comment on column SRC0117_POP_CULT_BAK.pop_name
  is '姓名';
comment on column SRC0117_POP_CULT_BAK.account_no
  is '身份证号码';
comment on column SRC0117_POP_CULT_BAK.gen_grid
  is '所属网格';
comment on column SRC0117_POP_CULT_BAK.fm_unit
  is '原工作单位';
comment on column SRC0117_POP_CULT_BAK.unit_phone
  is '单位联系电话';
comment on column SRC0117_POP_CULT_BAK.unit_person
  is '单位联络人';
comment on column SRC0117_POP_CULT_BAK.com_treat
  is '打击处理情况';
comment on column SRC0117_POP_CULT_BAK.join_chur
  is '参加教派';
comment on column SRC0117_POP_CULT_BAK.church
  is '教派中任何职';
comment on column SRC0117_POP_CULT_BAK.mem_list
  is '小组人员名单';
comment on column SRC0117_POP_CULT_BAK.ch_perf
  is '打击处理情况及现实表现';
comment on column SRC0117_POP_CULT_BAK.ec_cyle
  is '执行周期';
comment on column SRC0117_POP_CULT_BAK.visttime
  is '走访时间';
comment on column SRC0117_POP_CULT_BAK.time
  is '更新时间';
comment on column SRC0117_POP_CULT_BAK.sort_id
  is '排序';
comment on column SRC0117_POP_CULT_BAK.bus_date
  is '业务日期';

prompt
prompt Creating table SRC0117_POP_DAJING
prompt =================================
prompt
create table SRC0117_POP_DAJING
(
  gen_grid      VARCHAR2(50),
  jur_area      VARCHAR2(50),
  jur_code      VARCHAR2(50),
  mng_type      VARCHAR2(50),
  pop_type      VARCHAR2(50),
  fam_num       VARCHAR2(50),
  home_addr     VARCHAR2(100),
  fix_ttl       VARCHAR2(50),
  mb_phone      VARCHAR2(50),
  rel_hsh       VARCHAR2(50),
  hsh_status    VARCHAR2(50),
  pop_name      VARCHAR2(50),
  pop_sex       VARCHAR2(50),
  birthday      DATE,
  dom_type      VARCHAR2(50),
  account_no    VARCHAR2(100),
  nation        VARCHAR2(50),
  deg_edu       VARCHAR2(50),
  occupation    VARCHAR2(50),
  work_unit     VARCHAR2(50),
  reg_code      VARCHAR2(50),
  domicile      VARCHAR2(500),
  hs_tel        VARCHAR2(50),
  isonlychild   VARCHAR2(50),
  office_tel    VARCHAR2(50),
  fa_name       VARCHAR2(50),
  ma_name       VARCHAR2(50),
  mar_status    VARCHAR2(50),
  mar_date      DATE,
  spouse_name   VARCHAR2(50),
  spouse_birth  DATE,
  spouse_no     VARCHAR2(50),
  child_num     VARCHAR2(20),
  boy_num       VARCHAR2(20),
  girl_num      VARCHAR2(20),
  issue_date    DATE,
  discipline    VARCHAR2(20),
  ctp_mea       VARCHAR2(50),
  cont_date     DATE,
  cont_note     VARCHAR2(100),
  is_wmcheck    VARCHAR2(20),
  isglo_cer     VARCHAR2(50),
  current_addr  VARCHAR2(100),
  landlord_name VARCHAR2(50),
  landlord_id   VARCHAR2(50),
  isspouse_loc  VARCHAR2(50),
  spouse_dom    VARCHAR2(50),
  pop_status    VARCHAR2(50),
  pop_ctg       VARCHAR2(50),
  obtain_date   DATE,
  exit_date     DATE,
  reg_date      DATE,
  leave_date    DATE,
  height        VARCHAR2(50),
  form_name     VARCHAR2(50),
  occu_type     VARCHAR2(50),
  pol_visage    VARCHAR2(50),
  note          VARCHAR2(500),
  rel_beli      VARCHAR2(50),
  nationality   VARCHAR2(50),
  time          DATE,
  sort_id       NUMBER
)
;
comment on table SRC0117_POP_DAJING
  is '大径人口信息';
comment on column SRC0117_POP_DAJING.gen_grid
  is '所属网格';
comment on column SRC0117_POP_DAJING.jur_area
  is '管辖区域';
comment on column SRC0117_POP_DAJING.jur_code
  is '管辖区域代码';
comment on column SRC0117_POP_DAJING.mng_type
  is '管理类型';
comment on column SRC0117_POP_DAJING.pop_type
  is '人口类型';
comment on column SRC0117_POP_DAJING.fam_num
  is '家庭编号';
comment on column SRC0117_POP_DAJING.home_addr
  is '家庭地址';
comment on column SRC0117_POP_DAJING.fix_ttl
  is '固定电话';
comment on column SRC0117_POP_DAJING.mb_phone
  is '移动电话';
comment on column SRC0117_POP_DAJING.rel_hsh
  is '与户主关系';
comment on column SRC0117_POP_DAJING.hsh_status
  is '人户状态';
comment on column SRC0117_POP_DAJING.pop_name
  is '姓名';
comment on column SRC0117_POP_DAJING.pop_sex
  is '性别';
comment on column SRC0117_POP_DAJING.birthday
  is '出生日期';
comment on column SRC0117_POP_DAJING.dom_type
  is '证件类型';
comment on column SRC0117_POP_DAJING.account_no
  is '证件号';
comment on column SRC0117_POP_DAJING.nation
  is '民族';
comment on column SRC0117_POP_DAJING.deg_edu
  is '文化程度';
comment on column SRC0117_POP_DAJING.occupation
  is '职业';
comment on column SRC0117_POP_DAJING.work_unit
  is '工作单位';
comment on column SRC0117_POP_DAJING.reg_code
  is '户籍地代码';
comment on column SRC0117_POP_DAJING.domicile
  is '户籍地';
comment on column SRC0117_POP_DAJING.hs_tel
  is '户籍地联系电话';
comment on column SRC0117_POP_DAJING.isonlychild
  is '是否独子';
comment on column SRC0117_POP_DAJING.office_tel
  is '办公电话';
comment on column SRC0117_POP_DAJING.fa_name
  is '父亲姓名';
comment on column SRC0117_POP_DAJING.ma_name
  is '母亲姓名';
comment on column SRC0117_POP_DAJING.mar_status
  is '婚姻状况';
comment on column SRC0117_POP_DAJING.mar_date
  is '婚姻日期';
comment on column SRC0117_POP_DAJING.spouse_name
  is '配偶名字';
comment on column SRC0117_POP_DAJING.spouse_birth
  is '配偶出生日期';
comment on column SRC0117_POP_DAJING.spouse_no
  is '配偶身份证';
comment on column SRC0117_POP_DAJING.child_num
  is '现孩数';
comment on column SRC0117_POP_DAJING.boy_num
  is '现男孩数';
comment on column SRC0117_POP_DAJING.girl_num
  is '现女孩数';
comment on column SRC0117_POP_DAJING.issue_date
  is '发证日期';
comment on column SRC0117_POP_DAJING.discipline
  is '是否违纪';
comment on column SRC0117_POP_DAJING.ctp_mea
  is '节育措施';
comment on column SRC0117_POP_DAJING.cont_date
  is '节育日期';
comment on column SRC0117_POP_DAJING.cont_note
  is '节育备注';
comment on column SRC0117_POP_DAJING.is_wmcheck
  is '是否需要妇检';
comment on column SRC0117_POP_DAJING.isglo_cer
  is '有无光荣证';
comment on column SRC0117_POP_DAJING.current_addr
  is '现居住地址';
comment on column SRC0117_POP_DAJING.landlord_name
  is '房东姓名';
comment on column SRC0117_POP_DAJING.landlord_id
  is '房东身份证';
comment on column SRC0117_POP_DAJING.isspouse_loc
  is '配偶是否本地';
comment on column SRC0117_POP_DAJING.spouse_dom
  is '配偶户籍地';
comment on column SRC0117_POP_DAJING.pop_status
  is '人员状态';
comment on column SRC0117_POP_DAJING.pop_ctg
  is '人员类别';
comment on column SRC0117_POP_DAJING.obtain_date
  is '入户时间';
comment on column SRC0117_POP_DAJING.exit_date
  is '出户时间';
comment on column SRC0117_POP_DAJING.reg_date
  is '登记日期';
comment on column SRC0117_POP_DAJING.leave_date
  is '离籍时间';
comment on column SRC0117_POP_DAJING.height
  is '身高';
comment on column SRC0117_POP_DAJING.form_name
  is '曾用名';
comment on column SRC0117_POP_DAJING.occu_type
  is '职业类别';
comment on column SRC0117_POP_DAJING.pol_visage
  is '政治面貌';
comment on column SRC0117_POP_DAJING.note
  is '备注';
comment on column SRC0117_POP_DAJING.rel_beli
  is '宗教信仰';
comment on column SRC0117_POP_DAJING.nationality
  is '国籍';
comment on column SRC0117_POP_DAJING.time
  is '更新时间';
comment on column SRC0117_POP_DAJING.sort_id
  is '排序';

prompt
prompt Creating table SRC0117_POP_DAJING_BAK
prompt =====================================
prompt
create table SRC0117_POP_DAJING_BAK
(
  gen_grid      VARCHAR2(50),
  jur_area      VARCHAR2(50),
  jur_code      VARCHAR2(50),
  mng_type      VARCHAR2(50),
  pop_type      VARCHAR2(50),
  fam_num       VARCHAR2(50),
  home_addr     VARCHAR2(100),
  fix_ttl       VARCHAR2(50),
  mb_phone      VARCHAR2(50),
  rel_hsh       VARCHAR2(50),
  hsh_status    VARCHAR2(50),
  pop_name      VARCHAR2(50),
  pop_sex       VARCHAR2(50),
  birthday      DATE,
  dom_type      VARCHAR2(50),
  account_no    VARCHAR2(100),
  nation        VARCHAR2(50),
  deg_edu       VARCHAR2(50),
  occupation    VARCHAR2(50),
  work_unit     VARCHAR2(50),
  reg_code      VARCHAR2(50),
  domicile      VARCHAR2(500),
  hs_tel        VARCHAR2(50),
  isonlychild   VARCHAR2(50),
  office_tel    VARCHAR2(50),
  fa_name       VARCHAR2(50),
  ma_name       VARCHAR2(50),
  mar_status    VARCHAR2(50),
  mar_date      DATE,
  spouse_name   VARCHAR2(50),
  spouse_birth  DATE,
  spouse_no     VARCHAR2(50),
  child_num     VARCHAR2(20),
  boy_num       VARCHAR2(20),
  girl_num      VARCHAR2(20),
  issue_date    DATE,
  discipline    VARCHAR2(20),
  ctp_mea       VARCHAR2(50),
  cont_date     DATE,
  cont_note     VARCHAR2(100),
  is_wmcheck    VARCHAR2(20),
  isglo_cer     VARCHAR2(50),
  current_addr  VARCHAR2(100),
  landlord_name VARCHAR2(50),
  landlord_id   VARCHAR2(50),
  isspouse_loc  VARCHAR2(50),
  spouse_dom    VARCHAR2(50),
  pop_status    VARCHAR2(50),
  pop_ctg       VARCHAR2(50),
  obtain_date   DATE,
  exit_date     DATE,
  reg_date      DATE,
  leave_date    DATE,
  height        VARCHAR2(50),
  form_name     VARCHAR2(50),
  occu_type     VARCHAR2(50),
  pol_visage    VARCHAR2(50),
  note          VARCHAR2(500),
  rel_beli      VARCHAR2(50),
  nationality   VARCHAR2(50),
  time          DATE,
  sort_id       NUMBER,
  bus_date      DATE
)
;
comment on table SRC0117_POP_DAJING_BAK
  is '大径人口信息';
comment on column SRC0117_POP_DAJING_BAK.gen_grid
  is '所属网格';
comment on column SRC0117_POP_DAJING_BAK.jur_area
  is '管辖区域';
comment on column SRC0117_POP_DAJING_BAK.jur_code
  is '管辖区域代码';
comment on column SRC0117_POP_DAJING_BAK.mng_type
  is '管理类型';
comment on column SRC0117_POP_DAJING_BAK.pop_type
  is '人口类型';
comment on column SRC0117_POP_DAJING_BAK.fam_num
  is '家庭编号';
comment on column SRC0117_POP_DAJING_BAK.home_addr
  is '家庭地址';
comment on column SRC0117_POP_DAJING_BAK.fix_ttl
  is '固定电话';
comment on column SRC0117_POP_DAJING_BAK.mb_phone
  is '移动电话';
comment on column SRC0117_POP_DAJING_BAK.rel_hsh
  is '与户主关系';
comment on column SRC0117_POP_DAJING_BAK.hsh_status
  is '人户状态';
comment on column SRC0117_POP_DAJING_BAK.pop_name
  is '姓名';
comment on column SRC0117_POP_DAJING_BAK.pop_sex
  is '性别';
comment on column SRC0117_POP_DAJING_BAK.birthday
  is '出生日期';
comment on column SRC0117_POP_DAJING_BAK.dom_type
  is '证件类型';
comment on column SRC0117_POP_DAJING_BAK.account_no
  is '证件号';
comment on column SRC0117_POP_DAJING_BAK.nation
  is '民族';
comment on column SRC0117_POP_DAJING_BAK.deg_edu
  is '文化程度';
comment on column SRC0117_POP_DAJING_BAK.occupation
  is '职业';
comment on column SRC0117_POP_DAJING_BAK.work_unit
  is '工作单位';
comment on column SRC0117_POP_DAJING_BAK.reg_code
  is '户籍地代码';
comment on column SRC0117_POP_DAJING_BAK.domicile
  is '户籍地';
comment on column SRC0117_POP_DAJING_BAK.hs_tel
  is '户籍地联系电话';
comment on column SRC0117_POP_DAJING_BAK.isonlychild
  is '是否独子';
comment on column SRC0117_POP_DAJING_BAK.office_tel
  is '办公电话';
comment on column SRC0117_POP_DAJING_BAK.fa_name
  is '父亲姓名';
comment on column SRC0117_POP_DAJING_BAK.ma_name
  is '母亲姓名';
comment on column SRC0117_POP_DAJING_BAK.mar_status
  is '婚姻状况';
comment on column SRC0117_POP_DAJING_BAK.mar_date
  is '婚姻日期';
comment on column SRC0117_POP_DAJING_BAK.spouse_name
  is '配偶名字';
comment on column SRC0117_POP_DAJING_BAK.spouse_birth
  is '配偶出生日期';
comment on column SRC0117_POP_DAJING_BAK.spouse_no
  is '配偶身份证';
comment on column SRC0117_POP_DAJING_BAK.child_num
  is '现孩数';
comment on column SRC0117_POP_DAJING_BAK.boy_num
  is '现男孩数';
comment on column SRC0117_POP_DAJING_BAK.girl_num
  is '现女孩数';
comment on column SRC0117_POP_DAJING_BAK.issue_date
  is '发证日期';
comment on column SRC0117_POP_DAJING_BAK.discipline
  is '是否违纪';
comment on column SRC0117_POP_DAJING_BAK.ctp_mea
  is '节育措施';
comment on column SRC0117_POP_DAJING_BAK.cont_date
  is '节育日期';
comment on column SRC0117_POP_DAJING_BAK.cont_note
  is '节育备注';
comment on column SRC0117_POP_DAJING_BAK.is_wmcheck
  is '是否需要妇检';
comment on column SRC0117_POP_DAJING_BAK.isglo_cer
  is '有无光荣证';
comment on column SRC0117_POP_DAJING_BAK.current_addr
  is '现居住地址';
comment on column SRC0117_POP_DAJING_BAK.landlord_name
  is '房东姓名';
comment on column SRC0117_POP_DAJING_BAK.landlord_id
  is '房东身份证';
comment on column SRC0117_POP_DAJING_BAK.isspouse_loc
  is '配偶是否本地';
comment on column SRC0117_POP_DAJING_BAK.spouse_dom
  is '配偶户籍地';
comment on column SRC0117_POP_DAJING_BAK.pop_status
  is '人员状态';
comment on column SRC0117_POP_DAJING_BAK.pop_ctg
  is '人员类别';
comment on column SRC0117_POP_DAJING_BAK.obtain_date
  is '入户时间';
comment on column SRC0117_POP_DAJING_BAK.exit_date
  is '出户时间';
comment on column SRC0117_POP_DAJING_BAK.reg_date
  is '登记日期';
comment on column SRC0117_POP_DAJING_BAK.leave_date
  is '离籍时间';
comment on column SRC0117_POP_DAJING_BAK.height
  is '身高';
comment on column SRC0117_POP_DAJING_BAK.form_name
  is '曾用名';
comment on column SRC0117_POP_DAJING_BAK.occu_type
  is '职业类别';
comment on column SRC0117_POP_DAJING_BAK.pol_visage
  is '政治面貌';
comment on column SRC0117_POP_DAJING_BAK.note
  is '备注';
comment on column SRC0117_POP_DAJING_BAK.rel_beli
  is '宗教信仰';
comment on column SRC0117_POP_DAJING_BAK.nationality
  is '国籍';
comment on column SRC0117_POP_DAJING_BAK.time
  is '更新时间';
comment on column SRC0117_POP_DAJING_BAK.sort_id
  is '排序';
comment on column SRC0117_POP_DAJING_BAK.bus_date
  is '业务日期';

prompt
prompt Creating table SRC0117_POP_DIANDI
prompt =================================
prompt
create table SRC0117_POP_DIANDI
(
  gen_grid      VARCHAR2(50),
  jur_area      VARCHAR2(50),
  jur_code      VARCHAR2(50),
  mng_type      VARCHAR2(50),
  pop_type      VARCHAR2(50),
  fam_num       VARCHAR2(50),
  home_addr     VARCHAR2(100),
  fix_ttl       VARCHAR2(50),
  mb_phone      VARCHAR2(50),
  rel_hsh       VARCHAR2(50),
  hsh_status    VARCHAR2(50),
  pop_name      VARCHAR2(50),
  pop_sex       VARCHAR2(50),
  birthday      DATE,
  dom_type      VARCHAR2(50),
  account_no    VARCHAR2(100),
  nation        VARCHAR2(50),
  deg_edu       VARCHAR2(50),
  occupation    VARCHAR2(50),
  work_unit     VARCHAR2(50),
  reg_code      VARCHAR2(50),
  domicile      VARCHAR2(500),
  hs_tel        VARCHAR2(50),
  isonlychild   VARCHAR2(50),
  office_tel    VARCHAR2(50),
  fa_name       VARCHAR2(50),
  ma_name       VARCHAR2(50),
  mar_status    VARCHAR2(50),
  mar_date      DATE,
  spouse_name   VARCHAR2(50),
  spouse_birth  DATE,
  spouse_no     VARCHAR2(50),
  child_num     VARCHAR2(20),
  boy_num       VARCHAR2(20),
  girl_num      VARCHAR2(20),
  issue_date    DATE,
  discipline    VARCHAR2(20),
  ctp_mea       VARCHAR2(50),
  cont_date     DATE,
  cont_note     VARCHAR2(100),
  is_wmcheck    VARCHAR2(20),
  isglo_cer     VARCHAR2(50),
  current_addr  VARCHAR2(100),
  landlord_name VARCHAR2(50),
  landlord_id   VARCHAR2(50),
  isspouse_loc  VARCHAR2(50),
  spouse_dom    VARCHAR2(50),
  pop_status    VARCHAR2(50),
  pop_ctg       VARCHAR2(50),
  obtain_date   DATE,
  exit_date     DATE,
  reg_date      DATE,
  leave_date    DATE,
  height        VARCHAR2(50),
  form_name     VARCHAR2(50),
  occu_type     VARCHAR2(50),
  pol_visage    VARCHAR2(50),
  note          VARCHAR2(500),
  rel_beli      VARCHAR2(50),
  nationality   VARCHAR2(50),
  time          DATE,
  sort_id       NUMBER
)
;
comment on table SRC0117_POP_DIANDI
  is '店地人口信息';
comment on column SRC0117_POP_DIANDI.gen_grid
  is '所属网格';
comment on column SRC0117_POP_DIANDI.jur_area
  is '管辖区域';
comment on column SRC0117_POP_DIANDI.jur_code
  is '管辖区域代码';
comment on column SRC0117_POP_DIANDI.mng_type
  is '管理类型';
comment on column SRC0117_POP_DIANDI.pop_type
  is '人口类型';
comment on column SRC0117_POP_DIANDI.fam_num
  is '家庭编号';
comment on column SRC0117_POP_DIANDI.home_addr
  is '家庭地址';
comment on column SRC0117_POP_DIANDI.fix_ttl
  is '固定电话';
comment on column SRC0117_POP_DIANDI.mb_phone
  is '移动电话';
comment on column SRC0117_POP_DIANDI.rel_hsh
  is '与户主关系';
comment on column SRC0117_POP_DIANDI.hsh_status
  is '人户状态';
comment on column SRC0117_POP_DIANDI.pop_name
  is '姓名';
comment on column SRC0117_POP_DIANDI.pop_sex
  is '性别';
comment on column SRC0117_POP_DIANDI.birthday
  is '出生日期';
comment on column SRC0117_POP_DIANDI.dom_type
  is '证件类型';
comment on column SRC0117_POP_DIANDI.account_no
  is '证件号';
comment on column SRC0117_POP_DIANDI.nation
  is '民族';
comment on column SRC0117_POP_DIANDI.deg_edu
  is '文化程度';
comment on column SRC0117_POP_DIANDI.occupation
  is '职业';
comment on column SRC0117_POP_DIANDI.work_unit
  is '工作单位';
comment on column SRC0117_POP_DIANDI.reg_code
  is '户籍地代码';
comment on column SRC0117_POP_DIANDI.domicile
  is '户籍地';
comment on column SRC0117_POP_DIANDI.hs_tel
  is '户籍地联系电话';
comment on column SRC0117_POP_DIANDI.isonlychild
  is '是否独子';
comment on column SRC0117_POP_DIANDI.office_tel
  is '办公电话';
comment on column SRC0117_POP_DIANDI.fa_name
  is '父亲姓名';
comment on column SRC0117_POP_DIANDI.ma_name
  is '母亲姓名';
comment on column SRC0117_POP_DIANDI.mar_status
  is '婚姻状况';
comment on column SRC0117_POP_DIANDI.mar_date
  is '婚姻日期';
comment on column SRC0117_POP_DIANDI.spouse_name
  is '配偶名字';
comment on column SRC0117_POP_DIANDI.spouse_birth
  is '配偶出生日期';
comment on column SRC0117_POP_DIANDI.spouse_no
  is '配偶身份证';
comment on column SRC0117_POP_DIANDI.child_num
  is '现孩数';
comment on column SRC0117_POP_DIANDI.boy_num
  is '现男孩数';
comment on column SRC0117_POP_DIANDI.girl_num
  is '现女孩数';
comment on column SRC0117_POP_DIANDI.issue_date
  is '发证日期';
comment on column SRC0117_POP_DIANDI.discipline
  is '是否违纪';
comment on column SRC0117_POP_DIANDI.ctp_mea
  is '节育措施';
comment on column SRC0117_POP_DIANDI.cont_date
  is '节育日期';
comment on column SRC0117_POP_DIANDI.cont_note
  is '节育备注';
comment on column SRC0117_POP_DIANDI.is_wmcheck
  is '是否需要妇检';
comment on column SRC0117_POP_DIANDI.isglo_cer
  is '有无光荣证';
comment on column SRC0117_POP_DIANDI.current_addr
  is '现居住地址';
comment on column SRC0117_POP_DIANDI.landlord_name
  is '房东姓名';
comment on column SRC0117_POP_DIANDI.landlord_id
  is '房东身份证';
comment on column SRC0117_POP_DIANDI.isspouse_loc
  is '配偶是否本地';
comment on column SRC0117_POP_DIANDI.spouse_dom
  is '配偶户籍地';
comment on column SRC0117_POP_DIANDI.pop_status
  is '人员状态';
comment on column SRC0117_POP_DIANDI.pop_ctg
  is '人员类别';
comment on column SRC0117_POP_DIANDI.obtain_date
  is '入户时间';
comment on column SRC0117_POP_DIANDI.exit_date
  is '出户时间';
comment on column SRC0117_POP_DIANDI.reg_date
  is '登记日期';
comment on column SRC0117_POP_DIANDI.leave_date
  is '离籍时间';
comment on column SRC0117_POP_DIANDI.height
  is '身高';
comment on column SRC0117_POP_DIANDI.form_name
  is '曾用名';
comment on column SRC0117_POP_DIANDI.occu_type
  is '职业类别';
comment on column SRC0117_POP_DIANDI.pol_visage
  is '政治面貌';
comment on column SRC0117_POP_DIANDI.note
  is '备注';
comment on column SRC0117_POP_DIANDI.rel_beli
  is '宗教信仰';
comment on column SRC0117_POP_DIANDI.nationality
  is '国籍';
comment on column SRC0117_POP_DIANDI.time
  is '更新时间';
comment on column SRC0117_POP_DIANDI.sort_id
  is '排序';

prompt
prompt Creating table SRC0117_POP_DIANDI_BAK
prompt =====================================
prompt
create table SRC0117_POP_DIANDI_BAK
(
  gen_grid      VARCHAR2(50),
  jur_area      VARCHAR2(50),
  jur_code      VARCHAR2(50),
  mng_type      VARCHAR2(50),
  pop_type      VARCHAR2(50),
  fam_num       VARCHAR2(50),
  home_addr     VARCHAR2(100),
  fix_ttl       VARCHAR2(50),
  mb_phone      VARCHAR2(50),
  rel_hsh       VARCHAR2(50),
  hsh_status    VARCHAR2(50),
  pop_name      VARCHAR2(50),
  pop_sex       VARCHAR2(50),
  birthday      DATE,
  dom_type      VARCHAR2(50),
  account_no    VARCHAR2(100),
  nation        VARCHAR2(50),
  deg_edu       VARCHAR2(50),
  occupation    VARCHAR2(50),
  work_unit     VARCHAR2(50),
  reg_code      VARCHAR2(50),
  domicile      VARCHAR2(500),
  hs_tel        VARCHAR2(50),
  isonlychild   VARCHAR2(50),
  office_tel    VARCHAR2(50),
  fa_name       VARCHAR2(50),
  ma_name       VARCHAR2(50),
  mar_status    VARCHAR2(50),
  mar_date      DATE,
  spouse_name   VARCHAR2(50),
  spouse_birth  DATE,
  spouse_no     VARCHAR2(50),
  child_num     VARCHAR2(20),
  boy_num       VARCHAR2(20),
  girl_num      VARCHAR2(20),
  issue_date    DATE,
  discipline    VARCHAR2(20),
  ctp_mea       VARCHAR2(50),
  cont_date     DATE,
  cont_note     VARCHAR2(100),
  is_wmcheck    VARCHAR2(20),
  isglo_cer     VARCHAR2(50),
  current_addr  VARCHAR2(100),
  landlord_name VARCHAR2(50),
  landlord_id   VARCHAR2(50),
  isspouse_loc  VARCHAR2(50),
  spouse_dom    VARCHAR2(50),
  pop_status    VARCHAR2(50),
  pop_ctg       VARCHAR2(50),
  obtain_date   DATE,
  exit_date     DATE,
  reg_date      DATE,
  leave_date    DATE,
  height        VARCHAR2(50),
  form_name     VARCHAR2(50),
  occu_type     VARCHAR2(50),
  pol_visage    VARCHAR2(50),
  note          VARCHAR2(500),
  rel_beli      VARCHAR2(50),
  nationality   VARCHAR2(50),
  time          DATE,
  sort_id       NUMBER,
  bus_date      DATE
)
;
comment on table SRC0117_POP_DIANDI_BAK
  is '店地人口信息';
comment on column SRC0117_POP_DIANDI_BAK.gen_grid
  is '所属网格';
comment on column SRC0117_POP_DIANDI_BAK.jur_area
  is '管辖区域';
comment on column SRC0117_POP_DIANDI_BAK.jur_code
  is '管辖区域代码';
comment on column SRC0117_POP_DIANDI_BAK.mng_type
  is '管理类型';
comment on column SRC0117_POP_DIANDI_BAK.pop_type
  is '人口类型';
comment on column SRC0117_POP_DIANDI_BAK.fam_num
  is '家庭编号';
comment on column SRC0117_POP_DIANDI_BAK.home_addr
  is '家庭地址';
comment on column SRC0117_POP_DIANDI_BAK.fix_ttl
  is '固定电话';
comment on column SRC0117_POP_DIANDI_BAK.mb_phone
  is '移动电话';
comment on column SRC0117_POP_DIANDI_BAK.rel_hsh
  is '与户主关系';
comment on column SRC0117_POP_DIANDI_BAK.hsh_status
  is '人户状态';
comment on column SRC0117_POP_DIANDI_BAK.pop_name
  is '姓名';
comment on column SRC0117_POP_DIANDI_BAK.pop_sex
  is '性别';
comment on column SRC0117_POP_DIANDI_BAK.birthday
  is '出生日期';
comment on column SRC0117_POP_DIANDI_BAK.dom_type
  is '证件类型';
comment on column SRC0117_POP_DIANDI_BAK.account_no
  is '证件号';
comment on column SRC0117_POP_DIANDI_BAK.nation
  is '民族';
comment on column SRC0117_POP_DIANDI_BAK.deg_edu
  is '文化程度';
comment on column SRC0117_POP_DIANDI_BAK.occupation
  is '职业';
comment on column SRC0117_POP_DIANDI_BAK.work_unit
  is '工作单位';
comment on column SRC0117_POP_DIANDI_BAK.reg_code
  is '户籍地代码';
comment on column SRC0117_POP_DIANDI_BAK.domicile
  is '户籍地';
comment on column SRC0117_POP_DIANDI_BAK.hs_tel
  is '户籍地联系电话';
comment on column SRC0117_POP_DIANDI_BAK.isonlychild
  is '是否独子';
comment on column SRC0117_POP_DIANDI_BAK.office_tel
  is '办公电话';
comment on column SRC0117_POP_DIANDI_BAK.fa_name
  is '父亲姓名';
comment on column SRC0117_POP_DIANDI_BAK.ma_name
  is '母亲姓名';
comment on column SRC0117_POP_DIANDI_BAK.mar_status
  is '婚姻状况';
comment on column SRC0117_POP_DIANDI_BAK.mar_date
  is '婚姻日期';
comment on column SRC0117_POP_DIANDI_BAK.spouse_name
  is '配偶名字';
comment on column SRC0117_POP_DIANDI_BAK.spouse_birth
  is '配偶出生日期';
comment on column SRC0117_POP_DIANDI_BAK.spouse_no
  is '配偶身份证';
comment on column SRC0117_POP_DIANDI_BAK.child_num
  is '现孩数';
comment on column SRC0117_POP_DIANDI_BAK.boy_num
  is '现男孩数';
comment on column SRC0117_POP_DIANDI_BAK.girl_num
  is '现女孩数';
comment on column SRC0117_POP_DIANDI_BAK.issue_date
  is '发证日期';
comment on column SRC0117_POP_DIANDI_BAK.discipline
  is '是否违纪';
comment on column SRC0117_POP_DIANDI_BAK.ctp_mea
  is '节育措施';
comment on column SRC0117_POP_DIANDI_BAK.cont_date
  is '节育日期';
comment on column SRC0117_POP_DIANDI_BAK.cont_note
  is '节育备注';
comment on column SRC0117_POP_DIANDI_BAK.is_wmcheck
  is '是否需要妇检';
comment on column SRC0117_POP_DIANDI_BAK.isglo_cer
  is '有无光荣证';
comment on column SRC0117_POP_DIANDI_BAK.current_addr
  is '现居住地址';
comment on column SRC0117_POP_DIANDI_BAK.landlord_name
  is '房东姓名';
comment on column SRC0117_POP_DIANDI_BAK.landlord_id
  is '房东身份证';
comment on column SRC0117_POP_DIANDI_BAK.isspouse_loc
  is '配偶是否本地';
comment on column SRC0117_POP_DIANDI_BAK.spouse_dom
  is '配偶户籍地';
comment on column SRC0117_POP_DIANDI_BAK.pop_status
  is '人员状态';
comment on column SRC0117_POP_DIANDI_BAK.pop_ctg
  is '人员类别';
comment on column SRC0117_POP_DIANDI_BAK.obtain_date
  is '入户时间';
comment on column SRC0117_POP_DIANDI_BAK.exit_date
  is '出户时间';
comment on column SRC0117_POP_DIANDI_BAK.reg_date
  is '登记日期';
comment on column SRC0117_POP_DIANDI_BAK.leave_date
  is '离籍时间';
comment on column SRC0117_POP_DIANDI_BAK.height
  is '身高';
comment on column SRC0117_POP_DIANDI_BAK.form_name
  is '曾用名';
comment on column SRC0117_POP_DIANDI_BAK.occu_type
  is '职业类别';
comment on column SRC0117_POP_DIANDI_BAK.pol_visage
  is '政治面貌';
comment on column SRC0117_POP_DIANDI_BAK.note
  is '备注';
comment on column SRC0117_POP_DIANDI_BAK.rel_beli
  is '宗教信仰';
comment on column SRC0117_POP_DIANDI_BAK.nationality
  is '国籍';
comment on column SRC0117_POP_DIANDI_BAK.time
  is '更新时间';
comment on column SRC0117_POP_DIANDI_BAK.sort_id
  is '排序';
comment on column SRC0117_POP_DIANDI_BAK.bus_date
  is '业务日期';

prompt
prompt Creating table SRC0117_POP_LINGBO
prompt =================================
prompt
create table SRC0117_POP_LINGBO
(
  gen_grid      VARCHAR2(50),
  jur_area      VARCHAR2(50),
  jur_code      VARCHAR2(50),
  mng_type      VARCHAR2(50),
  pop_type      VARCHAR2(50),
  fam_num       VARCHAR2(50),
  home_addr     VARCHAR2(100),
  fix_ttl       VARCHAR2(50),
  mb_phone      VARCHAR2(50),
  rel_hsh       VARCHAR2(50),
  hsh_status    VARCHAR2(50),
  pop_name      VARCHAR2(50),
  pop_sex       VARCHAR2(50),
  birthday      DATE,
  dom_type      VARCHAR2(50),
  account_no    VARCHAR2(100),
  nation        VARCHAR2(50),
  deg_edu       VARCHAR2(50),
  occupation    VARCHAR2(50),
  work_unit     VARCHAR2(50),
  reg_code      VARCHAR2(50),
  domicile      VARCHAR2(500),
  hs_tel        VARCHAR2(50),
  isonlychild   VARCHAR2(50),
  office_tel    VARCHAR2(50),
  fa_name       VARCHAR2(50),
  ma_name       VARCHAR2(50),
  mar_status    VARCHAR2(50),
  mar_date      DATE,
  spouse_name   VARCHAR2(50),
  spouse_birth  DATE,
  spouse_no     VARCHAR2(50),
  child_num     VARCHAR2(20),
  boy_num       VARCHAR2(20),
  girl_num      VARCHAR2(20),
  issue_date    DATE,
  discipline    VARCHAR2(20),
  ctp_mea       VARCHAR2(50),
  cont_date     DATE,
  cont_note     VARCHAR2(100),
  is_wmcheck    VARCHAR2(20),
  isglo_cer     VARCHAR2(50),
  current_addr  VARCHAR2(100),
  landlord_name VARCHAR2(50),
  landlord_id   VARCHAR2(50),
  isspouse_loc  VARCHAR2(50),
  spouse_dom    VARCHAR2(50),
  pop_status    VARCHAR2(50),
  pop_ctg       VARCHAR2(50),
  obtain_date   DATE,
  exit_date     DATE,
  reg_date      DATE,
  leave_date    DATE,
  height        VARCHAR2(50),
  form_name     VARCHAR2(50),
  occu_type     VARCHAR2(50),
  pol_visage    VARCHAR2(50),
  note          VARCHAR2(500),
  rel_beli      VARCHAR2(50),
  nationality   VARCHAR2(50),
  time          DATE,
  sort_id       NUMBER
)
;
comment on table SRC0117_POP_LINGBO
  is '凌波人口信息';
comment on column SRC0117_POP_LINGBO.gen_grid
  is '所属网格';
comment on column SRC0117_POP_LINGBO.jur_area
  is '管辖区域';
comment on column SRC0117_POP_LINGBO.jur_code
  is '管辖区域代码';
comment on column SRC0117_POP_LINGBO.mng_type
  is '管理类型';
comment on column SRC0117_POP_LINGBO.pop_type
  is '人口类型';
comment on column SRC0117_POP_LINGBO.fam_num
  is '家庭编号';
comment on column SRC0117_POP_LINGBO.home_addr
  is '家庭地址';
comment on column SRC0117_POP_LINGBO.fix_ttl
  is '固定电话';
comment on column SRC0117_POP_LINGBO.mb_phone
  is '移动电话';
comment on column SRC0117_POP_LINGBO.rel_hsh
  is '与户主关系';
comment on column SRC0117_POP_LINGBO.hsh_status
  is '人户状态';
comment on column SRC0117_POP_LINGBO.pop_name
  is '姓名';
comment on column SRC0117_POP_LINGBO.pop_sex
  is '性别';
comment on column SRC0117_POP_LINGBO.birthday
  is '出生日期';
comment on column SRC0117_POP_LINGBO.dom_type
  is '证件类型';
comment on column SRC0117_POP_LINGBO.account_no
  is '证件号';
comment on column SRC0117_POP_LINGBO.nation
  is '民族';
comment on column SRC0117_POP_LINGBO.deg_edu
  is '文化程度';
comment on column SRC0117_POP_LINGBO.occupation
  is '职业';
comment on column SRC0117_POP_LINGBO.work_unit
  is '工作单位';
comment on column SRC0117_POP_LINGBO.reg_code
  is '户籍地代码';
comment on column SRC0117_POP_LINGBO.domicile
  is '户籍地';
comment on column SRC0117_POP_LINGBO.hs_tel
  is '户籍地联系电话';
comment on column SRC0117_POP_LINGBO.isonlychild
  is '是否独子';
comment on column SRC0117_POP_LINGBO.office_tel
  is '办公电话';
comment on column SRC0117_POP_LINGBO.fa_name
  is '父亲姓名';
comment on column SRC0117_POP_LINGBO.ma_name
  is '母亲姓名';
comment on column SRC0117_POP_LINGBO.mar_status
  is '婚姻状况';
comment on column SRC0117_POP_LINGBO.mar_date
  is '婚姻日期';
comment on column SRC0117_POP_LINGBO.spouse_name
  is '配偶名字';
comment on column SRC0117_POP_LINGBO.spouse_birth
  is '配偶出生日期';
comment on column SRC0117_POP_LINGBO.spouse_no
  is '配偶身份证';
comment on column SRC0117_POP_LINGBO.child_num
  is '现孩数';
comment on column SRC0117_POP_LINGBO.boy_num
  is '现男孩数';
comment on column SRC0117_POP_LINGBO.girl_num
  is '现女孩数';
comment on column SRC0117_POP_LINGBO.issue_date
  is '发证日期';
comment on column SRC0117_POP_LINGBO.discipline
  is '是否违纪';
comment on column SRC0117_POP_LINGBO.ctp_mea
  is '节育措施';
comment on column SRC0117_POP_LINGBO.cont_date
  is '节育日期';
comment on column SRC0117_POP_LINGBO.cont_note
  is '节育备注';
comment on column SRC0117_POP_LINGBO.is_wmcheck
  is '是否需要妇检';
comment on column SRC0117_POP_LINGBO.isglo_cer
  is '有无光荣证';
comment on column SRC0117_POP_LINGBO.current_addr
  is '现居住地址';
comment on column SRC0117_POP_LINGBO.landlord_name
  is '房东姓名';
comment on column SRC0117_POP_LINGBO.landlord_id
  is '房东身份证';
comment on column SRC0117_POP_LINGBO.isspouse_loc
  is '配偶是否本地';
comment on column SRC0117_POP_LINGBO.spouse_dom
  is '配偶户籍地';
comment on column SRC0117_POP_LINGBO.pop_status
  is '人员状态';
comment on column SRC0117_POP_LINGBO.pop_ctg
  is '人员类别';
comment on column SRC0117_POP_LINGBO.obtain_date
  is '入户时间';
comment on column SRC0117_POP_LINGBO.exit_date
  is '出户时间';
comment on column SRC0117_POP_LINGBO.reg_date
  is '登记日期';
comment on column SRC0117_POP_LINGBO.leave_date
  is '离籍时间';
comment on column SRC0117_POP_LINGBO.height
  is '身高';
comment on column SRC0117_POP_LINGBO.form_name
  is '曾用名';
comment on column SRC0117_POP_LINGBO.occu_type
  is '职业类别';
comment on column SRC0117_POP_LINGBO.pol_visage
  is '政治面貌';
comment on column SRC0117_POP_LINGBO.note
  is '备注';
comment on column SRC0117_POP_LINGBO.rel_beli
  is '宗教信仰';
comment on column SRC0117_POP_LINGBO.nationality
  is '国籍';
comment on column SRC0117_POP_LINGBO.time
  is '更新时间';
comment on column SRC0117_POP_LINGBO.sort_id
  is '排序';

prompt
prompt Creating table SRC0117_POP_LINGBO_BAK
prompt =====================================
prompt
create table SRC0117_POP_LINGBO_BAK
(
  gen_grid      VARCHAR2(50),
  jur_area      VARCHAR2(50),
  jur_code      VARCHAR2(50),
  mng_type      VARCHAR2(50),
  pop_type      VARCHAR2(50),
  fam_num       VARCHAR2(50),
  home_addr     VARCHAR2(100),
  fix_ttl       VARCHAR2(50),
  mb_phone      VARCHAR2(50),
  rel_hsh       VARCHAR2(50),
  hsh_status    VARCHAR2(50),
  pop_name      VARCHAR2(50),
  pop_sex       VARCHAR2(50),
  birthday      DATE,
  dom_type      VARCHAR2(50),
  account_no    VARCHAR2(100),
  nation        VARCHAR2(50),
  deg_edu       VARCHAR2(50),
  occupation    VARCHAR2(50),
  work_unit     VARCHAR2(50),
  reg_code      VARCHAR2(50),
  domicile      VARCHAR2(500),
  hs_tel        VARCHAR2(50),
  isonlychild   VARCHAR2(50),
  office_tel    VARCHAR2(50),
  fa_name       VARCHAR2(50),
  ma_name       VARCHAR2(50),
  mar_status    VARCHAR2(50),
  mar_date      DATE,
  spouse_name   VARCHAR2(50),
  spouse_birth  DATE,
  spouse_no     VARCHAR2(50),
  child_num     VARCHAR2(20),
  boy_num       VARCHAR2(20),
  girl_num      VARCHAR2(20),
  issue_date    DATE,
  discipline    VARCHAR2(20),
  ctp_mea       VARCHAR2(50),
  cont_date     DATE,
  cont_note     VARCHAR2(100),
  is_wmcheck    VARCHAR2(20),
  isglo_cer     VARCHAR2(50),
  current_addr  VARCHAR2(100),
  landlord_name VARCHAR2(50),
  landlord_id   VARCHAR2(50),
  isspouse_loc  VARCHAR2(50),
  spouse_dom    VARCHAR2(50),
  pop_status    VARCHAR2(50),
  pop_ctg       VARCHAR2(50),
  obtain_date   DATE,
  exit_date     DATE,
  reg_date      DATE,
  leave_date    DATE,
  height        VARCHAR2(50),
  form_name     VARCHAR2(50),
  occu_type     VARCHAR2(50),
  pol_visage    VARCHAR2(50),
  note          VARCHAR2(500),
  rel_beli      VARCHAR2(50),
  nationality   VARCHAR2(50),
  time          DATE,
  sort_id       NUMBER,
  bus_date      DATE
)
;
comment on table SRC0117_POP_LINGBO_BAK
  is '凌波人口信息';
comment on column SRC0117_POP_LINGBO_BAK.gen_grid
  is '所属网格';
comment on column SRC0117_POP_LINGBO_BAK.jur_area
  is '管辖区域';
comment on column SRC0117_POP_LINGBO_BAK.jur_code
  is '管辖区域代码';
comment on column SRC0117_POP_LINGBO_BAK.mng_type
  is '管理类型';
comment on column SRC0117_POP_LINGBO_BAK.pop_type
  is '人口类型';
comment on column SRC0117_POP_LINGBO_BAK.fam_num
  is '家庭编号';
comment on column SRC0117_POP_LINGBO_BAK.home_addr
  is '家庭地址';
comment on column SRC0117_POP_LINGBO_BAK.fix_ttl
  is '固定电话';
comment on column SRC0117_POP_LINGBO_BAK.mb_phone
  is '移动电话';
comment on column SRC0117_POP_LINGBO_BAK.rel_hsh
  is '与户主关系';
comment on column SRC0117_POP_LINGBO_BAK.hsh_status
  is '人户状态';
comment on column SRC0117_POP_LINGBO_BAK.pop_name
  is '姓名';
comment on column SRC0117_POP_LINGBO_BAK.pop_sex
  is '性别';
comment on column SRC0117_POP_LINGBO_BAK.birthday
  is '出生日期';
comment on column SRC0117_POP_LINGBO_BAK.dom_type
  is '证件类型';
comment on column SRC0117_POP_LINGBO_BAK.account_no
  is '证件号';
comment on column SRC0117_POP_LINGBO_BAK.nation
  is '民族';
comment on column SRC0117_POP_LINGBO_BAK.deg_edu
  is '文化程度';
comment on column SRC0117_POP_LINGBO_BAK.occupation
  is '职业';
comment on column SRC0117_POP_LINGBO_BAK.work_unit
  is '工作单位';
comment on column SRC0117_POP_LINGBO_BAK.reg_code
  is '户籍地代码';
comment on column SRC0117_POP_LINGBO_BAK.domicile
  is '户籍地';
comment on column SRC0117_POP_LINGBO_BAK.hs_tel
  is '户籍地联系电话';
comment on column SRC0117_POP_LINGBO_BAK.isonlychild
  is '是否独子';
comment on column SRC0117_POP_LINGBO_BAK.office_tel
  is '办公电话';
comment on column SRC0117_POP_LINGBO_BAK.fa_name
  is '父亲姓名';
comment on column SRC0117_POP_LINGBO_BAK.ma_name
  is '母亲姓名';
comment on column SRC0117_POP_LINGBO_BAK.mar_status
  is '婚姻状况';
comment on column SRC0117_POP_LINGBO_BAK.mar_date
  is '婚姻日期';
comment on column SRC0117_POP_LINGBO_BAK.spouse_name
  is '配偶名字';
comment on column SRC0117_POP_LINGBO_BAK.spouse_birth
  is '配偶出生日期';
comment on column SRC0117_POP_LINGBO_BAK.spouse_no
  is '配偶身份证';
comment on column SRC0117_POP_LINGBO_BAK.child_num
  is '现孩数';
comment on column SRC0117_POP_LINGBO_BAK.boy_num
  is '现男孩数';
comment on column SRC0117_POP_LINGBO_BAK.girl_num
  is '现女孩数';
comment on column SRC0117_POP_LINGBO_BAK.issue_date
  is '发证日期';
comment on column SRC0117_POP_LINGBO_BAK.discipline
  is '是否违纪';
comment on column SRC0117_POP_LINGBO_BAK.ctp_mea
  is '节育措施';
comment on column SRC0117_POP_LINGBO_BAK.cont_date
  is '节育日期';
comment on column SRC0117_POP_LINGBO_BAK.cont_note
  is '节育备注';
comment on column SRC0117_POP_LINGBO_BAK.is_wmcheck
  is '是否需要妇检';
comment on column SRC0117_POP_LINGBO_BAK.isglo_cer
  is '有无光荣证';
comment on column SRC0117_POP_LINGBO_BAK.current_addr
  is '现居住地址';
comment on column SRC0117_POP_LINGBO_BAK.landlord_name
  is '房东姓名';
comment on column SRC0117_POP_LINGBO_BAK.landlord_id
  is '房东身份证';
comment on column SRC0117_POP_LINGBO_BAK.isspouse_loc
  is '配偶是否本地';
comment on column SRC0117_POP_LINGBO_BAK.spouse_dom
  is '配偶户籍地';
comment on column SRC0117_POP_LINGBO_BAK.pop_status
  is '人员状态';
comment on column SRC0117_POP_LINGBO_BAK.pop_ctg
  is '人员类别';
comment on column SRC0117_POP_LINGBO_BAK.obtain_date
  is '入户时间';
comment on column SRC0117_POP_LINGBO_BAK.exit_date
  is '出户时间';
comment on column SRC0117_POP_LINGBO_BAK.reg_date
  is '登记日期';
comment on column SRC0117_POP_LINGBO_BAK.leave_date
  is '离籍时间';
comment on column SRC0117_POP_LINGBO_BAK.height
  is '身高';
comment on column SRC0117_POP_LINGBO_BAK.form_name
  is '曾用名';
comment on column SRC0117_POP_LINGBO_BAK.occu_type
  is '职业类别';
comment on column SRC0117_POP_LINGBO_BAK.pol_visage
  is '政治面貌';
comment on column SRC0117_POP_LINGBO_BAK.note
  is '备注';
comment on column SRC0117_POP_LINGBO_BAK.rel_beli
  is '宗教信仰';
comment on column SRC0117_POP_LINGBO_BAK.nationality
  is '国籍';
comment on column SRC0117_POP_LINGBO_BAK.time
  is '更新时间';
comment on column SRC0117_POP_LINGBO_BAK.sort_id
  is '排序';
comment on column SRC0117_POP_LINGBO_BAK.bus_date
  is '业务日期';

prompt
prompt Creating table SRC0117_POP_RECTIFICATION
prompt ========================================
prompt
create table SRC0117_POP_RECTIFICATION
(
  pop_name     VARCHAR2(50),
  account_no   VARCHAR2(50),
  gen_grid     VARCHAR2(50),
  sentence     VARCHAR2(50),
  ruling_organ VARCHAR2(50),
  ruling_date  DATE,
  pri_pnsm     VARCHAR2(50),
  add_pnsm     VARCHAR2(50),
  main_charges VARCHAR2(50),
  cc_starttime DATE,
  cc_endtime   DATE,
  curr_post    VARCHAR2(50),
  curr_type    VARCHAR2(50),
  fm_unit      VARCHAR2(50),
  fm_post      VARCHAR2(50),
  curr_unit    VARCHAR2(50),
  cri_fact     VARCHAR2(50),
  mng_status   VARCHAR2(50),
  tube_perf    VARCHAR2(50),
  nvist_time   DATE,
  ec_cyle      VARCHAR2(50),
  pop_go       VARCHAR2(50),
  time         DATE,
  sort_id      NUMBER
)
;
comment on table SRC0117_POP_RECTIFICATION
  is '矫正人员信息';
comment on column SRC0117_POP_RECTIFICATION.pop_name
  is '姓名';
comment on column SRC0117_POP_RECTIFICATION.account_no
  is '身份证号码';
comment on column SRC0117_POP_RECTIFICATION.gen_grid
  is '所属网格';
comment on column SRC0117_POP_RECTIFICATION.sentence
  is '判决或裁定书';
comment on column SRC0117_POP_RECTIFICATION.ruling_organ
  is '判决或裁定机关';
comment on column SRC0117_POP_RECTIFICATION.ruling_date
  is '判决或裁定日期';
comment on column SRC0117_POP_RECTIFICATION.pri_pnsm
  is '主刑';
comment on column SRC0117_POP_RECTIFICATION.add_pnsm
  is '附加刑';
comment on column SRC0117_POP_RECTIFICATION.main_charges
  is '主要罪名';
comment on column SRC0117_POP_RECTIFICATION.cc_starttime
  is '社区矫正开始时间';
comment on column SRC0117_POP_RECTIFICATION.cc_endtime
  is '社区矫正结束时间';
comment on column SRC0117_POP_RECTIFICATION.curr_post
  is '现职务';
comment on column SRC0117_POP_RECTIFICATION.curr_type
  is '矫正类型';
comment on column SRC0117_POP_RECTIFICATION.fm_unit
  is '原单位';
comment on column SRC0117_POP_RECTIFICATION.fm_post
  is '原职务';
comment on column SRC0117_POP_RECTIFICATION.curr_unit
  is '现单位';
comment on column SRC0117_POP_RECTIFICATION.cri_fact
  is '犯罪事实';
comment on column SRC0117_POP_RECTIFICATION.mng_status
  is '管理情况';
comment on column SRC0117_POP_RECTIFICATION.tube_perf
  is '列管表现';
comment on column SRC0117_POP_RECTIFICATION.nvist_time
  is '下次走访时间';
comment on column SRC0117_POP_RECTIFICATION.ec_cyle
  is '执行周期';
comment on column SRC0117_POP_RECTIFICATION.pop_go
  is '人员去向';
comment on column SRC0117_POP_RECTIFICATION.time
  is '更新时间';
comment on column SRC0117_POP_RECTIFICATION.sort_id
  is '排序';

prompt
prompt Creating table SRC0117_POP_RECTIFICATION_BAK
prompt ============================================
prompt
create table SRC0117_POP_RECTIFICATION_BAK
(
  pop_name     VARCHAR2(50),
  account_no   VARCHAR2(50),
  gen_grid     VARCHAR2(50),
  sentence     VARCHAR2(50),
  ruling_organ VARCHAR2(50),
  ruling_date  DATE,
  pri_pnsm     VARCHAR2(50),
  add_pnsm     VARCHAR2(50),
  main_charges VARCHAR2(50),
  cc_starttime DATE,
  cc_endtime   DATE,
  curr_post    VARCHAR2(50),
  curr_type    VARCHAR2(50),
  fm_unit      VARCHAR2(50),
  fm_post      VARCHAR2(50),
  curr_unit    VARCHAR2(50),
  cri_fact     VARCHAR2(50),
  mng_status   VARCHAR2(50),
  tube_perf    VARCHAR2(50),
  nvist_time   DATE,
  ec_cyle      VARCHAR2(50),
  pop_go       VARCHAR2(50),
  time         DATE,
  sort_id      NUMBER,
  bus_date     DATE
)
;
comment on table SRC0117_POP_RECTIFICATION_BAK
  is '矫正人员信息';
comment on column SRC0117_POP_RECTIFICATION_BAK.pop_name
  is '姓名';
comment on column SRC0117_POP_RECTIFICATION_BAK.account_no
  is '身份证号码';
comment on column SRC0117_POP_RECTIFICATION_BAK.gen_grid
  is '所属网格';
comment on column SRC0117_POP_RECTIFICATION_BAK.sentence
  is '判决或裁定书';
comment on column SRC0117_POP_RECTIFICATION_BAK.ruling_organ
  is '判决或裁定机关';
comment on column SRC0117_POP_RECTIFICATION_BAK.ruling_date
  is '判决或裁定日期';
comment on column SRC0117_POP_RECTIFICATION_BAK.pri_pnsm
  is '主刑';
comment on column SRC0117_POP_RECTIFICATION_BAK.add_pnsm
  is '附加刑';
comment on column SRC0117_POP_RECTIFICATION_BAK.main_charges
  is '主要罪名';
comment on column SRC0117_POP_RECTIFICATION_BAK.cc_starttime
  is '社区矫正开始时间';
comment on column SRC0117_POP_RECTIFICATION_BAK.cc_endtime
  is '社区矫正结束时间';
comment on column SRC0117_POP_RECTIFICATION_BAK.curr_post
  is '现职务';
comment on column SRC0117_POP_RECTIFICATION_BAK.curr_type
  is '矫正类型';
comment on column SRC0117_POP_RECTIFICATION_BAK.fm_unit
  is '原单位';
comment on column SRC0117_POP_RECTIFICATION_BAK.fm_post
  is '原职务';
comment on column SRC0117_POP_RECTIFICATION_BAK.curr_unit
  is '现单位';
comment on column SRC0117_POP_RECTIFICATION_BAK.cri_fact
  is '犯罪事实';
comment on column SRC0117_POP_RECTIFICATION_BAK.mng_status
  is '管理情况';
comment on column SRC0117_POP_RECTIFICATION_BAK.tube_perf
  is '列管表现';
comment on column SRC0117_POP_RECTIFICATION_BAK.nvist_time
  is '下次走访时间';
comment on column SRC0117_POP_RECTIFICATION_BAK.ec_cyle
  is '执行周期';
comment on column SRC0117_POP_RECTIFICATION_BAK.pop_go
  is '人员去向';
comment on column SRC0117_POP_RECTIFICATION_BAK.time
  is '更新时间';
comment on column SRC0117_POP_RECTIFICATION_BAK.sort_id
  is '排序';
comment on column SRC0117_POP_RECTIFICATION_BAK.bus_date
  is '业务日期';

prompt
prompt Creating table SRC0117_POP_SEV_MEN_PAT
prompt ======================================
prompt
create table SRC0117_POP_SEV_MEN_PAT
(
  pop_name    VARCHAR2(50),
  account_no  VARCHAR2(50),
  gen_grid    VARCHAR2(50),
  ill_name    VARCHAR2(50),
  criticality VARCHAR2(50),
  iscure      VARCHAR2(50),
  fre_onset   VARCHAR2(50),
  ltime_onset VARCHAR2(50),
  tend_viol   VARCHAR2(50),
  econ_sita   VARCHAR2(50),
  ec_cyle     VARCHAR2(50),
  visttime    DATE,
  time        DATE,
  sort_id     NUMBER
)
;
comment on table SRC0117_POP_SEV_MEN_PAT
  is '重症精神病人信息表';
comment on column SRC0117_POP_SEV_MEN_PAT.pop_name
  is '姓名';
comment on column SRC0117_POP_SEV_MEN_PAT.account_no
  is '身份证号码';
comment on column SRC0117_POP_SEV_MEN_PAT.gen_grid
  is '所属网格';
comment on column SRC0117_POP_SEV_MEN_PAT.ill_name
  is '精神病名';
comment on column SRC0117_POP_SEV_MEN_PAT.criticality
  is '危险程度';
comment on column SRC0117_POP_SEV_MEN_PAT.iscure
  is '是否接受治疗';
comment on column SRC0117_POP_SEV_MEN_PAT.fre_onset
  is '发病频度';
comment on column SRC0117_POP_SEV_MEN_PAT.ltime_onset
  is '上次发病时间';
comment on column SRC0117_POP_SEV_MEN_PAT.tend_viol
  is '是否有暴力倾向';
comment on column SRC0117_POP_SEV_MEN_PAT.econ_sita
  is '家庭经济状况';
comment on column SRC0117_POP_SEV_MEN_PAT.ec_cyle
  is '执行周期';
comment on column SRC0117_POP_SEV_MEN_PAT.visttime
  is '下次走访时间';
comment on column SRC0117_POP_SEV_MEN_PAT.time
  is '更新时间';
comment on column SRC0117_POP_SEV_MEN_PAT.sort_id
  is '排序';

prompt
prompt Creating table SRC0117_POP_SEV_MEN_PAT_BAK
prompt ==========================================
prompt
create table SRC0117_POP_SEV_MEN_PAT_BAK
(
  pop_name    VARCHAR2(50),
  account_no  VARCHAR2(50),
  gen_grid    VARCHAR2(50),
  ill_name    VARCHAR2(50),
  criticality VARCHAR2(50),
  iscure      VARCHAR2(50),
  fre_onset   VARCHAR2(50),
  ltime_onset VARCHAR2(50),
  tend_viol   VARCHAR2(50),
  econ_sita   VARCHAR2(50),
  ec_cyle     VARCHAR2(50),
  visttime    DATE,
  time        DATE,
  sort_id     NUMBER,
  bus_date    DATE
)
;
comment on table SRC0117_POP_SEV_MEN_PAT_BAK
  is '重症精神病人信息表';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.pop_name
  is '姓名';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.account_no
  is '身份证号码';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.gen_grid
  is '所属网格';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.ill_name
  is '精神病名';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.criticality
  is '危险程度';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.iscure
  is '是否接受治疗';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.fre_onset
  is '发病频度';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.ltime_onset
  is '上次发病时间';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.tend_viol
  is '是否有暴力倾向';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.econ_sita
  is '家庭经济状况';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.ec_cyle
  is '执行周期';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.visttime
  is '下次走访时间';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.time
  is '更新时间';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.sort_id
  is '排序';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.bus_date
  is '业务日期';

prompt
prompt Creating table SRC0117_POP_SHIKENG
prompt ==================================
prompt
create table SRC0117_POP_SHIKENG
(
  gen_grid      VARCHAR2(50),
  jur_area      VARCHAR2(50),
  jur_code      VARCHAR2(50),
  mng_type      VARCHAR2(50),
  pop_type      VARCHAR2(50),
  fam_num       VARCHAR2(50),
  home_addr     VARCHAR2(100),
  fix_ttl       VARCHAR2(50),
  mb_phone      VARCHAR2(50),
  rel_hsh       VARCHAR2(50),
  hsh_status    VARCHAR2(50),
  pop_name      VARCHAR2(50),
  pop_sex       VARCHAR2(50),
  birthday      DATE,
  dom_type      VARCHAR2(50),
  account_no    VARCHAR2(100),
  nation        VARCHAR2(50),
  deg_edu       VARCHAR2(50),
  occupation    VARCHAR2(50),
  work_unit     VARCHAR2(50),
  reg_code      VARCHAR2(50),
  domicile      VARCHAR2(500),
  hs_tel        VARCHAR2(50),
  isonlychild   VARCHAR2(50),
  office_tel    VARCHAR2(50),
  fa_name       VARCHAR2(50),
  ma_name       VARCHAR2(50),
  mar_status    VARCHAR2(50),
  mar_date      DATE,
  spouse_name   VARCHAR2(50),
  spouse_birth  DATE,
  spouse_no     VARCHAR2(50),
  child_num     VARCHAR2(20),
  boy_num       VARCHAR2(20),
  girl_num      VARCHAR2(20),
  issue_date    DATE,
  discipline    VARCHAR2(20),
  ctp_mea       VARCHAR2(50),
  cont_date     DATE,
  cont_note     VARCHAR2(100),
  is_wmcheck    VARCHAR2(20),
  isglo_cer     VARCHAR2(50),
  current_addr  VARCHAR2(100),
  landlord_name VARCHAR2(50),
  landlord_id   VARCHAR2(50),
  isspouse_loc  VARCHAR2(50),
  spouse_dom    VARCHAR2(50),
  pop_status    VARCHAR2(50),
  pop_ctg       VARCHAR2(50),
  obtain_date   DATE,
  exit_date     DATE,
  reg_date      DATE,
  leave_date    DATE,
  height        VARCHAR2(50),
  form_name     VARCHAR2(50),
  occu_type     VARCHAR2(50),
  pol_visage    VARCHAR2(50),
  note          VARCHAR2(500),
  rel_beli      VARCHAR2(50),
  nationality   VARCHAR2(50),
  time          DATE,
  sort_id       NUMBER
)
;
comment on table SRC0117_POP_SHIKENG
  is '石坑人口信息';
comment on column SRC0117_POP_SHIKENG.gen_grid
  is '所属网格';
comment on column SRC0117_POP_SHIKENG.jur_area
  is '管辖区域';
comment on column SRC0117_POP_SHIKENG.jur_code
  is '管辖区域代码';
comment on column SRC0117_POP_SHIKENG.mng_type
  is '管理类型';
comment on column SRC0117_POP_SHIKENG.pop_type
  is '人口类型';
comment on column SRC0117_POP_SHIKENG.fam_num
  is '家庭编号';
comment on column SRC0117_POP_SHIKENG.home_addr
  is '家庭地址';
comment on column SRC0117_POP_SHIKENG.fix_ttl
  is '固定电话';
comment on column SRC0117_POP_SHIKENG.mb_phone
  is '移动电话';
comment on column SRC0117_POP_SHIKENG.rel_hsh
  is '与户主关系';
comment on column SRC0117_POP_SHIKENG.hsh_status
  is '人户状态';
comment on column SRC0117_POP_SHIKENG.pop_name
  is '姓名';
comment on column SRC0117_POP_SHIKENG.pop_sex
  is '性别';
comment on column SRC0117_POP_SHIKENG.birthday
  is '出生日期';
comment on column SRC0117_POP_SHIKENG.dom_type
  is '证件类型';
comment on column SRC0117_POP_SHIKENG.account_no
  is '证件号';
comment on column SRC0117_POP_SHIKENG.nation
  is '民族';
comment on column SRC0117_POP_SHIKENG.deg_edu
  is '文化程度';
comment on column SRC0117_POP_SHIKENG.occupation
  is '职业';
comment on column SRC0117_POP_SHIKENG.work_unit
  is '工作单位';
comment on column SRC0117_POP_SHIKENG.reg_code
  is '户籍地代码';
comment on column SRC0117_POP_SHIKENG.domicile
  is '户籍地';
comment on column SRC0117_POP_SHIKENG.hs_tel
  is '户籍地联系电话';
comment on column SRC0117_POP_SHIKENG.isonlychild
  is '是否独子';
comment on column SRC0117_POP_SHIKENG.office_tel
  is '办公电话';
comment on column SRC0117_POP_SHIKENG.fa_name
  is '父亲姓名';
comment on column SRC0117_POP_SHIKENG.ma_name
  is '母亲姓名';
comment on column SRC0117_POP_SHIKENG.mar_status
  is '婚姻状况';
comment on column SRC0117_POP_SHIKENG.mar_date
  is '婚姻日期';
comment on column SRC0117_POP_SHIKENG.spouse_name
  is '配偶名字';
comment on column SRC0117_POP_SHIKENG.spouse_birth
  is '配偶出生日期';
comment on column SRC0117_POP_SHIKENG.spouse_no
  is '配偶身份证';
comment on column SRC0117_POP_SHIKENG.child_num
  is '现孩数';
comment on column SRC0117_POP_SHIKENG.boy_num
  is '现男孩数';
comment on column SRC0117_POP_SHIKENG.girl_num
  is '现女孩数';
comment on column SRC0117_POP_SHIKENG.issue_date
  is '发证日期';
comment on column SRC0117_POP_SHIKENG.discipline
  is '是否违纪';
comment on column SRC0117_POP_SHIKENG.ctp_mea
  is '节育措施';
comment on column SRC0117_POP_SHIKENG.cont_date
  is '节育日期';
comment on column SRC0117_POP_SHIKENG.cont_note
  is '节育备注';
comment on column SRC0117_POP_SHIKENG.is_wmcheck
  is '是否需要妇检';
comment on column SRC0117_POP_SHIKENG.isglo_cer
  is '有无光荣证';
comment on column SRC0117_POP_SHIKENG.current_addr
  is '现居住地址';
comment on column SRC0117_POP_SHIKENG.landlord_name
  is '房东姓名';
comment on column SRC0117_POP_SHIKENG.landlord_id
  is '房东身份证';
comment on column SRC0117_POP_SHIKENG.isspouse_loc
  is '配偶是否本地';
comment on column SRC0117_POP_SHIKENG.spouse_dom
  is '配偶户籍地';
comment on column SRC0117_POP_SHIKENG.pop_status
  is '人员状态';
comment on column SRC0117_POP_SHIKENG.pop_ctg
  is '人员类别';
comment on column SRC0117_POP_SHIKENG.obtain_date
  is '入户时间';
comment on column SRC0117_POP_SHIKENG.exit_date
  is '出户时间';
comment on column SRC0117_POP_SHIKENG.reg_date
  is '登记日期';
comment on column SRC0117_POP_SHIKENG.leave_date
  is '离籍时间';
comment on column SRC0117_POP_SHIKENG.height
  is '身高';
comment on column SRC0117_POP_SHIKENG.form_name
  is '曾用名';
comment on column SRC0117_POP_SHIKENG.occu_type
  is '职业类别';
comment on column SRC0117_POP_SHIKENG.pol_visage
  is '政治面貌';
comment on column SRC0117_POP_SHIKENG.note
  is '备注';
comment on column SRC0117_POP_SHIKENG.rel_beli
  is '宗教信仰';
comment on column SRC0117_POP_SHIKENG.nationality
  is '国籍';
comment on column SRC0117_POP_SHIKENG.time
  is '更新时间';
comment on column SRC0117_POP_SHIKENG.sort_id
  is '排序';

prompt
prompt Creating table SRC0117_POP_SHIKENG_BAK
prompt ======================================
prompt
create table SRC0117_POP_SHIKENG_BAK
(
  gen_grid      VARCHAR2(50),
  jur_area      VARCHAR2(50),
  jur_code      VARCHAR2(50),
  mng_type      VARCHAR2(50),
  pop_type      VARCHAR2(50),
  fam_num       VARCHAR2(50),
  home_addr     VARCHAR2(100),
  fix_ttl       VARCHAR2(50),
  mb_phone      VARCHAR2(50),
  rel_hsh       VARCHAR2(50),
  hsh_status    VARCHAR2(50),
  pop_name      VARCHAR2(50),
  pop_sex       VARCHAR2(50),
  birthday      DATE,
  dom_type      VARCHAR2(50),
  account_no    VARCHAR2(100),
  nation        VARCHAR2(50),
  deg_edu       VARCHAR2(50),
  occupation    VARCHAR2(50),
  work_unit     VARCHAR2(50),
  reg_code      VARCHAR2(50),
  domicile      VARCHAR2(500),
  hs_tel        VARCHAR2(50),
  isonlychild   VARCHAR2(50),
  office_tel    VARCHAR2(50),
  fa_name       VARCHAR2(50),
  ma_name       VARCHAR2(50),
  mar_status    VARCHAR2(50),
  mar_date      DATE,
  spouse_name   VARCHAR2(50),
  spouse_birth  DATE,
  spouse_no     VARCHAR2(50),
  child_num     VARCHAR2(20),
  boy_num       VARCHAR2(20),
  girl_num      VARCHAR2(20),
  issue_date    DATE,
  discipline    VARCHAR2(20),
  ctp_mea       VARCHAR2(50),
  cont_date     DATE,
  cont_note     VARCHAR2(100),
  is_wmcheck    VARCHAR2(20),
  isglo_cer     VARCHAR2(50),
  current_addr  VARCHAR2(100),
  landlord_name VARCHAR2(50),
  landlord_id   VARCHAR2(50),
  isspouse_loc  VARCHAR2(50),
  spouse_dom    VARCHAR2(50),
  pop_status    VARCHAR2(50),
  pop_ctg       VARCHAR2(50),
  obtain_date   DATE,
  exit_date     DATE,
  reg_date      DATE,
  leave_date    DATE,
  height        VARCHAR2(50),
  form_name     VARCHAR2(50),
  occu_type     VARCHAR2(50),
  pol_visage    VARCHAR2(50),
  note          VARCHAR2(500),
  rel_beli      VARCHAR2(50),
  nationality   VARCHAR2(50),
  time          DATE,
  sort_id       NUMBER,
  bus_date      DATE
)
;
comment on table SRC0117_POP_SHIKENG_BAK
  is '石坑人口信息';
comment on column SRC0117_POP_SHIKENG_BAK.gen_grid
  is '所属网格';
comment on column SRC0117_POP_SHIKENG_BAK.jur_area
  is '管辖区域';
comment on column SRC0117_POP_SHIKENG_BAK.jur_code
  is '管辖区域代码';
comment on column SRC0117_POP_SHIKENG_BAK.mng_type
  is '管理类型';
comment on column SRC0117_POP_SHIKENG_BAK.pop_type
  is '人口类型';
comment on column SRC0117_POP_SHIKENG_BAK.fam_num
  is '家庭编号';
comment on column SRC0117_POP_SHIKENG_BAK.home_addr
  is '家庭地址';
comment on column SRC0117_POP_SHIKENG_BAK.fix_ttl
  is '固定电话';
comment on column SRC0117_POP_SHIKENG_BAK.mb_phone
  is '移动电话';
comment on column SRC0117_POP_SHIKENG_BAK.rel_hsh
  is '与户主关系';
comment on column SRC0117_POP_SHIKENG_BAK.hsh_status
  is '人户状态';
comment on column SRC0117_POP_SHIKENG_BAK.pop_name
  is '姓名';
comment on column SRC0117_POP_SHIKENG_BAK.pop_sex
  is '性别';
comment on column SRC0117_POP_SHIKENG_BAK.birthday
  is '出生日期';
comment on column SRC0117_POP_SHIKENG_BAK.dom_type
  is '证件类型';
comment on column SRC0117_POP_SHIKENG_BAK.account_no
  is '证件号';
comment on column SRC0117_POP_SHIKENG_BAK.nation
  is '民族';
comment on column SRC0117_POP_SHIKENG_BAK.deg_edu
  is '文化程度';
comment on column SRC0117_POP_SHIKENG_BAK.occupation
  is '职业';
comment on column SRC0117_POP_SHIKENG_BAK.work_unit
  is '工作单位';
comment on column SRC0117_POP_SHIKENG_BAK.reg_code
  is '户籍地代码';
comment on column SRC0117_POP_SHIKENG_BAK.domicile
  is '户籍地';
comment on column SRC0117_POP_SHIKENG_BAK.hs_tel
  is '户籍地联系电话';
comment on column SRC0117_POP_SHIKENG_BAK.isonlychild
  is '是否独子';
comment on column SRC0117_POP_SHIKENG_BAK.office_tel
  is '办公电话';
comment on column SRC0117_POP_SHIKENG_BAK.fa_name
  is '父亲姓名';
comment on column SRC0117_POP_SHIKENG_BAK.ma_name
  is '母亲姓名';
comment on column SRC0117_POP_SHIKENG_BAK.mar_status
  is '婚姻状况';
comment on column SRC0117_POP_SHIKENG_BAK.mar_date
  is '婚姻日期';
comment on column SRC0117_POP_SHIKENG_BAK.spouse_name
  is '配偶名字';
comment on column SRC0117_POP_SHIKENG_BAK.spouse_birth
  is '配偶出生日期';
comment on column SRC0117_POP_SHIKENG_BAK.spouse_no
  is '配偶身份证';
comment on column SRC0117_POP_SHIKENG_BAK.child_num
  is '现孩数';
comment on column SRC0117_POP_SHIKENG_BAK.boy_num
  is '现男孩数';
comment on column SRC0117_POP_SHIKENG_BAK.girl_num
  is '现女孩数';
comment on column SRC0117_POP_SHIKENG_BAK.issue_date
  is '发证日期';
comment on column SRC0117_POP_SHIKENG_BAK.discipline
  is '是否违纪';
comment on column SRC0117_POP_SHIKENG_BAK.ctp_mea
  is '节育措施';
comment on column SRC0117_POP_SHIKENG_BAK.cont_date
  is '节育日期';
comment on column SRC0117_POP_SHIKENG_BAK.cont_note
  is '节育备注';
comment on column SRC0117_POP_SHIKENG_BAK.is_wmcheck
  is '是否需要妇检';
comment on column SRC0117_POP_SHIKENG_BAK.isglo_cer
  is '有无光荣证';
comment on column SRC0117_POP_SHIKENG_BAK.current_addr
  is '现居住地址';
comment on column SRC0117_POP_SHIKENG_BAK.landlord_name
  is '房东姓名';
comment on column SRC0117_POP_SHIKENG_BAK.landlord_id
  is '房东身份证';
comment on column SRC0117_POP_SHIKENG_BAK.isspouse_loc
  is '配偶是否本地';
comment on column SRC0117_POP_SHIKENG_BAK.spouse_dom
  is '配偶户籍地';
comment on column SRC0117_POP_SHIKENG_BAK.pop_status
  is '人员状态';
comment on column SRC0117_POP_SHIKENG_BAK.pop_ctg
  is '人员类别';
comment on column SRC0117_POP_SHIKENG_BAK.obtain_date
  is '入户时间';
comment on column SRC0117_POP_SHIKENG_BAK.exit_date
  is '出户时间';
comment on column SRC0117_POP_SHIKENG_BAK.reg_date
  is '登记日期';
comment on column SRC0117_POP_SHIKENG_BAK.leave_date
  is '离籍时间';
comment on column SRC0117_POP_SHIKENG_BAK.height
  is '身高';
comment on column SRC0117_POP_SHIKENG_BAK.form_name
  is '曾用名';
comment on column SRC0117_POP_SHIKENG_BAK.occu_type
  is '职业类别';
comment on column SRC0117_POP_SHIKENG_BAK.pol_visage
  is '政治面貌';
comment on column SRC0117_POP_SHIKENG_BAK.note
  is '备注';
comment on column SRC0117_POP_SHIKENG_BAK.rel_beli
  is '宗教信仰';
comment on column SRC0117_POP_SHIKENG_BAK.nationality
  is '国籍';
comment on column SRC0117_POP_SHIKENG_BAK.time
  is '更新时间';
comment on column SRC0117_POP_SHIKENG_BAK.sort_id
  is '排序';
comment on column SRC0117_POP_SHIKENG_BAK.bus_date
  is '业务日期';

prompt
prompt Creating table SRC0118_REALTY_SALE_M
prompt ====================================
prompt
create table SRC0118_REALTY_SALE_M
(
  region       VARCHAR2(50),
  investment   VARCHAR2(50),
  cig_rate     NUMBER(9,2),
  chs_area     NUMBER(9,2),
  chs_rate     NUMBER(9,2),
  sale_area    NUMBER(9,2),
  crstg_rate   NUMBER(9,2),
  shht_area    NUMBER(9,2),
  shht_rate    NUMBER(9,2),
  srht_area    NUMBER(9,2),
  srht_rate    NUMBER(9,2),
  mreit_area   NUMBER(9,2),
  mreit_cycle  NUMBER,
  mrhit_area   NUMBER(9,2),
  mrhit_cycle  NUMBER,
  mnrhit_area  NUMBER(9,2),
  mnrhit_cycle NUMBER,
  mcreit_area  NUMBER(9,2),
  mcreit_cycle NUMBER,
  moreit_area  NUMBER(9,2),
  moreit_cycle NUMBER,
  input_date   VARCHAR2(30),
  time         DATE,
  sort_id      NUMBER(9,2)
)
;
comment on table SRC0118_REALTY_SALE_M
  is '房地产数据销售汇总表';
comment on column SRC0118_REALTY_SALE_M.region
  is '地区';
comment on column SRC0118_REALTY_SALE_M.investment
  is '本年度完成投资';
comment on column SRC0118_REALTY_SALE_M.cig_rate
  is '本年度完成投资同比增长率 ';
comment on column SRC0118_REALTY_SALE_M.chs_area
  is '商品房销售总面积';
comment on column SRC0118_REALTY_SALE_M.chs_rate
  is '商品房销售总面积同比增长率';
comment on column SRC0118_REALTY_SALE_M.sale_area
  is '商品住宅房销售总面积';
comment on column SRC0118_REALTY_SALE_M.crstg_rate
  is '商品住宅房销售总面积同比增长率';
comment on column SRC0118_REALTY_SALE_M.shht_area
  is '二手房交易总面积';
comment on column SRC0118_REALTY_SALE_M.shht_rate
  is '二手房交易总面积同比增长率';
comment on column SRC0118_REALTY_SALE_M.srht_area
  is '二手住宅房交易总面积';
comment on column SRC0118_REALTY_SALE_M.srht_rate
  is '二手住宅房交易总面积同比增长率';
comment on column SRC0118_REALTY_SALE_M.mreit_area
  is '市场房地产库存总面积';
comment on column SRC0118_REALTY_SALE_M.mreit_cycle
  is '市场房地产库存总面积去化周期';
comment on column SRC0118_REALTY_SALE_M.mrhit_area
  is '市场住宅房库存总面积';
comment on column SRC0118_REALTY_SALE_M.mrhit_cycle
  is '市场住宅房库存总面积去化周期';
comment on column SRC0118_REALTY_SALE_M.mnrhit_area
  is '市场非住宅房库存总面积';
comment on column SRC0118_REALTY_SALE_M.mnrhit_cycle
  is '市场非住宅房库存总面积去化周期';
comment on column SRC0118_REALTY_SALE_M.mcreit_area
  is '市场商业房地产库存总面积';
comment on column SRC0118_REALTY_SALE_M.mcreit_cycle
  is '市场商业房地产库存总面积去化周期';
comment on column SRC0118_REALTY_SALE_M.moreit_area
  is '市场办公房地产库存总面积';
comment on column SRC0118_REALTY_SALE_M.moreit_cycle
  is '市场办公房地产库存总面积去化周期';
comment on column SRC0118_REALTY_SALE_M.input_date
  is '年月';
comment on column SRC0118_REALTY_SALE_M.time
  is '更新时间';
comment on column SRC0118_REALTY_SALE_M.sort_id
  is '排序';

prompt
prompt Creating table SRC0126_CORP_INFO
prompt ================================
prompt
create table SRC0126_CORP_INFO
(
  state        VARCHAR2(50),
  reg_num      VARCHAR2(50) not null,
  usc_code     VARCHAR2(50),
  mer_name     VARCHAR2(100),
  etp_ctg      VARCHAR2(50),
  reg_type     VARCHAR2(50),
  etp_type     VARCHAR2(50),
  legal        VARCHAR2(50),
  reg_capital  NUMBER,
  paid_capital NUMBER,
  operator_tel VARCHAR2(50),
  liaison      VARCHAR2(50),
  liaison_tel  VARCHAR2(50),
  idt_ctgr     VARCHAR2(50),
  trade_type   VARCHAR2(50),
  trade_code   VARCHAR2(20),
  bus_scope    VARCHAR2(1000),
  esta_date    DATE,
  bus_term     VARCHAR2(50),
  appr_date    DATE,
  dst_county   VARCHAR2(50),
  county_code  VARCHAR2(50),
  postcode     VARCHAR2(50),
  residence    VARCHAR2(100),
  reg_dpt      VARCHAR2(225),
  area_tib     VARCHAR2(50),
  terr_tib     VARCHAR2(50),
  district     VARCHAR2(50),
  logout_date  DATE,
  cancell_rea  VARCHAR2(50),
  reve_date    DATE,
  reve_rea     VARCHAR2(50),
  time         DATE
)
;
comment on table SRC0126_CORP_INFO
  is '内资主体查询清单表';
comment on column SRC0126_CORP_INFO.state
  is '状态';
comment on column SRC0126_CORP_INFO.reg_num
  is '注册号';
comment on column SRC0126_CORP_INFO.usc_code
  is '统一社会信用代码';
comment on column SRC0126_CORP_INFO.mer_name
  is '登记名称';
comment on column SRC0126_CORP_INFO.etp_ctg
  is '企业类别';
comment on column SRC0126_CORP_INFO.reg_type
  is '登记类型';
comment on column SRC0126_CORP_INFO.etp_type
  is '企业类型';
comment on column SRC0126_CORP_INFO.legal
  is '法定代表人\负责人';
comment on column SRC0126_CORP_INFO.reg_capital
  is '注册资本(万元)';
comment on column SRC0126_CORP_INFO.paid_capital
  is '实收资本(万元)';
comment on column SRC0126_CORP_INFO.operator_tel
  is '联系电话';
comment on column SRC0126_CORP_INFO.liaison
  is '公示联络员';
comment on column SRC0126_CORP_INFO.liaison_tel
  is '联络员电话';
comment on column SRC0126_CORP_INFO.idt_ctgr
  is '行业门类';
comment on column SRC0126_CORP_INFO.trade_type
  is '行业类别';
comment on column SRC0126_CORP_INFO.trade_code
  is '行业代码';
comment on column SRC0126_CORP_INFO.bus_scope
  is '经营范围';
comment on column SRC0126_CORP_INFO.esta_date
  is '成立日期';
comment on column SRC0126_CORP_INFO.bus_term
  is '营业期限';
comment on column SRC0126_CORP_INFO.appr_date
  is '核准日期';
comment on column SRC0126_CORP_INFO.dst_county
  is '区县';
comment on column SRC0126_CORP_INFO.county_code
  is '区县代码';
comment on column SRC0126_CORP_INFO.postcode
  is '邮政编码';
comment on column SRC0126_CORP_INFO.residence
  is '住所';
comment on column SRC0126_CORP_INFO.reg_dpt
  is '登记机关';
comment on column SRC0126_CORP_INFO.area_tib
  is '辖区工商局';
comment on column SRC0126_CORP_INFO.terr_tib
  is '管片工商所';
comment on column SRC0126_CORP_INFO.district
  is '片区';
comment on column SRC0126_CORP_INFO.logout_date
  is '注销日期';
comment on column SRC0126_CORP_INFO.cancell_rea
  is '注销原因';
comment on column SRC0126_CORP_INFO.reve_date
  is '吊销日期';
comment on column SRC0126_CORP_INFO.reve_rea
  is '吊销原因';
comment on column SRC0126_CORP_INFO.time
  is '时间戳';
alter table SRC0126_CORP_INFO
  add constraint SRC0126_CORP_INFO_PK primary key (REG_NUM);

prompt
prompt Creating table SRC0126_CORP_INFO_BAK
prompt ====================================
prompt
create table SRC0126_CORP_INFO_BAK
(
  state        VARCHAR2(50),
  reg_num      VARCHAR2(50) not null,
  usc_code     VARCHAR2(50),
  mer_name     VARCHAR2(100),
  etp_ctg      VARCHAR2(50),
  reg_type     VARCHAR2(50),
  etp_type     VARCHAR2(50),
  legal        VARCHAR2(50),
  reg_capital  NUMBER,
  paid_capital NUMBER,
  operator_tel VARCHAR2(50),
  liaison      VARCHAR2(50),
  liaison_tel  VARCHAR2(50),
  idt_ctgr     VARCHAR2(50),
  trade_type   VARCHAR2(50),
  trade_code   VARCHAR2(20),
  bus_scope    VARCHAR2(1000),
  esta_date    DATE,
  bus_term     VARCHAR2(50),
  appr_date    DATE,
  dst_county   VARCHAR2(50),
  county_code  VARCHAR2(50),
  postcode     VARCHAR2(50),
  residence    VARCHAR2(100),
  reg_dpt      VARCHAR2(225),
  area_tib     VARCHAR2(50),
  terr_tib     VARCHAR2(50),
  district     VARCHAR2(50),
  logout_date  DATE,
  cancell_rea  VARCHAR2(50),
  reve_date    DATE,
  reve_rea     VARCHAR2(50),
  time         DATE,
  bus_date     DATE
)
;
comment on table SRC0126_CORP_INFO_BAK
  is '内资主体查询清单表';
comment on column SRC0126_CORP_INFO_BAK.state
  is '状态';
comment on column SRC0126_CORP_INFO_BAK.reg_num
  is '注册号';
comment on column SRC0126_CORP_INFO_BAK.usc_code
  is '统一社会信用代码';
comment on column SRC0126_CORP_INFO_BAK.mer_name
  is '登记名称';
comment on column SRC0126_CORP_INFO_BAK.etp_ctg
  is '企业类别';
comment on column SRC0126_CORP_INFO_BAK.reg_type
  is '登记类型';
comment on column SRC0126_CORP_INFO_BAK.etp_type
  is '企业类型';
comment on column SRC0126_CORP_INFO_BAK.legal
  is '法定代表人\负责人';
comment on column SRC0126_CORP_INFO_BAK.reg_capital
  is '注册资本(万元)';
comment on column SRC0126_CORP_INFO_BAK.paid_capital
  is '实收资本(万元)';
comment on column SRC0126_CORP_INFO_BAK.operator_tel
  is '联系电话';
comment on column SRC0126_CORP_INFO_BAK.liaison
  is '公示联络员';
comment on column SRC0126_CORP_INFO_BAK.liaison_tel
  is '联络员电话';
comment on column SRC0126_CORP_INFO_BAK.idt_ctgr
  is '行业门类';
comment on column SRC0126_CORP_INFO_BAK.trade_type
  is '行业类别';
comment on column SRC0126_CORP_INFO_BAK.trade_code
  is '行业代码';
comment on column SRC0126_CORP_INFO_BAK.bus_scope
  is '经营范围';
comment on column SRC0126_CORP_INFO_BAK.esta_date
  is '成立日期';
comment on column SRC0126_CORP_INFO_BAK.bus_term
  is '营业期限';
comment on column SRC0126_CORP_INFO_BAK.appr_date
  is '核准日期';
comment on column SRC0126_CORP_INFO_BAK.dst_county
  is '区县';
comment on column SRC0126_CORP_INFO_BAK.county_code
  is '区县代码';
comment on column SRC0126_CORP_INFO_BAK.postcode
  is '邮政编码';
comment on column SRC0126_CORP_INFO_BAK.residence
  is '住所';
comment on column SRC0126_CORP_INFO_BAK.reg_dpt
  is '登记机关';
comment on column SRC0126_CORP_INFO_BAK.area_tib
  is '辖区工商局';
comment on column SRC0126_CORP_INFO_BAK.terr_tib
  is '管片工商所';
comment on column SRC0126_CORP_INFO_BAK.district
  is '片区';
comment on column SRC0126_CORP_INFO_BAK.logout_date
  is '注销日期';
comment on column SRC0126_CORP_INFO_BAK.cancell_rea
  is '注销原因';
comment on column SRC0126_CORP_INFO_BAK.reve_date
  is '吊销日期';
comment on column SRC0126_CORP_INFO_BAK.reve_rea
  is '吊销原因';
comment on column SRC0126_CORP_INFO_BAK.time
  is '时间戳';
comment on column SRC0126_CORP_INFO_BAK.bus_date
  is '业务日期';
alter table SRC0126_CORP_INFO_BAK
  add constraint SRC0126_CORP_INFO_BAK_PK primary key (REG_NUM);

prompt
prompt Creating table SRC0126_INDIV_INFO
prompt =================================
prompt
create table SRC0126_INDIV_INFO
(
  state        VARCHAR2(50),
  reg_num      VARCHAR2(50) not null,
  mer_name     VARCHAR2(50),
  form         VARCHAR2(50),
  money        NUMBER,
  dst_county   VARCHAR2(50),
  county_code  VARCHAR2(20),
  bus_place    VARCHAR2(220),
  idt_ctgr     VARCHAR2(50),
  trade_type   VARCHAR2(50),
  trade_code   VARCHAR2(50),
  bus_scope    VARCHAR2(1000),
  operator     VARCHAR2(50),
  operator_tel VARCHAR2(50),
  liaison      VARCHAR2(20),
  liaison_tel  VARCHAR2(50),
  open_date    DATE,
  appr_date    DATE,
  reg_dpt      VARCHAR2(50),
  area_tib     VARCHAR2(50),
  terr_tib     VARCHAR2(50),
  district     VARCHAR2(20),
  logout_date  DATE,
  cancell_rea  VARCHAR2(50),
  reve_date    DATE,
  reve_rea     VARCHAR2(50),
  file_no      VARCHAR2(50),
  time         DATE
)
;
comment on table SRC0126_INDIV_INFO
  is '个体主体查询清单表';
comment on column SRC0126_INDIV_INFO.state
  is '状态';
comment on column SRC0126_INDIV_INFO.reg_num
  is '注册号';
comment on column SRC0126_INDIV_INFO.mer_name
  is '名称';
comment on column SRC0126_INDIV_INFO.form
  is '组成形式';
comment on column SRC0126_INDIV_INFO.money
  is '资金数额(万元)';
comment on column SRC0126_INDIV_INFO.dst_county
  is '区县';
comment on column SRC0126_INDIV_INFO.county_code
  is '区县代码';
comment on column SRC0126_INDIV_INFO.bus_place
  is '经营场所';
comment on column SRC0126_INDIV_INFO.idt_ctgr
  is '行业门类';
comment on column SRC0126_INDIV_INFO.trade_type
  is '行业类别';
comment on column SRC0126_INDIV_INFO.trade_code
  is '行业代码';
comment on column SRC0126_INDIV_INFO.bus_scope
  is '经营范围';
comment on column SRC0126_INDIV_INFO.operator
  is '经营者';
comment on column SRC0126_INDIV_INFO.operator_tel
  is '联系电话';
comment on column SRC0126_INDIV_INFO.liaison
  is '公示联络员';
comment on column SRC0126_INDIV_INFO.liaison_tel
  is '联络员电话';
comment on column SRC0126_INDIV_INFO.open_date
  is '开业日期';
comment on column SRC0126_INDIV_INFO.appr_date
  is '核准日期';
comment on column SRC0126_INDIV_INFO.reg_dpt
  is '登记机关';
comment on column SRC0126_INDIV_INFO.area_tib
  is '辖区工商局';
comment on column SRC0126_INDIV_INFO.terr_tib
  is '属地工商所';
comment on column SRC0126_INDIV_INFO.district
  is '片区';
comment on column SRC0126_INDIV_INFO.logout_date
  is '注销日期';
comment on column SRC0126_INDIV_INFO.cancell_rea
  is '注销原因';
comment on column SRC0126_INDIV_INFO.reve_date
  is '吊销日期';
comment on column SRC0126_INDIV_INFO.reve_rea
  is '吊销原因';
comment on column SRC0126_INDIV_INFO.file_no
  is '档案号';
comment on column SRC0126_INDIV_INFO.time
  is '时间戳';
alter table SRC0126_INDIV_INFO
  add constraint SRC0126_INDIV_INFO_PK primary key (REG_NUM);

prompt
prompt Creating table SRC0126_INDIV_INFO_BAK
prompt =====================================
prompt
create table SRC0126_INDIV_INFO_BAK
(
  state        VARCHAR2(50),
  reg_num      VARCHAR2(50) not null,
  mer_name     VARCHAR2(50),
  form         VARCHAR2(50),
  money        NUMBER,
  dst_county   VARCHAR2(50),
  county_code  VARCHAR2(20),
  bus_place    VARCHAR2(220),
  idt_ctgr     VARCHAR2(50),
  trade_type   VARCHAR2(50),
  trade_code   VARCHAR2(50),
  bus_scope    VARCHAR2(1000),
  operator     VARCHAR2(50),
  operator_tel VARCHAR2(50),
  liaison      VARCHAR2(20),
  liaison_tel  VARCHAR2(50),
  open_date    DATE,
  appr_date    DATE,
  reg_dpt      VARCHAR2(50),
  area_tib     VARCHAR2(50),
  terr_tib     VARCHAR2(50),
  district     VARCHAR2(20),
  logout_date  DATE,
  cancell_rea  VARCHAR2(50),
  reve_date    DATE,
  reve_rea     VARCHAR2(50),
  file_no      VARCHAR2(50),
  time         DATE,
  bus_date     DATE
)
;
comment on table SRC0126_INDIV_INFO_BAK
  is '个体主体查询清单表';
comment on column SRC0126_INDIV_INFO_BAK.state
  is '状态';
comment on column SRC0126_INDIV_INFO_BAK.reg_num
  is '注册号';
comment on column SRC0126_INDIV_INFO_BAK.mer_name
  is '名称';
comment on column SRC0126_INDIV_INFO_BAK.form
  is '组成形式';
comment on column SRC0126_INDIV_INFO_BAK.money
  is '资金数额(万元)';
comment on column SRC0126_INDIV_INFO_BAK.dst_county
  is '区县';
comment on column SRC0126_INDIV_INFO_BAK.county_code
  is '区县代码';
comment on column SRC0126_INDIV_INFO_BAK.bus_place
  is '经营场所';
comment on column SRC0126_INDIV_INFO_BAK.idt_ctgr
  is '行业门类';
comment on column SRC0126_INDIV_INFO_BAK.trade_type
  is '行业类别';
comment on column SRC0126_INDIV_INFO_BAK.trade_code
  is '行业代码';
comment on column SRC0126_INDIV_INFO_BAK.bus_scope
  is '经营范围';
comment on column SRC0126_INDIV_INFO_BAK.operator
  is '经营者';
comment on column SRC0126_INDIV_INFO_BAK.operator_tel
  is '联系电话';
comment on column SRC0126_INDIV_INFO_BAK.liaison
  is '公示联络员';
comment on column SRC0126_INDIV_INFO_BAK.liaison_tel
  is '联络员电话';
comment on column SRC0126_INDIV_INFO_BAK.open_date
  is '开业日期';
comment on column SRC0126_INDIV_INFO_BAK.appr_date
  is '核准日期';
comment on column SRC0126_INDIV_INFO_BAK.reg_dpt
  is '登记机关';
comment on column SRC0126_INDIV_INFO_BAK.area_tib
  is '辖区工商局';
comment on column SRC0126_INDIV_INFO_BAK.terr_tib
  is '属地工商所';
comment on column SRC0126_INDIV_INFO_BAK.district
  is '片区';
comment on column SRC0126_INDIV_INFO_BAK.logout_date
  is '注销日期';
comment on column SRC0126_INDIV_INFO_BAK.cancell_rea
  is '注销原因';
comment on column SRC0126_INDIV_INFO_BAK.reve_date
  is '吊销日期';
comment on column SRC0126_INDIV_INFO_BAK.reve_rea
  is '吊销原因';
comment on column SRC0126_INDIV_INFO_BAK.file_no
  is '档案号';
comment on column SRC0126_INDIV_INFO_BAK.time
  is '时间戳';
comment on column SRC0126_INDIV_INFO_BAK.bus_date
  is '业务日期';
alter table SRC0126_INDIV_INFO_BAK
  add constraint SRC0126_INDIV_INFO_BAK_PK primary key (REG_NUM);

prompt
prompt Creating table SRC0128_LANDTAX_BUS
prompt ==================================
prompt
create table SRC0128_LANDTAX_BUS
(
  soc_cre_code  VARCHAR2(300),
  landtax_name  VARCHAR2(300),
  taxp_state    VARCHAR2(300),
  levy_reg_typ  VARCHAR2(300),
  reg_type      VARCHAR2(300),
  natlan_tax    VARCHAR2(300),
  sub_rel       VARCHAR2(300),
  ind_cat       VARCHAR2(300),
  ind_cat_heig  VARCHAR2(300),
  ind_cat_mid   VARCHAR2(300),
  industry      VARCHAR2(300),
  reg_adr       VARCHAR2(300),
  bus_adr       VARCHAR2(300),
  lgp_name      VARCHAR2(50),
  lgp_idnum     VARCHAR2(50),
  reg_date      DATE,
  com_tax_aut   VARCHAR2(300),
  bus_sco       VARCHAR2(1000),
  reg_cap       NUMBER,
  agg_inv       NUMBER,
  app_est_off   VARCHAR2(300),
  lic_name      VARCHAR2(300),
  lic_code      VARCHAR2(300),
  open_date     DATE,
  bus_beg_time  DATE,
  bus_end_time  DATE,
  taxp_iden_num VARCHAR2(50),
  time          DATE,
  sort_id       NUMBER(5)
)
;
comment on table SRC0128_LANDTAX_BUS
  is '地税表';
comment on column SRC0128_LANDTAX_BUS.soc_cre_code
  is '社会信用代码（纳税人识别号）';
comment on column SRC0128_LANDTAX_BUS.landtax_name
  is '纳税人名称';
comment on column SRC0128_LANDTAX_BUS.taxp_state
  is '纳税人状态';
comment on column SRC0128_LANDTAX_BUS.levy_reg_typ
  is '课征主体登记类型';
comment on column SRC0128_LANDTAX_BUS.reg_type
  is '登记注册类型';
comment on column SRC0128_LANDTAX_BUS.natlan_tax
  is '国地管户类型';
comment on column SRC0128_LANDTAX_BUS.sub_rel
  is '单位隶属关系';
comment on column SRC0128_LANDTAX_BUS.ind_cat
  is '行业门类';
comment on column SRC0128_LANDTAX_BUS.ind_cat_heig
  is '行业大类';
comment on column SRC0128_LANDTAX_BUS.ind_cat_mid
  is '行业中类';
comment on column SRC0128_LANDTAX_BUS.industry
  is '行业';
comment on column SRC0128_LANDTAX_BUS.reg_adr
  is '注册地址';
comment on column SRC0128_LANDTAX_BUS.bus_adr
  is '生产经营地址';
comment on column SRC0128_LANDTAX_BUS.lgp_name
  is '法定代表人姓名';
comment on column SRC0128_LANDTAX_BUS.lgp_idnum
  is '法定代表人身份证号码';
comment on column SRC0128_LANDTAX_BUS.reg_date
  is '登记日期';
comment on column SRC0128_LANDTAX_BUS.com_tax_aut
  is '主管税务机关';
comment on column SRC0128_LANDTAX_BUS.bus_sco
  is '经营范围';
comment on column SRC0128_LANDTAX_BUS.reg_cap
  is '注册资本';
comment on column SRC0128_LANDTAX_BUS.agg_inv
  is '投资总额';
comment on column SRC0128_LANDTAX_BUS.app_est_off
  is '批准设立机关';
comment on column SRC0128_LANDTAX_BUS.lic_name
  is '证照名称';
comment on column SRC0128_LANDTAX_BUS.lic_code
  is '证照编号';
comment on column SRC0128_LANDTAX_BUS.open_date
  is '开业设立日期';
comment on column SRC0128_LANDTAX_BUS.bus_beg_time
  is '生产经营期限起';
comment on column SRC0128_LANDTAX_BUS.bus_end_time
  is '生产经营期限止';
comment on column SRC0128_LANDTAX_BUS.taxp_iden_num
  is '纳税人识别号';
comment on column SRC0128_LANDTAX_BUS.time
  is '时间戳';
comment on column SRC0128_LANDTAX_BUS.sort_id
  is '排序字段';

prompt
prompt Creating table SRC0128_LANDTAX_BUS_BAK
prompt ======================================
prompt
create table SRC0128_LANDTAX_BUS_BAK
(
  soc_cre_code  VARCHAR2(300),
  landtax_name  VARCHAR2(300),
  taxp_state    VARCHAR2(300),
  levy_reg_typ  VARCHAR2(300),
  reg_type      VARCHAR2(300),
  natlan_tax    VARCHAR2(300),
  sub_rel       VARCHAR2(300),
  ind_cat       VARCHAR2(300),
  ind_cat_heig  VARCHAR2(300),
  ind_cat_mid   VARCHAR2(300),
  industry      VARCHAR2(300),
  reg_adr       VARCHAR2(300),
  bus_adr       VARCHAR2(300),
  lgp_name      VARCHAR2(50),
  lgp_idnum     VARCHAR2(50),
  reg_date      DATE,
  com_tax_aut   VARCHAR2(300),
  bus_sco       VARCHAR2(1000),
  reg_cap       NUMBER(18,5),
  agg_inv       NUMBER(18,5),
  app_est_off   VARCHAR2(300),
  lic_name      VARCHAR2(300),
  lic_code      VARCHAR2(300),
  open_date     DATE,
  bus_beg_time  DATE,
  bus_end_time  DATE,
  taxp_iden_num VARCHAR2(50),
  time          DATE,
  sort_id       NUMBER(5),
  bus_date      DATE
)
;
comment on table SRC0128_LANDTAX_BUS_BAK
  is '地税表';
comment on column SRC0128_LANDTAX_BUS_BAK.soc_cre_code
  is '社会信用代码（纳税人识别号）';
comment on column SRC0128_LANDTAX_BUS_BAK.landtax_name
  is '纳税人名称';
comment on column SRC0128_LANDTAX_BUS_BAK.taxp_state
  is '纳税人状态';
comment on column SRC0128_LANDTAX_BUS_BAK.levy_reg_typ
  is '课征主体登记类型';
comment on column SRC0128_LANDTAX_BUS_BAK.reg_type
  is '登记注册类型';
comment on column SRC0128_LANDTAX_BUS_BAK.natlan_tax
  is '国地管户类型';
comment on column SRC0128_LANDTAX_BUS_BAK.sub_rel
  is '单位隶属关系';
comment on column SRC0128_LANDTAX_BUS_BAK.ind_cat
  is '行业门类';
comment on column SRC0128_LANDTAX_BUS_BAK.ind_cat_heig
  is '行业大类';
comment on column SRC0128_LANDTAX_BUS_BAK.ind_cat_mid
  is '行业中类';
comment on column SRC0128_LANDTAX_BUS_BAK.industry
  is '行业';
comment on column SRC0128_LANDTAX_BUS_BAK.reg_adr
  is '注册地址';
comment on column SRC0128_LANDTAX_BUS_BAK.bus_adr
  is '生产经营地址';
comment on column SRC0128_LANDTAX_BUS_BAK.lgp_name
  is '法定代表人姓名';
comment on column SRC0128_LANDTAX_BUS_BAK.lgp_idnum
  is '法定代表人身份证号码';
comment on column SRC0128_LANDTAX_BUS_BAK.reg_date
  is '登记日期';
comment on column SRC0128_LANDTAX_BUS_BAK.com_tax_aut
  is '主管税务机关';
comment on column SRC0128_LANDTAX_BUS_BAK.bus_sco
  is '经营范围';
comment on column SRC0128_LANDTAX_BUS_BAK.reg_cap
  is '注册资本';
comment on column SRC0128_LANDTAX_BUS_BAK.agg_inv
  is '投资总额';
comment on column SRC0128_LANDTAX_BUS_BAK.app_est_off
  is '批准设立机关';
comment on column SRC0128_LANDTAX_BUS_BAK.lic_name
  is '证照名称';
comment on column SRC0128_LANDTAX_BUS_BAK.lic_code
  is '证照编号';
comment on column SRC0128_LANDTAX_BUS_BAK.open_date
  is '开业设立日期';
comment on column SRC0128_LANDTAX_BUS_BAK.bus_beg_time
  is '生产经营期限起';
comment on column SRC0128_LANDTAX_BUS_BAK.bus_end_time
  is '生产经营期限止';
comment on column SRC0128_LANDTAX_BUS_BAK.taxp_iden_num
  is '纳税人识别号';
comment on column SRC0128_LANDTAX_BUS_BAK.time
  is '时间戳';
comment on column SRC0128_LANDTAX_BUS_BAK.sort_id
  is '排序字段';
comment on column SRC0128_LANDTAX_BUS_BAK.bus_date
  is '业务日期';

prompt
prompt Creating table SRC0128_LANDTAX_BUS_TEMP
prompt =======================================
prompt
create table SRC0128_LANDTAX_BUS_TEMP
(
  soc_cre_code  VARCHAR2(300),
  landtax_name  VARCHAR2(300),
  taxp_state    VARCHAR2(300),
  levy_reg_typ  VARCHAR2(300),
  reg_type      VARCHAR2(300),
  natlan_tax    VARCHAR2(300),
  sub_rel       VARCHAR2(300),
  ind_cat       VARCHAR2(300),
  ind_cat_heig  VARCHAR2(300),
  ind_cat_mid   VARCHAR2(300),
  industry      VARCHAR2(300),
  reg_adr       VARCHAR2(300),
  bus_adr       VARCHAR2(300),
  lgp_name      VARCHAR2(50),
  lgp_idnum     VARCHAR2(50),
  reg_date      DATE,
  com_tax_aut   VARCHAR2(300),
  bus_sco       VARCHAR2(1000),
  reg_cap       NUMBER(18,5),
  agg_inv       NUMBER(18,5),
  app_est_off   VARCHAR2(300),
  lic_name      VARCHAR2(300),
  lic_code      VARCHAR2(300),
  open_date     DATE,
  bus_beg_time  DATE,
  bus_end_time  DATE,
  taxp_iden_num VARCHAR2(50),
  time          DATE,
  sort_id       NUMBER(5),
  bus_date      DATE
)
;

prompt
prompt Creating table SRC0202_PLN_PCATTYPE
prompt ===================================
prompt
create table SRC0202_PLN_PCATTYPE
(
  proj_catg_type_id    INTEGER not null,
  seq_num              INTEGER not null,
  proj_catg_short_len  INTEGER not null,
  proj_catg_type       VARCHAR2(40) not null,
  super_flag           VARCHAR2(1) not null,
  proj_catg_type_wt    NUMBER(10,2),
  max_proj_catg_wt     NUMBER(10,2),
  update_date          DATE,
  update_user          VARCHAR2(255),
  create_date          DATE,
  create_user          VARCHAR2(255),
  delete_session_id    INTEGER,
  delete_date          DATE,
  p3_flag              INTEGER,
  p3_proj_catg_type_id INTEGER
)
;
comment on table SRC0202_PLN_PCATTYPE
  is '项目分类码类型';
comment on column SRC0202_PLN_PCATTYPE.proj_catg_type_id
  is '分类码类型id';
comment on column SRC0202_PLN_PCATTYPE.seq_num
  is '排序';
comment on column SRC0202_PLN_PCATTYPE.proj_catg_short_len
  is '码值长度';
comment on column SRC0202_PLN_PCATTYPE.proj_catg_type
  is '分类码类型';
comment on column SRC0202_PLN_PCATTYPE.super_flag
  is '保密码';
comment on column SRC0202_PLN_PCATTYPE.proj_catg_type_wt
  is '分类码类型权重';
comment on column SRC0202_PLN_PCATTYPE.max_proj_catg_wt
  is '最大分类码类型权重';
comment on column SRC0202_PLN_PCATTYPE.update_date
  is '更新时间';
comment on column SRC0202_PLN_PCATTYPE.update_user
  is '更新用户';
comment on column SRC0202_PLN_PCATTYPE.create_date
  is '创建时间';
comment on column SRC0202_PLN_PCATTYPE.create_user
  is '创建用户';
comment on column SRC0202_PLN_PCATTYPE.delete_session_id
  is '删除id';
comment on column SRC0202_PLN_PCATTYPE.delete_date
  is '删除时间';
comment on column SRC0202_PLN_PCATTYPE.p3_flag
  is '是否为p3导入的分类码';
comment on column SRC0202_PLN_PCATTYPE.p3_proj_catg_type_id
  is 'p3分类码类型id';

prompt
prompt Creating table SRC0202_PLN_PCATVAL
prompt ==================================
prompt
create table SRC0202_PLN_PCATVAL
(
  proj_catg_id         INTEGER not null,
  proj_catg_type_id    INTEGER not null,
  seq_num              INTEGER not null,
  proj_catg_short_name VARCHAR2(32) not null,
  parent_proj_catg_id  INTEGER,
  proj_catg_name       VARCHAR2(100),
  proj_catg_wt         NUMBER(10,2),
  update_date          DATE,
  update_user          VARCHAR2(255),
  create_date          DATE,
  create_user          VARCHAR2(255),
  delete_session_id    INTEGER,
  delete_date          DATE,
  p3_flag              INTEGER,
  p3_proj_catg_id      INTEGER
)
;
comment on table SRC0202_PLN_PCATVAL
  is '项目分类码值';
comment on column SRC0202_PLN_PCATVAL.proj_catg_id
  is '主键';
comment on column SRC0202_PLN_PCATVAL.proj_catg_type_id
  is '项目分类码类型id';
comment on column SRC0202_PLN_PCATVAL.seq_num
  is '排序';
comment on column SRC0202_PLN_PCATVAL.proj_catg_short_name
  is '项目分类码码值的代码';
comment on column SRC0202_PLN_PCATVAL.parent_proj_catg_id
  is '项目分类码父节点';
comment on column SRC0202_PLN_PCATVAL.proj_catg_name
  is '项目分类码码值名称';
comment on column SRC0202_PLN_PCATVAL.proj_catg_wt
  is '项目分类码码值比重';
comment on column SRC0202_PLN_PCATVAL.update_date
  is '更新时间';
comment on column SRC0202_PLN_PCATVAL.update_user
  is '更新用户';
comment on column SRC0202_PLN_PCATVAL.create_date
  is '创建时间';
comment on column SRC0202_PLN_PCATVAL.create_user
  is '创建用户';
comment on column SRC0202_PLN_PCATVAL.delete_session_id
  is '删除id';
comment on column SRC0202_PLN_PCATVAL.delete_date
  is '删除时间';
comment on column SRC0202_PLN_PCATVAL.p3_flag
  is '是否为p3导入的码值';
comment on column SRC0202_PLN_PCATVAL.p3_proj_catg_id
  is '对应p3的码值id';

prompt
prompt Creating table SRC0202_PLN_PROJECT
prompt ==================================
prompt
create table SRC0202_PLN_PROJECT
(
  project_id               INTEGER not null,
  project_shortname        VARCHAR2(200),
  project_name             VARCHAR2(200),
  parent_id                INTEGER,
  remark                   VARCHAR2(400),
  user_sid                 INTEGER,
  project_type             INTEGER,
  est_wt                   NUMBER(10,2),
  obs_sid                  INTEGER,
  haschild                 INTEGER,
  p3ec                     INTEGER,
  treelevel                INTEGER,
  note                     CLOB,
  p3ec_project_id          INTEGER,
  contract_id              INTEGER,
  displayid                INTEGER,
  discolor                 INTEGER,
  project_type_sid         INTEGER,
  project_status_sid       INTEGER,
  project_address          VARCHAR2(200),
  target_start_date        DATE,
  target_end_date          DATE,
  act_start_date           DATE,
  act_end_date             DATE,
  data_date                DATE,
  compute_end_date         DATE,
  expect_start_date        DATE,
  expect_end_date          DATE,
  uncontract_id            INTEGER,
  complete_pct             NUMBER(18,3),
  allow_diy_web            NUMBER not null,
  program_id               INTEGER,
  risk_level               INTEGER,
  proj_url                 VARCHAR2(200),
  def_duration_type        VARCHAR2(12),
  def_complete_pct_type    VARCHAR2(10),
  def_task_type            VARCHAR2(12),
  acct_id                  INTEGER,
  clndr_id                 INTEGER,
  week_id                  INTEGER,
  update_date              DATE,
  critical_drtn_hr_cnt     NUMBER(10,2),
  critical_path_type       VARCHAR2(12),
  start_date               DATE,
  end_date                 DATE,
  investplanstartdate      DATE,
  investplanenddate        DATE,
  project_level            INTEGER,
  parent_proj_id           INTEGER,
  manageruserid            INTEGER,
  managerid                INTEGER,
  managername              VARCHAR2(20),
  flockstatus              CHAR(10),
  acreage                  FLOAT(53),
  infactacreage            FLOAT(53),
  content                  VARCHAR2(200),
  scale                    VARCHAR2(400),
  totalinvest              INTEGER,
  thisyearinvest           INTEGER,
  dikuai_code              VARCHAR2(50),
  shortcode                VARCHAR2(50),
  assess_projectid         INTEGER,
  acreaprice               NUMBER(19,4),
  plan_state               INTEGER,
  ycoordinate              FLOAT(53),
  xcoordinate              FLOAT(53),
  trade_type               INTEGER,
  in_thisyearplan          INTEGER,
  pseq_num                 INTEGER,
  pro_manager              INTEGER,
  pro_owners               INTEGER,
  pro_time                 DATE,
  pro_general_situation    CLOB,
  pro_construction_content CLOB,
  pro_total                NUMBER(17,6),
  state                    INTEGER,
  zuzhijigou               CLOB,
  islixiang                INTEGER,
  adder_sid                INTEGER,
  add_date                 DATE,
  if_plan                  NUMBER,
  parent_projectid         INTEGER,
  isprogram                INTEGER,
  time_stamp               DATE
)
;
comment on table SRC0202_PLN_PROJECT
  is '项目表';
comment on column SRC0202_PLN_PROJECT.project_id
  is '项目号';
comment on column SRC0202_PLN_PROJECT.project_shortname
  is '项目代码';
comment on column SRC0202_PLN_PROJECT.project_name
  is '项目名称';
comment on column SRC0202_PLN_PROJECT.parent_id
  is '项目父节点id';
comment on column SRC0202_PLN_PROJECT.remark
  is '项目备注';
comment on column SRC0202_PLN_PROJECT.user_sid
  is '用户id';
comment on column SRC0202_PLN_PROJECT.project_type
  is '项目类型';
comment on column SRC0202_PLN_PROJECT.est_wt
  is '权重';
comment on column SRC0202_PLN_PROJECT.obs_sid
  is '权限id';
comment on column SRC0202_PLN_PROJECT.haschild
  is '是否有子节点';
comment on column SRC0202_PLN_PROJECT.p3ec
  is '是否为p3导入项目';
comment on column SRC0202_PLN_PROJECT.treelevel
  is '树结构的第几层';
comment on column SRC0202_PLN_PROJECT.note
  is '说明';
comment on column SRC0202_PLN_PROJECT.p3ec_project_id
  is '对应的p3项目号，不是p3导入项目，该值为null';
comment on column SRC0202_PLN_PROJECT.contract_id
  is '施工合同的主键';
comment on column SRC0202_PLN_PROJECT.displayid
  is '显示';
comment on column SRC0202_PLN_PROJECT.discolor
  is '展示颜色';
comment on column SRC0202_PLN_PROJECT.project_type_sid
  is '项目类型id';
comment on column SRC0202_PLN_PROJECT.project_status_sid
  is '项目状态id';
comment on column SRC0202_PLN_PROJECT.project_address
  is '项目所处地理位置';
comment on column SRC0202_PLN_PROJECT.target_start_date
  is '期望开始时间';
comment on column SRC0202_PLN_PROJECT.target_end_date
  is '期望完成时间';
comment on column SRC0202_PLN_PROJECT.act_start_date
  is '实际开始时间';
comment on column SRC0202_PLN_PROJECT.act_end_date
  is '时间完成时间';
comment on column SRC0202_PLN_PROJECT.data_date
  is '数据日期';
comment on column SRC0202_PLN_PROJECT.compute_end_date
  is '计算完成';
comment on column SRC0202_PLN_PROJECT.expect_start_date
  is '期望开始';
comment on column SRC0202_PLN_PROJECT.expect_end_date
  is '期望完成';
comment on column SRC0202_PLN_PROJECT.uncontract_id
  is '进项合同（投资）主键';
comment on column SRC0202_PLN_PROJECT.complete_pct
  is '完成比百分比';
comment on column SRC0202_PLN_PROJECT.allow_diy_web
  is '是否可自定义网络';
comment on column SRC0202_PLN_PROJECT.program_id
  is '项目群id';
comment on column SRC0202_PLN_PROJECT.risk_level
  is '风险等级';
comment on column SRC0202_PLN_PROJECT.proj_url
  is '项目网站地址';
comment on column SRC0202_PLN_PROJECT.def_duration_type
  is '默认工期类型，同p3ec，现在字符型以后换成数字型';
comment on column SRC0202_PLN_PROJECT.def_complete_pct_type
  is '默认完成百分比类型';
comment on column SRC0202_PLN_PROJECT.def_task_type
  is '默认作业类型';
comment on column SRC0202_PLN_PROJECT.acct_id
  is '费用科目编号';
comment on column SRC0202_PLN_PROJECT.clndr_id
  is '日立编号';
comment on column SRC0202_PLN_PROJECT.week_id
  is '周期id';
comment on column SRC0202_PLN_PROJECT.update_date
  is '更新日期';
comment on column SRC0202_PLN_PROJECT.critical_drtn_hr_cnt
  is '关键路径小时';
comment on column SRC0202_PLN_PROJECT.critical_path_type
  is '关键路径类型';
comment on column SRC0202_PLN_PROJECT.start_date
  is '开始日期';
comment on column SRC0202_PLN_PROJECT.end_date
  is '结束日期';
comment on column SRC0202_PLN_PROJECT.investplanstartdate
  is '投资计划开始日期';
comment on column SRC0202_PLN_PROJECT.investplanenddate
  is '投资计划结束日期';
comment on column SRC0202_PLN_PROJECT.project_level
  is '项目级别';
comment on column SRC0202_PLN_PROJECT.parent_proj_id
  is '父类项目id';
comment on column SRC0202_PLN_PROJECT.manageruserid
  is '未使用';
comment on column SRC0202_PLN_PROJECT.managerid
  is '未使用';
comment on column SRC0202_PLN_PROJECT.managername
  is '未使用';
comment on column SRC0202_PLN_PROJECT.flockstatus
  is '未使用';
comment on column SRC0202_PLN_PROJECT.acreage
  is '未使用';
comment on column SRC0202_PLN_PROJECT.infactacreage
  is '实际面积';
comment on column SRC0202_PLN_PROJECT.content
  is '项目内容';
comment on column SRC0202_PLN_PROJECT.scale
  is '建设规模';
comment on column SRC0202_PLN_PROJECT.totalinvest
  is '总投资';
comment on column SRC0202_PLN_PROJECT.thisyearinvest
  is '今年投资';
comment on column SRC0202_PLN_PROJECT.dikuai_code
  is '地块编码';
comment on column SRC0202_PLN_PROJECT.shortcode
  is '项目简写';
comment on column SRC0202_PLN_PROJECT.assess_projectid
  is '评估项目id';
comment on column SRC0202_PLN_PROJECT.acreaprice
  is '地块大小';
comment on column SRC0202_PLN_PROJECT.plan_state
  is '计划状态';
comment on column SRC0202_PLN_PROJECT.ycoordinate
  is '项目坐标_Y轴';
comment on column SRC0202_PLN_PROJECT.xcoordinate
  is '项目坐标_X轴';
comment on column SRC0202_PLN_PROJECT.time_stamp
  is '时间戳';
alter table SRC0202_PLN_PROJECT
  add constraint PK_PLN_PROJECT primary key (PROJECT_ID);

prompt
prompt Creating table SRC0202_PLN_PROJPCAT
prompt ===================================
prompt
create table SRC0202_PLN_PROJPCAT
(
  proj_id           INTEGER not null,
  proj_catg_type_id INTEGER not null,
  proj_catg_id      INTEGER not null,
  update_date       DATE,
  update_user       VARCHAR2(255),
  create_date       DATE,
  create_user       VARCHAR2(255),
  delete_session_id INTEGER,
  delete_date       DATE
)
;
comment on table SRC0202_PLN_PROJPCAT
  is '项目和项目分类码关系表';
comment on column SRC0202_PLN_PROJPCAT.proj_id
  is '项目号';
comment on column SRC0202_PLN_PROJPCAT.proj_catg_type_id
  is '项目分类码类型号';
comment on column SRC0202_PLN_PROJPCAT.proj_catg_id
  is '项目分类码号';
comment on column SRC0202_PLN_PROJPCAT.update_date
  is '更新日期';
comment on column SRC0202_PLN_PROJPCAT.update_user
  is '更新用户';
comment on column SRC0202_PLN_PROJPCAT.create_date
  is '创建日期';
comment on column SRC0202_PLN_PROJPCAT.create_user
  is '创建用户';
comment on column SRC0202_PLN_PROJPCAT.delete_session_id
  is '删除id';
comment on column SRC0202_PLN_PROJPCAT.delete_date
  is '删除日期';
alter table SRC0202_PLN_PROJPCAT
  add constraint PK_PLN_PROJPCAT primary key (PROJ_ID, PROJ_CATG_TYPE_ID);


spool off
