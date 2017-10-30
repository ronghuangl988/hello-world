--------------------------------------------
-- Export file for user C##_BIGDATA@ZZMDM --
-- Created by zhy on 2017/10/13, 11:19:41 --
--------------------------------------------

set define off
spool ҵ������.log

prompt
prompt Creating table AC_CONT_BUYLANDDETAIL
prompt ====================================
prompt
create table AC_CONT_BUYLANDDETAIL
(
  stockcontid     VARCHAR2(255),
  payitemcode     VARCHAR2(255),
  payitemname     VARCHAR2(255),
  contnum         NUMBER,
  contunit        NUMBER,
  contcost        NUMBER,
  contratio       NUMBER,
  processrelation VARCHAR2(255),
  numctrl         VARCHAR2(255),
  standard        VARCHAR2(255),
  countingunit    VARCHAR2(255),
  valuation       VARCHAR2(255),
  areanum         VARCHAR2(255),
  landnum         VARCHAR2(255),
  area            NUMBER,
  planpayoff      NUMBER,
  landtype        VARCHAR2(255),
  payoffitem      VARCHAR2(255),
  nowpayoff       NUMBER,
  totalpayoff     NUMBER,
  edetailid       NUMBER,
  approvenum      VARCHAR2(255),
  approvedate     DATE,
  prjcode         VARCHAR2(255),
  prjname         VARCHAR2(255),
  ownerunit       VARCHAR2(255),
  createrunit     VARCHAR2(255),
  payofflimit     NUMBER,
  whichtimes      NUMBER,
  description     VARCHAR2(255),
  creator_id      VARCHAR2(120),
  creator         VARCHAR2(120),
  create_date     DATE,
  modifiedby      VARCHAR2(120),
  modifiedby_id   VARCHAR2(120),
  modified_date   DATE,
  version_status  NUMBER,
  version         NUMBER,
  latestversion   NUMBER,
  approvalstae    NUMBER,
  bus_date        DATE,
  exa_remarks     VARCHAR2(500),
  src_table       VARCHAR2(255),
  src_system      VARCHAR2(255),
  sort_id         NUMBER(38)
)
;
comment on table AC_CONT_BUYLANDDETAIL
  is '���غ�ͬ��';
comment on column AC_CONT_BUYLANDDETAIL.stockcontid
  is '��ͬ���';
comment on column AC_CONT_BUYLANDDETAIL.payitemcode
  is '֧�������';
comment on column AC_CONT_BUYLANDDETAIL.payitemname
  is '֧��������';
comment on column AC_CONT_BUYLANDDETAIL.contnum
  is '��ͬ����';
comment on column AC_CONT_BUYLANDDETAIL.contunit
  is '��ͬ����';
comment on column AC_CONT_BUYLANDDETAIL.contcost
  is '�������';
comment on column AC_CONT_BUYLANDDETAIL.contratio
  is '֧��ϵ��';
comment on column AC_CONT_BUYLANDDETAIL.processrelation
  is '���ȹ���';
comment on column AC_CONT_BUYLANDDETAIL.numctrl
  is '��������';
comment on column AC_CONT_BUYLANDDETAIL.standard
  is '���';
comment on column AC_CONT_BUYLANDDETAIL.countingunit
  is '������λ';
comment on column AC_CONT_BUYLANDDETAIL.valuation
  is '��Լ����';
comment on column AC_CONT_BUYLANDDETAIL.areanum
  is '������';
comment on column AC_CONT_BUYLANDDETAIL.landnum
  is '�ؿ���';
comment on column AC_CONT_BUYLANDDETAIL.area
  is '���';
comment on column AC_CONT_BUYLANDDETAIL.planpayoff
  is '�ƻ�֧�����';
comment on column AC_CONT_BUYLANDDETAIL.landtype
  is '��������';
comment on column AC_CONT_BUYLANDDETAIL.payoffitem
  is '֧����Ŀ';
comment on column AC_CONT_BUYLANDDETAIL.nowpayoff
  is '����֧�����';
comment on column AC_CONT_BUYLANDDETAIL.totalpayoff
  is '�ۼ�֧�����';
comment on column AC_CONT_BUYLANDDETAIL.edetailid
  is 'EDetailID';
comment on column AC_CONT_BUYLANDDETAIL.approvenum
  is '��׼�ĺ�';
comment on column AC_CONT_BUYLANDDETAIL.approvedate
  is '��׼ʱ��';
comment on column AC_CONT_BUYLANDDETAIL.prjcode
  is '��Ŀ���';
comment on column AC_CONT_BUYLANDDETAIL.prjname
  is '��Ŀ����';
comment on column AC_CONT_BUYLANDDETAIL.ownerunit
  is 'ҵ����λ';
comment on column AC_CONT_BUYLANDDETAIL.createrunit
  is '���λ';
comment on column AC_CONT_BUYLANDDETAIL.payofflimit
  is '֧�����';
comment on column AC_CONT_BUYLANDDETAIL.whichtimes
  is '��_�θ���';
comment on column AC_CONT_BUYLANDDETAIL.description
  is '��������';
comment on column AC_CONT_BUYLANDDETAIL.creator_id
  is '������id';
comment on column AC_CONT_BUYLANDDETAIL.creator
  is '������';
comment on column AC_CONT_BUYLANDDETAIL.create_date
  is '��������';
comment on column AC_CONT_BUYLANDDETAIL.modifiedby
  is '�޸���';
comment on column AC_CONT_BUYLANDDETAIL.modifiedby_id
  is '�޸���id';
comment on column AC_CONT_BUYLANDDETAIL.modified_date
  is '�޸�����';
comment on column AC_CONT_BUYLANDDETAIL.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_CONT_BUYLANDDETAIL.version
  is '�汾��';
comment on column AC_CONT_BUYLANDDETAIL.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_CONT_BUYLANDDETAIL.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_CONT_BUYLANDDETAIL.bus_date
  is 'ҵ������';
comment on column AC_CONT_BUYLANDDETAIL.exa_remarks
  is '������ע';
comment on column AC_CONT_BUYLANDDETAIL.src_table
  is '��Դʵ��';
comment on column AC_CONT_BUYLANDDETAIL.src_system
  is '��Դϵͳ';
comment on column AC_CONT_BUYLANDDETAIL.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_CONT_HOUSESALEINFO
prompt ====================================
prompt
create table AC_CONT_HOUSESALEINFO
(
  landlinencename            VARCHAR2(255),
  landlinencecode            VARCHAR2(255),
  landlinencearea            NUMBER,
  landlinenceunit            VARCHAR2(255),
  landlinencedate            DATE,
  prjplanlinencename         VARCHAR2(255),
  prjplanlinencecode         VARCHAR2(255),
  prjplanlinencearea         NUMBER,
  prjplanlinenceunit         VARCHAR2(255),
  prjplanlinencedate         DATE,
  prjplanlinenceperiod       NUMBER,
  prjconstlinence            VARCHAR2(255),
  prjconstlinencecunit       VARCHAR2(255),
  prjconstlinencedate        DATE,
  prjconstlinenceunit        VARCHAR2(255),
  landusecertificate         VARCHAR2(255),
  landuseperiod              NUMBER,
  landcertificatenum         VARCHAR2(255),
  landdevelopusing           VARCHAR2(255),
  landusecertificatearea     NUMBER,
  landusecertificatecunit    VARCHAR2(255),
  preselllinence             VARCHAR2(255),
  preselllinenceperiod       DATE,
  preselllinenceunit         VARCHAR2(255),
  presellprojectname         VARCHAR2(255),
  presellprojectaddress      VARCHAR2(255),
  presellprojectusing        VARCHAR2(255),
  presellobject              VARCHAR2(255),
  presellnumber              NUMBER,
  preselltotalarea           NUMBER,
  projectareas               VARCHAR2(255),
  projectlandlevel           VARCHAR2(255),
  developunit                VARCHAR2(255),
  unitcharater               VARCHAR2(255),
  unitaddress                VARCHAR2(255),
  legalperson                VARCHAR2(255),
  projectmanager             VARCHAR2(255),
  contactphone               VARCHAR2(255),
  capitalregulationbank      VARCHAR2(255),
  capitalregulationaccount   VARCHAR2(255),
  buildingname               VARCHAR2(255),
  buildingnumber             VARCHAR2(255),
  buildingunitnumber         VARCHAR2(255),
  housenumber                VARCHAR2(255),
  housecode                  VARCHAR2(255),
  contructionarea            NUMBER,
  publicarea                 NUMBER,
  privatearea                NUMBER,
  huxing                     VARCHAR2(255),
  toilet                     VARCHAR2(255),
  balcony                    VARCHAR2(255),
  propertytype               VARCHAR2(255),
  preselltotalamount         NUMBER,
  housestatus                VARCHAR2(255),
  wherehouse                 VARCHAR2(255),
  whencreate                 VARCHAR2(255),
  structure                  VARCHAR2(255),
  bulidtotalfloots           NUMBER,
  floots                     NUMBER,
  housecharater              VARCHAR2(255),
  flootheight                VARCHAR2(255),
  sellername                 VARCHAR2(255),
  bussinesslinence           VARCHAR2(255),
  authorizeperson            VARCHAR2(255),
  certificationlevel         VARCHAR2(255),
  sellercontactphone         VARCHAR2(255),
  isclient                   VARCHAR2(255),
  clientname                 VARCHAR2(255),
  clientlegalperson          VARCHAR2(255),
  sellercontactaddress       VARCHAR2(255),
  sellerbank                 VARCHAR2(255),
  sellerbankaccount          VARCHAR2(255),
  buyername                  VARCHAR2(255),
  buyername2                 VARCHAR2(255),
  buyercertification         VARCHAR2(255),
  certificationnum           VARCHAR2(255),
  buyercontactphone          VARCHAR2(255),
  buyercontactaddress        VARCHAR2(255),
  buyersex                   VARCHAR2(255),
  buyernationality           VARCHAR2(255),
  buyernation                VARCHAR2(255),
  payoffmode                 VARCHAR2(255),
  contcode                   VARCHAR2(255),
  stockcontid                VARCHAR2(255),
  contracttime               DATE,
  contbackuptime             DATE,
  firstpay                   NUMBER,
  firstpayratio              NUMBER,
  loanamount                 NUMBER,
  loanperiod                 NUMBER,
  fundloan                   NUMBER,
  bussinessloan              NUMBER,
  paymentaccount             VARCHAR2(255),
  accountbank                VARCHAR2(255),
  sellprice                  NUMBER,
  selltotalamount            NUMBER,
  areasupplement             NUMBER,
  getintime                  DATE,
  propertyfeestandand        NUMBER,
  propertyunitname           VARCHAR2(255),
  propertylegalperson        VARCHAR2(255),
  propertybussinessnum       VARCHAR2(255),
  propertycertificationlevel VARCHAR2(255),
  propertymanagementperiod   NUMBER,
  createpersonid             NUMBER,
  createperson               VARCHAR2(255),
  createtime                 DATE,
  sbjstate                   NUMBER,
  description                VARCHAR2(255),
  creator_id                 VARCHAR2(120),
  creator                    VARCHAR2(120),
  create_date                DATE,
  modifiedby                 VARCHAR2(120),
  modifiedby_id              VARCHAR2(120),
  modified_date              DATE,
  version_status             NUMBER,
  version                    NUMBER,
  latestversion              NUMBER,
  approvalstae               NUMBER,
  bus_date                   DATE,
  exa_remarks                VARCHAR2(500),
  src_table                  VARCHAR2(255),
  src_system                 VARCHAR2(255),
  sort_id                    NUMBER(38)
)
;
comment on table AC_CONT_HOUSESALEINFO
  is '�������ۺ�ͬ��Ϣ��';
comment on column AC_CONT_HOUSESALEINFO.landlinencename
  is '�����õع滮���֤����';
comment on column AC_CONT_HOUSESALEINFO.landlinencecode
  is '�����õع滮���֤���';
comment on column AC_CONT_HOUSESALEINFO.landlinencearea
  is '�����õع滮���֤���';
comment on column AC_CONT_HOUSESALEINFO.landlinenceunit
  is '�����õع滮���֤��֤��λ';
comment on column AC_CONT_HOUSESALEINFO.landlinencedate
  is '�����õع滮���֤����';
comment on column AC_CONT_HOUSESALEINFO.prjplanlinencename
  is '���蹤�̹滮���֤����';
comment on column AC_CONT_HOUSESALEINFO.prjplanlinencecode
  is '���蹤�̹滮���֤���';
comment on column AC_CONT_HOUSESALEINFO.prjplanlinencearea
  is '���蹤�̹滮���֤���';
comment on column AC_CONT_HOUSESALEINFO.prjplanlinenceunit
  is '���蹤�̹滮���֤��֤��λ';
comment on column AC_CONT_HOUSESALEINFO.prjplanlinencedate
  is '���蹤�̹滮���֤����';
comment on column AC_CONT_HOUSESALEINFO.prjplanlinenceperiod
  is '���蹤�̹滮���֤����';
comment on column AC_CONT_HOUSESALEINFO.prjconstlinence
  is '��������ʩ�����֤';
comment on column AC_CONT_HOUSESALEINFO.prjconstlinencecunit
  is '��������ʩ����֤��λ';
comment on column AC_CONT_HOUSESALEINFO.prjconstlinencedate
  is '��������ʩ����֤����';
comment on column AC_CONT_HOUSESALEINFO.prjconstlinenceunit
  is '��������ʩ����λ';
comment on column AC_CONT_HOUSESALEINFO.landusecertificate
  is '����ʹ��֤';
comment on column AC_CONT_HOUSESALEINFO.landuseperiod
  is '����ʹ������';
comment on column AC_CONT_HOUSESALEINFO.landcertificatenum
  is '����֤���';
comment on column AC_CONT_HOUSESALEINFO.landdevelopusing
  is '���ؿ�����;';
comment on column AC_CONT_HOUSESALEINFO.landusecertificatearea
  is '����ʹ��֤�������';
comment on column AC_CONT_HOUSESALEINFO.landusecertificatecunit
  is '����ʹ��֤��֤��λ';
comment on column AC_CONT_HOUSESALEINFO.preselllinence
  is '��Ʒ��Ԥ�����֤';
comment on column AC_CONT_HOUSESALEINFO.preselllinenceperiod
  is 'Ԥ���������';
comment on column AC_CONT_HOUSESALEINFO.preselllinenceunit
  is '��Ʒ��Ԥ�۷�֤��λ';
comment on column AC_CONT_HOUSESALEINFO.presellprojectname
  is 'Ԥ����Ŀ����';
comment on column AC_CONT_HOUSESALEINFO.presellprojectaddress
  is 'Ԥ����Ŀ��ַ';
comment on column AC_CONT_HOUSESALEINFO.presellprojectusing
  is 'Ԥ�۷�����;';
comment on column AC_CONT_HOUSESALEINFO.presellobject
  is 'Ԥ�۶���';
comment on column AC_CONT_HOUSESALEINFO.presellnumber
  is 'Ԥ������';
comment on column AC_CONT_HOUSESALEINFO.preselltotalarea
  is 'Ԥ�������';
comment on column AC_CONT_HOUSESALEINFO.projectareas
  is '��Ŀ��������';
comment on column AC_CONT_HOUSESALEINFO.projectlandlevel
  is '��Ŀ�õصȼ�';
comment on column AC_CONT_HOUSESALEINFO.developunit
  is '������˾';
comment on column AC_CONT_HOUSESALEINFO.unitcharater
  is '��λ����';
comment on column AC_CONT_HOUSESALEINFO.unitaddress
  is '��˾��ַ';
comment on column AC_CONT_HOUSESALEINFO.legalperson
  is '���˴���';
comment on column AC_CONT_HOUSESALEINFO.projectmanager
  is '��Ŀ������';
comment on column AC_CONT_HOUSESALEINFO.contactphone
  is '��ϵ�绰';
comment on column AC_CONT_HOUSESALEINFO.capitalregulationbank
  is '�ʽ�������';
comment on column AC_CONT_HOUSESALEINFO.capitalregulationaccount
  is '�ʽ����˺�';
comment on column AC_CONT_HOUSESALEINFO.buildingname
  is '¥������';
comment on column AC_CONT_HOUSESALEINFO.buildingnumber
  is '����';
comment on column AC_CONT_HOUSESALEINFO.buildingunitnumber
  is '��Ԫ��';
comment on column AC_CONT_HOUSESALEINFO.housenumber
  is '����';
comment on column AC_CONT_HOUSESALEINFO.housecode
  is '���ݱ��';
comment on column AC_CONT_HOUSESALEINFO.contructionarea
  is '�������';
comment on column AC_CONT_HOUSESALEINFO.publicarea
  is '�������';
comment on column AC_CONT_HOUSESALEINFO.privatearea
  is '�������';
comment on column AC_CONT_HOUSESALEINFO.huxing
  is '����';
comment on column AC_CONT_HOUSESALEINFO.toilet
  is '������';
comment on column AC_CONT_HOUSESALEINFO.balcony
  is '��̨';
comment on column AC_CONT_HOUSESALEINFO.propertytype
  is '��ҵ����';
comment on column AC_CONT_HOUSESALEINFO.preselltotalamount
  is 'Ԥ���ܽ��';
comment on column AC_CONT_HOUSESALEINFO.housestatus
  is '����״̬';
comment on column AC_CONT_HOUSESALEINFO.wherehouse
  is '��������';
comment on column AC_CONT_HOUSESALEINFO.whencreate
  is '�������';
comment on column AC_CONT_HOUSESALEINFO.structure
  is '�ṹ';
comment on column AC_CONT_HOUSESALEINFO.bulidtotalfloots
  is '�����ܲ���';
comment on column AC_CONT_HOUSESALEINFO.floots
  is '���ڲ���';
comment on column AC_CONT_HOUSESALEINFO.housecharater
  is '��������';
comment on column AC_CONT_HOUSESALEINFO.flootheight
  is '���';
comment on column AC_CONT_HOUSESALEINFO.sellername
  is '��������';
comment on column AC_CONT_HOUSESALEINFO.bussinesslinence
  is 'Ӫҵִ�պ�';
comment on column AC_CONT_HOUSESALEINFO.authorizeperson
  is '���˴���';
comment on column AC_CONT_HOUSESALEINFO.certificationlevel
  is '��Ȩ����';
comment on column AC_CONT_HOUSESALEINFO.sellercontactphone
  is '���ʵȼ�';
comment on column AC_CONT_HOUSESALEINFO.isclient
  is '��ϵ�绰';
comment on column AC_CONT_HOUSESALEINFO.clientname
  is '��ϵ�绰';
comment on column AC_CONT_HOUSESALEINFO.clientlegalperson
  is '�Ƿ�ί�д���';
comment on column AC_CONT_HOUSESALEINFO.sellercontactaddress
  is 'ί�д���������';
comment on column AC_CONT_HOUSESALEINFO.sellerbank
  is 'ί�д����˷��˴���';
comment on column AC_CONT_HOUSESALEINFO.sellerbankaccount
  is '������ϵ��ַ';
comment on column AC_CONT_HOUSESALEINFO.buyername
  is '����������';
comment on column AC_CONT_HOUSESALEINFO.buyername2
  is '�����������ʺ�';
comment on column AC_CONT_HOUSESALEINFO.buyercertification
  is '������';
comment on column AC_CONT_HOUSESALEINFO.certificationnum
  is '������������Ȩ�ˣ�';
comment on column AC_CONT_HOUSESALEINFO.buyercontactphone
  is '��֤��';
comment on column AC_CONT_HOUSESALEINFO.buyercontactaddress
  is '֤������';
comment on column AC_CONT_HOUSESALEINFO.buyersex
  is '����ϵ�绰';
comment on column AC_CONT_HOUSESALEINFO.buyernationality
  is '����ϵ��ַ';
comment on column AC_CONT_HOUSESALEINFO.buyernation
  is '���ձ�';
comment on column AC_CONT_HOUSESALEINFO.payoffmode
  is '�򷽹���';
comment on column AC_CONT_HOUSESALEINFO.contcode
  is '������';
comment on column AC_CONT_HOUSESALEINFO.stockcontid
  is '��ͬ���';
comment on column AC_CONT_HOUSESALEINFO.contracttime
  is '���ʽ';
comment on column AC_CONT_HOUSESALEINFO.contbackuptime
  is '��ͬ���';
comment on column AC_CONT_HOUSESALEINFO.firstpay
  is '��ͬǩ��ʱ��';
comment on column AC_CONT_HOUSESALEINFO.firstpayratio
  is '��ͬ����ʱ��';
comment on column AC_CONT_HOUSESALEINFO.loanamount
  is '�׸����';
comment on column AC_CONT_HOUSESALEINFO.loanperiod
  is '�׸������';
comment on column AC_CONT_HOUSESALEINFO.fundloan
  is '������';
comment on column AC_CONT_HOUSESALEINFO.bussinessloan
  is '��������';
comment on column AC_CONT_HOUSESALEINFO.paymentaccount
  is '���������';
comment on column AC_CONT_HOUSESALEINFO.accountbank
  is '��ҵ����';
comment on column AC_CONT_HOUSESALEINFO.sellprice
  is '�����ʻ�';
comment on column AC_CONT_HOUSESALEINFO.selltotalamount
  is '��������';
comment on column AC_CONT_HOUSESALEINFO.areasupplement
  is '���۵���';
comment on column AC_CONT_HOUSESALEINFO.getintime
  is '�����ܼ�';
comment on column AC_CONT_HOUSESALEINFO.propertyfeestandand
  is '�������';
comment on column AC_CONT_HOUSESALEINFO.propertyunitname
  is '���ʱ��';
comment on column AC_CONT_HOUSESALEINFO.propertylegalperson
  is '��ҵ�ѱ�׼';
comment on column AC_CONT_HOUSESALEINFO.propertybussinessnum
  is '��ҵ��˾����';
comment on column AC_CONT_HOUSESALEINFO.propertycertificationlevel
  is '��ҵ��˾���˴���';
comment on column AC_CONT_HOUSESALEINFO.propertymanagementperiod
  is 'Ӫҵִ�պ�';
comment on column AC_CONT_HOUSESALEINFO.createpersonid
  is 'Ӫҵִ�պ�';
comment on column AC_CONT_HOUSESALEINFO.createperson
  is '���ʵȼ�';
comment on column AC_CONT_HOUSESALEINFO.createtime
  is '���ʵȼ�';
comment on column AC_CONT_HOUSESALEINFO.sbjstate
  is '��ҵ�����ͬ����';
comment on column AC_CONT_HOUSESALEINFO.description
  is '��������';
comment on column AC_CONT_HOUSESALEINFO.creator_id
  is '������id';
comment on column AC_CONT_HOUSESALEINFO.creator
  is '������';
comment on column AC_CONT_HOUSESALEINFO.create_date
  is '��������';
comment on column AC_CONT_HOUSESALEINFO.modifiedby
  is '�޸���';
comment on column AC_CONT_HOUSESALEINFO.modifiedby_id
  is '�޸���id';
comment on column AC_CONT_HOUSESALEINFO.modified_date
  is '�޸�����';
comment on column AC_CONT_HOUSESALEINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_CONT_HOUSESALEINFO.version
  is '�汾��';
comment on column AC_CONT_HOUSESALEINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_CONT_HOUSESALEINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_CONT_HOUSESALEINFO.bus_date
  is 'ҵ������';
comment on column AC_CONT_HOUSESALEINFO.exa_remarks
  is '������ע';
comment on column AC_CONT_HOUSESALEINFO.src_table
  is '��Դʵ��';
comment on column AC_CONT_HOUSESALEINFO.src_system
  is '��Դϵͳ';
comment on column AC_CONT_HOUSESALEINFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_CONT_INFO
prompt ===========================
prompt
create table AC_CONT_INFO
(
  stockcontid          VARCHAR2(255),
  stockcontname        VARCHAR2(255),
  conttype             VARCHAR2(255),
  stakeholder          VARCHAR2(255),
  stakelinkman         VARCHAR2(255),
  stakesubdate         DATE,
  stakesigner          VARCHAR2(255),
  associator           VARCHAR2(255),
  assoclinkman         VARCHAR2(255),
  associatedate        DATE,
  associatesigner      VARCHAR2(255),
  associator2          VARCHAR2(255),
  assoclinkman2        VARCHAR2(255),
  associatedate2       DATE,
  associatesigner2     VARCHAR2(255),
  contacttype          VARCHAR2(255),
  powertree            VARCHAR2(255),
  sendapprovetype      VARCHAR2(255),
  paytype              VARCHAR2(255),
  contractprice        NUMBER,
  moneytype            NUMBER,
  validdate            DATE,
  finishdate           DATE,
  prjcode              VARCHAR2(255),
  prjname              VARCHAR2(255),
  prjplace             VARCHAR2(255),
  planbegindate        DATE,
  planenddate          DATE,
  capitaldivisionratio NUMBER,
  description          VARCHAR2(255),
  creator_id           VARCHAR2(120),
  creator              VARCHAR2(120),
  create_date          DATE,
  modifiedby           VARCHAR2(120),
  modifiedby_id        VARCHAR2(120),
  modified_date        DATE,
  version_status       NUMBER,
  version              NUMBER,
  latestversion        NUMBER,
  approvalstae         NUMBER,
  bus_date             DATE,
  exa_remarks          VARCHAR2(500),
  src_table            VARCHAR2(255),
  src_system           VARCHAR2(255),
  sort_id              NUMBER(38)
)
;
comment on table AC_CONT_INFO
  is '��ͬ������Ϣ��';
comment on column AC_CONT_INFO.stockcontid
  is '��ͬ���';
comment on column AC_CONT_INFO.stockcontname
  is '��ͬ����';
comment on column AC_CONT_INFO.conttype
  is '��ͬ״̬';
comment on column AC_CONT_INFO.stakeholder
  is '��ͬ�׷�';
comment on column AC_CONT_INFO.stakelinkman
  is '��ͬ�׷���ϵ��';
comment on column AC_CONT_INFO.stakesubdate
  is '��ͬ�׷�ǩ������';
comment on column AC_CONT_INFO.stakesigner
  is '��ͬ�׷�ǩ����';
comment on column AC_CONT_INFO.associator
  is '��ͬ�ҷ�';
comment on column AC_CONT_INFO.assoclinkman
  is '��ͬ�ҷ���ϵ��';
comment on column AC_CONT_INFO.associatedate
  is '��ͬ�ҷ�ǩ������';
comment on column AC_CONT_INFO.associatesigner
  is '��ͬ�ҷ�ǩ����';
comment on column AC_CONT_INFO.associator2
  is '��ͬ����';
comment on column AC_CONT_INFO.assoclinkman2
  is '��ͬ������ϵ��';
comment on column AC_CONT_INFO.associatedate2
  is '��ͬ����ǩ������';
comment on column AC_CONT_INFO.associatesigner2
  is '��ͬ����ǩ����';
comment on column AC_CONT_INFO.contacttype
  is '��ͬ���';
comment on column AC_CONT_INFO.powertree
  is '����Ȩ����';
comment on column AC_CONT_INFO.sendapprovetype
  is '�������';
comment on column AC_CONT_INFO.paytype
  is '֧��������';
comment on column AC_CONT_INFO.contractprice
  is '��ͬ���';
comment on column AC_CONT_INFO.moneytype
  is '����';
comment on column AC_CONT_INFO.validdate
  is '��Ч����';
comment on column AC_CONT_INFO.finishdate
  is '�깤����';
comment on column AC_CONT_INFO.prjcode
  is '��Ŀ����';
comment on column AC_CONT_INFO.prjname
  is '��Ŀ����';
comment on column AC_CONT_INFO.prjplace
  is '��Ŀ�ص�';
comment on column AC_CONT_INFO.planbegindate
  is '�ƻ���ʼʱ��';
comment on column AC_CONT_INFO.planenddate
  is '�ƻ�����ʱ��';
comment on column AC_CONT_INFO.capitaldivisionratio
  is '�ʽ�������';
comment on column AC_CONT_INFO.description
  is '��������';
comment on column AC_CONT_INFO.creator_id
  is '������id';
comment on column AC_CONT_INFO.creator
  is '������';
comment on column AC_CONT_INFO.create_date
  is '��������';
comment on column AC_CONT_INFO.modifiedby
  is '�޸���';
comment on column AC_CONT_INFO.modifiedby_id
  is '�޸���id';
comment on column AC_CONT_INFO.modified_date
  is '�޸�����';
comment on column AC_CONT_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_CONT_INFO.version
  is '�汾��';
comment on column AC_CONT_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_CONT_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_CONT_INFO.bus_date
  is 'ҵ������';
comment on column AC_CONT_INFO.exa_remarks
  is '������ע';
comment on column AC_CONT_INFO.src_table
  is '��Դʵ��';
comment on column AC_CONT_INFO.src_system
  is '��Դϵͳ';
comment on column AC_CONT_INFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_CONT_LANDLEASE
prompt ================================
prompt
create table AC_CONT_LANDLEASE
(
  stockcontid      VARCHAR2(255),
  leasename        VARCHAR2(255),
  propertytype     VARCHAR2(255),
  ownership        VARCHAR2(255),
  begintime        DATE,
  endtime          DATE,
  usingunit        VARCHAR2(255),
  legalperson      VARCHAR2(255),
  licensenum       VARCHAR2(255),
  contactperson    VARCHAR2(255),
  contacttel       VARCHAR2(255),
  constructionarea NUMBER,
  leaseprice       NUMBER,
  remark           VARCHAR2(255),
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
  bus_date         DATE,
  exa_remarks      VARCHAR2(500),
  src_table        VARCHAR2(255),
  src_system       VARCHAR2(255),
  sort_id          NUMBER(38)
)
;
comment on table AC_CONT_LANDLEASE
  is '���޺�ͬ��';
comment on column AC_CONT_LANDLEASE.stockcontid
  is '��ͬ���';
comment on column AC_CONT_LANDLEASE.leasename
  is '���޺�ͬ����';
comment on column AC_CONT_LANDLEASE.propertytype
  is '��ҵ����';
comment on column AC_CONT_LANDLEASE.ownership
  is '����Ȩ����';
comment on column AC_CONT_LANDLEASE.begintime
  is '��ͬ��ʼ����';
comment on column AC_CONT_LANDLEASE.endtime
  is '��ͬ��ֹ����';
comment on column AC_CONT_LANDLEASE.usingunit
  is 'ʹ�õ�λ';
comment on column AC_CONT_LANDLEASE.legalperson
  is '����������';
comment on column AC_CONT_LANDLEASE.licensenum
  is 'Ӫҵִ�պ���';
comment on column AC_CONT_LANDLEASE.contactperson
  is 'ʹ�õ�λ��ϵ��';
comment on column AC_CONT_LANDLEASE.contacttel
  is '��ϵ�绰';
comment on column AC_CONT_LANDLEASE.constructionarea
  is '�������';
comment on column AC_CONT_LANDLEASE.leaseprice
  is '���ⵥ��';
comment on column AC_CONT_LANDLEASE.remark
  is '��ע';
comment on column AC_CONT_LANDLEASE.description
  is '��������';
comment on column AC_CONT_LANDLEASE.creator_id
  is '������id';
comment on column AC_CONT_LANDLEASE.creator
  is '������';
comment on column AC_CONT_LANDLEASE.create_date
  is '��������';
comment on column AC_CONT_LANDLEASE.modifiedby
  is '�޸���';
comment on column AC_CONT_LANDLEASE.modifiedby_id
  is '�޸���id';
comment on column AC_CONT_LANDLEASE.modified_date
  is '�޸�����';
comment on column AC_CONT_LANDLEASE.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_CONT_LANDLEASE.version
  is '�汾��';
comment on column AC_CONT_LANDLEASE.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_CONT_LANDLEASE.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_CONT_LANDLEASE.bus_date
  is 'ҵ������';
comment on column AC_CONT_LANDLEASE.exa_remarks
  is '������ע';
comment on column AC_CONT_LANDLEASE.src_table
  is '��Դʵ��';
comment on column AC_CONT_LANDLEASE.src_system
  is '��Դϵͳ';
comment on column AC_CONT_LANDLEASE.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_CONT_MAKELANDDETAIL
prompt =====================================
prompt
create table AC_CONT_MAKELANDDETAIL
(
  stockcontid        VARCHAR2(255),
  payitemcode        VARCHAR2(255),
  payitemname        VARCHAR2(255),
  contnum            NUMBER,
  contunit           NUMBER,
  contcost           NUMBER,
  contratio          NUMBER,
  processrelation    VARCHAR2(255),
  numctrl            VARCHAR2(255),
  standard           VARCHAR2(255),
  countingunit       VARCHAR2(255),
  valuation          VARCHAR2(255),
  approvenum         VARCHAR2(255),
  approvedate        DATE,
  prjcode            VARCHAR2(255),
  prjname            VARCHAR2(255),
  contractcode       VARCHAR2(255),
  contractamount     NUMBER,
  projecttimelimit   NUMBER,
  estimatequantities NUMBER,
  workingunit        VARCHAR2(255),
  isdigpay           VARCHAR2(255),
  digareanum         VARCHAR2(255),
  diglandnum         VARCHAR2(255),
  estimatarea        NUMBER,
  estimatquantity    NUMBER,
  estimatcost        NUMBER,
  completedquantity  NUMBER,
  nowpayoff          NUMBER,
  totalpayoff        NUMBER,
  totalquantity      NUMBER,
  mcoareanum         VARCHAR2(255),
  mcolandnum         VARCHAR2(255),
  mcolandname        VARCHAR2(255),
  buystonecount      NUMBER,
  costamount         NUMBER,
  description        VARCHAR2(255),
  creator_id         VARCHAR2(120),
  creator            VARCHAR2(120),
  create_date        DATE,
  modifiedby         VARCHAR2(120),
  modifiedby_id      VARCHAR2(120),
  modified_date      DATE,
  version_status     NUMBER,
  version            NUMBER,
  latestversion      NUMBER,
  approvalstae       NUMBER,
  bus_date           DATE,
  exa_remarks        VARCHAR2(500),
  src_table          VARCHAR2(255),
  src_system         VARCHAR2(255),
  sort_id            NUMBER(38)
)
;
comment on table AC_CONT_MAKELANDDETAIL
  is '��غ�ͬ��';
comment on column AC_CONT_MAKELANDDETAIL.stockcontid
  is '��ͬ���';
comment on column AC_CONT_MAKELANDDETAIL.payitemcode
  is '֧�������';
comment on column AC_CONT_MAKELANDDETAIL.payitemname
  is '֧��������';
comment on column AC_CONT_MAKELANDDETAIL.contnum
  is '��ͬ����';
comment on column AC_CONT_MAKELANDDETAIL.contunit
  is '��ͬ����';
comment on column AC_CONT_MAKELANDDETAIL.contcost
  is '�������';
comment on column AC_CONT_MAKELANDDETAIL.contratio
  is '֧��ϵ��';
comment on column AC_CONT_MAKELANDDETAIL.processrelation
  is '���ȹ���';
comment on column AC_CONT_MAKELANDDETAIL.numctrl
  is '��������';
comment on column AC_CONT_MAKELANDDETAIL.standard
  is '���';
comment on column AC_CONT_MAKELANDDETAIL.countingunit
  is '������λ';
comment on column AC_CONT_MAKELANDDETAIL.valuation
  is '��Լ����';
comment on column AC_CONT_MAKELANDDETAIL.approvenum
  is '��׼�ĺ�';
comment on column AC_CONT_MAKELANDDETAIL.approvedate
  is '��׼ʱ��';
comment on column AC_CONT_MAKELANDDETAIL.prjcode
  is '��Ŀ���';
comment on column AC_CONT_MAKELANDDETAIL.prjname
  is '��Ŀ����';
comment on column AC_CONT_MAKELANDDETAIL.contractcode
  is '��ͬ���';
comment on column AC_CONT_MAKELANDDETAIL.contractamount
  is '��ͬ���';
comment on column AC_CONT_MAKELANDDETAIL.projecttimelimit
  is '���̹���';
comment on column AC_CONT_MAKELANDDETAIL.estimatequantities
  is 'Ԥ�ƹ�����';
comment on column AC_CONT_MAKELANDDETAIL.workingunit
  is 'ʩ����λ';
comment on column AC_CONT_MAKELANDDETAIL.isdigpay
  is '�Ƿ��ڷ�������';
comment on column AC_CONT_MAKELANDDETAIL.digareanum
  is '�ڷ���������';
comment on column AC_CONT_MAKELANDDETAIL.diglandnum
  is '�ؿ���';
comment on column AC_CONT_MAKELANDDETAIL.estimatarea
  is 'Ԥ���ڷ����';
comment on column AC_CONT_MAKELANDDETAIL.estimatquantity
  is 'Ԥ�ƹ�����';
comment on column AC_CONT_MAKELANDDETAIL.estimatcost
  is 'Ԥ�Ƴɱ�';
comment on column AC_CONT_MAKELANDDETAIL.completedquantity
  is '������ɹ�����';
comment on column AC_CONT_MAKELANDDETAIL.nowpayoff
  is '����֧�ֽ��';
comment on column AC_CONT_MAKELANDDETAIL.totalpayoff
  is '�ۼ�֧�����';
comment on column AC_CONT_MAKELANDDETAIL.totalquantity
  is '�ۼ���ɹ�����';
comment on column AC_CONT_MAKELANDDETAIL.mcoareanum
  is '���������';
comment on column AC_CONT_MAKELANDDETAIL.mcolandnum
  is '����ؿ���';
comment on column AC_CONT_MAKELANDDETAIL.mcolandname
  is '����ؿ�����';
comment on column AC_CONT_MAKELANDDETAIL.buystonecount
  is '������ʯ����';
comment on column AC_CONT_MAKELANDDETAIL.costamount
  is '�ɱ����';
comment on column AC_CONT_MAKELANDDETAIL.description
  is '��������';
comment on column AC_CONT_MAKELANDDETAIL.creator_id
  is '������id';
comment on column AC_CONT_MAKELANDDETAIL.creator
  is '������';
comment on column AC_CONT_MAKELANDDETAIL.create_date
  is '��������';
comment on column AC_CONT_MAKELANDDETAIL.modifiedby
  is '�޸���';
comment on column AC_CONT_MAKELANDDETAIL.modifiedby_id
  is '�޸���id';
comment on column AC_CONT_MAKELANDDETAIL.modified_date
  is '�޸�����';
comment on column AC_CONT_MAKELANDDETAIL.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_CONT_MAKELANDDETAIL.version
  is '�汾��';
comment on column AC_CONT_MAKELANDDETAIL.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_CONT_MAKELANDDETAIL.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_CONT_MAKELANDDETAIL.bus_date
  is 'ҵ������';
comment on column AC_CONT_MAKELANDDETAIL.exa_remarks
  is '������ע';
comment on column AC_CONT_MAKELANDDETAIL.src_table
  is '��Դʵ��';
comment on column AC_CONT_MAKELANDDETAIL.src_system
  is '��Դϵͳ';
comment on column AC_CONT_MAKELANDDETAIL.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_CONT_PRJTERMS
prompt ===============================
prompt
create table AC_CONT_PRJTERMS
(
  stockcontid      VARCHAR2(255),
  area             NUMBER,
  qualitystandard  VARCHAR2(255),
  begindate        DATE,
  price            NUMBER,
  amount           NUMBER,
  finishdate       DATE,
  termsmode        VARCHAR2(255),
  termsperiod      DATE,
  comflictplace    VARCHAR2(255),
  comflictmode     VARCHAR2(255),
  unitname         VARCHAR2(255),
  appointedperson  VARCHAR2(255),
  clientperson     VARCHAR2(255),
  phone            VARCHAR2(255),
  signingdept      VARCHAR2(255),
  agent            VARCHAR2(255),
  authorizationnum VARCHAR2(255),
  approvalleader   VARCHAR2(255),
  areadyfinish     VARCHAR2(255),
  stopworkdays     NUMBER,
  settledamount    NUMBER,
  trialbalance     NUMBER,
  clearingtime     DATE,
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
  bus_date         DATE,
  exa_remarks      VARCHAR2(500),
  src_table        VARCHAR2(255),
  src_system       VARCHAR2(255),
  sort_id          NUMBER(38)
)
;
comment on table AC_CONT_PRJTERMS
  is '�������ͬ��Ϣ��';
comment on column AC_CONT_PRJTERMS.stockcontid
  is '��ͬ���';
comment on column AC_CONT_PRJTERMS.area
  is '���';
comment on column AC_CONT_PRJTERMS.qualitystandard
  is '������׼';
comment on column AC_CONT_PRJTERMS.begindate
  is '��������';
comment on column AC_CONT_PRJTERMS.price
  is '����';
comment on column AC_CONT_PRJTERMS.amount
  is '��ͬ���';
comment on column AC_CONT_PRJTERMS.finishdate
  is '��������';
comment on column AC_CONT_PRJTERMS.termsmode
  is '���㷽ʽ';
comment on column AC_CONT_PRJTERMS.termsperiod
  is '��������';
comment on column AC_CONT_PRJTERMS.comflictplace
  is '�������ص�';
comment on column AC_CONT_PRJTERMS.comflictmode
  is '��������ʽ';
comment on column AC_CONT_PRJTERMS.unitname
  is '��λ����';
comment on column AC_CONT_PRJTERMS.appointedperson
  is 'Լ��������';
comment on column AC_CONT_PRJTERMS.clientperson
  is 'ί�д�����';
comment on column AC_CONT_PRJTERMS.phone
  is '��ϵ�绰';
comment on column AC_CONT_PRJTERMS.signingdept
  is 'ǩԼ����';
comment on column AC_CONT_PRJTERMS.agent
  is 'ί�д�����';
comment on column AC_CONT_PRJTERMS.authorizationnum
  is '��Ȩί�����';
comment on column AC_CONT_PRJTERMS.approvalleader
  is '�����쵼';
comment on column AC_CONT_PRJTERMS.areadyfinish
  is '����������';
comment on column AC_CONT_PRJTERMS.stopworkdays
  is 'ͣ������';
comment on column AC_CONT_PRJTERMS.settledamount
  is '�ѽ�����';
comment on column AC_CONT_PRJTERMS.trialbalance
  is '�������';
comment on column AC_CONT_PRJTERMS.clearingtime
  is '����ʱ��';
comment on column AC_CONT_PRJTERMS.description
  is '��������';
comment on column AC_CONT_PRJTERMS.creator_id
  is '������id';
comment on column AC_CONT_PRJTERMS.creator
  is '������';
comment on column AC_CONT_PRJTERMS.create_date
  is '��������';
comment on column AC_CONT_PRJTERMS.modifiedby
  is '�޸���';
comment on column AC_CONT_PRJTERMS.modifiedby_id
  is '�޸���id';
comment on column AC_CONT_PRJTERMS.modified_date
  is '�޸�����';
comment on column AC_CONT_PRJTERMS.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_CONT_PRJTERMS.version
  is '�汾��';
comment on column AC_CONT_PRJTERMS.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_CONT_PRJTERMS.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_CONT_PRJTERMS.bus_date
  is 'ҵ������';
comment on column AC_CONT_PRJTERMS.exa_remarks
  is '������ע';
comment on column AC_CONT_PRJTERMS.src_table
  is '��Դʵ��';
comment on column AC_CONT_PRJTERMS.src_system
  is '��Դϵͳ';
comment on column AC_CONT_PRJTERMS.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_CONT_PURCHASE
prompt ===============================
prompt
create table AC_CONT_PURCHASE
(
  stockcontid     VARCHAR2(255),
  contcode        VARCHAR2(255),
  signingtime     DATE,
  unitname        VARCHAR2(255),
  contstandard    VARCHAR2(255),
  qualitystandard VARCHAR2(255),
  num             NUMBER,
  price           NUMBER,
  totalamout      NUMBER,
  submittime      NUMBER,
  submitnum       NUMBER,
  paymenttime     NUMBER,
  submitedtime    DATE,
  submitednum     NUMBER,
  qualityproblem  VARCHAR2(255),
  paidamout       NUMBER,
  paycode         VARCHAR2(255),
  changerelease   VARCHAR2(255),
  dispute         VARCHAR2(255),
  description     VARCHAR2(255),
  creator_id      VARCHAR2(120),
  creator         VARCHAR2(120),
  create_date     DATE,
  modifiedby      VARCHAR2(120),
  modifiedby_id   VARCHAR2(120),
  modified_date   DATE,
  version_status  NUMBER,
  version         NUMBER,
  latestversion   NUMBER,
  approvalstae    NUMBER,
  bus_date        DATE,
  exa_remarks     VARCHAR2(500),
  src_table       VARCHAR2(255),
  src_system      VARCHAR2(255),
  sort_id         NUMBER(38)
)
;
comment on table AC_CONT_PURCHASE
  is '�ɹ���ͬ��';
comment on column AC_CONT_PURCHASE.stockcontid
  is '��ͬ���';
comment on column AC_CONT_PURCHASE.contcode
  is '��ͬ���';
comment on column AC_CONT_PURCHASE.signingtime
  is 'ǩԼʱ��';
comment on column AC_CONT_PURCHASE.unitname
  is '��λ����';
comment on column AC_CONT_PURCHASE.contstandard
  is '��ͬ��׼';
comment on column AC_CONT_PURCHASE.qualitystandard
  is '������׼';
comment on column AC_CONT_PURCHASE.num
  is '����';
comment on column AC_CONT_PURCHASE.price
  is '����';
comment on column AC_CONT_PURCHASE.totalamout
  is '��ͬ�ܽ��';
comment on column AC_CONT_PURCHASE.submittime
  is '�ᣨ������ʱ��';
comment on column AC_CONT_PURCHASE.submitnum
  is '�ᣨ����������';
comment on column AC_CONT_PURCHASE.paymenttime
  is '����ʱ��';
comment on column AC_CONT_PURCHASE.submitedtime
  is '���ᣨ������ʱ��';
comment on column AC_CONT_PURCHASE.submitednum
  is '���ᣨ����������';
comment on column AC_CONT_PURCHASE.qualityproblem
  is '��������';
comment on column AC_CONT_PURCHASE.paidamout
  is '�Ѹ�����';
comment on column AC_CONT_PURCHASE.paycode
  is '����ƾ��';
comment on column AC_CONT_PURCHASE.changerelease
  is '���������';
comment on column AC_CONT_PURCHASE.dispute
  is '�����������';
comment on column AC_CONT_PURCHASE.description
  is '��������';
comment on column AC_CONT_PURCHASE.creator_id
  is '������id';
comment on column AC_CONT_PURCHASE.creator
  is '������';
comment on column AC_CONT_PURCHASE.create_date
  is '��������';
comment on column AC_CONT_PURCHASE.modifiedby
  is '�޸���';
comment on column AC_CONT_PURCHASE.modifiedby_id
  is '�޸���id';
comment on column AC_CONT_PURCHASE.modified_date
  is '�޸�����';
comment on column AC_CONT_PURCHASE.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_CONT_PURCHASE.version
  is '�汾��';
comment on column AC_CONT_PURCHASE.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_CONT_PURCHASE.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_CONT_PURCHASE.bus_date
  is 'ҵ������';
comment on column AC_CONT_PURCHASE.exa_remarks
  is '������ע';
comment on column AC_CONT_PURCHASE.src_table
  is '��Դʵ��';
comment on column AC_CONT_PURCHASE.src_system
  is '��Դϵͳ';
comment on column AC_CONT_PURCHASE.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_CONT_SELLATTACHMENT
prompt =====================================
prompt
create table AC_CONT_SELLATTACHMENT
(
  stockcontid    VARCHAR2(255),
  sell_name      VARCHAR2(255),
  sell_type      VARCHAR2(255),
  pagenum        NUMBER,
  author         VARCHAR2(255),
  attachversion  VARCHAR2(255),
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
comment on table AC_CONT_SELLATTACHMENT
  is '���ۺ�ͬ������';
comment on column AC_CONT_SELLATTACHMENT.stockcontid
  is '��ͬ���';
comment on column AC_CONT_SELLATTACHMENT.pagenum
  is '��ͬ����ҳ��';
comment on column AC_CONT_SELLATTACHMENT.author
  is '��ͬ��������';
comment on column AC_CONT_SELLATTACHMENT.attachversion
  is '��ͬ�����汾';
comment on column AC_CONT_SELLATTACHMENT.description
  is '��������';
comment on column AC_CONT_SELLATTACHMENT.creator_id
  is '������id';
comment on column AC_CONT_SELLATTACHMENT.creator
  is '������';
comment on column AC_CONT_SELLATTACHMENT.create_date
  is '��������';
comment on column AC_CONT_SELLATTACHMENT.modifiedby
  is '�޸���';
comment on column AC_CONT_SELLATTACHMENT.modifiedby_id
  is '�޸���id';
comment on column AC_CONT_SELLATTACHMENT.modified_date
  is '�޸�����';
comment on column AC_CONT_SELLATTACHMENT.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_CONT_SELLATTACHMENT.version
  is '�汾��';
comment on column AC_CONT_SELLATTACHMENT.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_CONT_SELLATTACHMENT.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_CONT_SELLATTACHMENT.bus_date
  is 'ҵ������';
comment on column AC_CONT_SELLATTACHMENT.exa_remarks
  is '������ע';
comment on column AC_CONT_SELLATTACHMENT.src_table
  is '��Դʵ��';
comment on column AC_CONT_SELLATTACHMENT.src_system
  is '��Դϵͳ';
comment on column AC_CONT_SELLATTACHMENT.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_CONT_SELLINCOME
prompt =================================
prompt
create table AC_CONT_SELLINCOME
(
  stockcontid         VARCHAR2(255),
  billcode            VARCHAR2(255),
  billdate            DATE,
  approvecode         VARCHAR2(255),
  contcode            VARCHAR2(255),
  contname            VARCHAR2(255),
  prelandsellcontid   VARCHAR2(255),
  prelandsellcontname VARCHAR2(255),
  moneytype           VARCHAR2(255),
  transfertotalcost   NUMBER,
  nowbillamount       NUMBER,
  payee               VARCHAR2(255),
  transfereeunit      VARCHAR2(255),
  landcode            VARCHAR2(255),
  landarea_mu         NUMBER,
  landusing           VARCHAR2(255),
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
comment on table AC_CONT_SELLINCOME
  is '���ۺ�ͬ�����';
comment on column AC_CONT_SELLINCOME.stockcontid
  is '��ͬ���';
comment on column AC_CONT_SELLINCOME.billcode
  is '�տ���';
comment on column AC_CONT_SELLINCOME.billdate
  is '�տ�����';
comment on column AC_CONT_SELLINCOME.approvecode
  is '��׼�ĺ�';
comment on column AC_CONT_SELLINCOME.contcode
  is '��ͬ���';
comment on column AC_CONT_SELLINCOME.contname
  is '��ͬ����';
comment on column AC_CONT_SELLINCOME.prelandsellcontid
  is 'ԭ���س��ú�ͬ��';
comment on column AC_CONT_SELLINCOME.prelandsellcontname
  is 'ԭ���س��ú�ͬ����';
comment on column AC_CONT_SELLINCOME.moneytype
  is '����';
comment on column AC_CONT_SELLINCOME.transfertotalcost
  is 'ת���ܼ�';
comment on column AC_CONT_SELLINCOME.nowbillamount
  is '�����տ���';
comment on column AC_CONT_SELLINCOME.landcode
  is '�ؿ���';
comment on column AC_CONT_SELLINCOME.landarea_mu
  is '�ؿ����';
comment on column AC_CONT_SELLINCOME.landusing
  is '�ؿ���;';
comment on column AC_CONT_SELLINCOME.description
  is '��������';
comment on column AC_CONT_SELLINCOME.creator_id
  is '������id';
comment on column AC_CONT_SELLINCOME.creator
  is '������';
comment on column AC_CONT_SELLINCOME.create_date
  is '��������';
comment on column AC_CONT_SELLINCOME.modifiedby
  is '�޸���';
comment on column AC_CONT_SELLINCOME.modifiedby_id
  is '�޸���id';
comment on column AC_CONT_SELLINCOME.modified_date
  is '�޸�����';
comment on column AC_CONT_SELLINCOME.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_CONT_SELLINCOME.version
  is '�汾��';
comment on column AC_CONT_SELLINCOME.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_CONT_SELLINCOME.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_CONT_SELLINCOME.bus_date
  is 'ҵ������';
comment on column AC_CONT_SELLINCOME.exa_remarks
  is '������ע';
comment on column AC_CONT_SELLINCOME.src_table
  is '��Դʵ��';
comment on column AC_CONT_SELLINCOME.src_system
  is '��Դϵͳ';
comment on column AC_CONT_SELLINCOME.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_CONT_SELLTOACCOUNTPLAN
prompt ========================================
prompt
create table AC_CONT_SELLTOACCOUNTPLAN
(
  stockcontid    VARCHAR2(255),
  totalcapital   NUMBER,
  howmuchperiod  NUMBER,
  paydesc        VARCHAR2(255),
  planpaydate    DATE,
  planpayamount  NUMBER,
  remark         VARCHAR2(255),
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
comment on table AC_CONT_SELLTOACCOUNTPLAN
  is '���ۺ�ͬ���˼ƻ���';
comment on column AC_CONT_SELLTOACCOUNTPLAN.stockcontid
  is '��ͬ���';
comment on column AC_CONT_SELLTOACCOUNTPLAN.totalcapital
  is '�ʽ��˽���ܼ�';
comment on column AC_CONT_SELLTOACCOUNTPLAN.howmuchperiod
  is '����_��֧��';
comment on column AC_CONT_SELLTOACCOUNTPLAN.paydesc
  is '֧��˵��';
comment on column AC_CONT_SELLTOACCOUNTPLAN.planpaydate
  is '�ƻ�֧������';
comment on column AC_CONT_SELLTOACCOUNTPLAN.planpayamount
  is '�ƻ�֧�����';
comment on column AC_CONT_SELLTOACCOUNTPLAN.remark
  is '��ע����';
comment on column AC_CONT_SELLTOACCOUNTPLAN.description
  is '��������';
comment on column AC_CONT_SELLTOACCOUNTPLAN.creator_id
  is '������id';
comment on column AC_CONT_SELLTOACCOUNTPLAN.creator
  is '������';
comment on column AC_CONT_SELLTOACCOUNTPLAN.create_date
  is '��������';
comment on column AC_CONT_SELLTOACCOUNTPLAN.modifiedby
  is '�޸���';
comment on column AC_CONT_SELLTOACCOUNTPLAN.modifiedby_id
  is '�޸���id';
comment on column AC_CONT_SELLTOACCOUNTPLAN.modified_date
  is '�޸�����';
comment on column AC_CONT_SELLTOACCOUNTPLAN.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_CONT_SELLTOACCOUNTPLAN.version
  is '�汾��';
comment on column AC_CONT_SELLTOACCOUNTPLAN.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_CONT_SELLTOACCOUNTPLAN.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_CONT_SELLTOACCOUNTPLAN.bus_date
  is 'ҵ������';
comment on column AC_CONT_SELLTOACCOUNTPLAN.exa_remarks
  is '������ע';
comment on column AC_CONT_SELLTOACCOUNTPLAN.src_table
  is '��Դʵ��';
comment on column AC_CONT_SELLTOACCOUNTPLAN.src_system
  is '��Դϵͳ';
comment on column AC_CONT_SELLTOACCOUNTPLAN.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_CONT_SUPERVISORINFO
prompt =====================================
prompt
create table AC_CONT_SUPERVISORINFO
(
  stockcontid        VARCHAR2(255),
  billcode           VARCHAR2(255),
  billdate           DATE,
  makelandprj        VARCHAR2(255),
  supervisorunit     VARCHAR2(255),
  applicationon      VARCHAR2(255),
  approver           VARCHAR2(255),
  whichtimes         NUMBER,
  payoffdesc         VARCHAR2(255),
  nowpayoff          NUMBER,
  totalpayoff        NUMBER,
  prjcontcode        VARCHAR2(255),
  prjcontname        VARCHAR2(255),
  prjcontamount      NUMBER,
  prjconttotalamount NUMBER,
  payoffratio        NUMBER,
  supervisor         NUMBER,
  description        VARCHAR2(255),
  creator_id         VARCHAR2(120),
  creator            VARCHAR2(120),
  create_date        DATE,
  modifiedby         VARCHAR2(120),
  modifiedby_id      VARCHAR2(120),
  modified_date      DATE,
  version_status     NUMBER,
  version            NUMBER,
  latestversion      NUMBER,
  approvalstae       NUMBER,
  bus_date           DATE,
  exa_remarks        VARCHAR2(500),
  src_table          VARCHAR2(255),
  src_system         VARCHAR2(255),
  sort_id            NUMBER(38)
)
;
comment on table AC_CONT_SUPERVISORINFO
  is '�����֧ͬ����Ϣ��';
comment on column AC_CONT_SUPERVISORINFO.stockcontid
  is '��ͬ���';
comment on column AC_CONT_SUPERVISORINFO.billcode
  is '���ݱ��';
comment on column AC_CONT_SUPERVISORINFO.billdate
  is '����ʱ��';
comment on column AC_CONT_SUPERVISORINFO.makelandprj
  is '�����Ŀ';
comment on column AC_CONT_SUPERVISORINFO.supervisorunit
  is '����λ';
comment on column AC_CONT_SUPERVISORINFO.applicationon
  is '���븶����';
comment on column AC_CONT_SUPERVISORINFO.approver
  is '������';
comment on column AC_CONT_SUPERVISORINFO.whichtimes
  is '�ڼ��θ���';
comment on column AC_CONT_SUPERVISORINFO.payoffdesc
  is '����˵��';
comment on column AC_CONT_SUPERVISORINFO.nowpayoff
  is '���θ�����';
comment on column AC_CONT_SUPERVISORINFO.totalpayoff
  is '�ۼƸ�����';
comment on column AC_CONT_SUPERVISORINFO.prjcontcode
  is '���̺�ͬ��';
comment on column AC_CONT_SUPERVISORINFO.prjcontname
  is '���̺�ͬ����';
comment on column AC_CONT_SUPERVISORINFO.prjcontamount
  is '���̺�ͬ���';
comment on column AC_CONT_SUPERVISORINFO.prjconttotalamount
  is '���̺�ͬ������';
comment on column AC_CONT_SUPERVISORINFO.payoffratio
  is '�������';
comment on column AC_CONT_SUPERVISORINFO.supervisor
  is '�����ͬ���';
comment on column AC_CONT_SUPERVISORINFO.description
  is '��������';
comment on column AC_CONT_SUPERVISORINFO.creator_id
  is '������id';
comment on column AC_CONT_SUPERVISORINFO.creator
  is '������';
comment on column AC_CONT_SUPERVISORINFO.create_date
  is '��������';
comment on column AC_CONT_SUPERVISORINFO.modifiedby
  is '�޸���';
comment on column AC_CONT_SUPERVISORINFO.modifiedby_id
  is '�޸���id';
comment on column AC_CONT_SUPERVISORINFO.modified_date
  is '�޸�����';
comment on column AC_CONT_SUPERVISORINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_CONT_SUPERVISORINFO.version
  is '�汾��';
comment on column AC_CONT_SUPERVISORINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_CONT_SUPERVISORINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_CONT_SUPERVISORINFO.bus_date
  is 'ҵ������';
comment on column AC_CONT_SUPERVISORINFO.exa_remarks
  is '������ע';
comment on column AC_CONT_SUPERVISORINFO.src_table
  is '��Դʵ��';
comment on column AC_CONT_SUPERVISORINFO.src_system
  is '��Դϵͳ';
comment on column AC_CONT_SUPERVISORINFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_CUST_INFO
prompt ===========================
prompt
create table AC_CUST_INFO
(
  code                 INTEGER,
  name                 INTEGER,
  certificatenum       VARCHAR2(255),
  companynatureid      INTEGER,
  registeredcapital    INTEGER,
  city                 VARCHAR2(255),
  bank                 VARCHAR2(255),
  account              VARCHAR2(255),
  representative       VARCHAR2(255),
  contactperson        VARCHAR2(255),
  businesslicense      VARCHAR2(255),
  bussinessscope       VARCHAR2(255),
  orgcode              VARCHAR2(255),
  areataxnum           VARCHAR2(255),
  nationtaxnum         VARCHAR2(255),
  address              VARCHAR2(255),
  postalcode           VARCHAR2(255),
  phone                VARCHAR2(255),
  fax                  VARCHAR2(255),
  email                VARCHAR2(255),
  homepage             VARCHAR2(255),
  cust_description     VARCHAR2(255),
  transationtypeid     INTEGER,
  statusid             INTEGER,
  buyprice             INTEGER,
  rentalprice          INTEGER,
  transationcode       VARCHAR2(255),
  contcode             VARCHAR2(255),
  contname             VARCHAR2(255),
  investprjname        VARCHAR2(255),
  agent                VARCHAR2(255),
  clientcertificatenum VARCHAR2(255),
  clientphone          VARCHAR2(255),
  clientaddress        VARCHAR2(255),
  emp_code             INTEGER,
  emp_name             VARCHAR2(255),
  emp_sex              INTEGER,
  emp_job              VARCHAR2(255),
  emp_phone            VARCHAR2(255),
  emp_fax              VARCHAR2(255),
  emp_email            VARCHAR2(255),
  emp_address          VARCHAR2(255),
  emp_postalcode       VARCHAR2(255),
  emp_mobile           VARCHAR2(255),
  emp_homecall         VARCHAR2(255),
  emp_othermethod      VARCHAR2(255),
  description          VARCHAR2(120),
  creator_id           VARCHAR2(120),
  creator              VARCHAR2(120),
  create_date          DATE,
  modifiedby           VARCHAR2(120),
  modifiedby_id        VARCHAR2(120),
  modified_date        DATE,
  version_status       INTEGER,
  version              INTEGER,
  latestversion        INTEGER,
  approvalstae         INTEGER,
  bus_date             DATE,
  exa_remarks          VARCHAR2(500),
  src_table            VARCHAR2(255),
  src_system           VARCHAR2(255),
  sort_id              NUMBER(38)
)
;
comment on table AC_CUST_INFO
  is '�ͻ���Ϣ��';
comment on column AC_CUST_INFO.code
  is '�ͻ�����';
comment on column AC_CUST_INFO.name
  is '�ͻ�����';
comment on column AC_CUST_INFO.certificatenum
  is '����֤������';
comment on column AC_CUST_INFO.companynatureid
  is '��ҵ����';
comment on column AC_CUST_INFO.registeredcapital
  is 'ע���ʱ�';
comment on column AC_CUST_INFO.city
  is '���ڳ���';
comment on column AC_CUST_INFO.bank
  is '��������';
comment on column AC_CUST_INFO.account
  is '�����˺�';
comment on column AC_CUST_INFO.representative
  is '���˴���';
comment on column AC_CUST_INFO.contactperson
  is '��ϵ��';
comment on column AC_CUST_INFO.businesslicense
  is 'Ӫҵִ�պ�';
comment on column AC_CUST_INFO.bussinessscope
  is '��Ӫ��Χ';
comment on column AC_CUST_INFO.orgcode
  is '��֯��������֤';
comment on column AC_CUST_INFO.areataxnum
  is '��˰�ǼǺ�';
comment on column AC_CUST_INFO.nationtaxnum
  is '��˰�ǼǺ�';
comment on column AC_CUST_INFO.address
  is 'ͨѶ��ַ';
comment on column AC_CUST_INFO.postalcode
  is '��������';
comment on column AC_CUST_INFO.phone
  is '�绰����';
comment on column AC_CUST_INFO.fax
  is '�������';
comment on column AC_CUST_INFO.email
  is '�����ʼ�';
comment on column AC_CUST_INFO.homepage
  is '��˾��ҳ';
comment on column AC_CUST_INFO.cust_description
  is '��˾���';
comment on column AC_CUST_INFO.transationtypeid
  is '��������';
comment on column AC_CUST_INFO.statusid
  is '�ͻ�״̬';
comment on column AC_CUST_INFO.buyprice
  is '����۸�';
comment on column AC_CUST_INFO.rentalprice
  is '���޼۸�';
comment on column AC_CUST_INFO.transationcode
  is '���ױ��';
comment on column AC_CUST_INFO.contcode
  is '��ͬ���';
comment on column AC_CUST_INFO.contname
  is '��ͬ����';
comment on column AC_CUST_INFO.investprjname
  is 'Ͷ����Ŀ����';
comment on column AC_CUST_INFO.agent
  is 'ί�д�����';
comment on column AC_CUST_INFO.clientcertificatenum
  is 'ί����֤������';
comment on column AC_CUST_INFO.clientphone
  is 'ί���˵绰';
comment on column AC_CUST_INFO.clientaddress
  is 'ί���˵�ַ';
comment on column AC_CUST_INFO.emp_code
  is '��Ա���';
comment on column AC_CUST_INFO.emp_name
  is '����';
comment on column AC_CUST_INFO.emp_sex
  is '�Ա�';
comment on column AC_CUST_INFO.emp_job
  is 'ְλ';
comment on column AC_CUST_INFO.emp_phone
  is '�칫�绰';
comment on column AC_CUST_INFO.emp_fax
  is '����';
comment on column AC_CUST_INFO.emp_email
  is '�����ʼ�';
comment on column AC_CUST_INFO.emp_address
  is '��ַ';
comment on column AC_CUST_INFO.emp_postalcode
  is '��������';
comment on column AC_CUST_INFO.emp_mobile
  is '�ƶ��绰';
comment on column AC_CUST_INFO.emp_homecall
  is '��ͥ�绰';
comment on column AC_CUST_INFO.emp_othermethod
  is '������ϵ��ʽ';
comment on column AC_CUST_INFO.description
  is '��������';
comment on column AC_CUST_INFO.creator_id
  is '������id';
comment on column AC_CUST_INFO.creator
  is '������';
comment on column AC_CUST_INFO.create_date
  is '��������';
comment on column AC_CUST_INFO.modifiedby
  is '�޸���';
comment on column AC_CUST_INFO.modifiedby_id
  is '�޸���id';
comment on column AC_CUST_INFO.modified_date
  is '�޸�����';
comment on column AC_CUST_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_CUST_INFO.version
  is '�汾��';
comment on column AC_CUST_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_CUST_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_CUST_INFO.bus_date
  is 'ҵ������';
comment on column AC_CUST_INFO.exa_remarks
  is '������ע';
comment on column AC_CUST_INFO.src_table
  is '��Դʵ��';
comment on column AC_CUST_INFO.src_system
  is '��Դϵͳ';
comment on column AC_CUST_INFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_EMP_INFO
prompt ==========================
prompt
create table AC_EMP_INFO
(
  code                    VARCHAR2(255),
  cardcode                VARCHAR2(255),
  name                    VARCHAR2(255),
  pinyin                  VARCHAR2(255),
  sex                     VARCHAR2(255),
  birthday                DATE,
  bloodtype               VARCHAR2(255),
  idcard                  VARCHAR2(255),
  marry                   VARCHAR2(255),
  nation                  VARCHAR2(255),
  birthplace              VARCHAR2(255),
  originplace             VARCHAR2(255),
  photo                   VARCHAR2(255),
  personindentity         VARCHAR2(255),
  politicaloutlook        VARCHAR2(255),
  joininparty             DATE,
  partyoffice             VARCHAR2(255),
  workingtime             DATE,
  joininipbtime           DATE,
  mana_unit               VARCHAR2(255),
  department              VARCHAR2(255),
  joinincorptime          DATE,
  statusdate              DATE,
  emptype                 VARCHAR2(255),
  joinintype              VARCHAR2(255),
  mana_job                VARCHAR2(255),
  mana_joblevel           VARCHAR2(255),
  nowjobbegindate         DATE,
  contracttype            VARCHAR2(255),
  contractbegindate       DATE,
  contractenddate         DATE,
  education               VARCHAR2(255),
  academicdegree          VARCHAR2(255),
  graguateduniversity     VARCHAR2(255),
  profession              VARCHAR2(255),
  edu_begindate           DATE,
  edu_enddate             DATE,
  foreignlanguage         VARCHAR2(255),
  languagelevel           VARCHAR2(255),
  technicaltitle          VARCHAR2(255),
  titlelevel              VARCHAR2(255),
  occupationqualification VARCHAR2(255),
  certification           VARCHAR2(255),
  city                    VARCHAR2(255),
  officeaddress           VARCHAR2(255),
  officephone             VARCHAR2(255),
  mobile                  VARCHAR2(255),
  email                   VARCHAR2(255),
  officepostalcode        VARCHAR2(255),
  homeaddress             VARCHAR2(255),
  homephone               VARCHAR2(255),
  homepostalcode          VARCHAR2(255),
  emergencyperson         VARCHAR2(255),
  emergencyphone          VARCHAR2(255),
  worked_begindate        DATE,
  worked_enddate          DATE,
  worked_unit             VARCHAR2(255),
  worked_department       VARCHAR2(255),
  worked_job              VARCHAR2(255),
  working                 VARCHAR2(255),
  tra_begindate           DATE,
  tra_enddate             DATE,
  tra_content             VARCHAR2(255),
  tra_unit                VARCHAR2(255),
  tra_type                VARCHAR2(255),
  tra_mode                VARCHAR2(255),
  membername              VARCHAR2(255),
  relation                VARCHAR2(255),
  fra_birthday            VARCHAR2(255),
  fra_unit                VARCHAR2(255),
  fra_job                 VARCHAR2(255),
  fra_phone               VARCHAR2(255),
  fra_sex                 VARCHAR2(255),
  description             VARCHAR2(255),
  creator_id              VARCHAR2(120),
  creator                 VARCHAR2(120),
  create_date             DATE,
  modifiedby              VARCHAR2(120),
  modifiedby_id           VARCHAR2(120),
  modified_date           DATE,
  version_status          NUMBER,
  version                 NUMBER,
  latestversion           NUMBER,
  approvalstae            NUMBER,
  bus_date                DATE,
  exa_remarks             VARCHAR2(500),
  src_table               VARCHAR2(255),
  src_system              VARCHAR2(255),
  sort_id                 NUMBER(38)
)
;
comment on table AC_EMP_INFO
  is '��Ա��Ϣ��';
comment on column AC_EMP_INFO.code
  is 'Ա�����';
comment on column AC_EMP_INFO.cardcode
  is '������';
comment on column AC_EMP_INFO.name
  is '����';
comment on column AC_EMP_INFO.pinyin
  is '����ƴ��';
comment on column AC_EMP_INFO.sex
  is '�Ա�';
comment on column AC_EMP_INFO.birthday
  is '��������';
comment on column AC_EMP_INFO.bloodtype
  is 'Ѫ��';
comment on column AC_EMP_INFO.idcard
  is '���֤��';
comment on column AC_EMP_INFO.marry
  is '����״��';
comment on column AC_EMP_INFO.nation
  is '����';
comment on column AC_EMP_INFO.birthplace
  is '�����ص�';
comment on column AC_EMP_INFO.originplace
  is '����';
comment on column AC_EMP_INFO.photo
  is '��Ƭ����';
comment on column AC_EMP_INFO.personindentity
  is '�������';
comment on column AC_EMP_INFO.politicaloutlook
  is '������ò';
comment on column AC_EMP_INFO.joininparty
  is '�μӵ���ʱ��';
comment on column AC_EMP_INFO.partyoffice
  is '����ְ��';
comment on column AC_EMP_INFO.workingtime
  is '�μӹ���ʱ��';
comment on column AC_EMP_INFO.joininipbtime
  is '�������̾�ϵͳ����ʱ��';
comment on column AC_EMP_INFO.mana_unit
  is '�������ڵ�λ';
comment on column AC_EMP_INFO.department
  is '��������';
comment on column AC_EMP_INFO.joinincorptime
  is '��˾����';
comment on column AC_EMP_INFO.statusdate
  is 'ת������';
comment on column AC_EMP_INFO.emptype
  is 'Ա�����';
comment on column AC_EMP_INFO.joinintype
  is '��˾��ʽ';
comment on column AC_EMP_INFO.mana_job
  is '����ְ��';
comment on column AC_EMP_INFO.mana_joblevel
  is 'ְ�񼶱�';
comment on column AC_EMP_INFO.nowjobbegindate
  is '��ְ��ʼ����';
comment on column AC_EMP_INFO.contracttype
  is '��ͬ���';
comment on column AC_EMP_INFO.contractbegindate
  is '��ͬǩ������';
comment on column AC_EMP_INFO.contractenddate
  is '��ͬ��������';
comment on column AC_EMP_INFO.education
  is 'ѧ��';
comment on column AC_EMP_INFO.academicdegree
  is 'ѧλ';
comment on column AC_EMP_INFO.graguateduniversity
  is '��ҵԺУ';
comment on column AC_EMP_INFO.profession
  is 'רҵ';
comment on column AC_EMP_INFO.edu_begindate
  is '��ѧʱ��';
comment on column AC_EMP_INFO.edu_enddate
  is '��ҵʱ��';
comment on column AC_EMP_INFO.foreignlanguage
  is '��������';
comment on column AC_EMP_INFO.languagelevel
  is '����ȼ�';
comment on column AC_EMP_INFO.technicaltitle
  is '����ְ��';
comment on column AC_EMP_INFO.titlelevel
  is 'ְ�Ƶȼ�';
comment on column AC_EMP_INFO.occupationqualification
  is 'ְҵ�ʸ�';
comment on column AC_EMP_INFO.certification
  is '�ϸ�֤(����֤)';
comment on column AC_EMP_INFO.city
  is '��������';
comment on column AC_EMP_INFO.officeaddress
  is '�칫��ַ';
comment on column AC_EMP_INFO.officephone
  is '�̶��绰';
comment on column AC_EMP_INFO.mobile
  is '�ƶ��绰';
comment on column AC_EMP_INFO.email
  is '�����ʼ�';
comment on column AC_EMP_INFO.officepostalcode
  is '�칫����������';
comment on column AC_EMP_INFO.homeaddress
  is '��ͥסַ';
comment on column AC_EMP_INFO.homephone
  is 'סլ�绰';
comment on column AC_EMP_INFO.homepostalcode
  is '��ͥ���ڵ���������';
comment on column AC_EMP_INFO.emergencyperson
  is '����������';
comment on column AC_EMP_INFO.emergencyphone
  is '��������绰';
comment on column AC_EMP_INFO.worked_begindate
  is '������ʼ����';
comment on column AC_EMP_INFO.worked_enddate
  is '������������';
comment on column AC_EMP_INFO.worked_unit
  is '������λ';
comment on column AC_EMP_INFO.worked_department
  is '��������';
comment on column AC_EMP_INFO.worked_job
  is '����ְ��';
comment on column AC_EMP_INFO.working
  is '�����£��ֹܣ��Ĺ���';
comment on column AC_EMP_INFO.tra_begindate
  is '��ѵ��ʼ����';
comment on column AC_EMP_INFO.tra_enddate
  is '��ѵ��������';
comment on column AC_EMP_INFO.tra_content
  is '��ѵ����';
comment on column AC_EMP_INFO.tra_unit
  is '��ѵ����';
comment on column AC_EMP_INFO.tra_type
  is '��ѵ����';
comment on column AC_EMP_INFO.tra_mode
  is '��ѵ��ʽ';
comment on column AC_EMP_INFO.membername
  is '��ͥ��Ա����';
comment on column AC_EMP_INFO.relation
  is '�뱾�˹�ϵ';
comment on column AC_EMP_INFO.fra_birthday
  is '��ͥ��Ա��������';
comment on column AC_EMP_INFO.fra_unit
  is '��ͥ��Ա������λ';
comment on column AC_EMP_INFO.fra_job
  is '��ͥ��Աְ��';
comment on column AC_EMP_INFO.fra_phone
  is '��ͥ��Ա��ϵ�绰';
comment on column AC_EMP_INFO.fra_sex
  is '��ͥ��Ա�Ա�';
comment on column AC_EMP_INFO.description
  is '��������';
comment on column AC_EMP_INFO.creator_id
  is '������id';
comment on column AC_EMP_INFO.creator
  is '������';
comment on column AC_EMP_INFO.create_date
  is '��������';
comment on column AC_EMP_INFO.modifiedby
  is '�޸���';
comment on column AC_EMP_INFO.modifiedby_id
  is '�޸���id';
comment on column AC_EMP_INFO.modified_date
  is '�޸�����';
comment on column AC_EMP_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_EMP_INFO.version
  is '�汾��';
comment on column AC_EMP_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_EMP_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_EMP_INFO.bus_date
  is 'ҵ������';
comment on column AC_EMP_INFO.exa_remarks
  is '������ע';
comment on column AC_EMP_INFO.src_table
  is '��Դʵ��';
comment on column AC_EMP_INFO.src_system
  is '��Դϵͳ';
comment on column AC_EMP_INFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_LAND_BUYINFO
prompt ==============================
prompt
create table AC_LAND_BUYINFO
(
  landcode       VARCHAR2(255),
  buycost        NUMBER,
  buyyear        VARCHAR2(255),
  buytype        VARCHAR2(255),
  buytimes       NUMBER,
  contcode       VARCHAR2(255),
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
comment on table AC_LAND_BUYINFO
  is '�ؿ����ػ�����Ϣ��';
comment on column AC_LAND_BUYINFO.landcode
  is '�ؿ����';
comment on column AC_LAND_BUYINFO.buycost
  is '���سɱ�';
comment on column AC_LAND_BUYINFO.buyyear
  is '�������';
comment on column AC_LAND_BUYINFO.buytype
  is '�������';
comment on column AC_LAND_BUYINFO.buytimes
  is '��������';
comment on column AC_LAND_BUYINFO.contcode
  is '��ͬ���';
comment on column AC_LAND_BUYINFO.description
  is '��������';
comment on column AC_LAND_BUYINFO.creator_id
  is '������id';
comment on column AC_LAND_BUYINFO.creator
  is '������';
comment on column AC_LAND_BUYINFO.create_date
  is '��������';
comment on column AC_LAND_BUYINFO.modifiedby
  is '�޸���';
comment on column AC_LAND_BUYINFO.modifiedby_id
  is '�޸���id';
comment on column AC_LAND_BUYINFO.modified_date
  is '�޸�����';
comment on column AC_LAND_BUYINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_LAND_BUYINFO.version
  is '�汾��';
comment on column AC_LAND_BUYINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_LAND_BUYINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_LAND_BUYINFO.bus_date
  is 'ҵ������';
comment on column AC_LAND_BUYINFO.exa_remarks
  is '������ע';
comment on column AC_LAND_BUYINFO.src_table
  is '��Դʵ��';
comment on column AC_LAND_BUYINFO.src_system
  is '��Դϵͳ';
comment on column AC_LAND_BUYINFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_LAND_DEVELOP
prompt ==============================
prompt
create table AC_LAND_DEVELOP
(
  landcode       VARCHAR2(255),
  storagecode    VARCHAR2(255),
  projectname    VARCHAR2(255),
  storageyear    VARCHAR2(255),
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
comment on table AC_LAND_DEVELOP
  is '�ؿ���ؿ�����Ϣ��';
comment on column AC_LAND_DEVELOP.landcode
  is '�ؿ����';
comment on column AC_LAND_DEVELOP.storagecode
  is '�ؿ鿪������';
comment on column AC_LAND_DEVELOP.projectname
  is '�ؿ鿪������';
comment on column AC_LAND_DEVELOP.storageyear
  is '�������';
comment on column AC_LAND_DEVELOP.description
  is '��������';
comment on column AC_LAND_DEVELOP.creator_id
  is '������id';
comment on column AC_LAND_DEVELOP.creator
  is '������';
comment on column AC_LAND_DEVELOP.create_date
  is '��������';
comment on column AC_LAND_DEVELOP.modifiedby
  is '�޸���';
comment on column AC_LAND_DEVELOP.modifiedby_id
  is '�޸���id';
comment on column AC_LAND_DEVELOP.modified_date
  is '�޸�����';
comment on column AC_LAND_DEVELOP.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_LAND_DEVELOP.version
  is '�汾��';
comment on column AC_LAND_DEVELOP.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_LAND_DEVELOP.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_LAND_DEVELOP.bus_date
  is 'ҵ������';
comment on column AC_LAND_DEVELOP.exa_remarks
  is '������ע';
comment on column AC_LAND_DEVELOP.src_table
  is '��Դʵ��';
comment on column AC_LAND_DEVELOP.src_system
  is '��Դϵͳ';
comment on column AC_LAND_DEVELOP.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_LAND_INFO
prompt ===========================
prompt
create table AC_LAND_INFO
(
  landcode          VARCHAR2(255),
  landtype          VARCHAR2(255),
  landposition      VARCHAR2(255),
  landname          VARCHAR2(255),
  landareadivision  VARCHAR2(255),
  landapprovenumber VARCHAR2(255),
  landapprovedate   DATE,
  parentname        VARCHAR2(255),
  landstatus        VARCHAR2(255),
  landshape         VARCHAR2(255),
  landlength        NUMBER,
  landwidth         NUMBER,
  landarea_mu       NUMBER,
  landarea_square   NUMBER,
  landphoto         VARCHAR2(255),
  landusing         VARCHAR2(255),
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
comment on table AC_LAND_INFO
  is '�ؿ������Ϣ��';
comment on column AC_LAND_INFO.landcode
  is '�ؿ����';
comment on column AC_LAND_INFO.landtype
  is '�ؿ�����';
comment on column AC_LAND_INFO.landposition
  is '�ؿ�λ��';
comment on column AC_LAND_INFO.landname
  is '�ؿ�����';
comment on column AC_LAND_INFO.landareadivision
  is '�ؿ�����';
comment on column AC_LAND_INFO.landapprovenumber
  is '�ؿ���׼�ĺ�';
comment on column AC_LAND_INFO.landapprovedate
  is '�ؿ���׼ʱ��';
comment on column AC_LAND_INFO.parentname
  is 'Ȩ������';
comment on column AC_LAND_INFO.landstatus
  is '�ؿ�״̬';
comment on column AC_LAND_INFO.landshape
  is '�ؿ���״';
comment on column AC_LAND_INFO.landlength
  is '�ؿ鳤��';
comment on column AC_LAND_INFO.landwidth
  is '�ؿ���';
comment on column AC_LAND_INFO.landarea_mu
  is '�ؿ������Ķ��';
comment on column AC_LAND_INFO.landarea_square
  is '�ؿ������ƽ���ף�';
comment on column AC_LAND_INFO.landphoto
  is '�ؿ�ͼƬ';
comment on column AC_LAND_INFO.landusing
  is '�ؿ���;';
comment on column AC_LAND_INFO.description
  is '��������';
comment on column AC_LAND_INFO.creator_id
  is '������id';
comment on column AC_LAND_INFO.creator
  is '������';
comment on column AC_LAND_INFO.create_date
  is '��������';
comment on column AC_LAND_INFO.modifiedby
  is '�޸���';
comment on column AC_LAND_INFO.modifiedby_id
  is '�޸���id';
comment on column AC_LAND_INFO.modified_date
  is '�޸�����';
comment on column AC_LAND_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_LAND_INFO.version
  is '�汾��';
comment on column AC_LAND_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_LAND_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_LAND_INFO.bus_date
  is 'ҵ������';
comment on column AC_LAND_INFO.exa_remarks
  is '������ע';
comment on column AC_LAND_INFO.src_table
  is '��Դʵ��';
comment on column AC_LAND_INFO.src_system
  is '��Դϵͳ';
comment on column AC_LAND_INFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_LAND_MAKEINFO
prompt ===============================
prompt
create table AC_LAND_MAKEINFO
(
  landcode       VARCHAR2(255),
  makecost       NUMBER,
  makeprice      NUMBER,
  stonevolume    NUMBER,
  makeyear       VARCHAR2(255),
  contcode       VARCHAR2(255),
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
comment on table AC_LAND_MAKEINFO
  is '�ؿ��մ���Ϣ��';
comment on column AC_LAND_MAKEINFO.landcode
  is '�ؿ����';
comment on column AC_LAND_MAKEINFO.makecost
  is '��سɱ�';
comment on column AC_LAND_MAKEINFO.makeprice
  is '��ص���';
comment on column AC_LAND_MAKEINFO.stonevolume
  is '��ʯ����';
comment on column AC_LAND_MAKEINFO.makeyear
  is '������';
comment on column AC_LAND_MAKEINFO.contcode
  is '��ͬ���';
comment on column AC_LAND_MAKEINFO.description
  is '��������';
comment on column AC_LAND_MAKEINFO.creator_id
  is '������id';
comment on column AC_LAND_MAKEINFO.creator
  is '������';
comment on column AC_LAND_MAKEINFO.create_date
  is '��������';
comment on column AC_LAND_MAKEINFO.modifiedby
  is '�޸���';
comment on column AC_LAND_MAKEINFO.modifiedby_id
  is '�޸���id';
comment on column AC_LAND_MAKEINFO.modified_date
  is '�޸�����';
comment on column AC_LAND_MAKEINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_LAND_MAKEINFO.version
  is '�汾��';
comment on column AC_LAND_MAKEINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_LAND_MAKEINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_LAND_MAKEINFO.bus_date
  is 'ҵ������';
comment on column AC_LAND_MAKEINFO.exa_remarks
  is '������ע';
comment on column AC_LAND_MAKEINFO.src_table
  is '��Դʵ��';
comment on column AC_LAND_MAKEINFO.src_system
  is '��Դϵͳ';
comment on column AC_LAND_MAKEINFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_LAND_PLANINFO
prompt ===============================
prompt
create table AC_LAND_PLANINFO
(
  landcode       VARCHAR2(255),
  buydate        DATE,
  developdate    DATE,
  transferdate   DATE,
  transferperiod DATE,
  transferprice  NUMBER,
  usingunit      VARCHAR2(255),
  parcelcode     VARCHAR2(255),
  makecost       NUMBER,
  buycost        NUMBER,
  transferprofit NUMBER,
  financefee     NUMBER,
  managefee      NUMBER,
  areacode       VARCHAR2(255),
  areameasure    NUMBER,
  landscopeline  VARCHAR2(255),
  landplanlayer  VARCHAR2(255),
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
comment on table AC_LAND_PLANINFO
  is '�ؿ�滮��Ϣ��';
comment on column AC_LAND_PLANINFO.landcode
  is '�ؿ����';
comment on column AC_LAND_PLANINFO.buydate
  is '����ʱ��';
comment on column AC_LAND_PLANINFO.developdate
  is '����ʱ��';
comment on column AC_LAND_PLANINFO.transferdate
  is 'ת��ʱ��';
comment on column AC_LAND_PLANINFO.transferperiod
  is 'ת������';
comment on column AC_LAND_PLANINFO.transferprice
  is 'ת�ü۸�';
comment on column AC_LAND_PLANINFO.usingunit
  is 'ʹ�õ�λ';
comment on column AC_LAND_PLANINFO.parcelcode
  is '�ڵر��';
comment on column AC_LAND_PLANINFO.makecost
  is '��سɱ�';
comment on column AC_LAND_PLANINFO.buycost
  is '���سɱ�';
comment on column AC_LAND_PLANINFO.transferprofit
  is 'ת������';
comment on column AC_LAND_PLANINFO.financefee
  is '�������';
comment on column AC_LAND_PLANINFO.managefee
  is '�������';
comment on column AC_LAND_PLANINFO.areacode
  is '������';
comment on column AC_LAND_PLANINFO.areameasure
  is '�������';
comment on column AC_LAND_PLANINFO.landscopeline
  is '�õط�Χ��';
comment on column AC_LAND_PLANINFO.landplanlayer
  is '�õع滮ͼ��';
comment on column AC_LAND_PLANINFO.description
  is '��������';
comment on column AC_LAND_PLANINFO.creator_id
  is '������id';
comment on column AC_LAND_PLANINFO.creator
  is '������';
comment on column AC_LAND_PLANINFO.create_date
  is '��������';
comment on column AC_LAND_PLANINFO.modifiedby
  is '�޸���';
comment on column AC_LAND_PLANINFO.modifiedby_id
  is '�޸���id';
comment on column AC_LAND_PLANINFO.modified_date
  is '�޸�����';
comment on column AC_LAND_PLANINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_LAND_PLANINFO.version
  is '�汾��';
comment on column AC_LAND_PLANINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_LAND_PLANINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_LAND_PLANINFO.bus_date
  is 'ҵ������';
comment on column AC_LAND_PLANINFO.exa_remarks
  is '������ע';
comment on column AC_LAND_PLANINFO.src_table
  is '��Դʵ��';
comment on column AC_LAND_PLANINFO.src_system
  is '��Դϵͳ';
comment on column AC_LAND_PLANINFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_LAND_SELLINFO
prompt ===============================
prompt
create table AC_LAND_SELLINFO
(
  landcode                   VARCHAR2(255),
  sellyear                   VARCHAR2(255),
  plantransferyear           VARCHAR2(255),
  sellcontcode               VARCHAR2(255),
  parcelcode                 VARCHAR2(255),
  transfer                   VARCHAR2(255),
  transferee                 VARCHAR2(255),
  dealdate                   DATE,
  contcode                   VARCHAR2(255),
  contname                   VARCHAR2(255),
  prelandtransferbuycontcode VARCHAR2(255),
  prelandtransferbuycontname VARCHAR2(255),
  landtransferperiod         VARCHAR2(255),
  transfertotalamount        NUMBER,
  sellprice                  NUMBER,
  conttotalamount            NUMBER,
  agreedate                  DATE,
  reallydate                 DATE,
  bookingpayoffdate          DATE,
  reallypayoffdate           DATE,
  description                VARCHAR2(255),
  creator_id                 VARCHAR2(120),
  creator                    VARCHAR2(120),
  create_date                DATE,
  modifiedby                 VARCHAR2(120),
  modifiedby_id              VARCHAR2(120),
  modified_date              DATE,
  version_status             NUMBER,
  version                    NUMBER,
  latestversion              NUMBER,
  approvalstae               NUMBER,
  bus_date                   DATE,
  exa_remarks                VARCHAR2(500),
  src_table                  VARCHAR2(255),
  src_system                 VARCHAR2(255),
  sort_id                    NUMBER(38)
)
;
comment on table AC_LAND_SELLINFO
  is '�ؿ��۵���Ϣ��';
comment on column AC_LAND_SELLINFO.landcode
  is '�ؿ����';
comment on column AC_LAND_SELLINFO.sellyear
  is '�۵����';
comment on column AC_LAND_SELLINFO.plantransferyear
  is '�ƻ�ת�����';
comment on column AC_LAND_SELLINFO.sellcontcode
  is '�۵غ�ͬ���';
comment on column AC_LAND_SELLINFO.parcelcode
  is '�ڵغ�';
comment on column AC_LAND_SELLINFO.transfer
  is '�ؿ�ת�÷�';
comment on column AC_LAND_SELLINFO.transferee
  is '�ؿ����÷�';
comment on column AC_LAND_SELLINFO.dealdate
  is '����ʱ��';
comment on column AC_LAND_SELLINFO.contcode
  is '��ͬ���';
comment on column AC_LAND_SELLINFO.contname
  is '��ͬ����';
comment on column AC_LAND_SELLINFO.prelandtransferbuycontcode
  is 'ԭ���س��ú�ͬ�ţ����غ�ͬ��';
comment on column AC_LAND_SELLINFO.prelandtransferbuycontname
  is 'ԭ���س��ú�ͬ����';
comment on column AC_LAND_SELLINFO.landtransferperiod
  is '����ת������';
comment on column AC_LAND_SELLINFO.transfertotalamount
  is 'ת���ܼ�';
comment on column AC_LAND_SELLINFO.sellprice
  is '�۵ص���';
comment on column AC_LAND_SELLINFO.conttotalamount
  is '��ͬ���';
comment on column AC_LAND_SELLINFO.agreedate
  is 'Լ������ʱ��';
comment on column AC_LAND_SELLINFO.reallydate
  is 'ʵ�ʽ���ʱ��';
comment on column AC_LAND_SELLINFO.bookingpayoffdate
  is 'Ԥ������ʱ��';
comment on column AC_LAND_SELLINFO.reallypayoffdate
  is 'ʵ�ʸ���ʱ��';
comment on column AC_LAND_SELLINFO.description
  is '��������';
comment on column AC_LAND_SELLINFO.creator_id
  is '������id';
comment on column AC_LAND_SELLINFO.creator
  is '������';
comment on column AC_LAND_SELLINFO.create_date
  is '��������';
comment on column AC_LAND_SELLINFO.modifiedby
  is '�޸���';
comment on column AC_LAND_SELLINFO.modifiedby_id
  is '�޸���id';
comment on column AC_LAND_SELLINFO.modified_date
  is '�޸�����';
comment on column AC_LAND_SELLINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_LAND_SELLINFO.version
  is '�汾��';
comment on column AC_LAND_SELLINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_LAND_SELLINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_LAND_SELLINFO.bus_date
  is 'ҵ������';
comment on column AC_LAND_SELLINFO.exa_remarks
  is '������ע';
comment on column AC_LAND_SELLINFO.src_table
  is '��Դʵ��';
comment on column AC_LAND_SELLINFO.src_system
  is '��Դϵͳ';
comment on column AC_LAND_SELLINFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_LAND_STORAGEINFO
prompt ==================================
prompt
create table AC_LAND_STORAGEINFO
(
  landcode       VARCHAR2(255),
  storecode      VARCHAR2(255),
  prjname        VARCHAR2(255),
  storeyear      DATE,
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
comment on table AC_LAND_STORAGEINFO
  is '�ؿ鴢����Ϣ��';
comment on column AC_LAND_STORAGEINFO.landcode
  is '�ؿ����';
comment on column AC_LAND_STORAGEINFO.storecode
  is '�մ����';
comment on column AC_LAND_STORAGEINFO.prjname
  is '��Ŀ����';
comment on column AC_LAND_STORAGEINFO.storeyear
  is '�մ����';
comment on column AC_LAND_STORAGEINFO.description
  is '��������';
comment on column AC_LAND_STORAGEINFO.creator_id
  is '������id';
comment on column AC_LAND_STORAGEINFO.creator
  is '������';
comment on column AC_LAND_STORAGEINFO.create_date
  is '��������';
comment on column AC_LAND_STORAGEINFO.modifiedby
  is '�޸���';
comment on column AC_LAND_STORAGEINFO.modifiedby_id
  is '�޸���id';
comment on column AC_LAND_STORAGEINFO.modified_date
  is '�޸�����';
comment on column AC_LAND_STORAGEINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_LAND_STORAGEINFO.version
  is '�汾��';
comment on column AC_LAND_STORAGEINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_LAND_STORAGEINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_LAND_STORAGEINFO.bus_date
  is 'ҵ������';
comment on column AC_LAND_STORAGEINFO.exa_remarks
  is '������ע';
comment on column AC_LAND_STORAGEINFO.src_table
  is '��Դʵ��';
comment on column AC_LAND_STORAGEINFO.src_system
  is '��Դϵͳ';
comment on column AC_LAND_STORAGEINFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_ORG_INFO
prompt ==========================
prompt
create table AC_ORG_INFO
(
  code               VARCHAR2(255),
  name               VARCHAR2(255),
  org_type           VARCHAR2(255),
  shortname          VARCHAR2(255),
  relation           VARCHAR2(255),
  org_level          VARCHAR2(255),
  competentorg       VARCHAR2(255),
  properties         VARCHAR2(255),
  established        DATE,
  personsresponsible VARCHAR2(255),
  contactperson      VARCHAR2(255),
  postaladdress      VARCHAR2(255),
  zipcode            VARCHAR2(255),
  phonenumber        VARCHAR2(255),
  faxno              VARCHAR2(255),
  cablenumber        VARCHAR2(255),
  description        VARCHAR2(255),
  creator_id         VARCHAR2(120),
  creator            VARCHAR2(120),
  create_date        DATE,
  modifiedby         VARCHAR2(120),
  modifiedby_id      VARCHAR2(120),
  modified_date      DATE,
  version_status     NUMBER,
  version            NUMBER,
  latestversion      NUMBER,
  approvalstae       NUMBER,
  bus_date           DATE,
  exa_remarks        VARCHAR2(500),
  src_table          VARCHAR2(255),
  src_system         VARCHAR2(255),
  sort_id            NUMBER(38)
)
;
comment on table AC_ORG_INFO
  is '��֯��Ϣ��';
comment on column AC_ORG_INFO.code
  is '��֯����';
comment on column AC_ORG_INFO.name
  is '��֯����';
comment on column AC_ORG_INFO.org_type
  is '��֯����';
comment on column AC_ORG_INFO.shortname
  is '��֯���';
comment on column AC_ORG_INFO.relation
  is '������ϵ';
comment on column AC_ORG_INFO.org_level
  is '��֯����';
comment on column AC_ORG_INFO.competentorg
  is '���ܵ�λ����';
comment on column AC_ORG_INFO.properties
  is '��֯����';
comment on column AC_ORG_INFO.established
  is '����ʱ��';
comment on column AC_ORG_INFO.personsresponsible
  is '������';
comment on column AC_ORG_INFO.contactperson
  is '��ϵ��';
comment on column AC_ORG_INFO.postaladdress
  is 'ͨѶ��ַ';
comment on column AC_ORG_INFO.zipcode
  is '��������';
comment on column AC_ORG_INFO.phonenumber
  is '�绰����';
comment on column AC_ORG_INFO.faxno
  is '�������';
comment on column AC_ORG_INFO.cablenumber
  is '�籨����';
comment on column AC_ORG_INFO.description
  is '��������';
comment on column AC_ORG_INFO.creator_id
  is '������id';
comment on column AC_ORG_INFO.creator
  is '������';
comment on column AC_ORG_INFO.create_date
  is '��������';
comment on column AC_ORG_INFO.modifiedby
  is '�޸���';
comment on column AC_ORG_INFO.modifiedby_id
  is '�޸���id';
comment on column AC_ORG_INFO.modified_date
  is '�޸�����';
comment on column AC_ORG_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_ORG_INFO.version
  is '�汾��';
comment on column AC_ORG_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_ORG_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_ORG_INFO.bus_date
  is 'ҵ������';
comment on column AC_ORG_INFO.exa_remarks
  is '������ע';
comment on column AC_ORG_INFO.src_table
  is '��Դʵ��';
comment on column AC_ORG_INFO.src_system
  is '��Դϵͳ';
comment on column AC_ORG_INFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_PRJ_BID
prompt =========================
prompt
create table AC_PRJ_BID
(
  projectcode      VARCHAR2(255),
  bidcode          VARCHAR2(255),
  bidname          VARCHAR2(255),
  statuscode       VARCHAR2(255),
  bidtypeid        NUMBER,
  budgetcost       NUMBER,
  maxctrlprice     NUMBER,
  minctrlprice     NUMBER,
  maxctrlrate      NUMBER,
  minctrlrate      NUMBER,
  tendcost         NUMBER,
  booker           VARCHAR2(255),
  bookerdate       DATE,
  constructperiod  NUMBER,
  qualitydesc      VARCHAR2(255),
  bidbond          NUMBER,
  contracttype     VARCHAR2(255),
  bidqualification VARCHAR2(255),
  tenderchoosetype VARCHAR2(255),
  desctext         VARCHAR2(255),
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
  bus_date         DATE,
  exa_remarks      VARCHAR2(500),
  src_table        VARCHAR2(255),
  src_system       VARCHAR2(255),
  sort_id          NUMBER(38)
)
;
comment on table AC_PRJ_BID
  is '��Ŀ��Ͷ���';
comment on column AC_PRJ_BID.projectcode
  is '��Ŀ���';
comment on column AC_PRJ_BID.bidcode
  is '�б���';
comment on column AC_PRJ_BID.bidname
  is '�б�����';
comment on column AC_PRJ_BID.statuscode
  is '״̬';
comment on column AC_PRJ_BID.bidtypeid
  is '�б귽ʽ';
comment on column AC_PRJ_BID.budgetcost
  is 'Ԥ���';
comment on column AC_PRJ_BID.maxctrlprice
  is '��߿��Ƽ�';
comment on column AC_PRJ_BID.minctrlprice
  is '��Ϳ��Ƽ�';
comment on column AC_PRJ_BID.maxctrlrate
  is '��߿��Ƽ��¸���';
comment on column AC_PRJ_BID.minctrlrate
  is '��Ϳ��Ƽ��¸���';
comment on column AC_PRJ_BID.tendcost
  is '�б��';
comment on column AC_PRJ_BID.booker
  is '������';
comment on column AC_PRJ_BID.bookerdate
  is '��������';
comment on column AC_PRJ_BID.constructperiod
  is 'ʩ������';
comment on column AC_PRJ_BID.qualitydesc
  is '����Ҫ��';
comment on column AC_PRJ_BID.bidbond
  is 'Ͷ�걣֤��';
comment on column AC_PRJ_BID.contracttype
  is '�а���ʽ';
comment on column AC_PRJ_BID.bidqualification
  is 'Ͷ������';
comment on column AC_PRJ_BID.tenderchoosetype
  is '���귽ʽ';
comment on column AC_PRJ_BID.desctext
  is '��ע';
comment on column AC_PRJ_BID.description
  is '��������';
comment on column AC_PRJ_BID.creator_id
  is '������id';
comment on column AC_PRJ_BID.creator
  is '������';
comment on column AC_PRJ_BID.create_date
  is '��������';
comment on column AC_PRJ_BID.modifiedby
  is '�޸���';
comment on column AC_PRJ_BID.modifiedby_id
  is '�޸���id';
comment on column AC_PRJ_BID.modified_date
  is '�޸�����';
comment on column AC_PRJ_BID.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_PRJ_BID.version
  is '�汾��';
comment on column AC_PRJ_BID.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_PRJ_BID.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_PRJ_BID.bus_date
  is 'ҵ������';
comment on column AC_PRJ_BID.exa_remarks
  is '������ע';
comment on column AC_PRJ_BID.src_table
  is '��Դʵ��';
comment on column AC_PRJ_BID.src_system
  is '��Դϵͳ';
comment on column AC_PRJ_BID.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_PRJ_BUDGET
prompt ============================
prompt
create table AC_PRJ_BUDGET
(
  projectcode    VARCHAR2(255),
  budgetcode     VARCHAR2(255),
  budgetname     VARCHAR2(255),
  statuscode     VARCHAR2(255),
  plancost       NUMBER,
  applyprice     NUMBER,
  auditprice     NUMBER,
  bookername     VARCHAR2(255),
  bookdate       DATE,
  auditorname    VARCHAR2(255),
  auditdate      DATE,
  enclosure      VARCHAR2(255),
  checkername    VARCHAR2(255),
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
comment on table AC_PRJ_BUDGET
  is 'Ԥ�����Ա�';
comment on column AC_PRJ_BUDGET.projectcode
  is '��Ŀ���';
comment on column AC_PRJ_BUDGET.budgetcode
  is 'Ԥ����';
comment on column AC_PRJ_BUDGET.budgetname
  is 'Ԥ������';
comment on column AC_PRJ_BUDGET.statuscode
  is 'Ԥ��״̬';
comment on column AC_PRJ_BUDGET.plancost
  is '�����ƻ�Ͷ�ʶ�';
comment on column AC_PRJ_BUDGET.applyprice
  is '�������';
comment on column AC_PRJ_BUDGET.auditprice
  is '������';
comment on column AC_PRJ_BUDGET.bookername
  is 'Ԥ�������';
comment on column AC_PRJ_BUDGET.bookdate
  is 'Ԥ���������';
comment on column AC_PRJ_BUDGET.auditorname
  is 'Ԥ�������';
comment on column AC_PRJ_BUDGET.auditdate
  is 'Ԥ���������';
comment on column AC_PRJ_BUDGET.enclosure
  is '����';
comment on column AC_PRJ_BUDGET.checkername
  is 'Ԥ�㸴����';
comment on column AC_PRJ_BUDGET.description
  is '��������';
comment on column AC_PRJ_BUDGET.creator_id
  is '������id';
comment on column AC_PRJ_BUDGET.creator
  is '������';
comment on column AC_PRJ_BUDGET.create_date
  is '��������';
comment on column AC_PRJ_BUDGET.modifiedby
  is '�޸���';
comment on column AC_PRJ_BUDGET.modifiedby_id
  is '�޸���id';
comment on column AC_PRJ_BUDGET.modified_date
  is '�޸�����';
comment on column AC_PRJ_BUDGET.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_PRJ_BUDGET.version
  is '�汾��';
comment on column AC_PRJ_BUDGET.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_PRJ_BUDGET.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_PRJ_BUDGET.bus_date
  is 'ҵ������';
comment on column AC_PRJ_BUDGET.exa_remarks
  is '������ע';
comment on column AC_PRJ_BUDGET.src_table
  is '��Դʵ��';
comment on column AC_PRJ_BUDGET.src_system
  is '��Դϵͳ';
comment on column AC_PRJ_BUDGET.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_PRJ_INVESTMENT
prompt ================================
prompt
create table AC_PRJ_INVESTMENT
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
comment on table AC_PRJ_INVESTMENT
  is '��ĿͶ����Ϣ��';
comment on column AC_PRJ_INVESTMENT.project_id
  is '��Ŀ��';
comment on column AC_PRJ_INVESTMENT.project_code
  is '��Ŀ���';
comment on column AC_PRJ_INVESTMENT.originalamount
  is 'ԭʼͶ�ʶ�';
comment on column AC_PRJ_INVESTMENT.currentamount
  is '��ǰ�ۼ�Ͷ�ʶ�';
comment on column AC_PRJ_INVESTMENT.investyear
  is 'Ͷ�����';
comment on column AC_PRJ_INVESTMENT.investamount
  is 'Ͷ���ܶ�';
comment on column AC_PRJ_INVESTMENT.plannedamount
  is 'Ͷ�ʼƻ��ܶ�';
comment on column AC_PRJ_INVESTMENT.actualamount
  is 'ʵ�������Ͷ��';
comment on column AC_PRJ_INVESTMENT.estimateinvestment
  is '����Ͷ�ʶ�';
comment on column AC_PRJ_INVESTMENT.budgetaryinvestment
  is '����Ͷ�ʶ�';
comment on column AC_PRJ_INVESTMENT.contractcode
  is '��ͬ����';
comment on column AC_PRJ_INVESTMENT.contractname
  is '��ͬ����';
comment on column AC_PRJ_INVESTMENT.description
  is '��������';
comment on column AC_PRJ_INVESTMENT.creator_id
  is '������id';
comment on column AC_PRJ_INVESTMENT.creator
  is '������';
comment on column AC_PRJ_INVESTMENT.create_date
  is '��������';
comment on column AC_PRJ_INVESTMENT.modifiedby
  is '�޸���';
comment on column AC_PRJ_INVESTMENT.modifiedby_id
  is '�޸���id';
comment on column AC_PRJ_INVESTMENT.modified_date
  is '�޸�����';
comment on column AC_PRJ_INVESTMENT.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_PRJ_INVESTMENT.version
  is '�汾��';
comment on column AC_PRJ_INVESTMENT.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_PRJ_INVESTMENT.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_PRJ_INVESTMENT.bus_date
  is 'ҵ������';
comment on column AC_PRJ_INVESTMENT.exa_remarks
  is '������ע';
comment on column AC_PRJ_INVESTMENT.src_table
  is '��Դ��';
comment on column AC_PRJ_INVESTMENT.src_system
  is '��Դϵͳ';
comment on column AC_PRJ_INVESTMENT.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_PRJ_LANDPRJ
prompt =============================
prompt
create table AC_PRJ_LANDPRJ
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
comment on table AC_PRJ_LANDPRJ
  is '���ؾ�Ӫ����Ŀ��Ϣ';
comment on column AC_PRJ_LANDPRJ.project_id
  is '��Ŀ��';
comment on column AC_PRJ_LANDPRJ.project_code
  is '��Ŀ����';
comment on column AC_PRJ_LANDPRJ.project_name
  is '��Ŀ����';
comment on column AC_PRJ_LANDPRJ.projectsetuptime
  is '����ʱ��';
comment on column AC_PRJ_LANDPRJ.approvefile
  is '��������';
comment on column AC_PRJ_LANDPRJ.approveunit
  is '����������λ';
comment on column AC_PRJ_LANDPRJ.projectstatus
  is '��Ŀ״̬����';
comment on column AC_PRJ_LANDPRJ.projectstatuscode
  is '��Ŀ״̬';
comment on column AC_PRJ_LANDPRJ.projecttype
  is '��Ŀ��������';
comment on column AC_PRJ_LANDPRJ.projecttypecode
  is '��Ŀ����';
comment on column AC_PRJ_LANDPRJ.targetbegintime
  is '�ƻ���ʼ����';
comment on column AC_PRJ_LANDPRJ.targetendtime
  is '�ƻ���������';
comment on column AC_PRJ_LANDPRJ.neworcontinued
  is '�½�/����';
comment on column AC_PRJ_LANDPRJ.actbegintime
  is 'ʵ�ʿ�ʼʱ��';
comment on column AC_PRJ_LANDPRJ.actendtime
  is 'ʵ���������';
comment on column AC_PRJ_LANDPRJ.investamount
  is '��Ͷ�ʶ�';
comment on column AC_PRJ_LANDPRJ.investamountyear
  is '����Ͷ�ʶ�';
comment on column AC_PRJ_LANDPRJ.projectscale
  is '�����ģ';
comment on column AC_PRJ_LANDPRJ.projectcontent
  is '��������';
comment on column AC_PRJ_LANDPRJ.projectaddr
  is '��Ŀ��ַ';
comment on column AC_PRJ_LANDPRJ.projecteps
  is '��ĿEPS';
comment on column AC_PRJ_LANDPRJ.responsibleteam
  is '�����Ŷ�';
comment on column AC_PRJ_LANDPRJ.desctext
  is '��ע';
comment on column AC_PRJ_LANDPRJ.role
  is '��Ŀ��ɫ';
comment on column AC_PRJ_LANDPRJ.unitcode
  is '��λ����';
comment on column AC_PRJ_LANDPRJ.unitname
  is '��λ����';
comment on column AC_PRJ_LANDPRJ.contactperson
  is '��ϵ��';
comment on column AC_PRJ_LANDPRJ.land_code
  is '�ؿ����';
comment on column AC_PRJ_LANDPRJ.land_name
  is '�ؿ�����';
comment on column AC_PRJ_LANDPRJ.land_finishdate
  is '������ʱ��';
comment on column AC_PRJ_LANDPRJ.land_type
  is '�ؿ�����';
comment on column AC_PRJ_LANDPRJ.land_realarrivesate
  is 'ʵ�ʴﵽ״̬';
comment on column AC_PRJ_LANDPRJ.changereason
  is '��Ŀ���ԭ��';
comment on column AC_PRJ_LANDPRJ.changedate
  is '���ʱ��';
comment on column AC_PRJ_LANDPRJ.changeamount
  is '������';
comment on column AC_PRJ_LANDPRJ.buyredline54coord
  is '���غ���ͼ�����꣨54����ϵ��';
comment on column AC_PRJ_LANDPRJ.buyredline80coord
  is '���غ���ͼ�����꣨80����ϵ��';
comment on column AC_PRJ_LANDPRJ.isredclaim
  is '�Ƿ񳬺�������';
comment on column AC_PRJ_LANDPRJ.claimscope
  is '���ⷶΧͼ';
comment on column AC_PRJ_LANDPRJ.ownerunit
  is 'ҵ����λ';
comment on column AC_PRJ_LANDPRJ.prjunit
  is '���λ';
comment on column AC_PRJ_LANDPRJ.land_description
  is '�õظſ�';
comment on column AC_PRJ_LANDPRJ.planprice
  is '�ƻ�����';
comment on column AC_PRJ_LANDPRJ.plantotalamout
  is '�ƻ��ܽ��';
comment on column AC_PRJ_LANDPRJ.claimfinishdate
  is '�����������ʱ��';
comment on column AC_PRJ_LANDPRJ.referdate
  is '����ʱ��';
comment on column AC_PRJ_LANDPRJ.approvenum
  is '�ؿ���׼�ĺ�';
comment on column AC_PRJ_LANDPRJ.approvedate
  is '�ؿ�����ʱ��';
comment on column AC_PRJ_LANDPRJ.buyarea_mu
  is '�ؿ鱾���������(Ķ)';
comment on column AC_PRJ_LANDPRJ.buyarea_square
  is '�ؿ鱾�����������ƽ���ף�';
comment on column AC_PRJ_LANDPRJ.payoffprj
  is '����֧����Ŀ';
comment on column AC_PRJ_LANDPRJ.makeprjnum
  is '�����Ŀ���';
comment on column AC_PRJ_LANDPRJ.makeprjcode
  is '�����Ŀ����';
comment on column AC_PRJ_LANDPRJ.contamount
  is '��ͬ���';
comment on column AC_PRJ_LANDPRJ.prjperiod
  is '���̹���';
comment on column AC_PRJ_LANDPRJ.conttotalamount
  is '��ͬ������';
comment on column AC_PRJ_LANDPRJ.estimatequantity
  is 'Ԥ�ƹ�����';
comment on column AC_PRJ_LANDPRJ.coverstonebuyprice
  is '�������ʯ������';
comment on column AC_PRJ_LANDPRJ.coverestimatetotalcost
  is '���Ԥ���ܳɱ�';
comment on column AC_PRJ_LANDPRJ.digestimatetotalcost
  is '�ڷ���Ԥ���ܳɱ�';
comment on column AC_PRJ_LANDPRJ.performancebond
  is '��Լ��֤��';
comment on column AC_PRJ_LANDPRJ.emergencybond
  is '��ȫӦ����';
comment on column AC_PRJ_LANDPRJ.constructionunit
  is 'ʩ����λ';
comment on column AC_PRJ_LANDPRJ.digareanum
  is '�ڷ���������';
comment on column AC_PRJ_LANDPRJ.diglandnum
  is '�ڷ����ؿ���';
comment on column AC_PRJ_LANDPRJ.expectedigarea
  is 'Ԥ���ڷ������';
comment on column AC_PRJ_LANDPRJ.coverareanum
  is '���������';
comment on column AC_PRJ_LANDPRJ.coverlandnum
  is '����ؿ���';
comment on column AC_PRJ_LANDPRJ.expectecoverarea
  is 'Ԥ��������';
comment on column AC_PRJ_LANDPRJ.description
  is '��������';
comment on column AC_PRJ_LANDPRJ.creator_id
  is '������id';
comment on column AC_PRJ_LANDPRJ.creator
  is '������';
comment on column AC_PRJ_LANDPRJ.create_date
  is '��������';
comment on column AC_PRJ_LANDPRJ.modifiedby
  is '�޸���';
comment on column AC_PRJ_LANDPRJ.modifiedby_id
  is '�޸���id';
comment on column AC_PRJ_LANDPRJ.modified_date
  is '�޸�����';
comment on column AC_PRJ_LANDPRJ.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_PRJ_LANDPRJ.version
  is '�汾��';
comment on column AC_PRJ_LANDPRJ.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_PRJ_LANDPRJ.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_PRJ_LANDPRJ.bus_date
  is 'ҵ������';
comment on column AC_PRJ_LANDPRJ.exa_remarks
  is '������ע';
comment on column AC_PRJ_LANDPRJ.src_table
  is '��Դ��';
comment on column AC_PRJ_LANDPRJ.src_system
  is '��Դϵͳ';
comment on column AC_PRJ_LANDPRJ.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_PRJ_OTHERBASEINFO
prompt ===================================
prompt
create table AC_PRJ_OTHERBASEINFO
(
  projectcode       VARCHAR2(255),
  projectname       VARCHAR2(255),
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
  responsibleteam   VARCHAR2(255),
  desctext          VARCHAR2(255),
  suppcode          VARCHAR2(255),
  suppname          VARCHAR2(255),
  suppcontacts      VARCHAR2(255),
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
comment on table AC_PRJ_OTHERBASEINFO
  is '������Ŀ������Ϣ';
comment on column AC_PRJ_OTHERBASEINFO.projectcode
  is '��Ŀ����';
comment on column AC_PRJ_OTHERBASEINFO.projectname
  is '��Ŀ����';
comment on column AC_PRJ_OTHERBASEINFO.projectsetuptime
  is '����ʱ��';
comment on column AC_PRJ_OTHERBASEINFO.approvefile
  is '��������';
comment on column AC_PRJ_OTHERBASEINFO.approveunit
  is '����������λ';
comment on column AC_PRJ_OTHERBASEINFO.projectstatus
  is '��Ŀ״̬����';
comment on column AC_PRJ_OTHERBASEINFO.projectstatuscode
  is '��Ŀ״̬';
comment on column AC_PRJ_OTHERBASEINFO.projecttype
  is '��Ŀ��������';
comment on column AC_PRJ_OTHERBASEINFO.projecttypecode
  is '��Ŀ����';
comment on column AC_PRJ_OTHERBASEINFO.targetbegintime
  is '�ƻ���ʼ����';
comment on column AC_PRJ_OTHERBASEINFO.targetendtime
  is '�ƻ���������';
comment on column AC_PRJ_OTHERBASEINFO.neworcontinued
  is '�½�/����';
comment on column AC_PRJ_OTHERBASEINFO.actbegintime
  is 'ʵ�ʿ�ʼʱ��';
comment on column AC_PRJ_OTHERBASEINFO.actendtime
  is 'ʵ���������';
comment on column AC_PRJ_OTHERBASEINFO.investamount
  is '��Ͷ�ʶ�';
comment on column AC_PRJ_OTHERBASEINFO.investamountyear
  is '����Ͷ�ʶ�';
comment on column AC_PRJ_OTHERBASEINFO.projectscale
  is '�����ģ';
comment on column AC_PRJ_OTHERBASEINFO.projectcontent
  is '��������';
comment on column AC_PRJ_OTHERBASEINFO.projectaddr
  is '��Ŀ��ַ';
comment on column AC_PRJ_OTHERBASEINFO.responsibleteam
  is '�����Ŷ�';
comment on column AC_PRJ_OTHERBASEINFO.desctext
  is '��ע';
comment on column AC_PRJ_OTHERBASEINFO.suppcode
  is '��Ӧ�̴���';
comment on column AC_PRJ_OTHERBASEINFO.suppname
  is '��Ӧ������';
comment on column AC_PRJ_OTHERBASEINFO.suppcontacts
  is '��Ӧ����ϵ��';
comment on column AC_PRJ_OTHERBASEINFO.description
  is '��������';
comment on column AC_PRJ_OTHERBASEINFO.creator_id
  is '������id';
comment on column AC_PRJ_OTHERBASEINFO.creator
  is '������';
comment on column AC_PRJ_OTHERBASEINFO.create_date
  is '��������';
comment on column AC_PRJ_OTHERBASEINFO.modifiedby
  is '�޸���';
comment on column AC_PRJ_OTHERBASEINFO.modifiedby_id
  is '�޸���id';
comment on column AC_PRJ_OTHERBASEINFO.modified_date
  is '�޸�����';
comment on column AC_PRJ_OTHERBASEINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_PRJ_OTHERBASEINFO.version
  is '�汾��';
comment on column AC_PRJ_OTHERBASEINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_PRJ_OTHERBASEINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_PRJ_OTHERBASEINFO.bus_date
  is 'ҵ������';
comment on column AC_PRJ_OTHERBASEINFO.exa_remarks
  is '������ע';
comment on column AC_PRJ_OTHERBASEINFO.src_table
  is '��Դʵ��';
comment on column AC_PRJ_OTHERBASEINFO.src_system
  is '��Դϵͳ';
comment on column AC_PRJ_OTHERBASEINFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_SBJ_INFO
prompt ==========================
prompt
create table AC_SBJ_INFO
(
  sbjcode                    VARCHAR2(255),
  sbjtype                    VARCHAR2(255),
  englishname                VARCHAR2(255),
  schinesename               VARCHAR2(255),
  tchinesename               VARCHAR2(255),
  parentsbjcode              VARCHAR2(255),
  ctrllevel_quote            VARCHAR2(255),
  ctrllevel_distribution     VARCHAR2(255),
  mnemoniccode               VARCHAR2(255),
  balancedirectionid         INTEGER,
  currencyaccounting         VARCHAR2(255),
  currencycode               VARCHAR2(255),
  finalcurrencyid            INTEGER,
  isjournalid                INTEGER,
  iscashid                   INTEGER,
  isbankid                   INTEGER,
  iscashequalid              INTEGER,
  isnumaccountingid          INTEGER,
  groupcoding                VARCHAR2(255),
  unitcode                   VARCHAR2(255),
  noticesid                  INTEGER,
  currentverificationid      INTEGER,
  cusbjtype                  VARCHAR2(255),
  cuauxiliarytype            VARCHAR2(255),
  sbjauxiliarytype           VARCHAR2(255),
  losttype                   VARCHAR2(255),
  bectrlsys                  VARCHAR2(255),
  customattributes           VARCHAR2(255),
  isaddbelowsbj_quote        VARCHAR2(255),
  isaddbelowsbj_distribution VARCHAR2(255),
  ispcuinvalidid             INTEGER,
  iscuinvalidid              INTEGER,
  sbjinvalidid               INTEGER,
  psbjinvalidid              INTEGER,
  creater                    VARCHAR2(255),
  createdate                 VARCHAR2(255),
  isoutsidesbjid             INTEGER,
  mastertableprj             VARCHAR2(255),
  scheduleproject            VARCHAR2(255),
  description                VARCHAR2(120),
  creator_id                 VARCHAR2(120),
  creator                    VARCHAR2(120),
  create_date                DATE,
  modifiedby                 VARCHAR2(120),
  modifiedby_id              VARCHAR2(120),
  modified_date              DATE,
  version_status             INTEGER,
  version                    INTEGER,
  latestversion              INTEGER,
  approvalstae               INTEGER,
  bus_date                   DATE,
  exa_remarks                VARCHAR2(500),
  src_table                  VARCHAR2(255),
  src_system                 VARCHAR2(255),
  sort_id                    NUMBER(38)
)
;
comment on table AC_SBJ_INFO
  is '����Ŀ������Ϣ��';
comment on column AC_SBJ_INFO.sbjcode
  is '��Ŀ����';
comment on column AC_SBJ_INFO.sbjtype
  is '��Ŀ����';
comment on column AC_SBJ_INFO.englishname
  is 'Ӣ��_����';
comment on column AC_SBJ_INFO.schinesename
  is '��������_����';
comment on column AC_SBJ_INFO.tchinesename
  is '��������_����';
comment on column AC_SBJ_INFO.parentsbjcode
  is '����Ŀ����';
comment on column AC_SBJ_INFO.ctrllevel_quote
  is '���Ƽ��Σ������ã�';
comment on column AC_SBJ_INFO.ctrllevel_distribution
  is '���Ƽ��Σ������ã�';
comment on column AC_SBJ_INFO.mnemoniccode
  is '������';
comment on column AC_SBJ_INFO.balancedirectionid
  is '����';
comment on column AC_SBJ_INFO.currencyaccounting
  is '�ұ����';
comment on column AC_SBJ_INFO.currencycode
  is '�ұ����';
comment on column AC_SBJ_INFO.finalcurrencyid
  is '��ĩ����';
comment on column AC_SBJ_INFO.isjournalid
  is '�Ƿ���ռ���';
comment on column AC_SBJ_INFO.iscashid
  is '�Ƿ��ֽ��Ŀ';
comment on column AC_SBJ_INFO.isbankid
  is '�Ƿ����п�Ŀ';
comment on column AC_SBJ_INFO.iscashequalid
  is '�Ƿ��ֽ�ȼ���';
comment on column AC_SBJ_INFO.isnumaccountingid
  is '��Ŀ����';
comment on column AC_SBJ_INFO.groupcoding
  is '������λ�����';
comment on column AC_SBJ_INFO.unitcode
  is '������λ����';
comment on column AC_SBJ_INFO.noticesid
  is '����֪ͨ';
comment on column AC_SBJ_INFO.currentverificationid
  is '��������';
comment on column AC_SBJ_INFO.cusbjtype
  is '����CU������Ŀ����������';
comment on column AC_SBJ_INFO.cuauxiliarytype
  is '�ϼ�CU����������';
comment on column AC_SBJ_INFO.sbjauxiliarytype
  is '�ϼ���Ŀ����������';
comment on column AC_SBJ_INFO.losttype
  is '��������';
comment on column AC_SBJ_INFO.bectrlsys
  is '�ܿ�ϵͳ';
comment on column AC_SBJ_INFO.customattributes
  is '��Ŀ�Զ�������';
comment on column AC_SBJ_INFO.isaddbelowsbj_quote
  is '�ܷ������¼���Ŀ�������ã�';
comment on column AC_SBJ_INFO.isaddbelowsbj_distribution
  is '�ܷ������¼���Ŀ�������ã�';
comment on column AC_SBJ_INFO.ispcuinvalidid
  is '�ϼ�CU�Ƿ����';
comment on column AC_SBJ_INFO.iscuinvalidid
  is '����CU�Ƿ����';
comment on column AC_SBJ_INFO.sbjinvalidid
  is '������Ŀ����';
comment on column AC_SBJ_INFO.psbjinvalidid
  is '����Ŀ����';
comment on column AC_SBJ_INFO.creater
  is '�����˱���';
comment on column AC_SBJ_INFO.createdate
  is '����ʱ��';
comment on column AC_SBJ_INFO.isoutsidesbjid
  is '�Ƿ�����Ŀ';
comment on column AC_SBJ_INFO.mastertableprj
  is '������Ŀ';
comment on column AC_SBJ_INFO.scheduleproject
  is '������Ŀ';
comment on column AC_SBJ_INFO.description
  is '��������';
comment on column AC_SBJ_INFO.creator_id
  is '������id';
comment on column AC_SBJ_INFO.creator
  is '������';
comment on column AC_SBJ_INFO.create_date
  is '��������';
comment on column AC_SBJ_INFO.modifiedby
  is '�޸���';
comment on column AC_SBJ_INFO.modifiedby_id
  is '�޸���id';
comment on column AC_SBJ_INFO.modified_date
  is '�޸�����';
comment on column AC_SBJ_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_SBJ_INFO.version
  is '�汾��';
comment on column AC_SBJ_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_SBJ_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_SBJ_INFO.bus_date
  is 'ҵ������';
comment on column AC_SBJ_INFO.exa_remarks
  is '������ע';
comment on column AC_SBJ_INFO.src_system
  is '��Դϵͳ';
comment on column AC_SBJ_INFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table AC_SUPP_INFO
prompt ===========================
prompt
create table AC_SUPP_INFO
(
  suppcode               VARCHAR2(255),
  suppname               VARCHAR2(255),
  unitrole               INTEGER,
  legalperson            VARCHAR2(255),
  unitnature             INTEGER,
  provincecity           VARCHAR2(255),
  regeditaddress         VARCHAR2(255),
  bank                   VARCHAR2(255),
  bankaccount            VARCHAR2(255),
  bussinesslicence       VARCHAR2(255),
  whichindustry          VARCHAR2(255),
  orgcode                VARCHAR2(255),
  areataxnum             VARCHAR2(255),
  nationtaxnum           VARCHAR2(255),
  address                VARCHAR2(255),
  postalcode             VARCHAR2(255),
  phone                  VARCHAR2(255),
  fax                    VARCHAR2(255),
  email                  VARCHAR2(255),
  homepage               VARCHAR2(255),
  supp_description       VARCHAR2(255),
  status                 VARCHAR2(255),
  ispassiso              INTEGER,
  unitcredit             INTEGER,
  regeditcapital         INTEGER,
  assetscapital          INTEGER,
  flowcapital            INTEGER,
  yearsellamount         INTEGER,
  fatorynum              INTEGER,
  fatoryaddress          VARCHAR2(255),
  fatoryphone            VARCHAR2(255),
  prjfax                 VARCHAR2(255),
  employeenum            INTEGER,
  technicalstaffnum      INTEGER,
  managementstaffnum     INTEGER,
  suppcertification      INTEGER,
  suppothercertification INTEGER,
  productcode            INTEGER,
  productname            VARCHAR2(255),
  productusage           VARCHAR2(255),
  specification          VARCHAR2(255),
  model                  VARCHAR2(255),
  budgetprice            INTEGER,
  purchaseadvance        INTEGER,
  arrivaladvance         INTEGER,
  purchasecycle          INTEGER,
  feetype                VARCHAR2(255),
  contcode               INTEGER,
  contname               VARCHAR2(255),
  performanceevaluation  VARCHAR2(255),
  biddate                DATE,
  biddingresults         INTEGER,
  emp_code               INTEGER,
  emp_name               VARCHAR2(255),
  emp_cardcode           VARCHAR2(255),
  emp_sex                VARCHAR2(255),
  emp_job                VARCHAR2(255),
  emp_title              VARCHAR2(255),
  emp_dept               VARCHAR2(255),
  emp_call               VARCHAR2(255),
  emp_role               VARCHAR2(255),
  emp_phone              VARCHAR2(255),
  emp_fax                VARCHAR2(255),
  emp_email              VARCHAR2(255),
  emp_address            VARCHAR2(255),
  emp_postcode           VARCHAR2(255),
  emp_mobile             VARCHAR2(255),
  emp_homecall           VARCHAR2(255),
  emp_photo              VARCHAR2(255),
  description            VARCHAR2(120),
  creator_id             VARCHAR2(120),
  creator                VARCHAR2(120),
  create_date            DATE,
  modifiedby             VARCHAR2(120),
  modifiedby_id          VARCHAR2(120),
  modified_date          DATE,
  version_status         INTEGER,
  version                INTEGER,
  latestversion          INTEGER,
  approvalstae           INTEGER,
  bus_date               DATE,
  exa_remarks            VARCHAR2(500),
  src_table              VARCHAR2(255),
  src_system             VARCHAR2(255),
  sort_id                NUMBER(38)
)
;
comment on table AC_SUPP_INFO
  is '��Ӧ�̻�����Ϣ��';
comment on column AC_SUPP_INFO.suppcode
  is '��Ӧ�̴���';
comment on column AC_SUPP_INFO.suppname
  is '��Ӧ������';
comment on column AC_SUPP_INFO.unitrole
  is '��λ��ɫ';
comment on column AC_SUPP_INFO.legalperson
  is '���˴���';
comment on column AC_SUPP_INFO.unitnature
  is '��λ����';
comment on column AC_SUPP_INFO.provincecity
  is '����ʡ��';
comment on column AC_SUPP_INFO.regeditaddress
  is 'ע���ַ';
comment on column AC_SUPP_INFO.bank
  is '��������';
comment on column AC_SUPP_INFO.bankaccount
  is '�����˺�';
comment on column AC_SUPP_INFO.bussinesslicence
  is 'Ӫҵִ�պ�';
comment on column AC_SUPP_INFO.whichindustry
  is '������ҵ';
comment on column AC_SUPP_INFO.orgcode
  is '��֯��������֤';
comment on column AC_SUPP_INFO.areataxnum
  is '��˰�ǼǺ�';
comment on column AC_SUPP_INFO.nationtaxnum
  is '��˰�ǼǺ�';
comment on column AC_SUPP_INFO.address
  is 'ͨѶ��ַ';
comment on column AC_SUPP_INFO.postalcode
  is '��������';
comment on column AC_SUPP_INFO.phone
  is '�绰����';
comment on column AC_SUPP_INFO.fax
  is '�������';
comment on column AC_SUPP_INFO.email
  is '�����ʼ�';
comment on column AC_SUPP_INFO.homepage
  is '��˾��ҳ';
comment on column AC_SUPP_INFO.supp_description
  is '��˾���';
comment on column AC_SUPP_INFO.status
  is '��Ӧ��״̬/���״̬';
comment on column AC_SUPP_INFO.ispassiso
  is '�Ƿ�ͨ��ISO';
comment on column AC_SUPP_INFO.unitcredit
  is '��λ����';
comment on column AC_SUPP_INFO.regeditcapital
  is 'ע���ʱ�';
comment on column AC_SUPP_INFO.assetscapital
  is '�̶��ʲ�';
comment on column AC_SUPP_INFO.flowcapital
  is '�����ʽ�';
comment on column AC_SUPP_INFO.yearsellamount
  is '�����۶�';
comment on column AC_SUPP_INFO.fatorynum
  is '��������';
comment on column AC_SUPP_INFO.fatoryaddress
  is '������ַ';
comment on column AC_SUPP_INFO.fatoryphone
  is '�����绰';
comment on column AC_SUPP_INFO.prjfax
  is '���̴���';
comment on column AC_SUPP_INFO.employeenum
  is '��˾Ա������';
comment on column AC_SUPP_INFO.technicalstaffnum
  is '������Ա����';
comment on column AC_SUPP_INFO.managementstaffnum
  is '������Ա����';
comment on column AC_SUPP_INFO.suppcertification
  is '��Ӧ������';
comment on column AC_SUPP_INFO.suppothercertification
  is '��Ӧ������רҵ��';
comment on column AC_SUPP_INFO.productcode
  is '��Ʒ����';
comment on column AC_SUPP_INFO.productname
  is '��Ʒ����';
comment on column AC_SUPP_INFO.productusage
  is '��Ʒʹ�����';
comment on column AC_SUPP_INFO.specification
  is '���';
comment on column AC_SUPP_INFO.model
  is '�ͺ�';
comment on column AC_SUPP_INFO.budgetprice
  is 'Ԥ��۸�';
comment on column AC_SUPP_INFO.purchaseadvance
  is '�ɹ���ǰ��';
comment on column AC_SUPP_INFO.arrivaladvance
  is '������ǰ��';
comment on column AC_SUPP_INFO.purchasecycle
  is 'PurchaseCycle';
comment on column AC_SUPP_INFO.feetype
  is '�������';
comment on column AC_SUPP_INFO.emp_code
  is '��Ա���';
comment on column AC_SUPP_INFO.emp_name
  is '����';
comment on column AC_SUPP_INFO.emp_cardcode
  is '����';
comment on column AC_SUPP_INFO.emp_sex
  is '�Ա�';
comment on column AC_SUPP_INFO.emp_job
  is 'ְ��';
comment on column AC_SUPP_INFO.emp_title
  is 'ְ��';
comment on column AC_SUPP_INFO.emp_dept
  is '������Ϣ';
comment on column AC_SUPP_INFO.emp_call
  is '�ƺ�';
comment on column AC_SUPP_INFO.emp_role
  is '��ɫ';
comment on column AC_SUPP_INFO.emp_phone
  is '�칫�绰';
comment on column AC_SUPP_INFO.emp_fax
  is '����';
comment on column AC_SUPP_INFO.emp_email
  is '�����ʼ�';
comment on column AC_SUPP_INFO.emp_address
  is '��ַ';
comment on column AC_SUPP_INFO.emp_postcode
  is '��������';
comment on column AC_SUPP_INFO.emp_mobile
  is '�ƶ��绰';
comment on column AC_SUPP_INFO.emp_homecall
  is '��ͥ�绰';
comment on column AC_SUPP_INFO.description
  is '��������';
comment on column AC_SUPP_INFO.creator_id
  is '������id';
comment on column AC_SUPP_INFO.creator
  is '������';
comment on column AC_SUPP_INFO.create_date
  is '��������';
comment on column AC_SUPP_INFO.modifiedby
  is '�޸���';
comment on column AC_SUPP_INFO.modifiedby_id
  is '�޸���id';
comment on column AC_SUPP_INFO.modified_date
  is '�޸�����';
comment on column AC_SUPP_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column AC_SUPP_INFO.version
  is '�汾��';
comment on column AC_SUPP_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column AC_SUPP_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column AC_SUPP_INFO.bus_date
  is 'ҵ������';
comment on column AC_SUPP_INFO.exa_remarks
  is '������ע';
comment on column AC_SUPP_INFO.src_system
  is '��Դϵͳ';
comment on column AC_SUPP_INFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table CONT_BUILDINGSSELL
prompt =================================
prompt
create table CONT_BUILDINGSSELL
(
  id                         NUMBER,
  sid                        NUMBER,
  contid                     NUMBER,
  stockcontid                VARCHAR2(255),
  landlinencename            VARCHAR2(255),
  landlinencecode            VARCHAR2(255),
  landlinencearea            NUMBER,
  landlinenceunit            VARCHAR2(255),
  landlinencedate            DATE,
  prjplanlinencename         VARCHAR2(255),
  prjplanlinencecode         VARCHAR2(255),
  prjplanlinencearea         NUMBER,
  prjplanlinenceunit         VARCHAR2(255),
  prjplanlinencedate         DATE,
  prjplanlinenceperiod       NUMBER,
  prjconstlinence            VARCHAR2(255),
  prjconstlinencecunit       VARCHAR2(255),
  prjconstlinencedate        DATE,
  prjconstlinenceunit        VARCHAR2(255),
  landusecertificate         VARCHAR2(255),
  landuseperiod              NUMBER,
  landcertificatenum         VARCHAR2(255),
  landdevelopusing           VARCHAR2(255),
  landusecertificatearea     NUMBER,
  landusecertificatecunit    VARCHAR2(255),
  preselllinence             VARCHAR2(255),
  preselllinenceperiod       DATE,
  preselllinenceunit         VARCHAR2(255),
  presellprojectname         VARCHAR2(255),
  presellprojectaddress      VARCHAR2(255),
  presellprojectusing        VARCHAR2(255),
  presellobjectid            NUMBER,
  presellobject              VARCHAR2(255),
  presellnumber              NUMBER,
  preselltotalarea           NUMBER,
  projectareas               VARCHAR2(255),
  projectlandlevel           VARCHAR2(255),
  developunit                VARCHAR2(255),
  unitcharater               VARCHAR2(255),
  unitaddress                VARCHAR2(255),
  legalperson                VARCHAR2(255),
  projectmanager             VARCHAR2(255),
  contactphone               VARCHAR2(255),
  capitalregulationbank      VARCHAR2(255),
  capitalregulationaccount   VARCHAR2(255),
  buildingname               VARCHAR2(255),
  buildingnumber             VARCHAR2(255),
  buildingunitnumber         VARCHAR2(255),
  housenumber                VARCHAR2(255),
  housecode                  VARCHAR2(255),
  contructionarea            NUMBER,
  publicarea                 NUMBER,
  privatearea                NUMBER,
  huxingid                   NUMBER,
  huxing                     VARCHAR2(255),
  toiletid                   NUMBER,
  toilet                     VARCHAR2(255),
  balconyid                  NUMBER,
  balcony                    VARCHAR2(255),
  propertytypeid             NUMBER,
  propertytype               VARCHAR2(255),
  preselltotalamount         NUMBER,
  housestatus                VARCHAR2(255),
  wherehouse                 VARCHAR2(255),
  whencreate                 VARCHAR2(255),
  structure                  VARCHAR2(255),
  bulidtotalfloots           NUMBER,
  floots                     NUMBER,
  housecharaterid            NUMBER,
  housecharater              VARCHAR2(255),
  flootheight                VARCHAR2(255),
  sellername                 VARCHAR2(255),
  bussinesslinence           VARCHAR2(255),
  sellerlegalperson          VARCHAR2(255),
  authorizeperson            VARCHAR2(255),
  certificationlevel         VARCHAR2(255),
  sellercontactphone         VARCHAR2(255),
  isclient                   VARCHAR2(255),
  clientname                 VARCHAR2(255),
  clientlegalperson          VARCHAR2(255),
  sellercontactaddress       VARCHAR2(255),
  sellerbank                 VARCHAR2(255),
  sellerbankaccount          VARCHAR2(255),
  buyername                  VARCHAR2(255),
  buyername2                 VARCHAR2(255),
  buyercertification         VARCHAR2(255),
  certificationnum           VARCHAR2(255),
  buyercontactphone          VARCHAR2(255),
  buyercontactaddress        VARCHAR2(255),
  buyersex                   VARCHAR2(255),
  buyernationality           VARCHAR2(255),
  buyernation                VARCHAR2(255),
  payoffmode                 VARCHAR2(255),
  contcode                   VARCHAR2(255),
  contracttime               DATE,
  contbackuptime             DATE,
  firstpay                   NUMBER,
  firstpayratio              NUMBER,
  loanamount                 NUMBER,
  loanperiod                 NUMBER,
  fundloan                   NUMBER,
  bussinessloan              NUMBER,
  paymentaccount             VARCHAR2(255),
  accountbank                VARCHAR2(255),
  sellprice                  NUMBER,
  selltotalamount            NUMBER,
  areasupplement             NUMBER,
  getintime                  DATE,
  propertyfeestandand        NUMBER,
  propertyunitname           VARCHAR2(255),
  propertylegalperson        VARCHAR2(255),
  propertybussinessnum       VARCHAR2(255),
  propertycertificationlevel VARCHAR2(255),
  propertymanagementperiod   NUMBER,
  createpersonid             NUMBER,
  createperson               VARCHAR2(255),
  createtime                 DATE,
  sbjstate                   NUMBER,
  description                VARCHAR2(255),
  creator_id                 VARCHAR2(120),
  creator                    VARCHAR2(120),
  create_date                DATE,
  modifiedby                 VARCHAR2(120),
  modifiedby_id              VARCHAR2(120),
  modified_date              DATE,
  version_status             NUMBER,
  version                    NUMBER,
  latestversion              NUMBER,
  approvalstae               NUMBER,
  bus_date                   DATE,
  exa_remarks                VARCHAR2(500)
)
;
comment on table CONT_BUILDINGSSELL
  is '�������ۺ�ͬ��';
comment on column CONT_BUILDINGSSELL.id
  is 'ID';
comment on column CONT_BUILDINGSSELL.sid
  is 'ԭϵͳID';
comment on column CONT_BUILDINGSSELL.contid
  is 'ContID';
comment on column CONT_BUILDINGSSELL.stockcontid
  is '��ͬ���2';
comment on column CONT_BUILDINGSSELL.landlinencename
  is '�����õع滮���֤����';
comment on column CONT_BUILDINGSSELL.landlinencecode
  is '�����õع滮���֤���';
comment on column CONT_BUILDINGSSELL.landlinencearea
  is '�����õع滮���֤���';
comment on column CONT_BUILDINGSSELL.landlinenceunit
  is '�����õع滮���֤��֤��λ';
comment on column CONT_BUILDINGSSELL.landlinencedate
  is '�����õع滮���֤����';
comment on column CONT_BUILDINGSSELL.prjplanlinencename
  is '���蹤�̹滮���֤����';
comment on column CONT_BUILDINGSSELL.prjplanlinencecode
  is '���蹤�̹滮���֤���';
comment on column CONT_BUILDINGSSELL.prjplanlinencearea
  is '���蹤�̹滮���֤���';
comment on column CONT_BUILDINGSSELL.prjplanlinenceunit
  is '���蹤�̹滮���֤��֤��λ';
comment on column CONT_BUILDINGSSELL.prjplanlinencedate
  is '���蹤�̹滮���֤����';
comment on column CONT_BUILDINGSSELL.prjplanlinenceperiod
  is '���蹤�̹滮���֤����';
comment on column CONT_BUILDINGSSELL.prjconstlinence
  is '��������ʩ�����֤';
comment on column CONT_BUILDINGSSELL.prjconstlinencecunit
  is '��������ʩ����֤��λ';
comment on column CONT_BUILDINGSSELL.prjconstlinencedate
  is '��������ʩ����֤����';
comment on column CONT_BUILDINGSSELL.prjconstlinenceunit
  is '��������ʩ����λ';
comment on column CONT_BUILDINGSSELL.landusecertificate
  is '����ʹ��֤';
comment on column CONT_BUILDINGSSELL.landuseperiod
  is '����ʹ������';
comment on column CONT_BUILDINGSSELL.landcertificatenum
  is '����֤���';
comment on column CONT_BUILDINGSSELL.landdevelopusing
  is '���ؿ�����;';
comment on column CONT_BUILDINGSSELL.landusecertificatearea
  is '����ʹ��֤�������';
comment on column CONT_BUILDINGSSELL.landusecertificatecunit
  is '����ʹ��֤��֤��λ';
comment on column CONT_BUILDINGSSELL.preselllinence
  is '��Ʒ��Ԥ�����֤';
comment on column CONT_BUILDINGSSELL.preselllinenceperiod
  is 'Ԥ���������';
comment on column CONT_BUILDINGSSELL.preselllinenceunit
  is '��Ʒ��Ԥ�۷�֤��λ';
comment on column CONT_BUILDINGSSELL.presellprojectname
  is 'Ԥ����Ŀ����';
comment on column CONT_BUILDINGSSELL.presellprojectaddress
  is 'Ԥ����Ŀ��ַ';
comment on column CONT_BUILDINGSSELL.presellprojectusing
  is 'Ԥ�۷�����;';
comment on column CONT_BUILDINGSSELL.presellobjectid
  is 'Ԥ�۶���ID';
comment on column CONT_BUILDINGSSELL.presellobject
  is 'Ԥ�۶���';
comment on column CONT_BUILDINGSSELL.presellnumber
  is 'Ԥ������';
comment on column CONT_BUILDINGSSELL.preselltotalarea
  is 'Ԥ�������';
comment on column CONT_BUILDINGSSELL.projectareas
  is '��Ŀ��������';
comment on column CONT_BUILDINGSSELL.projectlandlevel
  is '��Ŀ�õصȼ�';
comment on column CONT_BUILDINGSSELL.developunit
  is '������˾';
comment on column CONT_BUILDINGSSELL.unitcharater
  is '��λ����';
comment on column CONT_BUILDINGSSELL.unitaddress
  is '��˾��ַ';
comment on column CONT_BUILDINGSSELL.legalperson
  is '���˴���';
comment on column CONT_BUILDINGSSELL.projectmanager
  is '��Ŀ������';
comment on column CONT_BUILDINGSSELL.contactphone
  is '��ϵ�绰';
comment on column CONT_BUILDINGSSELL.capitalregulationbank
  is '�ʽ�������';
comment on column CONT_BUILDINGSSELL.capitalregulationaccount
  is '�ʽ����˺�';
comment on column CONT_BUILDINGSSELL.buildingname
  is '¥������';
comment on column CONT_BUILDINGSSELL.buildingnumber
  is '����';
comment on column CONT_BUILDINGSSELL.buildingunitnumber
  is '��Ԫ��';
comment on column CONT_BUILDINGSSELL.housenumber
  is '����';
comment on column CONT_BUILDINGSSELL.housecode
  is '���ݱ��';
comment on column CONT_BUILDINGSSELL.contructionarea
  is '�������';
comment on column CONT_BUILDINGSSELL.publicarea
  is '�������';
comment on column CONT_BUILDINGSSELL.privatearea
  is '�������';
comment on column CONT_BUILDINGSSELL.huxingid
  is '����ID';
comment on column CONT_BUILDINGSSELL.huxing
  is '����';
comment on column CONT_BUILDINGSSELL.toiletid
  is '������ID';
comment on column CONT_BUILDINGSSELL.toilet
  is '������';
comment on column CONT_BUILDINGSSELL.balconyid
  is '��̨ID';
comment on column CONT_BUILDINGSSELL.balcony
  is '��̨';
comment on column CONT_BUILDINGSSELL.propertytypeid
  is '��ҵ����ID';
comment on column CONT_BUILDINGSSELL.propertytype
  is '��ҵ����';
comment on column CONT_BUILDINGSSELL.preselltotalamount
  is 'Ԥ���ܽ��';
comment on column CONT_BUILDINGSSELL.housestatus
  is '����״̬';
comment on column CONT_BUILDINGSSELL.wherehouse
  is '��������';
comment on column CONT_BUILDINGSSELL.whencreate
  is '�������';
comment on column CONT_BUILDINGSSELL.structure
  is '�ṹ';
comment on column CONT_BUILDINGSSELL.bulidtotalfloots
  is '�����ܲ���';
comment on column CONT_BUILDINGSSELL.floots
  is '���ڲ���';
comment on column CONT_BUILDINGSSELL.housecharaterid
  is '��������ID';
comment on column CONT_BUILDINGSSELL.housecharater
  is '��������';
comment on column CONT_BUILDINGSSELL.flootheight
  is '���';
comment on column CONT_BUILDINGSSELL.sellername
  is '��������';
comment on column CONT_BUILDINGSSELL.bussinesslinence
  is 'Ӫҵִ�պ�';
comment on column CONT_BUILDINGSSELL.sellerlegalperson
  is '�������˴���';
comment on column CONT_BUILDINGSSELL.authorizeperson
  is '���˴���';
comment on column CONT_BUILDINGSSELL.certificationlevel
  is '��Ȩ����';
comment on column CONT_BUILDINGSSELL.sellercontactphone
  is '���ʵȼ�';
comment on column CONT_BUILDINGSSELL.isclient
  is '��ϵ�绰';
comment on column CONT_BUILDINGSSELL.clientname
  is '��ϵ�绰';
comment on column CONT_BUILDINGSSELL.clientlegalperson
  is '�Ƿ�ί�д���';
comment on column CONT_BUILDINGSSELL.sellercontactaddress
  is 'ί�д���������';
comment on column CONT_BUILDINGSSELL.sellerbank
  is 'ί�д����˷��˴���';
comment on column CONT_BUILDINGSSELL.sellerbankaccount
  is '������ϵ��ַ';
comment on column CONT_BUILDINGSSELL.buyername
  is '����������';
comment on column CONT_BUILDINGSSELL.buyername2
  is '�����������ʺ�';
comment on column CONT_BUILDINGSSELL.buyercertification
  is '������';
comment on column CONT_BUILDINGSSELL.certificationnum
  is '������������Ȩ�ˣ�';
comment on column CONT_BUILDINGSSELL.buyercontactphone
  is '��֤��';
comment on column CONT_BUILDINGSSELL.buyercontactaddress
  is '֤������';
comment on column CONT_BUILDINGSSELL.buyersex
  is '����ϵ�绰';
comment on column CONT_BUILDINGSSELL.buyernationality
  is '����ϵ��ַ';
comment on column CONT_BUILDINGSSELL.buyernation
  is '���ձ�';
comment on column CONT_BUILDINGSSELL.payoffmode
  is '�򷽹���';
comment on column CONT_BUILDINGSSELL.contcode
  is '������';
comment on column CONT_BUILDINGSSELL.contracttime
  is '���ʽ';
comment on column CONT_BUILDINGSSELL.contbackuptime
  is '��ͬ���';
comment on column CONT_BUILDINGSSELL.firstpay
  is '��ͬǩ��ʱ��';
comment on column CONT_BUILDINGSSELL.firstpayratio
  is '��ͬ����ʱ��';
comment on column CONT_BUILDINGSSELL.loanamount
  is '�׸����';
comment on column CONT_BUILDINGSSELL.loanperiod
  is '�׸������';
comment on column CONT_BUILDINGSSELL.fundloan
  is '������';
comment on column CONT_BUILDINGSSELL.bussinessloan
  is '��������';
comment on column CONT_BUILDINGSSELL.paymentaccount
  is '���������';
comment on column CONT_BUILDINGSSELL.accountbank
  is '��ҵ����';
comment on column CONT_BUILDINGSSELL.sellprice
  is '�����ʻ�';
comment on column CONT_BUILDINGSSELL.selltotalamount
  is '��������';
comment on column CONT_BUILDINGSSELL.areasupplement
  is '���۵���';
comment on column CONT_BUILDINGSSELL.getintime
  is '�����ܼ�';
comment on column CONT_BUILDINGSSELL.propertyfeestandand
  is '�������';
comment on column CONT_BUILDINGSSELL.propertyunitname
  is '���ʱ��';
comment on column CONT_BUILDINGSSELL.propertylegalperson
  is '��ҵ�ѱ�׼';
comment on column CONT_BUILDINGSSELL.propertybussinessnum
  is '��ҵ��˾����';
comment on column CONT_BUILDINGSSELL.propertycertificationlevel
  is '��ҵ��˾���˴���';
comment on column CONT_BUILDINGSSELL.propertymanagementperiod
  is 'Ӫҵִ�պ�';
comment on column CONT_BUILDINGSSELL.createpersonid
  is 'Ӫҵִ�պ�';
comment on column CONT_BUILDINGSSELL.createperson
  is '���ʵȼ�';
comment on column CONT_BUILDINGSSELL.createtime
  is '���ʵȼ�';
comment on column CONT_BUILDINGSSELL.sbjstate
  is '��ҵ�����ͬ����';
comment on column CONT_BUILDINGSSELL.description
  is '��������';
comment on column CONT_BUILDINGSSELL.creator_id
  is '������id';
comment on column CONT_BUILDINGSSELL.creator
  is '������';
comment on column CONT_BUILDINGSSELL.create_date
  is '��������';
comment on column CONT_BUILDINGSSELL.modifiedby
  is '�޸���';
comment on column CONT_BUILDINGSSELL.modifiedby_id
  is '�޸���id';
comment on column CONT_BUILDINGSSELL.modified_date
  is '�޸�����';
comment on column CONT_BUILDINGSSELL.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CONT_BUILDINGSSELL.version
  is '�汾��';
comment on column CONT_BUILDINGSSELL.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column CONT_BUILDINGSSELL.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column CONT_BUILDINGSSELL.bus_date
  is 'ҵ������';
comment on column CONT_BUILDINGSSELL.exa_remarks
  is '������ע';

prompt
prompt Creating table CONT_BUYLANDPAYOFFDETAIL
prompt =======================================
prompt
create table CONT_BUYLANDPAYOFFDETAIL
(
  id             NUMBER,
  sid            NUMBER,
  buyinfoid      NUMBER,
  areanum        VARCHAR2(255),
  landnum        VARCHAR2(255),
  area           NUMBER,
  planpayoff     NUMBER,
  landtype       VARCHAR2(255),
  payoffitem     VARCHAR2(255),
  nowpayoff      NUMBER,
  totalpayoff    NUMBER,
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
comment on table CONT_BUYLANDPAYOFFDETAIL
  is '֧����ϸ��';
comment on column CONT_BUYLANDPAYOFFDETAIL.id
  is 'ID';
comment on column CONT_BUYLANDPAYOFFDETAIL.sid
  is 'ԭϵͳID';
comment on column CONT_BUYLANDPAYOFFDETAIL.buyinfoid
  is 'BuyInfoId';
comment on column CONT_BUYLANDPAYOFFDETAIL.areanum
  is '������';
comment on column CONT_BUYLANDPAYOFFDETAIL.landnum
  is '�ؿ���';
comment on column CONT_BUYLANDPAYOFFDETAIL.area
  is '���';
comment on column CONT_BUYLANDPAYOFFDETAIL.planpayoff
  is '�ƻ�֧�����';
comment on column CONT_BUYLANDPAYOFFDETAIL.landtype
  is '��������';
comment on column CONT_BUYLANDPAYOFFDETAIL.payoffitem
  is '֧����Ŀ';
comment on column CONT_BUYLANDPAYOFFDETAIL.nowpayoff
  is '����֧�����';
comment on column CONT_BUYLANDPAYOFFDETAIL.totalpayoff
  is '�ۼ�֧�����';
comment on column CONT_BUYLANDPAYOFFDETAIL.description
  is '��������';
comment on column CONT_BUYLANDPAYOFFDETAIL.creator_id
  is '������id';
comment on column CONT_BUYLANDPAYOFFDETAIL.creator
  is '������';
comment on column CONT_BUYLANDPAYOFFDETAIL.create_date
  is '��������';
comment on column CONT_BUYLANDPAYOFFDETAIL.modifiedby
  is '�޸���';
comment on column CONT_BUYLANDPAYOFFDETAIL.modifiedby_id
  is '�޸���id';
comment on column CONT_BUYLANDPAYOFFDETAIL.modified_date
  is '�޸�����';
comment on column CONT_BUYLANDPAYOFFDETAIL.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CONT_BUYLANDPAYOFFDETAIL.version
  is '�汾��';
comment on column CONT_BUYLANDPAYOFFDETAIL.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column CONT_BUYLANDPAYOFFDETAIL.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column CONT_BUYLANDPAYOFFDETAIL.bus_date
  is 'ҵ������';
comment on column CONT_BUYLANDPAYOFFDETAIL.exa_remarks
  is '������ע';

prompt
prompt Creating table CONT_BUYLANDPAYOFFINFO
prompt =====================================
prompt
create table CONT_BUYLANDPAYOFFINFO
(
  id             NUMBER,
  sid            NUMBER,
  edetailid      NUMBER,
  approvenum     VARCHAR2(255),
  approvedate    DATE,
  prjcode        VARCHAR2(255),
  prjname        VARCHAR2(255),
  ownerunit      VARCHAR2(255),
  createrunit    VARCHAR2(255),
  payofflimit    NUMBER,
  whichtimes     NUMBER,
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
comment on table CONT_BUYLANDPAYOFFINFO
  is '����֧����Ϣ��';
comment on column CONT_BUYLANDPAYOFFINFO.id
  is 'ID';
comment on column CONT_BUYLANDPAYOFFINFO.sid
  is 'ԭϵͳID';
comment on column CONT_BUYLANDPAYOFFINFO.edetailid
  is 'EDetailID';
comment on column CONT_BUYLANDPAYOFFINFO.approvenum
  is '��׼�ĺ�';
comment on column CONT_BUYLANDPAYOFFINFO.approvedate
  is '��׼ʱ��';
comment on column CONT_BUYLANDPAYOFFINFO.prjcode
  is '��Ŀ���';
comment on column CONT_BUYLANDPAYOFFINFO.prjname
  is '��Ŀ����';
comment on column CONT_BUYLANDPAYOFFINFO.ownerunit
  is 'ҵ����λ';
comment on column CONT_BUYLANDPAYOFFINFO.createrunit
  is '���λ';
comment on column CONT_BUYLANDPAYOFFINFO.payofflimit
  is '֧�����';
comment on column CONT_BUYLANDPAYOFFINFO.whichtimes
  is '��_�θ���';
comment on column CONT_BUYLANDPAYOFFINFO.description
  is '��������';
comment on column CONT_BUYLANDPAYOFFINFO.creator_id
  is '������id';
comment on column CONT_BUYLANDPAYOFFINFO.creator
  is '������';
comment on column CONT_BUYLANDPAYOFFINFO.create_date
  is '��������';
comment on column CONT_BUYLANDPAYOFFINFO.modifiedby
  is '�޸���';
comment on column CONT_BUYLANDPAYOFFINFO.modifiedby_id
  is '�޸���id';
comment on column CONT_BUYLANDPAYOFFINFO.modified_date
  is '�޸�����';
comment on column CONT_BUYLANDPAYOFFINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CONT_BUYLANDPAYOFFINFO.version
  is '�汾��';
comment on column CONT_BUYLANDPAYOFFINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column CONT_BUYLANDPAYOFFINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column CONT_BUYLANDPAYOFFINFO.bus_date
  is 'ҵ������';
comment on column CONT_BUYLANDPAYOFFINFO.exa_remarks
  is '������ע';

prompt
prompt Creating table CONT_DETAIL
prompt ==========================
prompt
create table CONT_DETAIL
(
  id                NUMBER,
  sid               NUMBER,
  contid            NUMBER,
  stockcontid       VARCHAR2(255),
  payitemcode       VARCHAR2(255),
  payitemname       VARCHAR2(255),
  contnum           NUMBER,
  contunit          NUMBER,
  contcost          NUMBER,
  contratio         NUMBER,
  processrelationid NUMBER,
  processrelation   VARCHAR2(255),
  numctrlid         NUMBER,
  numctrl           VARCHAR2(255),
  standard          VARCHAR2(255),
  countingunit      VARCHAR2(255),
  valuation         VARCHAR2(255),
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
  exa_remarks       VARCHAR2(500)
)
;
comment on table CONT_DETAIL
  is '��ͬ��ϸ��';
comment on column CONT_DETAIL.id
  is 'ID';
comment on column CONT_DETAIL.sid
  is 'ԭϵͳID';
comment on column CONT_DETAIL.contid
  is 'ContID';
comment on column CONT_DETAIL.stockcontid
  is '��ͬ���';
comment on column CONT_DETAIL.payitemcode
  is '֧�������';
comment on column CONT_DETAIL.payitemname
  is '֧��������';
comment on column CONT_DETAIL.contnum
  is '��ͬ����';
comment on column CONT_DETAIL.contunit
  is '��ͬ����';
comment on column CONT_DETAIL.contcost
  is '�������';
comment on column CONT_DETAIL.contratio
  is '֧��ϵ��';
comment on column CONT_DETAIL.processrelationid
  is '���ȹ���ID';
comment on column CONT_DETAIL.processrelation
  is '���ȹ���';
comment on column CONT_DETAIL.numctrlid
  is '��������ID';
comment on column CONT_DETAIL.numctrl
  is '��������';
comment on column CONT_DETAIL.standard
  is '���';
comment on column CONT_DETAIL.countingunit
  is '������λ';
comment on column CONT_DETAIL.valuation
  is '��Լ����';
comment on column CONT_DETAIL.description
  is '��������';
comment on column CONT_DETAIL.creator_id
  is '������id';
comment on column CONT_DETAIL.creator
  is '������';
comment on column CONT_DETAIL.create_date
  is '��������';
comment on column CONT_DETAIL.modifiedby
  is '�޸���';
comment on column CONT_DETAIL.modifiedby_id
  is '�޸���id';
comment on column CONT_DETAIL.modified_date
  is '�޸�����';
comment on column CONT_DETAIL.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CONT_DETAIL.version
  is '�汾��';
comment on column CONT_DETAIL.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column CONT_DETAIL.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column CONT_DETAIL.bus_date
  is 'ҵ������';
comment on column CONT_DETAIL.exa_remarks
  is '������ע';

prompt
prompt Creating table CONT_FULFILLMENT
prompt ===============================
prompt
create table CONT_FULFILLMENT
(
  id             NUMBER,
  sid            NUMBER,
  contprjid      NUMBER,
  areadyfinish   VARCHAR2(255),
  stopworkdays   NUMBER,
  settledamount  NUMBER,
  trialbalance   NUMBER,
  clearingtime   DATE,
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
comment on table CONT_FULFILLMENT
  is '��ͬ���������';
comment on column CONT_FULFILLMENT.id
  is 'ID';
comment on column CONT_FULFILLMENT.sid
  is 'ԭϵͳID';
comment on column CONT_FULFILLMENT.contprjid
  is 'ContPrjID';
comment on column CONT_FULFILLMENT.areadyfinish
  is '����������';
comment on column CONT_FULFILLMENT.stopworkdays
  is 'ͣ������';
comment on column CONT_FULFILLMENT.settledamount
  is '�ѽ�����';
comment on column CONT_FULFILLMENT.trialbalance
  is '�������';
comment on column CONT_FULFILLMENT.clearingtime
  is '����ʱ��';
comment on column CONT_FULFILLMENT.description
  is '��������';
comment on column CONT_FULFILLMENT.creator_id
  is '������id';
comment on column CONT_FULFILLMENT.creator
  is '������';
comment on column CONT_FULFILLMENT.create_date
  is '��������';
comment on column CONT_FULFILLMENT.modifiedby
  is '�޸���';
comment on column CONT_FULFILLMENT.modifiedby_id
  is '�޸���id';
comment on column CONT_FULFILLMENT.modified_date
  is '�޸�����';
comment on column CONT_FULFILLMENT.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CONT_FULFILLMENT.version
  is '�汾��';
comment on column CONT_FULFILLMENT.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column CONT_FULFILLMENT.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column CONT_FULFILLMENT.bus_date
  is 'ҵ������';
comment on column CONT_FULFILLMENT.exa_remarks
  is '������ע';

prompt
prompt Creating table CONT_INFO
prompt ========================
prompt
create table CONT_INFO
(
  id                 NUMBER,
  sid                NUMBER,
  stockcontid        VARCHAR2(255),
  stockcontname      VARCHAR2(255),
  conttypeid         NUMBER,
  conttype           VARCHAR2(255),
  stakeholderid      VARCHAR2(255),
  stakeholder        VARCHAR2(255),
  stakelinkmanid     NUMBER,
  stakelinkman       VARCHAR2(255),
  stakesubdate       DATE,
  stakesignerid      NUMBER,
  stakesigner        VARCHAR2(255),
  associatorid       NUMBER,
  associator         VARCHAR2(255),
  assoclinkmanid     NUMBER,
  assoclinkman       VARCHAR2(255),
  associatedate      DATE,
  associatesignerid  NUMBER,
  associatesigner    VARCHAR2(255),
  associatorid2      NUMBER,
  associator2        VARCHAR2(255),
  assoclinkmanid2    NUMBER,
  assoclinkman2      VARCHAR2(255),
  associatedate2     DATE,
  associatesigner2id NUMBER,
  associatesigner2   VARCHAR2(255),
  contacttypeid      NUMBER,
  contacttype        VARCHAR2(255),
  powertree          VARCHAR2(255),
  sendapprovetypeid  NUMBER,
  sendapprovetype    VARCHAR2(255),
  paytypeid          NUMBER,
  paytype            VARCHAR2(255),
  contractprice      NUMBER,
  moneytypename      VARCHAR2(255),
  moneytype          NUMBER,
  validdate          DATE,
  finishdate         DATE,
  description        VARCHAR2(255),
  creator_id         VARCHAR2(120),
  creator            VARCHAR2(120),
  create_date        DATE,
  modifiedby         VARCHAR2(120),
  modifiedby_id      VARCHAR2(120),
  modified_date      DATE,
  version_status     NUMBER,
  version            NUMBER,
  latestversion      NUMBER,
  approvalstae       NUMBER,
  bus_date           DATE,
  exa_remarks        VARCHAR2(500)
)
;
comment on table CONT_INFO
  is '��ͬ������Ϣ��';
comment on column CONT_INFO.id
  is 'ID ';
comment on column CONT_INFO.sid
  is 'ԭϵͳID ';
comment on column CONT_INFO.stockcontid
  is '��ͬ��� ';
comment on column CONT_INFO.stockcontname
  is '��ͬ���� ';
comment on column CONT_INFO.conttypeid
  is '��ͬ״̬ID ';
comment on column CONT_INFO.conttype
  is '��ͬ״̬ ';
comment on column CONT_INFO.stakeholderid
  is '��ͬ�׷�ID ';
comment on column CONT_INFO.stakeholder
  is '��ͬ�׷� ';
comment on column CONT_INFO.stakelinkmanid
  is '��ͬ�׷���ϵ��ID ';
comment on column CONT_INFO.stakelinkman
  is '��ͬ�׷���ϵ�� ';
comment on column CONT_INFO.stakesubdate
  is '��ͬ�׷�ǩ������ ';
comment on column CONT_INFO.stakesignerid
  is '��ͬ�׷�ǩ����ID ';
comment on column CONT_INFO.stakesigner
  is '��ͬ�׷�ǩ���� ';
comment on column CONT_INFO.associatorid
  is '��ͬ�ҷ�ID ';
comment on column CONT_INFO.associator
  is '��ͬ�ҷ� ';
comment on column CONT_INFO.assoclinkmanid
  is '��ͬ�ҷ���ϵ��ID ';
comment on column CONT_INFO.assoclinkman
  is '��ͬ�ҷ���ϵ�� ';
comment on column CONT_INFO.associatedate
  is '��ͬ�ҷ�ǩ������ ';
comment on column CONT_INFO.associatesignerid
  is '��ͬ�ҷ�ǩ����ID ';
comment on column CONT_INFO.associatesigner
  is '��ͬ�ҷ�ǩ���� ';
comment on column CONT_INFO.associatorid2
  is '��ͬ����ID ';
comment on column CONT_INFO.associator2
  is '��ͬ���� ';
comment on column CONT_INFO.assoclinkmanid2
  is '��ͬ������ϵ��ID ';
comment on column CONT_INFO.assoclinkman2
  is '��ͬ������ϵ�� ';
comment on column CONT_INFO.associatedate2
  is '��ͬ����ǩ������ ';
comment on column CONT_INFO.associatesigner2id
  is '��ͬ����ǩ����ID ';
comment on column CONT_INFO.associatesigner2
  is '��ͬ����ǩ���� ';
comment on column CONT_INFO.contacttypeid
  is '��ͬ���ID ';
comment on column CONT_INFO.contacttype
  is '��ͬ��� ';
comment on column CONT_INFO.powertree
  is '����Ȩ���� ';
comment on column CONT_INFO.sendapprovetypeid
  is '�������ID ';
comment on column CONT_INFO.sendapprovetype
  is '������� ';
comment on column CONT_INFO.paytypeid
  is '֧��������ID ';
comment on column CONT_INFO.paytype
  is '֧�������� ';
comment on column CONT_INFO.contractprice
  is '��ͬ��� ';
comment on column CONT_INFO.moneytypename
  is '������ ';
comment on column CONT_INFO.moneytype
  is '���� ';
comment on column CONT_INFO.validdate
  is '��Ч���� ';
comment on column CONT_INFO.finishdate
  is '�깤���� ';
comment on column CONT_INFO.description
  is '��������';
comment on column CONT_INFO.creator_id
  is '������id';
comment on column CONT_INFO.creator
  is '������';
comment on column CONT_INFO.create_date
  is '��������';
comment on column CONT_INFO.modifiedby
  is '�޸���';
comment on column CONT_INFO.modifiedby_id
  is '�޸���id';
comment on column CONT_INFO.modified_date
  is '�޸�����';
comment on column CONT_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CONT_INFO.version
  is '�汾��';
comment on column CONT_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column CONT_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column CONT_INFO.bus_date
  is 'ҵ������';
comment on column CONT_INFO.exa_remarks
  is '������ע';

prompt
prompt Creating table CONT_LANDLEASE
prompt =============================
prompt
create table CONT_LANDLEASE
(
  id               NUMBER,
  sid              NUMBER,
  contid           NUMBER,
  stockcontid      VARCHAR2(255),
  leasename        VARCHAR2(255),
  propertytypeid   NUMBER,
  propertytype     VARCHAR2(255),
  ownership        VARCHAR2(255),
  begintime        DATE,
  endtime          DATE,
  usingunit        VARCHAR2(255),
  legalperson      VARCHAR2(255),
  licensenum       VARCHAR2(255),
  contactperson    VARCHAR2(255),
  contacttel       VARCHAR2(255),
  constructionarea NUMBER,
  leaseprice       NUMBER,
  remark           VARCHAR2(255),
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
  bus_date         DATE,
  exa_remarks      VARCHAR2(500)
)
;
comment on table CONT_LANDLEASE
  is '�������޺�ͬ��';
comment on column CONT_LANDLEASE.id
  is 'ID';
comment on column CONT_LANDLEASE.sid
  is 'ԭϵͳID';
comment on column CONT_LANDLEASE.contid
  is 'ContID';
comment on column CONT_LANDLEASE.stockcontid
  is '��ͬ���';
comment on column CONT_LANDLEASE.leasename
  is '���޺�ͬ����';
comment on column CONT_LANDLEASE.propertytypeid
  is '��ҵ����ID';
comment on column CONT_LANDLEASE.propertytype
  is '��ҵ����';
comment on column CONT_LANDLEASE.ownership
  is '����Ȩ����';
comment on column CONT_LANDLEASE.begintime
  is '��ͬ��ʼ����';
comment on column CONT_LANDLEASE.endtime
  is '��ͬ��ֹ����';
comment on column CONT_LANDLEASE.usingunit
  is 'ʹ�õ�λ';
comment on column CONT_LANDLEASE.legalperson
  is '����������';
comment on column CONT_LANDLEASE.licensenum
  is 'Ӫҵִ�պ���';
comment on column CONT_LANDLEASE.contactperson
  is 'ʹ�õ�λ��ϵ��';
comment on column CONT_LANDLEASE.contacttel
  is '��ϵ�绰';
comment on column CONT_LANDLEASE.constructionarea
  is '�������';
comment on column CONT_LANDLEASE.leaseprice
  is '���ⵥ��';
comment on column CONT_LANDLEASE.remark
  is '��ע';
comment on column CONT_LANDLEASE.description
  is '��������';
comment on column CONT_LANDLEASE.creator_id
  is '������id';
comment on column CONT_LANDLEASE.creator
  is '������';
comment on column CONT_LANDLEASE.create_date
  is '��������';
comment on column CONT_LANDLEASE.modifiedby
  is '�޸���';
comment on column CONT_LANDLEASE.modifiedby_id
  is '�޸���id';
comment on column CONT_LANDLEASE.modified_date
  is '�޸�����';
comment on column CONT_LANDLEASE.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CONT_LANDLEASE.version
  is '�汾��';
comment on column CONT_LANDLEASE.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column CONT_LANDLEASE.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column CONT_LANDLEASE.bus_date
  is 'ҵ������';
comment on column CONT_LANDLEASE.exa_remarks
  is '������ע';

prompt
prompt Creating table CONT_MAKELANDDIGINFO
prompt ===================================
prompt
create table CONT_MAKELANDDIGINFO
(
  id                NUMBER,
  sid               NUMBER,
  mpayoffid         NUMBER,
  areanum           VARCHAR2(255),
  landnum           VARCHAR2(255),
  estimatarea       NUMBER,
  estimatquantity   NUMBER,
  estimatcost       NUMBER,
  completedquantity NUMBER,
  nowpayoff         NUMBER,
  totalpayoff       NUMBER,
  totalquantity     NUMBER,
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
  exa_remarks       VARCHAR2(500)
)
;
comment on table CONT_MAKELANDDIGINFO
  is '���֧���ڷ�����Ϣ';
comment on column CONT_MAKELANDDIGINFO.id
  is 'ID';
comment on column CONT_MAKELANDDIGINFO.sid
  is 'ԭϵͳID';
comment on column CONT_MAKELANDDIGINFO.mpayoffid
  is 'MPayOffID';
comment on column CONT_MAKELANDDIGINFO.areanum
  is '�ڷ���������';
comment on column CONT_MAKELANDDIGINFO.landnum
  is '�ؿ���';
comment on column CONT_MAKELANDDIGINFO.estimatarea
  is 'Ԥ���ڷ����';
comment on column CONT_MAKELANDDIGINFO.estimatquantity
  is 'Ԥ�ƹ�����';
comment on column CONT_MAKELANDDIGINFO.estimatcost
  is 'Ԥ�Ƴɱ�';
comment on column CONT_MAKELANDDIGINFO.completedquantity
  is '������ɹ�����';
comment on column CONT_MAKELANDDIGINFO.nowpayoff
  is '����֧�ֽ��';
comment on column CONT_MAKELANDDIGINFO.totalpayoff
  is '�ۼ�֧�����';
comment on column CONT_MAKELANDDIGINFO.totalquantity
  is '�ۼ���ɹ�����';
comment on column CONT_MAKELANDDIGINFO.description
  is '��������';
comment on column CONT_MAKELANDDIGINFO.creator_id
  is '������id';
comment on column CONT_MAKELANDDIGINFO.creator
  is '������';
comment on column CONT_MAKELANDDIGINFO.create_date
  is '��������';
comment on column CONT_MAKELANDDIGINFO.modifiedby
  is '�޸���';
comment on column CONT_MAKELANDDIGINFO.modifiedby_id
  is '�޸���id';
comment on column CONT_MAKELANDDIGINFO.modified_date
  is '�޸�����';
comment on column CONT_MAKELANDDIGINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CONT_MAKELANDDIGINFO.version
  is '�汾��';
comment on column CONT_MAKELANDDIGINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column CONT_MAKELANDDIGINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column CONT_MAKELANDDIGINFO.bus_date
  is 'ҵ������';
comment on column CONT_MAKELANDDIGINFO.exa_remarks
  is '������ע';

prompt
prompt Creating table CONT_MAKELANDPAYOFFINFO
prompt ======================================
prompt
create table CONT_MAKELANDPAYOFFINFO
(
  id                 NUMBER,
  sid                NUMBER,
  edetailid          NUMBER,
  approvenum         VARCHAR2(255),
  approvedate        DATE,
  prjcode            VARCHAR2(255),
  prjname            VARCHAR2(255),
  contractcode       VARCHAR2(255),
  contractamount     NUMBER,
  projecttimelimit   NUMBER,
  estimatequantities NUMBER,
  workingunit        VARCHAR2(255),
  isdigpayid         NUMBER,
  isdigpay           VARCHAR2(255),
  description        VARCHAR2(255),
  creator_id         VARCHAR2(120),
  creator            VARCHAR2(120),
  create_date        DATE,
  modifiedby         VARCHAR2(120),
  modifiedby_id      VARCHAR2(120),
  modified_date      DATE,
  version_status     NUMBER,
  version            NUMBER,
  latestversion      NUMBER,
  approvalstae       NUMBER,
  bus_date           DATE,
  exa_remarks        VARCHAR2(500)
)
;
comment on table CONT_MAKELANDPAYOFFINFO
  is '���֧����Ϣ��';
comment on column CONT_MAKELANDPAYOFFINFO.id
  is 'ID';
comment on column CONT_MAKELANDPAYOFFINFO.sid
  is 'ԭϵͳID';
comment on column CONT_MAKELANDPAYOFFINFO.edetailid
  is 'EDetailID';
comment on column CONT_MAKELANDPAYOFFINFO.approvenum
  is '��׼�ĺ�';
comment on column CONT_MAKELANDPAYOFFINFO.approvedate
  is '��׼ʱ��';
comment on column CONT_MAKELANDPAYOFFINFO.prjcode
  is '��Ŀ���';
comment on column CONT_MAKELANDPAYOFFINFO.prjname
  is '��Ŀ����';
comment on column CONT_MAKELANDPAYOFFINFO.contractcode
  is '��ͬ���';
comment on column CONT_MAKELANDPAYOFFINFO.contractamount
  is '��ͬ���';
comment on column CONT_MAKELANDPAYOFFINFO.projecttimelimit
  is '���̹���';
comment on column CONT_MAKELANDPAYOFFINFO.estimatequantities
  is 'Ԥ�ƹ�����';
comment on column CONT_MAKELANDPAYOFFINFO.workingunit
  is 'ʩ����λ';
comment on column CONT_MAKELANDPAYOFFINFO.isdigpayid
  is '�Ƿ��ڷ�������ID';
comment on column CONT_MAKELANDPAYOFFINFO.isdigpay
  is '�Ƿ��ڷ�������';
comment on column CONT_MAKELANDPAYOFFINFO.description
  is '��������';
comment on column CONT_MAKELANDPAYOFFINFO.creator_id
  is '������id';
comment on column CONT_MAKELANDPAYOFFINFO.creator
  is '������';
comment on column CONT_MAKELANDPAYOFFINFO.create_date
  is '��������';
comment on column CONT_MAKELANDPAYOFFINFO.modifiedby
  is '�޸���';
comment on column CONT_MAKELANDPAYOFFINFO.modifiedby_id
  is '�޸���id';
comment on column CONT_MAKELANDPAYOFFINFO.modified_date
  is '�޸�����';
comment on column CONT_MAKELANDPAYOFFINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CONT_MAKELANDPAYOFFINFO.version
  is '�汾��';
comment on column CONT_MAKELANDPAYOFFINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column CONT_MAKELANDPAYOFFINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column CONT_MAKELANDPAYOFFINFO.bus_date
  is 'ҵ������';
comment on column CONT_MAKELANDPAYOFFINFO.exa_remarks
  is '������ע';

prompt
prompt Creating table CONT_MCOVERINFO
prompt ==============================
prompt
create table CONT_MCOVERINFO
(
  id             NUMBER,
  sid            NUMBER,
  mpayoffid      NUMBER,
  areanum        VARCHAR2(255),
  landnum        VARCHAR2(255),
  landname       VARCHAR2(255),
  buystonecount  NUMBER,
  costamount     NUMBER,
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
comment on table CONT_MCOVERINFO
  is '֧�������Ϣ��';
comment on column CONT_MCOVERINFO.id
  is 'ID';
comment on column CONT_MCOVERINFO.sid
  is 'ԭϵͳID';
comment on column CONT_MCOVERINFO.mpayoffid
  is 'MPayOffID';
comment on column CONT_MCOVERINFO.areanum
  is '���������';
comment on column CONT_MCOVERINFO.landnum
  is '����ؿ���';
comment on column CONT_MCOVERINFO.landname
  is '����ؿ�����';
comment on column CONT_MCOVERINFO.buystonecount
  is '������ʯ����';
comment on column CONT_MCOVERINFO.costamount
  is '�ɱ����';
comment on column CONT_MCOVERINFO.description
  is '��������';
comment on column CONT_MCOVERINFO.creator_id
  is '������id';
comment on column CONT_MCOVERINFO.creator
  is '������';
comment on column CONT_MCOVERINFO.create_date
  is '��������';
comment on column CONT_MCOVERINFO.modifiedby
  is '�޸���';
comment on column CONT_MCOVERINFO.modifiedby_id
  is '�޸���id';
comment on column CONT_MCOVERINFO.modified_date
  is '�޸�����';
comment on column CONT_MCOVERINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CONT_MCOVERINFO.version
  is '�汾��';
comment on column CONT_MCOVERINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column CONT_MCOVERINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column CONT_MCOVERINFO.bus_date
  is 'ҵ������';
comment on column CONT_MCOVERINFO.exa_remarks
  is '������ע';

prompt
prompt Creating table CONT_PROJECT
prompt ===========================
prompt
create table CONT_PROJECT
(
  id               NUMBER,
  sid              NUMBER,
  contid           NUMBER,
  stockcontid      VARCHAR2(255),
  unitid           NUMBER,
  unitname         VARCHAR2(255),
  appointedperson  VARCHAR2(255),
  clientperson     VARCHAR2(255),
  phone            VARCHAR2(255),
  signingdeptid    NUMBER,
  signingdept      VARCHAR2(255),
  agentid          NUMBER,
  agent            VARCHAR2(255),
  authorizationnum VARCHAR2(255),
  approvalleaderid NUMBER,
  approvalleader   VARCHAR2(255),
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
  bus_date         DATE,
  exa_remarks      VARCHAR2(500)
)
;
comment on table CONT_PROJECT
  is '�������ͬ��';
comment on column CONT_PROJECT.id
  is 'ID';
comment on column CONT_PROJECT.sid
  is 'ԭϵͳID';
comment on column CONT_PROJECT.contid
  is 'ContID';
comment on column CONT_PROJECT.stockcontid
  is '��ͬ���';
comment on column CONT_PROJECT.unitid
  is '��λ����ID';
comment on column CONT_PROJECT.unitname
  is '��λ����';
comment on column CONT_PROJECT.appointedperson
  is 'Լ��������';
comment on column CONT_PROJECT.clientperson
  is 'ί�д�����';
comment on column CONT_PROJECT.phone
  is '��ϵ�绰';
comment on column CONT_PROJECT.signingdeptid
  is 'ǩԼ����ID';
comment on column CONT_PROJECT.signingdept
  is 'ǩԼ����';
comment on column CONT_PROJECT.agentid
  is 'ί�д�����ID';
comment on column CONT_PROJECT.agent
  is 'ί�д�����';
comment on column CONT_PROJECT.authorizationnum
  is '��Ȩί�����';
comment on column CONT_PROJECT.approvalleaderid
  is '�����쵼ID';
comment on column CONT_PROJECT.approvalleader
  is '�����쵼';
comment on column CONT_PROJECT.description
  is '��������';
comment on column CONT_PROJECT.creator_id
  is '������id';
comment on column CONT_PROJECT.creator
  is '������';
comment on column CONT_PROJECT.create_date
  is '��������';
comment on column CONT_PROJECT.modifiedby
  is '�޸���';
comment on column CONT_PROJECT.modifiedby_id
  is '�޸���id';
comment on column CONT_PROJECT.modified_date
  is '�޸�����';
comment on column CONT_PROJECT.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CONT_PROJECT.version
  is '�汾��';
comment on column CONT_PROJECT.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column CONT_PROJECT.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column CONT_PROJECT.bus_date
  is 'ҵ������';
comment on column CONT_PROJECT.exa_remarks
  is '������ע';

prompt
prompt Creating table CONT_PROVISIONINFO
prompt =================================
prompt
create table CONT_PROVISIONINFO
(
  id              NUMBER,
  sid             NUMBER,
  contprjid       NUMBER,
  area            NUMBER,
  qualitystandard VARCHAR2(255),
  begindate       DATE,
  price           NUMBER,
  amount          NUMBER,
  finishdate      DATE,
  cont_mode       VARCHAR2(255),
  cont_period     DATE,
  comflictplace   VARCHAR2(255),
  comflictmode    VARCHAR2(255),
  description     VARCHAR2(255),
  creator_id      VARCHAR2(120),
  creator         VARCHAR2(120),
  create_date     DATE,
  modifiedby      VARCHAR2(120),
  modifiedby_id   VARCHAR2(120),
  modified_date   DATE,
  version_status  NUMBER,
  version         NUMBER,
  latestversion   NUMBER,
  approvalstae    NUMBER,
  bus_date        DATE,
  exa_remarks     VARCHAR2(500)
)
;
comment on table CONT_PROVISIONINFO
  is '��ͬ��Ҫ������Ϣ��';
comment on column CONT_PROVISIONINFO.id
  is 'ID';
comment on column CONT_PROVISIONINFO.sid
  is 'ԭϵͳID';
comment on column CONT_PROVISIONINFO.contprjid
  is 'ContPrjID';
comment on column CONT_PROVISIONINFO.area
  is '���';
comment on column CONT_PROVISIONINFO.qualitystandard
  is '������׼';
comment on column CONT_PROVISIONINFO.begindate
  is '��������';
comment on column CONT_PROVISIONINFO.price
  is '����';
comment on column CONT_PROVISIONINFO.amount
  is '��ͬ���';
comment on column CONT_PROVISIONINFO.finishdate
  is '��������';
comment on column CONT_PROVISIONINFO.cont_mode
  is '���㷽ʽ';
comment on column CONT_PROVISIONINFO.cont_period
  is '��������';
comment on column CONT_PROVISIONINFO.comflictplace
  is '�������ص�';
comment on column CONT_PROVISIONINFO.comflictmode
  is '��������ʽ';
comment on column CONT_PROVISIONINFO.description
  is '��������';
comment on column CONT_PROVISIONINFO.creator_id
  is '������id';
comment on column CONT_PROVISIONINFO.creator
  is '������';
comment on column CONT_PROVISIONINFO.create_date
  is '��������';
comment on column CONT_PROVISIONINFO.modifiedby
  is '�޸���';
comment on column CONT_PROVISIONINFO.modifiedby_id
  is '�޸���id';
comment on column CONT_PROVISIONINFO.modified_date
  is '�޸�����';
comment on column CONT_PROVISIONINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CONT_PROVISIONINFO.version
  is '�汾��';
comment on column CONT_PROVISIONINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column CONT_PROVISIONINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column CONT_PROVISIONINFO.bus_date
  is 'ҵ������';
comment on column CONT_PROVISIONINFO.exa_remarks
  is '������ע';

prompt
prompt Creating table CONT_PURCHASE
prompt ============================
prompt
create table CONT_PURCHASE
(
  id              NUMBER,
  sid             NUMBER,
  contid          NUMBER,
  contcode        VARCHAR2(255),
  signingtime     DATE,
  unitname        VARCHAR2(255),
  contstandard    VARCHAR2(255),
  qualitystandard VARCHAR2(255),
  num             NUMBER,
  price           NUMBER,
  totalamout      NUMBER,
  submittime      DATE,
  submitnum       NUMBER,
  paymenttime     DATE,
  submitedtime    DATE,
  submitednum     NUMBER,
  qualityproblem  VARCHAR2(255),
  paidamout       NUMBER,
  paycode         VARCHAR2(255),
  changerelease   VARCHAR2(255),
  dispute         VARCHAR2(255),
  description     VARCHAR2(255),
  creator_id      VARCHAR2(120),
  creator         VARCHAR2(120),
  create_date     DATE,
  modifiedby      VARCHAR2(120),
  modifiedby_id   VARCHAR2(120),
  modified_date   DATE,
  version_status  NUMBER,
  version         NUMBER,
  latestversion   NUMBER,
  approvalstae    NUMBER,
  bus_date        DATE,
  exa_remarks     VARCHAR2(500)
)
;
comment on table CONT_PURCHASE
  is '�ɹ���ͬ��';
comment on column CONT_PURCHASE.id
  is 'ID';
comment on column CONT_PURCHASE.sid
  is 'ԭϵͳID';
comment on column CONT_PURCHASE.contid
  is 'ContID';
comment on column CONT_PURCHASE.contcode
  is '��ͬ���';
comment on column CONT_PURCHASE.signingtime
  is 'ǩԼʱ��';
comment on column CONT_PURCHASE.unitname
  is '��λ����';
comment on column CONT_PURCHASE.contstandard
  is '��ͬ��׼';
comment on column CONT_PURCHASE.qualitystandard
  is '������׼';
comment on column CONT_PURCHASE.num
  is '����';
comment on column CONT_PURCHASE.price
  is '����';
comment on column CONT_PURCHASE.totalamout
  is '��ͬ�ܽ��';
comment on column CONT_PURCHASE.submittime
  is '�ᣨ������ʱ��';
comment on column CONT_PURCHASE.submitnum
  is '�ᣨ����������';
comment on column CONT_PURCHASE.paymenttime
  is '����ʱ��';
comment on column CONT_PURCHASE.submitedtime
  is '���ᣨ������ʱ��';
comment on column CONT_PURCHASE.submitednum
  is '���ᣨ����������';
comment on column CONT_PURCHASE.qualityproblem
  is '��������';
comment on column CONT_PURCHASE.paidamout
  is '�Ѹ�����';
comment on column CONT_PURCHASE.paycode
  is '����ƾ��';
comment on column CONT_PURCHASE.changerelease
  is '���������';
comment on column CONT_PURCHASE.dispute
  is '�����������';
comment on column CONT_PURCHASE.description
  is '��������';
comment on column CONT_PURCHASE.creator_id
  is '������id';
comment on column CONT_PURCHASE.creator
  is '������';
comment on column CONT_PURCHASE.create_date
  is '��������';
comment on column CONT_PURCHASE.modifiedby
  is '�޸���';
comment on column CONT_PURCHASE.modifiedby_id
  is '�޸���id';
comment on column CONT_PURCHASE.modified_date
  is '�޸�����';
comment on column CONT_PURCHASE.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CONT_PURCHASE.version
  is '�汾��';
comment on column CONT_PURCHASE.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column CONT_PURCHASE.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column CONT_PURCHASE.bus_date
  is 'ҵ������';
comment on column CONT_PURCHASE.exa_remarks
  is '������ע';

prompt
prompt Creating table CONT_RELATION
prompt ============================
prompt
create table CONT_RELATION
(
  id                   NUMBER,
  sid                  NUMBER,
  contid               NUMBER,
  stockcontid          VARCHAR2(255),
  prjcode              VARCHAR2(255),
  prjname              VARCHAR2(255),
  prjplace             VARCHAR2(255),
  planbegindate        DATE,
  planenddate          DATE,
  capitaldivisionratio NUMBER,
  description          VARCHAR2(255),
  creator_id           VARCHAR2(120),
  creator              VARCHAR2(120),
  create_date          DATE,
  modifiedby           VARCHAR2(120),
  modifiedby_id        VARCHAR2(120),
  modified_date        DATE,
  version_status       NUMBER,
  version              NUMBER,
  latestversion        NUMBER,
  approvalstae         NUMBER,
  bus_date             DATE,
  exa_remarks          VARCHAR2(500)
)
;
comment on table CONT_RELATION
  is '������Ŀ��';
comment on column CONT_RELATION.id
  is 'ID ';
comment on column CONT_RELATION.sid
  is 'ԭϵͳID ';
comment on column CONT_RELATION.contid
  is 'ContID ';
comment on column CONT_RELATION.stockcontid
  is '��ͬ��� ';
comment on column CONT_RELATION.prjcode
  is '��Ŀ���� ';
comment on column CONT_RELATION.prjname
  is '��Ŀ���� ';
comment on column CONT_RELATION.prjplace
  is '��Ŀ�ص� ';
comment on column CONT_RELATION.planbegindate
  is '�ƻ���ʼʱ�� ';
comment on column CONT_RELATION.planenddate
  is '�ƻ�����ʱ�� ';
comment on column CONT_RELATION.capitaldivisionratio
  is '�ʽ������� ';
comment on column CONT_RELATION.description
  is '��������';
comment on column CONT_RELATION.creator_id
  is '������id';
comment on column CONT_RELATION.creator
  is '������';
comment on column CONT_RELATION.create_date
  is '��������';
comment on column CONT_RELATION.modifiedby
  is '�޸���';
comment on column CONT_RELATION.modifiedby_id
  is '�޸���id';
comment on column CONT_RELATION.modified_date
  is '�޸�����';
comment on column CONT_RELATION.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CONT_RELATION.version
  is '�汾��';
comment on column CONT_RELATION.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column CONT_RELATION.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column CONT_RELATION.bus_date
  is 'ҵ������';
comment on column CONT_RELATION.exa_remarks
  is '������ע';

prompt
prompt Creating table CONT_SELLATTACHMENT
prompt ==================================
prompt
create table CONT_SELLATTACHMENT
(
  id             NUMBER,
  sid            NUMBER,
  contid         NUMBER,
  stockcontid    VARCHAR2(255),
  name           VARCHAR2(255),
  type           VARCHAR2(255),
  pagenum        NUMBER,
  author         VARCHAR2(255),
  attachversion  VARCHAR2(255),
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
comment on table CONT_SELLATTACHMENT
  is '���ۺ�ͬ������';
comment on column CONT_SELLATTACHMENT.id
  is 'ID';
comment on column CONT_SELLATTACHMENT.sid
  is 'ԭϵͳID';
comment on column CONT_SELLATTACHMENT.contid
  is '��ͬ���';
comment on column CONT_SELLATTACHMENT.stockcontid
  is '��ͬ���2';
comment on column CONT_SELLATTACHMENT.name
  is '��ͬ��������';
comment on column CONT_SELLATTACHMENT.type
  is '��ͬ��������';
comment on column CONT_SELLATTACHMENT.pagenum
  is '��ͬ����ҳ��';
comment on column CONT_SELLATTACHMENT.author
  is '��ͬ��������';
comment on column CONT_SELLATTACHMENT.attachversion
  is '��ͬ�����汾';
comment on column CONT_SELLATTACHMENT.description
  is '��������';
comment on column CONT_SELLATTACHMENT.creator_id
  is '������id';
comment on column CONT_SELLATTACHMENT.creator
  is '������';
comment on column CONT_SELLATTACHMENT.create_date
  is '��������';
comment on column CONT_SELLATTACHMENT.modifiedby
  is '�޸���';
comment on column CONT_SELLATTACHMENT.modifiedby_id
  is '�޸���id';
comment on column CONT_SELLATTACHMENT.modified_date
  is '�޸�����';
comment on column CONT_SELLATTACHMENT.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CONT_SELLATTACHMENT.version
  is '�汾��';
comment on column CONT_SELLATTACHMENT.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column CONT_SELLATTACHMENT.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column CONT_SELLATTACHMENT.bus_date
  is 'ҵ������';
comment on column CONT_SELLATTACHMENT.exa_remarks
  is '������ע';

prompt
prompt Creating table CONT_SELLINCOME
prompt ==============================
prompt
create table CONT_SELLINCOME
(
  id                  NUMBER,
  sid                 NUMBER,
  contid              NUMBER,
  billcode            VARCHAR2(255),
  billdate            DATE,
  approvecode         VARCHAR2(255),
  contcode            VARCHAR2(255),
  contname            VARCHAR2(255),
  prelandsellcontid   VARCHAR2(255),
  prelandsellcontname VARCHAR2(255),
  moneytype           VARCHAR2(255),
  transfertotalcost   NUMBER,
  nowbillamount       NUMBER,
  payee               VARCHAR2(255),
  transfereeunit      VARCHAR2(255),
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
  exa_remarks         VARCHAR2(500)
)
;
comment on table CONT_SELLINCOME
  is '���ۺ�ͬ�����';
comment on column CONT_SELLINCOME.id
  is 'ID';
comment on column CONT_SELLINCOME.sid
  is 'ԭϵͳID';
comment on column CONT_SELLINCOME.contid
  is 'ContID';
comment on column CONT_SELLINCOME.billcode
  is '�տ���';
comment on column CONT_SELLINCOME.billdate
  is '�տ�����';
comment on column CONT_SELLINCOME.approvecode
  is '��׼�ĺ�';
comment on column CONT_SELLINCOME.contcode
  is '��ͬ���';
comment on column CONT_SELLINCOME.contname
  is '��ͬ����';
comment on column CONT_SELLINCOME.prelandsellcontid
  is 'ԭ���س��ú�ͬ��';
comment on column CONT_SELLINCOME.prelandsellcontname
  is 'ԭ���س��ú�ͬ����';
comment on column CONT_SELLINCOME.moneytype
  is '����';
comment on column CONT_SELLINCOME.transfertotalcost
  is 'ת���ܼ�';
comment on column CONT_SELLINCOME.nowbillamount
  is '�����տ���';
comment on column CONT_SELLINCOME.payee
  is '�տ���';
comment on column CONT_SELLINCOME.transfereeunit
  is '���õ�λ';
comment on column CONT_SELLINCOME.description
  is '��������';
comment on column CONT_SELLINCOME.creator_id
  is '������id';
comment on column CONT_SELLINCOME.creator
  is '������';
comment on column CONT_SELLINCOME.create_date
  is '��������';
comment on column CONT_SELLINCOME.modifiedby
  is '�޸���';
comment on column CONT_SELLINCOME.modifiedby_id
  is '�޸���id';
comment on column CONT_SELLINCOME.modified_date
  is '�޸�����';
comment on column CONT_SELLINCOME.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CONT_SELLINCOME.version
  is '�汾��';
comment on column CONT_SELLINCOME.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column CONT_SELLINCOME.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column CONT_SELLINCOME.bus_date
  is 'ҵ������';
comment on column CONT_SELLINCOME.exa_remarks
  is '������ע';

prompt
prompt Creating table CONT_SELLLANDINFO
prompt ================================
prompt
create table CONT_SELLLANDINFO
(
  id             NUMBER,
  sid            NUMBER,
  incomeid       NUMBER,
  billcode       VARCHAR2(255),
  landcode       VARCHAR2(255),
  landarea_mu    NUMBER,
  landusing      VARCHAR2(255),
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
comment on table CONT_SELLLANDINFO
  is '���۵ؿ���Ϣ��';
comment on column CONT_SELLLANDINFO.id
  is 'ID';
comment on column CONT_SELLLANDINFO.sid
  is 'ԭϵͳID';
comment on column CONT_SELLLANDINFO.incomeid
  is 'IncomeID';
comment on column CONT_SELLLANDINFO.billcode
  is '�տ���';
comment on column CONT_SELLLANDINFO.landcode
  is '�ؿ���';
comment on column CONT_SELLLANDINFO.landarea_mu
  is '�ؿ����';
comment on column CONT_SELLLANDINFO.landusing
  is '�ؿ���;';
comment on column CONT_SELLLANDINFO.description
  is '��������';
comment on column CONT_SELLLANDINFO.creator_id
  is '������id';
comment on column CONT_SELLLANDINFO.creator
  is '������';
comment on column CONT_SELLLANDINFO.create_date
  is '��������';
comment on column CONT_SELLLANDINFO.modifiedby
  is '�޸���';
comment on column CONT_SELLLANDINFO.modifiedby_id
  is '�޸���id';
comment on column CONT_SELLLANDINFO.modified_date
  is '�޸�����';
comment on column CONT_SELLLANDINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CONT_SELLLANDINFO.version
  is '�汾��';
comment on column CONT_SELLLANDINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column CONT_SELLLANDINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column CONT_SELLLANDINFO.bus_date
  is 'ҵ������';
comment on column CONT_SELLLANDINFO.exa_remarks
  is '������ע';

prompt
prompt Creating table CONT_SELLTOACCOUNTPLAN
prompt =====================================
prompt
create table CONT_SELLTOACCOUNTPLAN
(
  id             NUMBER,
  sid            NUMBER,
  contid         NUMBER,
  contcode       VARCHAR2(255),
  totalcapital   NUMBER,
  howmuchperiod  NUMBER,
  paydesc        VARCHAR2(255),
  planpaydate    DATE,
  planpayamount  NUMBER,
  remark         VARCHAR2(255),
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
comment on table CONT_SELLTOACCOUNTPLAN
  is '���ۺ�ͬ���˼ƻ���';
comment on column CONT_SELLTOACCOUNTPLAN.id
  is 'ID';
comment on column CONT_SELLTOACCOUNTPLAN.sid
  is 'ԭϵͳID';
comment on column CONT_SELLTOACCOUNTPLAN.contid
  is 'ContID';
comment on column CONT_SELLTOACCOUNTPLAN.contcode
  is '��ͬ���';
comment on column CONT_SELLTOACCOUNTPLAN.totalcapital
  is '�ʽ��˽���ܼ�';
comment on column CONT_SELLTOACCOUNTPLAN.howmuchperiod
  is '����_��֧��';
comment on column CONT_SELLTOACCOUNTPLAN.paydesc
  is '֧��˵��';
comment on column CONT_SELLTOACCOUNTPLAN.planpaydate
  is '�ƻ�֧������';
comment on column CONT_SELLTOACCOUNTPLAN.planpayamount
  is '�ƻ�֧�����';
comment on column CONT_SELLTOACCOUNTPLAN.remark
  is '��ע����';
comment on column CONT_SELLTOACCOUNTPLAN.description
  is '��������';
comment on column CONT_SELLTOACCOUNTPLAN.creator_id
  is '������id';
comment on column CONT_SELLTOACCOUNTPLAN.creator
  is '������';
comment on column CONT_SELLTOACCOUNTPLAN.create_date
  is '��������';
comment on column CONT_SELLTOACCOUNTPLAN.modifiedby
  is '�޸���';
comment on column CONT_SELLTOACCOUNTPLAN.modifiedby_id
  is '�޸���id';
comment on column CONT_SELLTOACCOUNTPLAN.modified_date
  is '�޸�����';
comment on column CONT_SELLTOACCOUNTPLAN.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CONT_SELLTOACCOUNTPLAN.version
  is '�汾��';
comment on column CONT_SELLTOACCOUNTPLAN.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column CONT_SELLTOACCOUNTPLAN.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column CONT_SELLTOACCOUNTPLAN.bus_date
  is 'ҵ������';
comment on column CONT_SELLTOACCOUNTPLAN.exa_remarks
  is '������ע';

prompt
prompt Creating table CONT_SUPERVISORINFO
prompt ==================================
prompt
create table CONT_SUPERVISORINFO
(
  id               NUMBER,
  sid              NUMBER,
  contid           NUMBER,
  stockcontid      VARCHAR2(255),
  billcode         VARCHAR2(255),
  billdate         DATE,
  makelandprjid    NUMBER,
  makelandprj      VARCHAR2(255),
  supervisorunitid NUMBER,
  supervisorunit   VARCHAR2(255),
  applicationonid  NUMBER,
  applicationon    VARCHAR2(255),
  approverid       NUMBER,
  approver         VARCHAR2(255),
  nowpayoff        NUMBER,
  totalpayoff      NUMBER,
  whichtimes       NUMBER,
  payoffdesc       VARCHAR2(255),
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
  bus_date         DATE,
  exa_remarks      VARCHAR2(500)
)
;
comment on table CONT_SUPERVISORINFO
  is '�����֧ͬ����Ϣ��ϸ��';
comment on column CONT_SUPERVISORINFO.id
  is 'ID';
comment on column CONT_SUPERVISORINFO.sid
  is 'ԭϵͳID';
comment on column CONT_SUPERVISORINFO.contid
  is 'ContID';
comment on column CONT_SUPERVISORINFO.stockcontid
  is '��ͬ���';
comment on column CONT_SUPERVISORINFO.billcode
  is '���ݱ��';
comment on column CONT_SUPERVISORINFO.billdate
  is '����ʱ��';
comment on column CONT_SUPERVISORINFO.makelandprjid
  is '�����ĿID';
comment on column CONT_SUPERVISORINFO.makelandprj
  is '�����Ŀ';
comment on column CONT_SUPERVISORINFO.supervisorunitid
  is '����λID';
comment on column CONT_SUPERVISORINFO.supervisorunit
  is '����λ';
comment on column CONT_SUPERVISORINFO.applicationonid
  is '���븶����ID';
comment on column CONT_SUPERVISORINFO.applicationon
  is '���븶����';
comment on column CONT_SUPERVISORINFO.approverid
  is '������ID';
comment on column CONT_SUPERVISORINFO.approver
  is '������';
comment on column CONT_SUPERVISORINFO.nowpayoff
  is '���θ�����';
comment on column CONT_SUPERVISORINFO.totalpayoff
  is '�ۼƸ�����';
comment on column CONT_SUPERVISORINFO.whichtimes
  is '�ڼ��θ���';
comment on column CONT_SUPERVISORINFO.payoffdesc
  is '����˵��';
comment on column CONT_SUPERVISORINFO.description
  is '��������';
comment on column CONT_SUPERVISORINFO.creator_id
  is '������id';
comment on column CONT_SUPERVISORINFO.creator
  is '������';
comment on column CONT_SUPERVISORINFO.create_date
  is '��������';
comment on column CONT_SUPERVISORINFO.modifiedby
  is '�޸���';
comment on column CONT_SUPERVISORINFO.modifiedby_id
  is '�޸���id';
comment on column CONT_SUPERVISORINFO.modified_date
  is '�޸�����';
comment on column CONT_SUPERVISORINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CONT_SUPERVISORINFO.version
  is '�汾��';
comment on column CONT_SUPERVISORINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column CONT_SUPERVISORINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column CONT_SUPERVISORINFO.bus_date
  is 'ҵ������';
comment on column CONT_SUPERVISORINFO.exa_remarks
  is '������ע';

prompt
prompt Creating table CUST_CONTACTS
prompt ============================
prompt
create table CUST_CONTACTS
(
  id             NUMBER,
  sid            NUMBER,
  custid         NUMBER,
  custcode       VARCHAR2(255),
  code           VARCHAR2(255),
  name           VARCHAR2(255),
  sexid          NUMBER,
  sex            VARCHAR2(255),
  job            VARCHAR2(255),
  phone          VARCHAR2(255),
  fax            VARCHAR2(255),
  email          VARCHAR2(255),
  address        VARCHAR2(255),
  postalcode     VARCHAR2(255),
  mobile         VARCHAR2(255),
  homecall       VARCHAR2(255),
  othermethod    VARCHAR2(255),
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
comment on table CUST_CONTACTS
  is '��ϵ����Ϣ��';
comment on column CUST_CONTACTS.id
  is 'ID';
comment on column CUST_CONTACTS.sid
  is 'ԭϵͳID';
comment on column CUST_CONTACTS.custid
  is 'CustID';
comment on column CUST_CONTACTS.custcode
  is '�ͻ�����';
comment on column CUST_CONTACTS.code
  is '��Ա���';
comment on column CUST_CONTACTS.name
  is '����';
comment on column CUST_CONTACTS.sexid
  is '�Ա�ID';
comment on column CUST_CONTACTS.sex
  is '�Ա�';
comment on column CUST_CONTACTS.job
  is 'ְλ';
comment on column CUST_CONTACTS.phone
  is '�칫�绰';
comment on column CUST_CONTACTS.fax
  is '����';
comment on column CUST_CONTACTS.email
  is '�����ʼ�';
comment on column CUST_CONTACTS.address
  is '��ַ';
comment on column CUST_CONTACTS.postalcode
  is '��������';
comment on column CUST_CONTACTS.mobile
  is '�ƶ��绰';
comment on column CUST_CONTACTS.homecall
  is '��ͥ�绰';
comment on column CUST_CONTACTS.othermethod
  is '������ϵ��ʽ';
comment on column CUST_CONTACTS.description
  is '��������';
comment on column CUST_CONTACTS.creator_id
  is '������id';
comment on column CUST_CONTACTS.creator
  is '������';
comment on column CUST_CONTACTS.create_date
  is '��������';
comment on column CUST_CONTACTS.modifiedby
  is '�޸���';
comment on column CUST_CONTACTS.modifiedby_id
  is '�޸���id';
comment on column CUST_CONTACTS.modified_date
  is '�޸�����';
comment on column CUST_CONTACTS.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CUST_CONTACTS.version
  is '�汾��';
comment on column CUST_CONTACTS.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column CUST_CONTACTS.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column CUST_CONTACTS.bus_date
  is 'ҵ��ʱ��';
comment on column CUST_CONTACTS.exa_remarks
  is '������ע';

prompt
prompt Creating table CUST_INFO
prompt ========================
prompt
create table CUST_INFO
(
  id                NUMBER,
  sid               NUMBER,
  code              VARCHAR2(255),
  name              VARCHAR2(255),
  certificatenum    VARCHAR2(255),
  companynatureid   NUMBER,
  companynature     VARCHAR2(255),
  registeredcapital NUMBER,
  city              VARCHAR2(255),
  bank              VARCHAR2(255),
  account           VARCHAR2(255),
  representative    VARCHAR2(255),
  contactperson     VARCHAR2(255),
  businesslicense   VARCHAR2(255),
  orgcode           VARCHAR2(255),
  areataxnum        VARCHAR2(255),
  nationtaxnum      VARCHAR2(255),
  address           VARCHAR2(255),
  postalcode        VARCHAR2(255),
  phone             VARCHAR2(255),
  fax               VARCHAR2(255),
  email             VARCHAR2(255),
  homepage          VARCHAR2(255),
  cust_description  VARCHAR2(255),
  bussinessscope    VARCHAR2(255),
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
  exa_remarks       VARCHAR2(500)
)
;
comment on table CUST_INFO
  is '�ͻ�������Ϣ';
comment on column CUST_INFO.id
  is 'ID';
comment on column CUST_INFO.sid
  is 'ԭϵͳID';
comment on column CUST_INFO.code
  is '�ͻ�����';
comment on column CUST_INFO.name
  is '�ͻ�����';
comment on column CUST_INFO.certificatenum
  is '����֤������';
comment on column CUST_INFO.companynatureid
  is '��ҵ����ID';
comment on column CUST_INFO.companynature
  is '��ҵ����';
comment on column CUST_INFO.registeredcapital
  is 'ע���ʱ�';
comment on column CUST_INFO.city
  is '���ڳ���';
comment on column CUST_INFO.bank
  is '��������';
comment on column CUST_INFO.account
  is '�����˺�';
comment on column CUST_INFO.representative
  is '���˴���';
comment on column CUST_INFO.contactperson
  is '��ϵ��';
comment on column CUST_INFO.businesslicense
  is 'Ӫҵִ�պ�';
comment on column CUST_INFO.orgcode
  is '��֯��������֤';
comment on column CUST_INFO.areataxnum
  is '��˰�ǼǺ�';
comment on column CUST_INFO.nationtaxnum
  is '��˰�ǼǺ�';
comment on column CUST_INFO.address
  is 'ͨѶ��ַ';
comment on column CUST_INFO.postalcode
  is '��������';
comment on column CUST_INFO.phone
  is '�绰����';
comment on column CUST_INFO.fax
  is '�������';
comment on column CUST_INFO.email
  is '�����ʼ�';
comment on column CUST_INFO.homepage
  is '��˾��ҳ';
comment on column CUST_INFO.cust_description
  is '��˾���';
comment on column CUST_INFO.bussinessscope
  is '��Ӫ��Χ';
comment on column CUST_INFO.description
  is '��������';
comment on column CUST_INFO.creator_id
  is '������id';
comment on column CUST_INFO.creator
  is '������';
comment on column CUST_INFO.create_date
  is '��������';
comment on column CUST_INFO.modifiedby
  is '�޸���';
comment on column CUST_INFO.modifiedby_id
  is '�޸���id';
comment on column CUST_INFO.modified_date
  is '�޸�����';
comment on column CUST_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CUST_INFO.version
  is '�汾��';
comment on column CUST_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column CUST_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column CUST_INFO.bus_date
  is 'ҵ��ʱ��';
comment on column CUST_INFO.exa_remarks
  is '������ע';

prompt
prompt Creating table CUST_TRANSACTION
prompt ===============================
prompt
create table CUST_TRANSACTION
(
  id                   NUMBER,
  sid                  NUMBER,
  custid               NUMBER,
  custcode             VARCHAR2(255),
  transationtypeid     NUMBER,
  transationtype       VARCHAR2(255),
  statusid             NUMBER,
  status               VARCHAR2(255),
  buyprice             NUMBER,
  rentalprice          NUMBER,
  transationcode       VARCHAR2(255),
  contcode             VARCHAR2(255),
  contname             VARCHAR2(255),
  investprjname        VARCHAR2(255),
  agent                VARCHAR2(255),
  clientcertificatenum VARCHAR2(255),
  clientphone          VARCHAR2(255),
  clientaddress        VARCHAR2(255),
  description          VARCHAR2(255),
  creator_id           VARCHAR2(120),
  creator              VARCHAR2(120),
  create_date          DATE,
  modifiedby           VARCHAR2(120),
  modifiedby_id        VARCHAR2(120),
  modified_date        DATE,
  version_status       NUMBER,
  version              NUMBER,
  latestversion        NUMBER,
  approvalstae         NUMBER,
  bus_date             DATE,
  exa_remarks          VARCHAR2(500)
)
;
comment on table CUST_TRANSACTION
  is '�������Ա�';
comment on column CUST_TRANSACTION.id
  is 'ID';
comment on column CUST_TRANSACTION.sid
  is 'ԭϵͳID';
comment on column CUST_TRANSACTION.custid
  is 'CustID';
comment on column CUST_TRANSACTION.custcode
  is '�ͻ�����';
comment on column CUST_TRANSACTION.transationtypeid
  is '��������ID';
comment on column CUST_TRANSACTION.transationtype
  is '��������';
comment on column CUST_TRANSACTION.statusid
  is '�ͻ�״̬ID';
comment on column CUST_TRANSACTION.status
  is '�ͻ�״̬';
comment on column CUST_TRANSACTION.buyprice
  is '����۸�';
comment on column CUST_TRANSACTION.rentalprice
  is '���޼۸�';
comment on column CUST_TRANSACTION.transationcode
  is '���ױ��';
comment on column CUST_TRANSACTION.contcode
  is '��ͬ���';
comment on column CUST_TRANSACTION.contname
  is '��ͬ����';
comment on column CUST_TRANSACTION.investprjname
  is 'Ͷ����Ŀ����';
comment on column CUST_TRANSACTION.agent
  is 'ί�д�����';
comment on column CUST_TRANSACTION.clientcertificatenum
  is 'ί����֤������';
comment on column CUST_TRANSACTION.clientphone
  is 'ί���˵绰';
comment on column CUST_TRANSACTION.clientaddress
  is 'ί���˵�ַ';
comment on column CUST_TRANSACTION.description
  is '��������';
comment on column CUST_TRANSACTION.creator_id
  is '������id';
comment on column CUST_TRANSACTION.creator
  is '������';
comment on column CUST_TRANSACTION.create_date
  is '��������';
comment on column CUST_TRANSACTION.modifiedby
  is '�޸���';
comment on column CUST_TRANSACTION.modifiedby_id
  is '�޸���id';
comment on column CUST_TRANSACTION.modified_date
  is '�޸�����';
comment on column CUST_TRANSACTION.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CUST_TRANSACTION.version
  is '�汾��';
comment on column CUST_TRANSACTION.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column CUST_TRANSACTION.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column CUST_TRANSACTION.bus_date
  is 'ҵ��ʱ��';
comment on column CUST_TRANSACTION.exa_remarks
  is '������ע';

prompt
prompt Creating table EMP_ABILITYATTRIBUTE
prompt ===================================
prompt
create table EMP_ABILITYATTRIBUTE
(
  id                      NUMBER,
  sid                     NUMBER,
  empid                   NUMBER,
  empcode                 VARCHAR2(255),
  educationid             NUMBER,
  education               VARCHAR2(255),
  academicdegreeid        NUMBER,
  academicdegree          VARCHAR2(255),
  graguateduniversity     VARCHAR2(255),
  profession              VARCHAR2(255),
  begindate               DATE,
  enddate                 DATE,
  foreignlanguage         VARCHAR2(255),
  languagelevel           VARCHAR2(255),
  technicaltitle          VARCHAR2(255),
  titlelevelid            NUMBER,
  titlelevel              VARCHAR2(255),
  occupationqualification VARCHAR2(255),
  certification           VARCHAR2(255),
  description             VARCHAR2(255),
  creator_id              VARCHAR2(120),
  creator                 VARCHAR2(120),
  create_date             DATE,
  modifiedby              VARCHAR2(120),
  modifiedby_id           VARCHAR2(120),
  modified_date           DATE,
  version_status          NUMBER,
  version                 NUMBER,
  latestversion           NUMBER,
  approvalstae            NUMBER,
  bus_date                DATE,
  exa_remarks             VARCHAR2(500)
)
;
comment on table EMP_ABILITYATTRIBUTE
  is '�������Ա�';
comment on column EMP_ABILITYATTRIBUTE.id
  is '����';
comment on column EMP_ABILITYATTRIBUTE.sid
  is 'ԭϵͳID';
comment on column EMP_ABILITYATTRIBUTE.empid
  is 'EmpID';
comment on column EMP_ABILITYATTRIBUTE.empcode
  is 'Ա�����';
comment on column EMP_ABILITYATTRIBUTE.educationid
  is 'ѧ��ID';
comment on column EMP_ABILITYATTRIBUTE.education
  is 'ѧ��';
comment on column EMP_ABILITYATTRIBUTE.academicdegreeid
  is 'ѧλID';
comment on column EMP_ABILITYATTRIBUTE.academicdegree
  is 'ѧλ';
comment on column EMP_ABILITYATTRIBUTE.graguateduniversity
  is '��ҵԺУ';
comment on column EMP_ABILITYATTRIBUTE.profession
  is 'רҵ';
comment on column EMP_ABILITYATTRIBUTE.begindate
  is '��ѧʱ��';
comment on column EMP_ABILITYATTRIBUTE.enddate
  is '��ҵʱ��';
comment on column EMP_ABILITYATTRIBUTE.foreignlanguage
  is '��������';
comment on column EMP_ABILITYATTRIBUTE.languagelevel
  is '����ȼ�';
comment on column EMP_ABILITYATTRIBUTE.technicaltitle
  is '����ְ��';
comment on column EMP_ABILITYATTRIBUTE.titlelevelid
  is 'ְ�Ƶȼ�ID';
comment on column EMP_ABILITYATTRIBUTE.titlelevel
  is 'ְ�Ƶȼ�';
comment on column EMP_ABILITYATTRIBUTE.occupationqualification
  is 'ְҵ�ʸ�';
comment on column EMP_ABILITYATTRIBUTE.certification
  is '�ϸ�֤(����֤)';
comment on column EMP_ABILITYATTRIBUTE.description
  is '��������';
comment on column EMP_ABILITYATTRIBUTE.creator_id
  is '������id';
comment on column EMP_ABILITYATTRIBUTE.creator
  is '������';
comment on column EMP_ABILITYATTRIBUTE.create_date
  is '��������';
comment on column EMP_ABILITYATTRIBUTE.modifiedby
  is '�޸���';
comment on column EMP_ABILITYATTRIBUTE.modifiedby_id
  is '�޸���id';
comment on column EMP_ABILITYATTRIBUTE.modified_date
  is '�޸�����';
comment on column EMP_ABILITYATTRIBUTE.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column EMP_ABILITYATTRIBUTE.version
  is '�汾��';
comment on column EMP_ABILITYATTRIBUTE.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column EMP_ABILITYATTRIBUTE.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column EMP_ABILITYATTRIBUTE.bus_date
  is 'ҵ��ʱ��';
comment on column EMP_ABILITYATTRIBUTE.exa_remarks
  is '������ע';

prompt
prompt Creating table EMP_EDUCATIONATTRIBUTE
prompt =====================================
prompt
create table EMP_EDUCATIONATTRIBUTE
(
  id               NUMBER,
  sid              NUMBER,
  empid            NUMBER,
  empcode          VARCHAR2(255),
  graduatecollage  VARCHAR2(255),
  perfession       VARCHAR2(255),
  educationid      NUMBER,
  education        VARCHAR2(255),
  academicdegreeid NUMBER,
  academicdegree   VARCHAR2(255),
  learntypeid      NUMBER,
  learntype        VARCHAR2(255),
  begindate        DATE,
  enddate          DATE,
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
  bus_date         DATE,
  exa_remarks      VARCHAR2(500)
)
;
comment on table EMP_EDUCATIONATTRIBUTE
  is '����������';
comment on column EMP_EDUCATIONATTRIBUTE.id
  is '����';
comment on column EMP_EDUCATIONATTRIBUTE.sid
  is 'ԭϵͳID';
comment on column EMP_EDUCATIONATTRIBUTE.empid
  is 'EmpID';
comment on column EMP_EDUCATIONATTRIBUTE.empcode
  is 'Ա�����';
comment on column EMP_EDUCATIONATTRIBUTE.graduatecollage
  is '��ҵԺУ';
comment on column EMP_EDUCATIONATTRIBUTE.perfession
  is '��ѧרҵ';
comment on column EMP_EDUCATIONATTRIBUTE.educationid
  is 'ѧ��ID';
comment on column EMP_EDUCATIONATTRIBUTE.education
  is 'ѧ��';
comment on column EMP_EDUCATIONATTRIBUTE.academicdegreeid
  is 'ѧλID';
comment on column EMP_EDUCATIONATTRIBUTE.academicdegree
  is 'ѧλ';
comment on column EMP_EDUCATIONATTRIBUTE.learntypeid
  is 'ѧϰ��ʽID';
comment on column EMP_EDUCATIONATTRIBUTE.learntype
  is 'ѧϰ��ʽ';
comment on column EMP_EDUCATIONATTRIBUTE.begindate
  is '��ѧʱ��';
comment on column EMP_EDUCATIONATTRIBUTE.enddate
  is '��ҵʱ��';
comment on column EMP_EDUCATIONATTRIBUTE.description
  is '��������';
comment on column EMP_EDUCATIONATTRIBUTE.creator_id
  is '������id';
comment on column EMP_EDUCATIONATTRIBUTE.creator
  is '������';
comment on column EMP_EDUCATIONATTRIBUTE.create_date
  is '��������';
comment on column EMP_EDUCATIONATTRIBUTE.modifiedby
  is '�޸���';
comment on column EMP_EDUCATIONATTRIBUTE.modifiedby_id
  is '�޸���id';
comment on column EMP_EDUCATIONATTRIBUTE.modified_date
  is '�޸�����';
comment on column EMP_EDUCATIONATTRIBUTE.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column EMP_EDUCATIONATTRIBUTE.version
  is '�汾��';
comment on column EMP_EDUCATIONATTRIBUTE.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column EMP_EDUCATIONATTRIBUTE.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column EMP_EDUCATIONATTRIBUTE.bus_date
  is 'ҵ��ʱ��';
comment on column EMP_EDUCATIONATTRIBUTE.exa_remarks
  is '������ע';

prompt
prompt Creating table EMP_FRAMILYINFO
prompt ==============================
prompt
create table EMP_FRAMILYINFO
(
  id             NUMBER,
  empid          NUMBER,
  empcode        VARCHAR2(255),
  membername     VARCHAR2(255),
  relationid     NUMBER,
  relation       VARCHAR2(255),
  birthday       VARCHAR2(255),
  unit           VARCHAR2(255),
  job            VARCHAR2(255),
  phone          VARCHAR2(255),
  sexid          NUMBER,
  sex            VARCHAR2(255),
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
comment on table EMP_FRAMILYINFO
  is '��ͥ��Ϣ��';
comment on column EMP_FRAMILYINFO.id
  is '����';
comment on column EMP_FRAMILYINFO.empid
  is 'EmpID';
comment on column EMP_FRAMILYINFO.empcode
  is '��Ա����';
comment on column EMP_FRAMILYINFO.membername
  is '��Ա����';
comment on column EMP_FRAMILYINFO.relationid
  is '�뱾�˹�ϵID';
comment on column EMP_FRAMILYINFO.relation
  is '�뱾�˹�ϵ';
comment on column EMP_FRAMILYINFO.birthday
  is '��������';
comment on column EMP_FRAMILYINFO.unit
  is '������λ';
comment on column EMP_FRAMILYINFO.job
  is 'ְ��';
comment on column EMP_FRAMILYINFO.phone
  is '��ϵ�绰';
comment on column EMP_FRAMILYINFO.sexid
  is '�Ա�ID';
comment on column EMP_FRAMILYINFO.sex
  is '�Ա�';
comment on column EMP_FRAMILYINFO.description
  is '��������';
comment on column EMP_FRAMILYINFO.creator_id
  is '������id';
comment on column EMP_FRAMILYINFO.creator
  is '������';
comment on column EMP_FRAMILYINFO.create_date
  is '��������';
comment on column EMP_FRAMILYINFO.modifiedby
  is '�޸���';
comment on column EMP_FRAMILYINFO.modifiedby_id
  is '�޸���id';
comment on column EMP_FRAMILYINFO.modified_date
  is '�޸�����';
comment on column EMP_FRAMILYINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column EMP_FRAMILYINFO.version
  is '�汾��';
comment on column EMP_FRAMILYINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column EMP_FRAMILYINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column EMP_FRAMILYINFO.bus_date
  is 'ҵ��ʱ��';
comment on column EMP_FRAMILYINFO.exa_remarks
  is '������ע';

prompt
prompt Creating table EMP_INFO
prompt =======================
prompt
create table EMP_INFO
(
  id                 NUMBER,
  code               VARCHAR2(255),
  cardcode           VARCHAR2(255),
  name               VARCHAR2(255),
  pinyin             VARCHAR2(255),
  sexid              NUMBER,
  sex                VARCHAR2(255),
  birthday           DATE,
  bloodtypeid        NUMBER,
  bloodtype          VARCHAR2(255),
  idcard             VARCHAR2(255),
  marryid            NUMBER,
  marry              VARCHAR2(255),
  nation             VARCHAR2(255),
  nationid           NUMBER,
  birthplace         VARCHAR2(255),
  originplace        VARCHAR2(255),
  photo              VARCHAR2(255),
  personindentityid  NUMBER,
  personindentity    VARCHAR2(255),
  politicaloutlookid NUMBER,
  politicaloutlook   VARCHAR2(255),
  joininparty        DATE,
  partyoffice        VARCHAR2(255),
  workingtime        DATE,
  city               VARCHAR2(255),
  officeaddress      VARCHAR2(255),
  officephone        VARCHAR2(255),
  mobile             VARCHAR2(255),
  email              VARCHAR2(255),
  officepostalcode   VARCHAR2(255),
  homeaddress        VARCHAR2(255),
  homephone          VARCHAR2(255),
  homepostalcode     VARCHAR2(255),
  emergencyperson    VARCHAR2(255),
  emergencyphone     VARCHAR2(255),
  description        VARCHAR2(255),
  creator_id         VARCHAR2(120),
  creator            VARCHAR2(120),
  create_date        DATE,
  modifiedby         VARCHAR2(120),
  modifiedby_id      VARCHAR2(120),
  modified_date      DATE,
  version_status     NUMBER,
  version            NUMBER,
  latestversion      NUMBER,
  approvalstae       NUMBER,
  bus_date           DATE,
  exa_remarks        VARCHAR2(500)
)
;
comment on table EMP_INFO
  is '�˿ڻ�����Ϣ';
comment on column EMP_INFO.id
  is '����';
comment on column EMP_INFO.code
  is 'Ա�����';
comment on column EMP_INFO.cardcode
  is '������';
comment on column EMP_INFO.name
  is '����';
comment on column EMP_INFO.pinyin
  is '����ƴ��';
comment on column EMP_INFO.sexid
  is '�Ա�ID';
comment on column EMP_INFO.sex
  is '�Ա�';
comment on column EMP_INFO.birthday
  is '��������';
comment on column EMP_INFO.bloodtypeid
  is 'Ѫ��ID';
comment on column EMP_INFO.bloodtype
  is 'Ѫ��';
comment on column EMP_INFO.idcard
  is '���֤��';
comment on column EMP_INFO.marryid
  is '����״��ID';
comment on column EMP_INFO.marry
  is '����״��';
comment on column EMP_INFO.nation
  is '����';
comment on column EMP_INFO.nationid
  is '����ID';
comment on column EMP_INFO.birthplace
  is '�����ص�';
comment on column EMP_INFO.originplace
  is '����';
comment on column EMP_INFO.photo
  is '��Ƭ����';
comment on column EMP_INFO.personindentityid
  is '�������ID';
comment on column EMP_INFO.personindentity
  is '�������';
comment on column EMP_INFO.politicaloutlookid
  is '������òID';
comment on column EMP_INFO.politicaloutlook
  is '������ò';
comment on column EMP_INFO.joininparty
  is '�μӵ���ʱ��';
comment on column EMP_INFO.partyoffice
  is '����ְ��';
comment on column EMP_INFO.workingtime
  is '�μӹ���ʱ��';
comment on column EMP_INFO.city
  is '��������';
comment on column EMP_INFO.officeaddress
  is '�칫��ַ';
comment on column EMP_INFO.officephone
  is '�̶��绰';
comment on column EMP_INFO.mobile
  is '�ƶ��绰';
comment on column EMP_INFO.email
  is '�����ʼ�';
comment on column EMP_INFO.officepostalcode
  is '�칫����������';
comment on column EMP_INFO.homeaddress
  is '��ͥסַ';
comment on column EMP_INFO.homephone
  is 'סլ�绰';
comment on column EMP_INFO.homepostalcode
  is '��ͥ���ڵ���������';
comment on column EMP_INFO.emergencyperson
  is '����������';
comment on column EMP_INFO.emergencyphone
  is '��������绰';
comment on column EMP_INFO.description
  is '��������';
comment on column EMP_INFO.creator_id
  is '������id';
comment on column EMP_INFO.creator
  is '������';
comment on column EMP_INFO.create_date
  is '��������';
comment on column EMP_INFO.modifiedby
  is '�޸���';
comment on column EMP_INFO.modifiedby_id
  is '�޸���id';
comment on column EMP_INFO.modified_date
  is '�޸�����';
comment on column EMP_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column EMP_INFO.version
  is '�汾��';
comment on column EMP_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column EMP_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column EMP_INFO.bus_date
  is 'ҵ��ʱ��';
comment on column EMP_INFO.exa_remarks
  is '������ע';

prompt
prompt Creating table EMP_MANAGEMENTINFO
prompt =================================
prompt
create table EMP_MANAGEMENTINFO
(
  id                NUMBER,
  sid               NUMBER,
  empid             NUMBER,
  empcode           VARCHAR2(255),
  joininipbtime     DATE,
  unit              VARCHAR2(255),
  department        VARCHAR2(255),
  joinincorptime    DATE,
  statusdate        DATE,
  emptypeid         NUMBER,
  emptype           VARCHAR2(255),
  joinintypeid      NUMBER,
  joinintype        VARCHAR2(255),
  job               VARCHAR2(255),
  joblevel          VARCHAR2(255),
  nowjobbegindate   DATE,
  contracttypeid    NUMBER,
  contracttype      VARCHAR2(255),
  contractbegindate DATE,
  contractenddate   DATE,
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
  exa_remarks       VARCHAR2(500)
)
;
comment on table EMP_MANAGEMENTINFO
  is '�������Ա�';
comment on column EMP_MANAGEMENTINFO.id
  is '����';
comment on column EMP_MANAGEMENTINFO.sid
  is 'ԭϵͳID';
comment on column EMP_MANAGEMENTINFO.empid
  is 'EmpID';
comment on column EMP_MANAGEMENTINFO.empcode
  is 'Ա�����';
comment on column EMP_MANAGEMENTINFO.joininipbtime
  is '�������̾�ϵͳ����ʱ��';
comment on column EMP_MANAGEMENTINFO.unit
  is '���ڵ�λ';
comment on column EMP_MANAGEMENTINFO.department
  is '����';
comment on column EMP_MANAGEMENTINFO.joinincorptime
  is '��˾����';
comment on column EMP_MANAGEMENTINFO.statusdate
  is 'ת������';
comment on column EMP_MANAGEMENTINFO.emptypeid
  is 'Ա�����ID';
comment on column EMP_MANAGEMENTINFO.emptype
  is 'Ա�����';
comment on column EMP_MANAGEMENTINFO.joinintypeid
  is '��˾��ʽID';
comment on column EMP_MANAGEMENTINFO.joinintype
  is '��˾��ʽ';
comment on column EMP_MANAGEMENTINFO.job
  is 'ְ��';
comment on column EMP_MANAGEMENTINFO.joblevel
  is 'ְ�񼶱�';
comment on column EMP_MANAGEMENTINFO.nowjobbegindate
  is '��ְ��ʼ����';
comment on column EMP_MANAGEMENTINFO.contracttypeid
  is '��ͬ���ID';
comment on column EMP_MANAGEMENTINFO.contracttype
  is '��ͬ���';
comment on column EMP_MANAGEMENTINFO.contractbegindate
  is '��ͬǩ������';
comment on column EMP_MANAGEMENTINFO.contractenddate
  is '��ͬ��������';
comment on column EMP_MANAGEMENTINFO.description
  is '��������';
comment on column EMP_MANAGEMENTINFO.creator_id
  is '������id';
comment on column EMP_MANAGEMENTINFO.creator
  is '������';
comment on column EMP_MANAGEMENTINFO.create_date
  is '��������';
comment on column EMP_MANAGEMENTINFO.modifiedby
  is '�޸���';
comment on column EMP_MANAGEMENTINFO.modifiedby_id
  is '�޸���id';
comment on column EMP_MANAGEMENTINFO.modified_date
  is '�޸�����';
comment on column EMP_MANAGEMENTINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column EMP_MANAGEMENTINFO.version
  is '�汾��';
comment on column EMP_MANAGEMENTINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column EMP_MANAGEMENTINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column EMP_MANAGEMENTINFO.bus_date
  is 'ҵ��ʱ��';
comment on column EMP_MANAGEMENTINFO.exa_remarks
  is '������ע';

prompt
prompt Creating table EMP_TRAINEXP
prompt ===========================
prompt
create table EMP_TRAINEXP
(
  id             NUMBER,
  sid            NUMBER,
  empid          NUMBER,
  empcode        VARCHAR2(255),
  begindate      DATE,
  enddate        DATE,
  content        VARCHAR2(255),
  unit           VARCHAR2(255),
  typeid         NUMBER,
  type           VARCHAR2(255),
  modeid         NUMBER,
  trainmode      VARCHAR2(255),
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
comment on table EMP_TRAINEXP
  is '��ѵ������';
comment on column EMP_TRAINEXP.id
  is '���� ';
comment on column EMP_TRAINEXP.sid
  is 'ԭϵͳID ';
comment on column EMP_TRAINEXP.empid
  is 'EmpID ';
comment on column EMP_TRAINEXP.empcode
  is 'Ա����� ';
comment on column EMP_TRAINEXP.begindate
  is '��ʼ���� ';
comment on column EMP_TRAINEXP.enddate
  is '�������� ';
comment on column EMP_TRAINEXP.content
  is '��ѵ���� ';
comment on column EMP_TRAINEXP.unit
  is '��ѵ���� ';
comment on column EMP_TRAINEXP.typeid
  is '��ѵ����ID ';
comment on column EMP_TRAINEXP.type
  is '��ѵ���� ';
comment on column EMP_TRAINEXP.modeid
  is '��ѵ��ʽID ';
comment on column EMP_TRAINEXP.trainmode
  is '��ѵ��ʽ ';
comment on column EMP_TRAINEXP.description
  is '��������';
comment on column EMP_TRAINEXP.creator_id
  is '������id';
comment on column EMP_TRAINEXP.creator
  is '������';
comment on column EMP_TRAINEXP.create_date
  is '��������';
comment on column EMP_TRAINEXP.modifiedby
  is '�޸���';
comment on column EMP_TRAINEXP.modifiedby_id
  is '�޸���id';
comment on column EMP_TRAINEXP.modified_date
  is '�޸�����';
comment on column EMP_TRAINEXP.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column EMP_TRAINEXP.version
  is '�汾��';
comment on column EMP_TRAINEXP.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column EMP_TRAINEXP.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column EMP_TRAINEXP.bus_date
  is 'ҵ��ʱ��';
comment on column EMP_TRAINEXP.exa_remarks
  is '������ע';

prompt
prompt Creating table EMP_WORK_EXP
prompt ===========================
prompt
create table EMP_WORK_EXP
(
  id             NUMBER,
  sid            NUMBER,
  empid          NUMBER,
  empcode        VARCHAR2(255),
  begindate      DATE,
  enddate        DATE,
  unit           VARCHAR2(255),
  department     VARCHAR2(255),
  job            VARCHAR2(255),
  working        VARCHAR2(255),
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
comment on table EMP_WORK_EXP
  is '����������';
comment on column EMP_WORK_EXP.id
  is '����';
comment on column EMP_WORK_EXP.sid
  is 'ԭϵͳID';
comment on column EMP_WORK_EXP.empid
  is 'EmpID';
comment on column EMP_WORK_EXP.empcode
  is 'Ա�����';
comment on column EMP_WORK_EXP.begindate
  is '��ʼ����';
comment on column EMP_WORK_EXP.enddate
  is '��������';
comment on column EMP_WORK_EXP.unit
  is '��λ';
comment on column EMP_WORK_EXP.department
  is '����';
comment on column EMP_WORK_EXP.job
  is 'ְ��';
comment on column EMP_WORK_EXP.working
  is '�����£��ֹܣ��Ĺ���';
comment on column EMP_WORK_EXP.description
  is '��������';
comment on column EMP_WORK_EXP.creator_id
  is '������id';
comment on column EMP_WORK_EXP.creator
  is '������';
comment on column EMP_WORK_EXP.create_date
  is '��������';
comment on column EMP_WORK_EXP.modifiedby
  is '�޸���';
comment on column EMP_WORK_EXP.modifiedby_id
  is '�޸���id';
comment on column EMP_WORK_EXP.modified_date
  is '�޸�����';
comment on column EMP_WORK_EXP.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column EMP_WORK_EXP.version
  is '�汾��';
comment on column EMP_WORK_EXP.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column EMP_WORK_EXP.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column EMP_WORK_EXP.bus_date
  is 'ҵ��ʱ��';
comment on column EMP_WORK_EXP.exa_remarks
  is '������ע';

prompt
prompt Creating table LAND_INFO
prompt ========================
prompt
create table LAND_INFO
(
  id                 NUMBER,
  sid                NUMBER,
  syscode            VARCHAR2(255),
  landcode           VARCHAR2(255),
  landtypeid         NUMBER,
  landtype           VARCHAR2(255),
  landposition       VARCHAR2(255),
  landname           VARCHAR2(255),
  landareadivisionid NUMBER,
  landareadivision   VARCHAR2(255),
  landapprovenumber  VARCHAR2(255),
  landapprovedate    DATE,
  parentname         VARCHAR2(255),
  landstatusid       NUMBER,
  landstatus         VARCHAR2(255),
  landshape          VARCHAR2(255),
  landlength         NUMBER,
  landwidth          NUMBER,
  landarea_mu        NUMBER,
  landarea_square    NUMBER,
  landphoto          VARCHAR2(255),
  landusingid        NUMBER,
  landusing          VARCHAR2(255),
  description        VARCHAR2(255),
  creator_id         VARCHAR2(120),
  creator            VARCHAR2(120),
  create_date        DATE,
  modifiedby         VARCHAR2(120),
  modifiedby_id      VARCHAR2(120),
  modified_date      DATE,
  version_status     NUMBER,
  version            NUMBER,
  latestversion      NUMBER,
  approvalstae       NUMBER,
  bus_date           DATE,
  exa_remarks        VARCHAR2(500)
)
;
comment on table LAND_INFO
  is '���ػ�����Ϣ��';
comment on column LAND_INFO.id
  is 'ID';
comment on column LAND_INFO.sid
  is 'ԭϵͳID';
comment on column LAND_INFO.syscode
  is 'ϵͳ����';
comment on column LAND_INFO.landcode
  is '�ؿ����';
comment on column LAND_INFO.landtypeid
  is '�ؿ�����ID';
comment on column LAND_INFO.landtype
  is '�ؿ�����';
comment on column LAND_INFO.landposition
  is '�ؿ�λ��';
comment on column LAND_INFO.landname
  is '�ؿ�����';
comment on column LAND_INFO.landareadivisionid
  is '�ؿ�����ID';
comment on column LAND_INFO.landareadivision
  is '�ؿ�����';
comment on column LAND_INFO.landapprovenumber
  is '�ؿ���׼�ĺ�';
comment on column LAND_INFO.landapprovedate
  is '�ؿ���׼ʱ��';
comment on column LAND_INFO.parentname
  is 'Ȩ������';
comment on column LAND_INFO.landstatusid
  is '�ؿ�״̬ID';
comment on column LAND_INFO.landstatus
  is '�ؿ�״̬';
comment on column LAND_INFO.landshape
  is '�ؿ���״';
comment on column LAND_INFO.landlength
  is '�ؿ鳤��';
comment on column LAND_INFO.landwidth
  is '�ؿ���';
comment on column LAND_INFO.landarea_mu
  is '�ؿ������Ķ��';
comment on column LAND_INFO.landarea_square
  is '�ؿ������ƽ���ף�';
comment on column LAND_INFO.landphoto
  is '�ؿ�ͼƬ';
comment on column LAND_INFO.landusingid
  is '�ؿ���;ID';
comment on column LAND_INFO.landusing
  is '�ؿ���;';
comment on column LAND_INFO.description
  is '��������';
comment on column LAND_INFO.creator_id
  is '������id';
comment on column LAND_INFO.creator
  is '������';
comment on column LAND_INFO.create_date
  is '��������';
comment on column LAND_INFO.modifiedby
  is '�޸���';
comment on column LAND_INFO.modifiedby_id
  is '�޸���id';
comment on column LAND_INFO.modified_date
  is '�޸�����';
comment on column LAND_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LAND_INFO.version
  is '�汾��';
comment on column LAND_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LAND_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LAND_INFO.bus_date
  is 'ҵ��ʱ��';
comment on column LAND_INFO.exa_remarks
  is '������ע';

prompt
prompt Creating table LAND_MAKEINFO
prompt ============================
prompt
create table LAND_MAKEINFO
(
  id             NUMBER,
  sid            NUMBER,
  landid         NUMBER,
  landcode       VARCHAR2(255),
  makecost       NUMBER,
  makeprice      NUMBER,
  stonevolume    NUMBER,
  makeyear       VARCHAR2(255),
  contcode       VARCHAR2(255),
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
comment on table LAND_MAKEINFO
  is '�����Ϣ��';
comment on column LAND_MAKEINFO.id
  is 'ID';
comment on column LAND_MAKEINFO.sid
  is 'ԭϵͳID';
comment on column LAND_MAKEINFO.landid
  is 'LandID';
comment on column LAND_MAKEINFO.landcode
  is '�ؿ����';
comment on column LAND_MAKEINFO.makecost
  is '��سɱ�';
comment on column LAND_MAKEINFO.makeprice
  is '��ص���';
comment on column LAND_MAKEINFO.stonevolume
  is '��ʯ����';
comment on column LAND_MAKEINFO.makeyear
  is '������';
comment on column LAND_MAKEINFO.contcode
  is '��ͬ���';
comment on column LAND_MAKEINFO.description
  is '��������';
comment on column LAND_MAKEINFO.creator_id
  is '������id';
comment on column LAND_MAKEINFO.creator
  is '������';
comment on column LAND_MAKEINFO.create_date
  is '��������';
comment on column LAND_MAKEINFO.modifiedby
  is '�޸���';
comment on column LAND_MAKEINFO.modifiedby_id
  is '�޸���id';
comment on column LAND_MAKEINFO.modified_date
  is '�޸�����';
comment on column LAND_MAKEINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LAND_MAKEINFO.version
  is '�汾��';
comment on column LAND_MAKEINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LAND_MAKEINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LAND_MAKEINFO.bus_date
  is 'ҵ��ʱ��';
comment on column LAND_MAKEINFO.exa_remarks
  is '������ע';

prompt
prompt Creating table LAND_PLANINFO
prompt ============================
prompt
create table LAND_PLANINFO
(
  id              NUMBER,
  sid             NUMBER,
  landid          NUMBER,
  landcode        VARCHAR2(255),
  buydate         DATE,
  developdate     DATE,
  iguid           VARCHAR2(255),
  transferdate    DATE,
  transferperiod  DATE,
  transferprice   NUMBER,
  usingunitid     NUMBER,
  usingunit       VARCHAR2(255),
  parcelcode      VARCHAR2(255),
  makecost        NUMBER,
  buycost         NUMBER,
  transferprofit  NUMBER,
  financefee      NUMBER,
  managefee       NUMBER,
  areacode        VARCHAR2(255),
  areameasure     NUMBER,
  landscopelineid NUMBER,
  landscopeline   VARCHAR2(255),
  landplanlayerid NUMBER,
  landplanlayer   VARCHAR2(255),
  description     VARCHAR2(255),
  creator_id      VARCHAR2(120),
  creator         VARCHAR2(120),
  create_date     DATE,
  modifiedby      VARCHAR2(120),
  modifiedby_id   VARCHAR2(120),
  modified_date   DATE,
  version_status  NUMBER,
  version         NUMBER,
  latestversion   NUMBER,
  approvalstae    NUMBER,
  bus_date        DATE,
  exa_remarks     VARCHAR2(500)
)
;
comment on table LAND_PLANINFO
  is '�滮��Ϣ��';
comment on column LAND_PLANINFO.id
  is 'ID';
comment on column LAND_PLANINFO.sid
  is 'ԭϵͳID';
comment on column LAND_PLANINFO.landid
  is 'LandID';
comment on column LAND_PLANINFO.landcode
  is '�ؿ����';
comment on column LAND_PLANINFO.buydate
  is '����ʱ��';
comment on column LAND_PLANINFO.developdate
  is '����ʱ��';
comment on column LAND_PLANINFO.iguid
  is 'IGUID';
comment on column LAND_PLANINFO.transferdate
  is 'ת��ʱ��';
comment on column LAND_PLANINFO.transferperiod
  is 'ת������';
comment on column LAND_PLANINFO.transferprice
  is 'ת�ü۸�';
comment on column LAND_PLANINFO.usingunitid
  is 'ʹ�õ�λID';
comment on column LAND_PLANINFO.usingunit
  is 'ʹ�õ�λ';
comment on column LAND_PLANINFO.parcelcode
  is '�ڵر��';
comment on column LAND_PLANINFO.makecost
  is '��سɱ�';
comment on column LAND_PLANINFO.buycost
  is '���سɱ�';
comment on column LAND_PLANINFO.transferprofit
  is 'ת������';
comment on column LAND_PLANINFO.financefee
  is '�������';
comment on column LAND_PLANINFO.managefee
  is '�������';
comment on column LAND_PLANINFO.areacode
  is '������';
comment on column LAND_PLANINFO.areameasure
  is '�������';
comment on column LAND_PLANINFO.landscopelineid
  is '�õط�Χ��ID';
comment on column LAND_PLANINFO.landscopeline
  is '�õط�Χ��';
comment on column LAND_PLANINFO.landplanlayerid
  is '�õع滮ͼ��ID';
comment on column LAND_PLANINFO.landplanlayer
  is '�õع滮ͼ��';
comment on column LAND_PLANINFO.description
  is '��������';
comment on column LAND_PLANINFO.creator_id
  is '������id';
comment on column LAND_PLANINFO.creator
  is '������';
comment on column LAND_PLANINFO.create_date
  is '��������';
comment on column LAND_PLANINFO.modifiedby
  is '�޸���';
comment on column LAND_PLANINFO.modifiedby_id
  is '�޸���id';
comment on column LAND_PLANINFO.modified_date
  is '�޸�����';
comment on column LAND_PLANINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LAND_PLANINFO.version
  is '�汾��';
comment on column LAND_PLANINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LAND_PLANINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LAND_PLANINFO.bus_date
  is 'ҵ��ʱ��';
comment on column LAND_PLANINFO.exa_remarks
  is '������ע';

prompt
prompt Creating table LAND_SELLINFO
prompt ============================
prompt
create table LAND_SELLINFO
(
  id                         NUMBER,
  sid                        NUMBER,
  landid                     NUMBER,
  landcode                   VARCHAR2(255),
  sellyear                   VARCHAR2(255),
  plantransferyear           VARCHAR2(255),
  sellcontcode               VARCHAR2(255),
  parcelcode                 VARCHAR2(255),
  transfer                   VARCHAR2(255),
  transferee                 VARCHAR2(255),
  dealdate                   DATE,
  contcode                   VARCHAR2(255),
  contname                   VARCHAR2(255),
  prelandtransferbuycontcode VARCHAR2(255),
  prelandtransferbuycontname VARCHAR2(255),
  landtransferperiod         VARCHAR2(255),
  transfertotalamount        NUMBER,
  sellprice                  NUMBER,
  conttotalamount            NUMBER,
  agreedate                  DATE,
  reallydate                 DATE,
  bookingpayoffdate          DATE,
  reallypayoffdate           DATE,
  description                VARCHAR2(255),
  creator_id                 VARCHAR2(120),
  creator                    VARCHAR2(120),
  create_date                DATE,
  modifiedby                 VARCHAR2(120),
  modifiedby_id              VARCHAR2(120),
  modified_date              DATE,
  version_status             NUMBER,
  version                    NUMBER,
  latestversion              NUMBER,
  approvalstae               NUMBER,
  bus_date                   DATE,
  exa_remarks                VARCHAR2(500)
)
;
comment on table LAND_SELLINFO
  is '�۵���Ϣ��';
comment on column LAND_SELLINFO.id
  is 'ID';
comment on column LAND_SELLINFO.sid
  is 'ԭϵͳID';
comment on column LAND_SELLINFO.landid
  is 'LandID';
comment on column LAND_SELLINFO.landcode
  is '�ؿ����';
comment on column LAND_SELLINFO.sellyear
  is '�۵����';
comment on column LAND_SELLINFO.plantransferyear
  is '�ƻ�ת�����';
comment on column LAND_SELLINFO.sellcontcode
  is '�۵غ�ͬ���';
comment on column LAND_SELLINFO.parcelcode
  is '�ڵغ�';
comment on column LAND_SELLINFO.transfer
  is '�ؿ�ת�÷�';
comment on column LAND_SELLINFO.transferee
  is '�ؿ����÷�';
comment on column LAND_SELLINFO.dealdate
  is '����ʱ��';
comment on column LAND_SELLINFO.contcode
  is '��ͬ���';
comment on column LAND_SELLINFO.contname
  is '��ͬ����';
comment on column LAND_SELLINFO.prelandtransferbuycontcode
  is 'ԭ���س��ú�ͬ�ţ����غ�ͬ��';
comment on column LAND_SELLINFO.prelandtransferbuycontname
  is 'ԭ���س��ú�ͬ����';
comment on column LAND_SELLINFO.landtransferperiod
  is '����ת������';
comment on column LAND_SELLINFO.transfertotalamount
  is 'ת���ܼ�';
comment on column LAND_SELLINFO.sellprice
  is '�۵ص���';
comment on column LAND_SELLINFO.conttotalamount
  is '��ͬ���';
comment on column LAND_SELLINFO.agreedate
  is 'Լ������ʱ��';
comment on column LAND_SELLINFO.reallydate
  is 'ʵ�ʽ���ʱ��';
comment on column LAND_SELLINFO.bookingpayoffdate
  is 'Ԥ������ʱ��';
comment on column LAND_SELLINFO.reallypayoffdate
  is 'ʵ�ʸ���ʱ��';
comment on column LAND_SELLINFO.description
  is '��������';
comment on column LAND_SELLINFO.creator_id
  is '������id';
comment on column LAND_SELLINFO.creator
  is '������';
comment on column LAND_SELLINFO.create_date
  is '��������';
comment on column LAND_SELLINFO.modifiedby
  is '�޸���';
comment on column LAND_SELLINFO.modifiedby_id
  is '�޸���id';
comment on column LAND_SELLINFO.modified_date
  is '�޸�����';
comment on column LAND_SELLINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LAND_SELLINFO.version
  is '�汾��';
comment on column LAND_SELLINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LAND_SELLINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LAND_SELLINFO.bus_date
  is 'ҵ��ʱ��';
comment on column LAND_SELLINFO.exa_remarks
  is '������ע';

prompt
prompt Creating table LAND_STORAGEINFO
prompt ===============================
prompt
create table LAND_STORAGEINFO
(
  id             NUMBER,
  sid            NUMBER,
  landid         NUMBER,
  landcode       VARCHAR2(255),
  storagecode    VARCHAR2(255),
  projectname    VARCHAR2(255),
  storageyear    VARCHAR2(255),
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
comment on table LAND_STORAGEINFO
  is '������Ϣ��';
comment on column LAND_STORAGEINFO.id
  is 'ID';
comment on column LAND_STORAGEINFO.sid
  is 'ԭϵͳID';
comment on column LAND_STORAGEINFO.landid
  is 'LandID';
comment on column LAND_STORAGEINFO.landcode
  is '�ؿ����';
comment on column LAND_STORAGEINFO.storagecode
  is '�ؿ鿪������';
comment on column LAND_STORAGEINFO.projectname
  is '�ؿ鿪������';
comment on column LAND_STORAGEINFO.storageyear
  is '�������';
comment on column LAND_STORAGEINFO.description
  is '��������';
comment on column LAND_STORAGEINFO.creator_id
  is '������id';
comment on column LAND_STORAGEINFO.creator
  is '������';
comment on column LAND_STORAGEINFO.create_date
  is '��������';
comment on column LAND_STORAGEINFO.modifiedby
  is '�޸���';
comment on column LAND_STORAGEINFO.modifiedby_id
  is '�޸���id';
comment on column LAND_STORAGEINFO.modified_date
  is '�޸�����';
comment on column LAND_STORAGEINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LAND_STORAGEINFO.version
  is '�汾��';
comment on column LAND_STORAGEINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LAND_STORAGEINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LAND_STORAGEINFO.bus_date
  is 'ҵ��ʱ��';
comment on column LAND_STORAGEINFO.exa_remarks
  is '������ע';

prompt
prompt Creating table LC_CONT_BUYLANDDETAIL
prompt ====================================
prompt
create table LC_CONT_BUYLANDDETAIL
(
  stockcontid     VARCHAR2(255),
  payitemcode     VARCHAR2(255),
  payitemname     VARCHAR2(255),
  contnum         NUMBER,
  contunit        NUMBER,
  contcost        NUMBER,
  contratio       NUMBER,
  processrelation VARCHAR2(255),
  numctrl         VARCHAR2(255),
  standard        VARCHAR2(255),
  countingunit    VARCHAR2(255),
  valuation       VARCHAR2(255),
  areanum         VARCHAR2(255),
  landnum         VARCHAR2(255),
  area            NUMBER,
  planpayoff      NUMBER,
  landtype        VARCHAR2(255),
  payoffitem      VARCHAR2(255),
  nowpayoff       NUMBER,
  totalpayoff     NUMBER,
  edetailid       NUMBER,
  approvenum      VARCHAR2(255),
  approvedate     DATE,
  prjcode         VARCHAR2(255),
  prjname         VARCHAR2(255),
  ownerunit       VARCHAR2(255),
  createrunit     VARCHAR2(255),
  payofflimit     NUMBER,
  whichtimes      NUMBER,
  description     VARCHAR2(255),
  creator_id      VARCHAR2(120),
  creator         VARCHAR2(120),
  create_date     DATE,
  modifiedby      VARCHAR2(120),
  modifiedby_id   VARCHAR2(120),
  modified_date   DATE,
  version_status  NUMBER,
  version         NUMBER,
  latestversion   NUMBER,
  approvalstae    NUMBER,
  bus_date        DATE,
  exa_remarks     VARCHAR2(500),
  src_table       VARCHAR2(255),
  src_system      VARCHAR2(255),
  sort_id         NUMBER(38)
)
;
comment on table LC_CONT_BUYLANDDETAIL
  is '���غ�ͬ��';
comment on column LC_CONT_BUYLANDDETAIL.stockcontid
  is '��ͬ���';
comment on column LC_CONT_BUYLANDDETAIL.payitemcode
  is '֧�������';
comment on column LC_CONT_BUYLANDDETAIL.payitemname
  is '֧��������';
comment on column LC_CONT_BUYLANDDETAIL.contnum
  is '��ͬ����';
comment on column LC_CONT_BUYLANDDETAIL.contunit
  is '��ͬ����';
comment on column LC_CONT_BUYLANDDETAIL.contcost
  is '�������';
comment on column LC_CONT_BUYLANDDETAIL.contratio
  is '֧��ϵ��';
comment on column LC_CONT_BUYLANDDETAIL.processrelation
  is '���ȹ���';
comment on column LC_CONT_BUYLANDDETAIL.numctrl
  is '��������';
comment on column LC_CONT_BUYLANDDETAIL.standard
  is '���';
comment on column LC_CONT_BUYLANDDETAIL.countingunit
  is '������λ';
comment on column LC_CONT_BUYLANDDETAIL.valuation
  is '��Լ����';
comment on column LC_CONT_BUYLANDDETAIL.areanum
  is '������';
comment on column LC_CONT_BUYLANDDETAIL.landnum
  is '�ؿ���';
comment on column LC_CONT_BUYLANDDETAIL.area
  is '���';
comment on column LC_CONT_BUYLANDDETAIL.planpayoff
  is '�ƻ�֧�����';
comment on column LC_CONT_BUYLANDDETAIL.landtype
  is '��������';
comment on column LC_CONT_BUYLANDDETAIL.payoffitem
  is '֧����Ŀ';
comment on column LC_CONT_BUYLANDDETAIL.nowpayoff
  is '����֧�����';
comment on column LC_CONT_BUYLANDDETAIL.totalpayoff
  is '�ۼ�֧�����';
comment on column LC_CONT_BUYLANDDETAIL.edetailid
  is 'EDetailID';
comment on column LC_CONT_BUYLANDDETAIL.approvenum
  is '��׼�ĺ�';
comment on column LC_CONT_BUYLANDDETAIL.approvedate
  is '��׼ʱ��';
comment on column LC_CONT_BUYLANDDETAIL.prjcode
  is '��Ŀ���';
comment on column LC_CONT_BUYLANDDETAIL.prjname
  is '��Ŀ����';
comment on column LC_CONT_BUYLANDDETAIL.ownerunit
  is 'ҵ����λ';
comment on column LC_CONT_BUYLANDDETAIL.createrunit
  is '���λ';
comment on column LC_CONT_BUYLANDDETAIL.payofflimit
  is '֧�����';
comment on column LC_CONT_BUYLANDDETAIL.whichtimes
  is '��_�θ���';
comment on column LC_CONT_BUYLANDDETAIL.description
  is '��������';
comment on column LC_CONT_BUYLANDDETAIL.creator_id
  is '������id';
comment on column LC_CONT_BUYLANDDETAIL.creator
  is '������';
comment on column LC_CONT_BUYLANDDETAIL.create_date
  is '��������';
comment on column LC_CONT_BUYLANDDETAIL.modifiedby
  is '�޸���';
comment on column LC_CONT_BUYLANDDETAIL.modifiedby_id
  is '�޸���id';
comment on column LC_CONT_BUYLANDDETAIL.modified_date
  is '�޸�����';
comment on column LC_CONT_BUYLANDDETAIL.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_CONT_BUYLANDDETAIL.version
  is '�汾��';
comment on column LC_CONT_BUYLANDDETAIL.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_CONT_BUYLANDDETAIL.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_CONT_BUYLANDDETAIL.bus_date
  is 'ҵ������';
comment on column LC_CONT_BUYLANDDETAIL.exa_remarks
  is '������ע';
comment on column LC_CONT_BUYLANDDETAIL.src_table
  is '��Դʵ��';
comment on column LC_CONT_BUYLANDDETAIL.src_system
  is '��Դϵͳ';
comment on column LC_CONT_BUYLANDDETAIL.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_CONT_HOUSESALEINFO
prompt ====================================
prompt
create table LC_CONT_HOUSESALEINFO
(
  landlinencename            VARCHAR2(255),
  landlinencecode            VARCHAR2(255),
  landlinencearea            NUMBER,
  landlinenceunit            VARCHAR2(255),
  landlinencedate            DATE,
  prjplanlinencename         VARCHAR2(255),
  prjplanlinencecode         VARCHAR2(255),
  prjplanlinencearea         NUMBER,
  prjplanlinenceunit         VARCHAR2(255),
  prjplanlinencedate         DATE,
  prjplanlinenceperiod       NUMBER,
  prjconstlinence            VARCHAR2(255),
  prjconstlinencecunit       VARCHAR2(255),
  prjconstlinencedate        DATE,
  prjconstlinenceunit        VARCHAR2(255),
  landusecertificate         VARCHAR2(255),
  landuseperiod              NUMBER,
  landcertificatenum         VARCHAR2(255),
  landdevelopusing           VARCHAR2(255),
  landusecertificatearea     NUMBER,
  landusecertificatecunit    VARCHAR2(255),
  preselllinence             VARCHAR2(255),
  preselllinenceperiod       DATE,
  preselllinenceunit         VARCHAR2(255),
  presellprojectname         VARCHAR2(255),
  presellprojectaddress      VARCHAR2(255),
  presellprojectusing        VARCHAR2(255),
  presellobject              VARCHAR2(255),
  presellnumber              NUMBER,
  preselltotalarea           NUMBER,
  projectareas               VARCHAR2(255),
  projectlandlevel           VARCHAR2(255),
  developunit                VARCHAR2(255),
  unitcharater               VARCHAR2(255),
  unitaddress                VARCHAR2(255),
  legalperson                VARCHAR2(255),
  projectmanager             VARCHAR2(255),
  contactphone               VARCHAR2(255),
  capitalregulationbank      VARCHAR2(255),
  capitalregulationaccount   VARCHAR2(255),
  buildingname               VARCHAR2(255),
  buildingnumber             VARCHAR2(255),
  buildingunitnumber         VARCHAR2(255),
  housenumber                VARCHAR2(255),
  housecode                  VARCHAR2(255),
  contructionarea            NUMBER,
  publicarea                 NUMBER,
  privatearea                NUMBER,
  huxing                     VARCHAR2(255),
  toilet                     VARCHAR2(255),
  balcony                    VARCHAR2(255),
  propertytype               VARCHAR2(255),
  preselltotalamount         NUMBER,
  housestatus                VARCHAR2(255),
  wherehouse                 VARCHAR2(255),
  whencreate                 VARCHAR2(255),
  structure                  VARCHAR2(255),
  bulidtotalfloots           NUMBER,
  floots                     NUMBER,
  housecharater              VARCHAR2(255),
  flootheight                VARCHAR2(255),
  sellername                 VARCHAR2(255),
  bussinesslinence           VARCHAR2(255),
  authorizeperson            VARCHAR2(255),
  certificationlevel         VARCHAR2(255),
  sellercontactphone         VARCHAR2(255),
  isclient                   VARCHAR2(255),
  clientname                 VARCHAR2(255),
  clientlegalperson          VARCHAR2(255),
  sellercontactaddress       VARCHAR2(255),
  sellerbank                 VARCHAR2(255),
  sellerbankaccount          VARCHAR2(255),
  buyername                  VARCHAR2(255),
  buyername2                 VARCHAR2(255),
  buyercertification         VARCHAR2(255),
  certificationnum           VARCHAR2(255),
  buyercontactphone          VARCHAR2(255),
  buyercontactaddress        VARCHAR2(255),
  buyersex                   VARCHAR2(255),
  buyernationality           VARCHAR2(255),
  buyernation                VARCHAR2(255),
  payoffmode                 VARCHAR2(255),
  contcode                   VARCHAR2(255),
  stockcontid                VARCHAR2(255),
  contracttime               DATE,
  contbackuptime             DATE,
  firstpay                   NUMBER,
  firstpayratio              NUMBER,
  loanamount                 NUMBER,
  loanperiod                 NUMBER,
  fundloan                   NUMBER,
  bussinessloan              NUMBER,
  paymentaccount             VARCHAR2(255),
  accountbank                VARCHAR2(255),
  sellprice                  NUMBER,
  selltotalamount            NUMBER,
  areasupplement             NUMBER,
  getintime                  DATE,
  propertyfeestandand        NUMBER,
  propertyunitname           VARCHAR2(255),
  propertylegalperson        VARCHAR2(255),
  propertybussinessnum       VARCHAR2(255),
  propertycertificationlevel VARCHAR2(255),
  propertymanagementperiod   NUMBER,
  createpersonid             NUMBER,
  createperson               VARCHAR2(255),
  createtime                 DATE,
  sbjstate                   NUMBER,
  description                VARCHAR2(255),
  creator_id                 VARCHAR2(120),
  creator                    VARCHAR2(120),
  create_date                DATE,
  modifiedby                 VARCHAR2(120),
  modifiedby_id              VARCHAR2(120),
  modified_date              DATE,
  version_status             NUMBER,
  version                    NUMBER,
  latestversion              NUMBER,
  approvalstae               NUMBER,
  bus_date                   DATE,
  exa_remarks                VARCHAR2(500),
  src_table                  VARCHAR2(255),
  src_system                 VARCHAR2(255),
  sort_id                    NUMBER(38)
)
;
comment on table LC_CONT_HOUSESALEINFO
  is '�������ۺ�ͬ��Ϣ��';
comment on column LC_CONT_HOUSESALEINFO.landlinencename
  is '�����õع滮���֤����';
comment on column LC_CONT_HOUSESALEINFO.landlinencecode
  is '�����õع滮���֤���';
comment on column LC_CONT_HOUSESALEINFO.landlinencearea
  is '�����õع滮���֤���';
comment on column LC_CONT_HOUSESALEINFO.landlinenceunit
  is '�����õع滮���֤��֤��λ';
comment on column LC_CONT_HOUSESALEINFO.landlinencedate
  is '�����õع滮���֤����';
comment on column LC_CONT_HOUSESALEINFO.prjplanlinencename
  is '���蹤�̹滮���֤����';
comment on column LC_CONT_HOUSESALEINFO.prjplanlinencecode
  is '���蹤�̹滮���֤���';
comment on column LC_CONT_HOUSESALEINFO.prjplanlinencearea
  is '���蹤�̹滮���֤���';
comment on column LC_CONT_HOUSESALEINFO.prjplanlinenceunit
  is '���蹤�̹滮���֤��֤��λ';
comment on column LC_CONT_HOUSESALEINFO.prjplanlinencedate
  is '���蹤�̹滮���֤����';
comment on column LC_CONT_HOUSESALEINFO.prjplanlinenceperiod
  is '���蹤�̹滮���֤����';
comment on column LC_CONT_HOUSESALEINFO.prjconstlinence
  is '��������ʩ�����֤';
comment on column LC_CONT_HOUSESALEINFO.prjconstlinencecunit
  is '��������ʩ����֤��λ';
comment on column LC_CONT_HOUSESALEINFO.prjconstlinencedate
  is '��������ʩ����֤����';
comment on column LC_CONT_HOUSESALEINFO.prjconstlinenceunit
  is '��������ʩ����λ';
comment on column LC_CONT_HOUSESALEINFO.landusecertificate
  is '����ʹ��֤';
comment on column LC_CONT_HOUSESALEINFO.landuseperiod
  is '����ʹ������';
comment on column LC_CONT_HOUSESALEINFO.landcertificatenum
  is '����֤���';
comment on column LC_CONT_HOUSESALEINFO.landdevelopusing
  is '���ؿ�����;';
comment on column LC_CONT_HOUSESALEINFO.landusecertificatearea
  is '����ʹ��֤�������';
comment on column LC_CONT_HOUSESALEINFO.landusecertificatecunit
  is '����ʹ��֤��֤��λ';
comment on column LC_CONT_HOUSESALEINFO.preselllinence
  is '��Ʒ��Ԥ�����֤';
comment on column LC_CONT_HOUSESALEINFO.preselllinenceperiod
  is 'Ԥ���������';
comment on column LC_CONT_HOUSESALEINFO.preselllinenceunit
  is '��Ʒ��Ԥ�۷�֤��λ';
comment on column LC_CONT_HOUSESALEINFO.presellprojectname
  is 'Ԥ����Ŀ����';
comment on column LC_CONT_HOUSESALEINFO.presellprojectaddress
  is 'Ԥ����Ŀ��ַ';
comment on column LC_CONT_HOUSESALEINFO.presellprojectusing
  is 'Ԥ�۷�����;';
comment on column LC_CONT_HOUSESALEINFO.presellobject
  is 'Ԥ�۶���';
comment on column LC_CONT_HOUSESALEINFO.presellnumber
  is 'Ԥ������';
comment on column LC_CONT_HOUSESALEINFO.preselltotalarea
  is 'Ԥ�������';
comment on column LC_CONT_HOUSESALEINFO.projectareas
  is '��Ŀ��������';
comment on column LC_CONT_HOUSESALEINFO.projectlandlevel
  is '��Ŀ�õصȼ�';
comment on column LC_CONT_HOUSESALEINFO.developunit
  is '������˾';
comment on column LC_CONT_HOUSESALEINFO.unitcharater
  is '��λ����';
comment on column LC_CONT_HOUSESALEINFO.unitaddress
  is '��˾��ַ';
comment on column LC_CONT_HOUSESALEINFO.legalperson
  is '���˴���';
comment on column LC_CONT_HOUSESALEINFO.projectmanager
  is '��Ŀ������';
comment on column LC_CONT_HOUSESALEINFO.contactphone
  is '��ϵ�绰';
comment on column LC_CONT_HOUSESALEINFO.capitalregulationbank
  is '�ʽ�������';
comment on column LC_CONT_HOUSESALEINFO.capitalregulationaccount
  is '�ʽ����˺�';
comment on column LC_CONT_HOUSESALEINFO.buildingname
  is '¥������';
comment on column LC_CONT_HOUSESALEINFO.buildingnumber
  is '����';
comment on column LC_CONT_HOUSESALEINFO.buildingunitnumber
  is '��Ԫ��';
comment on column LC_CONT_HOUSESALEINFO.housenumber
  is '����';
comment on column LC_CONT_HOUSESALEINFO.housecode
  is '���ݱ��';
comment on column LC_CONT_HOUSESALEINFO.contructionarea
  is '�������';
comment on column LC_CONT_HOUSESALEINFO.publicarea
  is '�������';
comment on column LC_CONT_HOUSESALEINFO.privatearea
  is '�������';
comment on column LC_CONT_HOUSESALEINFO.huxing
  is '����';
comment on column LC_CONT_HOUSESALEINFO.toilet
  is '������';
comment on column LC_CONT_HOUSESALEINFO.balcony
  is '��̨';
comment on column LC_CONT_HOUSESALEINFO.propertytype
  is '��ҵ����';
comment on column LC_CONT_HOUSESALEINFO.preselltotalamount
  is 'Ԥ���ܽ��';
comment on column LC_CONT_HOUSESALEINFO.housestatus
  is '����״̬';
comment on column LC_CONT_HOUSESALEINFO.wherehouse
  is '��������';
comment on column LC_CONT_HOUSESALEINFO.whencreate
  is '�������';
comment on column LC_CONT_HOUSESALEINFO.structure
  is '�ṹ';
comment on column LC_CONT_HOUSESALEINFO.bulidtotalfloots
  is '�����ܲ���';
comment on column LC_CONT_HOUSESALEINFO.floots
  is '���ڲ���';
comment on column LC_CONT_HOUSESALEINFO.housecharater
  is '��������';
comment on column LC_CONT_HOUSESALEINFO.flootheight
  is '���';
comment on column LC_CONT_HOUSESALEINFO.sellername
  is '��������';
comment on column LC_CONT_HOUSESALEINFO.bussinesslinence
  is 'Ӫҵִ�պ�';
comment on column LC_CONT_HOUSESALEINFO.authorizeperson
  is '���˴���';
comment on column LC_CONT_HOUSESALEINFO.certificationlevel
  is '��Ȩ����';
comment on column LC_CONT_HOUSESALEINFO.sellercontactphone
  is '���ʵȼ�';
comment on column LC_CONT_HOUSESALEINFO.isclient
  is '��ϵ�绰';
comment on column LC_CONT_HOUSESALEINFO.clientname
  is '��ϵ�绰';
comment on column LC_CONT_HOUSESALEINFO.clientlegalperson
  is '�Ƿ�ί�д���';
comment on column LC_CONT_HOUSESALEINFO.sellercontactaddress
  is 'ί�д���������';
comment on column LC_CONT_HOUSESALEINFO.sellerbank
  is 'ί�д����˷��˴���';
comment on column LC_CONT_HOUSESALEINFO.sellerbankaccount
  is '������ϵ��ַ';
comment on column LC_CONT_HOUSESALEINFO.buyername
  is '����������';
comment on column LC_CONT_HOUSESALEINFO.buyername2
  is '�����������ʺ�';
comment on column LC_CONT_HOUSESALEINFO.buyercertification
  is '������';
comment on column LC_CONT_HOUSESALEINFO.certificationnum
  is '������������Ȩ�ˣ�';
comment on column LC_CONT_HOUSESALEINFO.buyercontactphone
  is '��֤��';
comment on column LC_CONT_HOUSESALEINFO.buyercontactaddress
  is '֤������';
comment on column LC_CONT_HOUSESALEINFO.buyersex
  is '����ϵ�绰';
comment on column LC_CONT_HOUSESALEINFO.buyernationality
  is '����ϵ��ַ';
comment on column LC_CONT_HOUSESALEINFO.buyernation
  is '���ձ�';
comment on column LC_CONT_HOUSESALEINFO.payoffmode
  is '�򷽹���';
comment on column LC_CONT_HOUSESALEINFO.contcode
  is '������';
comment on column LC_CONT_HOUSESALEINFO.stockcontid
  is '��ͬ���';
comment on column LC_CONT_HOUSESALEINFO.contracttime
  is '���ʽ';
comment on column LC_CONT_HOUSESALEINFO.contbackuptime
  is '��ͬ���';
comment on column LC_CONT_HOUSESALEINFO.firstpay
  is '��ͬǩ��ʱ��';
comment on column LC_CONT_HOUSESALEINFO.firstpayratio
  is '��ͬ����ʱ��';
comment on column LC_CONT_HOUSESALEINFO.loanamount
  is '�׸����';
comment on column LC_CONT_HOUSESALEINFO.loanperiod
  is '�׸������';
comment on column LC_CONT_HOUSESALEINFO.fundloan
  is '������';
comment on column LC_CONT_HOUSESALEINFO.bussinessloan
  is '��������';
comment on column LC_CONT_HOUSESALEINFO.paymentaccount
  is '���������';
comment on column LC_CONT_HOUSESALEINFO.accountbank
  is '��ҵ����';
comment on column LC_CONT_HOUSESALEINFO.sellprice
  is '�����ʻ�';
comment on column LC_CONT_HOUSESALEINFO.selltotalamount
  is '��������';
comment on column LC_CONT_HOUSESALEINFO.areasupplement
  is '���۵���';
comment on column LC_CONT_HOUSESALEINFO.getintime
  is '�����ܼ�';
comment on column LC_CONT_HOUSESALEINFO.propertyfeestandand
  is '�������';
comment on column LC_CONT_HOUSESALEINFO.propertyunitname
  is '���ʱ��';
comment on column LC_CONT_HOUSESALEINFO.propertylegalperson
  is '��ҵ�ѱ�׼';
comment on column LC_CONT_HOUSESALEINFO.propertybussinessnum
  is '��ҵ��˾����';
comment on column LC_CONT_HOUSESALEINFO.propertycertificationlevel
  is '��ҵ��˾���˴���';
comment on column LC_CONT_HOUSESALEINFO.propertymanagementperiod
  is 'Ӫҵִ�պ�';
comment on column LC_CONT_HOUSESALEINFO.createpersonid
  is 'Ӫҵִ�պ�';
comment on column LC_CONT_HOUSESALEINFO.createperson
  is '���ʵȼ�';
comment on column LC_CONT_HOUSESALEINFO.createtime
  is '���ʵȼ�';
comment on column LC_CONT_HOUSESALEINFO.sbjstate
  is '��ҵ�����ͬ����';
comment on column LC_CONT_HOUSESALEINFO.description
  is '��������';
comment on column LC_CONT_HOUSESALEINFO.creator_id
  is '������id';
comment on column LC_CONT_HOUSESALEINFO.creator
  is '������';
comment on column LC_CONT_HOUSESALEINFO.create_date
  is '��������';
comment on column LC_CONT_HOUSESALEINFO.modifiedby
  is '�޸���';
comment on column LC_CONT_HOUSESALEINFO.modifiedby_id
  is '�޸���id';
comment on column LC_CONT_HOUSESALEINFO.modified_date
  is '�޸�����';
comment on column LC_CONT_HOUSESALEINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_CONT_HOUSESALEINFO.version
  is '�汾��';
comment on column LC_CONT_HOUSESALEINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_CONT_HOUSESALEINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_CONT_HOUSESALEINFO.bus_date
  is 'ҵ������';
comment on column LC_CONT_HOUSESALEINFO.exa_remarks
  is '������ע';
comment on column LC_CONT_HOUSESALEINFO.src_table
  is '��Դʵ��';
comment on column LC_CONT_HOUSESALEINFO.src_system
  is '��Դϵͳ';
comment on column LC_CONT_HOUSESALEINFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_CONT_INFO
prompt ===========================
prompt
create table LC_CONT_INFO
(
  stockcontid          VARCHAR2(255),
  stockcontname        VARCHAR2(255),
  conttype             VARCHAR2(255),
  stakeholder          VARCHAR2(255),
  stakelinkman         VARCHAR2(255),
  stakesubdate         DATE,
  stakesigner          VARCHAR2(255),
  associator           VARCHAR2(255),
  assoclinkman         VARCHAR2(255),
  associatedate        DATE,
  associatesigner      VARCHAR2(255),
  associator2          VARCHAR2(255),
  assoclinkman2        VARCHAR2(255),
  associatedate2       DATE,
  associatesigner2     VARCHAR2(255),
  contacttype          VARCHAR2(255),
  powertree            VARCHAR2(255),
  sendapprovetype      VARCHAR2(255),
  paytype              VARCHAR2(255),
  contractprice        NUMBER,
  moneytype            NUMBER,
  validdate            DATE,
  finishdate           DATE,
  prjcode              VARCHAR2(255),
  prjname              VARCHAR2(255),
  prjplace             VARCHAR2(255),
  planbegindate        DATE,
  planenddate          DATE,
  capitaldivisionratio NUMBER,
  description          VARCHAR2(255),
  creator_id           VARCHAR2(120),
  creator              VARCHAR2(120),
  create_date          DATE,
  modifiedby           VARCHAR2(120),
  modifiedby_id        VARCHAR2(120),
  modified_date        DATE,
  version_status       NUMBER,
  version              NUMBER,
  latestversion        NUMBER,
  approvalstae         NUMBER,
  bus_date             DATE,
  exa_remarks          VARCHAR2(500),
  src_table            VARCHAR2(255),
  src_system           VARCHAR2(255),
  sort_id              NUMBER(38)
)
;
comment on table LC_CONT_INFO
  is '��ͬ������Ϣ��';
comment on column LC_CONT_INFO.stockcontid
  is '��ͬ���';
comment on column LC_CONT_INFO.stockcontname
  is '��ͬ����';
comment on column LC_CONT_INFO.conttype
  is '��ͬ״̬';
comment on column LC_CONT_INFO.stakeholder
  is '��ͬ�׷�';
comment on column LC_CONT_INFO.stakelinkman
  is '��ͬ�׷���ϵ��';
comment on column LC_CONT_INFO.stakesubdate
  is '��ͬ�׷�ǩ������';
comment on column LC_CONT_INFO.stakesigner
  is '��ͬ�׷�ǩ����';
comment on column LC_CONT_INFO.associator
  is '��ͬ�ҷ�';
comment on column LC_CONT_INFO.assoclinkman
  is '��ͬ�ҷ���ϵ��';
comment on column LC_CONT_INFO.associatedate
  is '��ͬ�ҷ�ǩ������';
comment on column LC_CONT_INFO.associatesigner
  is '��ͬ�ҷ�ǩ����';
comment on column LC_CONT_INFO.associator2
  is '��ͬ����';
comment on column LC_CONT_INFO.assoclinkman2
  is '��ͬ������ϵ��';
comment on column LC_CONT_INFO.associatedate2
  is '��ͬ����ǩ������';
comment on column LC_CONT_INFO.associatesigner2
  is '��ͬ����ǩ����';
comment on column LC_CONT_INFO.contacttype
  is '��ͬ���';
comment on column LC_CONT_INFO.powertree
  is '����Ȩ����';
comment on column LC_CONT_INFO.sendapprovetype
  is '�������';
comment on column LC_CONT_INFO.paytype
  is '֧��������';
comment on column LC_CONT_INFO.contractprice
  is '��ͬ���';
comment on column LC_CONT_INFO.moneytype
  is '����';
comment on column LC_CONT_INFO.validdate
  is '��Ч����';
comment on column LC_CONT_INFO.finishdate
  is '�깤����';
comment on column LC_CONT_INFO.prjcode
  is '��Ŀ����';
comment on column LC_CONT_INFO.prjname
  is '��Ŀ����';
comment on column LC_CONT_INFO.prjplace
  is '��Ŀ�ص�';
comment on column LC_CONT_INFO.planbegindate
  is '�ƻ���ʼʱ��';
comment on column LC_CONT_INFO.planenddate
  is '�ƻ�����ʱ��';
comment on column LC_CONT_INFO.capitaldivisionratio
  is '�ʽ�������';
comment on column LC_CONT_INFO.description
  is '��������';
comment on column LC_CONT_INFO.creator_id
  is '������id';
comment on column LC_CONT_INFO.creator
  is '������';
comment on column LC_CONT_INFO.create_date
  is '��������';
comment on column LC_CONT_INFO.modifiedby
  is '�޸���';
comment on column LC_CONT_INFO.modifiedby_id
  is '�޸���id';
comment on column LC_CONT_INFO.modified_date
  is '�޸�����';
comment on column LC_CONT_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_CONT_INFO.version
  is '�汾��';
comment on column LC_CONT_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_CONT_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_CONT_INFO.bus_date
  is 'ҵ������';
comment on column LC_CONT_INFO.exa_remarks
  is '������ע';
comment on column LC_CONT_INFO.src_table
  is '��Դʵ��';
comment on column LC_CONT_INFO.src_system
  is '��Դϵͳ';
comment on column LC_CONT_INFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_CONT_LANDLEASE
prompt ================================
prompt
create table LC_CONT_LANDLEASE
(
  stockcontid      VARCHAR2(255),
  leasename        VARCHAR2(255),
  propertytype     VARCHAR2(255),
  ownership        VARCHAR2(255),
  begintime        DATE,
  endtime          DATE,
  usingunit        VARCHAR2(255),
  legalperson      VARCHAR2(255),
  licensenum       VARCHAR2(255),
  contactperson    VARCHAR2(255),
  contacttel       VARCHAR2(255),
  constructionarea NUMBER,
  leaseprice       NUMBER,
  remark           VARCHAR2(255),
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
  bus_date         DATE,
  exa_remarks      VARCHAR2(500),
  src_table        VARCHAR2(255),
  src_system       VARCHAR2(255),
  sort_id          NUMBER(38)
)
;
comment on table LC_CONT_LANDLEASE
  is '���޺�ͬ��';
comment on column LC_CONT_LANDLEASE.stockcontid
  is '��ͬ���';
comment on column LC_CONT_LANDLEASE.leasename
  is '���޺�ͬ����';
comment on column LC_CONT_LANDLEASE.propertytype
  is '��ҵ����';
comment on column LC_CONT_LANDLEASE.ownership
  is '����Ȩ����';
comment on column LC_CONT_LANDLEASE.begintime
  is '��ͬ��ʼ����';
comment on column LC_CONT_LANDLEASE.endtime
  is '��ͬ��ֹ����';
comment on column LC_CONT_LANDLEASE.usingunit
  is 'ʹ�õ�λ';
comment on column LC_CONT_LANDLEASE.legalperson
  is '����������';
comment on column LC_CONT_LANDLEASE.licensenum
  is 'Ӫҵִ�պ���';
comment on column LC_CONT_LANDLEASE.contactperson
  is 'ʹ�õ�λ��ϵ��';
comment on column LC_CONT_LANDLEASE.contacttel
  is '��ϵ�绰';
comment on column LC_CONT_LANDLEASE.constructionarea
  is '�������';
comment on column LC_CONT_LANDLEASE.leaseprice
  is '���ⵥ��';
comment on column LC_CONT_LANDLEASE.remark
  is '��ע';
comment on column LC_CONT_LANDLEASE.description
  is '��������';
comment on column LC_CONT_LANDLEASE.creator_id
  is '������id';
comment on column LC_CONT_LANDLEASE.creator
  is '������';
comment on column LC_CONT_LANDLEASE.create_date
  is '��������';
comment on column LC_CONT_LANDLEASE.modifiedby
  is '�޸���';
comment on column LC_CONT_LANDLEASE.modifiedby_id
  is '�޸���id';
comment on column LC_CONT_LANDLEASE.modified_date
  is '�޸�����';
comment on column LC_CONT_LANDLEASE.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_CONT_LANDLEASE.version
  is '�汾��';
comment on column LC_CONT_LANDLEASE.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_CONT_LANDLEASE.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_CONT_LANDLEASE.bus_date
  is 'ҵ������';
comment on column LC_CONT_LANDLEASE.exa_remarks
  is '������ע';
comment on column LC_CONT_LANDLEASE.src_table
  is '��Դʵ��';
comment on column LC_CONT_LANDLEASE.src_system
  is '��Դϵͳ';
comment on column LC_CONT_LANDLEASE.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_CONT_MAKELANDDETAIL
prompt =====================================
prompt
create table LC_CONT_MAKELANDDETAIL
(
  stockcontid        VARCHAR2(255),
  payitemcode        VARCHAR2(255),
  payitemname        VARCHAR2(255),
  contnum            NUMBER,
  contunit           NUMBER,
  contcost           NUMBER,
  contratio          NUMBER,
  processrelation    VARCHAR2(255),
  numctrl            VARCHAR2(255),
  standard           VARCHAR2(255),
  countingunit       VARCHAR2(255),
  valuation          VARCHAR2(255),
  approvenum         VARCHAR2(255),
  approvedate        DATE,
  prjcode            VARCHAR2(255),
  prjname            VARCHAR2(255),
  contractcode       VARCHAR2(255),
  contractamount     NUMBER,
  projecttimelimit   NUMBER,
  estimatequantities NUMBER,
  workingunit        VARCHAR2(255),
  isdigpay           VARCHAR2(255),
  digareanum         VARCHAR2(255),
  diglandnum         VARCHAR2(255),
  estimatarea        NUMBER,
  estimatquantity    NUMBER,
  estimatcost        NUMBER,
  completedquantity  NUMBER,
  nowpayoff          NUMBER,
  totalpayoff        NUMBER,
  totalquantity      NUMBER,
  mcoareanum         VARCHAR2(255),
  mcolandnum         VARCHAR2(255),
  mcolandname        VARCHAR2(255),
  buystonecount      NUMBER,
  costamount         NUMBER,
  description        VARCHAR2(255),
  creator_id         VARCHAR2(120),
  creator            VARCHAR2(120),
  create_date        DATE,
  modifiedby         VARCHAR2(120),
  modifiedby_id      VARCHAR2(120),
  modified_date      DATE,
  version_status     NUMBER,
  version            NUMBER,
  latestversion      NUMBER,
  approvalstae       NUMBER,
  bus_date           DATE,
  exa_remarks        VARCHAR2(500),
  src_table          VARCHAR2(255),
  src_system         VARCHAR2(255),
  sort_id            NUMBER(38)
)
;
comment on table LC_CONT_MAKELANDDETAIL
  is '��غ�ͬ��';
comment on column LC_CONT_MAKELANDDETAIL.stockcontid
  is '��ͬ���';
comment on column LC_CONT_MAKELANDDETAIL.payitemcode
  is '֧�������';
comment on column LC_CONT_MAKELANDDETAIL.payitemname
  is '֧��������';
comment on column LC_CONT_MAKELANDDETAIL.contnum
  is '��ͬ����';
comment on column LC_CONT_MAKELANDDETAIL.contunit
  is '��ͬ����';
comment on column LC_CONT_MAKELANDDETAIL.contcost
  is '�������';
comment on column LC_CONT_MAKELANDDETAIL.contratio
  is '֧��ϵ��';
comment on column LC_CONT_MAKELANDDETAIL.processrelation
  is '���ȹ���';
comment on column LC_CONT_MAKELANDDETAIL.numctrl
  is '��������';
comment on column LC_CONT_MAKELANDDETAIL.standard
  is '���';
comment on column LC_CONT_MAKELANDDETAIL.countingunit
  is '������λ';
comment on column LC_CONT_MAKELANDDETAIL.valuation
  is '��Լ����';
comment on column LC_CONT_MAKELANDDETAIL.approvenum
  is '��׼�ĺ�';
comment on column LC_CONT_MAKELANDDETAIL.approvedate
  is '��׼ʱ��';
comment on column LC_CONT_MAKELANDDETAIL.prjcode
  is '��Ŀ���';
comment on column LC_CONT_MAKELANDDETAIL.prjname
  is '��Ŀ����';
comment on column LC_CONT_MAKELANDDETAIL.contractcode
  is '��ͬ���';
comment on column LC_CONT_MAKELANDDETAIL.contractamount
  is '��ͬ���';
comment on column LC_CONT_MAKELANDDETAIL.projecttimelimit
  is '���̹���';
comment on column LC_CONT_MAKELANDDETAIL.estimatequantities
  is 'Ԥ�ƹ�����';
comment on column LC_CONT_MAKELANDDETAIL.workingunit
  is 'ʩ����λ';
comment on column LC_CONT_MAKELANDDETAIL.isdigpay
  is '�Ƿ��ڷ�������';
comment on column LC_CONT_MAKELANDDETAIL.digareanum
  is '�ڷ���������';
comment on column LC_CONT_MAKELANDDETAIL.diglandnum
  is '�ؿ���';
comment on column LC_CONT_MAKELANDDETAIL.estimatarea
  is 'Ԥ���ڷ����';
comment on column LC_CONT_MAKELANDDETAIL.estimatquantity
  is 'Ԥ�ƹ�����';
comment on column LC_CONT_MAKELANDDETAIL.estimatcost
  is 'Ԥ�Ƴɱ�';
comment on column LC_CONT_MAKELANDDETAIL.completedquantity
  is '������ɹ�����';
comment on column LC_CONT_MAKELANDDETAIL.nowpayoff
  is '����֧�ֽ��';
comment on column LC_CONT_MAKELANDDETAIL.totalpayoff
  is '�ۼ�֧�����';
comment on column LC_CONT_MAKELANDDETAIL.totalquantity
  is '�ۼ���ɹ�����';
comment on column LC_CONT_MAKELANDDETAIL.mcoareanum
  is '���������';
comment on column LC_CONT_MAKELANDDETAIL.mcolandnum
  is '����ؿ���';
comment on column LC_CONT_MAKELANDDETAIL.mcolandname
  is '����ؿ�����';
comment on column LC_CONT_MAKELANDDETAIL.buystonecount
  is '������ʯ����';
comment on column LC_CONT_MAKELANDDETAIL.costamount
  is '�ɱ����';
comment on column LC_CONT_MAKELANDDETAIL.description
  is '��������';
comment on column LC_CONT_MAKELANDDETAIL.creator_id
  is '������id';
comment on column LC_CONT_MAKELANDDETAIL.creator
  is '������';
comment on column LC_CONT_MAKELANDDETAIL.create_date
  is '��������';
comment on column LC_CONT_MAKELANDDETAIL.modifiedby
  is '�޸���';
comment on column LC_CONT_MAKELANDDETAIL.modifiedby_id
  is '�޸���id';
comment on column LC_CONT_MAKELANDDETAIL.modified_date
  is '�޸�����';
comment on column LC_CONT_MAKELANDDETAIL.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_CONT_MAKELANDDETAIL.version
  is '�汾��';
comment on column LC_CONT_MAKELANDDETAIL.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_CONT_MAKELANDDETAIL.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_CONT_MAKELANDDETAIL.bus_date
  is 'ҵ������';
comment on column LC_CONT_MAKELANDDETAIL.exa_remarks
  is '������ע';
comment on column LC_CONT_MAKELANDDETAIL.src_table
  is '��Դʵ��';
comment on column LC_CONT_MAKELANDDETAIL.src_system
  is '��Դϵͳ';
comment on column LC_CONT_MAKELANDDETAIL.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_CONT_PRJTERMS
prompt ===============================
prompt
create table LC_CONT_PRJTERMS
(
  stockcontid      VARCHAR2(255),
  area             NUMBER,
  qualitystandard  VARCHAR2(255),
  begindate        DATE,
  price            NUMBER,
  amount           NUMBER,
  finishdate       DATE,
  termsmode        VARCHAR2(255),
  termsperiod      DATE,
  comflictplace    VARCHAR2(255),
  comflictmode     VARCHAR2(255),
  unitname         VARCHAR2(255),
  appointedperson  VARCHAR2(255),
  clientperson     VARCHAR2(255),
  phone            VARCHAR2(255),
  signingdept      VARCHAR2(255),
  agent            VARCHAR2(255),
  authorizationnum VARCHAR2(255),
  approvalleader   VARCHAR2(255),
  areadyfinish     VARCHAR2(255),
  stopworkdays     NUMBER,
  settledamount    NUMBER,
  trialbalance     NUMBER,
  clearingtime     DATE,
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
  bus_date         DATE,
  exa_remarks      VARCHAR2(500),
  src_table        VARCHAR2(255),
  src_system       VARCHAR2(255),
  sort_id          NUMBER(38)
)
;
comment on table LC_CONT_PRJTERMS
  is '�������ͬ��Ϣ��';
comment on column LC_CONT_PRJTERMS.stockcontid
  is '��ͬ���';
comment on column LC_CONT_PRJTERMS.area
  is '���';
comment on column LC_CONT_PRJTERMS.qualitystandard
  is '������׼';
comment on column LC_CONT_PRJTERMS.begindate
  is '��������';
comment on column LC_CONT_PRJTERMS.price
  is '����';
comment on column LC_CONT_PRJTERMS.amount
  is '��ͬ���';
comment on column LC_CONT_PRJTERMS.finishdate
  is '��������';
comment on column LC_CONT_PRJTERMS.termsmode
  is '���㷽ʽ';
comment on column LC_CONT_PRJTERMS.termsperiod
  is '��������';
comment on column LC_CONT_PRJTERMS.comflictplace
  is '�������ص�';
comment on column LC_CONT_PRJTERMS.comflictmode
  is '��������ʽ';
comment on column LC_CONT_PRJTERMS.unitname
  is '��λ����';
comment on column LC_CONT_PRJTERMS.appointedperson
  is 'Լ��������';
comment on column LC_CONT_PRJTERMS.clientperson
  is 'ί�д�����';
comment on column LC_CONT_PRJTERMS.phone
  is '��ϵ�绰';
comment on column LC_CONT_PRJTERMS.signingdept
  is 'ǩԼ����';
comment on column LC_CONT_PRJTERMS.agent
  is 'ί�д�����';
comment on column LC_CONT_PRJTERMS.authorizationnum
  is '��Ȩί�����';
comment on column LC_CONT_PRJTERMS.approvalleader
  is '�����쵼';
comment on column LC_CONT_PRJTERMS.areadyfinish
  is '����������';
comment on column LC_CONT_PRJTERMS.stopworkdays
  is 'ͣ������';
comment on column LC_CONT_PRJTERMS.settledamount
  is '�ѽ�����';
comment on column LC_CONT_PRJTERMS.trialbalance
  is '�������';
comment on column LC_CONT_PRJTERMS.clearingtime
  is '����ʱ��';
comment on column LC_CONT_PRJTERMS.description
  is '��������';
comment on column LC_CONT_PRJTERMS.creator_id
  is '������id';
comment on column LC_CONT_PRJTERMS.creator
  is '������';
comment on column LC_CONT_PRJTERMS.create_date
  is '��������';
comment on column LC_CONT_PRJTERMS.modifiedby
  is '�޸���';
comment on column LC_CONT_PRJTERMS.modifiedby_id
  is '�޸���id';
comment on column LC_CONT_PRJTERMS.modified_date
  is '�޸�����';
comment on column LC_CONT_PRJTERMS.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_CONT_PRJTERMS.version
  is '�汾��';
comment on column LC_CONT_PRJTERMS.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_CONT_PRJTERMS.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_CONT_PRJTERMS.bus_date
  is 'ҵ������';
comment on column LC_CONT_PRJTERMS.exa_remarks
  is '������ע';
comment on column LC_CONT_PRJTERMS.src_table
  is '��Դʵ��';
comment on column LC_CONT_PRJTERMS.src_system
  is '��Դϵͳ';
comment on column LC_CONT_PRJTERMS.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_CONT_PURCHASE
prompt ===============================
prompt
create table LC_CONT_PURCHASE
(
  stockcontid     VARCHAR2(255),
  contcode        VARCHAR2(255),
  signingtime     DATE,
  unitname        VARCHAR2(255),
  contstandard    VARCHAR2(255),
  qualitystandard VARCHAR2(255),
  num             NUMBER,
  price           NUMBER,
  totalamout      NUMBER,
  submittime      NUMBER,
  submitnum       NUMBER,
  paymenttime     NUMBER,
  submitedtime    DATE,
  submitednum     NUMBER,
  qualityproblem  VARCHAR2(255),
  paidamout       NUMBER,
  paycode         VARCHAR2(255),
  changerelease   VARCHAR2(255),
  dispute         VARCHAR2(255),
  description     VARCHAR2(255),
  creator_id      VARCHAR2(120),
  creator         VARCHAR2(120),
  create_date     DATE,
  modifiedby      VARCHAR2(120),
  modifiedby_id   VARCHAR2(120),
  modified_date   DATE,
  version_status  NUMBER,
  version         NUMBER,
  latestversion   NUMBER,
  approvalstae    NUMBER,
  bus_date        DATE,
  exa_remarks     VARCHAR2(500),
  src_table       VARCHAR2(255),
  src_system      VARCHAR2(255),
  sort_id         NUMBER(38)
)
;
comment on table LC_CONT_PURCHASE
  is '�ɹ���ͬ��';
comment on column LC_CONT_PURCHASE.stockcontid
  is '��ͬ���';
comment on column LC_CONT_PURCHASE.contcode
  is '��ͬ���';
comment on column LC_CONT_PURCHASE.signingtime
  is 'ǩԼʱ��';
comment on column LC_CONT_PURCHASE.unitname
  is '��λ����';
comment on column LC_CONT_PURCHASE.contstandard
  is '��ͬ��׼';
comment on column LC_CONT_PURCHASE.qualitystandard
  is '������׼';
comment on column LC_CONT_PURCHASE.num
  is '����';
comment on column LC_CONT_PURCHASE.price
  is '����';
comment on column LC_CONT_PURCHASE.totalamout
  is '��ͬ�ܽ��';
comment on column LC_CONT_PURCHASE.submittime
  is '�ᣨ������ʱ��';
comment on column LC_CONT_PURCHASE.submitnum
  is '�ᣨ����������';
comment on column LC_CONT_PURCHASE.paymenttime
  is '����ʱ��';
comment on column LC_CONT_PURCHASE.submitedtime
  is '���ᣨ������ʱ��';
comment on column LC_CONT_PURCHASE.submitednum
  is '���ᣨ����������';
comment on column LC_CONT_PURCHASE.qualityproblem
  is '��������';
comment on column LC_CONT_PURCHASE.paidamout
  is '�Ѹ�����';
comment on column LC_CONT_PURCHASE.paycode
  is '����ƾ��';
comment on column LC_CONT_PURCHASE.changerelease
  is '���������';
comment on column LC_CONT_PURCHASE.dispute
  is '�����������';
comment on column LC_CONT_PURCHASE.description
  is '��������';
comment on column LC_CONT_PURCHASE.creator_id
  is '������id';
comment on column LC_CONT_PURCHASE.creator
  is '������';
comment on column LC_CONT_PURCHASE.create_date
  is '��������';
comment on column LC_CONT_PURCHASE.modifiedby
  is '�޸���';
comment on column LC_CONT_PURCHASE.modifiedby_id
  is '�޸���id';
comment on column LC_CONT_PURCHASE.modified_date
  is '�޸�����';
comment on column LC_CONT_PURCHASE.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_CONT_PURCHASE.version
  is '�汾��';
comment on column LC_CONT_PURCHASE.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_CONT_PURCHASE.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_CONT_PURCHASE.bus_date
  is 'ҵ������';
comment on column LC_CONT_PURCHASE.exa_remarks
  is '������ע';
comment on column LC_CONT_PURCHASE.src_table
  is '��Դʵ��';
comment on column LC_CONT_PURCHASE.src_system
  is '��Դϵͳ';
comment on column LC_CONT_PURCHASE.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_CONT_SELLATTACHMENT
prompt =====================================
prompt
create table LC_CONT_SELLATTACHMENT
(
  stockcontid    VARCHAR2(255),
  sell_name      VARCHAR2(255),
  sell_type      VARCHAR2(255),
  pagenum        NUMBER,
  author         VARCHAR2(255),
  attachversion  VARCHAR2(255),
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
comment on table LC_CONT_SELLATTACHMENT
  is '���ۺ�ͬ������';
comment on column LC_CONT_SELLATTACHMENT.stockcontid
  is '��ͬ���';
comment on column LC_CONT_SELLATTACHMENT.pagenum
  is '��ͬ����ҳ��';
comment on column LC_CONT_SELLATTACHMENT.author
  is '��ͬ��������';
comment on column LC_CONT_SELLATTACHMENT.attachversion
  is '��ͬ�����汾';
comment on column LC_CONT_SELLATTACHMENT.description
  is '��������';
comment on column LC_CONT_SELLATTACHMENT.creator_id
  is '������id';
comment on column LC_CONT_SELLATTACHMENT.creator
  is '������';
comment on column LC_CONT_SELLATTACHMENT.create_date
  is '��������';
comment on column LC_CONT_SELLATTACHMENT.modifiedby
  is '�޸���';
comment on column LC_CONT_SELLATTACHMENT.modifiedby_id
  is '�޸���id';
comment on column LC_CONT_SELLATTACHMENT.modified_date
  is '�޸�����';
comment on column LC_CONT_SELLATTACHMENT.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_CONT_SELLATTACHMENT.version
  is '�汾��';
comment on column LC_CONT_SELLATTACHMENT.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_CONT_SELLATTACHMENT.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_CONT_SELLATTACHMENT.bus_date
  is 'ҵ������';
comment on column LC_CONT_SELLATTACHMENT.exa_remarks
  is '������ע';
comment on column LC_CONT_SELLATTACHMENT.src_table
  is '��Դʵ��';
comment on column LC_CONT_SELLATTACHMENT.src_system
  is '��Դϵͳ';
comment on column LC_CONT_SELLATTACHMENT.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_CONT_SELLINCOME
prompt =================================
prompt
create table LC_CONT_SELLINCOME
(
  stockcontid         VARCHAR2(255),
  billcode            VARCHAR2(255),
  billdate            DATE,
  approvecode         VARCHAR2(255),
  contcode            VARCHAR2(255),
  contname            VARCHAR2(255),
  prelandsellcontid   VARCHAR2(255),
  prelandsellcontname VARCHAR2(255),
  moneytype           VARCHAR2(255),
  transfertotalcost   NUMBER,
  nowbillamount       NUMBER,
  payee               VARCHAR2(255),
  transfereeunit      VARCHAR2(255),
  landcode            VARCHAR2(255),
  landarea_mu         NUMBER,
  landusing           VARCHAR2(255),
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
comment on table LC_CONT_SELLINCOME
  is '���ۺ�ͬ�����';
comment on column LC_CONT_SELLINCOME.stockcontid
  is '��ͬ���';
comment on column LC_CONT_SELLINCOME.billcode
  is '�տ���';
comment on column LC_CONT_SELLINCOME.billdate
  is '�տ�����';
comment on column LC_CONT_SELLINCOME.approvecode
  is '��׼�ĺ�';
comment on column LC_CONT_SELLINCOME.contcode
  is '��ͬ���';
comment on column LC_CONT_SELLINCOME.contname
  is '��ͬ����';
comment on column LC_CONT_SELLINCOME.prelandsellcontid
  is 'ԭ���س��ú�ͬ��';
comment on column LC_CONT_SELLINCOME.prelandsellcontname
  is 'ԭ���س��ú�ͬ����';
comment on column LC_CONT_SELLINCOME.moneytype
  is '����';
comment on column LC_CONT_SELLINCOME.transfertotalcost
  is 'ת���ܼ�';
comment on column LC_CONT_SELLINCOME.nowbillamount
  is '�����տ���';
comment on column LC_CONT_SELLINCOME.landcode
  is '�ؿ���';
comment on column LC_CONT_SELLINCOME.landarea_mu
  is '�ؿ����';
comment on column LC_CONT_SELLINCOME.landusing
  is '�ؿ���;';
comment on column LC_CONT_SELLINCOME.description
  is '��������';
comment on column LC_CONT_SELLINCOME.creator_id
  is '������id';
comment on column LC_CONT_SELLINCOME.creator
  is '������';
comment on column LC_CONT_SELLINCOME.create_date
  is '��������';
comment on column LC_CONT_SELLINCOME.modifiedby
  is '�޸���';
comment on column LC_CONT_SELLINCOME.modifiedby_id
  is '�޸���id';
comment on column LC_CONT_SELLINCOME.modified_date
  is '�޸�����';
comment on column LC_CONT_SELLINCOME.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_CONT_SELLINCOME.version
  is '�汾��';
comment on column LC_CONT_SELLINCOME.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_CONT_SELLINCOME.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_CONT_SELLINCOME.bus_date
  is 'ҵ������';
comment on column LC_CONT_SELLINCOME.exa_remarks
  is '������ע';
comment on column LC_CONT_SELLINCOME.src_table
  is '��Դʵ��';
comment on column LC_CONT_SELLINCOME.src_system
  is '��Դϵͳ';
comment on column LC_CONT_SELLINCOME.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_CONT_SELLTOACCOUNTPLAN
prompt ========================================
prompt
create table LC_CONT_SELLTOACCOUNTPLAN
(
  stockcontid    VARCHAR2(255),
  totalcapital   NUMBER,
  howmuchperiod  NUMBER,
  paydesc        VARCHAR2(255),
  planpaydate    DATE,
  planpayamount  NUMBER,
  remark         VARCHAR2(255),
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
comment on table LC_CONT_SELLTOACCOUNTPLAN
  is '���ۺ�ͬ���˼ƻ���';
comment on column LC_CONT_SELLTOACCOUNTPLAN.stockcontid
  is '��ͬ���';
comment on column LC_CONT_SELLTOACCOUNTPLAN.totalcapital
  is '�ʽ��˽���ܼ�';
comment on column LC_CONT_SELLTOACCOUNTPLAN.howmuchperiod
  is '����_��֧��';
comment on column LC_CONT_SELLTOACCOUNTPLAN.paydesc
  is '֧��˵��';
comment on column LC_CONT_SELLTOACCOUNTPLAN.planpaydate
  is '�ƻ�֧������';
comment on column LC_CONT_SELLTOACCOUNTPLAN.planpayamount
  is '�ƻ�֧�����';
comment on column LC_CONT_SELLTOACCOUNTPLAN.remark
  is '��ע����';
comment on column LC_CONT_SELLTOACCOUNTPLAN.description
  is '��������';
comment on column LC_CONT_SELLTOACCOUNTPLAN.creator_id
  is '������id';
comment on column LC_CONT_SELLTOACCOUNTPLAN.creator
  is '������';
comment on column LC_CONT_SELLTOACCOUNTPLAN.create_date
  is '��������';
comment on column LC_CONT_SELLTOACCOUNTPLAN.modifiedby
  is '�޸���';
comment on column LC_CONT_SELLTOACCOUNTPLAN.modifiedby_id
  is '�޸���id';
comment on column LC_CONT_SELLTOACCOUNTPLAN.modified_date
  is '�޸�����';
comment on column LC_CONT_SELLTOACCOUNTPLAN.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_CONT_SELLTOACCOUNTPLAN.version
  is '�汾��';
comment on column LC_CONT_SELLTOACCOUNTPLAN.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_CONT_SELLTOACCOUNTPLAN.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_CONT_SELLTOACCOUNTPLAN.bus_date
  is 'ҵ������';
comment on column LC_CONT_SELLTOACCOUNTPLAN.exa_remarks
  is '������ע';
comment on column LC_CONT_SELLTOACCOUNTPLAN.src_table
  is '��Դʵ��';
comment on column LC_CONT_SELLTOACCOUNTPLAN.src_system
  is '��Դϵͳ';
comment on column LC_CONT_SELLTOACCOUNTPLAN.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_CONT_SUPERVISORINFO
prompt =====================================
prompt
create table LC_CONT_SUPERVISORINFO
(
  stockcontid        VARCHAR2(255),
  billcode           VARCHAR2(255),
  billdate           DATE,
  makelandprj        VARCHAR2(255),
  supervisorunit     VARCHAR2(255),
  applicationon      VARCHAR2(255),
  approver           VARCHAR2(255),
  whichtimes         NUMBER,
  payoffdesc         VARCHAR2(255),
  nowpayoff          NUMBER,
  totalpayoff        NUMBER,
  prjcontcode        VARCHAR2(255),
  prjcontname        VARCHAR2(255),
  prjcontamount      NUMBER,
  prjconttotalamount NUMBER,
  payoffratio        NUMBER,
  supervisor         NUMBER,
  description        VARCHAR2(255),
  creator_id         VARCHAR2(120),
  creator            VARCHAR2(120),
  create_date        DATE,
  modifiedby         VARCHAR2(120),
  modifiedby_id      VARCHAR2(120),
  modified_date      DATE,
  version_status     NUMBER,
  version            NUMBER,
  latestversion      NUMBER,
  approvalstae       NUMBER,
  bus_date           DATE,
  exa_remarks        VARCHAR2(500),
  src_table          VARCHAR2(255),
  src_system         VARCHAR2(255),
  sort_id            NUMBER(38)
)
;
comment on table LC_CONT_SUPERVISORINFO
  is '�����֧ͬ����Ϣ��';
comment on column LC_CONT_SUPERVISORINFO.stockcontid
  is '��ͬ���';
comment on column LC_CONT_SUPERVISORINFO.billcode
  is '���ݱ��';
comment on column LC_CONT_SUPERVISORINFO.billdate
  is '����ʱ��';
comment on column LC_CONT_SUPERVISORINFO.makelandprj
  is '�����Ŀ';
comment on column LC_CONT_SUPERVISORINFO.supervisorunit
  is '����λ';
comment on column LC_CONT_SUPERVISORINFO.applicationon
  is '���븶����';
comment on column LC_CONT_SUPERVISORINFO.approver
  is '������';
comment on column LC_CONT_SUPERVISORINFO.whichtimes
  is '�ڼ��θ���';
comment on column LC_CONT_SUPERVISORINFO.payoffdesc
  is '����˵��';
comment on column LC_CONT_SUPERVISORINFO.nowpayoff
  is '���θ�����';
comment on column LC_CONT_SUPERVISORINFO.totalpayoff
  is '�ۼƸ�����';
comment on column LC_CONT_SUPERVISORINFO.prjcontcode
  is '���̺�ͬ��';
comment on column LC_CONT_SUPERVISORINFO.prjcontname
  is '���̺�ͬ����';
comment on column LC_CONT_SUPERVISORINFO.prjcontamount
  is '���̺�ͬ���';
comment on column LC_CONT_SUPERVISORINFO.prjconttotalamount
  is '���̺�ͬ������';
comment on column LC_CONT_SUPERVISORINFO.payoffratio
  is '�������';
comment on column LC_CONT_SUPERVISORINFO.supervisor
  is '�����ͬ���';
comment on column LC_CONT_SUPERVISORINFO.description
  is '��������';
comment on column LC_CONT_SUPERVISORINFO.creator_id
  is '������id';
comment on column LC_CONT_SUPERVISORINFO.creator
  is '������';
comment on column LC_CONT_SUPERVISORINFO.create_date
  is '��������';
comment on column LC_CONT_SUPERVISORINFO.modifiedby
  is '�޸���';
comment on column LC_CONT_SUPERVISORINFO.modifiedby_id
  is '�޸���id';
comment on column LC_CONT_SUPERVISORINFO.modified_date
  is '�޸�����';
comment on column LC_CONT_SUPERVISORINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_CONT_SUPERVISORINFO.version
  is '�汾��';
comment on column LC_CONT_SUPERVISORINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_CONT_SUPERVISORINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_CONT_SUPERVISORINFO.bus_date
  is 'ҵ������';
comment on column LC_CONT_SUPERVISORINFO.exa_remarks
  is '������ע';
comment on column LC_CONT_SUPERVISORINFO.src_table
  is '��Դʵ��';
comment on column LC_CONT_SUPERVISORINFO.src_system
  is '��Դϵͳ';
comment on column LC_CONT_SUPERVISORINFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_CUST_INFO
prompt ===========================
prompt
create table LC_CUST_INFO
(
  code                 INTEGER,
  name                 INTEGER,
  certificatenum       VARCHAR2(255),
  companynatureid      INTEGER,
  registeredcapital    INTEGER,
  city                 VARCHAR2(255),
  bank                 VARCHAR2(255),
  account              VARCHAR2(255),
  representative       VARCHAR2(255),
  contactperson        VARCHAR2(255),
  businesslicense      VARCHAR2(255),
  bussinessscope       VARCHAR2(255),
  orgcode              VARCHAR2(255),
  areataxnum           VARCHAR2(255),
  nationtaxnum         VARCHAR2(255),
  address              VARCHAR2(255),
  postalcode           VARCHAR2(255),
  phone                VARCHAR2(255),
  fax                  VARCHAR2(255),
  email                VARCHAR2(255),
  homepage             VARCHAR2(255),
  cust_description     VARCHAR2(255),
  transationtypeid     INTEGER,
  statusid             INTEGER,
  buyprice             INTEGER,
  rentalprice          INTEGER,
  transationcode       VARCHAR2(255),
  contcode             VARCHAR2(255),
  contname             VARCHAR2(255),
  investprjname        VARCHAR2(255),
  agent                VARCHAR2(255),
  clientcertificatenum VARCHAR2(255),
  clientphone          VARCHAR2(255),
  clientaddress        VARCHAR2(255),
  emp_code             INTEGER,
  emp_name             VARCHAR2(255),
  emp_sex              INTEGER,
  emp_job              VARCHAR2(255),
  emp_phone            VARCHAR2(255),
  emp_fax              VARCHAR2(255),
  emp_email            VARCHAR2(255),
  emp_address          VARCHAR2(255),
  emp_postalcode       VARCHAR2(255),
  emp_mobile           VARCHAR2(255),
  emp_homecall         VARCHAR2(255),
  emp_othermethod      VARCHAR2(255),
  description          VARCHAR2(120),
  creator_id           VARCHAR2(120),
  creator              VARCHAR2(120),
  create_date          DATE,
  modifiedby           VARCHAR2(120),
  modifiedby_id        VARCHAR2(120),
  modified_date        DATE,
  version_status       INTEGER,
  version              INTEGER,
  latestversion        INTEGER,
  approvalstae         INTEGER,
  bus_date             DATE,
  exa_remarks          VARCHAR2(500),
  src_table            VARCHAR2(255),
  src_system           VARCHAR2(255),
  sort_id              NUMBER(38)
)
;
comment on table LC_CUST_INFO
  is '�ͻ���Ϣ��';
comment on column LC_CUST_INFO.code
  is '�ͻ�����';
comment on column LC_CUST_INFO.name
  is '�ͻ�����';
comment on column LC_CUST_INFO.certificatenum
  is '����֤������';
comment on column LC_CUST_INFO.companynatureid
  is '��ҵ����';
comment on column LC_CUST_INFO.registeredcapital
  is 'ע���ʱ�';
comment on column LC_CUST_INFO.city
  is '���ڳ���';
comment on column LC_CUST_INFO.bank
  is '��������';
comment on column LC_CUST_INFO.account
  is '�����˺�';
comment on column LC_CUST_INFO.representative
  is '���˴���';
comment on column LC_CUST_INFO.contactperson
  is '��ϵ��';
comment on column LC_CUST_INFO.businesslicense
  is 'Ӫҵִ�պ�';
comment on column LC_CUST_INFO.bussinessscope
  is '��Ӫ��Χ';
comment on column LC_CUST_INFO.orgcode
  is '��֯��������֤';
comment on column LC_CUST_INFO.areataxnum
  is '��˰�ǼǺ�';
comment on column LC_CUST_INFO.nationtaxnum
  is '��˰�ǼǺ�';
comment on column LC_CUST_INFO.address
  is 'ͨѶ��ַ';
comment on column LC_CUST_INFO.postalcode
  is '��������';
comment on column LC_CUST_INFO.phone
  is '�绰����';
comment on column LC_CUST_INFO.fax
  is '�������';
comment on column LC_CUST_INFO.email
  is '�����ʼ�';
comment on column LC_CUST_INFO.homepage
  is '��˾��ҳ';
comment on column LC_CUST_INFO.cust_description
  is '��˾���';
comment on column LC_CUST_INFO.transationtypeid
  is '��������';
comment on column LC_CUST_INFO.statusid
  is '�ͻ�״̬';
comment on column LC_CUST_INFO.buyprice
  is '����۸�';
comment on column LC_CUST_INFO.rentalprice
  is '���޼۸�';
comment on column LC_CUST_INFO.transationcode
  is '���ױ��';
comment on column LC_CUST_INFO.contcode
  is '��ͬ���';
comment on column LC_CUST_INFO.contname
  is '��ͬ����';
comment on column LC_CUST_INFO.investprjname
  is 'Ͷ����Ŀ����';
comment on column LC_CUST_INFO.agent
  is 'ί�д�����';
comment on column LC_CUST_INFO.clientcertificatenum
  is 'ί����֤������';
comment on column LC_CUST_INFO.clientphone
  is 'ί���˵绰';
comment on column LC_CUST_INFO.clientaddress
  is 'ί���˵�ַ';
comment on column LC_CUST_INFO.emp_code
  is '��Ա���';
comment on column LC_CUST_INFO.emp_name
  is '����';
comment on column LC_CUST_INFO.emp_sex
  is '�Ա�';
comment on column LC_CUST_INFO.emp_job
  is 'ְλ';
comment on column LC_CUST_INFO.emp_phone
  is '�칫�绰';
comment on column LC_CUST_INFO.emp_fax
  is '����';
comment on column LC_CUST_INFO.emp_email
  is '�����ʼ�';
comment on column LC_CUST_INFO.emp_address
  is '��ַ';
comment on column LC_CUST_INFO.emp_postalcode
  is '��������';
comment on column LC_CUST_INFO.emp_mobile
  is '�ƶ��绰';
comment on column LC_CUST_INFO.emp_homecall
  is '��ͥ�绰';
comment on column LC_CUST_INFO.emp_othermethod
  is '������ϵ��ʽ';
comment on column LC_CUST_INFO.description
  is '��������';
comment on column LC_CUST_INFO.creator_id
  is '������id';
comment on column LC_CUST_INFO.creator
  is '������';
comment on column LC_CUST_INFO.create_date
  is '��������';
comment on column LC_CUST_INFO.modifiedby
  is '�޸���';
comment on column LC_CUST_INFO.modifiedby_id
  is '�޸���id';
comment on column LC_CUST_INFO.modified_date
  is '�޸�����';
comment on column LC_CUST_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_CUST_INFO.version
  is '�汾��';
comment on column LC_CUST_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_CUST_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_CUST_INFO.bus_date
  is 'ҵ������';
comment on column LC_CUST_INFO.exa_remarks
  is '������ע';
comment on column LC_CUST_INFO.src_table
  is '��Դʵ��';
comment on column LC_CUST_INFO.src_system
  is '��Դϵͳ';
comment on column LC_CUST_INFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_EMP_INFO
prompt ==========================
prompt
create table LC_EMP_INFO
(
  code                    VARCHAR2(255),
  cardcode                VARCHAR2(255),
  name                    VARCHAR2(255),
  pinyin                  VARCHAR2(255),
  sex                     VARCHAR2(255),
  birthday                DATE,
  bloodtype               VARCHAR2(255),
  idcard                  VARCHAR2(255),
  marry                   VARCHAR2(255),
  nation                  VARCHAR2(255),
  birthplace              VARCHAR2(255),
  originplace             VARCHAR2(255),
  photo                   VARCHAR2(255),
  personindentity         VARCHAR2(255),
  politicaloutlook        VARCHAR2(255),
  joininparty             DATE,
  partyoffice             VARCHAR2(255),
  workingtime             DATE,
  joininipbtime           DATE,
  mana_unit               VARCHAR2(255),
  department              VARCHAR2(255),
  joinincorptime          DATE,
  statusdate              DATE,
  emptype                 VARCHAR2(255),
  joinintype              VARCHAR2(255),
  mana_job                VARCHAR2(255),
  mana_joblevel           VARCHAR2(255),
  nowjobbegindate         DATE,
  contracttype            VARCHAR2(255),
  contractbegindate       DATE,
  contractenddate         DATE,
  education               VARCHAR2(255),
  academicdegree          VARCHAR2(255),
  graguateduniversity     VARCHAR2(255),
  profession              VARCHAR2(255),
  edu_begindate           DATE,
  edu_enddate             DATE,
  foreignlanguage         VARCHAR2(255),
  languagelevel           VARCHAR2(255),
  technicaltitle          VARCHAR2(255),
  titlelevel              VARCHAR2(255),
  occupationqualification VARCHAR2(255),
  certification           VARCHAR2(255),
  city                    VARCHAR2(255),
  officeaddress           VARCHAR2(255),
  officephone             VARCHAR2(255),
  mobile                  VARCHAR2(255),
  email                   VARCHAR2(255),
  officepostalcode        VARCHAR2(255),
  homeaddress             VARCHAR2(255),
  homephone               VARCHAR2(255),
  homepostalcode          VARCHAR2(255),
  emergencyperson         VARCHAR2(255),
  emergencyphone          VARCHAR2(255),
  worked_begindate        DATE,
  worked_enddate          DATE,
  worked_unit             VARCHAR2(255),
  worked_department       VARCHAR2(255),
  worked_job              VARCHAR2(255),
  working                 VARCHAR2(255),
  tra_begindate           DATE,
  tra_enddate             DATE,
  tra_content             VARCHAR2(255),
  tra_unit                VARCHAR2(255),
  tra_type                VARCHAR2(255),
  tra_mode                VARCHAR2(255),
  membername              VARCHAR2(255),
  relation                VARCHAR2(255),
  fra_birthday            VARCHAR2(255),
  fra_unit                VARCHAR2(255),
  fra_job                 VARCHAR2(255),
  fra_phone               VARCHAR2(255),
  fra_sex                 VARCHAR2(255),
  description             VARCHAR2(255),
  creator_id              VARCHAR2(120),
  creator                 VARCHAR2(120),
  create_date             DATE,
  modifiedby              VARCHAR2(120),
  modifiedby_id           VARCHAR2(120),
  modified_date           DATE,
  version_status          NUMBER,
  version                 NUMBER,
  latestversion           NUMBER,
  approvalstae            NUMBER,
  bus_date                DATE,
  exa_remarks             VARCHAR2(500),
  src_table               VARCHAR2(255),
  src_system              VARCHAR2(255),
  sort_id                 NUMBER(38)
)
;
comment on table LC_EMP_INFO
  is '��Ա��Ϣ��';
comment on column LC_EMP_INFO.code
  is 'Ա�����';
comment on column LC_EMP_INFO.cardcode
  is '������';
comment on column LC_EMP_INFO.name
  is '����';
comment on column LC_EMP_INFO.pinyin
  is '����ƴ��';
comment on column LC_EMP_INFO.sex
  is '�Ա�';
comment on column LC_EMP_INFO.birthday
  is '��������';
comment on column LC_EMP_INFO.bloodtype
  is 'Ѫ��';
comment on column LC_EMP_INFO.idcard
  is '���֤��';
comment on column LC_EMP_INFO.marry
  is '����״��';
comment on column LC_EMP_INFO.nation
  is '����';
comment on column LC_EMP_INFO.birthplace
  is '�����ص�';
comment on column LC_EMP_INFO.originplace
  is '����';
comment on column LC_EMP_INFO.photo
  is '��Ƭ����';
comment on column LC_EMP_INFO.personindentity
  is '�������';
comment on column LC_EMP_INFO.politicaloutlook
  is '������ò';
comment on column LC_EMP_INFO.joininparty
  is '�μӵ���ʱ��';
comment on column LC_EMP_INFO.partyoffice
  is '����ְ��';
comment on column LC_EMP_INFO.workingtime
  is '�μӹ���ʱ��';
comment on column LC_EMP_INFO.joininipbtime
  is '�������̾�ϵͳ����ʱ��';
comment on column LC_EMP_INFO.mana_unit
  is '�������ڵ�λ';
comment on column LC_EMP_INFO.department
  is '��������';
comment on column LC_EMP_INFO.joinincorptime
  is '��˾����';
comment on column LC_EMP_INFO.statusdate
  is 'ת������';
comment on column LC_EMP_INFO.emptype
  is 'Ա�����';
comment on column LC_EMP_INFO.joinintype
  is '��˾��ʽ';
comment on column LC_EMP_INFO.mana_job
  is '����ְ��';
comment on column LC_EMP_INFO.mana_joblevel
  is 'ְ�񼶱�';
comment on column LC_EMP_INFO.nowjobbegindate
  is '��ְ��ʼ����';
comment on column LC_EMP_INFO.contracttype
  is '��ͬ���';
comment on column LC_EMP_INFO.contractbegindate
  is '��ͬǩ������';
comment on column LC_EMP_INFO.contractenddate
  is '��ͬ��������';
comment on column LC_EMP_INFO.education
  is 'ѧ��';
comment on column LC_EMP_INFO.academicdegree
  is 'ѧλ';
comment on column LC_EMP_INFO.graguateduniversity
  is '��ҵԺУ';
comment on column LC_EMP_INFO.profession
  is 'רҵ';
comment on column LC_EMP_INFO.edu_begindate
  is '��ѧʱ��';
comment on column LC_EMP_INFO.edu_enddate
  is '��ҵʱ��';
comment on column LC_EMP_INFO.foreignlanguage
  is '��������';
comment on column LC_EMP_INFO.languagelevel
  is '����ȼ�';
comment on column LC_EMP_INFO.technicaltitle
  is '����ְ��';
comment on column LC_EMP_INFO.titlelevel
  is 'ְ�Ƶȼ�';
comment on column LC_EMP_INFO.occupationqualification
  is 'ְҵ�ʸ�';
comment on column LC_EMP_INFO.certification
  is '�ϸ�֤(����֤)';
comment on column LC_EMP_INFO.city
  is '��������';
comment on column LC_EMP_INFO.officeaddress
  is '�칫��ַ';
comment on column LC_EMP_INFO.officephone
  is '�̶��绰';
comment on column LC_EMP_INFO.mobile
  is '�ƶ��绰';
comment on column LC_EMP_INFO.email
  is '�����ʼ�';
comment on column LC_EMP_INFO.officepostalcode
  is '�칫����������';
comment on column LC_EMP_INFO.homeaddress
  is '��ͥסַ';
comment on column LC_EMP_INFO.homephone
  is 'סլ�绰';
comment on column LC_EMP_INFO.homepostalcode
  is '��ͥ���ڵ���������';
comment on column LC_EMP_INFO.emergencyperson
  is '����������';
comment on column LC_EMP_INFO.emergencyphone
  is '��������绰';
comment on column LC_EMP_INFO.worked_begindate
  is '������ʼ����';
comment on column LC_EMP_INFO.worked_enddate
  is '������������';
comment on column LC_EMP_INFO.worked_unit
  is '������λ';
comment on column LC_EMP_INFO.worked_department
  is '��������';
comment on column LC_EMP_INFO.worked_job
  is '����ְ��';
comment on column LC_EMP_INFO.working
  is '�����£��ֹܣ��Ĺ���';
comment on column LC_EMP_INFO.tra_begindate
  is '��ѵ��ʼ����';
comment on column LC_EMP_INFO.tra_enddate
  is '��ѵ��������';
comment on column LC_EMP_INFO.tra_content
  is '��ѵ����';
comment on column LC_EMP_INFO.tra_unit
  is '��ѵ����';
comment on column LC_EMP_INFO.tra_type
  is '��ѵ����';
comment on column LC_EMP_INFO.tra_mode
  is '��ѵ��ʽ';
comment on column LC_EMP_INFO.membername
  is '��ͥ��Ա����';
comment on column LC_EMP_INFO.relation
  is '�뱾�˹�ϵ';
comment on column LC_EMP_INFO.fra_birthday
  is '��ͥ��Ա��������';
comment on column LC_EMP_INFO.fra_unit
  is '��ͥ��Ա������λ';
comment on column LC_EMP_INFO.fra_job
  is '��ͥ��Աְ��';
comment on column LC_EMP_INFO.fra_phone
  is '��ͥ��Ա��ϵ�绰';
comment on column LC_EMP_INFO.fra_sex
  is '��ͥ��Ա�Ա�';
comment on column LC_EMP_INFO.description
  is '��������';
comment on column LC_EMP_INFO.creator_id
  is '������id';
comment on column LC_EMP_INFO.creator
  is '������';
comment on column LC_EMP_INFO.create_date
  is '��������';
comment on column LC_EMP_INFO.modifiedby
  is '�޸���';
comment on column LC_EMP_INFO.modifiedby_id
  is '�޸���id';
comment on column LC_EMP_INFO.modified_date
  is '�޸�����';
comment on column LC_EMP_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_EMP_INFO.version
  is '�汾��';
comment on column LC_EMP_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_EMP_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_EMP_INFO.bus_date
  is 'ҵ������';
comment on column LC_EMP_INFO.exa_remarks
  is '������ע';
comment on column LC_EMP_INFO.src_table
  is '��Դʵ��';
comment on column LC_EMP_INFO.src_system
  is '��Դϵͳ';
comment on column LC_EMP_INFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_LAND_BUYINFO
prompt ==============================
prompt
create table LC_LAND_BUYINFO
(
  landcode       VARCHAR2(255),
  buycost        NUMBER,
  buyyear        VARCHAR2(255),
  buytype        VARCHAR2(255),
  buytimes       NUMBER,
  contcode       VARCHAR2(255),
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
comment on table LC_LAND_BUYINFO
  is '�ؿ����ػ�����Ϣ��';
comment on column LC_LAND_BUYINFO.landcode
  is '�ؿ����';
comment on column LC_LAND_BUYINFO.buycost
  is '���سɱ�';
comment on column LC_LAND_BUYINFO.buyyear
  is '�������';
comment on column LC_LAND_BUYINFO.buytype
  is '�������';
comment on column LC_LAND_BUYINFO.buytimes
  is '��������';
comment on column LC_LAND_BUYINFO.contcode
  is '��ͬ���';
comment on column LC_LAND_BUYINFO.description
  is '��������';
comment on column LC_LAND_BUYINFO.creator_id
  is '������id';
comment on column LC_LAND_BUYINFO.creator
  is '������';
comment on column LC_LAND_BUYINFO.create_date
  is '��������';
comment on column LC_LAND_BUYINFO.modifiedby
  is '�޸���';
comment on column LC_LAND_BUYINFO.modifiedby_id
  is '�޸���id';
comment on column LC_LAND_BUYINFO.modified_date
  is '�޸�����';
comment on column LC_LAND_BUYINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_LAND_BUYINFO.version
  is '�汾��';
comment on column LC_LAND_BUYINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_LAND_BUYINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_LAND_BUYINFO.bus_date
  is 'ҵ������';
comment on column LC_LAND_BUYINFO.exa_remarks
  is '������ע';
comment on column LC_LAND_BUYINFO.src_table
  is '��Դʵ��';
comment on column LC_LAND_BUYINFO.src_system
  is '��Դϵͳ';
comment on column LC_LAND_BUYINFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_LAND_DEVELOP
prompt ==============================
prompt
create table LC_LAND_DEVELOP
(
  landcode       VARCHAR2(255),
  storagecode    VARCHAR2(255),
  projectname    VARCHAR2(255),
  storageyear    VARCHAR2(255),
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
comment on table LC_LAND_DEVELOP
  is '�ؿ���ؿ�����Ϣ��';
comment on column LC_LAND_DEVELOP.landcode
  is '�ؿ����';
comment on column LC_LAND_DEVELOP.storagecode
  is '�ؿ鿪������';
comment on column LC_LAND_DEVELOP.projectname
  is '�ؿ鿪������';
comment on column LC_LAND_DEVELOP.storageyear
  is '�������';
comment on column LC_LAND_DEVELOP.description
  is '��������';
comment on column LC_LAND_DEVELOP.creator_id
  is '������id';
comment on column LC_LAND_DEVELOP.creator
  is '������';
comment on column LC_LAND_DEVELOP.create_date
  is '��������';
comment on column LC_LAND_DEVELOP.modifiedby
  is '�޸���';
comment on column LC_LAND_DEVELOP.modifiedby_id
  is '�޸���id';
comment on column LC_LAND_DEVELOP.modified_date
  is '�޸�����';
comment on column LC_LAND_DEVELOP.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_LAND_DEVELOP.version
  is '�汾��';
comment on column LC_LAND_DEVELOP.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_LAND_DEVELOP.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_LAND_DEVELOP.bus_date
  is 'ҵ������';
comment on column LC_LAND_DEVELOP.exa_remarks
  is '������ע';
comment on column LC_LAND_DEVELOP.src_table
  is '��Դʵ��';
comment on column LC_LAND_DEVELOP.src_system
  is '��Դϵͳ';
comment on column LC_LAND_DEVELOP.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_LAND_INFO
prompt ===========================
prompt
create table LC_LAND_INFO
(
  landcode          VARCHAR2(255),
  landtype          VARCHAR2(255),
  landposition      VARCHAR2(255),
  landname          VARCHAR2(255),
  landareadivision  VARCHAR2(255),
  landapprovenumber VARCHAR2(255),
  landapprovedate   DATE,
  parentname        VARCHAR2(255),
  landstatus        VARCHAR2(255),
  landshape         VARCHAR2(255),
  landlength        NUMBER,
  landwidth         NUMBER,
  landarea_mu       NUMBER,
  landarea_square   NUMBER,
  landphoto         VARCHAR2(255),
  landusing         VARCHAR2(255),
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
comment on table LC_LAND_INFO
  is '�ؿ������Ϣ��';
comment on column LC_LAND_INFO.landcode
  is '�ؿ����';
comment on column LC_LAND_INFO.landtype
  is '�ؿ�����';
comment on column LC_LAND_INFO.landposition
  is '�ؿ�λ��';
comment on column LC_LAND_INFO.landname
  is '�ؿ�����';
comment on column LC_LAND_INFO.landareadivision
  is '�ؿ�����';
comment on column LC_LAND_INFO.landapprovenumber
  is '�ؿ���׼�ĺ�';
comment on column LC_LAND_INFO.landapprovedate
  is '�ؿ���׼ʱ��';
comment on column LC_LAND_INFO.parentname
  is 'Ȩ������';
comment on column LC_LAND_INFO.landstatus
  is '�ؿ�״̬';
comment on column LC_LAND_INFO.landshape
  is '�ؿ���״';
comment on column LC_LAND_INFO.landlength
  is '�ؿ鳤��';
comment on column LC_LAND_INFO.landwidth
  is '�ؿ���';
comment on column LC_LAND_INFO.landarea_mu
  is '�ؿ������Ķ��';
comment on column LC_LAND_INFO.landarea_square
  is '�ؿ������ƽ���ף�';
comment on column LC_LAND_INFO.landphoto
  is '�ؿ�ͼƬ';
comment on column LC_LAND_INFO.landusing
  is '�ؿ���;';
comment on column LC_LAND_INFO.description
  is '��������';
comment on column LC_LAND_INFO.creator_id
  is '������id';
comment on column LC_LAND_INFO.creator
  is '������';
comment on column LC_LAND_INFO.create_date
  is '��������';
comment on column LC_LAND_INFO.modifiedby
  is '�޸���';
comment on column LC_LAND_INFO.modifiedby_id
  is '�޸���id';
comment on column LC_LAND_INFO.modified_date
  is '�޸�����';
comment on column LC_LAND_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_LAND_INFO.version
  is '�汾��';
comment on column LC_LAND_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_LAND_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_LAND_INFO.bus_date
  is 'ҵ������';
comment on column LC_LAND_INFO.exa_remarks
  is '������ע';
comment on column LC_LAND_INFO.src_table
  is '��Դʵ��';
comment on column LC_LAND_INFO.src_system
  is '��Դϵͳ';
comment on column LC_LAND_INFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_LAND_MAKEINFO
prompt ===============================
prompt
create table LC_LAND_MAKEINFO
(
  landcode       VARCHAR2(255),
  makecost       NUMBER,
  makeprice      NUMBER,
  stonevolume    NUMBER,
  makeyear       VARCHAR2(255),
  contcode       VARCHAR2(255),
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
comment on table LC_LAND_MAKEINFO
  is '�ؿ��մ���Ϣ��';
comment on column LC_LAND_MAKEINFO.landcode
  is '�ؿ����';
comment on column LC_LAND_MAKEINFO.makecost
  is '��سɱ�';
comment on column LC_LAND_MAKEINFO.makeprice
  is '��ص���';
comment on column LC_LAND_MAKEINFO.stonevolume
  is '��ʯ����';
comment on column LC_LAND_MAKEINFO.makeyear
  is '������';
comment on column LC_LAND_MAKEINFO.contcode
  is '��ͬ���';
comment on column LC_LAND_MAKEINFO.description
  is '��������';
comment on column LC_LAND_MAKEINFO.creator_id
  is '������id';
comment on column LC_LAND_MAKEINFO.creator
  is '������';
comment on column LC_LAND_MAKEINFO.create_date
  is '��������';
comment on column LC_LAND_MAKEINFO.modifiedby
  is '�޸���';
comment on column LC_LAND_MAKEINFO.modifiedby_id
  is '�޸���id';
comment on column LC_LAND_MAKEINFO.modified_date
  is '�޸�����';
comment on column LC_LAND_MAKEINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_LAND_MAKEINFO.version
  is '�汾��';
comment on column LC_LAND_MAKEINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_LAND_MAKEINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_LAND_MAKEINFO.bus_date
  is 'ҵ������';
comment on column LC_LAND_MAKEINFO.exa_remarks
  is '������ע';
comment on column LC_LAND_MAKEINFO.src_table
  is '��Դʵ��';
comment on column LC_LAND_MAKEINFO.src_system
  is '��Դϵͳ';
comment on column LC_LAND_MAKEINFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_LAND_OPERATIONSINFO
prompt =====================================
prompt
create table LC_LAND_OPERATIONSINFO
(
  landcode                   VARCHAR2(255),
  contcode                   VARCHAR2(255),
  contname                   VARCHAR2(255),
  prelandtransferbuycontcode VARCHAR2(255),
  prelandtransferbuycontname VARCHAR2(255),
  landtransferperiod         VARCHAR2(255),
  transfertotalamount        NUMBER,
  sellprice                  NUMBER,
  conttotalamount            NUMBER,
  agreedate                  DATE,
  reallydate                 DATE,
  bookingpayoffdate          DATE,
  reallypayoffdate           DATE,
  description                VARCHAR2(255),
  creator_id                 VARCHAR2(120),
  creator                    VARCHAR2(120),
  create_date                DATE,
  modifiedby                 VARCHAR2(120),
  modifiedby_id              VARCHAR2(120),
  modified_date              DATE,
  version_status             NUMBER,
  version                    NUMBER,
  latestversion              NUMBER,
  approvalstae               NUMBER,
  bus_date                   DATE,
  exa_remarks                VARCHAR2(500),
  src_table                  VARCHAR2(255),
  src_system                 VARCHAR2(255),
  sort_id                    NUMBER(38)
)
;
comment on table LC_LAND_OPERATIONSINFO
  is '�ؿ��۵�������Ϣ��';
comment on column LC_LAND_OPERATIONSINFO.landcode
  is '�ؿ����';
comment on column LC_LAND_OPERATIONSINFO.contcode
  is '��ͬ���';
comment on column LC_LAND_OPERATIONSINFO.contname
  is '��ͬ����';
comment on column LC_LAND_OPERATIONSINFO.prelandtransferbuycontcode
  is 'ԭ���س��ú�ͬ�ţ����غ�ͬ��';
comment on column LC_LAND_OPERATIONSINFO.prelandtransferbuycontname
  is 'ԭ���س��ú�ͬ����';
comment on column LC_LAND_OPERATIONSINFO.landtransferperiod
  is '����ת������';
comment on column LC_LAND_OPERATIONSINFO.transfertotalamount
  is 'ת���ܼ�';
comment on column LC_LAND_OPERATIONSINFO.sellprice
  is '�۵ص���';
comment on column LC_LAND_OPERATIONSINFO.conttotalamount
  is '��ͬ���';
comment on column LC_LAND_OPERATIONSINFO.agreedate
  is 'Լ������ʱ��';
comment on column LC_LAND_OPERATIONSINFO.reallydate
  is 'ʵ�ʽ���ʱ��';
comment on column LC_LAND_OPERATIONSINFO.bookingpayoffdate
  is 'Ԥ������ʱ��';
comment on column LC_LAND_OPERATIONSINFO.reallypayoffdate
  is 'ʵ�ʸ���ʱ��';
comment on column LC_LAND_OPERATIONSINFO.description
  is '��������';
comment on column LC_LAND_OPERATIONSINFO.creator_id
  is '������id';
comment on column LC_LAND_OPERATIONSINFO.creator
  is '������';
comment on column LC_LAND_OPERATIONSINFO.create_date
  is '��������';
comment on column LC_LAND_OPERATIONSINFO.modifiedby
  is '�޸���';
comment on column LC_LAND_OPERATIONSINFO.modifiedby_id
  is '�޸���id';
comment on column LC_LAND_OPERATIONSINFO.modified_date
  is '�޸�����';
comment on column LC_LAND_OPERATIONSINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_LAND_OPERATIONSINFO.version
  is '�汾��';
comment on column LC_LAND_OPERATIONSINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_LAND_OPERATIONSINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_LAND_OPERATIONSINFO.bus_date
  is 'ҵ������';
comment on column LC_LAND_OPERATIONSINFO.exa_remarks
  is '������ע';
comment on column LC_LAND_OPERATIONSINFO.src_table
  is '��Դʵ��';
comment on column LC_LAND_OPERATIONSINFO.src_system
  is '��Դϵͳ';
comment on column LC_LAND_OPERATIONSINFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_LAND_PLANINFO
prompt ===============================
prompt
create table LC_LAND_PLANINFO
(
  landcode       VARCHAR2(255),
  buydate        DATE,
  developdate    DATE,
  transferdate   DATE,
  transferperiod DATE,
  transferprice  NUMBER,
  usingunit      VARCHAR2(255),
  parcelcode     VARCHAR2(255),
  iguid          VARCHAR2(255),
  makecost       NUMBER,
  buycost        NUMBER,
  transferprofit NUMBER,
  financefee     NUMBER,
  managefee      NUMBER,
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
comment on table LC_LAND_PLANINFO
  is '�ؿ�滮��Ϣ��';
comment on column LC_LAND_PLANINFO.landcode
  is '�ؿ����';
comment on column LC_LAND_PLANINFO.buydate
  is '����ʱ��';
comment on column LC_LAND_PLANINFO.developdate
  is '����ʱ��';
comment on column LC_LAND_PLANINFO.transferdate
  is 'ת��ʱ��';
comment on column LC_LAND_PLANINFO.transferperiod
  is 'ת������';
comment on column LC_LAND_PLANINFO.transferprice
  is 'ת�ü۸�';
comment on column LC_LAND_PLANINFO.usingunit
  is 'ʹ�õ�λ';
comment on column LC_LAND_PLANINFO.parcelcode
  is '�ڵر��';
comment on column LC_LAND_PLANINFO.iguid
  is 'IGUID';
comment on column LC_LAND_PLANINFO.makecost
  is '��سɱ�';
comment on column LC_LAND_PLANINFO.buycost
  is '���سɱ�';
comment on column LC_LAND_PLANINFO.transferprofit
  is 'ת������';
comment on column LC_LAND_PLANINFO.financefee
  is '�������';
comment on column LC_LAND_PLANINFO.managefee
  is '�������';
comment on column LC_LAND_PLANINFO.description
  is '��������';
comment on column LC_LAND_PLANINFO.creator_id
  is '������id';
comment on column LC_LAND_PLANINFO.creator
  is '������';
comment on column LC_LAND_PLANINFO.create_date
  is '��������';
comment on column LC_LAND_PLANINFO.modifiedby
  is '�޸���';
comment on column LC_LAND_PLANINFO.modifiedby_id
  is '�޸���id';
comment on column LC_LAND_PLANINFO.modified_date
  is '�޸�����';
comment on column LC_LAND_PLANINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_LAND_PLANINFO.version
  is '�汾��';
comment on column LC_LAND_PLANINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_LAND_PLANINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_LAND_PLANINFO.bus_date
  is 'ҵ������';
comment on column LC_LAND_PLANINFO.exa_remarks
  is '������ע';
comment on column LC_LAND_PLANINFO.src_table
  is '��Դʵ��';
comment on column LC_LAND_PLANINFO.src_system
  is '��Դϵͳ';
comment on column LC_LAND_PLANINFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_LAND_SELLINFO
prompt ===============================
prompt
create table LC_LAND_SELLINFO
(
  landcode         VARCHAR2(255),
  sellyear         VARCHAR2(255),
  plantransferyear VARCHAR2(255),
  sellcontcode     VARCHAR2(255),
  parcelcode       VARCHAR2(255),
  transfer         VARCHAR2(255),
  transferee       VARCHAR2(255),
  dealdate         DATE,
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
  bus_date         DATE,
  exa_remarks      VARCHAR2(500),
  src_table        VARCHAR2(255),
  src_system       VARCHAR2(255),
  sort_id          NUMBER(38)
)
;
comment on table LC_LAND_SELLINFO
  is '�ؿ��۵���Ϣ��';
comment on column LC_LAND_SELLINFO.landcode
  is '�ؿ����';
comment on column LC_LAND_SELLINFO.sellyear
  is '�۵����';
comment on column LC_LAND_SELLINFO.plantransferyear
  is '�ƻ�ת�����';
comment on column LC_LAND_SELLINFO.sellcontcode
  is '�۵غ�ͬ���';
comment on column LC_LAND_SELLINFO.parcelcode
  is '�ڵغ�';
comment on column LC_LAND_SELLINFO.transfer
  is '�ؿ�ת�÷�';
comment on column LC_LAND_SELLINFO.transferee
  is '�ؿ����÷�';
comment on column LC_LAND_SELLINFO.dealdate
  is '����ʱ��';
comment on column LC_LAND_SELLINFO.description
  is '��������';
comment on column LC_LAND_SELLINFO.creator_id
  is '������id';
comment on column LC_LAND_SELLINFO.creator
  is '������';
comment on column LC_LAND_SELLINFO.create_date
  is '��������';
comment on column LC_LAND_SELLINFO.modifiedby
  is '�޸���';
comment on column LC_LAND_SELLINFO.modifiedby_id
  is '�޸���id';
comment on column LC_LAND_SELLINFO.modified_date
  is '�޸�����';
comment on column LC_LAND_SELLINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_LAND_SELLINFO.version
  is '�汾��';
comment on column LC_LAND_SELLINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_LAND_SELLINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_LAND_SELLINFO.bus_date
  is 'ҵ������';
comment on column LC_LAND_SELLINFO.exa_remarks
  is '������ע';
comment on column LC_LAND_SELLINFO.src_table
  is '��Դʵ��';
comment on column LC_LAND_SELLINFO.src_system
  is '��Դϵͳ';
comment on column LC_LAND_SELLINFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_LAND_STORAGEINFO
prompt ==================================
prompt
create table LC_LAND_STORAGEINFO
(
  landcode       VARCHAR2(255),
  storecode      VARCHAR2(255),
  prjname        VARCHAR2(255),
  storeyear      DATE,
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
comment on table LC_LAND_STORAGEINFO
  is '�ؿ鴢����Ϣ��';
comment on column LC_LAND_STORAGEINFO.landcode
  is '�ؿ����';
comment on column LC_LAND_STORAGEINFO.storecode
  is '�մ����';
comment on column LC_LAND_STORAGEINFO.prjname
  is '��Ŀ����';
comment on column LC_LAND_STORAGEINFO.storeyear
  is '�մ����';
comment on column LC_LAND_STORAGEINFO.description
  is '��������';
comment on column LC_LAND_STORAGEINFO.creator_id
  is '������id';
comment on column LC_LAND_STORAGEINFO.creator
  is '������';
comment on column LC_LAND_STORAGEINFO.create_date
  is '��������';
comment on column LC_LAND_STORAGEINFO.modifiedby
  is '�޸���';
comment on column LC_LAND_STORAGEINFO.modifiedby_id
  is '�޸���id';
comment on column LC_LAND_STORAGEINFO.modified_date
  is '�޸�����';
comment on column LC_LAND_STORAGEINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_LAND_STORAGEINFO.version
  is '�汾��';
comment on column LC_LAND_STORAGEINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_LAND_STORAGEINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_LAND_STORAGEINFO.bus_date
  is 'ҵ������';
comment on column LC_LAND_STORAGEINFO.exa_remarks
  is '������ע';
comment on column LC_LAND_STORAGEINFO.src_table
  is '��Դʵ��';
comment on column LC_LAND_STORAGEINFO.src_system
  is '��Դϵͳ';
comment on column LC_LAND_STORAGEINFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_LAND_USERANGE
prompt ===============================
prompt
create table LC_LAND_USERANGE
(
  landcode       VARCHAR2(255),
  areacode       VARCHAR2(255),
  areameasure    NUMBER,
  landscopeline  VARCHAR2(255),
  landplanlayer  VARCHAR2(255),
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
comment on table LC_LAND_USERANGE
  is '�ؿ��õط�Χ��Ϣ��';
comment on column LC_LAND_USERANGE.landcode
  is '�ؿ����';
comment on column LC_LAND_USERANGE.areacode
  is '������';
comment on column LC_LAND_USERANGE.areameasure
  is '�������';
comment on column LC_LAND_USERANGE.landscopeline
  is '�õط�Χ��';
comment on column LC_LAND_USERANGE.landplanlayer
  is '�õع滮ͼ��';
comment on column LC_LAND_USERANGE.description
  is '��������';
comment on column LC_LAND_USERANGE.creator_id
  is '������id';
comment on column LC_LAND_USERANGE.creator
  is '������';
comment on column LC_LAND_USERANGE.create_date
  is '��������';
comment on column LC_LAND_USERANGE.modifiedby
  is '�޸���';
comment on column LC_LAND_USERANGE.modifiedby_id
  is '�޸���id';
comment on column LC_LAND_USERANGE.modified_date
  is '�޸�����';
comment on column LC_LAND_USERANGE.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_LAND_USERANGE.version
  is '�汾��';
comment on column LC_LAND_USERANGE.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_LAND_USERANGE.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_LAND_USERANGE.bus_date
  is 'ҵ������';
comment on column LC_LAND_USERANGE.exa_remarks
  is '������ע';
comment on column LC_LAND_USERANGE.src_table
  is '��Դʵ��';
comment on column LC_LAND_USERANGE.src_system
  is '��Դϵͳ';
comment on column LC_LAND_USERANGE.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_ORG_INFO
prompt ==========================
prompt
create table LC_ORG_INFO
(
  code                  VARCHAR2(255),
  name                  VARCHAR2(255),
  org_type              VARCHAR2(255),
  shortname             VARCHAR2(255),
  relation              VARCHAR2(255),
  org_level             VARCHAR2(255),
  competentorg          VARCHAR2(255),
  properties            VARCHAR2(255),
  established           DATE,
  personsresponsible    VARCHAR2(255),
  contactperson         VARCHAR2(255),
  corporateinterest     VARCHAR2(255),
  corporateinteresttype VARCHAR2(255),
  rightproportion       NUMBER,
  shareholdingratio     NUMBER,
  amountcontribution    NUMBER,
  accountingmethod      VARCHAR2(255),
  begindate             DATE,
  enddate               DATE,
  registeredcapital     NUMBER,
  paidupcapital         NUMBER,
  emp_inside            VARCHAR2(255),
  emp_outside           VARCHAR2(255),
  emp_independent       VARCHAR2(255),
  emp_supervisor        VARCHAR2(255),
  postaladdress         VARCHAR2(255),
  zipcode               VARCHAR2(255),
  phonenumber           VARCHAR2(255),
  faxno                 VARCHAR2(255),
  cablenumber           VARCHAR2(255),
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
  bus_date              DATE,
  exa_remarks           VARCHAR2(500),
  src_table             VARCHAR2(255),
  src_system            VARCHAR2(255),
  sort_id               NUMBER(38)
)
;
comment on table LC_ORG_INFO
  is '��֯������Ϣ��';
comment on column LC_ORG_INFO.code
  is '��֯����';
comment on column LC_ORG_INFO.name
  is '��֯����';
comment on column LC_ORG_INFO.org_type
  is '��֯����';
comment on column LC_ORG_INFO.shortname
  is '��֯���';
comment on column LC_ORG_INFO.relation
  is '������ϵ';
comment on column LC_ORG_INFO.org_level
  is '��֯����';
comment on column LC_ORG_INFO.competentorg
  is '���ܵ�λ����';
comment on column LC_ORG_INFO.properties
  is '��֯����';
comment on column LC_ORG_INFO.established
  is '����ʱ��';
comment on column LC_ORG_INFO.personsresponsible
  is '������';
comment on column LC_ORG_INFO.contactperson
  is '��ϵ��';
comment on column LC_ORG_INFO.corporateinterest
  is 'Ȩ�湫˾';
comment on column LC_ORG_INFO.corporateinteresttype
  is 'Ȩ�湫˾����';
comment on column LC_ORG_INFO.rightproportion
  is 'Ȩ�����';
comment on column LC_ORG_INFO.shareholdingratio
  is '�ֹɱ���';
comment on column LC_ORG_INFO.amountcontribution
  is '�ܳ��ʶ�';
comment on column LC_ORG_INFO.accountingmethod
  is '���㷽��';
comment on column LC_ORG_INFO.begindate
  is '��ʼʱ��';
comment on column LC_ORG_INFO.enddate
  is '����ʱ��';
comment on column LC_ORG_INFO.registeredcapital
  is 'ע���ʱ�';
comment on column LC_ORG_INFO.paidupcapital
  is 'ʵ���ʱ�';
comment on column LC_ORG_INFO.emp_inside
  is '���£��ڲ���Ա��';
comment on column LC_ORG_INFO.emp_outside
  is '���£��ⲿ��Ա��';
comment on column LC_ORG_INFO.emp_independent
  is '������������';
comment on column LC_ORG_INFO.emp_supervisor
  is '���£��ڲ���Ա��';
comment on column LC_ORG_INFO.postaladdress
  is 'ͨѶ��ַ';
comment on column LC_ORG_INFO.zipcode
  is '��������';
comment on column LC_ORG_INFO.phonenumber
  is '�绰����';
comment on column LC_ORG_INFO.faxno
  is '�������';
comment on column LC_ORG_INFO.cablenumber
  is '�籨����';
comment on column LC_ORG_INFO.description
  is '��������';
comment on column LC_ORG_INFO.creator_id
  is '������id';
comment on column LC_ORG_INFO.creator
  is '������';
comment on column LC_ORG_INFO.create_date
  is '��������';
comment on column LC_ORG_INFO.modifiedby
  is '�޸���';
comment on column LC_ORG_INFO.modifiedby_id
  is '�޸���id';
comment on column LC_ORG_INFO.modified_date
  is '�޸�����';
comment on column LC_ORG_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_ORG_INFO.version
  is '�汾��';
comment on column LC_ORG_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_ORG_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_ORG_INFO.bus_date
  is 'ҵ������';
comment on column LC_ORG_INFO.exa_remarks
  is '������ע';
comment on column LC_ORG_INFO.src_table
  is '��Դʵ��';
comment on column LC_ORG_INFO.src_system
  is '��Դϵͳ';
comment on column LC_ORG_INFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_PRJ_BID
prompt =========================
prompt
create table LC_PRJ_BID
(
  projectcode      VARCHAR2(255),
  bidcode          VARCHAR2(255),
  bidname          VARCHAR2(255),
  statuscode       VARCHAR2(255),
  bidtypeid        NUMBER,
  budgetcost       NUMBER,
  maxctrlprice     NUMBER,
  minctrlprice     NUMBER,
  maxctrlrate      NUMBER,
  minctrlrate      NUMBER,
  tendcost         NUMBER,
  booker           VARCHAR2(255),
  bookerdate       DATE,
  constructperiod  NUMBER,
  qualitydesc      VARCHAR2(255),
  bidbond          NUMBER,
  contracttype     VARCHAR2(255),
  bidqualification VARCHAR2(255),
  tenderchoosetype VARCHAR2(255),
  desctext         VARCHAR2(255),
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
  bus_date         DATE,
  exa_remarks      VARCHAR2(500),
  src_table        VARCHAR2(255),
  src_system       VARCHAR2(255),
  sort_id          NUMBER(38)
)
;
comment on table LC_PRJ_BID
  is '��Ŀ��Ͷ���';
comment on column LC_PRJ_BID.projectcode
  is '��Ŀ���';
comment on column LC_PRJ_BID.bidcode
  is '�б���';
comment on column LC_PRJ_BID.bidname
  is '�б�����';
comment on column LC_PRJ_BID.statuscode
  is '״̬';
comment on column LC_PRJ_BID.bidtypeid
  is '�б귽ʽ';
comment on column LC_PRJ_BID.budgetcost
  is 'Ԥ���';
comment on column LC_PRJ_BID.maxctrlprice
  is '��߿��Ƽ�';
comment on column LC_PRJ_BID.minctrlprice
  is '��Ϳ��Ƽ�';
comment on column LC_PRJ_BID.maxctrlrate
  is '��߿��Ƽ��¸���';
comment on column LC_PRJ_BID.minctrlrate
  is '��Ϳ��Ƽ��¸���';
comment on column LC_PRJ_BID.tendcost
  is '�б��';
comment on column LC_PRJ_BID.booker
  is '������';
comment on column LC_PRJ_BID.bookerdate
  is '��������';
comment on column LC_PRJ_BID.constructperiod
  is 'ʩ������';
comment on column LC_PRJ_BID.qualitydesc
  is '����Ҫ��';
comment on column LC_PRJ_BID.bidbond
  is 'Ͷ�걣֤��';
comment on column LC_PRJ_BID.contracttype
  is '�а���ʽ';
comment on column LC_PRJ_BID.bidqualification
  is 'Ͷ������';
comment on column LC_PRJ_BID.tenderchoosetype
  is '���귽ʽ';
comment on column LC_PRJ_BID.desctext
  is '��ע';
comment on column LC_PRJ_BID.description
  is '��������';
comment on column LC_PRJ_BID.creator_id
  is '������id';
comment on column LC_PRJ_BID.creator
  is '������';
comment on column LC_PRJ_BID.create_date
  is '��������';
comment on column LC_PRJ_BID.modifiedby
  is '�޸���';
comment on column LC_PRJ_BID.modifiedby_id
  is '�޸���id';
comment on column LC_PRJ_BID.modified_date
  is '�޸�����';
comment on column LC_PRJ_BID.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_PRJ_BID.version
  is '�汾��';
comment on column LC_PRJ_BID.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_PRJ_BID.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_PRJ_BID.bus_date
  is 'ҵ������';
comment on column LC_PRJ_BID.exa_remarks
  is '������ע';
comment on column LC_PRJ_BID.src_table
  is '��Դʵ��';
comment on column LC_PRJ_BID.src_system
  is '��Դϵͳ';
comment on column LC_PRJ_BID.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_PRJ_BUDGET
prompt ============================
prompt
create table LC_PRJ_BUDGET
(
  projectcode    VARCHAR2(255),
  budgetcode     VARCHAR2(255),
  budgetname     VARCHAR2(255),
  statuscode     VARCHAR2(255),
  plancost       NUMBER,
  applyprice     NUMBER,
  auditprice     NUMBER,
  bookername     VARCHAR2(255),
  bookdate       DATE,
  auditorname    VARCHAR2(255),
  auditdate      DATE,
  enclosure      VARCHAR2(255),
  checkername    VARCHAR2(255),
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
comment on table LC_PRJ_BUDGET
  is 'Ԥ�����Ա�';
comment on column LC_PRJ_BUDGET.projectcode
  is '��Ŀ���';
comment on column LC_PRJ_BUDGET.budgetcode
  is 'Ԥ����';
comment on column LC_PRJ_BUDGET.budgetname
  is 'Ԥ������';
comment on column LC_PRJ_BUDGET.statuscode
  is 'Ԥ��״̬';
comment on column LC_PRJ_BUDGET.plancost
  is '�����ƻ�Ͷ�ʶ�';
comment on column LC_PRJ_BUDGET.applyprice
  is '�������';
comment on column LC_PRJ_BUDGET.auditprice
  is '������';
comment on column LC_PRJ_BUDGET.bookername
  is 'Ԥ�������';
comment on column LC_PRJ_BUDGET.bookdate
  is 'Ԥ���������';
comment on column LC_PRJ_BUDGET.auditorname
  is 'Ԥ�������';
comment on column LC_PRJ_BUDGET.auditdate
  is 'Ԥ���������';
comment on column LC_PRJ_BUDGET.enclosure
  is '����';
comment on column LC_PRJ_BUDGET.checkername
  is 'Ԥ�㸴����';
comment on column LC_PRJ_BUDGET.description
  is '��������';
comment on column LC_PRJ_BUDGET.creator_id
  is '������id';
comment on column LC_PRJ_BUDGET.creator
  is '������';
comment on column LC_PRJ_BUDGET.create_date
  is '��������';
comment on column LC_PRJ_BUDGET.modifiedby
  is '�޸���';
comment on column LC_PRJ_BUDGET.modifiedby_id
  is '�޸���id';
comment on column LC_PRJ_BUDGET.modified_date
  is '�޸�����';
comment on column LC_PRJ_BUDGET.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_PRJ_BUDGET.version
  is '�汾��';
comment on column LC_PRJ_BUDGET.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_PRJ_BUDGET.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_PRJ_BUDGET.bus_date
  is 'ҵ������';
comment on column LC_PRJ_BUDGET.exa_remarks
  is '������ע';
comment on column LC_PRJ_BUDGET.src_table
  is '��Դʵ��';
comment on column LC_PRJ_BUDGET.src_system
  is '��Դϵͳ';
comment on column LC_PRJ_BUDGET.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_PRJ_INVESTMENT
prompt ================================
prompt
create table LC_PRJ_INVESTMENT
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
comment on table LC_PRJ_INVESTMENT
  is '��ĿͶ����Ϣ��';
comment on column LC_PRJ_INVESTMENT.project_id
  is '��Ŀ��';
comment on column LC_PRJ_INVESTMENT.project_code
  is '��Ŀ���';
comment on column LC_PRJ_INVESTMENT.originalamount
  is 'ԭʼͶ�ʶ�';
comment on column LC_PRJ_INVESTMENT.currentamount
  is '��ǰ�ۼ�Ͷ�ʶ�';
comment on column LC_PRJ_INVESTMENT.investyear
  is 'Ͷ�����';
comment on column LC_PRJ_INVESTMENT.investamount
  is 'Ͷ���ܶ�';
comment on column LC_PRJ_INVESTMENT.plannedamount
  is 'Ͷ�ʼƻ��ܶ�';
comment on column LC_PRJ_INVESTMENT.actualamount
  is 'ʵ�������Ͷ��';
comment on column LC_PRJ_INVESTMENT.estimateinvestment
  is '����Ͷ�ʶ�';
comment on column LC_PRJ_INVESTMENT.budgetaryinvestment
  is '����Ͷ�ʶ�';
comment on column LC_PRJ_INVESTMENT.contractcode
  is '��ͬ����';
comment on column LC_PRJ_INVESTMENT.contractname
  is '��ͬ����';
comment on column LC_PRJ_INVESTMENT.description
  is '��������';
comment on column LC_PRJ_INVESTMENT.creator_id
  is '������id';
comment on column LC_PRJ_INVESTMENT.creator
  is '������';
comment on column LC_PRJ_INVESTMENT.create_date
  is '��������';
comment on column LC_PRJ_INVESTMENT.modifiedby
  is '�޸���';
comment on column LC_PRJ_INVESTMENT.modifiedby_id
  is '�޸���id';
comment on column LC_PRJ_INVESTMENT.modified_date
  is '�޸�����';
comment on column LC_PRJ_INVESTMENT.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_PRJ_INVESTMENT.version
  is '�汾��';
comment on column LC_PRJ_INVESTMENT.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_PRJ_INVESTMENT.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_PRJ_INVESTMENT.bus_date
  is 'ҵ������';
comment on column LC_PRJ_INVESTMENT.exa_remarks
  is '������ע';
comment on column LC_PRJ_INVESTMENT.src_table
  is '��Դ��';
comment on column LC_PRJ_INVESTMENT.src_system
  is '��Դϵͳ';
comment on column LC_PRJ_INVESTMENT.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_PRJ_LANDPRJ
prompt =============================
prompt
create table LC_PRJ_LANDPRJ
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
comment on table LC_PRJ_LANDPRJ
  is '���ؾ�Ӫ����Ŀ��Ϣ';
comment on column LC_PRJ_LANDPRJ.project_id
  is '��Ŀ��';
comment on column LC_PRJ_LANDPRJ.project_code
  is '��Ŀ����';
comment on column LC_PRJ_LANDPRJ.project_name
  is '��Ŀ����';
comment on column LC_PRJ_LANDPRJ.projectsetuptime
  is '����ʱ��';
comment on column LC_PRJ_LANDPRJ.approvefile
  is '��������';
comment on column LC_PRJ_LANDPRJ.approveunit
  is '����������λ';
comment on column LC_PRJ_LANDPRJ.projectstatus
  is '��Ŀ״̬����';
comment on column LC_PRJ_LANDPRJ.projectstatuscode
  is '��Ŀ״̬';
comment on column LC_PRJ_LANDPRJ.projecttype
  is '��Ŀ��������';
comment on column LC_PRJ_LANDPRJ.projecttypecode
  is '��Ŀ����';
comment on column LC_PRJ_LANDPRJ.targetbegintime
  is '�ƻ���ʼ����';
comment on column LC_PRJ_LANDPRJ.targetendtime
  is '�ƻ���������';
comment on column LC_PRJ_LANDPRJ.neworcontinued
  is '�½�/����';
comment on column LC_PRJ_LANDPRJ.actbegintime
  is 'ʵ�ʿ�ʼʱ��';
comment on column LC_PRJ_LANDPRJ.actendtime
  is 'ʵ���������';
comment on column LC_PRJ_LANDPRJ.investamount
  is '��Ͷ�ʶ�';
comment on column LC_PRJ_LANDPRJ.investamountyear
  is '����Ͷ�ʶ�';
comment on column LC_PRJ_LANDPRJ.projectscale
  is '�����ģ';
comment on column LC_PRJ_LANDPRJ.projectcontent
  is '��������';
comment on column LC_PRJ_LANDPRJ.projectaddr
  is '��Ŀ��ַ';
comment on column LC_PRJ_LANDPRJ.projecteps
  is '��ĿEPS';
comment on column LC_PRJ_LANDPRJ.responsibleteam
  is '�����Ŷ�';
comment on column LC_PRJ_LANDPRJ.desctext
  is '��ע';
comment on column LC_PRJ_LANDPRJ.role
  is '��Ŀ��ɫ';
comment on column LC_PRJ_LANDPRJ.unitcode
  is '��λ����';
comment on column LC_PRJ_LANDPRJ.unitname
  is '��λ����';
comment on column LC_PRJ_LANDPRJ.contactperson
  is '��ϵ��';
comment on column LC_PRJ_LANDPRJ.land_code
  is '�ؿ����';
comment on column LC_PRJ_LANDPRJ.land_name
  is '�ؿ�����';
comment on column LC_PRJ_LANDPRJ.land_finishdate
  is '������ʱ��';
comment on column LC_PRJ_LANDPRJ.land_type
  is '�ؿ�����';
comment on column LC_PRJ_LANDPRJ.land_realarrivesate
  is 'ʵ�ʴﵽ״̬';
comment on column LC_PRJ_LANDPRJ.changereason
  is '��Ŀ���ԭ��';
comment on column LC_PRJ_LANDPRJ.changedate
  is '���ʱ��';
comment on column LC_PRJ_LANDPRJ.changeamount
  is '������';
comment on column LC_PRJ_LANDPRJ.buyredline54coord
  is '���غ���ͼ�����꣨54����ϵ��';
comment on column LC_PRJ_LANDPRJ.buyredline80coord
  is '���غ���ͼ�����꣨80����ϵ��';
comment on column LC_PRJ_LANDPRJ.isredclaim
  is '�Ƿ񳬺�������';
comment on column LC_PRJ_LANDPRJ.claimscope
  is '���ⷶΧͼ';
comment on column LC_PRJ_LANDPRJ.ownerunit
  is 'ҵ����λ';
comment on column LC_PRJ_LANDPRJ.prjunit
  is '���λ';
comment on column LC_PRJ_LANDPRJ.land_description
  is '�õظſ�';
comment on column LC_PRJ_LANDPRJ.planprice
  is '�ƻ�����';
comment on column LC_PRJ_LANDPRJ.plantotalamout
  is '�ƻ��ܽ��';
comment on column LC_PRJ_LANDPRJ.claimfinishdate
  is '�����������ʱ��';
comment on column LC_PRJ_LANDPRJ.referdate
  is '����ʱ��';
comment on column LC_PRJ_LANDPRJ.approvenum
  is '�ؿ���׼�ĺ�';
comment on column LC_PRJ_LANDPRJ.approvedate
  is '�ؿ�����ʱ��';
comment on column LC_PRJ_LANDPRJ.buyarea_mu
  is '�ؿ鱾���������(Ķ)';
comment on column LC_PRJ_LANDPRJ.buyarea_square
  is '�ؿ鱾�����������ƽ���ף�';
comment on column LC_PRJ_LANDPRJ.payoffprj
  is '����֧����Ŀ';
comment on column LC_PRJ_LANDPRJ.makeprjnum
  is '�����Ŀ���';
comment on column LC_PRJ_LANDPRJ.makeprjcode
  is '�����Ŀ����';
comment on column LC_PRJ_LANDPRJ.contamount
  is '��ͬ���';
comment on column LC_PRJ_LANDPRJ.prjperiod
  is '���̹���';
comment on column LC_PRJ_LANDPRJ.conttotalamount
  is '��ͬ������';
comment on column LC_PRJ_LANDPRJ.estimatequantity
  is 'Ԥ�ƹ�����';
comment on column LC_PRJ_LANDPRJ.coverstonebuyprice
  is '�������ʯ������';
comment on column LC_PRJ_LANDPRJ.coverestimatetotalcost
  is '���Ԥ���ܳɱ�';
comment on column LC_PRJ_LANDPRJ.digestimatetotalcost
  is '�ڷ���Ԥ���ܳɱ�';
comment on column LC_PRJ_LANDPRJ.performancebond
  is '��Լ��֤��';
comment on column LC_PRJ_LANDPRJ.emergencybond
  is '��ȫӦ����';
comment on column LC_PRJ_LANDPRJ.constructionunit
  is 'ʩ����λ';
comment on column LC_PRJ_LANDPRJ.digareanum
  is '�ڷ���������';
comment on column LC_PRJ_LANDPRJ.diglandnum
  is '�ڷ����ؿ���';
comment on column LC_PRJ_LANDPRJ.expectedigarea
  is 'Ԥ���ڷ������';
comment on column LC_PRJ_LANDPRJ.coverareanum
  is '���������';
comment on column LC_PRJ_LANDPRJ.coverlandnum
  is '����ؿ���';
comment on column LC_PRJ_LANDPRJ.expectecoverarea
  is 'Ԥ��������';
comment on column LC_PRJ_LANDPRJ.description
  is '��������';
comment on column LC_PRJ_LANDPRJ.creator_id
  is '������id';
comment on column LC_PRJ_LANDPRJ.creator
  is '������';
comment on column LC_PRJ_LANDPRJ.create_date
  is '��������';
comment on column LC_PRJ_LANDPRJ.modifiedby
  is '�޸���';
comment on column LC_PRJ_LANDPRJ.modifiedby_id
  is '�޸���id';
comment on column LC_PRJ_LANDPRJ.modified_date
  is '�޸�����';
comment on column LC_PRJ_LANDPRJ.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_PRJ_LANDPRJ.version
  is '�汾��';
comment on column LC_PRJ_LANDPRJ.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_PRJ_LANDPRJ.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_PRJ_LANDPRJ.bus_date
  is 'ҵ������';
comment on column LC_PRJ_LANDPRJ.exa_remarks
  is '������ע';
comment on column LC_PRJ_LANDPRJ.src_table
  is '��Դ��';
comment on column LC_PRJ_LANDPRJ.src_system
  is '��Դϵͳ';
comment on column LC_PRJ_LANDPRJ.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_PRJ_OTHERBASEINFO
prompt ===================================
prompt
create table LC_PRJ_OTHERBASEINFO
(
  projectcode       VARCHAR2(255),
  projectname       VARCHAR2(255),
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
  responsibleteam   VARCHAR2(255),
  desctext          VARCHAR2(255),
  suppcode          VARCHAR2(255),
  suppname          VARCHAR2(255),
  suppcontacts      VARCHAR2(255),
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
comment on table LC_PRJ_OTHERBASEINFO
  is '������Ŀ������Ϣ';
comment on column LC_PRJ_OTHERBASEINFO.projectcode
  is '��Ŀ����';
comment on column LC_PRJ_OTHERBASEINFO.projectname
  is '��Ŀ����';
comment on column LC_PRJ_OTHERBASEINFO.projectsetuptime
  is '����ʱ��';
comment on column LC_PRJ_OTHERBASEINFO.approvefile
  is '��������';
comment on column LC_PRJ_OTHERBASEINFO.approveunit
  is '����������λ';
comment on column LC_PRJ_OTHERBASEINFO.projectstatus
  is '��Ŀ״̬����';
comment on column LC_PRJ_OTHERBASEINFO.projectstatuscode
  is '��Ŀ״̬';
comment on column LC_PRJ_OTHERBASEINFO.projecttype
  is '��Ŀ��������';
comment on column LC_PRJ_OTHERBASEINFO.projecttypecode
  is '��Ŀ����';
comment on column LC_PRJ_OTHERBASEINFO.targetbegintime
  is '�ƻ���ʼ����';
comment on column LC_PRJ_OTHERBASEINFO.targetendtime
  is '�ƻ���������';
comment on column LC_PRJ_OTHERBASEINFO.neworcontinued
  is '�½�/����';
comment on column LC_PRJ_OTHERBASEINFO.actbegintime
  is 'ʵ�ʿ�ʼʱ��';
comment on column LC_PRJ_OTHERBASEINFO.actendtime
  is 'ʵ���������';
comment on column LC_PRJ_OTHERBASEINFO.investamount
  is '��Ͷ�ʶ�';
comment on column LC_PRJ_OTHERBASEINFO.investamountyear
  is '����Ͷ�ʶ�';
comment on column LC_PRJ_OTHERBASEINFO.projectscale
  is '�����ģ';
comment on column LC_PRJ_OTHERBASEINFO.projectcontent
  is '��������';
comment on column LC_PRJ_OTHERBASEINFO.projectaddr
  is '��Ŀ��ַ';
comment on column LC_PRJ_OTHERBASEINFO.responsibleteam
  is '�����Ŷ�';
comment on column LC_PRJ_OTHERBASEINFO.desctext
  is '��ע';
comment on column LC_PRJ_OTHERBASEINFO.suppcode
  is '��Ӧ�̴���';
comment on column LC_PRJ_OTHERBASEINFO.suppname
  is '��Ӧ������';
comment on column LC_PRJ_OTHERBASEINFO.suppcontacts
  is '��Ӧ����ϵ��';
comment on column LC_PRJ_OTHERBASEINFO.description
  is '��������';
comment on column LC_PRJ_OTHERBASEINFO.creator_id
  is '������id';
comment on column LC_PRJ_OTHERBASEINFO.creator
  is '������';
comment on column LC_PRJ_OTHERBASEINFO.create_date
  is '��������';
comment on column LC_PRJ_OTHERBASEINFO.modifiedby
  is '�޸���';
comment on column LC_PRJ_OTHERBASEINFO.modifiedby_id
  is '�޸���id';
comment on column LC_PRJ_OTHERBASEINFO.modified_date
  is '�޸�����';
comment on column LC_PRJ_OTHERBASEINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_PRJ_OTHERBASEINFO.version
  is '�汾��';
comment on column LC_PRJ_OTHERBASEINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_PRJ_OTHERBASEINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_PRJ_OTHERBASEINFO.bus_date
  is 'ҵ������';
comment on column LC_PRJ_OTHERBASEINFO.exa_remarks
  is '������ע';
comment on column LC_PRJ_OTHERBASEINFO.src_table
  is '��Դʵ��';
comment on column LC_PRJ_OTHERBASEINFO.src_system
  is '��Դϵͳ';
comment on column LC_PRJ_OTHERBASEINFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_SBJ_INFO
prompt ==========================
prompt
create table LC_SBJ_INFO
(
  sbjcode                    VARCHAR2(255),
  sbjtype                    VARCHAR2(255),
  englishname                VARCHAR2(255),
  schinesename               VARCHAR2(255),
  tchinesename               VARCHAR2(255),
  parentsbjcode              VARCHAR2(255),
  ctrllevel_quote            VARCHAR2(255),
  ctrllevel_distribution     VARCHAR2(255),
  mnemoniccode               VARCHAR2(255),
  balancedirectionid         INTEGER,
  currencyaccounting         VARCHAR2(255),
  currencycode               VARCHAR2(255),
  finalcurrencyid            INTEGER,
  isjournalid                INTEGER,
  iscashid                   INTEGER,
  isbankid                   INTEGER,
  iscashequalid              INTEGER,
  isnumaccountingid          INTEGER,
  groupcoding                VARCHAR2(255),
  unitcode                   VARCHAR2(255),
  noticesid                  INTEGER,
  currentverificationid      INTEGER,
  cusbjtype                  VARCHAR2(255),
  cuauxiliarytype            VARCHAR2(255),
  sbjauxiliarytype           VARCHAR2(255),
  losttype                   VARCHAR2(255),
  bectrlsys                  VARCHAR2(255),
  customattributes           VARCHAR2(255),
  isaddbelowsbj_quote        VARCHAR2(255),
  isaddbelowsbj_distribution VARCHAR2(255),
  ispcuinvalidid             INTEGER,
  iscuinvalidid              INTEGER,
  sbjinvalidid               INTEGER,
  psbjinvalidid              INTEGER,
  creater                    VARCHAR2(255),
  createdate                 VARCHAR2(255),
  isoutsidesbjid             INTEGER,
  mastertableprj             VARCHAR2(255),
  scheduleproject            VARCHAR2(255),
  description                VARCHAR2(120),
  creator_id                 VARCHAR2(120),
  creator                    VARCHAR2(120),
  create_date                DATE,
  modifiedby                 VARCHAR2(120),
  modifiedby_id              VARCHAR2(120),
  modified_date              DATE,
  version_status             INTEGER,
  version                    INTEGER,
  latestversion              INTEGER,
  approvalstae               INTEGER,
  bus_date                   DATE,
  exa_remarks                VARCHAR2(500),
  src_table                  VARCHAR2(255),
  src_system                 VARCHAR2(255),
  sort_id                    NUMBER(38)
)
;
comment on table LC_SBJ_INFO
  is '����Ŀ������Ϣ��';
comment on column LC_SBJ_INFO.sbjcode
  is '��Ŀ����';
comment on column LC_SBJ_INFO.sbjtype
  is '��Ŀ����';
comment on column LC_SBJ_INFO.englishname
  is 'Ӣ��_����';
comment on column LC_SBJ_INFO.schinesename
  is '��������_����';
comment on column LC_SBJ_INFO.tchinesename
  is '��������_����';
comment on column LC_SBJ_INFO.parentsbjcode
  is '����Ŀ����';
comment on column LC_SBJ_INFO.ctrllevel_quote
  is '���Ƽ��Σ������ã�';
comment on column LC_SBJ_INFO.ctrllevel_distribution
  is '���Ƽ��Σ������ã�';
comment on column LC_SBJ_INFO.mnemoniccode
  is '������';
comment on column LC_SBJ_INFO.balancedirectionid
  is '����';
comment on column LC_SBJ_INFO.currencyaccounting
  is '�ұ����';
comment on column LC_SBJ_INFO.currencycode
  is '�ұ����';
comment on column LC_SBJ_INFO.finalcurrencyid
  is '��ĩ����';
comment on column LC_SBJ_INFO.isjournalid
  is '�Ƿ���ռ���';
comment on column LC_SBJ_INFO.iscashid
  is '�Ƿ��ֽ��Ŀ';
comment on column LC_SBJ_INFO.isbankid
  is '�Ƿ����п�Ŀ';
comment on column LC_SBJ_INFO.iscashequalid
  is '�Ƿ��ֽ�ȼ���';
comment on column LC_SBJ_INFO.isnumaccountingid
  is '��Ŀ����';
comment on column LC_SBJ_INFO.groupcoding
  is '������λ�����';
comment on column LC_SBJ_INFO.unitcode
  is '������λ����';
comment on column LC_SBJ_INFO.noticesid
  is '����֪ͨ';
comment on column LC_SBJ_INFO.currentverificationid
  is '��������';
comment on column LC_SBJ_INFO.cusbjtype
  is '����CU������Ŀ����������';
comment on column LC_SBJ_INFO.cuauxiliarytype
  is '�ϼ�CU����������';
comment on column LC_SBJ_INFO.sbjauxiliarytype
  is '�ϼ���Ŀ����������';
comment on column LC_SBJ_INFO.losttype
  is '��������';
comment on column LC_SBJ_INFO.bectrlsys
  is '�ܿ�ϵͳ';
comment on column LC_SBJ_INFO.customattributes
  is '��Ŀ�Զ�������';
comment on column LC_SBJ_INFO.isaddbelowsbj_quote
  is '�ܷ������¼���Ŀ�������ã�';
comment on column LC_SBJ_INFO.isaddbelowsbj_distribution
  is '�ܷ������¼���Ŀ�������ã�';
comment on column LC_SBJ_INFO.ispcuinvalidid
  is '�ϼ�CU�Ƿ����';
comment on column LC_SBJ_INFO.iscuinvalidid
  is '����CU�Ƿ����';
comment on column LC_SBJ_INFO.sbjinvalidid
  is '������Ŀ����';
comment on column LC_SBJ_INFO.psbjinvalidid
  is '����Ŀ����';
comment on column LC_SBJ_INFO.creater
  is '�����˱���';
comment on column LC_SBJ_INFO.createdate
  is '����ʱ��';
comment on column LC_SBJ_INFO.isoutsidesbjid
  is '�Ƿ�����Ŀ';
comment on column LC_SBJ_INFO.mastertableprj
  is '������Ŀ';
comment on column LC_SBJ_INFO.scheduleproject
  is '������Ŀ';
comment on column LC_SBJ_INFO.description
  is '��������';
comment on column LC_SBJ_INFO.creator_id
  is '������id';
comment on column LC_SBJ_INFO.creator
  is '������';
comment on column LC_SBJ_INFO.create_date
  is '��������';
comment on column LC_SBJ_INFO.modifiedby
  is '�޸���';
comment on column LC_SBJ_INFO.modifiedby_id
  is '�޸���id';
comment on column LC_SBJ_INFO.modified_date
  is '�޸�����';
comment on column LC_SBJ_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_SBJ_INFO.version
  is '�汾��';
comment on column LC_SBJ_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_SBJ_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_SBJ_INFO.bus_date
  is 'ҵ������';
comment on column LC_SBJ_INFO.exa_remarks
  is '������ע';
comment on column LC_SBJ_INFO.src_table
  is '��Դʵ��';
comment on column LC_SBJ_INFO.src_system
  is '��Դϵͳ';
comment on column LC_SBJ_INFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table LC_SUPP_INFO
prompt ===========================
prompt
create table LC_SUPP_INFO
(
  suppcode               VARCHAR2(255),
  suppname               VARCHAR2(255),
  unitrole               INTEGER,
  legalperson            VARCHAR2(255),
  unitnature             INTEGER,
  provincecity           VARCHAR2(255),
  regeditaddress         VARCHAR2(255),
  bank                   VARCHAR2(255),
  bankaccount            VARCHAR2(255),
  bussinesslicence       VARCHAR2(255),
  whichindustry          VARCHAR2(255),
  orgcode                VARCHAR2(255),
  areataxnum             VARCHAR2(255),
  nationtaxnum           VARCHAR2(255),
  address                VARCHAR2(255),
  postalcode             VARCHAR2(255),
  phone                  VARCHAR2(255),
  fax                    VARCHAR2(255),
  email                  VARCHAR2(255),
  homepage               VARCHAR2(255),
  supp_description       VARCHAR2(255),
  status                 VARCHAR2(255),
  ispassiso              INTEGER,
  unitcredit             INTEGER,
  regeditcapital         INTEGER,
  assetscapital          INTEGER,
  flowcapital            INTEGER,
  yearsellamount         INTEGER,
  fatorynum              INTEGER,
  fatoryaddress          VARCHAR2(255),
  fatoryphone            VARCHAR2(255),
  prjfax                 VARCHAR2(255),
  employeenum            INTEGER,
  technicalstaffnum      INTEGER,
  managementstaffnum     INTEGER,
  suppcertification      INTEGER,
  suppothercertification INTEGER,
  productcode            INTEGER,
  productname            VARCHAR2(255),
  productusage           VARCHAR2(255),
  specification          VARCHAR2(255),
  model                  VARCHAR2(255),
  budgetprice            INTEGER,
  purchaseadvance        INTEGER,
  arrivaladvance         INTEGER,
  purchasecycle          INTEGER,
  feetype                VARCHAR2(255),
  contcode               INTEGER,
  contname               VARCHAR2(255),
  performanceevaluation  VARCHAR2(255),
  biddate                DATE,
  biddingresults         INTEGER,
  emp_code               INTEGER,
  emp_name               VARCHAR2(255),
  emp_cardcode           VARCHAR2(255),
  emp_sex                VARCHAR2(255),
  emp_job                VARCHAR2(255),
  emp_title              VARCHAR2(255),
  emp_dept               VARCHAR2(255),
  emp_call               VARCHAR2(255),
  emp_role               VARCHAR2(255),
  emp_phone              VARCHAR2(255),
  emp_fax                VARCHAR2(255),
  emp_email              VARCHAR2(255),
  emp_address            VARCHAR2(255),
  emp_postcode           VARCHAR2(255),
  emp_mobile             VARCHAR2(255),
  emp_homecall           VARCHAR2(255),
  emp_photo              VARCHAR2(255),
  description            VARCHAR2(120),
  creator_id             VARCHAR2(120),
  creator                VARCHAR2(120),
  create_date            DATE,
  modifiedby             VARCHAR2(120),
  modifiedby_id          VARCHAR2(120),
  modified_date          DATE,
  version_status         INTEGER,
  version                INTEGER,
  latestversion          INTEGER,
  approvalstae           INTEGER,
  bus_date               DATE,
  exa_remarks            VARCHAR2(500),
  src_table              VARCHAR2(255),
  src_system             VARCHAR2(255),
  sort_id                NUMBER(38)
)
;
comment on table LC_SUPP_INFO
  is '��Ӧ�̻�����Ϣ��';
comment on column LC_SUPP_INFO.suppcode
  is '��Ӧ�̴���';
comment on column LC_SUPP_INFO.suppname
  is '��Ӧ������';
comment on column LC_SUPP_INFO.unitrole
  is '��λ��ɫ';
comment on column LC_SUPP_INFO.legalperson
  is '���˴���';
comment on column LC_SUPP_INFO.unitnature
  is '��λ����';
comment on column LC_SUPP_INFO.provincecity
  is '����ʡ��';
comment on column LC_SUPP_INFO.regeditaddress
  is 'ע���ַ';
comment on column LC_SUPP_INFO.bank
  is '��������';
comment on column LC_SUPP_INFO.bankaccount
  is '�����˺�';
comment on column LC_SUPP_INFO.bussinesslicence
  is 'Ӫҵִ�պ�';
comment on column LC_SUPP_INFO.whichindustry
  is '������ҵ';
comment on column LC_SUPP_INFO.orgcode
  is '��֯��������֤';
comment on column LC_SUPP_INFO.areataxnum
  is '��˰�ǼǺ�';
comment on column LC_SUPP_INFO.nationtaxnum
  is '��˰�ǼǺ�';
comment on column LC_SUPP_INFO.address
  is 'ͨѶ��ַ';
comment on column LC_SUPP_INFO.postalcode
  is '��������';
comment on column LC_SUPP_INFO.phone
  is '�绰����';
comment on column LC_SUPP_INFO.fax
  is '�������';
comment on column LC_SUPP_INFO.email
  is '�����ʼ�';
comment on column LC_SUPP_INFO.homepage
  is '��˾��ҳ';
comment on column LC_SUPP_INFO.supp_description
  is '��˾���';
comment on column LC_SUPP_INFO.status
  is '��Ӧ��״̬/���״̬';
comment on column LC_SUPP_INFO.ispassiso
  is '�Ƿ�ͨ��ISO';
comment on column LC_SUPP_INFO.unitcredit
  is '��λ����';
comment on column LC_SUPP_INFO.regeditcapital
  is 'ע���ʱ�';
comment on column LC_SUPP_INFO.assetscapital
  is '�̶��ʲ�';
comment on column LC_SUPP_INFO.flowcapital
  is '�����ʽ�';
comment on column LC_SUPP_INFO.yearsellamount
  is '�����۶�';
comment on column LC_SUPP_INFO.fatorynum
  is '��������';
comment on column LC_SUPP_INFO.fatoryaddress
  is '������ַ';
comment on column LC_SUPP_INFO.fatoryphone
  is '�����绰';
comment on column LC_SUPP_INFO.prjfax
  is '���̴���';
comment on column LC_SUPP_INFO.employeenum
  is '��˾Ա������';
comment on column LC_SUPP_INFO.technicalstaffnum
  is '������Ա����';
comment on column LC_SUPP_INFO.managementstaffnum
  is '������Ա����';
comment on column LC_SUPP_INFO.suppcertification
  is '��Ӧ������';
comment on column LC_SUPP_INFO.suppothercertification
  is '��Ӧ������רҵ��';
comment on column LC_SUPP_INFO.productcode
  is '��Ʒ����';
comment on column LC_SUPP_INFO.productname
  is '��Ʒ����';
comment on column LC_SUPP_INFO.productusage
  is '��Ʒʹ�����';
comment on column LC_SUPP_INFO.specification
  is '���';
comment on column LC_SUPP_INFO.model
  is '�ͺ�';
comment on column LC_SUPP_INFO.budgetprice
  is 'Ԥ��۸�';
comment on column LC_SUPP_INFO.purchaseadvance
  is '�ɹ���ǰ��';
comment on column LC_SUPP_INFO.arrivaladvance
  is '������ǰ��';
comment on column LC_SUPP_INFO.purchasecycle
  is 'PurchaseCycle';
comment on column LC_SUPP_INFO.feetype
  is '�������';
comment on column LC_SUPP_INFO.emp_code
  is '��Ա���';
comment on column LC_SUPP_INFO.emp_name
  is '����';
comment on column LC_SUPP_INFO.emp_cardcode
  is '����';
comment on column LC_SUPP_INFO.emp_sex
  is '�Ա�';
comment on column LC_SUPP_INFO.emp_job
  is 'ְ��';
comment on column LC_SUPP_INFO.emp_title
  is 'ְ��';
comment on column LC_SUPP_INFO.emp_dept
  is '������Ϣ';
comment on column LC_SUPP_INFO.emp_call
  is '�ƺ�';
comment on column LC_SUPP_INFO.emp_role
  is '��ɫ';
comment on column LC_SUPP_INFO.emp_phone
  is '�칫�绰';
comment on column LC_SUPP_INFO.emp_fax
  is '����';
comment on column LC_SUPP_INFO.emp_email
  is '�����ʼ�';
comment on column LC_SUPP_INFO.emp_address
  is '��ַ';
comment on column LC_SUPP_INFO.emp_postcode
  is '��������';
comment on column LC_SUPP_INFO.emp_mobile
  is '�ƶ��绰';
comment on column LC_SUPP_INFO.emp_homecall
  is '��ͥ�绰';
comment on column LC_SUPP_INFO.description
  is '��������';
comment on column LC_SUPP_INFO.creator_id
  is '������id';
comment on column LC_SUPP_INFO.creator
  is '������';
comment on column LC_SUPP_INFO.create_date
  is '��������';
comment on column LC_SUPP_INFO.modifiedby
  is '�޸���';
comment on column LC_SUPP_INFO.modifiedby_id
  is '�޸���id';
comment on column LC_SUPP_INFO.modified_date
  is '�޸�����';
comment on column LC_SUPP_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column LC_SUPP_INFO.version
  is '�汾��';
comment on column LC_SUPP_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column LC_SUPP_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column LC_SUPP_INFO.bus_date
  is 'ҵ������';
comment on column LC_SUPP_INFO.exa_remarks
  is '������ע';
comment on column LC_SUPP_INFO.src_system
  is '��Դϵͳ';
comment on column LC_SUPP_INFO.sort_id
  is '�����ֶ�';

prompt
prompt Creating table ORG
prompt ==================
prompt
create table ORG
(
  id                  NUMBER,
  sid                 NUMBER,
  code                VARCHAR2(255),
  name                VARCHAR2(255),
  type                VARCHAR2(255),
  typeid              NUMBER,
  shortname           VARCHAR2(255),
  parentid            NUMBER,
  relationid          NUMBER,
  relation            VARCHAR2(255),
  levelid             NUMBER,
  org_level           VARCHAR2(255),
  city                VARCHAR2(255),
  competentorg        VARCHAR2(255),
  propertiesid        VARCHAR2(255),
  properties          VARCHAR2(255),
  established         DATE,
  registeredaddress   VARCHAR2(255),
  legalrepresentative VARCHAR2(255),
  personsresponsible  VARCHAR2(255),
  fullname            VARCHAR2(255),
  contactperson       VARCHAR2(255),
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
  exa_remarks         VARCHAR2(500)
)
;
comment on table ORG
  is '��֯������Ϣ��';
comment on column ORG.id
  is '����';
comment on column ORG.sid
  is 'ԭϵͳID';
comment on column ORG.code
  is '��֯����';
comment on column ORG.name
  is '��֯����';
comment on column ORG.type
  is '��֯����';
comment on column ORG.typeid
  is '��֯����ID';
comment on column ORG.shortname
  is '��֯���';
comment on column ORG.parentid
  is '���ڵ�';
comment on column ORG.relationid
  is '������ϵID';
comment on column ORG.relation
  is '������ϵ';
comment on column ORG.levelid
  is '��֯����ID';
comment on column ORG.org_level
  is '��֯����';
comment on column ORG.city
  is '���ڳ���';
comment on column ORG.competentorg
  is '���ܵ�λ����';
comment on column ORG.propertiesid
  is '��֯����ID';
comment on column ORG.properties
  is '��֯����';
comment on column ORG.established
  is '����ʱ��';
comment on column ORG.registeredaddress
  is 'ע���ַ';
comment on column ORG.legalrepresentative
  is '���˴���';
comment on column ORG.personsresponsible
  is '������';
comment on column ORG.fullname
  is 'ȫ��';
comment on column ORG.contactperson
  is '��ϵ��';
comment on column ORG.description
  is '��������';
comment on column ORG.creator_id
  is '������id';
comment on column ORG.creator
  is '������';
comment on column ORG.create_date
  is '��������';
comment on column ORG.modifiedby
  is '�޸���';
comment on column ORG.modifiedby_id
  is '�޸���id';
comment on column ORG.modified_date
  is '�޸�����';
comment on column ORG.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column ORG.version
  is '�汾��';
comment on column ORG.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column ORG.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column ORG.bus_date
  is 'ҵ��ʱ��';
comment on column ORG.exa_remarks
  is '������ע';

prompt
prompt Creating table ORGANIZATION
prompt ===========================
prompt
create table ORGANIZATION
(
  parentid     VARCHAR2(30) not null,
  codeitemdesc VARCHAR2(30) not null,
  start_date   VARCHAR2(30),
  end_date     INTEGER,
  codeitemid   VARCHAR2(30)
)
;
comment on column ORGANIZATION.parentid
  is '�ϼ���֯����';
comment on column ORGANIZATION.codeitemdesc
  is '��֯��������';
comment on column ORGANIZATION.start_date
  is '��Чʱ��';
comment on column ORGANIZATION.end_date
  is 'ʧЧʱ��';
comment on column ORGANIZATION.codeitemid
  is '��֯/���ű���';
alter table ORGANIZATION
  add constraint ORGANIZATION_PK primary key (PARENTID);

prompt
prompt Creating table ORG_CONTACTINFO
prompt ==============================
prompt
create table ORG_CONTACTINFO
(
  id             NUMBER,
  sid            NUMBER,
  orgid          NUMBER,
  code           VARCHAR2(255),
  postaladdress  VARCHAR2(255),
  zipcode        VARCHAR2(255),
  phonenumber    VARCHAR2(255),
  faxno          VARCHAR2(255),
  cablenumber    VARCHAR2(255),
  homepage       VARCHAR2(255),
  brief          VARCHAR2(255),
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
comment on table ORG_CONTACTINFO
  is '��ϵ����';
comment on column ORG_CONTACTINFO.id
  is 'ID';
comment on column ORG_CONTACTINFO.sid
  is 'ԭϵͳID';
comment on column ORG_CONTACTINFO.orgid
  is 'OrgID';
comment on column ORG_CONTACTINFO.code
  is '��֯����';
comment on column ORG_CONTACTINFO.postaladdress
  is 'ͨѶ��ַ';
comment on column ORG_CONTACTINFO.zipcode
  is '��������';
comment on column ORG_CONTACTINFO.phonenumber
  is '�绰����';
comment on column ORG_CONTACTINFO.faxno
  is '�������';
comment on column ORG_CONTACTINFO.cablenumber
  is '�籨����';
comment on column ORG_CONTACTINFO.homepage
  is '��˾��ҳ';
comment on column ORG_CONTACTINFO.brief
  is '��˾���';
comment on column ORG_CONTACTINFO.description
  is '��������';
comment on column ORG_CONTACTINFO.creator_id
  is '������id';
comment on column ORG_CONTACTINFO.creator
  is '������';
comment on column ORG_CONTACTINFO.create_date
  is '��������';
comment on column ORG_CONTACTINFO.modifiedby
  is '�޸���';
comment on column ORG_CONTACTINFO.modifiedby_id
  is '�޸���id';
comment on column ORG_CONTACTINFO.modified_date
  is '�޸�����';
comment on column ORG_CONTACTINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column ORG_CONTACTINFO.version
  is '�汾��';
comment on column ORG_CONTACTINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column ORG_CONTACTINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column ORG_CONTACTINFO.bus_date
  is 'ҵ��ʱ��';
comment on column ORG_CONTACTINFO.exa_remarks
  is '������ע';

prompt
prompt Creating table ORG_EMP
prompt ======================
prompt
create table ORG_EMP
(
  id             NUMBER,
  sid            NUMBER,
  orgid          NUMBER,
  code           VARCHAR2(255),
  inside         VARCHAR2(255),
  outside        VARCHAR2(255),
  independent    VARCHAR2(255),
  supervisor     VARCHAR2(255),
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
comment on table ORG_EMP
  is '��Ա����';
comment on column ORG_EMP.id
  is 'ID';
comment on column ORG_EMP.sid
  is 'ԭϵͳID';
comment on column ORG_EMP.orgid
  is '��֯id';
comment on column ORG_EMP.code
  is '��֯����';
comment on column ORG_EMP.inside
  is '���£��ڲ���Ա��';
comment on column ORG_EMP.outside
  is '���£��ⲿ��Ա��';
comment on column ORG_EMP.independent
  is '������������';
comment on column ORG_EMP.supervisor
  is '���£��ڲ���Ա��';
comment on column ORG_EMP.description
  is '��������';
comment on column ORG_EMP.creator_id
  is '������id';
comment on column ORG_EMP.creator
  is '������';
comment on column ORG_EMP.create_date
  is '��������';
comment on column ORG_EMP.modifiedby
  is '�޸���';
comment on column ORG_EMP.modifiedby_id
  is '�޸���id';
comment on column ORG_EMP.modified_date
  is '�޸�����';
comment on column ORG_EMP.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column ORG_EMP.version
  is '�汾��';
comment on column ORG_EMP.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column ORG_EMP.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column ORG_EMP.bus_date
  is 'ҵ��ʱ��';
comment on column ORG_EMP.exa_remarks
  is '������ע';

prompt
prompt Creating table ORG_MANAGEMENTINFO
prompt =================================
prompt
create table ORG_MANAGEMENTINFO
(
  id                      NUMBER,
  sid                     NUMBER,
  origid                  NUMBER,
  code                    VARCHAR2(255),
  corporateinterest       VARCHAR2(255),
  corporateinteresttypeid NUMBER,
  corporateinteresttype   VARCHAR2(255),
  rightproportion         NUMBER,
  shareholdingratio       NUMBER,
  amountcontribution      NUMBER,
  accountingmethodid      NUMBER,
  accountingmethod        VARCHAR2(255),
  begindate               DATE,
  enddate                 DATE,
  registeredcapital       NUMBER,
  paidupcapital           NUMBER,
  description             VARCHAR2(255),
  creator_id              VARCHAR2(120),
  creator                 VARCHAR2(120),
  create_date             DATE,
  modifiedby              VARCHAR2(120),
  modifiedby_id           VARCHAR2(120),
  modified_date           DATE,
  version_status          NUMBER,
  version                 NUMBER,
  latestversion           NUMBER,
  approvalstae            NUMBER,
  bus_date                DATE,
  exa_remarks             VARCHAR2(500)
)
;
comment on table ORG_MANAGEMENTINFO
  is '��Ӫ����';
comment on column ORG_MANAGEMENTINFO.id
  is 'ID';
comment on column ORG_MANAGEMENTINFO.sid
  is 'ԭϵͳID';
comment on column ORG_MANAGEMENTINFO.origid
  is 'OrigID';
comment on column ORG_MANAGEMENTINFO.code
  is '��֯����';
comment on column ORG_MANAGEMENTINFO.corporateinterest
  is 'Ȩ�湫˾';
comment on column ORG_MANAGEMENTINFO.corporateinteresttypeid
  is 'Ȩ�湫˾����ID';
comment on column ORG_MANAGEMENTINFO.corporateinteresttype
  is 'Ȩ�湫˾����';
comment on column ORG_MANAGEMENTINFO.rightproportion
  is 'Ȩ�����';
comment on column ORG_MANAGEMENTINFO.shareholdingratio
  is '�ֹɱ���';
comment on column ORG_MANAGEMENTINFO.amountcontribution
  is '�ܳ��ʶ�';
comment on column ORG_MANAGEMENTINFO.accountingmethodid
  is '���㷽��ID';
comment on column ORG_MANAGEMENTINFO.accountingmethod
  is '���㷽��';
comment on column ORG_MANAGEMENTINFO.begindate
  is '��ʼʱ��';
comment on column ORG_MANAGEMENTINFO.enddate
  is '����ʱ��';
comment on column ORG_MANAGEMENTINFO.registeredcapital
  is 'ע���ʱ�';
comment on column ORG_MANAGEMENTINFO.paidupcapital
  is 'ʵ���ʱ�';
comment on column ORG_MANAGEMENTINFO.description
  is '��������';
comment on column ORG_MANAGEMENTINFO.creator_id
  is '������id';
comment on column ORG_MANAGEMENTINFO.creator
  is '������';
comment on column ORG_MANAGEMENTINFO.create_date
  is '��������';
comment on column ORG_MANAGEMENTINFO.modifiedby
  is '�޸���';
comment on column ORG_MANAGEMENTINFO.modifiedby_id
  is '�޸���id';
comment on column ORG_MANAGEMENTINFO.modified_date
  is '�޸�����';
comment on column ORG_MANAGEMENTINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column ORG_MANAGEMENTINFO.version
  is '�汾��';
comment on column ORG_MANAGEMENTINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column ORG_MANAGEMENTINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column ORG_MANAGEMENTINFO.bus_date
  is 'ҵ��ʱ��';
comment on column ORG_MANAGEMENTINFO.exa_remarks
  is '������ע';

prompt
prompt Creating table PLN_PCATTYPE
prompt ===========================
prompt
create table PLN_PCATTYPE
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
  pln_create_date      DATE,
  create_user          VARCHAR2(255),
  delete_session_id    INTEGER,
  delete_date          DATE,
  p3_flag              INTEGER,
  p3_proj_catg_type_id INTEGER,
  description          VARCHAR2(255),
  creator_id           VARCHAR2(120),
  creator              VARCHAR2(120),
  create_date          DATE,
  modifiedby           VARCHAR2(120),
  modifiedby_id        VARCHAR2(120),
  modified_date        DATE,
  version_status       NUMBER,
  version              NUMBER,
  latestversion        NUMBER,
  approvalstae         NUMBER,
  bus_date             DATE,
  exa_remarks          VARCHAR2(500),
  src_entity           VARCHAR2(255)
)
;
comment on table PLN_PCATTYPE
  is '��Ŀ����������';
comment on column PLN_PCATTYPE.proj_catg_type_id
  is '����������id';
comment on column PLN_PCATTYPE.seq_num
  is '����';
comment on column PLN_PCATTYPE.proj_catg_short_len
  is '��ֵ����';
comment on column PLN_PCATTYPE.proj_catg_type
  is '����������';
comment on column PLN_PCATTYPE.super_flag
  is '������';
comment on column PLN_PCATTYPE.proj_catg_type_wt
  is '����������Ȩ��';
comment on column PLN_PCATTYPE.max_proj_catg_wt
  is '������������Ȩ��';
comment on column PLN_PCATTYPE.update_date
  is '����ʱ��';
comment on column PLN_PCATTYPE.update_user
  is '�����û�';
comment on column PLN_PCATTYPE.pln_create_date
  is '����ʱ��';
comment on column PLN_PCATTYPE.create_user
  is '�����û�';
comment on column PLN_PCATTYPE.delete_session_id
  is 'ɾ��id';
comment on column PLN_PCATTYPE.delete_date
  is 'ɾ��ʱ��';
comment on column PLN_PCATTYPE.p3_flag
  is '�Ƿ�Ϊp3����ķ�����';
comment on column PLN_PCATTYPE.p3_proj_catg_type_id
  is 'p3����������id';
comment on column PLN_PCATTYPE.description
  is '��������';
comment on column PLN_PCATTYPE.creator_id
  is '������id';
comment on column PLN_PCATTYPE.creator
  is '������';
comment on column PLN_PCATTYPE.create_date
  is '��������';
comment on column PLN_PCATTYPE.modifiedby
  is '�޸���';
comment on column PLN_PCATTYPE.modifiedby_id
  is '�޸���id';
comment on column PLN_PCATTYPE.modified_date
  is '�޸�����';
comment on column PLN_PCATTYPE.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column PLN_PCATTYPE.version
  is '�汾��';
comment on column PLN_PCATTYPE.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column PLN_PCATTYPE.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column PLN_PCATTYPE.bus_date
  is 'ҵ������';
comment on column PLN_PCATTYPE.exa_remarks
  is '������ע';

prompt
prompt Creating table PLN_PCATVAL
prompt ==========================
prompt
create table PLN_PCATVAL
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
  pln_create_date      DATE,
  create_user          VARCHAR2(255),
  delete_session_id    INTEGER,
  delete_date          DATE,
  p3_flag              INTEGER,
  p3_proj_catg_id      INTEGER,
  description          VARCHAR2(255),
  creator_id           VARCHAR2(120),
  creator              VARCHAR2(120),
  create_date          DATE,
  modifiedby           VARCHAR2(120),
  modifiedby_id        VARCHAR2(120),
  modified_date        DATE,
  version_status       NUMBER,
  version              NUMBER,
  latestversion        NUMBER,
  approvalstae         NUMBER,
  bus_date             DATE,
  exa_remarks          VARCHAR2(500),
  src_entity           VARCHAR2(255)
)
;
comment on table PLN_PCATVAL
  is '��Ŀ������ֵ';
comment on column PLN_PCATVAL.proj_catg_id
  is '����';
comment on column PLN_PCATVAL.proj_catg_type_id
  is '��Ŀ����������id';
comment on column PLN_PCATVAL.seq_num
  is '����';
comment on column PLN_PCATVAL.proj_catg_short_name
  is '��Ŀ��������ֵ�Ĵ���';
comment on column PLN_PCATVAL.parent_proj_catg_id
  is '��Ŀ�����븸�ڵ�';
comment on column PLN_PCATVAL.proj_catg_name
  is '��Ŀ��������ֵ����';
comment on column PLN_PCATVAL.proj_catg_wt
  is '��Ŀ��������ֵ����';
comment on column PLN_PCATVAL.update_date
  is '����ʱ��';
comment on column PLN_PCATVAL.update_user
  is '�����û�';
comment on column PLN_PCATVAL.pln_create_date
  is '����ʱ��';
comment on column PLN_PCATVAL.create_user
  is '�����û�';
comment on column PLN_PCATVAL.delete_session_id
  is 'ɾ��id';
comment on column PLN_PCATVAL.delete_date
  is 'ɾ��ʱ��';
comment on column PLN_PCATVAL.p3_flag
  is '�Ƿ�Ϊp3�������ֵ';
comment on column PLN_PCATVAL.p3_proj_catg_id
  is '��Ӧp3����ֵid';
comment on column PLN_PCATVAL.description
  is '��������';
comment on column PLN_PCATVAL.creator_id
  is '������id';
comment on column PLN_PCATVAL.creator
  is '������';
comment on column PLN_PCATVAL.create_date
  is '��������';
comment on column PLN_PCATVAL.modifiedby
  is '�޸���';
comment on column PLN_PCATVAL.modifiedby_id
  is '�޸���id';
comment on column PLN_PCATVAL.modified_date
  is '�޸�����';
comment on column PLN_PCATVAL.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column PLN_PCATVAL.version
  is '�汾��';
comment on column PLN_PCATVAL.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column PLN_PCATVAL.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column PLN_PCATVAL.bus_date
  is 'ҵ������';
comment on column PLN_PCATVAL.exa_remarks
  is '������ע';

prompt
prompt Creating table PLN_PROJECT
prompt ==========================
prompt
create table PLN_PROJECT
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
  description              VARCHAR2(255),
  creator_id               VARCHAR2(120),
  creator                  VARCHAR2(120),
  create_date              DATE,
  modifiedby               VARCHAR2(120),
  modifiedby_id            VARCHAR2(120),
  modified_date            DATE,
  version_status           NUMBER,
  version                  NUMBER,
  latestversion            NUMBER,
  approvalstae             NUMBER,
  bus_date                 DATE,
  exa_remarks              VARCHAR2(500),
  src_entity               VARCHAR2(255)
)
;
comment on table PLN_PROJECT
  is '��Ŀ��';
comment on column PLN_PROJECT.project_id
  is '��Ŀ��';
comment on column PLN_PROJECT.project_shortname
  is '��Ŀ����';
comment on column PLN_PROJECT.project_name
  is '��Ŀ����';
comment on column PLN_PROJECT.parent_id
  is '��Ŀ���ڵ�id';
comment on column PLN_PROJECT.remark
  is '��Ŀ��ע';
comment on column PLN_PROJECT.user_sid
  is '�û�id';
comment on column PLN_PROJECT.project_type
  is '��Ŀ����';
comment on column PLN_PROJECT.est_wt
  is 'Ȩ��';
comment on column PLN_PROJECT.obs_sid
  is 'Ȩ��id';
comment on column PLN_PROJECT.haschild
  is '�Ƿ����ӽڵ�';
comment on column PLN_PROJECT.p3ec
  is '�Ƿ�Ϊp3������Ŀ';
comment on column PLN_PROJECT.treelevel
  is '���ṹ�ĵڼ���';
comment on column PLN_PROJECT.note
  is '˵��';
comment on column PLN_PROJECT.p3ec_project_id
  is '��Ӧ��p3��Ŀ�ţ�����p3������Ŀ����ֵΪnull';
comment on column PLN_PROJECT.contract_id
  is 'ʩ����ͬ������';
comment on column PLN_PROJECT.displayid
  is '��ʾ';
comment on column PLN_PROJECT.discolor
  is 'չʾ��ɫ';
comment on column PLN_PROJECT.project_type_sid
  is '��Ŀ����id';
comment on column PLN_PROJECT.project_status_sid
  is '��Ŀ״̬id';
comment on column PLN_PROJECT.project_address
  is '��Ŀ��������λ��';
comment on column PLN_PROJECT.target_start_date
  is '������ʼʱ��';
comment on column PLN_PROJECT.target_end_date
  is '�������ʱ��';
comment on column PLN_PROJECT.act_start_date
  is 'ʵ�ʿ�ʼʱ��';
comment on column PLN_PROJECT.act_end_date
  is 'ʱ�����ʱ��';
comment on column PLN_PROJECT.data_date
  is '��������';
comment on column PLN_PROJECT.compute_end_date
  is '�������';
comment on column PLN_PROJECT.expect_start_date
  is '������ʼ';
comment on column PLN_PROJECT.expect_end_date
  is '�������';
comment on column PLN_PROJECT.uncontract_id
  is '�����ͬ��Ͷ�ʣ�����';
comment on column PLN_PROJECT.complete_pct
  is '��ɱȰٷֱ�';
comment on column PLN_PROJECT.allow_diy_web
  is '�Ƿ���Զ�������';
comment on column PLN_PROJECT.program_id
  is '��ĿȺid';
comment on column PLN_PROJECT.risk_level
  is '���յȼ�';
comment on column PLN_PROJECT.proj_url
  is '��Ŀ��վ��ַ';
comment on column PLN_PROJECT.def_duration_type
  is 'Ĭ�Ϲ������ͣ�ͬp3ec�������ַ����Ժ󻻳�������';
comment on column PLN_PROJECT.def_complete_pct_type
  is 'Ĭ����ɰٷֱ�����';
comment on column PLN_PROJECT.def_task_type
  is 'Ĭ����ҵ����';
comment on column PLN_PROJECT.acct_id
  is '���ÿ�Ŀ���';
comment on column PLN_PROJECT.clndr_id
  is '�������';
comment on column PLN_PROJECT.week_id
  is '����id';
comment on column PLN_PROJECT.update_date
  is '��������';
comment on column PLN_PROJECT.critical_drtn_hr_cnt
  is '�ؼ�·��Сʱ';
comment on column PLN_PROJECT.critical_path_type
  is '�ؼ�·������';
comment on column PLN_PROJECT.start_date
  is '��ʼ����';
comment on column PLN_PROJECT.end_date
  is '��������';
comment on column PLN_PROJECT.investplanstartdate
  is 'Ͷ�ʼƻ���ʼ����';
comment on column PLN_PROJECT.investplanenddate
  is 'Ͷ�ʼƻ���������';
comment on column PLN_PROJECT.project_level
  is '��Ŀ����';
comment on column PLN_PROJECT.parent_proj_id
  is '������Ŀid';
comment on column PLN_PROJECT.manageruserid
  is 'δʹ��';
comment on column PLN_PROJECT.managerid
  is 'δʹ��';
comment on column PLN_PROJECT.managername
  is 'δʹ��';
comment on column PLN_PROJECT.flockstatus
  is 'δʹ��';
comment on column PLN_PROJECT.acreage
  is 'δʹ��';
comment on column PLN_PROJECT.infactacreage
  is 'ʵ�����';
comment on column PLN_PROJECT.content
  is '��Ŀ����';
comment on column PLN_PROJECT.scale
  is '�����ģ';
comment on column PLN_PROJECT.totalinvest
  is '��Ͷ��';
comment on column PLN_PROJECT.thisyearinvest
  is '����Ͷ��';
comment on column PLN_PROJECT.dikuai_code
  is '�ؿ����';
comment on column PLN_PROJECT.shortcode
  is '��Ŀ��д';
comment on column PLN_PROJECT.assess_projectid
  is '������Ŀid';
comment on column PLN_PROJECT.acreaprice
  is '�ؿ��С';
comment on column PLN_PROJECT.plan_state
  is '�ƻ�״̬';
comment on column PLN_PROJECT.ycoordinate
  is '��Ŀ����_Y��';
comment on column PLN_PROJECT.xcoordinate
  is '��Ŀ����_X��';
comment on column PLN_PROJECT.description
  is '��������';
comment on column PLN_PROJECT.creator_id
  is '������id';
comment on column PLN_PROJECT.creator
  is '������';
comment on column PLN_PROJECT.create_date
  is '��������';
comment on column PLN_PROJECT.modifiedby
  is '�޸���';
comment on column PLN_PROJECT.modifiedby_id
  is '�޸���id';
comment on column PLN_PROJECT.modified_date
  is '�޸�����';
comment on column PLN_PROJECT.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column PLN_PROJECT.version
  is '�汾��';
comment on column PLN_PROJECT.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column PLN_PROJECT.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column PLN_PROJECT.bus_date
  is 'ҵ������';
comment on column PLN_PROJECT.exa_remarks
  is '������ע';

prompt
prompt Creating table PLN_PROJPCAT
prompt ===========================
prompt
create table PLN_PROJPCAT
(
  proj_id           INTEGER not null,
  proj_catg_type_id INTEGER not null,
  proj_catg_id      INTEGER not null,
  update_date       DATE,
  update_user       VARCHAR2(255),
  pln_create_date   DATE,
  create_user       VARCHAR2(255),
  delete_session_id INTEGER,
  delete_date       DATE,
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
  src_entity        VARCHAR2(255)
)
;
comment on table PLN_PROJPCAT
  is '��Ŀ����Ŀ�������ϵ��';
comment on column PLN_PROJPCAT.proj_id
  is '��Ŀ��';
comment on column PLN_PROJPCAT.proj_catg_type_id
  is '��Ŀ���������ͺ�';
comment on column PLN_PROJPCAT.proj_catg_id
  is '��Ŀ�������';
comment on column PLN_PROJPCAT.update_date
  is '��������';
comment on column PLN_PROJPCAT.update_user
  is '�����û�';
comment on column PLN_PROJPCAT.pln_create_date
  is '��������';
comment on column PLN_PROJPCAT.create_user
  is '�����û�';
comment on column PLN_PROJPCAT.delete_session_id
  is 'ɾ��id';
comment on column PLN_PROJPCAT.delete_date
  is 'ɾ������';
comment on column PLN_PROJPCAT.description
  is '��������';
comment on column PLN_PROJPCAT.creator_id
  is '������id';
comment on column PLN_PROJPCAT.creator
  is '������';
comment on column PLN_PROJPCAT.create_date
  is '��������';
comment on column PLN_PROJPCAT.modifiedby
  is '�޸���';
comment on column PLN_PROJPCAT.modifiedby_id
  is '�޸���id';
comment on column PLN_PROJPCAT.modified_date
  is '�޸�����';
comment on column PLN_PROJPCAT.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column PLN_PROJPCAT.version
  is '�汾��';
comment on column PLN_PROJPCAT.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column PLN_PROJPCAT.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column PLN_PROJPCAT.bus_date
  is 'ҵ������';
comment on column PLN_PROJPCAT.exa_remarks
  is '������ע';

prompt
prompt Creating table SUPP_CERTIFICATION
prompt =================================
prompt
create table SUPP_CERTIFICATION
(
  id                       NUMBER,
  sid                      NUMBER,
  suppid                   NUMBER,
  suppcode                 VARCHAR2(255),
  suppcertificationid      NUMBER,
  suppcertification        VARCHAR2(255),
  suppothercertificationid NUMBER,
  suppothercertification   VARCHAR2(255),
  description              VARCHAR2(255),
  creator_id               VARCHAR2(120),
  creator                  VARCHAR2(120),
  create_date              DATE,
  modifiedby               VARCHAR2(120),
  modifiedby_id            VARCHAR2(120),
  modified_date            DATE,
  version_status           NUMBER,
  version                  NUMBER,
  latestversion            NUMBER,
  approvalstae             NUMBER,
  bus_date                 DATE,
  exa_remarks              VARCHAR2(500)
)
;
comment on table SUPP_CERTIFICATION
  is '���ʱ�';
comment on column SUPP_CERTIFICATION.id
  is 'ID';
comment on column SUPP_CERTIFICATION.sid
  is 'ԭϵͳID';
comment on column SUPP_CERTIFICATION.suppid
  is 'SuppID';
comment on column SUPP_CERTIFICATION.suppcode
  is '��Ӧ�̴���';
comment on column SUPP_CERTIFICATION.suppcertificationid
  is '��Ӧ������ID';
comment on column SUPP_CERTIFICATION.suppcertification
  is '��Ӧ������';
comment on column SUPP_CERTIFICATION.suppothercertificationid
  is '��Ӧ������רҵ����ID';
comment on column SUPP_CERTIFICATION.suppothercertification
  is '��Ӧ������רҵ����';
comment on column SUPP_CERTIFICATION.description
  is '��������';
comment on column SUPP_CERTIFICATION.creator_id
  is '������id';
comment on column SUPP_CERTIFICATION.creator
  is '������';
comment on column SUPP_CERTIFICATION.create_date
  is '��������';
comment on column SUPP_CERTIFICATION.modifiedby
  is '�޸���';
comment on column SUPP_CERTIFICATION.modifiedby_id
  is '�޸���id';
comment on column SUPP_CERTIFICATION.modified_date
  is '�޸�����';
comment on column SUPP_CERTIFICATION.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column SUPP_CERTIFICATION.version
  is '�汾��';
comment on column SUPP_CERTIFICATION.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column SUPP_CERTIFICATION.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column SUPP_CERTIFICATION.bus_date
  is 'ҵ��ʱ��';
comment on column SUPP_CERTIFICATION.exa_remarks
  is '������ע';

prompt
prompt Creating table SUPP_CONTACTINFO
prompt ===============================
prompt
create table SUPP_CONTACTINFO
(
  id             NUMBER,
  sid            NUMBER,
  suppid         NUMBER,
  suppcode       VARCHAR2(255),
  code           VARCHAR2(255),
  name           VARCHAR2(255),
  cardcode       VARCHAR2(255),
  sex            VARCHAR2(255),
  job            VARCHAR2(255),
  title          VARCHAR2(255),
  dept           VARCHAR2(255),
  call           VARCHAR2(255),
  role           VARCHAR2(255),
  phone          VARCHAR2(255),
  fax            VARCHAR2(255),
  email          VARCHAR2(255),
  address        VARCHAR2(255),
  postcode       VARCHAR2(255),
  mobile         VARCHAR2(255),
  homecall       VARCHAR2(255),
  photo          VARCHAR2(255),
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
comment on table SUPP_CONTACTINFO
  is '��ϵ�����Ա�';
comment on column SUPP_CONTACTINFO.id
  is 'ID';
comment on column SUPP_CONTACTINFO.sid
  is 'ԭϵͳID';
comment on column SUPP_CONTACTINFO.suppid
  is 'SuppID';
comment on column SUPP_CONTACTINFO.suppcode
  is '��Ӧ�̴���';
comment on column SUPP_CONTACTINFO.code
  is '��Ա���';
comment on column SUPP_CONTACTINFO.name
  is '����';
comment on column SUPP_CONTACTINFO.cardcode
  is '����';
comment on column SUPP_CONTACTINFO.sex
  is '�Ա�';
comment on column SUPP_CONTACTINFO.job
  is 'ְ��';
comment on column SUPP_CONTACTINFO.title
  is 'ְ��';
comment on column SUPP_CONTACTINFO.dept
  is '������Ϣ';
comment on column SUPP_CONTACTINFO.call
  is '�ƺ�';
comment on column SUPP_CONTACTINFO.role
  is '��ɫ';
comment on column SUPP_CONTACTINFO.phone
  is '�칫�ҵ绰';
comment on column SUPP_CONTACTINFO.fax
  is '����';
comment on column SUPP_CONTACTINFO.email
  is '�����ʼ�';
comment on column SUPP_CONTACTINFO.address
  is '��ַ';
comment on column SUPP_CONTACTINFO.postcode
  is '�ʱ�';
comment on column SUPP_CONTACTINFO.mobile
  is '�ƶ��绰';
comment on column SUPP_CONTACTINFO.homecall
  is '��ͥ�绰';
comment on column SUPP_CONTACTINFO.photo
  is '��Ƭ';
comment on column SUPP_CONTACTINFO.description
  is '��������';
comment on column SUPP_CONTACTINFO.creator_id
  is '������id';
comment on column SUPP_CONTACTINFO.creator
  is '������';
comment on column SUPP_CONTACTINFO.create_date
  is '��������';
comment on column SUPP_CONTACTINFO.modifiedby
  is '�޸���';
comment on column SUPP_CONTACTINFO.modifiedby_id
  is '�޸���id';
comment on column SUPP_CONTACTINFO.modified_date
  is '�޸�����';
comment on column SUPP_CONTACTINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column SUPP_CONTACTINFO.version
  is '�汾��';
comment on column SUPP_CONTACTINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column SUPP_CONTACTINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column SUPP_CONTACTINFO.bus_date
  is 'ҵ��ʱ��';
comment on column SUPP_CONTACTINFO.exa_remarks
  is '������ע';

prompt
prompt Creating table SUPP_INFO
prompt ========================
prompt
create table SUPP_INFO
(
  id               NUMBER,
  sid              NUMBER,
  suppcode         VARCHAR2(255),
  suppname         VARCHAR2(255),
  unitroleid       NUMBER,
  unitrole         VARCHAR2(255),
  legalperson      VARCHAR2(255),
  unitnatureid     NUMBER,
  unitnature       VARCHAR2(255),
  provincecity     VARCHAR2(255),
  regeditaddress   VARCHAR2(255),
  bank             VARCHAR2(255),
  bankaccount      VARCHAR2(255),
  bussinesslicence VARCHAR2(255),
  whichindustry    VARCHAR2(255),
  orgcode          VARCHAR2(255),
  areataxnum       VARCHAR2(255),
  nationtaxnum     VARCHAR2(255),
  address          VARCHAR2(255),
  postalcode       VARCHAR2(255),
  phone            VARCHAR2(255),
  fax              VARCHAR2(255),
  email            VARCHAR2(255),
  homepage         VARCHAR2(255),
  supp_description VARCHAR2(255),
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
  bus_date         DATE,
  exa_remarks      VARCHAR2(500)
)
;
comment on table SUPP_INFO
  is '��Ӧ�̻�����Ϣ��';
comment on column SUPP_INFO.id
  is 'ID';
comment on column SUPP_INFO.sid
  is 'ԭϵͳID';
comment on column SUPP_INFO.suppcode
  is '��Ӧ�̴���';
comment on column SUPP_INFO.suppname
  is '��Ӧ������';
comment on column SUPP_INFO.unitroleid
  is '��λ��ɫID';
comment on column SUPP_INFO.unitrole
  is '��λ��ɫ';
comment on column SUPP_INFO.legalperson
  is '���˴���';
comment on column SUPP_INFO.unitnatureid
  is '��λ����ID';
comment on column SUPP_INFO.unitnature
  is '��λ����';
comment on column SUPP_INFO.provincecity
  is '����ʡ��';
comment on column SUPP_INFO.regeditaddress
  is 'ע���ַ';
comment on column SUPP_INFO.bank
  is '��������';
comment on column SUPP_INFO.bankaccount
  is '�����˺�';
comment on column SUPP_INFO.bussinesslicence
  is 'Ӫҵִ�պ�';
comment on column SUPP_INFO.whichindustry
  is '������ҵ';
comment on column SUPP_INFO.orgcode
  is '��֯��������֤';
comment on column SUPP_INFO.areataxnum
  is '��˰�ǼǺ�';
comment on column SUPP_INFO.nationtaxnum
  is '��˰�ǼǺ�';
comment on column SUPP_INFO.address
  is 'ͨѶ��ַ';
comment on column SUPP_INFO.postalcode
  is '��������';
comment on column SUPP_INFO.phone
  is '�绰����';
comment on column SUPP_INFO.fax
  is '�������';
comment on column SUPP_INFO.email
  is '�����ʼ�';
comment on column SUPP_INFO.homepage
  is '��˾��ҳ';
comment on column SUPP_INFO.supp_description
  is '��˾���';
comment on column SUPP_INFO.description
  is '��������';
comment on column SUPP_INFO.creator_id
  is '������id';
comment on column SUPP_INFO.creator
  is '������';
comment on column SUPP_INFO.create_date
  is '��������';
comment on column SUPP_INFO.modifiedby
  is '�޸���';
comment on column SUPP_INFO.modifiedby_id
  is '�޸���id';
comment on column SUPP_INFO.modified_date
  is '�޸�����';
comment on column SUPP_INFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column SUPP_INFO.version
  is '�汾��';
comment on column SUPP_INFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column SUPP_INFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column SUPP_INFO.bus_date
  is 'ҵ��ʱ��';
comment on column SUPP_INFO.exa_remarks
  is '������ע';

prompt
prompt Creating table SUPP_MANAGEMENTINFO
prompt ==================================
prompt
create table SUPP_MANAGEMENTINFO
(
  id                 NUMBER,
  sid                NUMBER,
  suppid             NUMBER,
  suppcode           VARCHAR2(255),
  statusid           NUMBER,
  status             VARCHAR2(255),
  ispassisoid        NUMBER,
  ispassiso          VARCHAR2(255),
  unitcreditid       NUMBER,
  unitcredit         VARCHAR2(255),
  regeditcapital     NUMBER,
  assetscapital      NUMBER,
  flowcapital        NUMBER,
  yearsellamount     NUMBER,
  fatorynum          NUMBER,
  fatoryaddress      VARCHAR2(255),
  fatoryphone        VARCHAR2(255),
  prjfax             VARCHAR2(255),
  employeenum        NUMBER,
  technicalstaffnum  NUMBER,
  managementstaffnum NUMBER,
  description        VARCHAR2(255),
  creator_id         VARCHAR2(120),
  creator            VARCHAR2(120),
  create_date        DATE,
  modifiedby         VARCHAR2(120),
  modifiedby_id      VARCHAR2(120),
  modified_date      DATE,
  version_status     NUMBER,
  version            NUMBER,
  latestversion      NUMBER,
  approvalstae       NUMBER,
  bus_date           DATE,
  exa_remarks        VARCHAR2(500)
)
;
comment on table SUPP_MANAGEMENTINFO
  is '��Ӫ���Ա�';
comment on column SUPP_MANAGEMENTINFO.id
  is 'ID';
comment on column SUPP_MANAGEMENTINFO.sid
  is 'ԭϵͳID';
comment on column SUPP_MANAGEMENTINFO.suppid
  is 'SuppID';
comment on column SUPP_MANAGEMENTINFO.suppcode
  is '��Ӧ�̴���';
comment on column SUPP_MANAGEMENTINFO.statusid
  is '��Ӧ��״̬/���״̬ID';
comment on column SUPP_MANAGEMENTINFO.status
  is '��Ӧ��״̬/���״̬';
comment on column SUPP_MANAGEMENTINFO.ispassisoid
  is '�Ƿ�ͨ��ISOID';
comment on column SUPP_MANAGEMENTINFO.ispassiso
  is '�Ƿ�ͨ��ISO';
comment on column SUPP_MANAGEMENTINFO.unitcreditid
  is '��λ����ID';
comment on column SUPP_MANAGEMENTINFO.unitcredit
  is '��λ����';
comment on column SUPP_MANAGEMENTINFO.regeditcapital
  is 'ע���ʱ�';
comment on column SUPP_MANAGEMENTINFO.assetscapital
  is '�̶��ʲ�';
comment on column SUPP_MANAGEMENTINFO.flowcapital
  is '�����ʽ�';
comment on column SUPP_MANAGEMENTINFO.yearsellamount
  is '�����۶�';
comment on column SUPP_MANAGEMENTINFO.fatorynum
  is '��������';
comment on column SUPP_MANAGEMENTINFO.fatoryaddress
  is '������ַ';
comment on column SUPP_MANAGEMENTINFO.fatoryphone
  is '�����绰';
comment on column SUPP_MANAGEMENTINFO.prjfax
  is '���̴���';
comment on column SUPP_MANAGEMENTINFO.employeenum
  is '��˾Ա������';
comment on column SUPP_MANAGEMENTINFO.technicalstaffnum
  is '������Ա����';
comment on column SUPP_MANAGEMENTINFO.managementstaffnum
  is '������Ա����';
comment on column SUPP_MANAGEMENTINFO.description
  is '��������';
comment on column SUPP_MANAGEMENTINFO.creator_id
  is '������id';
comment on column SUPP_MANAGEMENTINFO.creator
  is '������';
comment on column SUPP_MANAGEMENTINFO.create_date
  is '��������';
comment on column SUPP_MANAGEMENTINFO.modifiedby
  is '�޸���';
comment on column SUPP_MANAGEMENTINFO.modifiedby_id
  is '�޸���id';
comment on column SUPP_MANAGEMENTINFO.modified_date
  is '�޸�����';
comment on column SUPP_MANAGEMENTINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column SUPP_MANAGEMENTINFO.version
  is '�汾��';
comment on column SUPP_MANAGEMENTINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column SUPP_MANAGEMENTINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column SUPP_MANAGEMENTINFO.bus_date
  is 'ҵ��ʱ��';
comment on column SUPP_MANAGEMENTINFO.exa_remarks
  is '������ע';

prompt
prompt Creating table SUPP_PRODUCTINFO
prompt ===============================
prompt
create table SUPP_PRODUCTINFO
(
  id              NUMBER,
  sid             NUMBER,
  suppid          NUMBER,
  suppcode        VARCHAR2(255),
  productcode     VARCHAR2(255),
  productname     VARCHAR2(255),
  specification   VARCHAR2(255),
  model           VARCHAR2(255),
  budgetprice     NUMBER,
  purchaseadvance NUMBER,
  arrivaladvance  NUMBER,
  purchasecycle   NUMBER,
  feetype         VARCHAR2(255),
  description     VARCHAR2(255),
  creator_id      VARCHAR2(120),
  creator         VARCHAR2(120),
  create_date     DATE,
  modifiedby      VARCHAR2(120),
  modifiedby_id   VARCHAR2(120),
  modified_date   DATE,
  version_status  NUMBER,
  version         NUMBER,
  latestversion   NUMBER,
  approvalstae    NUMBER,
  bus_date        DATE,
  exa_remarks     VARCHAR2(500)
)
;
comment on table SUPP_PRODUCTINFO
  is '��Ʒ���Ա�';
comment on column SUPP_PRODUCTINFO.id
  is 'ID';
comment on column SUPP_PRODUCTINFO.sid
  is 'ԭϵͳID';
comment on column SUPP_PRODUCTINFO.suppid
  is 'SuppID';
comment on column SUPP_PRODUCTINFO.suppcode
  is '��Ӧ�̴���';
comment on column SUPP_PRODUCTINFO.productcode
  is '��Ʒ����';
comment on column SUPP_PRODUCTINFO.productname
  is '��Ʒ����';
comment on column SUPP_PRODUCTINFO.specification
  is '���';
comment on column SUPP_PRODUCTINFO.model
  is '�ͺ�';
comment on column SUPP_PRODUCTINFO.budgetprice
  is 'Ԥ��۸�';
comment on column SUPP_PRODUCTINFO.purchaseadvance
  is '�ɹ���ǰ��';
comment on column SUPP_PRODUCTINFO.arrivaladvance
  is '������ǰ��';
comment on column SUPP_PRODUCTINFO.purchasecycle
  is '�ɹ�����';
comment on column SUPP_PRODUCTINFO.feetype
  is '�������';
comment on column SUPP_PRODUCTINFO.description
  is '��������';
comment on column SUPP_PRODUCTINFO.creator_id
  is '������id';
comment on column SUPP_PRODUCTINFO.creator
  is '������';
comment on column SUPP_PRODUCTINFO.create_date
  is '��������';
comment on column SUPP_PRODUCTINFO.modifiedby
  is '�޸���';
comment on column SUPP_PRODUCTINFO.modifiedby_id
  is '�޸���id';
comment on column SUPP_PRODUCTINFO.modified_date
  is '�޸�����';
comment on column SUPP_PRODUCTINFO.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column SUPP_PRODUCTINFO.version
  is '�汾��';
comment on column SUPP_PRODUCTINFO.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column SUPP_PRODUCTINFO.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column SUPP_PRODUCTINFO.bus_date
  is 'ҵ��ʱ��';
comment on column SUPP_PRODUCTINFO.exa_remarks
  is '������ע';

prompt
prompt Creating table SUPP_TOUCHRECORD
prompt ===============================
prompt
create table SUPP_TOUCHRECORD
(
  id                    NUMBER,
  sid                   NUMBER,
  suppid                NUMBER,
  suppcode              VARCHAR2(255),
  contcode              VARCHAR2(255),
  contname              VARCHAR2(255),
  performanceevaluation VARCHAR2(255),
  biddate               DATE,
  biddingresultsid      NUMBER,
  biddingresults        VARCHAR2(255),
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
  bus_date              DATE,
  exa_remarks           VARCHAR2(500)
)
;
comment on table SUPP_TOUCHRECORD
  is '�Ӵ���¼��';
comment on column SUPP_TOUCHRECORD.id
  is 'ID';
comment on column SUPP_TOUCHRECORD.sid
  is 'ԭϵͳID';
comment on column SUPP_TOUCHRECORD.suppid
  is 'SuppID';
comment on column SUPP_TOUCHRECORD.suppcode
  is '��Ӧ�̴���';
comment on column SUPP_TOUCHRECORD.contcode
  is '��ͬ���';
comment on column SUPP_TOUCHRECORD.contname
  is '��ͬ����';
comment on column SUPP_TOUCHRECORD.performanceevaluation
  is '��Լ����';
comment on column SUPP_TOUCHRECORD.biddate
  is 'Ӧ������';
comment on column SUPP_TOUCHRECORD.biddingresultsid
  is 'Ӧ����ID';
comment on column SUPP_TOUCHRECORD.biddingresults
  is 'Ӧ����';
comment on column SUPP_TOUCHRECORD.description
  is '��������';
comment on column SUPP_TOUCHRECORD.creator_id
  is '������id';
comment on column SUPP_TOUCHRECORD.creator
  is '������';
comment on column SUPP_TOUCHRECORD.create_date
  is '��������';
comment on column SUPP_TOUCHRECORD.modifiedby
  is '�޸���';
comment on column SUPP_TOUCHRECORD.modifiedby_id
  is '�޸���id';
comment on column SUPP_TOUCHRECORD.modified_date
  is '�޸�����';
comment on column SUPP_TOUCHRECORD.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column SUPP_TOUCHRECORD.version
  is '�汾��';
comment on column SUPP_TOUCHRECORD.latestversion
  is '�Ƿ����°汾��1���ǣ�0����';
comment on column SUPP_TOUCHRECORD.approvalstae
  is '����״̬��0:������;1:  ����ͨ��;2:����δͨ��)';
comment on column SUPP_TOUCHRECORD.bus_date
  is 'ҵ��ʱ��';
comment on column SUPP_TOUCHRECORD.exa_remarks
  is '������ע';


spool off
