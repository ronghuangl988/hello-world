--------------------------------------------
-- Export file for user C##_BIGDATA@ZZMDM --
-- Created by zhy on 2017/10/13, 11:39:06 --
--------------------------------------------

set define off
spool 主数据.log

prompt
prompt Creating table LEG_PER_BASIC_INFO
prompt =================================
prompt
create table LEG_PER_BASIC_INFO
(
  usc_code       VARCHAR2(50),
  org_code       VARCHAR2(50),
  leg_per_name   VARCHAR2(100),
  leg_per_state  VARCHAR2(220),
  reg_type_code  VARCHAR2(50),
  reg_type       VARCHAR2(220),
  bus_place      VARCHAR2(220),
  operator       VARCHAR2(50),
  open_date      DATE,
  reg_dpt        VARCHAR2(225),
  reg_num        VARCHAR2(50),
  time_stamp     DATE,
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
  exa_remarks    VARCHAR2(500),
  src_entity     VARCHAR2(255),
  patch_code     VARCHAR2(255)
)
;
comment on table LEG_PER_BASIC_INFO
  is '法人基础信息';
comment on column LEG_PER_BASIC_INFO.usc_code
  is '统一社会信用代码';
comment on column LEG_PER_BASIC_INFO.org_code
  is '组织机构代码';
comment on column LEG_PER_BASIC_INFO.leg_per_name
  is '法人名称';
comment on column LEG_PER_BASIC_INFO.leg_per_state
  is '法人状态';
comment on column LEG_PER_BASIC_INFO.reg_type_code
  is '登记类型编号（对应dim_reg_type的reg_type_code字段）';
comment on column LEG_PER_BASIC_INFO.reg_type
  is '登记类型';
comment on column LEG_PER_BASIC_INFO.bus_place
  is '法人住所';
comment on column LEG_PER_BASIC_INFO.operator
  is '法定代表人姓名';
comment on column LEG_PER_BASIC_INFO.open_date
  is '成立日期';
comment on column LEG_PER_BASIC_INFO.reg_dpt
  is '批准机关';
comment on column LEG_PER_BASIC_INFO.reg_num
  is '注册号';
comment on column LEG_PER_BASIC_INFO.time_stamp
  is '时间戳';
comment on column LEG_PER_BASIC_INFO.sort_id
  is '排序';
comment on column LEG_PER_BASIC_INFO.description
  is '操作描述';
comment on column LEG_PER_BASIC_INFO.creator_id
  is '创建者id';
comment on column LEG_PER_BASIC_INFO.creator
  is '创建者';
comment on column LEG_PER_BASIC_INFO.create_date
  is '创建日期';
comment on column LEG_PER_BASIC_INFO.modifiedby
  is '修改人';
comment on column LEG_PER_BASIC_INFO.modifiedby_id
  is '修改人id';
comment on column LEG_PER_BASIC_INFO.modified_date
  is '修改日期';
comment on column LEG_PER_BASIC_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LEG_PER_BASIC_INFO.version
  is '版本号';
comment on column LEG_PER_BASIC_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LEG_PER_BASIC_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LEG_PER_BASIC_INFO.exa_remarks
  is '审批备注';
comment on column LEG_PER_BASIC_INFO.src_entity
  is '源实体';
comment on column LEG_PER_BASIC_INFO.patch_code
  is '批次号';

prompt
prompt Creating table LEG_PER_CONTACT_INFO
prompt ===================================
prompt
create table LEG_PER_CONTACT_INFO
(
  reg_num        VARCHAR2(50),
  postcode       VARCHAR2(50),
  operator_tel   VARCHAR2(50),
  fax            VARCHAR2(50),
  iter_adr       VARCHAR2(100),
  liaison        VARCHAR2(50),
  liaison_tel    VARCHAR2(50),
  e_mail         VARCHAR2(50),
  src_entity     VARCHAR2(255),
  time_stamp     DATE,
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
  exa_remarks    VARCHAR2(500),
  patch_code     VARCHAR2(255)
)
;
comment on table LEG_PER_CONTACT_INFO
  is '法人联系信息';
comment on column LEG_PER_CONTACT_INFO.reg_num
  is '注册号';
comment on column LEG_PER_CONTACT_INFO.postcode
  is '邮政编码';
comment on column LEG_PER_CONTACT_INFO.operator_tel
  is '联系电话';
comment on column LEG_PER_CONTACT_INFO.fax
  is '传真';
comment on column LEG_PER_CONTACT_INFO.iter_adr
  is '互联网地址';
comment on column LEG_PER_CONTACT_INFO.liaison
  is '公示联络员';
comment on column LEG_PER_CONTACT_INFO.liaison_tel
  is '公示联络电话';
comment on column LEG_PER_CONTACT_INFO.e_mail
  is '电子邮箱';
comment on column LEG_PER_CONTACT_INFO.src_entity
  is '源实体';
comment on column LEG_PER_CONTACT_INFO.time_stamp
  is '时间戳';
comment on column LEG_PER_CONTACT_INFO.sort_id
  is '排序字段';
comment on column LEG_PER_CONTACT_INFO.description
  is '操作描述';
comment on column LEG_PER_CONTACT_INFO.creator_id
  is '创建者id';
comment on column LEG_PER_CONTACT_INFO.creator
  is '创建者';
comment on column LEG_PER_CONTACT_INFO.create_date
  is '创建日期';
comment on column LEG_PER_CONTACT_INFO.modifiedby
  is '修改人';
comment on column LEG_PER_CONTACT_INFO.modifiedby_id
  is '修改人id';
comment on column LEG_PER_CONTACT_INFO.modified_date
  is '修改日期';
comment on column LEG_PER_CONTACT_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LEG_PER_CONTACT_INFO.version
  is '版本号';
comment on column LEG_PER_CONTACT_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LEG_PER_CONTACT_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LEG_PER_CONTACT_INFO.exa_remarks
  is '审批备注';
comment on column LEG_PER_CONTACT_INFO.patch_code
  is '批次号';

prompt
prompt Creating table LEG_PER_REG_INFO
prompt ===============================
prompt
create table LEG_PER_REG_INFO
(
  reg_num        VARCHAR2(50),
  reg_org_name   VARCHAR2(100),
  idt_ctgr_code  VARCHAR2(50),
  idt_ctgr       VARCHAR2(50),
  trade_type     VARCHAR2(50),
  trade_code     VARCHAR2(20),
  bus_scope      VARCHAR2(1000),
  bus_mode       VARCHAR2(500),
  id_card_type   VARCHAR2(200),
  id_card_num    VARCHAR2(50),
  reg_capital    NUMBER,
  paid_capital   NUMBER,
  cur_type       VARCHAR2(50),
  etp_ctg        VARCHAR2(50),
  etp_type       VARCHAR2(50),
  bus_term       VARCHAR2(50),
  sha_con_id     VARCHAR2(32),
  bank_name      VARCHAR2(100),
  bank_acc       VARCHAR2(50),
  country_code   VARCHAR2(50),
  src_entity     VARCHAR2(255),
  time_stamp     DATE,
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
  exa_remarks    VARCHAR2(500),
  patch_code     VARCHAR2(255)
)
;
comment on table LEG_PER_REG_INFO
  is '营业主体注册或登记信息表';
comment on column LEG_PER_REG_INFO.reg_num
  is '注册号';
comment on column LEG_PER_REG_INFO.reg_org_name
  is '注册机构名称';
comment on column LEG_PER_REG_INFO.idt_ctgr_code
  is '行业门类编码（对应dim_idt_ctgr的idt_ctgr_code字段）';
comment on column LEG_PER_REG_INFO.idt_ctgr
  is '行业门类';
comment on column LEG_PER_REG_INFO.trade_type
  is '行业类别';
comment on column LEG_PER_REG_INFO.trade_code
  is '行业代码';
comment on column LEG_PER_REG_INFO.bus_scope
  is '经营范围';
comment on column LEG_PER_REG_INFO.bus_mode
  is '经营方式';
comment on column LEG_PER_REG_INFO.id_card_type
  is '身份证件类型';
comment on column LEG_PER_REG_INFO.id_card_num
  is '身份证件号码';
comment on column LEG_PER_REG_INFO.reg_capital
  is '注册资本';
comment on column LEG_PER_REG_INFO.paid_capital
  is '实收资本';
comment on column LEG_PER_REG_INFO.cur_type
  is '币种';
comment on column LEG_PER_REG_INFO.etp_ctg
  is '企业类别';
comment on column LEG_PER_REG_INFO.etp_type
  is '企业类型';
comment on column LEG_PER_REG_INFO.bus_term
  is '营业期限';
comment on column LEG_PER_REG_INFO.sha_con_id
  is '股东及出资表的ID';
comment on column LEG_PER_REG_INFO.bank_name
  is '开户银行名称';
comment on column LEG_PER_REG_INFO.bank_acc
  is '银行账号';
comment on column LEG_PER_REG_INFO.country_code
  is '行政区划代码';
comment on column LEG_PER_REG_INFO.src_entity
  is '源实体';
comment on column LEG_PER_REG_INFO.time_stamp
  is '时间戳';
comment on column LEG_PER_REG_INFO.sort_id
  is '排序字段';
comment on column LEG_PER_REG_INFO.description
  is '操作描述';
comment on column LEG_PER_REG_INFO.creator_id
  is '创建者id';
comment on column LEG_PER_REG_INFO.creator
  is '创建者';
comment on column LEG_PER_REG_INFO.create_date
  is '创建日期';
comment on column LEG_PER_REG_INFO.modifiedby
  is '修改人';
comment on column LEG_PER_REG_INFO.modifiedby_id
  is '修改人id';
comment on column LEG_PER_REG_INFO.modified_date
  is '修改日期';
comment on column LEG_PER_REG_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LEG_PER_REG_INFO.version
  is '版本号';
comment on column LEG_PER_REG_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LEG_PER_REG_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LEG_PER_REG_INFO.exa_remarks
  is '审批备注';
comment on column LEG_PER_REG_INFO.patch_code
  is '批次号';

prompt
prompt Creating table LEG_PER_TAX_INFO
prompt ===============================
prompt
create table LEG_PER_TAX_INFO
(
  usc_code       VARCHAR2(50),
  com_tax_aut    VARCHAR2(200),
  reg_date       DATE,
  cancel_date    DATE,
  iden_date      DATE,
  remove_date    DATE,
  time_stamp     DATE,
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
  exa_remarks    VARCHAR2(500),
  patch_code     VARCHAR2(255)
)
;
comment on table LEG_PER_TAX_INFO
  is '税务信息';
comment on column LEG_PER_TAX_INFO.usc_code
  is '纳税人识别号';
comment on column LEG_PER_TAX_INFO.com_tax_aut
  is '税务登记机关名称';
comment on column LEG_PER_TAX_INFO.reg_date
  is '税务登记日期';
comment on column LEG_PER_TAX_INFO.cancel_date
  is '注销税务登记日期';
comment on column LEG_PER_TAX_INFO.iden_date
  is '非正常户认定日期';
comment on column LEG_PER_TAX_INFO.remove_date
  is '非正常户解除日期';
comment on column LEG_PER_TAX_INFO.time_stamp
  is '更新时间';
comment on column LEG_PER_TAX_INFO.sort_id
  is '排序';
comment on column LEG_PER_TAX_INFO.description
  is '操作描述';
comment on column LEG_PER_TAX_INFO.creator_id
  is '创建者id';
comment on column LEG_PER_TAX_INFO.creator
  is '创建者';
comment on column LEG_PER_TAX_INFO.create_date
  is '创建日期';
comment on column LEG_PER_TAX_INFO.modifiedby
  is '修改人';
comment on column LEG_PER_TAX_INFO.modifiedby_id
  is '修改人id';
comment on column LEG_PER_TAX_INFO.modified_date
  is '修改日期';
comment on column LEG_PER_TAX_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LEG_PER_TAX_INFO.version
  is '版本号';
comment on column LEG_PER_TAX_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LEG_PER_TAX_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LEG_PER_TAX_INFO.exa_remarks
  is '审批备注';
comment on column LEG_PER_TAX_INFO.patch_code
  is '批次号';

prompt
prompt Creating table MAC_ECO_INDEX
prompt ============================
prompt
create table MAC_ECO_INDEX
(
  index_month    VARCHAR2(50),
  index_code     VARCHAR2(50),
  index_name     VARCHAR2(50),
  unit           VARCHAR2(50),
  cur_month_val  NUMBER,
  cur_year_val   NUMBER,
  last_year_val  NUMBER,
  yoy_growth     NUMBER,
  dz_grow_rate   NUMBER,
  dz_com_rate    VARCHAR2(50),
  zz_plan_task   NUMBER,
  zz_com_rate    NUMBER,
  notes          VARCHAR2(100),
  ym_code        VARCHAR2(50),
  input_date     VARCHAR2(50),
  update_time    DATE,
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
  exa_remarks    VARCHAR2(500),
  patch_code     VARCHAR2(255)
)
;
comment on table MAC_ECO_INDEX
  is '宏观经济指标综合表';
comment on column MAC_ECO_INDEX.index_month
  is '主键';
comment on column MAC_ECO_INDEX.index_code
  is '宏观经济指标综合编码';
comment on column MAC_ECO_INDEX.index_name
  is '宏观经济指标名';
comment on column MAC_ECO_INDEX.unit
  is '单位';
comment on column MAC_ECO_INDEX.cur_month_val
  is '本月完成数';
comment on column MAC_ECO_INDEX.cur_year_val
  is '1-本月累计数';
comment on column MAC_ECO_INDEX.last_year_val
  is '上年累计数';
comment on column MAC_ECO_INDEX.yoy_growth
  is '同比增长';
comment on column MAC_ECO_INDEX.dz_grow_rate
  is '年计划任务  计划(增速)';
comment on column MAC_ECO_INDEX.dz_com_rate
  is '年计划任务 完成率（说明）';
comment on column MAC_ECO_INDEX.zz_plan_task
  is '年计划任务 计划';
comment on column MAC_ECO_INDEX.zz_com_rate
  is '年计划任务 完成率';
comment on column MAC_ECO_INDEX.notes
  is '备注';
comment on column MAC_ECO_INDEX.ym_code
  is '年月编码';
comment on column MAC_ECO_INDEX.input_date
  is '年月';
comment on column MAC_ECO_INDEX.update_time
  is '更新时间';
comment on column MAC_ECO_INDEX.sort_id
  is '排序';
comment on column MAC_ECO_INDEX.description
  is '操作描述';
comment on column MAC_ECO_INDEX.creator_id
  is '创建者id';
comment on column MAC_ECO_INDEX.creator
  is '创建者';
comment on column MAC_ECO_INDEX.create_date
  is '创建日期';
comment on column MAC_ECO_INDEX.modifiedby
  is '修改人';
comment on column MAC_ECO_INDEX.modifiedby_id
  is '修改人id';
comment on column MAC_ECO_INDEX.modified_date
  is '修改日期';
comment on column MAC_ECO_INDEX.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column MAC_ECO_INDEX.version
  is '版本号';
comment on column MAC_ECO_INDEX.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column MAC_ECO_INDEX.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column MAC_ECO_INDEX.exa_remarks
  is '审批备注';
comment on column MAC_ECO_INDEX.patch_code
  is '批次号';

prompt
prompt Creating table POP_BAISHA
prompt =========================
prompt
create table POP_BAISHA
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
  exa_remarks   VARCHAR2(500)
)
;
comment on column POP_BAISHA.gen_grid
  is '所属网格';
comment on column POP_BAISHA.jur_area
  is '管辖区域';
comment on column POP_BAISHA.jur_code
  is '管辖区域代码';
comment on column POP_BAISHA.mng_type
  is '管理类型';
comment on column POP_BAISHA.pop_type
  is '人口类型';
comment on column POP_BAISHA.fam_num
  is '家庭编号';
comment on column POP_BAISHA.home_addr
  is '家庭地址';
comment on column POP_BAISHA.fix_ttl
  is '固定电话';
comment on column POP_BAISHA.mb_phone
  is '移动电话';
comment on column POP_BAISHA.rel_hsh
  is '与户主关系';
comment on column POP_BAISHA.hsh_status
  is '人户状态';
comment on column POP_BAISHA.pop_name
  is '姓名';
comment on column POP_BAISHA.pop_sex
  is '性别';
comment on column POP_BAISHA.birthday
  is '出生日期';
comment on column POP_BAISHA.dom_type
  is '证件类型';
comment on column POP_BAISHA.account_no
  is '证件号';
comment on column POP_BAISHA.nation
  is '民族';
comment on column POP_BAISHA.deg_edu
  is '文化程度';
comment on column POP_BAISHA.occupation
  is '职业';
comment on column POP_BAISHA.work_unit
  is '工作单位';
comment on column POP_BAISHA.reg_code
  is '户籍地代码';
comment on column POP_BAISHA.domicile
  is '户籍地';
comment on column POP_BAISHA.hs_tel
  is '户籍地联系电话';
comment on column POP_BAISHA.isonlychild
  is '是否独子';
comment on column POP_BAISHA.office_tel
  is '办公电话';
comment on column POP_BAISHA.fa_name
  is '父亲姓名';
comment on column POP_BAISHA.ma_name
  is '母亲姓名';
comment on column POP_BAISHA.mar_status
  is '婚姻状况';
comment on column POP_BAISHA.mar_date
  is '婚姻日期';
comment on column POP_BAISHA.spouse_name
  is '配偶名字';
comment on column POP_BAISHA.spouse_birth
  is '配偶出生日期';
comment on column POP_BAISHA.spouse_no
  is '配偶身份证';
comment on column POP_BAISHA.child_num
  is '现孩数';
comment on column POP_BAISHA.boy_num
  is '现男孩数';
comment on column POP_BAISHA.girl_num
  is '现女孩数';
comment on column POP_BAISHA.issue_date
  is '发证日期';
comment on column POP_BAISHA.discipline
  is '是否违纪';
comment on column POP_BAISHA.ctp_mea
  is '节育措施';
comment on column POP_BAISHA.cont_date
  is '节育日期';
comment on column POP_BAISHA.cont_note
  is '节育备注';
comment on column POP_BAISHA.is_wmcheck
  is '是否需要妇检';
comment on column POP_BAISHA.isglo_cer
  is '有无光荣证';
comment on column POP_BAISHA.current_addr
  is '现居住地址';
comment on column POP_BAISHA.landlord_name
  is '房东姓名';
comment on column POP_BAISHA.landlord_id
  is '房东身份证';
comment on column POP_BAISHA.isspouse_loc
  is '配偶是否本地';
comment on column POP_BAISHA.spouse_dom
  is '配偶户籍地';
comment on column POP_BAISHA.pop_status
  is '人员状态';
comment on column POP_BAISHA.pop_ctg
  is '人员类别';
comment on column POP_BAISHA.obtain_date
  is '入户时间';
comment on column POP_BAISHA.exit_date
  is '出户时间';
comment on column POP_BAISHA.reg_date
  is '登记日期';
comment on column POP_BAISHA.leave_date
  is '离籍时间';
comment on column POP_BAISHA.height
  is '身高';
comment on column POP_BAISHA.form_name
  is '曾用名';
comment on column POP_BAISHA.occu_type
  is '职业类别';
comment on column POP_BAISHA.pol_visage
  is '政治面貌';
comment on column POP_BAISHA.note
  is '备注';
comment on column POP_BAISHA.rel_beli
  is '宗教信仰';
comment on column POP_BAISHA.nationality
  is '国籍';
comment on column POP_BAISHA.exa_remarks
  is '审批备注';

prompt
prompt Creating table POP_BASIC_INFO
prompt =============================
prompt
create table POP_BASIC_INFO
(
  account_no            VARCHAR2(100),
  pop_name              VARCHAR2(50),
  pop_sex_code          VARCHAR2(50),
  pop_sex               VARCHAR2(50),
  nation                VARCHAR2(50),
  birthday              DATE,
  form_name             VARCHAR2(50),
  height                VARCHAR2(50),
  marry_status_code     VARCHAR2(50),
  marry_status          VARCHAR2(50),
  marry_date            DATE,
  pol_visage            VARCHAR2(50),
  pop_ctg               VARCHAR2(50),
  fix_ttl               VARCHAR2(50),
  mb_phone              VARCHAR2(50),
  is_childbear_age_code VARCHAR2(50),
  is_childbear_age      VARCHAR2(10),
  education_code        VARCHAR2(50),
  education             VARCHAR2(50),
  pop_type              VARCHAR2(50),
  region_code           VARCHAR2(50),
  region                VARCHAR2(50),
  gen_grid              VARCHAR2(50),
  time_stamp            DATE,
  sort_id               NUMBER,
  description           VARCHAR2(255),
  creator_id            VARCHAR2(120),
  creator               VARCHAR2(120),
  create_date           DATE,
  modifiedby            VARCHAR2(120),
  modifiedby_id         VARCHAR2(120),
  modified_date         DATE,
  version_status        NUMBER,
  version               NUMBER,
  latestversion         NUMBER,
  approvalstae          NUMBER,
  exa_remarks           VARCHAR2(500),
  src_entity            VARCHAR2(255),
  src_community         VARCHAR2(255),
  patch_code            VARCHAR2(255)
)
;
comment on table POP_BASIC_INFO
  is '人口基础信息';
comment on column POP_BASIC_INFO.account_no
  is '公民身份号码';
comment on column POP_BASIC_INFO.pop_name
  is '姓名';
comment on column POP_BASIC_INFO.pop_sex_code
  is '性别编码(对应dim_sex的sex_code字段)';
comment on column POP_BASIC_INFO.pop_sex
  is '性别';
comment on column POP_BASIC_INFO.nation
  is '民族';
comment on column POP_BASIC_INFO.birthday
  is '出生日期';
comment on column POP_BASIC_INFO.form_name
  is '曾用名';
comment on column POP_BASIC_INFO.height
  is '身高';
comment on column POP_BASIC_INFO.marry_status_code
  is '婚姻状况编码（对应dim_marry_status的MARRY_STATUS_CODE字段）';
comment on column POP_BASIC_INFO.marry_status
  is '婚姻状况';
comment on column POP_BASIC_INFO.marry_date
  is '婚姻登记时间';
comment on column POP_BASIC_INFO.pol_visage
  is '政治面貌';
comment on column POP_BASIC_INFO.pop_ctg
  is '人员类别';
comment on column POP_BASIC_INFO.fix_ttl
  is '固定电话';
comment on column POP_BASIC_INFO.mb_phone
  is '移动电话';
comment on column POP_BASIC_INFO.is_childbear_age_code
  is '是否育龄妇女编码（对应dim_childbear_age的is_childbear_age_code字段）';
comment on column POP_BASIC_INFO.is_childbear_age
  is '是否育龄妇女';
comment on column POP_BASIC_INFO.education_code
  is '学历编码（对应dim_education的education_code字段）';
comment on column POP_BASIC_INFO.education
  is '学历';
comment on column POP_BASIC_INFO.pop_type
  is '人口类型
';
comment on column POP_BASIC_INFO.region_code
  is '地区编码（对应dim_region的region_code字段）';
comment on column POP_BASIC_INFO.region
  is '地区';
comment on column POP_BASIC_INFO.gen_grid
  is '所属网格';
comment on column POP_BASIC_INFO.time_stamp
  is '时间戳';
comment on column POP_BASIC_INFO.sort_id
  is '排序';
comment on column POP_BASIC_INFO.description
  is '操作描述';
comment on column POP_BASIC_INFO.creator_id
  is '创建者id';
comment on column POP_BASIC_INFO.creator
  is '创建者';
comment on column POP_BASIC_INFO.create_date
  is '创建日期';
comment on column POP_BASIC_INFO.modifiedby
  is '修改人';
comment on column POP_BASIC_INFO.modifiedby_id
  is '修改人id';
comment on column POP_BASIC_INFO.modified_date
  is '修改日期';
comment on column POP_BASIC_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column POP_BASIC_INFO.version
  is '版本号';
comment on column POP_BASIC_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column POP_BASIC_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column POP_BASIC_INFO.exa_remarks
  is '审批备注';
comment on column POP_BASIC_INFO.src_entity
  is '源表名称';
comment on column POP_BASIC_INFO.src_community
  is '来源社区';
comment on column POP_BASIC_INFO.patch_code
  is '批次号';

prompt
prompt Creating table POP_BASIC_INFO_TEMP
prompt ==================================
prompt
create table POP_BASIC_INFO_TEMP
(
  account_no   VARCHAR2(100),
  pop_name     VARCHAR2(50),
  pop_sex      VARCHAR2(50),
  nation       VARCHAR2(50),
  birthday     DATE,
  form_name    VARCHAR2(50),
  height       VARCHAR2(50),
  mar_status   VARCHAR2(50),
  mar_date     VARCHAR2(50),
  pol_visage   VARCHAR2(50),
  pop_ctg      VARCHAR2(50),
  fix_ttl      VARCHAR2(50),
  mb_phone     VARCHAR2(50),
  type         VARCHAR2(50),
  region       VARCHAR2(50),
  time         DATE,
  sort_id      NUMBER,
  approvalstae NUMBER,
  bus_date     DATE,
  exa_remarks  VARCHAR2(500)
)
;
comment on column POP_BASIC_INFO_TEMP.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column POP_BASIC_INFO_TEMP.bus_date
  is '业务日期';
comment on column POP_BASIC_INFO_TEMP.exa_remarks
  is '审批备注';

prompt
prompt Creating table POP_EDU_INFO
prompt ===========================
prompt
create table POP_EDU_INFO
(
  tip_deg        VARCHAR2(50),
  tip_deg_school VARCHAR2(100),
  gra_time       DATE,
  maj_tip_deg    VARCHAR2(50),
  degree         VARCHAR2(50),
  awa_time       DATE,
  other_maj      VARCHAR2(50),
  fore_lan_type  VARCHAR2(50),
  pro_language   VARCHAR2(50),
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
  exa_remarks    VARCHAR2(500),
  patch_code     VARCHAR2(255)
)
;
comment on table POP_EDU_INFO
  is '教育信息';
comment on column POP_EDU_INFO.tip_deg
  is '最高学历';
comment on column POP_EDU_INFO.tip_deg_school
  is '最高学历毕业院校';
comment on column POP_EDU_INFO.gra_time
  is '最高学历毕业时间';
comment on column POP_EDU_INFO.maj_tip_deg
  is '最高学历专业';
comment on column POP_EDU_INFO.degree
  is '学位';
comment on column POP_EDU_INFO.awa_time
  is '学位授予时间';
comment on column POP_EDU_INFO.other_maj
  is '其他所学专业';
comment on column POP_EDU_INFO.fore_lan_type
  is '所学外语语种';
comment on column POP_EDU_INFO.pro_language
  is '外语语种熟练程度';
comment on column POP_EDU_INFO.time
  is '时间戳';
comment on column POP_EDU_INFO.sort_id
  is '排序';
comment on column POP_EDU_INFO.description
  is '操作描述';
comment on column POP_EDU_INFO.creator_id
  is '创建者id';
comment on column POP_EDU_INFO.creator
  is '创建者';
comment on column POP_EDU_INFO.create_date
  is '创建日期';
comment on column POP_EDU_INFO.modifiedby
  is '修改人';
comment on column POP_EDU_INFO.modifiedby_id
  is '修改人id';
comment on column POP_EDU_INFO.modified_date
  is '修改日期';
comment on column POP_EDU_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column POP_EDU_INFO.version
  is '版本号';
comment on column POP_EDU_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column POP_EDU_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column POP_EDU_INFO.exa_remarks
  is '审批备注';
comment on column POP_EDU_INFO.patch_code
  is '批次号';

prompt
prompt Creating table POP_EMP_UNIT
prompt ===========================
prompt
create table POP_EMP_UNIT
(
  unit_name      VARCHAR2(200),
  unit_addr      VARCHAR2(200),
  unit_post      VARCHAR2(20),
  unit_tele_num  VARCHAR2(20),
  unit_type      VARCHAR2(50),
  unit_eco_type  VARCHAR2(50),
  unit_aff       VARCHAR2(200),
  org_ist_code   VARCHAR2(100),
  unit_time_work DATE,
  adm_head_level VARCHAR2(100),
  pro_tec_head   VARCHAR2(200),
  emp_start_time DATE,
  emp_end_time   DATE,
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
  exa_remarks    VARCHAR2(500),
  patch_code     VARCHAR2(255)
)
;
comment on table POP_EMP_UNIT
  is '就业单位信息';
comment on column POP_EMP_UNIT.unit_name
  is '单位名称';
comment on column POP_EMP_UNIT.unit_addr
  is '单位地址';
comment on column POP_EMP_UNIT.unit_post
  is '单位邮政编码';
comment on column POP_EMP_UNIT.unit_tele_num
  is '单位电话号码';
comment on column POP_EMP_UNIT.unit_type
  is '单位类别';
comment on column POP_EMP_UNIT.unit_eco_type
  is '单位经济类型';
comment on column POP_EMP_UNIT.unit_aff
  is '单位所属行业';
comment on column POP_EMP_UNIT.org_ist_code
  is '组织机构代码';
comment on column POP_EMP_UNIT.unit_time_work
  is '进入单位时间';
comment on column POP_EMP_UNIT.adm_head_level
  is '行政职务级别';
comment on column POP_EMP_UNIT.pro_tec_head
  is '专业技术职务';
comment on column POP_EMP_UNIT.emp_start_time
  is '专业技术职务聘任起始时间';
comment on column POP_EMP_UNIT.emp_end_time
  is '专业技术职务聘任终止时间';
comment on column POP_EMP_UNIT.time
  is '时间戳';
comment on column POP_EMP_UNIT.sort_id
  is '排序';
comment on column POP_EMP_UNIT.description
  is '操作描述';
comment on column POP_EMP_UNIT.creator_id
  is '创建者id';
comment on column POP_EMP_UNIT.creator
  is '创建者';
comment on column POP_EMP_UNIT.create_date
  is '创建日期';
comment on column POP_EMP_UNIT.modifiedby
  is '修改人';
comment on column POP_EMP_UNIT.modifiedby_id
  is '修改人id';
comment on column POP_EMP_UNIT.modified_date
  is '修改日期';
comment on column POP_EMP_UNIT.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column POP_EMP_UNIT.version
  is '版本号';
comment on column POP_EMP_UNIT.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column POP_EMP_UNIT.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column POP_EMP_UNIT.exa_remarks
  is '审批备注';
comment on column POP_EMP_UNIT.patch_code
  is '批次号';

prompt
prompt Creating table POP_END_INS
prompt ==========================
prompt
create table POP_END_INS
(
  led_dra_pen    VARCHAR2(50),
  fra_cla_ide    VARCHAR2(50),
  fra_cla_num    NUMBER,
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
  exa_remarks    VARCHAR2(500),
  patch_code     VARCHAR2(255)
)
;
comment on table POP_END_INS
  is '养老保险';
comment on column POP_END_INS.led_dra_pen
  is '领取养老金标识';
comment on column POP_END_INS.fra_cla_ide
  is '曾经冒领养老金标识';
comment on column POP_END_INS.fra_cla_num
  is '曾经冒领养老金金额';
comment on column POP_END_INS.time
  is '时间戳';
comment on column POP_END_INS.sort_id
  is '排序';
comment on column POP_END_INS.description
  is '操作描述';
comment on column POP_END_INS.creator_id
  is '创建者id';
comment on column POP_END_INS.creator
  is '创建者';
comment on column POP_END_INS.create_date
  is '创建日期';
comment on column POP_END_INS.modifiedby
  is '修改人';
comment on column POP_END_INS.modifiedby_id
  is '修改人id';
comment on column POP_END_INS.modified_date
  is '修改日期';
comment on column POP_END_INS.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column POP_END_INS.version
  is '版本号';
comment on column POP_END_INS.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column POP_END_INS.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column POP_END_INS.exa_remarks
  is '审批备注';
comment on column POP_END_INS.patch_code
  is '批次号';

prompt
prompt Creating table POP_FOCUS_GROUP
prompt ==============================
prompt
create table POP_FOCUS_GROUP
(
  gen_grid     VARCHAR2(50),
  pop_name     VARCHAR2(50),
  account_no   VARCHAR2(50),
  type         VARCHAR2(50),
  category     VARCHAR2(50),
  basic_situa  VARCHAR2(50),
  leader_name  VARCHAR2(50),
  resp_unit    VARCHAR2(50),
  longitude    VARCHAR2(50),
  latitude     VARCHAR2(50),
  addr_column  VARCHAR2(50),
  time         DATE,
  sort_id      NUMBER,
  approvalstae NUMBER,
  bus_date     DATE,
  exa_remarks  VARCHAR2(500)
)
;
comment on table POP_FOCUS_GROUP
  is '重点人群信息';
comment on column POP_FOCUS_GROUP.gen_grid
  is '所属网格';
comment on column POP_FOCUS_GROUP.pop_name
  is '姓名';
comment on column POP_FOCUS_GROUP.account_no
  is '身份证号';
comment on column POP_FOCUS_GROUP.type
  is '类型';
comment on column POP_FOCUS_GROUP.category
  is '类别';
comment on column POP_FOCUS_GROUP.basic_situa
  is '基本情况';
comment on column POP_FOCUS_GROUP.leader_name
  is '包案领导姓名';
comment on column POP_FOCUS_GROUP.resp_unit
  is '责任单位';
comment on column POP_FOCUS_GROUP.longitude
  is '经度';
comment on column POP_FOCUS_GROUP.latitude
  is '纬度';
comment on column POP_FOCUS_GROUP.addr_column
  is '地址栏目';
comment on column POP_FOCUS_GROUP.time
  is '时间戳';
comment on column POP_FOCUS_GROUP.sort_id
  is '排序';
comment on column POP_FOCUS_GROUP.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column POP_FOCUS_GROUP.bus_date
  is '业务日期';
comment on column POP_FOCUS_GROUP.exa_remarks
  is '审批备注';

prompt
prompt Creating table POP_HEA_REC
prompt ==========================
prompt
create table POP_HEA_REC
(
  fam_dis_his       VARCHAR2(100),
  fam_tak_time      DATE,
  chr_dis_his       VARCHAR2(100),
  chr_dis_his_time  DATE,
  com_dis_his       VARCHAR2(100),
  com_tak_time      DATE,
  med_dis_his       VARCHAR2(100),
  med_tak_time      DATE,
  hos_sur_his       VARCHAR2(100),
  hos_sur_tak_time  DATE,
  no_com_his        VARCHAR2(100),
  no_com_tak_time   DATE,
  haz_fac_his       VARCHAR2(100),
  haz_fac_starttime DATE,
  haz_fac_endtime   DATE,
  ris_beh_his       VARCHAR2(100),
  tra_his           VARCHAR2(100),
  sleep_qua         VARCHAR2(100),
  newboth_dis       VARCHAR2(100),
  birth_def         VARCHAR2(100),
  gro_devel         VARCHAR2(100),
  feed_die_cha      VARCHAR2(100),
  sex_cha_beh       VARCHAR2(100),
  sex_cha_beh_time  DATE,
  pat_fea_onc       VARCHAR2(100),
  pat_fea_onc_time  DATE,
  pat_fea_dia       VARCHAR2(100),
  pat_fea_dia_time  DATE,
  pat_fea_cer       VARCHAR2(100),
  pat_fea_cer_time  DATE,
  men_his           VARCHAR2(100),
  con_his           VARCHAR2(100),
  gra_his           VARCHAR2(100),
  child_his         VARCHAR2(100),
  pau_con           VARCHAR2(100),
  est_date          DATE,
  bir_med_num       VARCHAR2(100),
  bir_med_unit      VARCHAR2(100),
  time              DATE,
  sort_id           NUMBER,
  description       VARCHAR2(255),
  creator_id        VARCHAR2(120),
  creator           VARCHAR2(120),
  create_date       DATE,
  modifiedby        VARCHAR2(120),
  modifiedby_id     VARCHAR2(120),
  modified_date     DATE,
  version_status    NUMBER,
  version           NUMBER,
  latestversion     NUMBER,
  approvalstae      NUMBER,
  exa_remarks       VARCHAR2(500),
  patch_code        VARCHAR2(255)
)
;
comment on table POP_HEA_REC
  is '健康档案';
comment on column POP_HEA_REC.fam_dis_his
  is '家族病史';
comment on column POP_HEA_REC.fam_tak_time
  is '家族病史发病时间';
comment on column POP_HEA_REC.chr_dis_his
  is '慢性病史';
comment on column POP_HEA_REC.chr_dis_his_time
  is '慢性病史发病时间';
comment on column POP_HEA_REC.com_dis_his
  is '传染病史';
comment on column POP_HEA_REC.com_tak_time
  is '传染病史发病时间';
comment on column POP_HEA_REC.med_dis_his
  is '药物过敏及其过敏史';
comment on column POP_HEA_REC.med_tak_time
  is '药物过敏及其过敏史发病时间';
comment on column POP_HEA_REC.hos_sur_his
  is '住院及手术史';
comment on column POP_HEA_REC.hos_sur_tak_time
  is '住院及手术时间';
comment on column POP_HEA_REC.no_com_his
  is '非传染性疾病史';
comment on column POP_HEA_REC.no_com_tak_time
  is '非传染性疾病发病时间';
comment on column POP_HEA_REC.haz_fac_his
  is '职业危害因素史';
comment on column POP_HEA_REC.haz_fac_starttime
  is '从事危害职业开始时间';
comment on column POP_HEA_REC.haz_fac_endtime
  is '从事危害职业结束时间';
comment on column POP_HEA_REC.ris_beh_his
  is '行为危险因素史';
comment on column POP_HEA_REC.tra_his
  is '输血情况';
comment on column POP_HEA_REC.sleep_qua
  is '睡眠情况';
comment on column POP_HEA_REC.newboth_dis
  is '新生儿疾病';
comment on column POP_HEA_REC.birth_def
  is '出生缺陷';
comment on column POP_HEA_REC.gro_devel
  is '生长发育';
comment on column POP_HEA_REC.feed_die_cha
  is '喂食或营养膳食与饮食特征';
comment on column POP_HEA_REC.sex_cha_beh
  is '性特征与性行为';
comment on column POP_HEA_REC.sex_cha_beh_time
  is '性特征与性行为时间';
comment on column POP_HEA_REC.pat_fea_onc
  is '肿瘤高位指标';
comment on column POP_HEA_REC.pat_fea_onc_time
  is '肿瘤高位指标发现时间';
comment on column POP_HEA_REC.pat_fea_dia
  is '糖尿病高位指标';
comment on column POP_HEA_REC.pat_fea_dia_time
  is '糖尿病高位指标发现时间';
comment on column POP_HEA_REC.pat_fea_cer
  is '脑血管病高危指标';
comment on column POP_HEA_REC.pat_fea_cer_time
  is '脑血管病高危指标发现时间';
comment on column POP_HEA_REC.men_his
  is '月经史';
comment on column POP_HEA_REC.con_his
  is '避孕史';
comment on column POP_HEA_REC.gra_his
  is '怀孕史';
comment on column POP_HEA_REC.child_his
  is '分娩史';
comment on column POP_HEA_REC.pau_con
  is '绝经情况';
comment on column POP_HEA_REC.est_date
  is '建档时间';
comment on column POP_HEA_REC.bir_med_num
  is '出生医学证明编号';
comment on column POP_HEA_REC.bir_med_unit
  is '出生医学证明出具单位';
comment on column POP_HEA_REC.time
  is '时间戳';
comment on column POP_HEA_REC.sort_id
  is '排序';
comment on column POP_HEA_REC.description
  is '操作描述';
comment on column POP_HEA_REC.creator_id
  is '创建者id';
comment on column POP_HEA_REC.creator
  is '创建者';
comment on column POP_HEA_REC.create_date
  is '创建日期';
comment on column POP_HEA_REC.modifiedby
  is '修改人';
comment on column POP_HEA_REC.modifiedby_id
  is '修改人id';
comment on column POP_HEA_REC.modified_date
  is '修改日期';
comment on column POP_HEA_REC.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column POP_HEA_REC.version
  is '版本号';
comment on column POP_HEA_REC.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column POP_HEA_REC.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column POP_HEA_REC.exa_remarks
  is '审批备注';
comment on column POP_HEA_REC.patch_code
  is '批次号';

prompt
prompt Creating table POP_INJONJOB_INS
prompt ===============================
prompt
create table POP_INJONJOB_INS
(
  inj_state      VARCHAR2(100),
  inj_date       DATE,
  part_of_inj    VARCHAR2(100),
  inj_app_no     VARCHAR2(50),
  grade_of_inj   VARCHAR2(50),
  end_ins_sign   VARCHAR2(50),
  lab_ins_type   VARCHAR2(50),
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
  exa_remarks    VARCHAR2(500),
  patch_code     VARCHAR2(255)
)
;
comment on table POP_INJONJOB_INS
  is '工伤保险';
comment on column POP_INJONJOB_INS.inj_state
  is '发生工伤状态';
comment on column POP_INJONJOB_INS.inj_date
  is '工伤发生时间';
comment on column POP_INJONJOB_INS.part_of_inj
  is '伤害部位';
comment on column POP_INJONJOB_INS.inj_app_no
  is '工伤认定申请号';
comment on column POP_INJONJOB_INS.grade_of_inj
  is '伤残等级';
comment on column POP_INJONJOB_INS.end_ins_sign
  is '终止工伤保险待遇关系标志';
comment on column POP_INJONJOB_INS.lab_ins_type
  is '工伤待遇类别';
comment on column POP_INJONJOB_INS.time
  is '时间戳';
comment on column POP_INJONJOB_INS.sort_id
  is '排序';
comment on column POP_INJONJOB_INS.description
  is '操作描述';
comment on column POP_INJONJOB_INS.creator_id
  is '创建者id';
comment on column POP_INJONJOB_INS.creator
  is '创建者';
comment on column POP_INJONJOB_INS.create_date
  is '创建日期';
comment on column POP_INJONJOB_INS.modifiedby
  is '修改人';
comment on column POP_INJONJOB_INS.modifiedby_id
  is '修改人id';
comment on column POP_INJONJOB_INS.modified_date
  is '修改日期';
comment on column POP_INJONJOB_INS.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column POP_INJONJOB_INS.version
  is '版本号';
comment on column POP_INJONJOB_INS.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column POP_INJONJOB_INS.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column POP_INJONJOB_INS.exa_remarks
  is '审批备注';
comment on column POP_INJONJOB_INS.patch_code
  is '批次号';

prompt
prompt Creating table POP_LOW_INFO
prompt ===========================
prompt
create table POP_LOW_INFO
(
  pop_name     VARCHAR2(50),
  account_no   VARCHAR2(50),
  system_num   VARCHAR2(50),
  low_gua_num  VARCHAR2(50),
  money_incom  VARCHAR2(50),
  declar_date  DATE,
  classified   VARCHAR2(50),
  fam_num      NUMBER,
  bank_account VARCHAR2(50),
  relationship VARCHAR2(50),
  notes        VARCHAR2(50),
  time         DATE,
  sort_id      NUMBER,
  approvalstae NUMBER,
  bus_date     DATE,
  exa_remarks  VARCHAR2(500)
)
;
comment on table POP_LOW_INFO
  is '居民低保信息';
comment on column POP_LOW_INFO.pop_name
  is '姓名';
comment on column POP_LOW_INFO.account_no
  is '身份证号';
comment on column POP_LOW_INFO.system_num
  is '原系统编号';
comment on column POP_LOW_INFO.low_gua_num
  is '低保证号';
comment on column POP_LOW_INFO.money_incom
  is '家庭月收入';
comment on column POP_LOW_INFO.declar_date
  is '申报日期';
comment on column POP_LOW_INFO.classified
  is '分类施保';
comment on column POP_LOW_INFO.fam_num
  is '家庭人口';
comment on column POP_LOW_INFO.bank_account
  is '银行账号';
comment on column POP_LOW_INFO.relationship
  is '与低保户主关系';
comment on column POP_LOW_INFO.notes
  is '备注';
comment on column POP_LOW_INFO.time
  is '更新时间';
comment on column POP_LOW_INFO.sort_id
  is '排序';
comment on column POP_LOW_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column POP_LOW_INFO.bus_date
  is '业务日期';
comment on column POP_LOW_INFO.exa_remarks
  is '审批备注';

prompt
prompt Creating table POP_MAT_INS
prompt ==========================
prompt
create table POP_MAT_INS
(
  bear_type        VARCHAR2(100),
  enjoy_start_type DATE,
  enjoy_end_type   DATE,
  time             DATE,
  sort_id          NUMBER,
  description      VARCHAR2(255),
  creator_id       VARCHAR2(120),
  creator          VARCHAR2(120),
  create_date      DATE,
  modifiedby       VARCHAR2(120),
  modifiedby_id    VARCHAR2(120),
  modified_date    DATE,
  version_status   NUMBER,
  version          NUMBER,
  latestversion    NUMBER,
  approvalstae     NUMBER,
  exa_remarks      VARCHAR2(500),
  patch_code       VARCHAR2(255)
)
;
comment on table POP_MAT_INS
  is '生育保险';
comment on column POP_MAT_INS.bear_type
  is '生育待遇类别';
comment on column POP_MAT_INS.enjoy_start_type
  is '享受起始时间';
comment on column POP_MAT_INS.enjoy_end_type
  is '享受终止时间';
comment on column POP_MAT_INS.time
  is '时间戳';
comment on column POP_MAT_INS.sort_id
  is '排序';
comment on column POP_MAT_INS.description
  is '操作描述';
comment on column POP_MAT_INS.creator_id
  is '创建者id';
comment on column POP_MAT_INS.creator
  is '创建者';
comment on column POP_MAT_INS.create_date
  is '创建日期';
comment on column POP_MAT_INS.modifiedby
  is '修改人';
comment on column POP_MAT_INS.modifiedby_id
  is '修改人id';
comment on column POP_MAT_INS.modified_date
  is '修改日期';
comment on column POP_MAT_INS.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column POP_MAT_INS.version
  is '版本号';
comment on column POP_MAT_INS.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column POP_MAT_INS.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column POP_MAT_INS.exa_remarks
  is '审批备注';
comment on column POP_MAT_INS.patch_code
  is '批次号';

prompt
prompt Creating table POP_MED_INS
prompt ==========================
prompt
create table POP_MED_INS
(
  med_ins_no     VARCHAR2(50),
  per_type       VARCHAR2(50),
  per_ins_date   DATE,
  app_med_code   VARCHAR2(50),
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
  exa_remarks    VARCHAR2(500),
  patch_code     VARCHAR2(255)
)
;
comment on table POP_MED_INS
  is '医疗保险';
comment on column POP_MED_INS.med_ins_no
  is '医疗保险证号';
comment on column POP_MED_INS.per_type
  is '医疗参保人员类别';
comment on column POP_MED_INS.per_ins_date
  is '基本医疗保险个人账户建立日期';
comment on column POP_MED_INS.app_med_code
  is '定点医疗机构代码';
comment on column POP_MED_INS.time
  is '时间戳';
comment on column POP_MED_INS.sort_id
  is '排序';
comment on column POP_MED_INS.description
  is '操作描述';
comment on column POP_MED_INS.creator_id
  is '创建者id';
comment on column POP_MED_INS.creator
  is '创建者';
comment on column POP_MED_INS.create_date
  is '创建日期';
comment on column POP_MED_INS.modifiedby
  is '修改人';
comment on column POP_MED_INS.modifiedby_id
  is '修改人id';
comment on column POP_MED_INS.modified_date
  is '修改日期';
comment on column POP_MED_INS.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column POP_MED_INS.version
  is '版本号';
comment on column POP_MED_INS.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column POP_MED_INS.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column POP_MED_INS.exa_remarks
  is '审批备注';
comment on column POP_MED_INS.patch_code
  is '批次号';

prompt
prompt Creating table POP_PARTY_BUILD
prompt ==============================
prompt
create table POP_PARTY_BUILD
(
  pop_name     VARCHAR2(50),
  account_no   VARCHAR2(50),
  org_id       VARCHAR2(50),
  army_time    DATE,
  party_time   DATE,
  party_posts  VARCHAR2(50),
  party_group  VARCHAR2(50),
  tran_time    DATE,
  isworking    VARCHAR2(50),
  com_jur_unit VARCHAR2(50),
  notes        VARCHAR2(50),
  time         DATE,
  sort_id      NUMBER,
  approvalstae NUMBER,
  bus_date     DATE,
  exa_remarks  VARCHAR2(500)
)
;
comment on table POP_PARTY_BUILD
  is '居民党建信息';
comment on column POP_PARTY_BUILD.pop_name
  is '姓名';
comment on column POP_PARTY_BUILD.account_no
  is '身份证号';
comment on column POP_PARTY_BUILD.org_id
  is '隶属党组织ID';
comment on column POP_PARTY_BUILD.army_time
  is '入伍时间';
comment on column POP_PARTY_BUILD.party_time
  is '入党时间';
comment on column POP_PARTY_BUILD.party_posts
  is '党内职务';
comment on column POP_PARTY_BUILD.party_group
  is '党小组';
comment on column POP_PARTY_BUILD.tran_time
  is '转入时间';
comment on column POP_PARTY_BUILD.isworking
  is '退休/在职';
comment on column POP_PARTY_BUILD.com_jur_unit
  is '社区管辖单位';
comment on column POP_PARTY_BUILD.notes
  is '备注';
comment on column POP_PARTY_BUILD.time
  is '更新时间';
comment on column POP_PARTY_BUILD.sort_id
  is '排序';
comment on column POP_PARTY_BUILD.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column POP_PARTY_BUILD.bus_date
  is '业务日期';
comment on column POP_PARTY_BUILD.exa_remarks
  is '审批备注';

prompt
prompt Creating table POP_PRO_QUAL
prompt ===========================
prompt
create table POP_PRO_QUAL
(
  occ_type       VARCHAR2(100),
  occ_name       VARCHAR2(100),
  occ_qual_level VARCHAR2(100),
  qual_exa_name  VARCHAR2(100),
  qual_acq_time  VARCHAR2(100),
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
  exa_remarks    VARCHAR2(500),
  patch_code     VARCHAR2(255)
)
;
comment on table POP_PRO_QUAL
  is '职业资格';
comment on column POP_PRO_QUAL.occ_type
  is '职业类别';
comment on column POP_PRO_QUAL.occ_name
  is '职业名称';
comment on column POP_PRO_QUAL.occ_qual_level
  is '职业资格等级';
comment on column POP_PRO_QUAL.qual_exa_name
  is '资格审批单位名称';
comment on column POP_PRO_QUAL.qual_acq_time
  is '取得资格时间';
comment on column POP_PRO_QUAL.time
  is '时间戳';
comment on column POP_PRO_QUAL.sort_id
  is '排序';
comment on column POP_PRO_QUAL.description
  is '操作描述';
comment on column POP_PRO_QUAL.creator_id
  is '创建者id';
comment on column POP_PRO_QUAL.creator
  is '创建者';
comment on column POP_PRO_QUAL.create_date
  is '创建日期';
comment on column POP_PRO_QUAL.modifiedby
  is '修改人';
comment on column POP_PRO_QUAL.modifiedby_id
  is '修改人id';
comment on column POP_PRO_QUAL.modified_date
  is '修改日期';
comment on column POP_PRO_QUAL.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column POP_PRO_QUAL.version
  is '版本号';
comment on column POP_PRO_QUAL.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column POP_PRO_QUAL.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column POP_PRO_QUAL.exa_remarks
  is '审批备注';
comment on column POP_PRO_QUAL.patch_code
  is '批次号';

prompt
prompt Creating table POP_REG_RES
prompt ==========================
prompt
create table POP_REG_RES
(
  reg_res_type        VARCHAR2(50),
  reg_res_loca        VARCHAR2(200),
  reg_addr            VARCHAR2(200),
  reg_post            VARCHAR2(50),
  householder_id      VARCHAR2(50),
  householder_name    VARCHAR2(50),
  rel_bet_householder VARCHAR2(100),
  immigrantdate       DATE,
  emigrantdate        DATE,
  immigrant_rea       VARCHAR2(200),
  emigrant_rea        VARCHAR2(200),
  time                DATE,
  sort_id             NUMBER,
  description         VARCHAR2(255),
  creator_id          VARCHAR2(120),
  creator             VARCHAR2(120),
  create_date         DATE,
  modifiedby          VARCHAR2(120),
  modifiedby_id       VARCHAR2(120),
  modified_date       DATE,
  version_status      NUMBER,
  version             NUMBER,
  latestversion       NUMBER,
  approvalstae        NUMBER,
  exa_remarks         VARCHAR2(500),
  patch_code          VARCHAR2(255)
)
;
comment on table POP_REG_RES
  is '户口信箱';
comment on column POP_REG_RES.reg_res_type
  is '户口类别
';
comment on column POP_REG_RES.reg_res_loca
  is '户口所在地';
comment on column POP_REG_RES.reg_addr
  is '户籍登记地址';
comment on column POP_REG_RES.reg_post
  is '户口所在地邮政编码';
comment on column POP_REG_RES.householder_id
  is '户主身份证号码';
comment on column POP_REG_RES.householder_name
  is '户主姓名';
comment on column POP_REG_RES.rel_bet_householder
  is '与户主关系';
comment on column POP_REG_RES.immigrantdate
  is '迁入日期';
comment on column POP_REG_RES.emigrantdate
  is '迁出日期';
comment on column POP_REG_RES.immigrant_rea
  is '迁入原因';
comment on column POP_REG_RES.emigrant_rea
  is '迁出原因';
comment on column POP_REG_RES.time
  is '时间戳';
comment on column POP_REG_RES.sort_id
  is '排序';
comment on column POP_REG_RES.description
  is '操作描述';
comment on column POP_REG_RES.creator_id
  is '创建者id';
comment on column POP_REG_RES.creator
  is '创建者';
comment on column POP_REG_RES.create_date
  is '创建日期';
comment on column POP_REG_RES.modifiedby
  is '修改人';
comment on column POP_REG_RES.modifiedby_id
  is '修改人id';
comment on column POP_REG_RES.modified_date
  is '修改日期';
comment on column POP_REG_RES.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column POP_REG_RES.version
  is '版本号';
comment on column POP_REG_RES.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column POP_REG_RES.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column POP_REG_RES.exa_remarks
  is '审批备注';
comment on column POP_REG_RES.patch_code
  is '批次号';

prompt
prompt Creating table POP_RESIDENT
prompt ===========================
prompt
create table POP_RESIDENT
(
  gen_grid      VARCHAR2(50),
  build_name    VARCHAR2(50),
  room_num      VARCHAR2(50),
  build_use     VARCHAR2(50),
  house_prop    VARCHAR2(50),
  unit_prop     VARCHAR2(50),
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
  approvalstae  NUMBER,
  bus_date      DATE,
  exa_remarks   VARCHAR2(500)
)
;
comment on table POP_RESIDENT
  is '居民基础信息';
comment on column POP_RESIDENT.gen_grid
  is '所属网格';
comment on column POP_RESIDENT.build_name
  is '楼宇名称';
comment on column POP_RESIDENT.room_num
  is '房间号';
comment on column POP_RESIDENT.build_use
  is '楼宇使用性质';
comment on column POP_RESIDENT.house_prop
  is '住房性质';
comment on column POP_RESIDENT.unit_prop
  is '单元使用性质';
comment on column POP_RESIDENT.jur_area
  is '管辖区域';
comment on column POP_RESIDENT.jur_code
  is '管辖区域代码';
comment on column POP_RESIDENT.mng_type
  is '管理类型';
comment on column POP_RESIDENT.pop_type
  is '人口类型';
comment on column POP_RESIDENT.fam_num
  is '家庭编号';
comment on column POP_RESIDENT.home_addr
  is '家庭地址';
comment on column POP_RESIDENT.fix_ttl
  is '固定电话';
comment on column POP_RESIDENT.mb_phone
  is '移动电话';
comment on column POP_RESIDENT.rel_hsh
  is '与户主关系';
comment on column POP_RESIDENT.hsh_status
  is '人户状态';
comment on column POP_RESIDENT.pop_name
  is '姓名';
comment on column POP_RESIDENT.pop_sex
  is '性别';
comment on column POP_RESIDENT.birthday
  is '出生日期';
comment on column POP_RESIDENT.dom_type
  is '证件类型';
comment on column POP_RESIDENT.account_no
  is '证件号';
comment on column POP_RESIDENT.nation
  is '民族';
comment on column POP_RESIDENT.deg_edu
  is '文化程度';
comment on column POP_RESIDENT.occupation
  is '职业';
comment on column POP_RESIDENT.work_unit
  is '工作单位';
comment on column POP_RESIDENT.reg_code
  is '户籍地代码';
comment on column POP_RESIDENT.domicile
  is '户籍地';
comment on column POP_RESIDENT.hs_tel
  is '户籍地联系电话';
comment on column POP_RESIDENT.isonlychild
  is '是否独子';
comment on column POP_RESIDENT.office_tel
  is '办公电话';
comment on column POP_RESIDENT.fa_name
  is '父亲姓名';
comment on column POP_RESIDENT.ma_name
  is '母亲姓名';
comment on column POP_RESIDENT.mar_status
  is '婚姻状况';
comment on column POP_RESIDENT.mar_date
  is '婚姻日期';
comment on column POP_RESIDENT.spouse_name
  is '配偶名字';
comment on column POP_RESIDENT.spouse_birth
  is '配偶出生日期';
comment on column POP_RESIDENT.spouse_no
  is '配偶身份证';
comment on column POP_RESIDENT.child_num
  is '现孩数';
comment on column POP_RESIDENT.boy_num
  is '现男孩数';
comment on column POP_RESIDENT.girl_num
  is '现女孩数';
comment on column POP_RESIDENT.issue_date
  is '发证日期';
comment on column POP_RESIDENT.discipline
  is '是否违纪';
comment on column POP_RESIDENT.ctp_mea
  is '节育措施';
comment on column POP_RESIDENT.cont_date
  is '节育日期';
comment on column POP_RESIDENT.cont_note
  is '节育备注';
comment on column POP_RESIDENT.is_wmcheck
  is '是否需要妇检';
comment on column POP_RESIDENT.isglo_cer
  is '有无光荣证';
comment on column POP_RESIDENT.current_addr
  is '现居住地址';
comment on column POP_RESIDENT.landlord_name
  is '房东姓名';
comment on column POP_RESIDENT.landlord_id
  is '房东身份证';
comment on column POP_RESIDENT.isspouse_loc
  is '配偶是否本地';
comment on column POP_RESIDENT.spouse_dom
  is '配偶户籍地';
comment on column POP_RESIDENT.pop_status
  is '人员状态';
comment on column POP_RESIDENT.pop_ctg
  is '人员类别';
comment on column POP_RESIDENT.obtain_date
  is '入户时间';
comment on column POP_RESIDENT.exit_date
  is '出户时间';
comment on column POP_RESIDENT.reg_date
  is '登记日期';
comment on column POP_RESIDENT.leave_date
  is '离籍时间';
comment on column POP_RESIDENT.height
  is '身高';
comment on column POP_RESIDENT.form_name
  is '曾用名';
comment on column POP_RESIDENT.occu_type
  is '职业类别';
comment on column POP_RESIDENT.pol_visage
  is '政治面貌';
comment on column POP_RESIDENT.note
  is '备注';
comment on column POP_RESIDENT.rel_beli
  is '宗教信仰';
comment on column POP_RESIDENT.nationality
  is '国籍';
comment on column POP_RESIDENT.time
  is '时间戳';
comment on column POP_RESIDENT.sort_id
  is '排序';
comment on column POP_RESIDENT.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column POP_RESIDENT.bus_date
  is '业务日期';
comment on column POP_RESIDENT.exa_remarks
  is '审批备注';

prompt
prompt Creating table POP_SCO_INS_INFO
prompt ===============================
prompt
create table POP_SCO_INS_INFO
(
  per_jion_date     DATE,
  per_jion_state    VARCHAR2(50),
  ins_type          VARCHAR2(50),
  sco_ins_no        VARCHAR2(50),
  bill_pay_code     VARCHAR2(50),
  bill_pay_name     VARCHAR2(100),
  bill_pay_per_type VARCHAR2(50),
  time              DATE,
  sort_id           NUMBER,
  description       VARCHAR2(255),
  creator_id        VARCHAR2(120),
  creator           VARCHAR2(120),
  create_date       DATE,
  modifiedby        VARCHAR2(120),
  modifiedby_id     VARCHAR2(120),
  modified_date     DATE,
  version_status    NUMBER,
  version           NUMBER,
  latestversion     NUMBER,
  approvalstae      NUMBER,
  exa_remarks       VARCHAR2(500),
  patch_code        VARCHAR2(255)
)
;
comment on table POP_SCO_INS_INFO
  is '就业状况';
comment on column POP_SCO_INS_INFO.per_jion_date
  is '个人参保日期';
comment on column POP_SCO_INS_INFO.per_jion_state
  is '个人参保状态';
comment on column POP_SCO_INS_INFO.ins_type
  is '险种类型';
comment on column POP_SCO_INS_INFO.sco_ins_no
  is '社会保险登记证号码';
comment on column POP_SCO_INS_INFO.bill_pay_code
  is '缴费地区代码';
comment on column POP_SCO_INS_INFO.bill_pay_name
  is '缴费单位名称';
comment on column POP_SCO_INS_INFO.bill_pay_per_type
  is '缴费人员类别';
comment on column POP_SCO_INS_INFO.time
  is '时间戳';
comment on column POP_SCO_INS_INFO.sort_id
  is '排序';
comment on column POP_SCO_INS_INFO.description
  is '操作描述';
comment on column POP_SCO_INS_INFO.creator_id
  is '创建者id';
comment on column POP_SCO_INS_INFO.creator
  is '创建者';
comment on column POP_SCO_INS_INFO.create_date
  is '创建日期';
comment on column POP_SCO_INS_INFO.modifiedby
  is '修改人';
comment on column POP_SCO_INS_INFO.modifiedby_id
  is '修改人id';
comment on column POP_SCO_INS_INFO.modified_date
  is '修改日期';
comment on column POP_SCO_INS_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column POP_SCO_INS_INFO.version
  is '版本号';
comment on column POP_SCO_INS_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column POP_SCO_INS_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column POP_SCO_INS_INFO.exa_remarks
  is '审批备注';
comment on column POP_SCO_INS_INFO.patch_code
  is '批次号';

prompt
prompt Creating table POP_UNE_INS
prompt ==========================
prompt
create table POP_UNE_INS
(
  enjoy_date        DATE,
  ever_rec_ide      VARCHAR2(50),
  should_rec_months NUMBER,
  time              DATE,
  sort_id           NUMBER,
  description       VARCHAR2(255),
  creator_id        VARCHAR2(120),
  creator           VARCHAR2(120),
  create_date       DATE,
  modifiedby        VARCHAR2(120),
  modifiedby_id     VARCHAR2(120),
  modified_date     DATE,
  version_status    NUMBER,
  version           NUMBER,
  latestversion     NUMBER,
  approvalstae      NUMBER,
  exa_remarks       VARCHAR2(500),
  patch_code        VARCHAR2(255)
)
;
comment on table POP_UNE_INS
  is '失业保险';
comment on column POP_UNE_INS.enjoy_date
  is '享受失业保险起始日期';
comment on column POP_UNE_INS.ever_rec_ide
  is '失业待遇类别';
comment on column POP_UNE_INS.should_rec_months
  is '应领取失业保险金月数';
comment on column POP_UNE_INS.time
  is '时间戳';
comment on column POP_UNE_INS.sort_id
  is '排序';
comment on column POP_UNE_INS.description
  is '操作描述';
comment on column POP_UNE_INS.creator_id
  is '创建者id';
comment on column POP_UNE_INS.creator
  is '创建者';
comment on column POP_UNE_INS.create_date
  is '创建日期';
comment on column POP_UNE_INS.modifiedby
  is '修改人';
comment on column POP_UNE_INS.modifiedby_id
  is '修改人id';
comment on column POP_UNE_INS.modified_date
  is '修改日期';
comment on column POP_UNE_INS.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column POP_UNE_INS.version
  is '版本号';
comment on column POP_UNE_INS.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column POP_UNE_INS.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column POP_UNE_INS.exa_remarks
  is '审批备注';
comment on column POP_UNE_INS.patch_code
  is '批次号';


spool off
