--------------------------------------------
-- Export file for user C##_BIGDATA@ZZMDM --
-- Created by zhy on 2017/10/13, 12:54:12 --
--------------------------------------------

set define off
spool tmp.log

prompt
prompt Creating table TMP_AC_PRJ_BASEINFO
prompt ==================================
prompt
create table TMP_AC_PRJ_BASEINFO
(
  project_id        INTEGER,
  project_code      VARCHAR2(255),
  project_name      VARCHAR2(255),
  projectsetuptime  DATE,
  approvefile       VARCHAR2(255),
  approveunit       VARCHAR2(255),
  projectstatus     VARCHAR2(255),
  projectstatuscode NUMBER,
  projecttype       VARCHAR2(255),
  projecttypecode   NUMBER,
  targetbegintime   DATE,
  targetendtime     DATE,
  neworcontinued    VARCHAR2(255),
  actbegintime      DATE,
  actendtime        DATE,
  investamount      NUMBER,
  investamountyear  NUMBER,
  projectscale      VARCHAR2(255),
  projectcontent    VARCHAR2(255),
  projectaddr       VARCHAR2(255),
  projecteps        VARCHAR2(255),
  responsibleteam   VARCHAR2(255),
  desctext          VARCHAR2(400),
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
  bus_date          DATE,
  exa_remarks       VARCHAR2(500),
  src_table         VARCHAR2(255),
  src_system        VARCHAR2(255),
  sort_id           NUMBER(38)
)
;

prompt
prompt Creating table TMP_AC_PRJ_CONTRACT
prompt ==================================
prompt
create table TMP_AC_PRJ_CONTRACT
(
  project_id     INTEGER,
  project_code   VARCHAR2(255),
  contractcode   VARCHAR2(255),
  contractname   VARCHAR2(255),
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
  exa_remarks    VARCHAR2(500),
  src_table      VARCHAR2(255),
  src_system     VARCHAR2(255),
  sort_id        NUMBER(38)
)
;

prompt
prompt Creating table TMP_AC_PRJ_INVESTINFO
prompt ====================================
prompt
create table TMP_AC_PRJ_INVESTINFO
(
  project_id     INTEGER,
  project_code   VARCHAR2(255),
  originalamount NUMBER,
  currentamount  NUMBER,
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
  exa_remarks    VARCHAR2(500),
  src_table      VARCHAR2(255),
  src_system     VARCHAR2(255),
  sort_id        NUMBER(38)
)
;

prompt
prompt Creating table TMP_AC_PRJ_INVESTMENT
prompt ====================================
prompt
create table TMP_AC_PRJ_INVESTMENT
(
  project_id          INTEGER,
  project_code        VARCHAR2(255),
  originalamount      NUMBER,
  currentamount       NUMBER,
  investyear          NUMBER,
  investamount        NUMBER,
  plannedamount       NUMBER,
  actualamount        NUMBER,
  estimateinvestment  NUMBER,
  budgetaryinvestment NUMBER,
  contractcode        VARCHAR2(255),
  contractname        VARCHAR2(255),
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
  bus_date            DATE,
  exa_remarks         VARCHAR2(500),
  src_table           VARCHAR2(255),
  src_system          VARCHAR2(255),
  sort_id             NUMBER(38)
)
;

prompt
prompt Creating table TMP_AC_PRJ_LAND
prompt ==============================
prompt
create table TMP_AC_PRJ_LAND
(
  project_id     INTEGER,
  project_code   VARCHAR2(255),
  code           VARCHAR2(255),
  name           VARCHAR2(255),
  finishdate     DATE,
  type           VARCHAR2(255),
  arrivesate     VARCHAR2(255),
  realarrivesate VARCHAR2(255),
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
  exa_remarks    VARCHAR2(500),
  src_table      VARCHAR2(255),
  src_system     VARCHAR2(255),
  sort_id        NUMBER(38)
)
;

prompt
prompt Creating table TMP_AC_PRJ_LANDPRJ
prompt =================================
prompt
create table TMP_AC_PRJ_LANDPRJ
(
  project_id             INTEGER,
  project_code           VARCHAR2(255),
  project_name           VARCHAR2(255),
  projectsetuptime       DATE,
  approvefile            VARCHAR2(255),
  approveunit            VARCHAR2(255),
  projectstatus          VARCHAR2(255),
  projectstatuscode      NUMBER,
  projecttype            VARCHAR2(255),
  projecttypecode        NUMBER,
  targetbegintime        DATE,
  targetendtime          DATE,
  neworcontinued         VARCHAR2(255),
  actbegintime           DATE,
  actendtime             DATE,
  investamount           NUMBER,
  investamountyear       NUMBER,
  projectscale           VARCHAR2(255),
  projectcontent         VARCHAR2(255),
  projectaddr            VARCHAR2(255),
  projecteps             VARCHAR2(255),
  responsibleteam        VARCHAR2(255),
  desctext               VARCHAR2(400),
  role                   VARCHAR2(255),
  unitcode               VARCHAR2(255),
  unitname               VARCHAR2(255),
  contactperson          VARCHAR2(255),
  land_code              VARCHAR2(255),
  land_name              VARCHAR2(255),
  land_finishdate        DATE,
  land_type              VARCHAR2(255),
  land_arrivesate        VARCHAR2(255),
  land_realarrivesate    VARCHAR2(255),
  changereason           VARCHAR2(255),
  changedate             DATE,
  changeamount           NUMBER,
  buyredline54coord      VARCHAR2(255),
  buyredline80coord      VARCHAR2(255),
  isredclaim             VARCHAR2(255),
  claimscope             VARCHAR2(255),
  ownerunit              VARCHAR2(255),
  prjunit                VARCHAR2(255),
  land_description       VARCHAR2(255),
  planprice              NUMBER,
  plantotalamout         NUMBER,
  claimfinishdate        DATE,
  referdate              DATE,
  approvenum             VARCHAR2(255),
  approvedate            DATE,
  buyarea_mu             NUMBER,
  buyarea_square         NUMBER,
  payoffprj              VARCHAR2(255),
  makeprjnum             VARCHAR2(255),
  makeprjcode            VARCHAR2(255),
  contamount             NUMBER,
  prjperiod              NUMBER,
  conttotalamount        NUMBER,
  estimatequantity       NUMBER,
  coverstonebuyprice     NUMBER,
  coverestimatetotalcost NUMBER,
  digestimatetotalcost   NUMBER,
  performancebond        NUMBER,
  emergencybond          NUMBER,
  constructionunit       VARCHAR2(255),
  digareanum             VARCHAR2(255),
  diglandnum             VARCHAR2(255),
  expectedigarea         NUMBER,
  coverareanum           VARCHAR2(255),
  coverlandnum           VARCHAR2(255),
  expectecoverarea       NUMBER,
  description            VARCHAR2(255),
  creator_id             VARCHAR2(120),
  creator                VARCHAR2(120),
  create_date            DATE,
  modifiedby             VARCHAR2(120),
  modifiedby_id          VARCHAR2(120),
  modified_date          DATE,
  version_status         NUMBER,
  version                NUMBER,
  latestversion          NUMBER,
  approvalstae           NUMBER,
  bus_date               DATE,
  exa_remarks            VARCHAR2(500),
  src_table              VARCHAR2(255),
  src_system             VARCHAR2(255),
  sort_id                NUMBER(38)
)
;

prompt
prompt Creating table TMP_LEG_PER_BASIC_INFO
prompt =====================================
prompt
create table TMP_LEG_PER_BASIC_INFO
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

prompt
prompt Creating table TMP_LEG_PER_BASIC_INFO_BAK
prompt =========================================
prompt
create table TMP_LEG_PER_BASIC_INFO_BAK
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

prompt
prompt Creating table TMP_LEG_PER_CONTACT_INFO
prompt =======================================
prompt
create table TMP_LEG_PER_CONTACT_INFO
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

prompt
prompt Creating table TMP_LEG_PER_CONTACT_INFO_BAK
prompt ===========================================
prompt
create table TMP_LEG_PER_CONTACT_INFO_BAK
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

prompt
prompt Creating table TMP_LEG_PER_REG_INFO
prompt ===================================
prompt
create table TMP_LEG_PER_REG_INFO
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

prompt
prompt Creating table TMP_LEG_PER_REG_INFO_BAK
prompt =======================================
prompt
create table TMP_LEG_PER_REG_INFO_BAK
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

prompt
prompt Creating table TMP_LEG_PER_TAX_INFO
prompt ===================================
prompt
create table TMP_LEG_PER_TAX_INFO
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

prompt
prompt Creating table TMP_LEG_PER_TAX_INFO_BAK
prompt =======================================
prompt
create table TMP_LEG_PER_TAX_INFO_BAK
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

prompt
prompt Creating table TMP_MAC_ECO_INDEX
prompt ================================
prompt
create table TMP_MAC_ECO_INDEX
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

prompt
prompt Creating table TMP_MAC_ECO_INDEX_BAK
prompt ====================================
prompt
create table TMP_MAC_ECO_INDEX_BAK
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

prompt
prompt Creating table TMP_POP_BASIC_INFO
prompt =================================
prompt
create table TMP_POP_BASIC_INFO
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

prompt
prompt Creating table TMP_POP_BASIC_INFO_BAK
prompt =====================================
prompt
create table TMP_POP_BASIC_INFO_BAK
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

prompt
prompt Creating table TMP_POP_END_INS
prompt ==============================
prompt
create table TMP_POP_END_INS
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

prompt
prompt Creating table TMP_POP_MAT_INS
prompt ==============================
prompt
create table TMP_POP_MAT_INS
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


spool off
