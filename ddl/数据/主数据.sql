--------------------------------------------
-- Export file for user C##_BIGDATA@ZZMDM --
-- Created by zhy on 2017/10/13, 11:39:06 --
--------------------------------------------

set define off
spool ������.log

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
  is '���˻�����Ϣ';
comment on column LEG_PER_BASIC_INFO.usc_code
  is 'ͳһ������ô���';
comment on column LEG_PER_BASIC_INFO.org_code
  is '��֯��������';
comment on column LEG_PER_BASIC_INFO.leg_per_name
  is '��������';
comment on column LEG_PER_BASIC_INFO.leg_per_state
  is '����״̬';
comment on column LEG_PER_BASIC_INFO.reg_type_code
  is '�Ǽ����ͱ�ţ���Ӧdim_reg_type��reg_type_code�ֶΣ�';
comment on column LEG_PER_BASIC_INFO.reg_type
  is '�Ǽ�����';
comment on column LEG_PER_BASIC_INFO.bus_place
  is '����ס��';
comment on column LEG_PER_BASIC_INFO.operator
  is '��������������';
comment on column LEG_PER_BASIC_INFO.open_date
  is '��������';
comment on column LEG_PER_BASIC_INFO.reg_dpt
  is '��׼����';
comment on column LEG_PER_BASIC_INFO.reg_num
  is 'ע���';
comment on column LEG_PER_BASIC_INFO.time_stamp
  is 'ʱ���';
comment on column LEG_PER_BASIC_INFO.sort_id
  is '����';
comment on column LEG_PER_BASIC_INFO.description
  is '��������';
comment on column LEG_PER_BASIC_INFO.creator_id
  is '������id';
comment on column LEG_PER_BASIC_INFO.creator
  is '������';
comment on column LEG_PER_BASIC_INFO.create_date
  is '��������';
comment on column LEG_PER_BASIC_INFO.modifiedby
  is '�޸���';
comment on column LEG_PER_BASIC_INFO.modifiedby_id
  is '�޸���id';
comment on column LEG_PER_BASIC_INFO.modified_date
  is '�޸�����';
comment on column LEG_PER_BASIC_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LEG_PER_BASIC_INFO.version
  is '�汾��';
comment on column LEG_PER_BASIC_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LEG_PER_BASIC_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LEG_PER_BASIC_INFO.exa_remarks
  is '������ע';
comment on column LEG_PER_BASIC_INFO.src_entity
  is 'Դʵ��';
comment on column LEG_PER_BASIC_INFO.patch_code
  is '���κ�';

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
  is '������ϵ��Ϣ';
comment on column LEG_PER_CONTACT_INFO.reg_num
  is 'ע���';
comment on column LEG_PER_CONTACT_INFO.postcode
  is '��������';
comment on column LEG_PER_CONTACT_INFO.operator_tel
  is '��ϵ�绰';
comment on column LEG_PER_CONTACT_INFO.fax
  is '����';
comment on column LEG_PER_CONTACT_INFO.iter_adr
  is '��������ַ';
comment on column LEG_PER_CONTACT_INFO.liaison
  is '��ʾ����Ա';
comment on column LEG_PER_CONTACT_INFO.liaison_tel
  is '��ʾ����绰';
comment on column LEG_PER_CONTACT_INFO.e_mail
  is '��������';
comment on column LEG_PER_CONTACT_INFO.src_entity
  is 'Դʵ��';
comment on column LEG_PER_CONTACT_INFO.time_stamp
  is 'ʱ���';
comment on column LEG_PER_CONTACT_INFO.sort_id
  is '�����ֶ�';
comment on column LEG_PER_CONTACT_INFO.description
  is '��������';
comment on column LEG_PER_CONTACT_INFO.creator_id
  is '������id';
comment on column LEG_PER_CONTACT_INFO.creator
  is '������';
comment on column LEG_PER_CONTACT_INFO.create_date
  is '��������';
comment on column LEG_PER_CONTACT_INFO.modifiedby
  is '�޸���';
comment on column LEG_PER_CONTACT_INFO.modifiedby_id
  is '�޸���id';
comment on column LEG_PER_CONTACT_INFO.modified_date
  is '�޸�����';
comment on column LEG_PER_CONTACT_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LEG_PER_CONTACT_INFO.version
  is '�汾��';
comment on column LEG_PER_CONTACT_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LEG_PER_CONTACT_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LEG_PER_CONTACT_INFO.exa_remarks
  is '������ע';
comment on column LEG_PER_CONTACT_INFO.patch_code
  is '���κ�';

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
  is 'Ӫҵ����ע���Ǽ���Ϣ��';
comment on column LEG_PER_REG_INFO.reg_num
  is 'ע���';
comment on column LEG_PER_REG_INFO.reg_org_name
  is 'ע���������';
comment on column LEG_PER_REG_INFO.idt_ctgr_code
  is '��ҵ������루��Ӧdim_idt_ctgr��idt_ctgr_code�ֶΣ�';
comment on column LEG_PER_REG_INFO.idt_ctgr
  is '��ҵ����';
comment on column LEG_PER_REG_INFO.trade_type
  is '��ҵ���';
comment on column LEG_PER_REG_INFO.trade_code
  is '��ҵ����';
comment on column LEG_PER_REG_INFO.bus_scope
  is '��Ӫ��Χ';
comment on column LEG_PER_REG_INFO.bus_mode
  is '��Ӫ��ʽ';
comment on column LEG_PER_REG_INFO.id_card_type
  is '���֤������';
comment on column LEG_PER_REG_INFO.id_card_num
  is '���֤������';
comment on column LEG_PER_REG_INFO.reg_capital
  is 'ע���ʱ�';
comment on column LEG_PER_REG_INFO.paid_capital
  is 'ʵ���ʱ�';
comment on column LEG_PER_REG_INFO.cur_type
  is '����';
comment on column LEG_PER_REG_INFO.etp_ctg
  is '��ҵ���';
comment on column LEG_PER_REG_INFO.etp_type
  is '��ҵ����';
comment on column LEG_PER_REG_INFO.bus_term
  is 'Ӫҵ����';
comment on column LEG_PER_REG_INFO.sha_con_id
  is '�ɶ������ʱ��ID';
comment on column LEG_PER_REG_INFO.bank_name
  is '������������';
comment on column LEG_PER_REG_INFO.bank_acc
  is '�����˺�';
comment on column LEG_PER_REG_INFO.country_code
  is '������������';
comment on column LEG_PER_REG_INFO.src_entity
  is 'Դʵ��';
comment on column LEG_PER_REG_INFO.time_stamp
  is 'ʱ���';
comment on column LEG_PER_REG_INFO.sort_id
  is '�����ֶ�';
comment on column LEG_PER_REG_INFO.description
  is '��������';
comment on column LEG_PER_REG_INFO.creator_id
  is '������id';
comment on column LEG_PER_REG_INFO.creator
  is '������';
comment on column LEG_PER_REG_INFO.create_date
  is '��������';
comment on column LEG_PER_REG_INFO.modifiedby
  is '�޸���';
comment on column LEG_PER_REG_INFO.modifiedby_id
  is '�޸���id';
comment on column LEG_PER_REG_INFO.modified_date
  is '�޸�����';
comment on column LEG_PER_REG_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LEG_PER_REG_INFO.version
  is '�汾��';
comment on column LEG_PER_REG_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LEG_PER_REG_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LEG_PER_REG_INFO.exa_remarks
  is '������ע';
comment on column LEG_PER_REG_INFO.patch_code
  is '���κ�';

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
  is '˰����Ϣ';
comment on column LEG_PER_TAX_INFO.usc_code
  is '��˰��ʶ���';
comment on column LEG_PER_TAX_INFO.com_tax_aut
  is '˰��Ǽǻ�������';
comment on column LEG_PER_TAX_INFO.reg_date
  is '˰��Ǽ�����';
comment on column LEG_PER_TAX_INFO.cancel_date
  is 'ע��˰��Ǽ�����';
comment on column LEG_PER_TAX_INFO.iden_date
  is '���������϶�����';
comment on column LEG_PER_TAX_INFO.remove_date
  is '���������������';
comment on column LEG_PER_TAX_INFO.time_stamp
  is '����ʱ��';
comment on column LEG_PER_TAX_INFO.sort_id
  is '����';
comment on column LEG_PER_TAX_INFO.description
  is '��������';
comment on column LEG_PER_TAX_INFO.creator_id
  is '������id';
comment on column LEG_PER_TAX_INFO.creator
  is '������';
comment on column LEG_PER_TAX_INFO.create_date
  is '��������';
comment on column LEG_PER_TAX_INFO.modifiedby
  is '�޸���';
comment on column LEG_PER_TAX_INFO.modifiedby_id
  is '�޸���id';
comment on column LEG_PER_TAX_INFO.modified_date
  is '�޸�����';
comment on column LEG_PER_TAX_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LEG_PER_TAX_INFO.version
  is '�汾��';
comment on column LEG_PER_TAX_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LEG_PER_TAX_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LEG_PER_TAX_INFO.exa_remarks
  is '������ע';
comment on column LEG_PER_TAX_INFO.patch_code
  is '���κ�';

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
  is '��۾���ָ���ۺϱ�';
comment on column MAC_ECO_INDEX.index_month
  is '����';
comment on column MAC_ECO_INDEX.index_code
  is '��۾���ָ���ۺϱ���';
comment on column MAC_ECO_INDEX.index_name
  is '��۾���ָ����';
comment on column MAC_ECO_INDEX.unit
  is '��λ';
comment on column MAC_ECO_INDEX.cur_month_val
  is '���������';
comment on column MAC_ECO_INDEX.cur_year_val
  is '1-�����ۼ���';
comment on column MAC_ECO_INDEX.last_year_val
  is '�����ۼ���';
comment on column MAC_ECO_INDEX.yoy_growth
  is 'ͬ������';
comment on column MAC_ECO_INDEX.dz_grow_rate
  is '��ƻ�����  �ƻ�(����)';
comment on column MAC_ECO_INDEX.dz_com_rate
  is '��ƻ����� ����ʣ�˵����';
comment on column MAC_ECO_INDEX.zz_plan_task
  is '��ƻ����� �ƻ�';
comment on column MAC_ECO_INDEX.zz_com_rate
  is '��ƻ����� �����';
comment on column MAC_ECO_INDEX.notes
  is '��ע';
comment on column MAC_ECO_INDEX.ym_code
  is '���±���';
comment on column MAC_ECO_INDEX.input_date
  is '����';
comment on column MAC_ECO_INDEX.update_time
  is '����ʱ��';
comment on column MAC_ECO_INDEX.sort_id
  is '����';
comment on column MAC_ECO_INDEX.description
  is '��������';
comment on column MAC_ECO_INDEX.creator_id
  is '������id';
comment on column MAC_ECO_INDEX.creator
  is '������';
comment on column MAC_ECO_INDEX.create_date
  is '��������';
comment on column MAC_ECO_INDEX.modifiedby
  is '�޸���';
comment on column MAC_ECO_INDEX.modifiedby_id
  is '�޸���id';
comment on column MAC_ECO_INDEX.modified_date
  is '�޸�����';
comment on column MAC_ECO_INDEX.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column MAC_ECO_INDEX.version
  is '�汾��';
comment on column MAC_ECO_INDEX.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column MAC_ECO_INDEX.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column MAC_ECO_INDEX.exa_remarks
  is '������ע';
comment on column MAC_ECO_INDEX.patch_code
  is '���κ�';

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
  is '��������';
comment on column POP_BAISHA.jur_area
  is '��Ͻ����';
comment on column POP_BAISHA.jur_code
  is '��Ͻ�������';
comment on column POP_BAISHA.mng_type
  is '��������';
comment on column POP_BAISHA.pop_type
  is '�˿�����';
comment on column POP_BAISHA.fam_num
  is '��ͥ���';
comment on column POP_BAISHA.home_addr
  is '��ͥ��ַ';
comment on column POP_BAISHA.fix_ttl
  is '�̶��绰';
comment on column POP_BAISHA.mb_phone
  is '�ƶ��绰';
comment on column POP_BAISHA.rel_hsh
  is '�뻧����ϵ';
comment on column POP_BAISHA.hsh_status
  is '�˻�״̬';
comment on column POP_BAISHA.pop_name
  is '����';
comment on column POP_BAISHA.pop_sex
  is '�Ա�';
comment on column POP_BAISHA.birthday
  is '��������';
comment on column POP_BAISHA.dom_type
  is '֤������';
comment on column POP_BAISHA.account_no
  is '֤����';
comment on column POP_BAISHA.nation
  is '����';
comment on column POP_BAISHA.deg_edu
  is '�Ļ��̶�';
comment on column POP_BAISHA.occupation
  is 'ְҵ';
comment on column POP_BAISHA.work_unit
  is '������λ';
comment on column POP_BAISHA.reg_code
  is '�����ش���';
comment on column POP_BAISHA.domicile
  is '������';
comment on column POP_BAISHA.hs_tel
  is '��������ϵ�绰';
comment on column POP_BAISHA.isonlychild
  is '�Ƿ����';
comment on column POP_BAISHA.office_tel
  is '�칫�绰';
comment on column POP_BAISHA.fa_name
  is '��������';
comment on column POP_BAISHA.ma_name
  is 'ĸ������';
comment on column POP_BAISHA.mar_status
  is '����״��';
comment on column POP_BAISHA.mar_date
  is '��������';
comment on column POP_BAISHA.spouse_name
  is '��ż����';
comment on column POP_BAISHA.spouse_birth
  is '��ż��������';
comment on column POP_BAISHA.spouse_no
  is '��ż���֤';
comment on column POP_BAISHA.child_num
  is '�ֺ���';
comment on column POP_BAISHA.boy_num
  is '���к���';
comment on column POP_BAISHA.girl_num
  is '��Ů����';
comment on column POP_BAISHA.issue_date
  is '��֤����';
comment on column POP_BAISHA.discipline
  is '�Ƿ�Υ��';
comment on column POP_BAISHA.ctp_mea
  is '������ʩ';
comment on column POP_BAISHA.cont_date
  is '��������';
comment on column POP_BAISHA.cont_note
  is '������ע';
comment on column POP_BAISHA.is_wmcheck
  is '�Ƿ���Ҫ����';
comment on column POP_BAISHA.isglo_cer
  is '���޹���֤';
comment on column POP_BAISHA.current_addr
  is '�־�ס��ַ';
comment on column POP_BAISHA.landlord_name
  is '��������';
comment on column POP_BAISHA.landlord_id
  is '�������֤';
comment on column POP_BAISHA.isspouse_loc
  is '��ż�Ƿ񱾵�';
comment on column POP_BAISHA.spouse_dom
  is '��ż������';
comment on column POP_BAISHA.pop_status
  is '��Ա״̬';
comment on column POP_BAISHA.pop_ctg
  is '��Ա���';
comment on column POP_BAISHA.obtain_date
  is '�뻧ʱ��';
comment on column POP_BAISHA.exit_date
  is '����ʱ��';
comment on column POP_BAISHA.reg_date
  is '�Ǽ�����';
comment on column POP_BAISHA.leave_date
  is '�뼮ʱ��';
comment on column POP_BAISHA.height
  is '���';
comment on column POP_BAISHA.form_name
  is '������';
comment on column POP_BAISHA.occu_type
  is 'ְҵ���';
comment on column POP_BAISHA.pol_visage
  is '������ò';
comment on column POP_BAISHA.note
  is '��ע';
comment on column POP_BAISHA.rel_beli
  is '�ڽ�����';
comment on column POP_BAISHA.nationality
  is '����';
comment on column POP_BAISHA.exa_remarks
  is '������ע';

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
  is '�˿ڻ�����Ϣ';
comment on column POP_BASIC_INFO.account_no
  is '������ݺ���';
comment on column POP_BASIC_INFO.pop_name
  is '����';
comment on column POP_BASIC_INFO.pop_sex_code
  is '�Ա����(��Ӧdim_sex��sex_code�ֶ�)';
comment on column POP_BASIC_INFO.pop_sex
  is '�Ա�';
comment on column POP_BASIC_INFO.nation
  is '����';
comment on column POP_BASIC_INFO.birthday
  is '��������';
comment on column POP_BASIC_INFO.form_name
  is '������';
comment on column POP_BASIC_INFO.height
  is '���';
comment on column POP_BASIC_INFO.marry_status_code
  is '����״�����루��Ӧdim_marry_status��MARRY_STATUS_CODE�ֶΣ�';
comment on column POP_BASIC_INFO.marry_status
  is '����״��';
comment on column POP_BASIC_INFO.marry_date
  is '�����Ǽ�ʱ��';
comment on column POP_BASIC_INFO.pol_visage
  is '������ò';
comment on column POP_BASIC_INFO.pop_ctg
  is '��Ա���';
comment on column POP_BASIC_INFO.fix_ttl
  is '�̶��绰';
comment on column POP_BASIC_INFO.mb_phone
  is '�ƶ��绰';
comment on column POP_BASIC_INFO.is_childbear_age_code
  is '�Ƿ����举Ů���루��Ӧdim_childbear_age��is_childbear_age_code�ֶΣ�';
comment on column POP_BASIC_INFO.is_childbear_age
  is '�Ƿ����举Ů';
comment on column POP_BASIC_INFO.education_code
  is 'ѧ�����루��Ӧdim_education��education_code�ֶΣ�';
comment on column POP_BASIC_INFO.education
  is 'ѧ��';
comment on column POP_BASIC_INFO.pop_type
  is '�˿�����
';
comment on column POP_BASIC_INFO.region_code
  is '�������루��Ӧdim_region��region_code�ֶΣ�';
comment on column POP_BASIC_INFO.region
  is '����';
comment on column POP_BASIC_INFO.gen_grid
  is '��������';
comment on column POP_BASIC_INFO.time_stamp
  is 'ʱ���';
comment on column POP_BASIC_INFO.sort_id
  is '����';
comment on column POP_BASIC_INFO.description
  is '��������';
comment on column POP_BASIC_INFO.creator_id
  is '������id';
comment on column POP_BASIC_INFO.creator
  is '������';
comment on column POP_BASIC_INFO.create_date
  is '��������';
comment on column POP_BASIC_INFO.modifiedby
  is '�޸���';
comment on column POP_BASIC_INFO.modifiedby_id
  is '�޸���id';
comment on column POP_BASIC_INFO.modified_date
  is '�޸�����';
comment on column POP_BASIC_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column POP_BASIC_INFO.version
  is '�汾��';
comment on column POP_BASIC_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column POP_BASIC_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column POP_BASIC_INFO.exa_remarks
  is '������ע';
comment on column POP_BASIC_INFO.src_entity
  is 'Դ������';
comment on column POP_BASIC_INFO.src_community
  is '��Դ����';
comment on column POP_BASIC_INFO.patch_code
  is '���κ�';

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
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column POP_BASIC_INFO_TEMP.bus_date
  is 'ҵ������';
comment on column POP_BASIC_INFO_TEMP.exa_remarks
  is '������ע';

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
  is '������Ϣ';
comment on column POP_EDU_INFO.tip_deg
  is '���ѧ��';
comment on column POP_EDU_INFO.tip_deg_school
  is '���ѧ����ҵԺУ';
comment on column POP_EDU_INFO.gra_time
  is '���ѧ����ҵʱ��';
comment on column POP_EDU_INFO.maj_tip_deg
  is '���ѧ��רҵ';
comment on column POP_EDU_INFO.degree
  is 'ѧλ';
comment on column POP_EDU_INFO.awa_time
  is 'ѧλ����ʱ��';
comment on column POP_EDU_INFO.other_maj
  is '������ѧרҵ';
comment on column POP_EDU_INFO.fore_lan_type
  is '��ѧ��������';
comment on column POP_EDU_INFO.pro_language
  is '�������������̶�';
comment on column POP_EDU_INFO.time
  is 'ʱ���';
comment on column POP_EDU_INFO.sort_id
  is '����';
comment on column POP_EDU_INFO.description
  is '��������';
comment on column POP_EDU_INFO.creator_id
  is '������id';
comment on column POP_EDU_INFO.creator
  is '������';
comment on column POP_EDU_INFO.create_date
  is '��������';
comment on column POP_EDU_INFO.modifiedby
  is '�޸���';
comment on column POP_EDU_INFO.modifiedby_id
  is '�޸���id';
comment on column POP_EDU_INFO.modified_date
  is '�޸�����';
comment on column POP_EDU_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column POP_EDU_INFO.version
  is '�汾��';
comment on column POP_EDU_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column POP_EDU_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column POP_EDU_INFO.exa_remarks
  is '������ע';
comment on column POP_EDU_INFO.patch_code
  is '���κ�';

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
  is '��ҵ��λ��Ϣ';
comment on column POP_EMP_UNIT.unit_name
  is '��λ����';
comment on column POP_EMP_UNIT.unit_addr
  is '��λ��ַ';
comment on column POP_EMP_UNIT.unit_post
  is '��λ��������';
comment on column POP_EMP_UNIT.unit_tele_num
  is '��λ�绰����';
comment on column POP_EMP_UNIT.unit_type
  is '��λ���';
comment on column POP_EMP_UNIT.unit_eco_type
  is '��λ��������';
comment on column POP_EMP_UNIT.unit_aff
  is '��λ������ҵ';
comment on column POP_EMP_UNIT.org_ist_code
  is '��֯��������';
comment on column POP_EMP_UNIT.unit_time_work
  is '���뵥λʱ��';
comment on column POP_EMP_UNIT.adm_head_level
  is '����ְ�񼶱�';
comment on column POP_EMP_UNIT.pro_tec_head
  is 'רҵ����ְ��';
comment on column POP_EMP_UNIT.emp_start_time
  is 'רҵ����ְ��Ƹ����ʼʱ��';
comment on column POP_EMP_UNIT.emp_end_time
  is 'רҵ����ְ��Ƹ����ֹʱ��';
comment on column POP_EMP_UNIT.time
  is 'ʱ���';
comment on column POP_EMP_UNIT.sort_id
  is '����';
comment on column POP_EMP_UNIT.description
  is '��������';
comment on column POP_EMP_UNIT.creator_id
  is '������id';
comment on column POP_EMP_UNIT.creator
  is '������';
comment on column POP_EMP_UNIT.create_date
  is '��������';
comment on column POP_EMP_UNIT.modifiedby
  is '�޸���';
comment on column POP_EMP_UNIT.modifiedby_id
  is '�޸���id';
comment on column POP_EMP_UNIT.modified_date
  is '�޸�����';
comment on column POP_EMP_UNIT.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column POP_EMP_UNIT.version
  is '�汾��';
comment on column POP_EMP_UNIT.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column POP_EMP_UNIT.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column POP_EMP_UNIT.exa_remarks
  is '������ע';
comment on column POP_EMP_UNIT.patch_code
  is '���κ�';

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
  is '���ϱ���';
comment on column POP_END_INS.led_dra_pen
  is '��ȡ���Ͻ��ʶ';
comment on column POP_END_INS.fra_cla_ide
  is '����ð�����Ͻ��ʶ';
comment on column POP_END_INS.fra_cla_num
  is '����ð�����Ͻ���';
comment on column POP_END_INS.time
  is 'ʱ���';
comment on column POP_END_INS.sort_id
  is '����';
comment on column POP_END_INS.description
  is '��������';
comment on column POP_END_INS.creator_id
  is '������id';
comment on column POP_END_INS.creator
  is '������';
comment on column POP_END_INS.create_date
  is '��������';
comment on column POP_END_INS.modifiedby
  is '�޸���';
comment on column POP_END_INS.modifiedby_id
  is '�޸���id';
comment on column POP_END_INS.modified_date
  is '�޸�����';
comment on column POP_END_INS.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column POP_END_INS.version
  is '�汾��';
comment on column POP_END_INS.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column POP_END_INS.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column POP_END_INS.exa_remarks
  is '������ע';
comment on column POP_END_INS.patch_code
  is '���κ�';

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
  is '�ص���Ⱥ��Ϣ';
comment on column POP_FOCUS_GROUP.gen_grid
  is '��������';
comment on column POP_FOCUS_GROUP.pop_name
  is '����';
comment on column POP_FOCUS_GROUP.account_no
  is '���֤��';
comment on column POP_FOCUS_GROUP.type
  is '����';
comment on column POP_FOCUS_GROUP.category
  is '���';
comment on column POP_FOCUS_GROUP.basic_situa
  is '�������';
comment on column POP_FOCUS_GROUP.leader_name
  is '�����쵼����';
comment on column POP_FOCUS_GROUP.resp_unit
  is '���ε�λ';
comment on column POP_FOCUS_GROUP.longitude
  is '����';
comment on column POP_FOCUS_GROUP.latitude
  is 'γ��';
comment on column POP_FOCUS_GROUP.addr_column
  is '��ַ��Ŀ';
comment on column POP_FOCUS_GROUP.time
  is 'ʱ���';
comment on column POP_FOCUS_GROUP.sort_id
  is '����';
comment on column POP_FOCUS_GROUP.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column POP_FOCUS_GROUP.bus_date
  is 'ҵ������';
comment on column POP_FOCUS_GROUP.exa_remarks
  is '������ע';

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
  is '��������';
comment on column POP_HEA_REC.fam_dis_his
  is '���岡ʷ';
comment on column POP_HEA_REC.fam_tak_time
  is '���岡ʷ����ʱ��';
comment on column POP_HEA_REC.chr_dis_his
  is '���Բ�ʷ';
comment on column POP_HEA_REC.chr_dis_his_time
  is '���Բ�ʷ����ʱ��';
comment on column POP_HEA_REC.com_dis_his
  is '��Ⱦ��ʷ';
comment on column POP_HEA_REC.com_tak_time
  is '��Ⱦ��ʷ����ʱ��';
comment on column POP_HEA_REC.med_dis_his
  is 'ҩ������������ʷ';
comment on column POP_HEA_REC.med_tak_time
  is 'ҩ������������ʷ����ʱ��';
comment on column POP_HEA_REC.hos_sur_his
  is 'סԺ������ʷ';
comment on column POP_HEA_REC.hos_sur_tak_time
  is 'סԺ������ʱ��';
comment on column POP_HEA_REC.no_com_his
  is '�Ǵ�Ⱦ�Լ���ʷ';
comment on column POP_HEA_REC.no_com_tak_time
  is '�Ǵ�Ⱦ�Լ�������ʱ��';
comment on column POP_HEA_REC.haz_fac_his
  is 'ְҵΣ������ʷ';
comment on column POP_HEA_REC.haz_fac_starttime
  is '����Σ��ְҵ��ʼʱ��';
comment on column POP_HEA_REC.haz_fac_endtime
  is '����Σ��ְҵ����ʱ��';
comment on column POP_HEA_REC.ris_beh_his
  is '��ΪΣ������ʷ';
comment on column POP_HEA_REC.tra_his
  is '��Ѫ���';
comment on column POP_HEA_REC.sleep_qua
  is '˯�����';
comment on column POP_HEA_REC.newboth_dis
  is '����������';
comment on column POP_HEA_REC.birth_def
  is '����ȱ��';
comment on column POP_HEA_REC.gro_devel
  is '��������';
comment on column POP_HEA_REC.feed_die_cha
  is 'ιʳ��Ӫ����ʳ����ʳ����';
comment on column POP_HEA_REC.sex_cha_beh
  is '������������Ϊ';
comment on column POP_HEA_REC.sex_cha_beh_time
  is '������������Ϊʱ��';
comment on column POP_HEA_REC.pat_fea_onc
  is '������λָ��';
comment on column POP_HEA_REC.pat_fea_onc_time
  is '������λָ�귢��ʱ��';
comment on column POP_HEA_REC.pat_fea_dia
  is '���򲡸�λָ��';
comment on column POP_HEA_REC.pat_fea_dia_time
  is '���򲡸�λָ�귢��ʱ��';
comment on column POP_HEA_REC.pat_fea_cer
  is '��Ѫ�ܲ���Σָ��';
comment on column POP_HEA_REC.pat_fea_cer_time
  is '��Ѫ�ܲ���Σָ�귢��ʱ��';
comment on column POP_HEA_REC.men_his
  is '�¾�ʷ';
comment on column POP_HEA_REC.con_his
  is '����ʷ';
comment on column POP_HEA_REC.gra_his
  is '����ʷ';
comment on column POP_HEA_REC.child_his
  is '����ʷ';
comment on column POP_HEA_REC.pau_con
  is '�������';
comment on column POP_HEA_REC.est_date
  is '����ʱ��';
comment on column POP_HEA_REC.bir_med_num
  is '����ҽѧ֤�����';
comment on column POP_HEA_REC.bir_med_unit
  is '����ҽѧ֤�����ߵ�λ';
comment on column POP_HEA_REC.time
  is 'ʱ���';
comment on column POP_HEA_REC.sort_id
  is '����';
comment on column POP_HEA_REC.description
  is '��������';
comment on column POP_HEA_REC.creator_id
  is '������id';
comment on column POP_HEA_REC.creator
  is '������';
comment on column POP_HEA_REC.create_date
  is '��������';
comment on column POP_HEA_REC.modifiedby
  is '�޸���';
comment on column POP_HEA_REC.modifiedby_id
  is '�޸���id';
comment on column POP_HEA_REC.modified_date
  is '�޸�����';
comment on column POP_HEA_REC.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column POP_HEA_REC.version
  is '�汾��';
comment on column POP_HEA_REC.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column POP_HEA_REC.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column POP_HEA_REC.exa_remarks
  is '������ע';
comment on column POP_HEA_REC.patch_code
  is '���κ�';

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
  is '���˱���';
comment on column POP_INJONJOB_INS.inj_state
  is '��������״̬';
comment on column POP_INJONJOB_INS.inj_date
  is '���˷���ʱ��';
comment on column POP_INJONJOB_INS.part_of_inj
  is '�˺���λ';
comment on column POP_INJONJOB_INS.inj_app_no
  is '�����϶������';
comment on column POP_INJONJOB_INS.grade_of_inj
  is '�˲еȼ�';
comment on column POP_INJONJOB_INS.end_ins_sign
  is '��ֹ���˱��մ�����ϵ��־';
comment on column POP_INJONJOB_INS.lab_ins_type
  is '���˴������';
comment on column POP_INJONJOB_INS.time
  is 'ʱ���';
comment on column POP_INJONJOB_INS.sort_id
  is '����';
comment on column POP_INJONJOB_INS.description
  is '��������';
comment on column POP_INJONJOB_INS.creator_id
  is '������id';
comment on column POP_INJONJOB_INS.creator
  is '������';
comment on column POP_INJONJOB_INS.create_date
  is '��������';
comment on column POP_INJONJOB_INS.modifiedby
  is '�޸���';
comment on column POP_INJONJOB_INS.modifiedby_id
  is '�޸���id';
comment on column POP_INJONJOB_INS.modified_date
  is '�޸�����';
comment on column POP_INJONJOB_INS.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column POP_INJONJOB_INS.version
  is '�汾��';
comment on column POP_INJONJOB_INS.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column POP_INJONJOB_INS.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column POP_INJONJOB_INS.exa_remarks
  is '������ע';
comment on column POP_INJONJOB_INS.patch_code
  is '���κ�';

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
  is '����ͱ���Ϣ';
comment on column POP_LOW_INFO.pop_name
  is '����';
comment on column POP_LOW_INFO.account_no
  is '���֤��';
comment on column POP_LOW_INFO.system_num
  is 'ԭϵͳ���';
comment on column POP_LOW_INFO.low_gua_num
  is '�ͱ�֤��';
comment on column POP_LOW_INFO.money_incom
  is '��ͥ������';
comment on column POP_LOW_INFO.declar_date
  is '�걨����';
comment on column POP_LOW_INFO.classified
  is '����ʩ��';
comment on column POP_LOW_INFO.fam_num
  is '��ͥ�˿�';
comment on column POP_LOW_INFO.bank_account
  is '�����˺�';
comment on column POP_LOW_INFO.relationship
  is '��ͱ�������ϵ';
comment on column POP_LOW_INFO.notes
  is '��ע';
comment on column POP_LOW_INFO.time
  is '����ʱ��';
comment on column POP_LOW_INFO.sort_id
  is '����';
comment on column POP_LOW_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column POP_LOW_INFO.bus_date
  is 'ҵ������';
comment on column POP_LOW_INFO.exa_remarks
  is '������ע';

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
  is '��������';
comment on column POP_MAT_INS.bear_type
  is '�����������';
comment on column POP_MAT_INS.enjoy_start_type
  is '������ʼʱ��';
comment on column POP_MAT_INS.enjoy_end_type
  is '������ֹʱ��';
comment on column POP_MAT_INS.time
  is 'ʱ���';
comment on column POP_MAT_INS.sort_id
  is '����';
comment on column POP_MAT_INS.description
  is '��������';
comment on column POP_MAT_INS.creator_id
  is '������id';
comment on column POP_MAT_INS.creator
  is '������';
comment on column POP_MAT_INS.create_date
  is '��������';
comment on column POP_MAT_INS.modifiedby
  is '�޸���';
comment on column POP_MAT_INS.modifiedby_id
  is '�޸���id';
comment on column POP_MAT_INS.modified_date
  is '�޸�����';
comment on column POP_MAT_INS.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column POP_MAT_INS.version
  is '�汾��';
comment on column POP_MAT_INS.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column POP_MAT_INS.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column POP_MAT_INS.exa_remarks
  is '������ע';
comment on column POP_MAT_INS.patch_code
  is '���κ�';

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
  is 'ҽ�Ʊ���';
comment on column POP_MED_INS.med_ins_no
  is 'ҽ�Ʊ���֤��';
comment on column POP_MED_INS.per_type
  is 'ҽ�Ʋα���Ա���';
comment on column POP_MED_INS.per_ins_date
  is '����ҽ�Ʊ��ո����˻���������';
comment on column POP_MED_INS.app_med_code
  is '����ҽ�ƻ�������';
comment on column POP_MED_INS.time
  is 'ʱ���';
comment on column POP_MED_INS.sort_id
  is '����';
comment on column POP_MED_INS.description
  is '��������';
comment on column POP_MED_INS.creator_id
  is '������id';
comment on column POP_MED_INS.creator
  is '������';
comment on column POP_MED_INS.create_date
  is '��������';
comment on column POP_MED_INS.modifiedby
  is '�޸���';
comment on column POP_MED_INS.modifiedby_id
  is '�޸���id';
comment on column POP_MED_INS.modified_date
  is '�޸�����';
comment on column POP_MED_INS.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column POP_MED_INS.version
  is '�汾��';
comment on column POP_MED_INS.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column POP_MED_INS.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column POP_MED_INS.exa_remarks
  is '������ע';
comment on column POP_MED_INS.patch_code
  is '���κ�';

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
  is '���񵳽���Ϣ';
comment on column POP_PARTY_BUILD.pop_name
  is '����';
comment on column POP_PARTY_BUILD.account_no
  is '���֤��';
comment on column POP_PARTY_BUILD.org_id
  is '��������֯ID';
comment on column POP_PARTY_BUILD.army_time
  is '����ʱ��';
comment on column POP_PARTY_BUILD.party_time
  is '�뵳ʱ��';
comment on column POP_PARTY_BUILD.party_posts
  is '����ְ��';
comment on column POP_PARTY_BUILD.party_group
  is '��С��';
comment on column POP_PARTY_BUILD.tran_time
  is 'ת��ʱ��';
comment on column POP_PARTY_BUILD.isworking
  is '����/��ְ';
comment on column POP_PARTY_BUILD.com_jur_unit
  is '������Ͻ��λ';
comment on column POP_PARTY_BUILD.notes
  is '��ע';
comment on column POP_PARTY_BUILD.time
  is '����ʱ��';
comment on column POP_PARTY_BUILD.sort_id
  is '����';
comment on column POP_PARTY_BUILD.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column POP_PARTY_BUILD.bus_date
  is 'ҵ������';
comment on column POP_PARTY_BUILD.exa_remarks
  is '������ע';

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
  is 'ְҵ�ʸ�';
comment on column POP_PRO_QUAL.occ_type
  is 'ְҵ���';
comment on column POP_PRO_QUAL.occ_name
  is 'ְҵ����';
comment on column POP_PRO_QUAL.occ_qual_level
  is 'ְҵ�ʸ�ȼ�';
comment on column POP_PRO_QUAL.qual_exa_name
  is '�ʸ�������λ����';
comment on column POP_PRO_QUAL.qual_acq_time
  is 'ȡ���ʸ�ʱ��';
comment on column POP_PRO_QUAL.time
  is 'ʱ���';
comment on column POP_PRO_QUAL.sort_id
  is '����';
comment on column POP_PRO_QUAL.description
  is '��������';
comment on column POP_PRO_QUAL.creator_id
  is '������id';
comment on column POP_PRO_QUAL.creator
  is '������';
comment on column POP_PRO_QUAL.create_date
  is '��������';
comment on column POP_PRO_QUAL.modifiedby
  is '�޸���';
comment on column POP_PRO_QUAL.modifiedby_id
  is '�޸���id';
comment on column POP_PRO_QUAL.modified_date
  is '�޸�����';
comment on column POP_PRO_QUAL.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column POP_PRO_QUAL.version
  is '�汾��';
comment on column POP_PRO_QUAL.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column POP_PRO_QUAL.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column POP_PRO_QUAL.exa_remarks
  is '������ע';
comment on column POP_PRO_QUAL.patch_code
  is '���κ�';

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
  is '��������';
comment on column POP_REG_RES.reg_res_type
  is '�������
';
comment on column POP_REG_RES.reg_res_loca
  is '�������ڵ�';
comment on column POP_REG_RES.reg_addr
  is '�����Ǽǵ�ַ';
comment on column POP_REG_RES.reg_post
  is '�������ڵ���������';
comment on column POP_REG_RES.householder_id
  is '�������֤����';
comment on column POP_REG_RES.householder_name
  is '��������';
comment on column POP_REG_RES.rel_bet_householder
  is '�뻧����ϵ';
comment on column POP_REG_RES.immigrantdate
  is 'Ǩ������';
comment on column POP_REG_RES.emigrantdate
  is 'Ǩ������';
comment on column POP_REG_RES.immigrant_rea
  is 'Ǩ��ԭ��';
comment on column POP_REG_RES.emigrant_rea
  is 'Ǩ��ԭ��';
comment on column POP_REG_RES.time
  is 'ʱ���';
comment on column POP_REG_RES.sort_id
  is '����';
comment on column POP_REG_RES.description
  is '��������';
comment on column POP_REG_RES.creator_id
  is '������id';
comment on column POP_REG_RES.creator
  is '������';
comment on column POP_REG_RES.create_date
  is '��������';
comment on column POP_REG_RES.modifiedby
  is '�޸���';
comment on column POP_REG_RES.modifiedby_id
  is '�޸���id';
comment on column POP_REG_RES.modified_date
  is '�޸�����';
comment on column POP_REG_RES.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column POP_REG_RES.version
  is '�汾��';
comment on column POP_REG_RES.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column POP_REG_RES.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column POP_REG_RES.exa_remarks
  is '������ע';
comment on column POP_REG_RES.patch_code
  is '���κ�';

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
  is '���������Ϣ';
comment on column POP_RESIDENT.gen_grid
  is '��������';
comment on column POP_RESIDENT.build_name
  is '¥������';
comment on column POP_RESIDENT.room_num
  is '�����';
comment on column POP_RESIDENT.build_use
  is '¥��ʹ������';
comment on column POP_RESIDENT.house_prop
  is 'ס������';
comment on column POP_RESIDENT.unit_prop
  is '��Ԫʹ������';
comment on column POP_RESIDENT.jur_area
  is '��Ͻ����';
comment on column POP_RESIDENT.jur_code
  is '��Ͻ�������';
comment on column POP_RESIDENT.mng_type
  is '��������';
comment on column POP_RESIDENT.pop_type
  is '�˿�����';
comment on column POP_RESIDENT.fam_num
  is '��ͥ���';
comment on column POP_RESIDENT.home_addr
  is '��ͥ��ַ';
comment on column POP_RESIDENT.fix_ttl
  is '�̶��绰';
comment on column POP_RESIDENT.mb_phone
  is '�ƶ��绰';
comment on column POP_RESIDENT.rel_hsh
  is '�뻧����ϵ';
comment on column POP_RESIDENT.hsh_status
  is '�˻�״̬';
comment on column POP_RESIDENT.pop_name
  is '����';
comment on column POP_RESIDENT.pop_sex
  is '�Ա�';
comment on column POP_RESIDENT.birthday
  is '��������';
comment on column POP_RESIDENT.dom_type
  is '֤������';
comment on column POP_RESIDENT.account_no
  is '֤����';
comment on column POP_RESIDENT.nation
  is '����';
comment on column POP_RESIDENT.deg_edu
  is '�Ļ��̶�';
comment on column POP_RESIDENT.occupation
  is 'ְҵ';
comment on column POP_RESIDENT.work_unit
  is '������λ';
comment on column POP_RESIDENT.reg_code
  is '�����ش���';
comment on column POP_RESIDENT.domicile
  is '������';
comment on column POP_RESIDENT.hs_tel
  is '��������ϵ�绰';
comment on column POP_RESIDENT.isonlychild
  is '�Ƿ����';
comment on column POP_RESIDENT.office_tel
  is '�칫�绰';
comment on column POP_RESIDENT.fa_name
  is '��������';
comment on column POP_RESIDENT.ma_name
  is 'ĸ������';
comment on column POP_RESIDENT.mar_status
  is '����״��';
comment on column POP_RESIDENT.mar_date
  is '��������';
comment on column POP_RESIDENT.spouse_name
  is '��ż����';
comment on column POP_RESIDENT.spouse_birth
  is '��ż��������';
comment on column POP_RESIDENT.spouse_no
  is '��ż���֤';
comment on column POP_RESIDENT.child_num
  is '�ֺ���';
comment on column POP_RESIDENT.boy_num
  is '���к���';
comment on column POP_RESIDENT.girl_num
  is '��Ů����';
comment on column POP_RESIDENT.issue_date
  is '��֤����';
comment on column POP_RESIDENT.discipline
  is '�Ƿ�Υ��';
comment on column POP_RESIDENT.ctp_mea
  is '������ʩ';
comment on column POP_RESIDENT.cont_date
  is '��������';
comment on column POP_RESIDENT.cont_note
  is '������ע';
comment on column POP_RESIDENT.is_wmcheck
  is '�Ƿ���Ҫ����';
comment on column POP_RESIDENT.isglo_cer
  is '���޹���֤';
comment on column POP_RESIDENT.current_addr
  is '�־�ס��ַ';
comment on column POP_RESIDENT.landlord_name
  is '��������';
comment on column POP_RESIDENT.landlord_id
  is '�������֤';
comment on column POP_RESIDENT.isspouse_loc
  is '��ż�Ƿ񱾵�';
comment on column POP_RESIDENT.spouse_dom
  is '��ż������';
comment on column POP_RESIDENT.pop_status
  is '��Ա״̬';
comment on column POP_RESIDENT.pop_ctg
  is '��Ա���';
comment on column POP_RESIDENT.obtain_date
  is '�뻧ʱ��';
comment on column POP_RESIDENT.exit_date
  is '����ʱ��';
comment on column POP_RESIDENT.reg_date
  is '�Ǽ�����';
comment on column POP_RESIDENT.leave_date
  is '�뼮ʱ��';
comment on column POP_RESIDENT.height
  is '���';
comment on column POP_RESIDENT.form_name
  is '������';
comment on column POP_RESIDENT.occu_type
  is 'ְҵ���';
comment on column POP_RESIDENT.pol_visage
  is '������ò';
comment on column POP_RESIDENT.note
  is '��ע';
comment on column POP_RESIDENT.rel_beli
  is '�ڽ�����';
comment on column POP_RESIDENT.nationality
  is '����';
comment on column POP_RESIDENT.time
  is 'ʱ���';
comment on column POP_RESIDENT.sort_id
  is '����';
comment on column POP_RESIDENT.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column POP_RESIDENT.bus_date
  is 'ҵ������';
comment on column POP_RESIDENT.exa_remarks
  is '������ע';

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
  is '��ҵ״��';
comment on column POP_SCO_INS_INFO.per_jion_date
  is '���˲α�����';
comment on column POP_SCO_INS_INFO.per_jion_state
  is '���˲α�״̬';
comment on column POP_SCO_INS_INFO.ins_type
  is '��������';
comment on column POP_SCO_INS_INFO.sco_ins_no
  is '��ᱣ�յǼ�֤����';
comment on column POP_SCO_INS_INFO.bill_pay_code
  is '�ɷѵ�������';
comment on column POP_SCO_INS_INFO.bill_pay_name
  is '�ɷѵ�λ����';
comment on column POP_SCO_INS_INFO.bill_pay_per_type
  is '�ɷ���Ա���';
comment on column POP_SCO_INS_INFO.time
  is 'ʱ���';
comment on column POP_SCO_INS_INFO.sort_id
  is '����';
comment on column POP_SCO_INS_INFO.description
  is '��������';
comment on column POP_SCO_INS_INFO.creator_id
  is '������id';
comment on column POP_SCO_INS_INFO.creator
  is '������';
comment on column POP_SCO_INS_INFO.create_date
  is '��������';
comment on column POP_SCO_INS_INFO.modifiedby
  is '�޸���';
comment on column POP_SCO_INS_INFO.modifiedby_id
  is '�޸���id';
comment on column POP_SCO_INS_INFO.modified_date
  is '�޸�����';
comment on column POP_SCO_INS_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column POP_SCO_INS_INFO.version
  is '�汾��';
comment on column POP_SCO_INS_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column POP_SCO_INS_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column POP_SCO_INS_INFO.exa_remarks
  is '������ע';
comment on column POP_SCO_INS_INFO.patch_code
  is '���κ�';

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
  is 'ʧҵ����';
comment on column POP_UNE_INS.enjoy_date
  is '����ʧҵ������ʼ����';
comment on column POP_UNE_INS.ever_rec_ide
  is 'ʧҵ�������';
comment on column POP_UNE_INS.should_rec_months
  is 'Ӧ��ȡʧҵ���ս�����';
comment on column POP_UNE_INS.time
  is 'ʱ���';
comment on column POP_UNE_INS.sort_id
  is '����';
comment on column POP_UNE_INS.description
  is '��������';
comment on column POP_UNE_INS.creator_id
  is '������id';
comment on column POP_UNE_INS.creator
  is '������';
comment on column POP_UNE_INS.create_date
  is '��������';
comment on column POP_UNE_INS.modifiedby
  is '�޸���';
comment on column POP_UNE_INS.modifiedby_id
  is '�޸���id';
comment on column POP_UNE_INS.modified_date
  is '�޸�����';
comment on column POP_UNE_INS.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column POP_UNE_INS.version
  is '�汾��';
comment on column POP_UNE_INS.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column POP_UNE_INS.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column POP_UNE_INS.exa_remarks
  is '������ע';
comment on column POP_UNE_INS.patch_code
  is '���κ�';


spool off
