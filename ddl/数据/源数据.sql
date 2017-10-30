--------------------------------------------
-- Export file for user C##_BIGDATA@ZZMDM --
-- Created by zhy on 2017/10/13, 13:03:28 --
--------------------------------------------

set define off
spool Դ����.log

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
  is '������ָ֧���';
comment on column SRC0108_FIN_BALANCES_INDEX.pro_name
  is '������ָ֧������';
comment on column SRC0108_FIN_BALANCES_INDEX.parent_code
  is '������֧��ָ�����';
comment on column SRC0108_FIN_BALANCES_INDEX.pro_code
  is '������ָ֧�����';
comment on column SRC0108_FIN_BALANCES_INDEX.time
  is 'ʱ���';

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
  is '������ָ֧���';
comment on column SRC0108_FIN_BALANCES_INDEX_BAK.pro_name
  is '������ָ֧������';
comment on column SRC0108_FIN_BALANCES_INDEX_BAK.parent_code
  is '������֧��ָ�����';
comment on column SRC0108_FIN_BALANCES_INDEX_BAK.pro_code
  is '������ָ֧�����';
comment on column SRC0108_FIN_BALANCES_INDEX_BAK.time
  is 'ʱ���';
comment on column SRC0108_FIN_BALANCES_INDEX_BAK.bus_date
  is 'ҵ������';

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
  is '������֧���ݱ�';
comment on column SRC0108_FIN_BALANCES_M.id
  is '����';
comment on column SRC0108_FIN_BALANCES_M.this_mon
  is '�������ݣ���Ԫ��';
comment on column SRC0108_FIN_BALANCES_M.pre_mon_sum
  is '�����ۼ������������¡���λ��Ԫ��';
comment on column SRC0108_FIN_BALANCES_M.this_yer_bud
  is '����Ԥ��������Ԫ��';
comment on column SRC0108_FIN_BALANCES_M.per_com
  is '�����';
comment on column SRC0108_FIN_BALANCES_M.last_yer_mon
  is '����ͬ���ۼ�������Ԫ��';
comment on column SRC0108_FIN_BALANCES_M.gro_rate
  is 'ͬ������';
comment on column SRC0108_FIN_BALANCES_M.months
  is 'ʱ�䣨�·ݣ�';
comment on column SRC0108_FIN_BALANCES_M.pro_code
  is 'ָ����룬����������ָ֧���';
comment on column SRC0108_FIN_BALANCES_M.time
  is 'ʱ���';
comment on column SRC0108_FIN_BALANCES_M.sort_id
  is '�����ֶ�';

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
  is '������֧���ݱ�';
comment on column SRC0108_FIN_BALANCES_M_BAK.this_mon
  is '�������ݣ���Ԫ��';
comment on column SRC0108_FIN_BALANCES_M_BAK.pre_mon_sum
  is '�����ۼ������������¡���λ��Ԫ��';
comment on column SRC0108_FIN_BALANCES_M_BAK.this_yer_bud
  is '����Ԥ��������Ԫ��';
comment on column SRC0108_FIN_BALANCES_M_BAK.per_com
  is '�����';
comment on column SRC0108_FIN_BALANCES_M_BAK.last_yer_mon
  is '����ͬ���ۼ�������Ԫ��';
comment on column SRC0108_FIN_BALANCES_M_BAK.gro_rate
  is 'ͬ������';
comment on column SRC0108_FIN_BALANCES_M_BAK.months
  is 'ʱ�䣨�·ݣ�';
comment on column SRC0108_FIN_BALANCES_M_BAK.pro_code
  is '��Ŀ���룬����������֧��Ŀ��';
comment on column SRC0108_FIN_BALANCES_M_BAK.time
  is 'ʱ���';
comment on column SRC0108_FIN_BALANCES_M_BAK.sort_id
  is '�����ֶ�';
comment on column SRC0108_FIN_BALANCES_M_BAK.bus_date
  is 'ҵ������';
comment on column SRC0108_FIN_BALANCES_M_BAK.id
  is '����';

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
  is '��Ҫ��ᾭ��ָ���ۺϱ����';
comment on column SRC0108_SOCECO_INDI_INDEX.entry_name
  is '��Ŀ����';
comment on column SRC0108_SOCECO_INDI_INDEX.code
  is '����';
comment on column SRC0108_SOCECO_INDI_INDEX.time
  is '����ʱ��';
comment on column SRC0108_SOCECO_INDI_INDEX.sort_id
  is '����';

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
  is '��Ҫ��ᾭ��ָ���ۺϱ����';
comment on column SRC0108_SOCECO_INDI_INDEX_BAK.entry_name
  is '��Ŀ����';
comment on column SRC0108_SOCECO_INDI_INDEX_BAK.code
  is '����';
comment on column SRC0108_SOCECO_INDI_INDEX_BAK.time
  is '����ʱ��';
comment on column SRC0108_SOCECO_INDI_INDEX_BAK.sort_id
  is '����';
comment on column SRC0108_SOCECO_INDI_INDEX_BAK.bus_date
  is 'ҵ������';

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
  is '��Ҫ��ᾭ��ָ���ۺϱ�';
comment on column SRC0108_SOCECO_INDI_Q.id
  is '����';
comment on column SRC0108_SOCECO_INDI_Q.code
  is '��ᾭ��ָ���ۺϱ���';
comment on column SRC0108_SOCECO_INDI_Q.unit
  is '��λ';
comment on column SRC0108_SOCECO_INDI_Q.cur_month_val
  is '���������';
comment on column SRC0108_SOCECO_INDI_Q.cur_year_val
  is '1-�����ۼ���';
comment on column SRC0108_SOCECO_INDI_Q.last_year_val
  is '�����ۼ���';
comment on column SRC0108_SOCECO_INDI_Q.yoy_growth
  is 'ͬ������';
comment on column SRC0108_SOCECO_INDI_Q.dz_grow_rate
  is '��ƻ�����  �ƻ�(����)';
comment on column SRC0108_SOCECO_INDI_Q.dz_com_rate
  is '��ƻ����� ����ʣ�˵����';
comment on column SRC0108_SOCECO_INDI_Q.zz_plan_task
  is '��ƻ����� �ƻ�';
comment on column SRC0108_SOCECO_INDI_Q.zz_com_rate
  is '��ƻ����� �����';
comment on column SRC0108_SOCECO_INDI_Q.notes
  is '��ע';
comment on column SRC0108_SOCECO_INDI_Q.input_date
  is '����';
comment on column SRC0108_SOCECO_INDI_Q.time
  is '����ʱ��';
comment on column SRC0108_SOCECO_INDI_Q.sort_id
  is '����';

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
  is '��Ҫ��ᾭ��ָ���ۺϱ�';
comment on column SRC0108_SOCECO_INDI_Q_BAK.code
  is '��ᾭ��ָ���ۺϱ���';
comment on column SRC0108_SOCECO_INDI_Q_BAK.unit
  is '��λ';
comment on column SRC0108_SOCECO_INDI_Q_BAK.cur_month_val
  is '���������';
comment on column SRC0108_SOCECO_INDI_Q_BAK.cur_year_val
  is '1-�����ۼ���';
comment on column SRC0108_SOCECO_INDI_Q_BAK.last_year_val
  is '�����ۼ���';
comment on column SRC0108_SOCECO_INDI_Q_BAK.yoy_growth
  is 'ͬ������';
comment on column SRC0108_SOCECO_INDI_Q_BAK.dz_grow_rate
  is '��ƻ�����  �ƻ�(����)';
comment on column SRC0108_SOCECO_INDI_Q_BAK.dz_com_rate
  is '��ƻ����� ����ʣ�˵����';
comment on column SRC0108_SOCECO_INDI_Q_BAK.zz_plan_task
  is '��ƻ����� �ƻ�';
comment on column SRC0108_SOCECO_INDI_Q_BAK.zz_com_rate
  is '��ƻ����� �����';
comment on column SRC0108_SOCECO_INDI_Q_BAK.notes
  is '��ע';
comment on column SRC0108_SOCECO_INDI_Q_BAK.input_date
  is '����';
comment on column SRC0108_SOCECO_INDI_Q_BAK.time
  is '����ʱ��';
comment on column SRC0108_SOCECO_INDI_Q_BAK.sort_id
  is '����';
comment on column SRC0108_SOCECO_INDI_Q_BAK.bus_date
  is 'ҵ������';
comment on column SRC0108_SOCECO_INDI_Q_BAK.id
  is '����';

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
  is '��ɳ�˿���Ϣ';
comment on column SRC0117_POP_BAISHA.gen_grid
  is '��������';
comment on column SRC0117_POP_BAISHA.jur_area
  is '��Ͻ����';
comment on column SRC0117_POP_BAISHA.jur_code
  is '��Ͻ�������';
comment on column SRC0117_POP_BAISHA.mng_type
  is '��������';
comment on column SRC0117_POP_BAISHA.pop_type
  is '�˿�����';
comment on column SRC0117_POP_BAISHA.fam_num
  is '��ͥ���';
comment on column SRC0117_POP_BAISHA.home_addr
  is '��ͥ��ַ';
comment on column SRC0117_POP_BAISHA.fix_ttl
  is '�̶��绰';
comment on column SRC0117_POP_BAISHA.mb_phone
  is '�ƶ��绰';
comment on column SRC0117_POP_BAISHA.rel_hsh
  is '�뻧����ϵ';
comment on column SRC0117_POP_BAISHA.hsh_status
  is '�˻�״̬';
comment on column SRC0117_POP_BAISHA.pop_name
  is '����';
comment on column SRC0117_POP_BAISHA.pop_sex
  is '�Ա�';
comment on column SRC0117_POP_BAISHA.birthday
  is '��������';
comment on column SRC0117_POP_BAISHA.dom_type
  is '֤������';
comment on column SRC0117_POP_BAISHA.account_no
  is '֤����';
comment on column SRC0117_POP_BAISHA.nation
  is '����';
comment on column SRC0117_POP_BAISHA.deg_edu
  is '�Ļ��̶�';
comment on column SRC0117_POP_BAISHA.occupation
  is 'ְҵ';
comment on column SRC0117_POP_BAISHA.work_unit
  is '������λ';
comment on column SRC0117_POP_BAISHA.reg_code
  is '�����ش���';
comment on column SRC0117_POP_BAISHA.domicile
  is '������';
comment on column SRC0117_POP_BAISHA.hs_tel
  is '��������ϵ�绰';
comment on column SRC0117_POP_BAISHA.isonlychild
  is '�Ƿ����';
comment on column SRC0117_POP_BAISHA.office_tel
  is '�칫�绰';
comment on column SRC0117_POP_BAISHA.fa_name
  is '��������';
comment on column SRC0117_POP_BAISHA.ma_name
  is 'ĸ������';
comment on column SRC0117_POP_BAISHA.mar_status
  is '����״��';
comment on column SRC0117_POP_BAISHA.mar_date
  is '��������';
comment on column SRC0117_POP_BAISHA.spouse_name
  is '��ż����';
comment on column SRC0117_POP_BAISHA.spouse_birth
  is '��ż��������';
comment on column SRC0117_POP_BAISHA.spouse_no
  is '��ż���֤';
comment on column SRC0117_POP_BAISHA.child_num
  is '�ֺ���';
comment on column SRC0117_POP_BAISHA.boy_num
  is '���к���';
comment on column SRC0117_POP_BAISHA.girl_num
  is '��Ů����';
comment on column SRC0117_POP_BAISHA.issue_date
  is '��֤����';
comment on column SRC0117_POP_BAISHA.discipline
  is '�Ƿ�Υ��';
comment on column SRC0117_POP_BAISHA.ctp_mea
  is '������ʩ';
comment on column SRC0117_POP_BAISHA.cont_date
  is '��������';
comment on column SRC0117_POP_BAISHA.cont_note
  is '������ע';
comment on column SRC0117_POP_BAISHA.is_wmcheck
  is '�Ƿ���Ҫ����';
comment on column SRC0117_POP_BAISHA.isglo_cer
  is '���޹���֤';
comment on column SRC0117_POP_BAISHA.current_addr
  is '�־�ס��ַ';
comment on column SRC0117_POP_BAISHA.landlord_name
  is '��������';
comment on column SRC0117_POP_BAISHA.landlord_id
  is '�������֤';
comment on column SRC0117_POP_BAISHA.isspouse_loc
  is '��ż�Ƿ񱾵�';
comment on column SRC0117_POP_BAISHA.spouse_dom
  is '��ż������';
comment on column SRC0117_POP_BAISHA.pop_status
  is '��Ա״̬';
comment on column SRC0117_POP_BAISHA.pop_ctg
  is '��Ա���';
comment on column SRC0117_POP_BAISHA.obtain_date
  is '�뻧ʱ��';
comment on column SRC0117_POP_BAISHA.exit_date
  is '����ʱ��';
comment on column SRC0117_POP_BAISHA.reg_date
  is '�Ǽ�����';
comment on column SRC0117_POP_BAISHA.leave_date
  is '�뼮ʱ��';
comment on column SRC0117_POP_BAISHA.height
  is '���';
comment on column SRC0117_POP_BAISHA.form_name
  is '������';
comment on column SRC0117_POP_BAISHA.occu_type
  is 'ְҵ���';
comment on column SRC0117_POP_BAISHA.pol_visage
  is '������ò';
comment on column SRC0117_POP_BAISHA.note
  is '��ע';
comment on column SRC0117_POP_BAISHA.rel_beli
  is '�ڽ�����';
comment on column SRC0117_POP_BAISHA.nationality
  is '����';
comment on column SRC0117_POP_BAISHA.time
  is '����ʱ��';
comment on column SRC0117_POP_BAISHA.sort_id
  is '����';

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
  is '��ɳ�˿���Ϣ';
comment on column SRC0117_POP_BAISHA_BAK.gen_grid
  is '��������';
comment on column SRC0117_POP_BAISHA_BAK.jur_area
  is '��Ͻ����';
comment on column SRC0117_POP_BAISHA_BAK.jur_code
  is '��Ͻ�������';
comment on column SRC0117_POP_BAISHA_BAK.mng_type
  is '��������';
comment on column SRC0117_POP_BAISHA_BAK.pop_type
  is '�˿�����';
comment on column SRC0117_POP_BAISHA_BAK.fam_num
  is '��ͥ���';
comment on column SRC0117_POP_BAISHA_BAK.home_addr
  is '��ͥ��ַ';
comment on column SRC0117_POP_BAISHA_BAK.fix_ttl
  is '�̶��绰';
comment on column SRC0117_POP_BAISHA_BAK.mb_phone
  is '�ƶ��绰';
comment on column SRC0117_POP_BAISHA_BAK.rel_hsh
  is '�뻧����ϵ';
comment on column SRC0117_POP_BAISHA_BAK.hsh_status
  is '�˻�״̬';
comment on column SRC0117_POP_BAISHA_BAK.pop_name
  is '����';
comment on column SRC0117_POP_BAISHA_BAK.pop_sex
  is '�Ա�';
comment on column SRC0117_POP_BAISHA_BAK.birthday
  is '��������';
comment on column SRC0117_POP_BAISHA_BAK.dom_type
  is '֤������';
comment on column SRC0117_POP_BAISHA_BAK.account_no
  is '֤����';
comment on column SRC0117_POP_BAISHA_BAK.nation
  is '����';
comment on column SRC0117_POP_BAISHA_BAK.deg_edu
  is '�Ļ��̶�';
comment on column SRC0117_POP_BAISHA_BAK.occupation
  is 'ְҵ';
comment on column SRC0117_POP_BAISHA_BAK.work_unit
  is '������λ';
comment on column SRC0117_POP_BAISHA_BAK.reg_code
  is '�����ش���';
comment on column SRC0117_POP_BAISHA_BAK.domicile
  is '������';
comment on column SRC0117_POP_BAISHA_BAK.hs_tel
  is '��������ϵ�绰';
comment on column SRC0117_POP_BAISHA_BAK.isonlychild
  is '�Ƿ����';
comment on column SRC0117_POP_BAISHA_BAK.office_tel
  is '�칫�绰';
comment on column SRC0117_POP_BAISHA_BAK.fa_name
  is '��������';
comment on column SRC0117_POP_BAISHA_BAK.ma_name
  is 'ĸ������';
comment on column SRC0117_POP_BAISHA_BAK.mar_status
  is '����״��';
comment on column SRC0117_POP_BAISHA_BAK.mar_date
  is '��������';
comment on column SRC0117_POP_BAISHA_BAK.spouse_name
  is '��ż����';
comment on column SRC0117_POP_BAISHA_BAK.spouse_birth
  is '��ż��������';
comment on column SRC0117_POP_BAISHA_BAK.spouse_no
  is '��ż���֤';
comment on column SRC0117_POP_BAISHA_BAK.child_num
  is '�ֺ���';
comment on column SRC0117_POP_BAISHA_BAK.boy_num
  is '���к���';
comment on column SRC0117_POP_BAISHA_BAK.girl_num
  is '��Ů����';
comment on column SRC0117_POP_BAISHA_BAK.issue_date
  is '��֤����';
comment on column SRC0117_POP_BAISHA_BAK.discipline
  is '�Ƿ�Υ��';
comment on column SRC0117_POP_BAISHA_BAK.ctp_mea
  is '������ʩ';
comment on column SRC0117_POP_BAISHA_BAK.cont_date
  is '��������';
comment on column SRC0117_POP_BAISHA_BAK.cont_note
  is '������ע';
comment on column SRC0117_POP_BAISHA_BAK.is_wmcheck
  is '�Ƿ���Ҫ����';
comment on column SRC0117_POP_BAISHA_BAK.isglo_cer
  is '���޹���֤';
comment on column SRC0117_POP_BAISHA_BAK.current_addr
  is '�־�ס��ַ';
comment on column SRC0117_POP_BAISHA_BAK.landlord_name
  is '��������';
comment on column SRC0117_POP_BAISHA_BAK.landlord_id
  is '�������֤';
comment on column SRC0117_POP_BAISHA_BAK.isspouse_loc
  is '��ż�Ƿ񱾵�';
comment on column SRC0117_POP_BAISHA_BAK.spouse_dom
  is '��ż������';
comment on column SRC0117_POP_BAISHA_BAK.pop_status
  is '��Ա״̬';
comment on column SRC0117_POP_BAISHA_BAK.pop_ctg
  is '��Ա���';
comment on column SRC0117_POP_BAISHA_BAK.obtain_date
  is '�뻧ʱ��';
comment on column SRC0117_POP_BAISHA_BAK.exit_date
  is '����ʱ��';
comment on column SRC0117_POP_BAISHA_BAK.reg_date
  is '�Ǽ�����';
comment on column SRC0117_POP_BAISHA_BAK.leave_date
  is '�뼮ʱ��';
comment on column SRC0117_POP_BAISHA_BAK.height
  is '���';
comment on column SRC0117_POP_BAISHA_BAK.form_name
  is '������';
comment on column SRC0117_POP_BAISHA_BAK.occu_type
  is 'ְҵ���';
comment on column SRC0117_POP_BAISHA_BAK.pol_visage
  is '������ò';
comment on column SRC0117_POP_BAISHA_BAK.note
  is '��ע';
comment on column SRC0117_POP_BAISHA_BAK.rel_beli
  is '�ڽ�����';
comment on column SRC0117_POP_BAISHA_BAK.nationality
  is '����';
comment on column SRC0117_POP_BAISHA_BAK.time
  is '����ʱ��';
comment on column SRC0117_POP_BAISHA_BAK.sort_id
  is '����';
comment on column SRC0117_POP_BAISHA_BAK.bus_date
  is 'ҵ������';

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
  is 'а����Ա��Ϣ��';
comment on column SRC0117_POP_CULT.pop_name
  is '����';
comment on column SRC0117_POP_CULT.account_no
  is '���֤����';
comment on column SRC0117_POP_CULT.gen_grid
  is '��������';
comment on column SRC0117_POP_CULT.fm_unit
  is 'ԭ������λ';
comment on column SRC0117_POP_CULT.unit_phone
  is '��λ��ϵ�绰';
comment on column SRC0117_POP_CULT.unit_person
  is '��λ������';
comment on column SRC0117_POP_CULT.com_treat
  is '����������';
comment on column SRC0117_POP_CULT.join_chur
  is '�μӽ���';
comment on column SRC0117_POP_CULT.church
  is '�������κ�ְ';
comment on column SRC0117_POP_CULT.mem_list
  is 'С����Ա����';
comment on column SRC0117_POP_CULT.ch_perf
  is '��������������ʵ����';
comment on column SRC0117_POP_CULT.ec_cyle
  is 'ִ������';
comment on column SRC0117_POP_CULT.visttime
  is '�߷�ʱ��';
comment on column SRC0117_POP_CULT.time
  is '����ʱ��';
comment on column SRC0117_POP_CULT.sort_id
  is '����';

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
  is 'а����Ա��Ϣ��';
comment on column SRC0117_POP_CULT_BAK.pop_name
  is '����';
comment on column SRC0117_POP_CULT_BAK.account_no
  is '���֤����';
comment on column SRC0117_POP_CULT_BAK.gen_grid
  is '��������';
comment on column SRC0117_POP_CULT_BAK.fm_unit
  is 'ԭ������λ';
comment on column SRC0117_POP_CULT_BAK.unit_phone
  is '��λ��ϵ�绰';
comment on column SRC0117_POP_CULT_BAK.unit_person
  is '��λ������';
comment on column SRC0117_POP_CULT_BAK.com_treat
  is '����������';
comment on column SRC0117_POP_CULT_BAK.join_chur
  is '�μӽ���';
comment on column SRC0117_POP_CULT_BAK.church
  is '�������κ�ְ';
comment on column SRC0117_POP_CULT_BAK.mem_list
  is 'С����Ա����';
comment on column SRC0117_POP_CULT_BAK.ch_perf
  is '��������������ʵ����';
comment on column SRC0117_POP_CULT_BAK.ec_cyle
  is 'ִ������';
comment on column SRC0117_POP_CULT_BAK.visttime
  is '�߷�ʱ��';
comment on column SRC0117_POP_CULT_BAK.time
  is '����ʱ��';
comment on column SRC0117_POP_CULT_BAK.sort_id
  is '����';
comment on column SRC0117_POP_CULT_BAK.bus_date
  is 'ҵ������';

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
  is '���˿���Ϣ';
comment on column SRC0117_POP_DAJING.gen_grid
  is '��������';
comment on column SRC0117_POP_DAJING.jur_area
  is '��Ͻ����';
comment on column SRC0117_POP_DAJING.jur_code
  is '��Ͻ�������';
comment on column SRC0117_POP_DAJING.mng_type
  is '��������';
comment on column SRC0117_POP_DAJING.pop_type
  is '�˿�����';
comment on column SRC0117_POP_DAJING.fam_num
  is '��ͥ���';
comment on column SRC0117_POP_DAJING.home_addr
  is '��ͥ��ַ';
comment on column SRC0117_POP_DAJING.fix_ttl
  is '�̶��绰';
comment on column SRC0117_POP_DAJING.mb_phone
  is '�ƶ��绰';
comment on column SRC0117_POP_DAJING.rel_hsh
  is '�뻧����ϵ';
comment on column SRC0117_POP_DAJING.hsh_status
  is '�˻�״̬';
comment on column SRC0117_POP_DAJING.pop_name
  is '����';
comment on column SRC0117_POP_DAJING.pop_sex
  is '�Ա�';
comment on column SRC0117_POP_DAJING.birthday
  is '��������';
comment on column SRC0117_POP_DAJING.dom_type
  is '֤������';
comment on column SRC0117_POP_DAJING.account_no
  is '֤����';
comment on column SRC0117_POP_DAJING.nation
  is '����';
comment on column SRC0117_POP_DAJING.deg_edu
  is '�Ļ��̶�';
comment on column SRC0117_POP_DAJING.occupation
  is 'ְҵ';
comment on column SRC0117_POP_DAJING.work_unit
  is '������λ';
comment on column SRC0117_POP_DAJING.reg_code
  is '�����ش���';
comment on column SRC0117_POP_DAJING.domicile
  is '������';
comment on column SRC0117_POP_DAJING.hs_tel
  is '��������ϵ�绰';
comment on column SRC0117_POP_DAJING.isonlychild
  is '�Ƿ����';
comment on column SRC0117_POP_DAJING.office_tel
  is '�칫�绰';
comment on column SRC0117_POP_DAJING.fa_name
  is '��������';
comment on column SRC0117_POP_DAJING.ma_name
  is 'ĸ������';
comment on column SRC0117_POP_DAJING.mar_status
  is '����״��';
comment on column SRC0117_POP_DAJING.mar_date
  is '��������';
comment on column SRC0117_POP_DAJING.spouse_name
  is '��ż����';
comment on column SRC0117_POP_DAJING.spouse_birth
  is '��ż��������';
comment on column SRC0117_POP_DAJING.spouse_no
  is '��ż���֤';
comment on column SRC0117_POP_DAJING.child_num
  is '�ֺ���';
comment on column SRC0117_POP_DAJING.boy_num
  is '���к���';
comment on column SRC0117_POP_DAJING.girl_num
  is '��Ů����';
comment on column SRC0117_POP_DAJING.issue_date
  is '��֤����';
comment on column SRC0117_POP_DAJING.discipline
  is '�Ƿ�Υ��';
comment on column SRC0117_POP_DAJING.ctp_mea
  is '������ʩ';
comment on column SRC0117_POP_DAJING.cont_date
  is '��������';
comment on column SRC0117_POP_DAJING.cont_note
  is '������ע';
comment on column SRC0117_POP_DAJING.is_wmcheck
  is '�Ƿ���Ҫ����';
comment on column SRC0117_POP_DAJING.isglo_cer
  is '���޹���֤';
comment on column SRC0117_POP_DAJING.current_addr
  is '�־�ס��ַ';
comment on column SRC0117_POP_DAJING.landlord_name
  is '��������';
comment on column SRC0117_POP_DAJING.landlord_id
  is '�������֤';
comment on column SRC0117_POP_DAJING.isspouse_loc
  is '��ż�Ƿ񱾵�';
comment on column SRC0117_POP_DAJING.spouse_dom
  is '��ż������';
comment on column SRC0117_POP_DAJING.pop_status
  is '��Ա״̬';
comment on column SRC0117_POP_DAJING.pop_ctg
  is '��Ա���';
comment on column SRC0117_POP_DAJING.obtain_date
  is '�뻧ʱ��';
comment on column SRC0117_POP_DAJING.exit_date
  is '����ʱ��';
comment on column SRC0117_POP_DAJING.reg_date
  is '�Ǽ�����';
comment on column SRC0117_POP_DAJING.leave_date
  is '�뼮ʱ��';
comment on column SRC0117_POP_DAJING.height
  is '���';
comment on column SRC0117_POP_DAJING.form_name
  is '������';
comment on column SRC0117_POP_DAJING.occu_type
  is 'ְҵ���';
comment on column SRC0117_POP_DAJING.pol_visage
  is '������ò';
comment on column SRC0117_POP_DAJING.note
  is '��ע';
comment on column SRC0117_POP_DAJING.rel_beli
  is '�ڽ�����';
comment on column SRC0117_POP_DAJING.nationality
  is '����';
comment on column SRC0117_POP_DAJING.time
  is '����ʱ��';
comment on column SRC0117_POP_DAJING.sort_id
  is '����';

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
  is '���˿���Ϣ';
comment on column SRC0117_POP_DAJING_BAK.gen_grid
  is '��������';
comment on column SRC0117_POP_DAJING_BAK.jur_area
  is '��Ͻ����';
comment on column SRC0117_POP_DAJING_BAK.jur_code
  is '��Ͻ�������';
comment on column SRC0117_POP_DAJING_BAK.mng_type
  is '��������';
comment on column SRC0117_POP_DAJING_BAK.pop_type
  is '�˿�����';
comment on column SRC0117_POP_DAJING_BAK.fam_num
  is '��ͥ���';
comment on column SRC0117_POP_DAJING_BAK.home_addr
  is '��ͥ��ַ';
comment on column SRC0117_POP_DAJING_BAK.fix_ttl
  is '�̶��绰';
comment on column SRC0117_POP_DAJING_BAK.mb_phone
  is '�ƶ��绰';
comment on column SRC0117_POP_DAJING_BAK.rel_hsh
  is '�뻧����ϵ';
comment on column SRC0117_POP_DAJING_BAK.hsh_status
  is '�˻�״̬';
comment on column SRC0117_POP_DAJING_BAK.pop_name
  is '����';
comment on column SRC0117_POP_DAJING_BAK.pop_sex
  is '�Ա�';
comment on column SRC0117_POP_DAJING_BAK.birthday
  is '��������';
comment on column SRC0117_POP_DAJING_BAK.dom_type
  is '֤������';
comment on column SRC0117_POP_DAJING_BAK.account_no
  is '֤����';
comment on column SRC0117_POP_DAJING_BAK.nation
  is '����';
comment on column SRC0117_POP_DAJING_BAK.deg_edu
  is '�Ļ��̶�';
comment on column SRC0117_POP_DAJING_BAK.occupation
  is 'ְҵ';
comment on column SRC0117_POP_DAJING_BAK.work_unit
  is '������λ';
comment on column SRC0117_POP_DAJING_BAK.reg_code
  is '�����ش���';
comment on column SRC0117_POP_DAJING_BAK.domicile
  is '������';
comment on column SRC0117_POP_DAJING_BAK.hs_tel
  is '��������ϵ�绰';
comment on column SRC0117_POP_DAJING_BAK.isonlychild
  is '�Ƿ����';
comment on column SRC0117_POP_DAJING_BAK.office_tel
  is '�칫�绰';
comment on column SRC0117_POP_DAJING_BAK.fa_name
  is '��������';
comment on column SRC0117_POP_DAJING_BAK.ma_name
  is 'ĸ������';
comment on column SRC0117_POP_DAJING_BAK.mar_status
  is '����״��';
comment on column SRC0117_POP_DAJING_BAK.mar_date
  is '��������';
comment on column SRC0117_POP_DAJING_BAK.spouse_name
  is '��ż����';
comment on column SRC0117_POP_DAJING_BAK.spouse_birth
  is '��ż��������';
comment on column SRC0117_POP_DAJING_BAK.spouse_no
  is '��ż���֤';
comment on column SRC0117_POP_DAJING_BAK.child_num
  is '�ֺ���';
comment on column SRC0117_POP_DAJING_BAK.boy_num
  is '���к���';
comment on column SRC0117_POP_DAJING_BAK.girl_num
  is '��Ů����';
comment on column SRC0117_POP_DAJING_BAK.issue_date
  is '��֤����';
comment on column SRC0117_POP_DAJING_BAK.discipline
  is '�Ƿ�Υ��';
comment on column SRC0117_POP_DAJING_BAK.ctp_mea
  is '������ʩ';
comment on column SRC0117_POP_DAJING_BAK.cont_date
  is '��������';
comment on column SRC0117_POP_DAJING_BAK.cont_note
  is '������ע';
comment on column SRC0117_POP_DAJING_BAK.is_wmcheck
  is '�Ƿ���Ҫ����';
comment on column SRC0117_POP_DAJING_BAK.isglo_cer
  is '���޹���֤';
comment on column SRC0117_POP_DAJING_BAK.current_addr
  is '�־�ס��ַ';
comment on column SRC0117_POP_DAJING_BAK.landlord_name
  is '��������';
comment on column SRC0117_POP_DAJING_BAK.landlord_id
  is '�������֤';
comment on column SRC0117_POP_DAJING_BAK.isspouse_loc
  is '��ż�Ƿ񱾵�';
comment on column SRC0117_POP_DAJING_BAK.spouse_dom
  is '��ż������';
comment on column SRC0117_POP_DAJING_BAK.pop_status
  is '��Ա״̬';
comment on column SRC0117_POP_DAJING_BAK.pop_ctg
  is '��Ա���';
comment on column SRC0117_POP_DAJING_BAK.obtain_date
  is '�뻧ʱ��';
comment on column SRC0117_POP_DAJING_BAK.exit_date
  is '����ʱ��';
comment on column SRC0117_POP_DAJING_BAK.reg_date
  is '�Ǽ�����';
comment on column SRC0117_POP_DAJING_BAK.leave_date
  is '�뼮ʱ��';
comment on column SRC0117_POP_DAJING_BAK.height
  is '���';
comment on column SRC0117_POP_DAJING_BAK.form_name
  is '������';
comment on column SRC0117_POP_DAJING_BAK.occu_type
  is 'ְҵ���';
comment on column SRC0117_POP_DAJING_BAK.pol_visage
  is '������ò';
comment on column SRC0117_POP_DAJING_BAK.note
  is '��ע';
comment on column SRC0117_POP_DAJING_BAK.rel_beli
  is '�ڽ�����';
comment on column SRC0117_POP_DAJING_BAK.nationality
  is '����';
comment on column SRC0117_POP_DAJING_BAK.time
  is '����ʱ��';
comment on column SRC0117_POP_DAJING_BAK.sort_id
  is '����';
comment on column SRC0117_POP_DAJING_BAK.bus_date
  is 'ҵ������';

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
  is '����˿���Ϣ';
comment on column SRC0117_POP_DIANDI.gen_grid
  is '��������';
comment on column SRC0117_POP_DIANDI.jur_area
  is '��Ͻ����';
comment on column SRC0117_POP_DIANDI.jur_code
  is '��Ͻ�������';
comment on column SRC0117_POP_DIANDI.mng_type
  is '��������';
comment on column SRC0117_POP_DIANDI.pop_type
  is '�˿�����';
comment on column SRC0117_POP_DIANDI.fam_num
  is '��ͥ���';
comment on column SRC0117_POP_DIANDI.home_addr
  is '��ͥ��ַ';
comment on column SRC0117_POP_DIANDI.fix_ttl
  is '�̶��绰';
comment on column SRC0117_POP_DIANDI.mb_phone
  is '�ƶ��绰';
comment on column SRC0117_POP_DIANDI.rel_hsh
  is '�뻧����ϵ';
comment on column SRC0117_POP_DIANDI.hsh_status
  is '�˻�״̬';
comment on column SRC0117_POP_DIANDI.pop_name
  is '����';
comment on column SRC0117_POP_DIANDI.pop_sex
  is '�Ա�';
comment on column SRC0117_POP_DIANDI.birthday
  is '��������';
comment on column SRC0117_POP_DIANDI.dom_type
  is '֤������';
comment on column SRC0117_POP_DIANDI.account_no
  is '֤����';
comment on column SRC0117_POP_DIANDI.nation
  is '����';
comment on column SRC0117_POP_DIANDI.deg_edu
  is '�Ļ��̶�';
comment on column SRC0117_POP_DIANDI.occupation
  is 'ְҵ';
comment on column SRC0117_POP_DIANDI.work_unit
  is '������λ';
comment on column SRC0117_POP_DIANDI.reg_code
  is '�����ش���';
comment on column SRC0117_POP_DIANDI.domicile
  is '������';
comment on column SRC0117_POP_DIANDI.hs_tel
  is '��������ϵ�绰';
comment on column SRC0117_POP_DIANDI.isonlychild
  is '�Ƿ����';
comment on column SRC0117_POP_DIANDI.office_tel
  is '�칫�绰';
comment on column SRC0117_POP_DIANDI.fa_name
  is '��������';
comment on column SRC0117_POP_DIANDI.ma_name
  is 'ĸ������';
comment on column SRC0117_POP_DIANDI.mar_status
  is '����״��';
comment on column SRC0117_POP_DIANDI.mar_date
  is '��������';
comment on column SRC0117_POP_DIANDI.spouse_name
  is '��ż����';
comment on column SRC0117_POP_DIANDI.spouse_birth
  is '��ż��������';
comment on column SRC0117_POP_DIANDI.spouse_no
  is '��ż���֤';
comment on column SRC0117_POP_DIANDI.child_num
  is '�ֺ���';
comment on column SRC0117_POP_DIANDI.boy_num
  is '���к���';
comment on column SRC0117_POP_DIANDI.girl_num
  is '��Ů����';
comment on column SRC0117_POP_DIANDI.issue_date
  is '��֤����';
comment on column SRC0117_POP_DIANDI.discipline
  is '�Ƿ�Υ��';
comment on column SRC0117_POP_DIANDI.ctp_mea
  is '������ʩ';
comment on column SRC0117_POP_DIANDI.cont_date
  is '��������';
comment on column SRC0117_POP_DIANDI.cont_note
  is '������ע';
comment on column SRC0117_POP_DIANDI.is_wmcheck
  is '�Ƿ���Ҫ����';
comment on column SRC0117_POP_DIANDI.isglo_cer
  is '���޹���֤';
comment on column SRC0117_POP_DIANDI.current_addr
  is '�־�ס��ַ';
comment on column SRC0117_POP_DIANDI.landlord_name
  is '��������';
comment on column SRC0117_POP_DIANDI.landlord_id
  is '�������֤';
comment on column SRC0117_POP_DIANDI.isspouse_loc
  is '��ż�Ƿ񱾵�';
comment on column SRC0117_POP_DIANDI.spouse_dom
  is '��ż������';
comment on column SRC0117_POP_DIANDI.pop_status
  is '��Ա״̬';
comment on column SRC0117_POP_DIANDI.pop_ctg
  is '��Ա���';
comment on column SRC0117_POP_DIANDI.obtain_date
  is '�뻧ʱ��';
comment on column SRC0117_POP_DIANDI.exit_date
  is '����ʱ��';
comment on column SRC0117_POP_DIANDI.reg_date
  is '�Ǽ�����';
comment on column SRC0117_POP_DIANDI.leave_date
  is '�뼮ʱ��';
comment on column SRC0117_POP_DIANDI.height
  is '���';
comment on column SRC0117_POP_DIANDI.form_name
  is '������';
comment on column SRC0117_POP_DIANDI.occu_type
  is 'ְҵ���';
comment on column SRC0117_POP_DIANDI.pol_visage
  is '������ò';
comment on column SRC0117_POP_DIANDI.note
  is '��ע';
comment on column SRC0117_POP_DIANDI.rel_beli
  is '�ڽ�����';
comment on column SRC0117_POP_DIANDI.nationality
  is '����';
comment on column SRC0117_POP_DIANDI.time
  is '����ʱ��';
comment on column SRC0117_POP_DIANDI.sort_id
  is '����';

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
  is '����˿���Ϣ';
comment on column SRC0117_POP_DIANDI_BAK.gen_grid
  is '��������';
comment on column SRC0117_POP_DIANDI_BAK.jur_area
  is '��Ͻ����';
comment on column SRC0117_POP_DIANDI_BAK.jur_code
  is '��Ͻ�������';
comment on column SRC0117_POP_DIANDI_BAK.mng_type
  is '��������';
comment on column SRC0117_POP_DIANDI_BAK.pop_type
  is '�˿�����';
comment on column SRC0117_POP_DIANDI_BAK.fam_num
  is '��ͥ���';
comment on column SRC0117_POP_DIANDI_BAK.home_addr
  is '��ͥ��ַ';
comment on column SRC0117_POP_DIANDI_BAK.fix_ttl
  is '�̶��绰';
comment on column SRC0117_POP_DIANDI_BAK.mb_phone
  is '�ƶ��绰';
comment on column SRC0117_POP_DIANDI_BAK.rel_hsh
  is '�뻧����ϵ';
comment on column SRC0117_POP_DIANDI_BAK.hsh_status
  is '�˻�״̬';
comment on column SRC0117_POP_DIANDI_BAK.pop_name
  is '����';
comment on column SRC0117_POP_DIANDI_BAK.pop_sex
  is '�Ա�';
comment on column SRC0117_POP_DIANDI_BAK.birthday
  is '��������';
comment on column SRC0117_POP_DIANDI_BAK.dom_type
  is '֤������';
comment on column SRC0117_POP_DIANDI_BAK.account_no
  is '֤����';
comment on column SRC0117_POP_DIANDI_BAK.nation
  is '����';
comment on column SRC0117_POP_DIANDI_BAK.deg_edu
  is '�Ļ��̶�';
comment on column SRC0117_POP_DIANDI_BAK.occupation
  is 'ְҵ';
comment on column SRC0117_POP_DIANDI_BAK.work_unit
  is '������λ';
comment on column SRC0117_POP_DIANDI_BAK.reg_code
  is '�����ش���';
comment on column SRC0117_POP_DIANDI_BAK.domicile
  is '������';
comment on column SRC0117_POP_DIANDI_BAK.hs_tel
  is '��������ϵ�绰';
comment on column SRC0117_POP_DIANDI_BAK.isonlychild
  is '�Ƿ����';
comment on column SRC0117_POP_DIANDI_BAK.office_tel
  is '�칫�绰';
comment on column SRC0117_POP_DIANDI_BAK.fa_name
  is '��������';
comment on column SRC0117_POP_DIANDI_BAK.ma_name
  is 'ĸ������';
comment on column SRC0117_POP_DIANDI_BAK.mar_status
  is '����״��';
comment on column SRC0117_POP_DIANDI_BAK.mar_date
  is '��������';
comment on column SRC0117_POP_DIANDI_BAK.spouse_name
  is '��ż����';
comment on column SRC0117_POP_DIANDI_BAK.spouse_birth
  is '��ż��������';
comment on column SRC0117_POP_DIANDI_BAK.spouse_no
  is '��ż���֤';
comment on column SRC0117_POP_DIANDI_BAK.child_num
  is '�ֺ���';
comment on column SRC0117_POP_DIANDI_BAK.boy_num
  is '���к���';
comment on column SRC0117_POP_DIANDI_BAK.girl_num
  is '��Ů����';
comment on column SRC0117_POP_DIANDI_BAK.issue_date
  is '��֤����';
comment on column SRC0117_POP_DIANDI_BAK.discipline
  is '�Ƿ�Υ��';
comment on column SRC0117_POP_DIANDI_BAK.ctp_mea
  is '������ʩ';
comment on column SRC0117_POP_DIANDI_BAK.cont_date
  is '��������';
comment on column SRC0117_POP_DIANDI_BAK.cont_note
  is '������ע';
comment on column SRC0117_POP_DIANDI_BAK.is_wmcheck
  is '�Ƿ���Ҫ����';
comment on column SRC0117_POP_DIANDI_BAK.isglo_cer
  is '���޹���֤';
comment on column SRC0117_POP_DIANDI_BAK.current_addr
  is '�־�ס��ַ';
comment on column SRC0117_POP_DIANDI_BAK.landlord_name
  is '��������';
comment on column SRC0117_POP_DIANDI_BAK.landlord_id
  is '�������֤';
comment on column SRC0117_POP_DIANDI_BAK.isspouse_loc
  is '��ż�Ƿ񱾵�';
comment on column SRC0117_POP_DIANDI_BAK.spouse_dom
  is '��ż������';
comment on column SRC0117_POP_DIANDI_BAK.pop_status
  is '��Ա״̬';
comment on column SRC0117_POP_DIANDI_BAK.pop_ctg
  is '��Ա���';
comment on column SRC0117_POP_DIANDI_BAK.obtain_date
  is '�뻧ʱ��';
comment on column SRC0117_POP_DIANDI_BAK.exit_date
  is '����ʱ��';
comment on column SRC0117_POP_DIANDI_BAK.reg_date
  is '�Ǽ�����';
comment on column SRC0117_POP_DIANDI_BAK.leave_date
  is '�뼮ʱ��';
comment on column SRC0117_POP_DIANDI_BAK.height
  is '���';
comment on column SRC0117_POP_DIANDI_BAK.form_name
  is '������';
comment on column SRC0117_POP_DIANDI_BAK.occu_type
  is 'ְҵ���';
comment on column SRC0117_POP_DIANDI_BAK.pol_visage
  is '������ò';
comment on column SRC0117_POP_DIANDI_BAK.note
  is '��ע';
comment on column SRC0117_POP_DIANDI_BAK.rel_beli
  is '�ڽ�����';
comment on column SRC0117_POP_DIANDI_BAK.nationality
  is '����';
comment on column SRC0117_POP_DIANDI_BAK.time
  is '����ʱ��';
comment on column SRC0117_POP_DIANDI_BAK.sort_id
  is '����';
comment on column SRC0117_POP_DIANDI_BAK.bus_date
  is 'ҵ������';

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
  is '�貨�˿���Ϣ';
comment on column SRC0117_POP_LINGBO.gen_grid
  is '��������';
comment on column SRC0117_POP_LINGBO.jur_area
  is '��Ͻ����';
comment on column SRC0117_POP_LINGBO.jur_code
  is '��Ͻ�������';
comment on column SRC0117_POP_LINGBO.mng_type
  is '��������';
comment on column SRC0117_POP_LINGBO.pop_type
  is '�˿�����';
comment on column SRC0117_POP_LINGBO.fam_num
  is '��ͥ���';
comment on column SRC0117_POP_LINGBO.home_addr
  is '��ͥ��ַ';
comment on column SRC0117_POP_LINGBO.fix_ttl
  is '�̶��绰';
comment on column SRC0117_POP_LINGBO.mb_phone
  is '�ƶ��绰';
comment on column SRC0117_POP_LINGBO.rel_hsh
  is '�뻧����ϵ';
comment on column SRC0117_POP_LINGBO.hsh_status
  is '�˻�״̬';
comment on column SRC0117_POP_LINGBO.pop_name
  is '����';
comment on column SRC0117_POP_LINGBO.pop_sex
  is '�Ա�';
comment on column SRC0117_POP_LINGBO.birthday
  is '��������';
comment on column SRC0117_POP_LINGBO.dom_type
  is '֤������';
comment on column SRC0117_POP_LINGBO.account_no
  is '֤����';
comment on column SRC0117_POP_LINGBO.nation
  is '����';
comment on column SRC0117_POP_LINGBO.deg_edu
  is '�Ļ��̶�';
comment on column SRC0117_POP_LINGBO.occupation
  is 'ְҵ';
comment on column SRC0117_POP_LINGBO.work_unit
  is '������λ';
comment on column SRC0117_POP_LINGBO.reg_code
  is '�����ش���';
comment on column SRC0117_POP_LINGBO.domicile
  is '������';
comment on column SRC0117_POP_LINGBO.hs_tel
  is '��������ϵ�绰';
comment on column SRC0117_POP_LINGBO.isonlychild
  is '�Ƿ����';
comment on column SRC0117_POP_LINGBO.office_tel
  is '�칫�绰';
comment on column SRC0117_POP_LINGBO.fa_name
  is '��������';
comment on column SRC0117_POP_LINGBO.ma_name
  is 'ĸ������';
comment on column SRC0117_POP_LINGBO.mar_status
  is '����״��';
comment on column SRC0117_POP_LINGBO.mar_date
  is '��������';
comment on column SRC0117_POP_LINGBO.spouse_name
  is '��ż����';
comment on column SRC0117_POP_LINGBO.spouse_birth
  is '��ż��������';
comment on column SRC0117_POP_LINGBO.spouse_no
  is '��ż���֤';
comment on column SRC0117_POP_LINGBO.child_num
  is '�ֺ���';
comment on column SRC0117_POP_LINGBO.boy_num
  is '���к���';
comment on column SRC0117_POP_LINGBO.girl_num
  is '��Ů����';
comment on column SRC0117_POP_LINGBO.issue_date
  is '��֤����';
comment on column SRC0117_POP_LINGBO.discipline
  is '�Ƿ�Υ��';
comment on column SRC0117_POP_LINGBO.ctp_mea
  is '������ʩ';
comment on column SRC0117_POP_LINGBO.cont_date
  is '��������';
comment on column SRC0117_POP_LINGBO.cont_note
  is '������ע';
comment on column SRC0117_POP_LINGBO.is_wmcheck
  is '�Ƿ���Ҫ����';
comment on column SRC0117_POP_LINGBO.isglo_cer
  is '���޹���֤';
comment on column SRC0117_POP_LINGBO.current_addr
  is '�־�ס��ַ';
comment on column SRC0117_POP_LINGBO.landlord_name
  is '��������';
comment on column SRC0117_POP_LINGBO.landlord_id
  is '�������֤';
comment on column SRC0117_POP_LINGBO.isspouse_loc
  is '��ż�Ƿ񱾵�';
comment on column SRC0117_POP_LINGBO.spouse_dom
  is '��ż������';
comment on column SRC0117_POP_LINGBO.pop_status
  is '��Ա״̬';
comment on column SRC0117_POP_LINGBO.pop_ctg
  is '��Ա���';
comment on column SRC0117_POP_LINGBO.obtain_date
  is '�뻧ʱ��';
comment on column SRC0117_POP_LINGBO.exit_date
  is '����ʱ��';
comment on column SRC0117_POP_LINGBO.reg_date
  is '�Ǽ�����';
comment on column SRC0117_POP_LINGBO.leave_date
  is '�뼮ʱ��';
comment on column SRC0117_POP_LINGBO.height
  is '���';
comment on column SRC0117_POP_LINGBO.form_name
  is '������';
comment on column SRC0117_POP_LINGBO.occu_type
  is 'ְҵ���';
comment on column SRC0117_POP_LINGBO.pol_visage
  is '������ò';
comment on column SRC0117_POP_LINGBO.note
  is '��ע';
comment on column SRC0117_POP_LINGBO.rel_beli
  is '�ڽ�����';
comment on column SRC0117_POP_LINGBO.nationality
  is '����';
comment on column SRC0117_POP_LINGBO.time
  is '����ʱ��';
comment on column SRC0117_POP_LINGBO.sort_id
  is '����';

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
  is '�貨�˿���Ϣ';
comment on column SRC0117_POP_LINGBO_BAK.gen_grid
  is '��������';
comment on column SRC0117_POP_LINGBO_BAK.jur_area
  is '��Ͻ����';
comment on column SRC0117_POP_LINGBO_BAK.jur_code
  is '��Ͻ�������';
comment on column SRC0117_POP_LINGBO_BAK.mng_type
  is '��������';
comment on column SRC0117_POP_LINGBO_BAK.pop_type
  is '�˿�����';
comment on column SRC0117_POP_LINGBO_BAK.fam_num
  is '��ͥ���';
comment on column SRC0117_POP_LINGBO_BAK.home_addr
  is '��ͥ��ַ';
comment on column SRC0117_POP_LINGBO_BAK.fix_ttl
  is '�̶��绰';
comment on column SRC0117_POP_LINGBO_BAK.mb_phone
  is '�ƶ��绰';
comment on column SRC0117_POP_LINGBO_BAK.rel_hsh
  is '�뻧����ϵ';
comment on column SRC0117_POP_LINGBO_BAK.hsh_status
  is '�˻�״̬';
comment on column SRC0117_POP_LINGBO_BAK.pop_name
  is '����';
comment on column SRC0117_POP_LINGBO_BAK.pop_sex
  is '�Ա�';
comment on column SRC0117_POP_LINGBO_BAK.birthday
  is '��������';
comment on column SRC0117_POP_LINGBO_BAK.dom_type
  is '֤������';
comment on column SRC0117_POP_LINGBO_BAK.account_no
  is '֤����';
comment on column SRC0117_POP_LINGBO_BAK.nation
  is '����';
comment on column SRC0117_POP_LINGBO_BAK.deg_edu
  is '�Ļ��̶�';
comment on column SRC0117_POP_LINGBO_BAK.occupation
  is 'ְҵ';
comment on column SRC0117_POP_LINGBO_BAK.work_unit
  is '������λ';
comment on column SRC0117_POP_LINGBO_BAK.reg_code
  is '�����ش���';
comment on column SRC0117_POP_LINGBO_BAK.domicile
  is '������';
comment on column SRC0117_POP_LINGBO_BAK.hs_tel
  is '��������ϵ�绰';
comment on column SRC0117_POP_LINGBO_BAK.isonlychild
  is '�Ƿ����';
comment on column SRC0117_POP_LINGBO_BAK.office_tel
  is '�칫�绰';
comment on column SRC0117_POP_LINGBO_BAK.fa_name
  is '��������';
comment on column SRC0117_POP_LINGBO_BAK.ma_name
  is 'ĸ������';
comment on column SRC0117_POP_LINGBO_BAK.mar_status
  is '����״��';
comment on column SRC0117_POP_LINGBO_BAK.mar_date
  is '��������';
comment on column SRC0117_POP_LINGBO_BAK.spouse_name
  is '��ż����';
comment on column SRC0117_POP_LINGBO_BAK.spouse_birth
  is '��ż��������';
comment on column SRC0117_POP_LINGBO_BAK.spouse_no
  is '��ż���֤';
comment on column SRC0117_POP_LINGBO_BAK.child_num
  is '�ֺ���';
comment on column SRC0117_POP_LINGBO_BAK.boy_num
  is '���к���';
comment on column SRC0117_POP_LINGBO_BAK.girl_num
  is '��Ů����';
comment on column SRC0117_POP_LINGBO_BAK.issue_date
  is '��֤����';
comment on column SRC0117_POP_LINGBO_BAK.discipline
  is '�Ƿ�Υ��';
comment on column SRC0117_POP_LINGBO_BAK.ctp_mea
  is '������ʩ';
comment on column SRC0117_POP_LINGBO_BAK.cont_date
  is '��������';
comment on column SRC0117_POP_LINGBO_BAK.cont_note
  is '������ע';
comment on column SRC0117_POP_LINGBO_BAK.is_wmcheck
  is '�Ƿ���Ҫ����';
comment on column SRC0117_POP_LINGBO_BAK.isglo_cer
  is '���޹���֤';
comment on column SRC0117_POP_LINGBO_BAK.current_addr
  is '�־�ס��ַ';
comment on column SRC0117_POP_LINGBO_BAK.landlord_name
  is '��������';
comment on column SRC0117_POP_LINGBO_BAK.landlord_id
  is '�������֤';
comment on column SRC0117_POP_LINGBO_BAK.isspouse_loc
  is '��ż�Ƿ񱾵�';
comment on column SRC0117_POP_LINGBO_BAK.spouse_dom
  is '��ż������';
comment on column SRC0117_POP_LINGBO_BAK.pop_status
  is '��Ա״̬';
comment on column SRC0117_POP_LINGBO_BAK.pop_ctg
  is '��Ա���';
comment on column SRC0117_POP_LINGBO_BAK.obtain_date
  is '�뻧ʱ��';
comment on column SRC0117_POP_LINGBO_BAK.exit_date
  is '����ʱ��';
comment on column SRC0117_POP_LINGBO_BAK.reg_date
  is '�Ǽ�����';
comment on column SRC0117_POP_LINGBO_BAK.leave_date
  is '�뼮ʱ��';
comment on column SRC0117_POP_LINGBO_BAK.height
  is '���';
comment on column SRC0117_POP_LINGBO_BAK.form_name
  is '������';
comment on column SRC0117_POP_LINGBO_BAK.occu_type
  is 'ְҵ���';
comment on column SRC0117_POP_LINGBO_BAK.pol_visage
  is '������ò';
comment on column SRC0117_POP_LINGBO_BAK.note
  is '��ע';
comment on column SRC0117_POP_LINGBO_BAK.rel_beli
  is '�ڽ�����';
comment on column SRC0117_POP_LINGBO_BAK.nationality
  is '����';
comment on column SRC0117_POP_LINGBO_BAK.time
  is '����ʱ��';
comment on column SRC0117_POP_LINGBO_BAK.sort_id
  is '����';
comment on column SRC0117_POP_LINGBO_BAK.bus_date
  is 'ҵ������';

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
  is '������Ա��Ϣ';
comment on column SRC0117_POP_RECTIFICATION.pop_name
  is '����';
comment on column SRC0117_POP_RECTIFICATION.account_no
  is '���֤����';
comment on column SRC0117_POP_RECTIFICATION.gen_grid
  is '��������';
comment on column SRC0117_POP_RECTIFICATION.sentence
  is '�о���ö���';
comment on column SRC0117_POP_RECTIFICATION.ruling_organ
  is '�о���ö�����';
comment on column SRC0117_POP_RECTIFICATION.ruling_date
  is '�о���ö�����';
comment on column SRC0117_POP_RECTIFICATION.pri_pnsm
  is '����';
comment on column SRC0117_POP_RECTIFICATION.add_pnsm
  is '������';
comment on column SRC0117_POP_RECTIFICATION.main_charges
  is '��Ҫ����';
comment on column SRC0117_POP_RECTIFICATION.cc_starttime
  is '����������ʼʱ��';
comment on column SRC0117_POP_RECTIFICATION.cc_endtime
  is '������������ʱ��';
comment on column SRC0117_POP_RECTIFICATION.curr_post
  is '��ְ��';
comment on column SRC0117_POP_RECTIFICATION.curr_type
  is '��������';
comment on column SRC0117_POP_RECTIFICATION.fm_unit
  is 'ԭ��λ';
comment on column SRC0117_POP_RECTIFICATION.fm_post
  is 'ԭְ��';
comment on column SRC0117_POP_RECTIFICATION.curr_unit
  is '�ֵ�λ';
comment on column SRC0117_POP_RECTIFICATION.cri_fact
  is '������ʵ';
comment on column SRC0117_POP_RECTIFICATION.mng_status
  is '�������';
comment on column SRC0117_POP_RECTIFICATION.tube_perf
  is '�йܱ���';
comment on column SRC0117_POP_RECTIFICATION.nvist_time
  is '�´��߷�ʱ��';
comment on column SRC0117_POP_RECTIFICATION.ec_cyle
  is 'ִ������';
comment on column SRC0117_POP_RECTIFICATION.pop_go
  is '��Աȥ��';
comment on column SRC0117_POP_RECTIFICATION.time
  is '����ʱ��';
comment on column SRC0117_POP_RECTIFICATION.sort_id
  is '����';

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
  is '������Ա��Ϣ';
comment on column SRC0117_POP_RECTIFICATION_BAK.pop_name
  is '����';
comment on column SRC0117_POP_RECTIFICATION_BAK.account_no
  is '���֤����';
comment on column SRC0117_POP_RECTIFICATION_BAK.gen_grid
  is '��������';
comment on column SRC0117_POP_RECTIFICATION_BAK.sentence
  is '�о���ö���';
comment on column SRC0117_POP_RECTIFICATION_BAK.ruling_organ
  is '�о���ö�����';
comment on column SRC0117_POP_RECTIFICATION_BAK.ruling_date
  is '�о���ö�����';
comment on column SRC0117_POP_RECTIFICATION_BAK.pri_pnsm
  is '����';
comment on column SRC0117_POP_RECTIFICATION_BAK.add_pnsm
  is '������';
comment on column SRC0117_POP_RECTIFICATION_BAK.main_charges
  is '��Ҫ����';
comment on column SRC0117_POP_RECTIFICATION_BAK.cc_starttime
  is '����������ʼʱ��';
comment on column SRC0117_POP_RECTIFICATION_BAK.cc_endtime
  is '������������ʱ��';
comment on column SRC0117_POP_RECTIFICATION_BAK.curr_post
  is '��ְ��';
comment on column SRC0117_POP_RECTIFICATION_BAK.curr_type
  is '��������';
comment on column SRC0117_POP_RECTIFICATION_BAK.fm_unit
  is 'ԭ��λ';
comment on column SRC0117_POP_RECTIFICATION_BAK.fm_post
  is 'ԭְ��';
comment on column SRC0117_POP_RECTIFICATION_BAK.curr_unit
  is '�ֵ�λ';
comment on column SRC0117_POP_RECTIFICATION_BAK.cri_fact
  is '������ʵ';
comment on column SRC0117_POP_RECTIFICATION_BAK.mng_status
  is '�������';
comment on column SRC0117_POP_RECTIFICATION_BAK.tube_perf
  is '�йܱ���';
comment on column SRC0117_POP_RECTIFICATION_BAK.nvist_time
  is '�´��߷�ʱ��';
comment on column SRC0117_POP_RECTIFICATION_BAK.ec_cyle
  is 'ִ������';
comment on column SRC0117_POP_RECTIFICATION_BAK.pop_go
  is '��Աȥ��';
comment on column SRC0117_POP_RECTIFICATION_BAK.time
  is '����ʱ��';
comment on column SRC0117_POP_RECTIFICATION_BAK.sort_id
  is '����';
comment on column SRC0117_POP_RECTIFICATION_BAK.bus_date
  is 'ҵ������';

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
  is '��֢��������Ϣ��';
comment on column SRC0117_POP_SEV_MEN_PAT.pop_name
  is '����';
comment on column SRC0117_POP_SEV_MEN_PAT.account_no
  is '���֤����';
comment on column SRC0117_POP_SEV_MEN_PAT.gen_grid
  is '��������';
comment on column SRC0117_POP_SEV_MEN_PAT.ill_name
  is '������';
comment on column SRC0117_POP_SEV_MEN_PAT.criticality
  is 'Σ�ճ̶�';
comment on column SRC0117_POP_SEV_MEN_PAT.iscure
  is '�Ƿ��������';
comment on column SRC0117_POP_SEV_MEN_PAT.fre_onset
  is '����Ƶ��';
comment on column SRC0117_POP_SEV_MEN_PAT.ltime_onset
  is '�ϴη���ʱ��';
comment on column SRC0117_POP_SEV_MEN_PAT.tend_viol
  is '�Ƿ��б�������';
comment on column SRC0117_POP_SEV_MEN_PAT.econ_sita
  is '��ͥ����״��';
comment on column SRC0117_POP_SEV_MEN_PAT.ec_cyle
  is 'ִ������';
comment on column SRC0117_POP_SEV_MEN_PAT.visttime
  is '�´��߷�ʱ��';
comment on column SRC0117_POP_SEV_MEN_PAT.time
  is '����ʱ��';
comment on column SRC0117_POP_SEV_MEN_PAT.sort_id
  is '����';

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
  is '��֢��������Ϣ��';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.pop_name
  is '����';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.account_no
  is '���֤����';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.gen_grid
  is '��������';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.ill_name
  is '������';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.criticality
  is 'Σ�ճ̶�';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.iscure
  is '�Ƿ��������';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.fre_onset
  is '����Ƶ��';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.ltime_onset
  is '�ϴη���ʱ��';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.tend_viol
  is '�Ƿ��б�������';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.econ_sita
  is '��ͥ����״��';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.ec_cyle
  is 'ִ������';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.visttime
  is '�´��߷�ʱ��';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.time
  is '����ʱ��';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.sort_id
  is '����';
comment on column SRC0117_POP_SEV_MEN_PAT_BAK.bus_date
  is 'ҵ������';

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
  is 'ʯ���˿���Ϣ';
comment on column SRC0117_POP_SHIKENG.gen_grid
  is '��������';
comment on column SRC0117_POP_SHIKENG.jur_area
  is '��Ͻ����';
comment on column SRC0117_POP_SHIKENG.jur_code
  is '��Ͻ�������';
comment on column SRC0117_POP_SHIKENG.mng_type
  is '��������';
comment on column SRC0117_POP_SHIKENG.pop_type
  is '�˿�����';
comment on column SRC0117_POP_SHIKENG.fam_num
  is '��ͥ���';
comment on column SRC0117_POP_SHIKENG.home_addr
  is '��ͥ��ַ';
comment on column SRC0117_POP_SHIKENG.fix_ttl
  is '�̶��绰';
comment on column SRC0117_POP_SHIKENG.mb_phone
  is '�ƶ��绰';
comment on column SRC0117_POP_SHIKENG.rel_hsh
  is '�뻧����ϵ';
comment on column SRC0117_POP_SHIKENG.hsh_status
  is '�˻�״̬';
comment on column SRC0117_POP_SHIKENG.pop_name
  is '����';
comment on column SRC0117_POP_SHIKENG.pop_sex
  is '�Ա�';
comment on column SRC0117_POP_SHIKENG.birthday
  is '��������';
comment on column SRC0117_POP_SHIKENG.dom_type
  is '֤������';
comment on column SRC0117_POP_SHIKENG.account_no
  is '֤����';
comment on column SRC0117_POP_SHIKENG.nation
  is '����';
comment on column SRC0117_POP_SHIKENG.deg_edu
  is '�Ļ��̶�';
comment on column SRC0117_POP_SHIKENG.occupation
  is 'ְҵ';
comment on column SRC0117_POP_SHIKENG.work_unit
  is '������λ';
comment on column SRC0117_POP_SHIKENG.reg_code
  is '�����ش���';
comment on column SRC0117_POP_SHIKENG.domicile
  is '������';
comment on column SRC0117_POP_SHIKENG.hs_tel
  is '��������ϵ�绰';
comment on column SRC0117_POP_SHIKENG.isonlychild
  is '�Ƿ����';
comment on column SRC0117_POP_SHIKENG.office_tel
  is '�칫�绰';
comment on column SRC0117_POP_SHIKENG.fa_name
  is '��������';
comment on column SRC0117_POP_SHIKENG.ma_name
  is 'ĸ������';
comment on column SRC0117_POP_SHIKENG.mar_status
  is '����״��';
comment on column SRC0117_POP_SHIKENG.mar_date
  is '��������';
comment on column SRC0117_POP_SHIKENG.spouse_name
  is '��ż����';
comment on column SRC0117_POP_SHIKENG.spouse_birth
  is '��ż��������';
comment on column SRC0117_POP_SHIKENG.spouse_no
  is '��ż���֤';
comment on column SRC0117_POP_SHIKENG.child_num
  is '�ֺ���';
comment on column SRC0117_POP_SHIKENG.boy_num
  is '���к���';
comment on column SRC0117_POP_SHIKENG.girl_num
  is '��Ů����';
comment on column SRC0117_POP_SHIKENG.issue_date
  is '��֤����';
comment on column SRC0117_POP_SHIKENG.discipline
  is '�Ƿ�Υ��';
comment on column SRC0117_POP_SHIKENG.ctp_mea
  is '������ʩ';
comment on column SRC0117_POP_SHIKENG.cont_date
  is '��������';
comment on column SRC0117_POP_SHIKENG.cont_note
  is '������ע';
comment on column SRC0117_POP_SHIKENG.is_wmcheck
  is '�Ƿ���Ҫ����';
comment on column SRC0117_POP_SHIKENG.isglo_cer
  is '���޹���֤';
comment on column SRC0117_POP_SHIKENG.current_addr
  is '�־�ס��ַ';
comment on column SRC0117_POP_SHIKENG.landlord_name
  is '��������';
comment on column SRC0117_POP_SHIKENG.landlord_id
  is '�������֤';
comment on column SRC0117_POP_SHIKENG.isspouse_loc
  is '��ż�Ƿ񱾵�';
comment on column SRC0117_POP_SHIKENG.spouse_dom
  is '��ż������';
comment on column SRC0117_POP_SHIKENG.pop_status
  is '��Ա״̬';
comment on column SRC0117_POP_SHIKENG.pop_ctg
  is '��Ա���';
comment on column SRC0117_POP_SHIKENG.obtain_date
  is '�뻧ʱ��';
comment on column SRC0117_POP_SHIKENG.exit_date
  is '����ʱ��';
comment on column SRC0117_POP_SHIKENG.reg_date
  is '�Ǽ�����';
comment on column SRC0117_POP_SHIKENG.leave_date
  is '�뼮ʱ��';
comment on column SRC0117_POP_SHIKENG.height
  is '���';
comment on column SRC0117_POP_SHIKENG.form_name
  is '������';
comment on column SRC0117_POP_SHIKENG.occu_type
  is 'ְҵ���';
comment on column SRC0117_POP_SHIKENG.pol_visage
  is '������ò';
comment on column SRC0117_POP_SHIKENG.note
  is '��ע';
comment on column SRC0117_POP_SHIKENG.rel_beli
  is '�ڽ�����';
comment on column SRC0117_POP_SHIKENG.nationality
  is '����';
comment on column SRC0117_POP_SHIKENG.time
  is '����ʱ��';
comment on column SRC0117_POP_SHIKENG.sort_id
  is '����';

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
  is 'ʯ���˿���Ϣ';
comment on column SRC0117_POP_SHIKENG_BAK.gen_grid
  is '��������';
comment on column SRC0117_POP_SHIKENG_BAK.jur_area
  is '��Ͻ����';
comment on column SRC0117_POP_SHIKENG_BAK.jur_code
  is '��Ͻ�������';
comment on column SRC0117_POP_SHIKENG_BAK.mng_type
  is '��������';
comment on column SRC0117_POP_SHIKENG_BAK.pop_type
  is '�˿�����';
comment on column SRC0117_POP_SHIKENG_BAK.fam_num
  is '��ͥ���';
comment on column SRC0117_POP_SHIKENG_BAK.home_addr
  is '��ͥ��ַ';
comment on column SRC0117_POP_SHIKENG_BAK.fix_ttl
  is '�̶��绰';
comment on column SRC0117_POP_SHIKENG_BAK.mb_phone
  is '�ƶ��绰';
comment on column SRC0117_POP_SHIKENG_BAK.rel_hsh
  is '�뻧����ϵ';
comment on column SRC0117_POP_SHIKENG_BAK.hsh_status
  is '�˻�״̬';
comment on column SRC0117_POP_SHIKENG_BAK.pop_name
  is '����';
comment on column SRC0117_POP_SHIKENG_BAK.pop_sex
  is '�Ա�';
comment on column SRC0117_POP_SHIKENG_BAK.birthday
  is '��������';
comment on column SRC0117_POP_SHIKENG_BAK.dom_type
  is '֤������';
comment on column SRC0117_POP_SHIKENG_BAK.account_no
  is '֤����';
comment on column SRC0117_POP_SHIKENG_BAK.nation
  is '����';
comment on column SRC0117_POP_SHIKENG_BAK.deg_edu
  is '�Ļ��̶�';
comment on column SRC0117_POP_SHIKENG_BAK.occupation
  is 'ְҵ';
comment on column SRC0117_POP_SHIKENG_BAK.work_unit
  is '������λ';
comment on column SRC0117_POP_SHIKENG_BAK.reg_code
  is '�����ش���';
comment on column SRC0117_POP_SHIKENG_BAK.domicile
  is '������';
comment on column SRC0117_POP_SHIKENG_BAK.hs_tel
  is '��������ϵ�绰';
comment on column SRC0117_POP_SHIKENG_BAK.isonlychild
  is '�Ƿ����';
comment on column SRC0117_POP_SHIKENG_BAK.office_tel
  is '�칫�绰';
comment on column SRC0117_POP_SHIKENG_BAK.fa_name
  is '��������';
comment on column SRC0117_POP_SHIKENG_BAK.ma_name
  is 'ĸ������';
comment on column SRC0117_POP_SHIKENG_BAK.mar_status
  is '����״��';
comment on column SRC0117_POP_SHIKENG_BAK.mar_date
  is '��������';
comment on column SRC0117_POP_SHIKENG_BAK.spouse_name
  is '��ż����';
comment on column SRC0117_POP_SHIKENG_BAK.spouse_birth
  is '��ż��������';
comment on column SRC0117_POP_SHIKENG_BAK.spouse_no
  is '��ż���֤';
comment on column SRC0117_POP_SHIKENG_BAK.child_num
  is '�ֺ���';
comment on column SRC0117_POP_SHIKENG_BAK.boy_num
  is '���к���';
comment on column SRC0117_POP_SHIKENG_BAK.girl_num
  is '��Ů����';
comment on column SRC0117_POP_SHIKENG_BAK.issue_date
  is '��֤����';
comment on column SRC0117_POP_SHIKENG_BAK.discipline
  is '�Ƿ�Υ��';
comment on column SRC0117_POP_SHIKENG_BAK.ctp_mea
  is '������ʩ';
comment on column SRC0117_POP_SHIKENG_BAK.cont_date
  is '��������';
comment on column SRC0117_POP_SHIKENG_BAK.cont_note
  is '������ע';
comment on column SRC0117_POP_SHIKENG_BAK.is_wmcheck
  is '�Ƿ���Ҫ����';
comment on column SRC0117_POP_SHIKENG_BAK.isglo_cer
  is '���޹���֤';
comment on column SRC0117_POP_SHIKENG_BAK.current_addr
  is '�־�ס��ַ';
comment on column SRC0117_POP_SHIKENG_BAK.landlord_name
  is '��������';
comment on column SRC0117_POP_SHIKENG_BAK.landlord_id
  is '�������֤';
comment on column SRC0117_POP_SHIKENG_BAK.isspouse_loc
  is '��ż�Ƿ񱾵�';
comment on column SRC0117_POP_SHIKENG_BAK.spouse_dom
  is '��ż������';
comment on column SRC0117_POP_SHIKENG_BAK.pop_status
  is '��Ա״̬';
comment on column SRC0117_POP_SHIKENG_BAK.pop_ctg
  is '��Ա���';
comment on column SRC0117_POP_SHIKENG_BAK.obtain_date
  is '�뻧ʱ��';
comment on column SRC0117_POP_SHIKENG_BAK.exit_date
  is '����ʱ��';
comment on column SRC0117_POP_SHIKENG_BAK.reg_date
  is '�Ǽ�����';
comment on column SRC0117_POP_SHIKENG_BAK.leave_date
  is '�뼮ʱ��';
comment on column SRC0117_POP_SHIKENG_BAK.height
  is '���';
comment on column SRC0117_POP_SHIKENG_BAK.form_name
  is '������';
comment on column SRC0117_POP_SHIKENG_BAK.occu_type
  is 'ְҵ���';
comment on column SRC0117_POP_SHIKENG_BAK.pol_visage
  is '������ò';
comment on column SRC0117_POP_SHIKENG_BAK.note
  is '��ע';
comment on column SRC0117_POP_SHIKENG_BAK.rel_beli
  is '�ڽ�����';
comment on column SRC0117_POP_SHIKENG_BAK.nationality
  is '����';
comment on column SRC0117_POP_SHIKENG_BAK.time
  is '����ʱ��';
comment on column SRC0117_POP_SHIKENG_BAK.sort_id
  is '����';
comment on column SRC0117_POP_SHIKENG_BAK.bus_date
  is 'ҵ������';

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
  is '���ز��������ۻ��ܱ�';
comment on column SRC0118_REALTY_SALE_M.region
  is '����';
comment on column SRC0118_REALTY_SALE_M.investment
  is '��������Ͷ��';
comment on column SRC0118_REALTY_SALE_M.cig_rate
  is '��������Ͷ��ͬ�������� ';
comment on column SRC0118_REALTY_SALE_M.chs_area
  is '��Ʒ�����������';
comment on column SRC0118_REALTY_SALE_M.chs_rate
  is '��Ʒ�����������ͬ��������';
comment on column SRC0118_REALTY_SALE_M.sale_area
  is '��Ʒסլ�����������';
comment on column SRC0118_REALTY_SALE_M.crstg_rate
  is '��Ʒסլ�����������ͬ��������';
comment on column SRC0118_REALTY_SALE_M.shht_area
  is '���ַ����������';
comment on column SRC0118_REALTY_SALE_M.shht_rate
  is '���ַ����������ͬ��������';
comment on column SRC0118_REALTY_SALE_M.srht_area
  is '����סլ�����������';
comment on column SRC0118_REALTY_SALE_M.srht_rate
  is '����סլ�����������ͬ��������';
comment on column SRC0118_REALTY_SALE_M.mreit_area
  is '�г����ز���������';
comment on column SRC0118_REALTY_SALE_M.mreit_cycle
  is '�г����ز���������ȥ������';
comment on column SRC0118_REALTY_SALE_M.mrhit_area
  is '�г�סլ����������';
comment on column SRC0118_REALTY_SALE_M.mrhit_cycle
  is '�г�סլ����������ȥ������';
comment on column SRC0118_REALTY_SALE_M.mnrhit_area
  is '�г���סլ����������';
comment on column SRC0118_REALTY_SALE_M.mnrhit_cycle
  is '�г���סլ����������ȥ������';
comment on column SRC0118_REALTY_SALE_M.mcreit_area
  is '�г���ҵ���ز���������';
comment on column SRC0118_REALTY_SALE_M.mcreit_cycle
  is '�г���ҵ���ز���������ȥ������';
comment on column SRC0118_REALTY_SALE_M.moreit_area
  is '�г��칫���ز���������';
comment on column SRC0118_REALTY_SALE_M.moreit_cycle
  is '�г��칫���ز���������ȥ������';
comment on column SRC0118_REALTY_SALE_M.input_date
  is '����';
comment on column SRC0118_REALTY_SALE_M.time
  is '����ʱ��';
comment on column SRC0118_REALTY_SALE_M.sort_id
  is '����';

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
  is '���������ѯ�嵥��';
comment on column SRC0126_CORP_INFO.state
  is '״̬';
comment on column SRC0126_CORP_INFO.reg_num
  is 'ע���';
comment on column SRC0126_CORP_INFO.usc_code
  is 'ͳһ������ô���';
comment on column SRC0126_CORP_INFO.mer_name
  is '�Ǽ�����';
comment on column SRC0126_CORP_INFO.etp_ctg
  is '��ҵ���';
comment on column SRC0126_CORP_INFO.reg_type
  is '�Ǽ�����';
comment on column SRC0126_CORP_INFO.etp_type
  is '��ҵ����';
comment on column SRC0126_CORP_INFO.legal
  is '����������\������';
comment on column SRC0126_CORP_INFO.reg_capital
  is 'ע���ʱ�(��Ԫ)';
comment on column SRC0126_CORP_INFO.paid_capital
  is 'ʵ���ʱ�(��Ԫ)';
comment on column SRC0126_CORP_INFO.operator_tel
  is '��ϵ�绰';
comment on column SRC0126_CORP_INFO.liaison
  is '��ʾ����Ա';
comment on column SRC0126_CORP_INFO.liaison_tel
  is '����Ա�绰';
comment on column SRC0126_CORP_INFO.idt_ctgr
  is '��ҵ����';
comment on column SRC0126_CORP_INFO.trade_type
  is '��ҵ���';
comment on column SRC0126_CORP_INFO.trade_code
  is '��ҵ����';
comment on column SRC0126_CORP_INFO.bus_scope
  is '��Ӫ��Χ';
comment on column SRC0126_CORP_INFO.esta_date
  is '��������';
comment on column SRC0126_CORP_INFO.bus_term
  is 'Ӫҵ����';
comment on column SRC0126_CORP_INFO.appr_date
  is '��׼����';
comment on column SRC0126_CORP_INFO.dst_county
  is '����';
comment on column SRC0126_CORP_INFO.county_code
  is '���ش���';
comment on column SRC0126_CORP_INFO.postcode
  is '��������';
comment on column SRC0126_CORP_INFO.residence
  is 'ס��';
comment on column SRC0126_CORP_INFO.reg_dpt
  is '�Ǽǻ���';
comment on column SRC0126_CORP_INFO.area_tib
  is 'Ͻ�����̾�';
comment on column SRC0126_CORP_INFO.terr_tib
  is '��Ƭ������';
comment on column SRC0126_CORP_INFO.district
  is 'Ƭ��';
comment on column SRC0126_CORP_INFO.logout_date
  is 'ע������';
comment on column SRC0126_CORP_INFO.cancell_rea
  is 'ע��ԭ��';
comment on column SRC0126_CORP_INFO.reve_date
  is '��������';
comment on column SRC0126_CORP_INFO.reve_rea
  is '����ԭ��';
comment on column SRC0126_CORP_INFO.time
  is 'ʱ���';
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
  is '���������ѯ�嵥��';
comment on column SRC0126_CORP_INFO_BAK.state
  is '״̬';
comment on column SRC0126_CORP_INFO_BAK.reg_num
  is 'ע���';
comment on column SRC0126_CORP_INFO_BAK.usc_code
  is 'ͳһ������ô���';
comment on column SRC0126_CORP_INFO_BAK.mer_name
  is '�Ǽ�����';
comment on column SRC0126_CORP_INFO_BAK.etp_ctg
  is '��ҵ���';
comment on column SRC0126_CORP_INFO_BAK.reg_type
  is '�Ǽ�����';
comment on column SRC0126_CORP_INFO_BAK.etp_type
  is '��ҵ����';
comment on column SRC0126_CORP_INFO_BAK.legal
  is '����������\������';
comment on column SRC0126_CORP_INFO_BAK.reg_capital
  is 'ע���ʱ�(��Ԫ)';
comment on column SRC0126_CORP_INFO_BAK.paid_capital
  is 'ʵ���ʱ�(��Ԫ)';
comment on column SRC0126_CORP_INFO_BAK.operator_tel
  is '��ϵ�绰';
comment on column SRC0126_CORP_INFO_BAK.liaison
  is '��ʾ����Ա';
comment on column SRC0126_CORP_INFO_BAK.liaison_tel
  is '����Ա�绰';
comment on column SRC0126_CORP_INFO_BAK.idt_ctgr
  is '��ҵ����';
comment on column SRC0126_CORP_INFO_BAK.trade_type
  is '��ҵ���';
comment on column SRC0126_CORP_INFO_BAK.trade_code
  is '��ҵ����';
comment on column SRC0126_CORP_INFO_BAK.bus_scope
  is '��Ӫ��Χ';
comment on column SRC0126_CORP_INFO_BAK.esta_date
  is '��������';
comment on column SRC0126_CORP_INFO_BAK.bus_term
  is 'Ӫҵ����';
comment on column SRC0126_CORP_INFO_BAK.appr_date
  is '��׼����';
comment on column SRC0126_CORP_INFO_BAK.dst_county
  is '����';
comment on column SRC0126_CORP_INFO_BAK.county_code
  is '���ش���';
comment on column SRC0126_CORP_INFO_BAK.postcode
  is '��������';
comment on column SRC0126_CORP_INFO_BAK.residence
  is 'ס��';
comment on column SRC0126_CORP_INFO_BAK.reg_dpt
  is '�Ǽǻ���';
comment on column SRC0126_CORP_INFO_BAK.area_tib
  is 'Ͻ�����̾�';
comment on column SRC0126_CORP_INFO_BAK.terr_tib
  is '��Ƭ������';
comment on column SRC0126_CORP_INFO_BAK.district
  is 'Ƭ��';
comment on column SRC0126_CORP_INFO_BAK.logout_date
  is 'ע������';
comment on column SRC0126_CORP_INFO_BAK.cancell_rea
  is 'ע��ԭ��';
comment on column SRC0126_CORP_INFO_BAK.reve_date
  is '��������';
comment on column SRC0126_CORP_INFO_BAK.reve_rea
  is '����ԭ��';
comment on column SRC0126_CORP_INFO_BAK.time
  is 'ʱ���';
comment on column SRC0126_CORP_INFO_BAK.bus_date
  is 'ҵ������';
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
  is '���������ѯ�嵥��';
comment on column SRC0126_INDIV_INFO.state
  is '״̬';
comment on column SRC0126_INDIV_INFO.reg_num
  is 'ע���';
comment on column SRC0126_INDIV_INFO.mer_name
  is '����';
comment on column SRC0126_INDIV_INFO.form
  is '�����ʽ';
comment on column SRC0126_INDIV_INFO.money
  is '�ʽ�����(��Ԫ)';
comment on column SRC0126_INDIV_INFO.dst_county
  is '����';
comment on column SRC0126_INDIV_INFO.county_code
  is '���ش���';
comment on column SRC0126_INDIV_INFO.bus_place
  is '��Ӫ����';
comment on column SRC0126_INDIV_INFO.idt_ctgr
  is '��ҵ����';
comment on column SRC0126_INDIV_INFO.trade_type
  is '��ҵ���';
comment on column SRC0126_INDIV_INFO.trade_code
  is '��ҵ����';
comment on column SRC0126_INDIV_INFO.bus_scope
  is '��Ӫ��Χ';
comment on column SRC0126_INDIV_INFO.operator
  is '��Ӫ��';
comment on column SRC0126_INDIV_INFO.operator_tel
  is '��ϵ�绰';
comment on column SRC0126_INDIV_INFO.liaison
  is '��ʾ����Ա';
comment on column SRC0126_INDIV_INFO.liaison_tel
  is '����Ա�绰';
comment on column SRC0126_INDIV_INFO.open_date
  is '��ҵ����';
comment on column SRC0126_INDIV_INFO.appr_date
  is '��׼����';
comment on column SRC0126_INDIV_INFO.reg_dpt
  is '�Ǽǻ���';
comment on column SRC0126_INDIV_INFO.area_tib
  is 'Ͻ�����̾�';
comment on column SRC0126_INDIV_INFO.terr_tib
  is '���ع�����';
comment on column SRC0126_INDIV_INFO.district
  is 'Ƭ��';
comment on column SRC0126_INDIV_INFO.logout_date
  is 'ע������';
comment on column SRC0126_INDIV_INFO.cancell_rea
  is 'ע��ԭ��';
comment on column SRC0126_INDIV_INFO.reve_date
  is '��������';
comment on column SRC0126_INDIV_INFO.reve_rea
  is '����ԭ��';
comment on column SRC0126_INDIV_INFO.file_no
  is '������';
comment on column SRC0126_INDIV_INFO.time
  is 'ʱ���';
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
  is '���������ѯ�嵥��';
comment on column SRC0126_INDIV_INFO_BAK.state
  is '״̬';
comment on column SRC0126_INDIV_INFO_BAK.reg_num
  is 'ע���';
comment on column SRC0126_INDIV_INFO_BAK.mer_name
  is '����';
comment on column SRC0126_INDIV_INFO_BAK.form
  is '�����ʽ';
comment on column SRC0126_INDIV_INFO_BAK.money
  is '�ʽ�����(��Ԫ)';
comment on column SRC0126_INDIV_INFO_BAK.dst_county
  is '����';
comment on column SRC0126_INDIV_INFO_BAK.county_code
  is '���ش���';
comment on column SRC0126_INDIV_INFO_BAK.bus_place
  is '��Ӫ����';
comment on column SRC0126_INDIV_INFO_BAK.idt_ctgr
  is '��ҵ����';
comment on column SRC0126_INDIV_INFO_BAK.trade_type
  is '��ҵ���';
comment on column SRC0126_INDIV_INFO_BAK.trade_code
  is '��ҵ����';
comment on column SRC0126_INDIV_INFO_BAK.bus_scope
  is '��Ӫ��Χ';
comment on column SRC0126_INDIV_INFO_BAK.operator
  is '��Ӫ��';
comment on column SRC0126_INDIV_INFO_BAK.operator_tel
  is '��ϵ�绰';
comment on column SRC0126_INDIV_INFO_BAK.liaison
  is '��ʾ����Ա';
comment on column SRC0126_INDIV_INFO_BAK.liaison_tel
  is '����Ա�绰';
comment on column SRC0126_INDIV_INFO_BAK.open_date
  is '��ҵ����';
comment on column SRC0126_INDIV_INFO_BAK.appr_date
  is '��׼����';
comment on column SRC0126_INDIV_INFO_BAK.reg_dpt
  is '�Ǽǻ���';
comment on column SRC0126_INDIV_INFO_BAK.area_tib
  is 'Ͻ�����̾�';
comment on column SRC0126_INDIV_INFO_BAK.terr_tib
  is '���ع�����';
comment on column SRC0126_INDIV_INFO_BAK.district
  is 'Ƭ��';
comment on column SRC0126_INDIV_INFO_BAK.logout_date
  is 'ע������';
comment on column SRC0126_INDIV_INFO_BAK.cancell_rea
  is 'ע��ԭ��';
comment on column SRC0126_INDIV_INFO_BAK.reve_date
  is '��������';
comment on column SRC0126_INDIV_INFO_BAK.reve_rea
  is '����ԭ��';
comment on column SRC0126_INDIV_INFO_BAK.file_no
  is '������';
comment on column SRC0126_INDIV_INFO_BAK.time
  is 'ʱ���';
comment on column SRC0126_INDIV_INFO_BAK.bus_date
  is 'ҵ������';
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
  is '��˰��';
comment on column SRC0128_LANDTAX_BUS.soc_cre_code
  is '������ô��루��˰��ʶ��ţ�';
comment on column SRC0128_LANDTAX_BUS.landtax_name
  is '��˰������';
comment on column SRC0128_LANDTAX_BUS.taxp_state
  is '��˰��״̬';
comment on column SRC0128_LANDTAX_BUS.levy_reg_typ
  is '��������Ǽ�����';
comment on column SRC0128_LANDTAX_BUS.reg_type
  is '�Ǽ�ע������';
comment on column SRC0128_LANDTAX_BUS.natlan_tax
  is '���عܻ�����';
comment on column SRC0128_LANDTAX_BUS.sub_rel
  is '��λ������ϵ';
comment on column SRC0128_LANDTAX_BUS.ind_cat
  is '��ҵ����';
comment on column SRC0128_LANDTAX_BUS.ind_cat_heig
  is '��ҵ����';
comment on column SRC0128_LANDTAX_BUS.ind_cat_mid
  is '��ҵ����';
comment on column SRC0128_LANDTAX_BUS.industry
  is '��ҵ';
comment on column SRC0128_LANDTAX_BUS.reg_adr
  is 'ע���ַ';
comment on column SRC0128_LANDTAX_BUS.bus_adr
  is '������Ӫ��ַ';
comment on column SRC0128_LANDTAX_BUS.lgp_name
  is '��������������';
comment on column SRC0128_LANDTAX_BUS.lgp_idnum
  is '�������������֤����';
comment on column SRC0128_LANDTAX_BUS.reg_date
  is '�Ǽ�����';
comment on column SRC0128_LANDTAX_BUS.com_tax_aut
  is '����˰�����';
comment on column SRC0128_LANDTAX_BUS.bus_sco
  is '��Ӫ��Χ';
comment on column SRC0128_LANDTAX_BUS.reg_cap
  is 'ע���ʱ�';
comment on column SRC0128_LANDTAX_BUS.agg_inv
  is 'Ͷ���ܶ�';
comment on column SRC0128_LANDTAX_BUS.app_est_off
  is '��׼��������';
comment on column SRC0128_LANDTAX_BUS.lic_name
  is '֤������';
comment on column SRC0128_LANDTAX_BUS.lic_code
  is '֤�ձ��';
comment on column SRC0128_LANDTAX_BUS.open_date
  is '��ҵ��������';
comment on column SRC0128_LANDTAX_BUS.bus_beg_time
  is '������Ӫ������';
comment on column SRC0128_LANDTAX_BUS.bus_end_time
  is '������Ӫ����ֹ';
comment on column SRC0128_LANDTAX_BUS.taxp_iden_num
  is '��˰��ʶ���';
comment on column SRC0128_LANDTAX_BUS.time
  is 'ʱ���';
comment on column SRC0128_LANDTAX_BUS.sort_id
  is '�����ֶ�';

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
  is '��˰��';
comment on column SRC0128_LANDTAX_BUS_BAK.soc_cre_code
  is '������ô��루��˰��ʶ��ţ�';
comment on column SRC0128_LANDTAX_BUS_BAK.landtax_name
  is '��˰������';
comment on column SRC0128_LANDTAX_BUS_BAK.taxp_state
  is '��˰��״̬';
comment on column SRC0128_LANDTAX_BUS_BAK.levy_reg_typ
  is '��������Ǽ�����';
comment on column SRC0128_LANDTAX_BUS_BAK.reg_type
  is '�Ǽ�ע������';
comment on column SRC0128_LANDTAX_BUS_BAK.natlan_tax
  is '���عܻ�����';
comment on column SRC0128_LANDTAX_BUS_BAK.sub_rel
  is '��λ������ϵ';
comment on column SRC0128_LANDTAX_BUS_BAK.ind_cat
  is '��ҵ����';
comment on column SRC0128_LANDTAX_BUS_BAK.ind_cat_heig
  is '��ҵ����';
comment on column SRC0128_LANDTAX_BUS_BAK.ind_cat_mid
  is '��ҵ����';
comment on column SRC0128_LANDTAX_BUS_BAK.industry
  is '��ҵ';
comment on column SRC0128_LANDTAX_BUS_BAK.reg_adr
  is 'ע���ַ';
comment on column SRC0128_LANDTAX_BUS_BAK.bus_adr
  is '������Ӫ��ַ';
comment on column SRC0128_LANDTAX_BUS_BAK.lgp_name
  is '��������������';
comment on column SRC0128_LANDTAX_BUS_BAK.lgp_idnum
  is '�������������֤����';
comment on column SRC0128_LANDTAX_BUS_BAK.reg_date
  is '�Ǽ�����';
comment on column SRC0128_LANDTAX_BUS_BAK.com_tax_aut
  is '����˰�����';
comment on column SRC0128_LANDTAX_BUS_BAK.bus_sco
  is '��Ӫ��Χ';
comment on column SRC0128_LANDTAX_BUS_BAK.reg_cap
  is 'ע���ʱ�';
comment on column SRC0128_LANDTAX_BUS_BAK.agg_inv
  is 'Ͷ���ܶ�';
comment on column SRC0128_LANDTAX_BUS_BAK.app_est_off
  is '��׼��������';
comment on column SRC0128_LANDTAX_BUS_BAK.lic_name
  is '֤������';
comment on column SRC0128_LANDTAX_BUS_BAK.lic_code
  is '֤�ձ��';
comment on column SRC0128_LANDTAX_BUS_BAK.open_date
  is '��ҵ��������';
comment on column SRC0128_LANDTAX_BUS_BAK.bus_beg_time
  is '������Ӫ������';
comment on column SRC0128_LANDTAX_BUS_BAK.bus_end_time
  is '������Ӫ����ֹ';
comment on column SRC0128_LANDTAX_BUS_BAK.taxp_iden_num
  is '��˰��ʶ���';
comment on column SRC0128_LANDTAX_BUS_BAK.time
  is 'ʱ���';
comment on column SRC0128_LANDTAX_BUS_BAK.sort_id
  is '�����ֶ�';
comment on column SRC0128_LANDTAX_BUS_BAK.bus_date
  is 'ҵ������';

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
  is '��Ŀ����������';
comment on column SRC0202_PLN_PCATTYPE.proj_catg_type_id
  is '����������id';
comment on column SRC0202_PLN_PCATTYPE.seq_num
  is '����';
comment on column SRC0202_PLN_PCATTYPE.proj_catg_short_len
  is '��ֵ����';
comment on column SRC0202_PLN_PCATTYPE.proj_catg_type
  is '����������';
comment on column SRC0202_PLN_PCATTYPE.super_flag
  is '������';
comment on column SRC0202_PLN_PCATTYPE.proj_catg_type_wt
  is '����������Ȩ��';
comment on column SRC0202_PLN_PCATTYPE.max_proj_catg_wt
  is '������������Ȩ��';
comment on column SRC0202_PLN_PCATTYPE.update_date
  is '����ʱ��';
comment on column SRC0202_PLN_PCATTYPE.update_user
  is '�����û�';
comment on column SRC0202_PLN_PCATTYPE.create_date
  is '����ʱ��';
comment on column SRC0202_PLN_PCATTYPE.create_user
  is '�����û�';
comment on column SRC0202_PLN_PCATTYPE.delete_session_id
  is 'ɾ��id';
comment on column SRC0202_PLN_PCATTYPE.delete_date
  is 'ɾ��ʱ��';
comment on column SRC0202_PLN_PCATTYPE.p3_flag
  is '�Ƿ�Ϊp3����ķ�����';
comment on column SRC0202_PLN_PCATTYPE.p3_proj_catg_type_id
  is 'p3����������id';

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
  is '��Ŀ������ֵ';
comment on column SRC0202_PLN_PCATVAL.proj_catg_id
  is '����';
comment on column SRC0202_PLN_PCATVAL.proj_catg_type_id
  is '��Ŀ����������id';
comment on column SRC0202_PLN_PCATVAL.seq_num
  is '����';
comment on column SRC0202_PLN_PCATVAL.proj_catg_short_name
  is '��Ŀ��������ֵ�Ĵ���';
comment on column SRC0202_PLN_PCATVAL.parent_proj_catg_id
  is '��Ŀ�����븸�ڵ�';
comment on column SRC0202_PLN_PCATVAL.proj_catg_name
  is '��Ŀ��������ֵ����';
comment on column SRC0202_PLN_PCATVAL.proj_catg_wt
  is '��Ŀ��������ֵ����';
comment on column SRC0202_PLN_PCATVAL.update_date
  is '����ʱ��';
comment on column SRC0202_PLN_PCATVAL.update_user
  is '�����û�';
comment on column SRC0202_PLN_PCATVAL.create_date
  is '����ʱ��';
comment on column SRC0202_PLN_PCATVAL.create_user
  is '�����û�';
comment on column SRC0202_PLN_PCATVAL.delete_session_id
  is 'ɾ��id';
comment on column SRC0202_PLN_PCATVAL.delete_date
  is 'ɾ��ʱ��';
comment on column SRC0202_PLN_PCATVAL.p3_flag
  is '�Ƿ�Ϊp3�������ֵ';
comment on column SRC0202_PLN_PCATVAL.p3_proj_catg_id
  is '��Ӧp3����ֵid';

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
  is '��Ŀ��';
comment on column SRC0202_PLN_PROJECT.project_id
  is '��Ŀ��';
comment on column SRC0202_PLN_PROJECT.project_shortname
  is '��Ŀ����';
comment on column SRC0202_PLN_PROJECT.project_name
  is '��Ŀ����';
comment on column SRC0202_PLN_PROJECT.parent_id
  is '��Ŀ���ڵ�id';
comment on column SRC0202_PLN_PROJECT.remark
  is '��Ŀ��ע';
comment on column SRC0202_PLN_PROJECT.user_sid
  is '�û�id';
comment on column SRC0202_PLN_PROJECT.project_type
  is '��Ŀ����';
comment on column SRC0202_PLN_PROJECT.est_wt
  is 'Ȩ��';
comment on column SRC0202_PLN_PROJECT.obs_sid
  is 'Ȩ��id';
comment on column SRC0202_PLN_PROJECT.haschild
  is '�Ƿ����ӽڵ�';
comment on column SRC0202_PLN_PROJECT.p3ec
  is '�Ƿ�Ϊp3������Ŀ';
comment on column SRC0202_PLN_PROJECT.treelevel
  is '���ṹ�ĵڼ���';
comment on column SRC0202_PLN_PROJECT.note
  is '˵��';
comment on column SRC0202_PLN_PROJECT.p3ec_project_id
  is '��Ӧ��p3��Ŀ�ţ�����p3������Ŀ����ֵΪnull';
comment on column SRC0202_PLN_PROJECT.contract_id
  is 'ʩ����ͬ������';
comment on column SRC0202_PLN_PROJECT.displayid
  is '��ʾ';
comment on column SRC0202_PLN_PROJECT.discolor
  is 'չʾ��ɫ';
comment on column SRC0202_PLN_PROJECT.project_type_sid
  is '��Ŀ����id';
comment on column SRC0202_PLN_PROJECT.project_status_sid
  is '��Ŀ״̬id';
comment on column SRC0202_PLN_PROJECT.project_address
  is '��Ŀ��������λ��';
comment on column SRC0202_PLN_PROJECT.target_start_date
  is '������ʼʱ��';
comment on column SRC0202_PLN_PROJECT.target_end_date
  is '�������ʱ��';
comment on column SRC0202_PLN_PROJECT.act_start_date
  is 'ʵ�ʿ�ʼʱ��';
comment on column SRC0202_PLN_PROJECT.act_end_date
  is 'ʱ�����ʱ��';
comment on column SRC0202_PLN_PROJECT.data_date
  is '��������';
comment on column SRC0202_PLN_PROJECT.compute_end_date
  is '�������';
comment on column SRC0202_PLN_PROJECT.expect_start_date
  is '������ʼ';
comment on column SRC0202_PLN_PROJECT.expect_end_date
  is '�������';
comment on column SRC0202_PLN_PROJECT.uncontract_id
  is '�����ͬ��Ͷ�ʣ�����';
comment on column SRC0202_PLN_PROJECT.complete_pct
  is '��ɱȰٷֱ�';
comment on column SRC0202_PLN_PROJECT.allow_diy_web
  is '�Ƿ���Զ�������';
comment on column SRC0202_PLN_PROJECT.program_id
  is '��ĿȺid';
comment on column SRC0202_PLN_PROJECT.risk_level
  is '���յȼ�';
comment on column SRC0202_PLN_PROJECT.proj_url
  is '��Ŀ��վ��ַ';
comment on column SRC0202_PLN_PROJECT.def_duration_type
  is 'Ĭ�Ϲ������ͣ�ͬp3ec�������ַ����Ժ󻻳�������';
comment on column SRC0202_PLN_PROJECT.def_complete_pct_type
  is 'Ĭ����ɰٷֱ�����';
comment on column SRC0202_PLN_PROJECT.def_task_type
  is 'Ĭ����ҵ����';
comment on column SRC0202_PLN_PROJECT.acct_id
  is '���ÿ�Ŀ���';
comment on column SRC0202_PLN_PROJECT.clndr_id
  is '�������';
comment on column SRC0202_PLN_PROJECT.week_id
  is '����id';
comment on column SRC0202_PLN_PROJECT.update_date
  is '��������';
comment on column SRC0202_PLN_PROJECT.critical_drtn_hr_cnt
  is '�ؼ�·��Сʱ';
comment on column SRC0202_PLN_PROJECT.critical_path_type
  is '�ؼ�·������';
comment on column SRC0202_PLN_PROJECT.start_date
  is '��ʼ����';
comment on column SRC0202_PLN_PROJECT.end_date
  is '��������';
comment on column SRC0202_PLN_PROJECT.investplanstartdate
  is 'Ͷ�ʼƻ���ʼ����';
comment on column SRC0202_PLN_PROJECT.investplanenddate
  is 'Ͷ�ʼƻ���������';
comment on column SRC0202_PLN_PROJECT.project_level
  is '��Ŀ����';
comment on column SRC0202_PLN_PROJECT.parent_proj_id
  is '������Ŀid';
comment on column SRC0202_PLN_PROJECT.manageruserid
  is 'δʹ��';
comment on column SRC0202_PLN_PROJECT.managerid
  is 'δʹ��';
comment on column SRC0202_PLN_PROJECT.managername
  is 'δʹ��';
comment on column SRC0202_PLN_PROJECT.flockstatus
  is 'δʹ��';
comment on column SRC0202_PLN_PROJECT.acreage
  is 'δʹ��';
comment on column SRC0202_PLN_PROJECT.infactacreage
  is 'ʵ�����';
comment on column SRC0202_PLN_PROJECT.content
  is '��Ŀ����';
comment on column SRC0202_PLN_PROJECT.scale
  is '�����ģ';
comment on column SRC0202_PLN_PROJECT.totalinvest
  is '��Ͷ��';
comment on column SRC0202_PLN_PROJECT.thisyearinvest
  is '����Ͷ��';
comment on column SRC0202_PLN_PROJECT.dikuai_code
  is '�ؿ����';
comment on column SRC0202_PLN_PROJECT.shortcode
  is '��Ŀ��д';
comment on column SRC0202_PLN_PROJECT.assess_projectid
  is '������Ŀid';
comment on column SRC0202_PLN_PROJECT.acreaprice
  is '�ؿ��С';
comment on column SRC0202_PLN_PROJECT.plan_state
  is '�ƻ�״̬';
comment on column SRC0202_PLN_PROJECT.ycoordinate
  is '��Ŀ����_Y��';
comment on column SRC0202_PLN_PROJECT.xcoordinate
  is '��Ŀ����_X��';
comment on column SRC0202_PLN_PROJECT.time_stamp
  is 'ʱ���';
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
  is '��Ŀ����Ŀ�������ϵ��';
comment on column SRC0202_PLN_PROJPCAT.proj_id
  is '��Ŀ��';
comment on column SRC0202_PLN_PROJPCAT.proj_catg_type_id
  is '��Ŀ���������ͺ�';
comment on column SRC0202_PLN_PROJPCAT.proj_catg_id
  is '��Ŀ�������';
comment on column SRC0202_PLN_PROJPCAT.update_date
  is '��������';
comment on column SRC0202_PLN_PROJPCAT.update_user
  is '�����û�';
comment on column SRC0202_PLN_PROJPCAT.create_date
  is '��������';
comment on column SRC0202_PLN_PROJPCAT.create_user
  is '�����û�';
comment on column SRC0202_PLN_PROJPCAT.delete_session_id
  is 'ɾ��id';
comment on column SRC0202_PLN_PROJPCAT.delete_date
  is 'ɾ������';
alter table SRC0202_PLN_PROJPCAT
  add constraint PK_PLN_PROJPCAT primary key (PROJ_ID, PROJ_CATG_TYPE_ID);


spool off
