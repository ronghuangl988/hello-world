--------------------------------------------
-- Export file for user C##_BIGDATA@ZZMDM --
-- Created by zhy on 2017/10/13, 11:19:41 --
--------------------------------------------

set define off
spool 业务数据.log

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
  is '征地合同表';
comment on column AC_CONT_BUYLANDDETAIL.stockcontid
  is '合同编号';
comment on column AC_CONT_BUYLANDDETAIL.payitemcode
  is '支付项代码';
comment on column AC_CONT_BUYLANDDETAIL.payitemname
  is '支付项名称';
comment on column AC_CONT_BUYLANDDETAIL.contnum
  is '合同数量';
comment on column AC_CONT_BUYLANDDETAIL.contunit
  is '合同单价';
comment on column AC_CONT_BUYLANDDETAIL.contcost
  is '本项费用';
comment on column AC_CONT_BUYLANDDETAIL.contratio
  is '支付系数';
comment on column AC_CONT_BUYLANDDETAIL.processrelation
  is '进度关联';
comment on column AC_CONT_BUYLANDDETAIL.numctrl
  is '数量控制';
comment on column AC_CONT_BUYLANDDETAIL.standard
  is '规格';
comment on column AC_CONT_BUYLANDDETAIL.countingunit
  is '计量单位';
comment on column AC_CONT_BUYLANDDETAIL.valuation
  is '履约评价';
comment on column AC_CONT_BUYLANDDETAIL.areanum
  is '区域编号';
comment on column AC_CONT_BUYLANDDETAIL.landnum
  is '地块编号';
comment on column AC_CONT_BUYLANDDETAIL.area
  is '面积';
comment on column AC_CONT_BUYLANDDETAIL.planpayoff
  is '计划支付金额';
comment on column AC_CONT_BUYLANDDETAIL.landtype
  is '土地类型';
comment on column AC_CONT_BUYLANDDETAIL.payoffitem
  is '支出项目';
comment on column AC_CONT_BUYLANDDETAIL.nowpayoff
  is '本次支出金额';
comment on column AC_CONT_BUYLANDDETAIL.totalpayoff
  is '累计支出金额';
comment on column AC_CONT_BUYLANDDETAIL.edetailid
  is 'EDetailID';
comment on column AC_CONT_BUYLANDDETAIL.approvenum
  is '批准文号';
comment on column AC_CONT_BUYLANDDETAIL.approvedate
  is '批准时间';
comment on column AC_CONT_BUYLANDDETAIL.prjcode
  is '项目编号';
comment on column AC_CONT_BUYLANDDETAIL.prjname
  is '项目名称';
comment on column AC_CONT_BUYLANDDETAIL.ownerunit
  is '业主单位';
comment on column AC_CONT_BUYLANDDETAIL.createrunit
  is '立项单位';
comment on column AC_CONT_BUYLANDDETAIL.payofflimit
  is '支出金额';
comment on column AC_CONT_BUYLANDDETAIL.whichtimes
  is '第_次付款';
comment on column AC_CONT_BUYLANDDETAIL.description
  is '操作描述';
comment on column AC_CONT_BUYLANDDETAIL.creator_id
  is '创建者id';
comment on column AC_CONT_BUYLANDDETAIL.creator
  is '创建者';
comment on column AC_CONT_BUYLANDDETAIL.create_date
  is '创建日期';
comment on column AC_CONT_BUYLANDDETAIL.modifiedby
  is '修改人';
comment on column AC_CONT_BUYLANDDETAIL.modifiedby_id
  is '修改人id';
comment on column AC_CONT_BUYLANDDETAIL.modified_date
  is '修改日期';
comment on column AC_CONT_BUYLANDDETAIL.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_CONT_BUYLANDDETAIL.version
  is '版本号';
comment on column AC_CONT_BUYLANDDETAIL.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_CONT_BUYLANDDETAIL.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_CONT_BUYLANDDETAIL.bus_date
  is '业务日期';
comment on column AC_CONT_BUYLANDDETAIL.exa_remarks
  is '审批备注';
comment on column AC_CONT_BUYLANDDETAIL.src_table
  is '来源实体';
comment on column AC_CONT_BUYLANDDETAIL.src_system
  is '来源系统';
comment on column AC_CONT_BUYLANDDETAIL.sort_id
  is '排序字段';

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
  is '房屋销售合同信息表';
comment on column AC_CONT_HOUSESALEINFO.landlinencename
  is '建设用地规划许可证名称';
comment on column AC_CONT_HOUSESALEINFO.landlinencecode
  is '建设用地规划许可证编号';
comment on column AC_CONT_HOUSESALEINFO.landlinencearea
  is '建设用地规划许可证面积';
comment on column AC_CONT_HOUSESALEINFO.landlinenceunit
  is '建设用地规划许可证发证单位';
comment on column AC_CONT_HOUSESALEINFO.landlinencedate
  is '建设用地规划许可证日期';
comment on column AC_CONT_HOUSESALEINFO.prjplanlinencename
  is '建设工程规划许可证名称';
comment on column AC_CONT_HOUSESALEINFO.prjplanlinencecode
  is '建设工程规划许可证编号';
comment on column AC_CONT_HOUSESALEINFO.prjplanlinencearea
  is '建设工程规划许可证面积';
comment on column AC_CONT_HOUSESALEINFO.prjplanlinenceunit
  is '建设工程规划许可证发证单位';
comment on column AC_CONT_HOUSESALEINFO.prjplanlinencedate
  is '建设工程规划许可证日期';
comment on column AC_CONT_HOUSESALEINFO.prjplanlinenceperiod
  is '建设工程规划许可证年限';
comment on column AC_CONT_HOUSESALEINFO.prjconstlinence
  is '建筑工程施工许可证';
comment on column AC_CONT_HOUSESALEINFO.prjconstlinencecunit
  is '建筑工程施工发证单位';
comment on column AC_CONT_HOUSESALEINFO.prjconstlinencedate
  is '建筑工程施工发证日期';
comment on column AC_CONT_HOUSESALEINFO.prjconstlinenceunit
  is '建筑工程施工单位';
comment on column AC_CONT_HOUSESALEINFO.landusecertificate
  is '土地使用证';
comment on column AC_CONT_HOUSESALEINFO.landuseperiod
  is '土地使用年限';
comment on column AC_CONT_HOUSESALEINFO.landcertificatenum
  is '土地证编号';
comment on column AC_CONT_HOUSESALEINFO.landdevelopusing
  is '土地开发用途';
comment on column AC_CONT_HOUSESALEINFO.landusecertificatearea
  is '土地使用证土地面积';
comment on column AC_CONT_HOUSESALEINFO.landusecertificatecunit
  is '土地使用证发证单位';
comment on column AC_CONT_HOUSESALEINFO.preselllinence
  is '商品房预售许可证';
comment on column AC_CONT_HOUSESALEINFO.preselllinenceperiod
  is '预售许可日期';
comment on column AC_CONT_HOUSESALEINFO.preselllinenceunit
  is '商品房预售发证单位';
comment on column AC_CONT_HOUSESALEINFO.presellprojectname
  is '预售项目名称';
comment on column AC_CONT_HOUSESALEINFO.presellprojectaddress
  is '预售项目地址';
comment on column AC_CONT_HOUSESALEINFO.presellprojectusing
  is '预售房屋用途';
comment on column AC_CONT_HOUSESALEINFO.presellobject
  is '预售对象';
comment on column AC_CONT_HOUSESALEINFO.presellnumber
  is '预售套数';
comment on column AC_CONT_HOUSESALEINFO.preselltotalarea
  is '预售总面积';
comment on column AC_CONT_HOUSESALEINFO.projectareas
  is '项目所在区域';
comment on column AC_CONT_HOUSESALEINFO.projectlandlevel
  is '项目用地等级';
comment on column AC_CONT_HOUSESALEINFO.developunit
  is '开发公司';
comment on column AC_CONT_HOUSESALEINFO.unitcharater
  is '单位性质';
comment on column AC_CONT_HOUSESALEINFO.unitaddress
  is '公司地址';
comment on column AC_CONT_HOUSESALEINFO.legalperson
  is '法人代表';
comment on column AC_CONT_HOUSESALEINFO.projectmanager
  is '项目负责人';
comment on column AC_CONT_HOUSESALEINFO.contactphone
  is '联系电话';
comment on column AC_CONT_HOUSESALEINFO.capitalregulationbank
  is '资金监管银行';
comment on column AC_CONT_HOUSESALEINFO.capitalregulationaccount
  is '资金监管账号';
comment on column AC_CONT_HOUSESALEINFO.buildingname
  is '楼盘名称';
comment on column AC_CONT_HOUSESALEINFO.buildingnumber
  is '幢号';
comment on column AC_CONT_HOUSESALEINFO.buildingunitnumber
  is '单元号';
comment on column AC_CONT_HOUSESALEINFO.housenumber
  is '房号';
comment on column AC_CONT_HOUSESALEINFO.housecode
  is '房屋编号';
comment on column AC_CONT_HOUSESALEINFO.contructionarea
  is '建筑面积';
comment on column AC_CONT_HOUSESALEINFO.publicarea
  is '公推面积';
comment on column AC_CONT_HOUSESALEINFO.privatearea
  is '套内面积';
comment on column AC_CONT_HOUSESALEINFO.huxing
  is '户型';
comment on column AC_CONT_HOUSESALEINFO.toilet
  is '卫生间';
comment on column AC_CONT_HOUSESALEINFO.balcony
  is '阳台';
comment on column AC_CONT_HOUSESALEINFO.propertytype
  is '物业类型';
comment on column AC_CONT_HOUSESALEINFO.preselltotalamount
  is '预售总金额';
comment on column AC_CONT_HOUSESALEINFO.housestatus
  is '房屋状态';
comment on column AC_CONT_HOUSESALEINFO.wherehouse
  is '房屋坐落';
comment on column AC_CONT_HOUSESALEINFO.whencreate
  is '建成年份';
comment on column AC_CONT_HOUSESALEINFO.structure
  is '结构';
comment on column AC_CONT_HOUSESALEINFO.bulidtotalfloots
  is '房屋总层数';
comment on column AC_CONT_HOUSESALEINFO.floots
  is '所在层数';
comment on column AC_CONT_HOUSESALEINFO.housecharater
  is '房屋性质';
comment on column AC_CONT_HOUSESALEINFO.flootheight
  is '层高';
comment on column AC_CONT_HOUSESALEINFO.sellername
  is '卖方名称';
comment on column AC_CONT_HOUSESALEINFO.bussinesslinence
  is '营业执照号';
comment on column AC_CONT_HOUSESALEINFO.authorizeperson
  is '法人代表';
comment on column AC_CONT_HOUSESALEINFO.certificationlevel
  is '授权代表';
comment on column AC_CONT_HOUSESALEINFO.sellercontactphone
  is '资质等级';
comment on column AC_CONT_HOUSESALEINFO.isclient
  is '联系电话';
comment on column AC_CONT_HOUSESALEINFO.clientname
  is '联系电话';
comment on column AC_CONT_HOUSESALEINFO.clientlegalperson
  is '是否委托代理';
comment on column AC_CONT_HOUSESALEINFO.sellercontactaddress
  is '委托代理人名称';
comment on column AC_CONT_HOUSESALEINFO.sellerbank
  is '委托代理人法人代表';
comment on column AC_CONT_HOUSESALEINFO.sellerbankaccount
  is '卖方联系地址';
comment on column AC_CONT_HOUSESALEINFO.buyername
  is '卖方开户行';
comment on column AC_CONT_HOUSESALEINFO.buyername2
  is '卖方开户行帐号';
comment on column AC_CONT_HOUSESALEINFO.buyercertification
  is '买方姓名';
comment on column AC_CONT_HOUSESALEINFO.certificationnum
  is '买方姓名（共有权人）';
comment on column AC_CONT_HOUSESALEINFO.buyercontactphone
  is '买方证件';
comment on column AC_CONT_HOUSESALEINFO.buyercontactaddress
  is '证件号码';
comment on column AC_CONT_HOUSESALEINFO.buyersex
  is '买方联系电话';
comment on column AC_CONT_HOUSESALEINFO.buyernationality
  is '买方联系地址';
comment on column AC_CONT_HOUSESALEINFO.buyernation
  is '买方姓别';
comment on column AC_CONT_HOUSESALEINFO.payoffmode
  is '买方国籍';
comment on column AC_CONT_HOUSESALEINFO.contcode
  is '买方民族';
comment on column AC_CONT_HOUSESALEINFO.stockcontid
  is '合同编号';
comment on column AC_CONT_HOUSESALEINFO.contracttime
  is '付款方式';
comment on column AC_CONT_HOUSESALEINFO.contbackuptime
  is '合同编号';
comment on column AC_CONT_HOUSESALEINFO.firstpay
  is '合同签订时间';
comment on column AC_CONT_HOUSESALEINFO.firstpayratio
  is '合同备案时间';
comment on column AC_CONT_HOUSESALEINFO.loanamount
  is '首付款额';
comment on column AC_CONT_HOUSESALEINFO.loanperiod
  is '首付款比例';
comment on column AC_CONT_HOUSESALEINFO.fundloan
  is '贷款额度';
comment on column AC_CONT_HOUSESALEINFO.bussinessloan
  is '贷款年限';
comment on column AC_CONT_HOUSESALEINFO.paymentaccount
  is '公积金贷款';
comment on column AC_CONT_HOUSESALEINFO.accountbank
  is '商业贷款';
comment on column AC_CONT_HOUSESALEINFO.sellprice
  is '还款帐户';
comment on column AC_CONT_HOUSESALEINFO.selltotalamount
  is '开户银行';
comment on column AC_CONT_HOUSESALEINFO.areasupplement
  is '销售单价';
comment on column AC_CONT_HOUSESALEINFO.getintime
  is '销售总价';
comment on column AC_CONT_HOUSESALEINFO.propertyfeestandand
  is '面积补差';
comment on column AC_CONT_HOUSESALEINFO.propertyunitname
  is '入伙时间';
comment on column AC_CONT_HOUSESALEINFO.propertylegalperson
  is '物业费标准';
comment on column AC_CONT_HOUSESALEINFO.propertybussinessnum
  is '物业公司名称';
comment on column AC_CONT_HOUSESALEINFO.propertycertificationlevel
  is '物业公司法人代表';
comment on column AC_CONT_HOUSESALEINFO.propertymanagementperiod
  is '营业执照号';
comment on column AC_CONT_HOUSESALEINFO.createpersonid
  is '营业执照号';
comment on column AC_CONT_HOUSESALEINFO.createperson
  is '资质等级';
comment on column AC_CONT_HOUSESALEINFO.createtime
  is '资质等级';
comment on column AC_CONT_HOUSESALEINFO.sbjstate
  is '物业管理合同期限';
comment on column AC_CONT_HOUSESALEINFO.description
  is '操作描述';
comment on column AC_CONT_HOUSESALEINFO.creator_id
  is '创建者id';
comment on column AC_CONT_HOUSESALEINFO.creator
  is '创建者';
comment on column AC_CONT_HOUSESALEINFO.create_date
  is '创建日期';
comment on column AC_CONT_HOUSESALEINFO.modifiedby
  is '修改人';
comment on column AC_CONT_HOUSESALEINFO.modifiedby_id
  is '修改人id';
comment on column AC_CONT_HOUSESALEINFO.modified_date
  is '修改日期';
comment on column AC_CONT_HOUSESALEINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_CONT_HOUSESALEINFO.version
  is '版本号';
comment on column AC_CONT_HOUSESALEINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_CONT_HOUSESALEINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_CONT_HOUSESALEINFO.bus_date
  is '业务日期';
comment on column AC_CONT_HOUSESALEINFO.exa_remarks
  is '审批备注';
comment on column AC_CONT_HOUSESALEINFO.src_table
  is '来源实体';
comment on column AC_CONT_HOUSESALEINFO.src_system
  is '来源系统';
comment on column AC_CONT_HOUSESALEINFO.sort_id
  is '排序字段';

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
  is '合同基本信息表';
comment on column AC_CONT_INFO.stockcontid
  is '合同编号';
comment on column AC_CONT_INFO.stockcontname
  is '合同名称';
comment on column AC_CONT_INFO.conttype
  is '合同状态';
comment on column AC_CONT_INFO.stakeholder
  is '合同甲方';
comment on column AC_CONT_INFO.stakelinkman
  is '合同甲方联系人';
comment on column AC_CONT_INFO.stakesubdate
  is '合同甲方签署日期';
comment on column AC_CONT_INFO.stakesigner
  is '合同甲方签署人';
comment on column AC_CONT_INFO.associator
  is '合同乙方';
comment on column AC_CONT_INFO.assoclinkman
  is '合同乙方联系人';
comment on column AC_CONT_INFO.associatedate
  is '合同乙方签署日期';
comment on column AC_CONT_INFO.associatesigner
  is '合同乙方签署人';
comment on column AC_CONT_INFO.associator2
  is '合同丙方';
comment on column AC_CONT_INFO.assoclinkman2
  is '合同丙方联系人';
comment on column AC_CONT_INFO.associatedate2
  is '合同丙方签署日期';
comment on column AC_CONT_INFO.associatesigner2
  is '合同丙方签署人';
comment on column AC_CONT_INFO.contacttype
  is '合同类别';
comment on column AC_CONT_INFO.powertree
  is '管理权限树';
comment on column AC_CONT_INFO.sendapprovetype
  is '送审类别';
comment on column AC_CONT_INFO.paytype
  is '支付项类型';
comment on column AC_CONT_INFO.contractprice
  is '合同金额';
comment on column AC_CONT_INFO.moneytype
  is '币种';
comment on column AC_CONT_INFO.validdate
  is '生效日期';
comment on column AC_CONT_INFO.finishdate
  is '完工日期';
comment on column AC_CONT_INFO.prjcode
  is '项目代码';
comment on column AC_CONT_INFO.prjname
  is '项目名称';
comment on column AC_CONT_INFO.prjplace
  is '项目地点';
comment on column AC_CONT_INFO.planbegindate
  is '计划开始时间';
comment on column AC_CONT_INFO.planenddate
  is '计划结束时间';
comment on column AC_CONT_INFO.capitaldivisionratio
  is '资金分配比例';
comment on column AC_CONT_INFO.description
  is '操作描述';
comment on column AC_CONT_INFO.creator_id
  is '创建者id';
comment on column AC_CONT_INFO.creator
  is '创建者';
comment on column AC_CONT_INFO.create_date
  is '创建日期';
comment on column AC_CONT_INFO.modifiedby
  is '修改人';
comment on column AC_CONT_INFO.modifiedby_id
  is '修改人id';
comment on column AC_CONT_INFO.modified_date
  is '修改日期';
comment on column AC_CONT_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_CONT_INFO.version
  is '版本号';
comment on column AC_CONT_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_CONT_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_CONT_INFO.bus_date
  is '业务日期';
comment on column AC_CONT_INFO.exa_remarks
  is '审批备注';
comment on column AC_CONT_INFO.src_table
  is '来源实体';
comment on column AC_CONT_INFO.src_system
  is '来源系统';
comment on column AC_CONT_INFO.sort_id
  is '排序字段';

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
  is '租赁合同表';
comment on column AC_CONT_LANDLEASE.stockcontid
  is '合同编号';
comment on column AC_CONT_LANDLEASE.leasename
  is '租赁合同名称';
comment on column AC_CONT_LANDLEASE.propertytype
  is '物业类型';
comment on column AC_CONT_LANDLEASE.ownership
  is '所有权归属';
comment on column AC_CONT_LANDLEASE.begintime
  is '合同起始日期';
comment on column AC_CONT_LANDLEASE.endtime
  is '合同截止日期';
comment on column AC_CONT_LANDLEASE.usingunit
  is '使用单位';
comment on column AC_CONT_LANDLEASE.legalperson
  is '法定代表人';
comment on column AC_CONT_LANDLEASE.licensenum
  is '营业执照号码';
comment on column AC_CONT_LANDLEASE.contactperson
  is '使用单位联系人';
comment on column AC_CONT_LANDLEASE.contacttel
  is '联系电话';
comment on column AC_CONT_LANDLEASE.constructionarea
  is '建筑面积';
comment on column AC_CONT_LANDLEASE.leaseprice
  is '出租单价';
comment on column AC_CONT_LANDLEASE.remark
  is '备注';
comment on column AC_CONT_LANDLEASE.description
  is '操作描述';
comment on column AC_CONT_LANDLEASE.creator_id
  is '创建者id';
comment on column AC_CONT_LANDLEASE.creator
  is '创建者';
comment on column AC_CONT_LANDLEASE.create_date
  is '创建日期';
comment on column AC_CONT_LANDLEASE.modifiedby
  is '修改人';
comment on column AC_CONT_LANDLEASE.modifiedby_id
  is '修改人id';
comment on column AC_CONT_LANDLEASE.modified_date
  is '修改日期';
comment on column AC_CONT_LANDLEASE.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_CONT_LANDLEASE.version
  is '版本号';
comment on column AC_CONT_LANDLEASE.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_CONT_LANDLEASE.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_CONT_LANDLEASE.bus_date
  is '业务日期';
comment on column AC_CONT_LANDLEASE.exa_remarks
  is '审批备注';
comment on column AC_CONT_LANDLEASE.src_table
  is '来源实体';
comment on column AC_CONT_LANDLEASE.src_system
  is '来源系统';
comment on column AC_CONT_LANDLEASE.sort_id
  is '排序字段';

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
  is '造地合同表';
comment on column AC_CONT_MAKELANDDETAIL.stockcontid
  is '合同编号';
comment on column AC_CONT_MAKELANDDETAIL.payitemcode
  is '支付项代码';
comment on column AC_CONT_MAKELANDDETAIL.payitemname
  is '支付项名称';
comment on column AC_CONT_MAKELANDDETAIL.contnum
  is '合同数量';
comment on column AC_CONT_MAKELANDDETAIL.contunit
  is '合同单价';
comment on column AC_CONT_MAKELANDDETAIL.contcost
  is '本项费用';
comment on column AC_CONT_MAKELANDDETAIL.contratio
  is '支付系数';
comment on column AC_CONT_MAKELANDDETAIL.processrelation
  is '进度关联';
comment on column AC_CONT_MAKELANDDETAIL.numctrl
  is '数量控制';
comment on column AC_CONT_MAKELANDDETAIL.standard
  is '规格';
comment on column AC_CONT_MAKELANDDETAIL.countingunit
  is '计量单位';
comment on column AC_CONT_MAKELANDDETAIL.valuation
  is '履约评价';
comment on column AC_CONT_MAKELANDDETAIL.approvenum
  is '批准文号';
comment on column AC_CONT_MAKELANDDETAIL.approvedate
  is '批准时间';
comment on column AC_CONT_MAKELANDDETAIL.prjcode
  is '项目编号';
comment on column AC_CONT_MAKELANDDETAIL.prjname
  is '项目名称';
comment on column AC_CONT_MAKELANDDETAIL.contractcode
  is '合同编号';
comment on column AC_CONT_MAKELANDDETAIL.contractamount
  is '合同金额';
comment on column AC_CONT_MAKELANDDETAIL.projecttimelimit
  is '工程工期';
comment on column AC_CONT_MAKELANDDETAIL.estimatequantities
  is '预计工程量';
comment on column AC_CONT_MAKELANDDETAIL.workingunit
  is '施工单位';
comment on column AC_CONT_MAKELANDDETAIL.isdigpay
  is '是否挖方区付款';
comment on column AC_CONT_MAKELANDDETAIL.digareanum
  is '挖方区区域编号';
comment on column AC_CONT_MAKELANDDETAIL.diglandnum
  is '地块编号';
comment on column AC_CONT_MAKELANDDETAIL.estimatarea
  is '预计挖方面积';
comment on column AC_CONT_MAKELANDDETAIL.estimatquantity
  is '预计工程量';
comment on column AC_CONT_MAKELANDDETAIL.estimatcost
  is '预计成本';
comment on column AC_CONT_MAKELANDDETAIL.completedquantity
  is '本次完成工程量';
comment on column AC_CONT_MAKELANDDETAIL.nowpayoff
  is '本次支持金额';
comment on column AC_CONT_MAKELANDDETAIL.totalpayoff
  is '累计支出金额';
comment on column AC_CONT_MAKELANDDETAIL.totalquantity
  is '累计完成工程量';
comment on column AC_CONT_MAKELANDDETAIL.mcoareanum
  is '填方区区域编号';
comment on column AC_CONT_MAKELANDDETAIL.mcolandnum
  is '填方区地块编号';
comment on column AC_CONT_MAKELANDDETAIL.mcolandname
  is '填方区地块名称';
comment on column AC_CONT_MAKELANDDETAIL.buystonecount
  is '购入土石方量';
comment on column AC_CONT_MAKELANDDETAIL.costamount
  is '成本金额';
comment on column AC_CONT_MAKELANDDETAIL.description
  is '操作描述';
comment on column AC_CONT_MAKELANDDETAIL.creator_id
  is '创建者id';
comment on column AC_CONT_MAKELANDDETAIL.creator
  is '创建者';
comment on column AC_CONT_MAKELANDDETAIL.create_date
  is '创建日期';
comment on column AC_CONT_MAKELANDDETAIL.modifiedby
  is '修改人';
comment on column AC_CONT_MAKELANDDETAIL.modifiedby_id
  is '修改人id';
comment on column AC_CONT_MAKELANDDETAIL.modified_date
  is '修改日期';
comment on column AC_CONT_MAKELANDDETAIL.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_CONT_MAKELANDDETAIL.version
  is '版本号';
comment on column AC_CONT_MAKELANDDETAIL.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_CONT_MAKELANDDETAIL.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_CONT_MAKELANDDETAIL.bus_date
  is '业务日期';
comment on column AC_CONT_MAKELANDDETAIL.exa_remarks
  is '审批备注';
comment on column AC_CONT_MAKELANDDETAIL.src_table
  is '来源实体';
comment on column AC_CONT_MAKELANDDETAIL.src_system
  is '来源系统';
comment on column AC_CONT_MAKELANDDETAIL.sort_id
  is '排序字段';

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
  is '工程类合同信息表';
comment on column AC_CONT_PRJTERMS.stockcontid
  is '合同编号';
comment on column AC_CONT_PRJTERMS.area
  is '面积';
comment on column AC_CONT_PRJTERMS.qualitystandard
  is '质量标准';
comment on column AC_CONT_PRJTERMS.begindate
  is '开工日期';
comment on column AC_CONT_PRJTERMS.price
  is '单价';
comment on column AC_CONT_PRJTERMS.amount
  is '合同金额';
comment on column AC_CONT_PRJTERMS.finishdate
  is '竣工日期';
comment on column AC_CONT_PRJTERMS.termsmode
  is '结算方式';
comment on column AC_CONT_PRJTERMS.termsperiod
  is '结算期限';
comment on column AC_CONT_PRJTERMS.comflictplace
  is '争议解决地点';
comment on column AC_CONT_PRJTERMS.comflictmode
  is '争议解决方式';
comment on column AC_CONT_PRJTERMS.unitname
  is '单位名称';
comment on column AC_CONT_PRJTERMS.appointedperson
  is '约定代表人';
comment on column AC_CONT_PRJTERMS.clientperson
  is '委托代表人';
comment on column AC_CONT_PRJTERMS.phone
  is '联系电话';
comment on column AC_CONT_PRJTERMS.signingdept
  is '签约部门';
comment on column AC_CONT_PRJTERMS.agent
  is '委托代理人';
comment on column AC_CONT_PRJTERMS.authorizationnum
  is '授权委托书号';
comment on column AC_CONT_PRJTERMS.approvalleader
  is '审批领导';
comment on column AC_CONT_PRJTERMS.areadyfinish
  is '已完成量情况';
comment on column AC_CONT_PRJTERMS.stopworkdays
  is '停工天数';
comment on column AC_CONT_PRJTERMS.settledamount
  is '已结算金额';
comment on column AC_CONT_PRJTERMS.trialbalance
  is '初审结算';
comment on column AC_CONT_PRJTERMS.clearingtime
  is '结算时间';
comment on column AC_CONT_PRJTERMS.description
  is '操作描述';
comment on column AC_CONT_PRJTERMS.creator_id
  is '创建者id';
comment on column AC_CONT_PRJTERMS.creator
  is '创建者';
comment on column AC_CONT_PRJTERMS.create_date
  is '创建日期';
comment on column AC_CONT_PRJTERMS.modifiedby
  is '修改人';
comment on column AC_CONT_PRJTERMS.modifiedby_id
  is '修改人id';
comment on column AC_CONT_PRJTERMS.modified_date
  is '修改日期';
comment on column AC_CONT_PRJTERMS.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_CONT_PRJTERMS.version
  is '版本号';
comment on column AC_CONT_PRJTERMS.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_CONT_PRJTERMS.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_CONT_PRJTERMS.bus_date
  is '业务日期';
comment on column AC_CONT_PRJTERMS.exa_remarks
  is '审批备注';
comment on column AC_CONT_PRJTERMS.src_table
  is '来源实体';
comment on column AC_CONT_PRJTERMS.src_system
  is '来源系统';
comment on column AC_CONT_PRJTERMS.sort_id
  is '排序字段';

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
  is '采购合同表';
comment on column AC_CONT_PURCHASE.stockcontid
  is '合同编号';
comment on column AC_CONT_PURCHASE.contcode
  is '合同编号';
comment on column AC_CONT_PURCHASE.signingtime
  is '签约时间';
comment on column AC_CONT_PURCHASE.unitname
  is '单位名称';
comment on column AC_CONT_PURCHASE.contstandard
  is '合同标准';
comment on column AC_CONT_PURCHASE.qualitystandard
  is '质量标准';
comment on column AC_CONT_PURCHASE.num
  is '数量';
comment on column AC_CONT_PURCHASE.price
  is '单价';
comment on column AC_CONT_PURCHASE.totalamout
  is '合同总金额';
comment on column AC_CONT_PURCHASE.submittime
  is '提（交）货时间';
comment on column AC_CONT_PURCHASE.submitnum
  is '提（交）货数量';
comment on column AC_CONT_PURCHASE.paymenttime
  is '付款时间';
comment on column AC_CONT_PURCHASE.submitedtime
  is '已提（交）货时间';
comment on column AC_CONT_PURCHASE.submitednum
  is '已提（交）货数量';
comment on column AC_CONT_PURCHASE.qualityproblem
  is '质量问题';
comment on column AC_CONT_PURCHASE.paidamout
  is '已付款金额';
comment on column AC_CONT_PURCHASE.paycode
  is '付款凭号';
comment on column AC_CONT_PURCHASE.changerelease
  is '变更解除情况';
comment on column AC_CONT_PURCHASE.dispute
  is '发生纠纷情况';
comment on column AC_CONT_PURCHASE.description
  is '操作描述';
comment on column AC_CONT_PURCHASE.creator_id
  is '创建者id';
comment on column AC_CONT_PURCHASE.creator
  is '创建者';
comment on column AC_CONT_PURCHASE.create_date
  is '创建日期';
comment on column AC_CONT_PURCHASE.modifiedby
  is '修改人';
comment on column AC_CONT_PURCHASE.modifiedby_id
  is '修改人id';
comment on column AC_CONT_PURCHASE.modified_date
  is '修改日期';
comment on column AC_CONT_PURCHASE.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_CONT_PURCHASE.version
  is '版本号';
comment on column AC_CONT_PURCHASE.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_CONT_PURCHASE.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_CONT_PURCHASE.bus_date
  is '业务日期';
comment on column AC_CONT_PURCHASE.exa_remarks
  is '审批备注';
comment on column AC_CONT_PURCHASE.src_table
  is '来源实体';
comment on column AC_CONT_PURCHASE.src_system
  is '来源系统';
comment on column AC_CONT_PURCHASE.sort_id
  is '排序字段';

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
  is '销售合同附件表';
comment on column AC_CONT_SELLATTACHMENT.stockcontid
  is '合同编号';
comment on column AC_CONT_SELLATTACHMENT.pagenum
  is '合同附件页数';
comment on column AC_CONT_SELLATTACHMENT.author
  is '合同附件作者';
comment on column AC_CONT_SELLATTACHMENT.attachversion
  is '合同附件版本';
comment on column AC_CONT_SELLATTACHMENT.description
  is '操作描述';
comment on column AC_CONT_SELLATTACHMENT.creator_id
  is '创建者id';
comment on column AC_CONT_SELLATTACHMENT.creator
  is '创建者';
comment on column AC_CONT_SELLATTACHMENT.create_date
  is '创建日期';
comment on column AC_CONT_SELLATTACHMENT.modifiedby
  is '修改人';
comment on column AC_CONT_SELLATTACHMENT.modifiedby_id
  is '修改人id';
comment on column AC_CONT_SELLATTACHMENT.modified_date
  is '修改日期';
comment on column AC_CONT_SELLATTACHMENT.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_CONT_SELLATTACHMENT.version
  is '版本号';
comment on column AC_CONT_SELLATTACHMENT.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_CONT_SELLATTACHMENT.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_CONT_SELLATTACHMENT.bus_date
  is '业务日期';
comment on column AC_CONT_SELLATTACHMENT.exa_remarks
  is '审批备注';
comment on column AC_CONT_SELLATTACHMENT.src_table
  is '来源实体';
comment on column AC_CONT_SELLATTACHMENT.src_system
  is '来源系统';
comment on column AC_CONT_SELLATTACHMENT.sort_id
  is '排序字段';

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
  is '销售合同收入表';
comment on column AC_CONT_SELLINCOME.stockcontid
  is '合同编号';
comment on column AC_CONT_SELLINCOME.billcode
  is '收款单编号';
comment on column AC_CONT_SELLINCOME.billdate
  is '收款日期';
comment on column AC_CONT_SELLINCOME.approvecode
  is '批准文号';
comment on column AC_CONT_SELLINCOME.contcode
  is '合同编号';
comment on column AC_CONT_SELLINCOME.contname
  is '合同名称';
comment on column AC_CONT_SELLINCOME.prelandsellcontid
  is '原土地出让合同号';
comment on column AC_CONT_SELLINCOME.prelandsellcontname
  is '原土地出让合同名称';
comment on column AC_CONT_SELLINCOME.moneytype
  is '币种';
comment on column AC_CONT_SELLINCOME.transfertotalcost
  is '转让总价';
comment on column AC_CONT_SELLINCOME.nowbillamount
  is '本次收款金额';
comment on column AC_CONT_SELLINCOME.landcode
  is '地块编号';
comment on column AC_CONT_SELLINCOME.landarea_mu
  is '地块面积';
comment on column AC_CONT_SELLINCOME.landusing
  is '地块用途';
comment on column AC_CONT_SELLINCOME.description
  is '操作描述';
comment on column AC_CONT_SELLINCOME.creator_id
  is '创建者id';
comment on column AC_CONT_SELLINCOME.creator
  is '创建者';
comment on column AC_CONT_SELLINCOME.create_date
  is '创建日期';
comment on column AC_CONT_SELLINCOME.modifiedby
  is '修改人';
comment on column AC_CONT_SELLINCOME.modifiedby_id
  is '修改人id';
comment on column AC_CONT_SELLINCOME.modified_date
  is '修改日期';
comment on column AC_CONT_SELLINCOME.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_CONT_SELLINCOME.version
  is '版本号';
comment on column AC_CONT_SELLINCOME.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_CONT_SELLINCOME.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_CONT_SELLINCOME.bus_date
  is '业务日期';
comment on column AC_CONT_SELLINCOME.exa_remarks
  is '审批备注';
comment on column AC_CONT_SELLINCOME.src_table
  is '来源实体';
comment on column AC_CONT_SELLINCOME.src_system
  is '来源系统';
comment on column AC_CONT_SELLINCOME.sort_id
  is '排序字段';

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
  is '销售合同到账计划表';
comment on column AC_CONT_SELLTOACCOUNTPLAN.stockcontid
  is '合同编号';
comment on column AC_CONT_SELLTOACCOUNTPLAN.totalcapital
  is '资金到账金额总计';
comment on column AC_CONT_SELLTOACCOUNTPLAN.howmuchperiod
  is '共分_期支付';
comment on column AC_CONT_SELLTOACCOUNTPLAN.paydesc
  is '支付说明';
comment on column AC_CONT_SELLTOACCOUNTPLAN.planpaydate
  is '计划支付日期';
comment on column AC_CONT_SELLTOACCOUNTPLAN.planpayamount
  is '计划支付金额';
comment on column AC_CONT_SELLTOACCOUNTPLAN.remark
  is '备注事项';
comment on column AC_CONT_SELLTOACCOUNTPLAN.description
  is '操作描述';
comment on column AC_CONT_SELLTOACCOUNTPLAN.creator_id
  is '创建者id';
comment on column AC_CONT_SELLTOACCOUNTPLAN.creator
  is '创建者';
comment on column AC_CONT_SELLTOACCOUNTPLAN.create_date
  is '创建日期';
comment on column AC_CONT_SELLTOACCOUNTPLAN.modifiedby
  is '修改人';
comment on column AC_CONT_SELLTOACCOUNTPLAN.modifiedby_id
  is '修改人id';
comment on column AC_CONT_SELLTOACCOUNTPLAN.modified_date
  is '修改日期';
comment on column AC_CONT_SELLTOACCOUNTPLAN.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_CONT_SELLTOACCOUNTPLAN.version
  is '版本号';
comment on column AC_CONT_SELLTOACCOUNTPLAN.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_CONT_SELLTOACCOUNTPLAN.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_CONT_SELLTOACCOUNTPLAN.bus_date
  is '业务日期';
comment on column AC_CONT_SELLTOACCOUNTPLAN.exa_remarks
  is '审批备注';
comment on column AC_CONT_SELLTOACCOUNTPLAN.src_table
  is '来源实体';
comment on column AC_CONT_SELLTOACCOUNTPLAN.src_system
  is '来源系统';
comment on column AC_CONT_SELLTOACCOUNTPLAN.sort_id
  is '排序字段';

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
  is '监理合同支付信息表';
comment on column AC_CONT_SUPERVISORINFO.stockcontid
  is '合同编号';
comment on column AC_CONT_SUPERVISORINFO.billcode
  is '单据编号';
comment on column AC_CONT_SUPERVISORINFO.billdate
  is '单据时间';
comment on column AC_CONT_SUPERVISORINFO.makelandprj
  is '造地项目';
comment on column AC_CONT_SUPERVISORINFO.supervisorunit
  is '监理单位';
comment on column AC_CONT_SUPERVISORINFO.applicationon
  is '申请付款人';
comment on column AC_CONT_SUPERVISORINFO.approver
  is '审批人';
comment on column AC_CONT_SUPERVISORINFO.whichtimes
  is '第几次付款';
comment on column AC_CONT_SUPERVISORINFO.payoffdesc
  is '付款说明';
comment on column AC_CONT_SUPERVISORINFO.nowpayoff
  is '本次付款金额';
comment on column AC_CONT_SUPERVISORINFO.totalpayoff
  is '累计付款金额';
comment on column AC_CONT_SUPERVISORINFO.prjcontcode
  is '工程合同号';
comment on column AC_CONT_SUPERVISORINFO.prjcontname
  is '工程合同名称';
comment on column AC_CONT_SUPERVISORINFO.prjcontamount
  is '工程合同金额';
comment on column AC_CONT_SUPERVISORINFO.prjconttotalamount
  is '工程合同结算金额';
comment on column AC_CONT_SUPERVISORINFO.payoffratio
  is '付款比例';
comment on column AC_CONT_SUPERVISORINFO.supervisor
  is '监理合同金额';
comment on column AC_CONT_SUPERVISORINFO.description
  is '操作描述';
comment on column AC_CONT_SUPERVISORINFO.creator_id
  is '创建者id';
comment on column AC_CONT_SUPERVISORINFO.creator
  is '创建者';
comment on column AC_CONT_SUPERVISORINFO.create_date
  is '创建日期';
comment on column AC_CONT_SUPERVISORINFO.modifiedby
  is '修改人';
comment on column AC_CONT_SUPERVISORINFO.modifiedby_id
  is '修改人id';
comment on column AC_CONT_SUPERVISORINFO.modified_date
  is '修改日期';
comment on column AC_CONT_SUPERVISORINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_CONT_SUPERVISORINFO.version
  is '版本号';
comment on column AC_CONT_SUPERVISORINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_CONT_SUPERVISORINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_CONT_SUPERVISORINFO.bus_date
  is '业务日期';
comment on column AC_CONT_SUPERVISORINFO.exa_remarks
  is '审批备注';
comment on column AC_CONT_SUPERVISORINFO.src_table
  is '来源实体';
comment on column AC_CONT_SUPERVISORINFO.src_system
  is '来源系统';
comment on column AC_CONT_SUPERVISORINFO.sort_id
  is '排序字段';

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
  is '客户信息表';
comment on column AC_CUST_INFO.code
  is '客户代码';
comment on column AC_CUST_INFO.name
  is '客户名称';
comment on column AC_CUST_INFO.certificatenum
  is '法人证件号码';
comment on column AC_CUST_INFO.companynatureid
  is '企业性质';
comment on column AC_CUST_INFO.registeredcapital
  is '注册资本';
comment on column AC_CUST_INFO.city
  is '所在城市';
comment on column AC_CUST_INFO.bank
  is '开户银行';
comment on column AC_CUST_INFO.account
  is '银行账号';
comment on column AC_CUST_INFO.representative
  is '法人代表';
comment on column AC_CUST_INFO.contactperson
  is '联系人';
comment on column AC_CUST_INFO.businesslicense
  is '营业执照号';
comment on column AC_CUST_INFO.bussinessscope
  is '经营范围';
comment on column AC_CUST_INFO.orgcode
  is '组织机构代码证';
comment on column AC_CUST_INFO.areataxnum
  is '地税登记号';
comment on column AC_CUST_INFO.nationtaxnum
  is '国税登记号';
comment on column AC_CUST_INFO.address
  is '通讯地址';
comment on column AC_CUST_INFO.postalcode
  is '邮政编码';
comment on column AC_CUST_INFO.phone
  is '电话号码';
comment on column AC_CUST_INFO.fax
  is '传真号码';
comment on column AC_CUST_INFO.email
  is '电子邮件';
comment on column AC_CUST_INFO.homepage
  is '公司主页';
comment on column AC_CUST_INFO.cust_description
  is '公司简介';
comment on column AC_CUST_INFO.transationtypeid
  is '交易类型';
comment on column AC_CUST_INFO.statusid
  is '客户状态';
comment on column AC_CUST_INFO.buyprice
  is '购买价格';
comment on column AC_CUST_INFO.rentalprice
  is '租赁价格';
comment on column AC_CUST_INFO.transationcode
  is '交易编号';
comment on column AC_CUST_INFO.contcode
  is '合同编号';
comment on column AC_CUST_INFO.contname
  is '合同名称';
comment on column AC_CUST_INFO.investprjname
  is '投资项目名称';
comment on column AC_CUST_INFO.agent
  is '委托代理人';
comment on column AC_CUST_INFO.clientcertificatenum
  is '委托人证件号码';
comment on column AC_CUST_INFO.clientphone
  is '委托人电话';
comment on column AC_CUST_INFO.clientaddress
  is '委托人地址';
comment on column AC_CUST_INFO.emp_code
  is '人员编号';
comment on column AC_CUST_INFO.emp_name
  is '姓名';
comment on column AC_CUST_INFO.emp_sex
  is '性别';
comment on column AC_CUST_INFO.emp_job
  is '职位';
comment on column AC_CUST_INFO.emp_phone
  is '办公电话';
comment on column AC_CUST_INFO.emp_fax
  is '传真';
comment on column AC_CUST_INFO.emp_email
  is '电子邮件';
comment on column AC_CUST_INFO.emp_address
  is '地址';
comment on column AC_CUST_INFO.emp_postalcode
  is '邮政编码';
comment on column AC_CUST_INFO.emp_mobile
  is '移动电话';
comment on column AC_CUST_INFO.emp_homecall
  is '家庭电话';
comment on column AC_CUST_INFO.emp_othermethod
  is '其他联系方式';
comment on column AC_CUST_INFO.description
  is '操作描述';
comment on column AC_CUST_INFO.creator_id
  is '创建者id';
comment on column AC_CUST_INFO.creator
  is '创建者';
comment on column AC_CUST_INFO.create_date
  is '创建日期';
comment on column AC_CUST_INFO.modifiedby
  is '修改人';
comment on column AC_CUST_INFO.modifiedby_id
  is '修改人id';
comment on column AC_CUST_INFO.modified_date
  is '修改日期';
comment on column AC_CUST_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_CUST_INFO.version
  is '版本号';
comment on column AC_CUST_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_CUST_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_CUST_INFO.bus_date
  is '业务日期';
comment on column AC_CUST_INFO.exa_remarks
  is '审批备注';
comment on column AC_CUST_INFO.src_table
  is '来源实体';
comment on column AC_CUST_INFO.src_system
  is '来源系统';
comment on column AC_CUST_INFO.sort_id
  is '排序字段';

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
  is '人员信息表';
comment on column AC_EMP_INFO.code
  is '员工编号';
comment on column AC_EMP_INFO.cardcode
  is '工卡号';
comment on column AC_EMP_INFO.name
  is '姓名';
comment on column AC_EMP_INFO.pinyin
  is '汉语拼音';
comment on column AC_EMP_INFO.sex
  is '性别';
comment on column AC_EMP_INFO.birthday
  is '出生日期';
comment on column AC_EMP_INFO.bloodtype
  is '血型';
comment on column AC_EMP_INFO.idcard
  is '身份证号';
comment on column AC_EMP_INFO.marry
  is '婚姻状况';
comment on column AC_EMP_INFO.nation
  is '民族';
comment on column AC_EMP_INFO.birthplace
  is '出生地点';
comment on column AC_EMP_INFO.originplace
  is '籍贯';
comment on column AC_EMP_INFO.photo
  is '照片附件';
comment on column AC_EMP_INFO.personindentity
  is '个人身份';
comment on column AC_EMP_INFO.politicaloutlook
  is '政治面貌';
comment on column AC_EMP_INFO.joininparty
  is '参加党团时间';
comment on column AC_EMP_INFO.partyoffice
  is '党团职务';
comment on column AC_EMP_INFO.workingtime
  is '参加工作时间';
comment on column AC_EMP_INFO.joininipbtime
  is '进入招商局系统工作时间';
comment on column AC_EMP_INFO.mana_unit
  is '行政所在单位';
comment on column AC_EMP_INFO.department
  is '行政部门';
comment on column AC_EMP_INFO.joinincorptime
  is '入司日期';
comment on column AC_EMP_INFO.statusdate
  is '转正日期';
comment on column AC_EMP_INFO.emptype
  is '员工类别';
comment on column AC_EMP_INFO.joinintype
  is '入司方式';
comment on column AC_EMP_INFO.mana_job
  is '行政职务';
comment on column AC_EMP_INFO.mana_joblevel
  is '职务级别';
comment on column AC_EMP_INFO.nowjobbegindate
  is '现职开始日期';
comment on column AC_EMP_INFO.contracttype
  is '合同类别';
comment on column AC_EMP_INFO.contractbegindate
  is '合同签订日期';
comment on column AC_EMP_INFO.contractenddate
  is '合同到期日期';
comment on column AC_EMP_INFO.education
  is '学历';
comment on column AC_EMP_INFO.academicdegree
  is '学位';
comment on column AC_EMP_INFO.graguateduniversity
  is '毕业院校';
comment on column AC_EMP_INFO.profession
  is '专业';
comment on column AC_EMP_INFO.edu_begindate
  is '入学时间';
comment on column AC_EMP_INFO.edu_enddate
  is '毕业时间';
comment on column AC_EMP_INFO.foreignlanguage
  is '外语语种';
comment on column AC_EMP_INFO.languagelevel
  is '外语等级';
comment on column AC_EMP_INFO.technicaltitle
  is '技术职称';
comment on column AC_EMP_INFO.titlelevel
  is '职称等级';
comment on column AC_EMP_INFO.occupationqualification
  is '职业资格';
comment on column AC_EMP_INFO.certification
  is '上岗证(操作证)';
comment on column AC_EMP_INFO.city
  is '工作城市';
comment on column AC_EMP_INFO.officeaddress
  is '办公地址';
comment on column AC_EMP_INFO.officephone
  is '固定电话';
comment on column AC_EMP_INFO.mobile
  is '移动电话';
comment on column AC_EMP_INFO.email
  is '电子邮件';
comment on column AC_EMP_INFO.officepostalcode
  is '办公地邮政编码';
comment on column AC_EMP_INFO.homeaddress
  is '家庭住址';
comment on column AC_EMP_INFO.homephone
  is '住宅电话';
comment on column AC_EMP_INFO.homepostalcode
  is '家庭所在地邮政编码';
comment on column AC_EMP_INFO.emergencyperson
  is '紧急联络人';
comment on column AC_EMP_INFO.emergencyphone
  is '紧急联络电话';
comment on column AC_EMP_INFO.worked_begindate
  is '工作开始日期';
comment on column AC_EMP_INFO.worked_enddate
  is '工作结束日期';
comment on column AC_EMP_INFO.worked_unit
  is '工作单位';
comment on column AC_EMP_INFO.worked_department
  is '工作部门';
comment on column AC_EMP_INFO.worked_job
  is '工作职务';
comment on column AC_EMP_INFO.working
  is '所从事（分管）的工作';
comment on column AC_EMP_INFO.tra_begindate
  is '培训开始日期';
comment on column AC_EMP_INFO.tra_enddate
  is '培训结束日期';
comment on column AC_EMP_INFO.tra_content
  is '培训内容';
comment on column AC_EMP_INFO.tra_unit
  is '培训机构';
comment on column AC_EMP_INFO.tra_type
  is '培训类型';
comment on column AC_EMP_INFO.tra_mode
  is '培训方式';
comment on column AC_EMP_INFO.membername
  is '家庭成员姓名';
comment on column AC_EMP_INFO.relation
  is '与本人关系';
comment on column AC_EMP_INFO.fra_birthday
  is '家庭成员出生日期';
comment on column AC_EMP_INFO.fra_unit
  is '家庭成员工作单位';
comment on column AC_EMP_INFO.fra_job
  is '家庭成员职务';
comment on column AC_EMP_INFO.fra_phone
  is '家庭成员联系电话';
comment on column AC_EMP_INFO.fra_sex
  is '家庭成员性别';
comment on column AC_EMP_INFO.description
  is '操作描述';
comment on column AC_EMP_INFO.creator_id
  is '创建者id';
comment on column AC_EMP_INFO.creator
  is '创建者';
comment on column AC_EMP_INFO.create_date
  is '创建日期';
comment on column AC_EMP_INFO.modifiedby
  is '修改人';
comment on column AC_EMP_INFO.modifiedby_id
  is '修改人id';
comment on column AC_EMP_INFO.modified_date
  is '修改日期';
comment on column AC_EMP_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_EMP_INFO.version
  is '版本号';
comment on column AC_EMP_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_EMP_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_EMP_INFO.bus_date
  is '业务日期';
comment on column AC_EMP_INFO.exa_remarks
  is '审批备注';
comment on column AC_EMP_INFO.src_table
  is '来源实体';
comment on column AC_EMP_INFO.src_system
  is '来源系统';
comment on column AC_EMP_INFO.sort_id
  is '排序字段';

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
  is '地块征地基本信息表';
comment on column AC_LAND_BUYINFO.landcode
  is '地块编码';
comment on column AC_LAND_BUYINFO.buycost
  is '征地成本';
comment on column AC_LAND_BUYINFO.buyyear
  is '征地年份';
comment on column AC_LAND_BUYINFO.buytype
  is '征地类别';
comment on column AC_LAND_BUYINFO.buytimes
  is '征地批次';
comment on column AC_LAND_BUYINFO.contcode
  is '合同编号';
comment on column AC_LAND_BUYINFO.description
  is '操作描述';
comment on column AC_LAND_BUYINFO.creator_id
  is '创建者id';
comment on column AC_LAND_BUYINFO.creator
  is '创建者';
comment on column AC_LAND_BUYINFO.create_date
  is '创建日期';
comment on column AC_LAND_BUYINFO.modifiedby
  is '修改人';
comment on column AC_LAND_BUYINFO.modifiedby_id
  is '修改人id';
comment on column AC_LAND_BUYINFO.modified_date
  is '修改日期';
comment on column AC_LAND_BUYINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_LAND_BUYINFO.version
  is '版本号';
comment on column AC_LAND_BUYINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_LAND_BUYINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_LAND_BUYINFO.bus_date
  is '业务日期';
comment on column AC_LAND_BUYINFO.exa_remarks
  is '审批备注';
comment on column AC_LAND_BUYINFO.src_table
  is '来源实体';
comment on column AC_LAND_BUYINFO.src_system
  is '来源系统';
comment on column AC_LAND_BUYINFO.sort_id
  is '排序字段';

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
  is '地块造地开发信息表';
comment on column AC_LAND_DEVELOP.landcode
  is '地块编码';
comment on column AC_LAND_DEVELOP.storagecode
  is '地块开发编码';
comment on column AC_LAND_DEVELOP.projectname
  is '地块开发名称';
comment on column AC_LAND_DEVELOP.storageyear
  is '开发年份';
comment on column AC_LAND_DEVELOP.description
  is '操作描述';
comment on column AC_LAND_DEVELOP.creator_id
  is '创建者id';
comment on column AC_LAND_DEVELOP.creator
  is '创建者';
comment on column AC_LAND_DEVELOP.create_date
  is '创建日期';
comment on column AC_LAND_DEVELOP.modifiedby
  is '修改人';
comment on column AC_LAND_DEVELOP.modifiedby_id
  is '修改人id';
comment on column AC_LAND_DEVELOP.modified_date
  is '修改日期';
comment on column AC_LAND_DEVELOP.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_LAND_DEVELOP.version
  is '版本号';
comment on column AC_LAND_DEVELOP.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_LAND_DEVELOP.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_LAND_DEVELOP.bus_date
  is '业务日期';
comment on column AC_LAND_DEVELOP.exa_remarks
  is '审批备注';
comment on column AC_LAND_DEVELOP.src_table
  is '来源实体';
comment on column AC_LAND_DEVELOP.src_system
  is '来源系统';
comment on column AC_LAND_DEVELOP.sort_id
  is '排序字段';

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
  is '地块基本信息表';
comment on column AC_LAND_INFO.landcode
  is '地块编码';
comment on column AC_LAND_INFO.landtype
  is '地块类型';
comment on column AC_LAND_INFO.landposition
  is '地块位置';
comment on column AC_LAND_INFO.landname
  is '地块名称';
comment on column AC_LAND_INFO.landareadivision
  is '地块区划';
comment on column AC_LAND_INFO.landapprovenumber
  is '地块批准文号';
comment on column AC_LAND_INFO.landapprovedate
  is '地块批准时间';
comment on column AC_LAND_INFO.parentname
  is '权属名称';
comment on column AC_LAND_INFO.landstatus
  is '地块状态';
comment on column AC_LAND_INFO.landshape
  is '地块形状';
comment on column AC_LAND_INFO.landlength
  is '地块长度';
comment on column AC_LAND_INFO.landwidth
  is '地块宽度';
comment on column AC_LAND_INFO.landarea_mu
  is '地块面积（亩）';
comment on column AC_LAND_INFO.landarea_square
  is '地块面积（平方米）';
comment on column AC_LAND_INFO.landphoto
  is '地块图片';
comment on column AC_LAND_INFO.landusing
  is '地块用途';
comment on column AC_LAND_INFO.description
  is '操作描述';
comment on column AC_LAND_INFO.creator_id
  is '创建者id';
comment on column AC_LAND_INFO.creator
  is '创建者';
comment on column AC_LAND_INFO.create_date
  is '创建日期';
comment on column AC_LAND_INFO.modifiedby
  is '修改人';
comment on column AC_LAND_INFO.modifiedby_id
  is '修改人id';
comment on column AC_LAND_INFO.modified_date
  is '修改日期';
comment on column AC_LAND_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_LAND_INFO.version
  is '版本号';
comment on column AC_LAND_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_LAND_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_LAND_INFO.bus_date
  is '业务日期';
comment on column AC_LAND_INFO.exa_remarks
  is '审批备注';
comment on column AC_LAND_INFO.src_table
  is '来源实体';
comment on column AC_LAND_INFO.src_system
  is '来源系统';
comment on column AC_LAND_INFO.sort_id
  is '排序字段';

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
  is '地块收储信息表';
comment on column AC_LAND_MAKEINFO.landcode
  is '地块编码';
comment on column AC_LAND_MAKEINFO.makecost
  is '造地成本';
comment on column AC_LAND_MAKEINFO.makeprice
  is '造地单价';
comment on column AC_LAND_MAKEINFO.stonevolume
  is '土石方量';
comment on column AC_LAND_MAKEINFO.makeyear
  is '造地年份';
comment on column AC_LAND_MAKEINFO.contcode
  is '合同编号';
comment on column AC_LAND_MAKEINFO.description
  is '操作描述';
comment on column AC_LAND_MAKEINFO.creator_id
  is '创建者id';
comment on column AC_LAND_MAKEINFO.creator
  is '创建者';
comment on column AC_LAND_MAKEINFO.create_date
  is '创建日期';
comment on column AC_LAND_MAKEINFO.modifiedby
  is '修改人';
comment on column AC_LAND_MAKEINFO.modifiedby_id
  is '修改人id';
comment on column AC_LAND_MAKEINFO.modified_date
  is '修改日期';
comment on column AC_LAND_MAKEINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_LAND_MAKEINFO.version
  is '版本号';
comment on column AC_LAND_MAKEINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_LAND_MAKEINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_LAND_MAKEINFO.bus_date
  is '业务日期';
comment on column AC_LAND_MAKEINFO.exa_remarks
  is '审批备注';
comment on column AC_LAND_MAKEINFO.src_table
  is '来源实体';
comment on column AC_LAND_MAKEINFO.src_system
  is '来源系统';
comment on column AC_LAND_MAKEINFO.sort_id
  is '排序字段';

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
  is '地块规划信息表';
comment on column AC_LAND_PLANINFO.landcode
  is '地块编码';
comment on column AC_LAND_PLANINFO.buydate
  is '征地时间';
comment on column AC_LAND_PLANINFO.developdate
  is '开发时间';
comment on column AC_LAND_PLANINFO.transferdate
  is '转让时间';
comment on column AC_LAND_PLANINFO.transferperiod
  is '转让期限';
comment on column AC_LAND_PLANINFO.transferprice
  is '转让价格';
comment on column AC_LAND_PLANINFO.usingunit
  is '使用单位';
comment on column AC_LAND_PLANINFO.parcelcode
  is '宗地编号';
comment on column AC_LAND_PLANINFO.makecost
  is '造地成本';
comment on column AC_LAND_PLANINFO.buycost
  is '征地成本';
comment on column AC_LAND_PLANINFO.transferprofit
  is '转让收益';
comment on column AC_LAND_PLANINFO.financefee
  is '财务费用';
comment on column AC_LAND_PLANINFO.managefee
  is '管理费用';
comment on column AC_LAND_PLANINFO.areacode
  is '区域编号';
comment on column AC_LAND_PLANINFO.areameasure
  is '区域面积';
comment on column AC_LAND_PLANINFO.landscopeline
  is '用地范围线';
comment on column AC_LAND_PLANINFO.landplanlayer
  is '用地规划图层';
comment on column AC_LAND_PLANINFO.description
  is '操作描述';
comment on column AC_LAND_PLANINFO.creator_id
  is '创建者id';
comment on column AC_LAND_PLANINFO.creator
  is '创建者';
comment on column AC_LAND_PLANINFO.create_date
  is '创建日期';
comment on column AC_LAND_PLANINFO.modifiedby
  is '修改人';
comment on column AC_LAND_PLANINFO.modifiedby_id
  is '修改人id';
comment on column AC_LAND_PLANINFO.modified_date
  is '修改日期';
comment on column AC_LAND_PLANINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_LAND_PLANINFO.version
  is '版本号';
comment on column AC_LAND_PLANINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_LAND_PLANINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_LAND_PLANINFO.bus_date
  is '业务日期';
comment on column AC_LAND_PLANINFO.exa_remarks
  is '审批备注';
comment on column AC_LAND_PLANINFO.src_table
  is '来源实体';
comment on column AC_LAND_PLANINFO.src_system
  is '来源系统';
comment on column AC_LAND_PLANINFO.sort_id
  is '排序字段';

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
  is '地块售地信息表';
comment on column AC_LAND_SELLINFO.landcode
  is '地块编码';
comment on column AC_LAND_SELLINFO.sellyear
  is '售地年份';
comment on column AC_LAND_SELLINFO.plantransferyear
  is '计划转让年份';
comment on column AC_LAND_SELLINFO.sellcontcode
  is '售地合同编号';
comment on column AC_LAND_SELLINFO.parcelcode
  is '宗地号';
comment on column AC_LAND_SELLINFO.transfer
  is '地块转让方';
comment on column AC_LAND_SELLINFO.transferee
  is '地块受让方';
comment on column AC_LAND_SELLINFO.dealdate
  is '交地时间';
comment on column AC_LAND_SELLINFO.contcode
  is '合同编号';
comment on column AC_LAND_SELLINFO.contname
  is '合同名称';
comment on column AC_LAND_SELLINFO.prelandtransferbuycontcode
  is '原土地出让合同号（征地合同）';
comment on column AC_LAND_SELLINFO.prelandtransferbuycontname
  is '原土地出让合同名称';
comment on column AC_LAND_SELLINFO.landtransferperiod
  is '土地转让年限';
comment on column AC_LAND_SELLINFO.transfertotalamount
  is '转让总价';
comment on column AC_LAND_SELLINFO.sellprice
  is '售地单价';
comment on column AC_LAND_SELLINFO.conttotalamount
  is '合同金额';
comment on column AC_LAND_SELLINFO.agreedate
  is '约定交地时间';
comment on column AC_LAND_SELLINFO.reallydate
  is '实际交地时间';
comment on column AC_LAND_SELLINFO.bookingpayoffdate
  is '预订付款时间';
comment on column AC_LAND_SELLINFO.reallypayoffdate
  is '实际付款时间';
comment on column AC_LAND_SELLINFO.description
  is '操作描述';
comment on column AC_LAND_SELLINFO.creator_id
  is '创建者id';
comment on column AC_LAND_SELLINFO.creator
  is '创建者';
comment on column AC_LAND_SELLINFO.create_date
  is '创建日期';
comment on column AC_LAND_SELLINFO.modifiedby
  is '修改人';
comment on column AC_LAND_SELLINFO.modifiedby_id
  is '修改人id';
comment on column AC_LAND_SELLINFO.modified_date
  is '修改日期';
comment on column AC_LAND_SELLINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_LAND_SELLINFO.version
  is '版本号';
comment on column AC_LAND_SELLINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_LAND_SELLINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_LAND_SELLINFO.bus_date
  is '业务日期';
comment on column AC_LAND_SELLINFO.exa_remarks
  is '审批备注';
comment on column AC_LAND_SELLINFO.src_table
  is '来源实体';
comment on column AC_LAND_SELLINFO.src_system
  is '来源系统';
comment on column AC_LAND_SELLINFO.sort_id
  is '排序字段';

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
  is '地块储地信息表';
comment on column AC_LAND_STORAGEINFO.landcode
  is '地块编码';
comment on column AC_LAND_STORAGEINFO.storecode
  is '收储编号';
comment on column AC_LAND_STORAGEINFO.prjname
  is '项目名称';
comment on column AC_LAND_STORAGEINFO.storeyear
  is '收储年份';
comment on column AC_LAND_STORAGEINFO.description
  is '操作描述';
comment on column AC_LAND_STORAGEINFO.creator_id
  is '创建者id';
comment on column AC_LAND_STORAGEINFO.creator
  is '创建者';
comment on column AC_LAND_STORAGEINFO.create_date
  is '创建日期';
comment on column AC_LAND_STORAGEINFO.modifiedby
  is '修改人';
comment on column AC_LAND_STORAGEINFO.modifiedby_id
  is '修改人id';
comment on column AC_LAND_STORAGEINFO.modified_date
  is '修改日期';
comment on column AC_LAND_STORAGEINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_LAND_STORAGEINFO.version
  is '版本号';
comment on column AC_LAND_STORAGEINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_LAND_STORAGEINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_LAND_STORAGEINFO.bus_date
  is '业务日期';
comment on column AC_LAND_STORAGEINFO.exa_remarks
  is '审批备注';
comment on column AC_LAND_STORAGEINFO.src_table
  is '来源实体';
comment on column AC_LAND_STORAGEINFO.src_system
  is '来源系统';
comment on column AC_LAND_STORAGEINFO.sort_id
  is '排序字段';

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
  is '组织信息表';
comment on column AC_ORG_INFO.code
  is '组织代码';
comment on column AC_ORG_INFO.name
  is '组织名称';
comment on column AC_ORG_INFO.org_type
  is '组织类型';
comment on column AC_ORG_INFO.shortname
  is '组织简称';
comment on column AC_ORG_INFO.relation
  is '隶属关系';
comment on column AC_ORG_INFO.org_level
  is '组织级别';
comment on column AC_ORG_INFO.competentorg
  is '主管单位名称';
comment on column AC_ORG_INFO.properties
  is '组织性质';
comment on column AC_ORG_INFO.established
  is '成立时间';
comment on column AC_ORG_INFO.personsresponsible
  is '负责人';
comment on column AC_ORG_INFO.contactperson
  is '联系人';
comment on column AC_ORG_INFO.postaladdress
  is '通讯地址';
comment on column AC_ORG_INFO.zipcode
  is '邮政编码';
comment on column AC_ORG_INFO.phonenumber
  is '电话号码';
comment on column AC_ORG_INFO.faxno
  is '传真号码';
comment on column AC_ORG_INFO.cablenumber
  is '电报号码';
comment on column AC_ORG_INFO.description
  is '操作描述';
comment on column AC_ORG_INFO.creator_id
  is '创建者id';
comment on column AC_ORG_INFO.creator
  is '创建者';
comment on column AC_ORG_INFO.create_date
  is '创建日期';
comment on column AC_ORG_INFO.modifiedby
  is '修改人';
comment on column AC_ORG_INFO.modifiedby_id
  is '修改人id';
comment on column AC_ORG_INFO.modified_date
  is '修改日期';
comment on column AC_ORG_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_ORG_INFO.version
  is '版本号';
comment on column AC_ORG_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_ORG_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_ORG_INFO.bus_date
  is '业务日期';
comment on column AC_ORG_INFO.exa_remarks
  is '审批备注';
comment on column AC_ORG_INFO.src_table
  is '来源实体';
comment on column AC_ORG_INFO.src_system
  is '来源系统';
comment on column AC_ORG_INFO.sort_id
  is '排序字段';

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
  is '项目招投标表';
comment on column AC_PRJ_BID.projectcode
  is '项目编号';
comment on column AC_PRJ_BID.bidcode
  is '招标编号';
comment on column AC_PRJ_BID.bidname
  is '招标名称';
comment on column AC_PRJ_BID.statuscode
  is '状态';
comment on column AC_PRJ_BID.bidtypeid
  is '招标方式';
comment on column AC_PRJ_BID.budgetcost
  is '预算价';
comment on column AC_PRJ_BID.maxctrlprice
  is '最高控制价';
comment on column AC_PRJ_BID.minctrlprice
  is '最低控制价';
comment on column AC_PRJ_BID.maxctrlrate
  is '最高控制价下浮率';
comment on column AC_PRJ_BID.minctrlrate
  is '最低控制价下浮率';
comment on column AC_PRJ_BID.tendcost
  is '中标价';
comment on column AC_PRJ_BID.booker
  is '编制人';
comment on column AC_PRJ_BID.bookerdate
  is '编制日期';
comment on column AC_PRJ_BID.constructperiod
  is '施工工期';
comment on column AC_PRJ_BID.qualitydesc
  is '质量要求';
comment on column AC_PRJ_BID.bidbond
  is '投标保证金';
comment on column AC_PRJ_BID.contracttype
  is '承包方式';
comment on column AC_PRJ_BID.bidqualification
  is '投标资质';
comment on column AC_PRJ_BID.tenderchoosetype
  is '评标方式';
comment on column AC_PRJ_BID.desctext
  is '备注';
comment on column AC_PRJ_BID.description
  is '操作描述';
comment on column AC_PRJ_BID.creator_id
  is '创建者id';
comment on column AC_PRJ_BID.creator
  is '创建者';
comment on column AC_PRJ_BID.create_date
  is '创建日期';
comment on column AC_PRJ_BID.modifiedby
  is '修改人';
comment on column AC_PRJ_BID.modifiedby_id
  is '修改人id';
comment on column AC_PRJ_BID.modified_date
  is '修改日期';
comment on column AC_PRJ_BID.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_PRJ_BID.version
  is '版本号';
comment on column AC_PRJ_BID.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_PRJ_BID.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_PRJ_BID.bus_date
  is '业务日期';
comment on column AC_PRJ_BID.exa_remarks
  is '审批备注';
comment on column AC_PRJ_BID.src_table
  is '来源实体';
comment on column AC_PRJ_BID.src_system
  is '来源系统';
comment on column AC_PRJ_BID.sort_id
  is '排序字段';

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
  is '预算属性表';
comment on column AC_PRJ_BUDGET.projectcode
  is '项目编号';
comment on column AC_PRJ_BUDGET.budgetcode
  is '预算编号';
comment on column AC_PRJ_BUDGET.budgetname
  is '预算名称';
comment on column AC_PRJ_BUDGET.statuscode
  is '预算状态';
comment on column AC_PRJ_BUDGET.plancost
  is '基建计划投资额';
comment on column AC_PRJ_BUDGET.applyprice
  is '送审造价';
comment on column AC_PRJ_BUDGET.auditprice
  is '审核造价';
comment on column AC_PRJ_BUDGET.bookername
  is '预算编制人';
comment on column AC_PRJ_BUDGET.bookdate
  is '预算编制日期';
comment on column AC_PRJ_BUDGET.auditorname
  is '预算审核人';
comment on column AC_PRJ_BUDGET.auditdate
  is '预算审核日期';
comment on column AC_PRJ_BUDGET.enclosure
  is '附件';
comment on column AC_PRJ_BUDGET.checkername
  is '预算复核人';
comment on column AC_PRJ_BUDGET.description
  is '操作描述';
comment on column AC_PRJ_BUDGET.creator_id
  is '创建者id';
comment on column AC_PRJ_BUDGET.creator
  is '创建者';
comment on column AC_PRJ_BUDGET.create_date
  is '创建日期';
comment on column AC_PRJ_BUDGET.modifiedby
  is '修改人';
comment on column AC_PRJ_BUDGET.modifiedby_id
  is '修改人id';
comment on column AC_PRJ_BUDGET.modified_date
  is '修改日期';
comment on column AC_PRJ_BUDGET.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_PRJ_BUDGET.version
  is '版本号';
comment on column AC_PRJ_BUDGET.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_PRJ_BUDGET.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_PRJ_BUDGET.bus_date
  is '业务日期';
comment on column AC_PRJ_BUDGET.exa_remarks
  is '审批备注';
comment on column AC_PRJ_BUDGET.src_table
  is '来源实体';
comment on column AC_PRJ_BUDGET.src_system
  is '来源系统';
comment on column AC_PRJ_BUDGET.sort_id
  is '排序字段';

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
  is '项目投资信息表';
comment on column AC_PRJ_INVESTMENT.project_id
  is '项目号';
comment on column AC_PRJ_INVESTMENT.project_code
  is '项目编号';
comment on column AC_PRJ_INVESTMENT.originalamount
  is '原始投资额';
comment on column AC_PRJ_INVESTMENT.currentamount
  is '当前累计投资额';
comment on column AC_PRJ_INVESTMENT.investyear
  is '投资年度';
comment on column AC_PRJ_INVESTMENT.investamount
  is '投资总额';
comment on column AC_PRJ_INVESTMENT.plannedamount
  is '投资计划总额';
comment on column AC_PRJ_INVESTMENT.actualamount
  is '实际已完成投资';
comment on column AC_PRJ_INVESTMENT.estimateinvestment
  is '估算投资额';
comment on column AC_PRJ_INVESTMENT.budgetaryinvestment
  is '概算投资额';
comment on column AC_PRJ_INVESTMENT.contractcode
  is '合同代码';
comment on column AC_PRJ_INVESTMENT.contractname
  is '合同名称';
comment on column AC_PRJ_INVESTMENT.description
  is '操作描述';
comment on column AC_PRJ_INVESTMENT.creator_id
  is '创建者id';
comment on column AC_PRJ_INVESTMENT.creator
  is '创建者';
comment on column AC_PRJ_INVESTMENT.create_date
  is '创建日期';
comment on column AC_PRJ_INVESTMENT.modifiedby
  is '修改人';
comment on column AC_PRJ_INVESTMENT.modifiedby_id
  is '修改人id';
comment on column AC_PRJ_INVESTMENT.modified_date
  is '修改日期';
comment on column AC_PRJ_INVESTMENT.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_PRJ_INVESTMENT.version
  is '版本号';
comment on column AC_PRJ_INVESTMENT.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_PRJ_INVESTMENT.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_PRJ_INVESTMENT.bus_date
  is '业务日期';
comment on column AC_PRJ_INVESTMENT.exa_remarks
  is '审批备注';
comment on column AC_PRJ_INVESTMENT.src_table
  is '来源表';
comment on column AC_PRJ_INVESTMENT.src_system
  is '来源系统';
comment on column AC_PRJ_INVESTMENT.sort_id
  is '排序字段';

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
  is '土地经营类项目信息';
comment on column AC_PRJ_LANDPRJ.project_id
  is '项目号';
comment on column AC_PRJ_LANDPRJ.project_code
  is '项目编码';
comment on column AC_PRJ_LANDPRJ.project_name
  is '项目名称';
comment on column AC_PRJ_LANDPRJ.projectsetuptime
  is '立项时间';
comment on column AC_PRJ_LANDPRJ.approvefile
  is '立项批文';
comment on column AC_PRJ_LANDPRJ.approveunit
  is '立项批复单位';
comment on column AC_PRJ_LANDPRJ.projectstatus
  is '项目状态名称';
comment on column AC_PRJ_LANDPRJ.projectstatuscode
  is '项目状态';
comment on column AC_PRJ_LANDPRJ.projecttype
  is '项目类型名称';
comment on column AC_PRJ_LANDPRJ.projecttypecode
  is '项目类型';
comment on column AC_PRJ_LANDPRJ.targetbegintime
  is '计划开始日期';
comment on column AC_PRJ_LANDPRJ.targetendtime
  is '计划结束日期';
comment on column AC_PRJ_LANDPRJ.neworcontinued
  is '新建/续建';
comment on column AC_PRJ_LANDPRJ.actbegintime
  is '实际开始时间';
comment on column AC_PRJ_LANDPRJ.actendtime
  is '实际完成日期';
comment on column AC_PRJ_LANDPRJ.investamount
  is '总投资额';
comment on column AC_PRJ_LANDPRJ.investamountyear
  is '本年投资额';
comment on column AC_PRJ_LANDPRJ.projectscale
  is '建设规模';
comment on column AC_PRJ_LANDPRJ.projectcontent
  is '建设内容';
comment on column AC_PRJ_LANDPRJ.projectaddr
  is '项目地址';
comment on column AC_PRJ_LANDPRJ.projecteps
  is '项目EPS';
comment on column AC_PRJ_LANDPRJ.responsibleteam
  is '责任团队';
comment on column AC_PRJ_LANDPRJ.desctext
  is '备注';
comment on column AC_PRJ_LANDPRJ.role
  is '项目角色';
comment on column AC_PRJ_LANDPRJ.unitcode
  is '单位代码';
comment on column AC_PRJ_LANDPRJ.unitname
  is '单位名称';
comment on column AC_PRJ_LANDPRJ.contactperson
  is '联系人';
comment on column AC_PRJ_LANDPRJ.land_code
  is '地块编码';
comment on column AC_PRJ_LANDPRJ.land_name
  is '地块名称';
comment on column AC_PRJ_LANDPRJ.land_finishdate
  is '设计完成时间';
comment on column AC_PRJ_LANDPRJ.land_type
  is '地块类型';
comment on column AC_PRJ_LANDPRJ.land_realarrivesate
  is '实际达到状态';
comment on column AC_PRJ_LANDPRJ.changereason
  is '项目变更原因';
comment on column AC_PRJ_LANDPRJ.changedate
  is '变更时间';
comment on column AC_PRJ_LANDPRJ.changeamount
  is '变更金额';
comment on column AC_PRJ_LANDPRJ.buyredline54coord
  is '征地红线图及坐标（54坐标系）';
comment on column AC_PRJ_LANDPRJ.buyredline80coord
  is '征地红线图及坐标（80坐标系）';
comment on column AC_PRJ_LANDPRJ.isredclaim
  is '是否超红线理赔';
comment on column AC_PRJ_LANDPRJ.claimscope
  is '理赔范围图';
comment on column AC_PRJ_LANDPRJ.ownerunit
  is '业主单位';
comment on column AC_PRJ_LANDPRJ.prjunit
  is '立项单位';
comment on column AC_PRJ_LANDPRJ.land_description
  is '用地概况';
comment on column AC_PRJ_LANDPRJ.planprice
  is '计划单价';
comment on column AC_PRJ_LANDPRJ.plantotalamout
  is '计划总金额';
comment on column AC_PRJ_LANDPRJ.claimfinishdate
  is '征地理赔完成时间';
comment on column AC_PRJ_LANDPRJ.referdate
  is '交地时间';
comment on column AC_PRJ_LANDPRJ.approvenum
  is '地块批准文号';
comment on column AC_PRJ_LANDPRJ.approvedate
  is '地块批文时间';
comment on column AC_PRJ_LANDPRJ.buyarea_mu
  is '地块本次征地面积(亩)';
comment on column AC_PRJ_LANDPRJ.buyarea_square
  is '地块本次征地面积（平方米）';
comment on column AC_PRJ_LANDPRJ.payoffprj
  is '征地支出项目';
comment on column AC_PRJ_LANDPRJ.makeprjnum
  is '造地项目编号';
comment on column AC_PRJ_LANDPRJ.makeprjcode
  is '造地项目名称';
comment on column AC_PRJ_LANDPRJ.contamount
  is '合同金额';
comment on column AC_PRJ_LANDPRJ.prjperiod
  is '工程工期';
comment on column AC_PRJ_LANDPRJ.conttotalamount
  is '合同结算金额';
comment on column AC_PRJ_LANDPRJ.estimatequantity
  is '预计工程量';
comment on column AC_PRJ_LANDPRJ.coverstonebuyprice
  is '填方区购土石方单价';
comment on column AC_PRJ_LANDPRJ.coverestimatetotalcost
  is '填方区预计总成本';
comment on column AC_PRJ_LANDPRJ.digestimatetotalcost
  is '挖方区预计总成本';
comment on column AC_PRJ_LANDPRJ.performancebond
  is '履约保证金';
comment on column AC_PRJ_LANDPRJ.emergencybond
  is '安全应急金';
comment on column AC_PRJ_LANDPRJ.constructionunit
  is '施工单位';
comment on column AC_PRJ_LANDPRJ.digareanum
  is '挖方区区域编号';
comment on column AC_PRJ_LANDPRJ.diglandnum
  is '挖方区地块编号';
comment on column AC_PRJ_LANDPRJ.expectedigarea
  is '预计挖方区面积';
comment on column AC_PRJ_LANDPRJ.coverareanum
  is '填方区区域编号';
comment on column AC_PRJ_LANDPRJ.coverlandnum
  is '填方区地块编号';
comment on column AC_PRJ_LANDPRJ.expectecoverarea
  is '预计填方区面积';
comment on column AC_PRJ_LANDPRJ.description
  is '操作描述';
comment on column AC_PRJ_LANDPRJ.creator_id
  is '创建者id';
comment on column AC_PRJ_LANDPRJ.creator
  is '创建者';
comment on column AC_PRJ_LANDPRJ.create_date
  is '创建日期';
comment on column AC_PRJ_LANDPRJ.modifiedby
  is '修改人';
comment on column AC_PRJ_LANDPRJ.modifiedby_id
  is '修改人id';
comment on column AC_PRJ_LANDPRJ.modified_date
  is '修改日期';
comment on column AC_PRJ_LANDPRJ.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_PRJ_LANDPRJ.version
  is '版本号';
comment on column AC_PRJ_LANDPRJ.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_PRJ_LANDPRJ.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_PRJ_LANDPRJ.bus_date
  is '业务日期';
comment on column AC_PRJ_LANDPRJ.exa_remarks
  is '审批备注';
comment on column AC_PRJ_LANDPRJ.src_table
  is '来源表';
comment on column AC_PRJ_LANDPRJ.src_system
  is '来源系统';
comment on column AC_PRJ_LANDPRJ.sort_id
  is '排序字段';

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
  is '其他项目基本信息';
comment on column AC_PRJ_OTHERBASEINFO.projectcode
  is '项目编码';
comment on column AC_PRJ_OTHERBASEINFO.projectname
  is '项目名称';
comment on column AC_PRJ_OTHERBASEINFO.projectsetuptime
  is '立项时间';
comment on column AC_PRJ_OTHERBASEINFO.approvefile
  is '立项批文';
comment on column AC_PRJ_OTHERBASEINFO.approveunit
  is '立项批复单位';
comment on column AC_PRJ_OTHERBASEINFO.projectstatus
  is '项目状态名称';
comment on column AC_PRJ_OTHERBASEINFO.projectstatuscode
  is '项目状态';
comment on column AC_PRJ_OTHERBASEINFO.projecttype
  is '项目类型名称';
comment on column AC_PRJ_OTHERBASEINFO.projecttypecode
  is '项目类型';
comment on column AC_PRJ_OTHERBASEINFO.targetbegintime
  is '计划开始日期';
comment on column AC_PRJ_OTHERBASEINFO.targetendtime
  is '计划结束日期';
comment on column AC_PRJ_OTHERBASEINFO.neworcontinued
  is '新建/续建';
comment on column AC_PRJ_OTHERBASEINFO.actbegintime
  is '实际开始时间';
comment on column AC_PRJ_OTHERBASEINFO.actendtime
  is '实际完成日期';
comment on column AC_PRJ_OTHERBASEINFO.investamount
  is '总投资额';
comment on column AC_PRJ_OTHERBASEINFO.investamountyear
  is '本年投资额';
comment on column AC_PRJ_OTHERBASEINFO.projectscale
  is '建设规模';
comment on column AC_PRJ_OTHERBASEINFO.projectcontent
  is '建设内容';
comment on column AC_PRJ_OTHERBASEINFO.projectaddr
  is '项目地址';
comment on column AC_PRJ_OTHERBASEINFO.responsibleteam
  is '责任团队';
comment on column AC_PRJ_OTHERBASEINFO.desctext
  is '备注';
comment on column AC_PRJ_OTHERBASEINFO.suppcode
  is '供应商代码';
comment on column AC_PRJ_OTHERBASEINFO.suppname
  is '供应商名称';
comment on column AC_PRJ_OTHERBASEINFO.suppcontacts
  is '供应商联系人';
comment on column AC_PRJ_OTHERBASEINFO.description
  is '操作描述';
comment on column AC_PRJ_OTHERBASEINFO.creator_id
  is '创建者id';
comment on column AC_PRJ_OTHERBASEINFO.creator
  is '创建者';
comment on column AC_PRJ_OTHERBASEINFO.create_date
  is '创建日期';
comment on column AC_PRJ_OTHERBASEINFO.modifiedby
  is '修改人';
comment on column AC_PRJ_OTHERBASEINFO.modifiedby_id
  is '修改人id';
comment on column AC_PRJ_OTHERBASEINFO.modified_date
  is '修改日期';
comment on column AC_PRJ_OTHERBASEINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_PRJ_OTHERBASEINFO.version
  is '版本号';
comment on column AC_PRJ_OTHERBASEINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_PRJ_OTHERBASEINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_PRJ_OTHERBASEINFO.bus_date
  is '业务日期';
comment on column AC_PRJ_OTHERBASEINFO.exa_remarks
  is '审批备注';
comment on column AC_PRJ_OTHERBASEINFO.src_table
  is '来源实体';
comment on column AC_PRJ_OTHERBASEINFO.src_system
  is '来源系统';
comment on column AC_PRJ_OTHERBASEINFO.sort_id
  is '排序字段';

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
  is '供科目基本信息表';
comment on column AC_SBJ_INFO.sbjcode
  is '科目编码';
comment on column AC_SBJ_INFO.sbjtype
  is '科目类型';
comment on column AC_SBJ_INFO.englishname
  is '英文_名称';
comment on column AC_SBJ_INFO.schinesename
  is '简体中文_名称';
comment on column AC_SBJ_INFO.tchinesename
  is '繁体中文_名称';
comment on column AC_SBJ_INFO.parentsbjcode
  is '父科目编码';
comment on column AC_SBJ_INFO.ctrllevel_quote
  is '控制级次（引用用）';
comment on column AC_SBJ_INFO.ctrllevel_distribution
  is '控制级次（分配用）';
comment on column AC_SBJ_INFO.mnemoniccode
  is '助记码';
comment on column AC_SBJ_INFO.balancedirectionid
  is '余额方向';
comment on column AC_SBJ_INFO.currencyaccounting
  is '币别核算';
comment on column AC_SBJ_INFO.currencycode
  is '币别编码';
comment on column AC_SBJ_INFO.finalcurrencyid
  is '期末调汇';
comment on column AC_SBJ_INFO.isjournalid
  is '是否出日记账';
comment on column AC_SBJ_INFO.iscashid
  is '是否现金科目';
comment on column AC_SBJ_INFO.isbankid
  is '是否银行科目';
comment on column AC_SBJ_INFO.iscashequalid
  is '是否现金等价物';
comment on column AC_SBJ_INFO.isnumaccountingid
  is '科目编码';
comment on column AC_SBJ_INFO.groupcoding
  is '计量单位组编码';
comment on column AC_SBJ_INFO.unitcode
  is '计量单位编码';
comment on column AC_SBJ_INFO.noticesid
  is '往来通知';
comment on column AC_SBJ_INFO.currentverificationid
  is '往来核销';
comment on column AC_SBJ_INFO.cusbjtype
  is '本级CU本级科目辅助账类型';
comment on column AC_SBJ_INFO.cuauxiliarytype
  is '上级CU辅助账类型';
comment on column AC_SBJ_INFO.sbjauxiliarytype
  is '上级科目辅助账类型';
comment on column AC_SBJ_INFO.losttype
  is '损益类型';
comment on column AC_SBJ_INFO.bectrlsys
  is '受控系统';
comment on column AC_SBJ_INFO.customattributes
  is '科目自定义属性';
comment on column AC_SBJ_INFO.isaddbelowsbj_quote
  is '能否增加下级科目（引用用）';
comment on column AC_SBJ_INFO.isaddbelowsbj_distribution
  is '能否增加下级科目（分配用）';
comment on column AC_SBJ_INFO.ispcuinvalidid
  is '上级CU是否禁用';
comment on column AC_SBJ_INFO.iscuinvalidid
  is '本级CU是否禁用';
comment on column AC_SBJ_INFO.sbjinvalidid
  is '本级科目禁用';
comment on column AC_SBJ_INFO.psbjinvalidid
  is '父科目禁用';
comment on column AC_SBJ_INFO.creater
  is '创建人编码';
comment on column AC_SBJ_INFO.createdate
  is '创建时间';
comment on column AC_SBJ_INFO.isoutsidesbjid
  is '是否表外科目';
comment on column AC_SBJ_INFO.mastertableprj
  is '主表项目';
comment on column AC_SBJ_INFO.scheduleproject
  is '附表项目';
comment on column AC_SBJ_INFO.description
  is '操作描述';
comment on column AC_SBJ_INFO.creator_id
  is '创建者id';
comment on column AC_SBJ_INFO.creator
  is '创建者';
comment on column AC_SBJ_INFO.create_date
  is '创建日期';
comment on column AC_SBJ_INFO.modifiedby
  is '修改人';
comment on column AC_SBJ_INFO.modifiedby_id
  is '修改人id';
comment on column AC_SBJ_INFO.modified_date
  is '修改日期';
comment on column AC_SBJ_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_SBJ_INFO.version
  is '版本号';
comment on column AC_SBJ_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_SBJ_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_SBJ_INFO.bus_date
  is '业务日期';
comment on column AC_SBJ_INFO.exa_remarks
  is '审批备注';
comment on column AC_SBJ_INFO.src_system
  is '来源系统';
comment on column AC_SBJ_INFO.sort_id
  is '排序字段';

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
  is '供应商基本信息表';
comment on column AC_SUPP_INFO.suppcode
  is '供应商代码';
comment on column AC_SUPP_INFO.suppname
  is '供应商名称';
comment on column AC_SUPP_INFO.unitrole
  is '单位角色';
comment on column AC_SUPP_INFO.legalperson
  is '法人代表';
comment on column AC_SUPP_INFO.unitnature
  is '单位性质';
comment on column AC_SUPP_INFO.provincecity
  is '所在省市';
comment on column AC_SUPP_INFO.regeditaddress
  is '注册地址';
comment on column AC_SUPP_INFO.bank
  is '开户银行';
comment on column AC_SUPP_INFO.bankaccount
  is '银行账号';
comment on column AC_SUPP_INFO.bussinesslicence
  is '营业执照号';
comment on column AC_SUPP_INFO.whichindustry
  is '所属行业';
comment on column AC_SUPP_INFO.orgcode
  is '组织机构代码证';
comment on column AC_SUPP_INFO.areataxnum
  is '地税登记号';
comment on column AC_SUPP_INFO.nationtaxnum
  is '国税登记号';
comment on column AC_SUPP_INFO.address
  is '通讯地址';
comment on column AC_SUPP_INFO.postalcode
  is '邮政编码';
comment on column AC_SUPP_INFO.phone
  is '电话号码';
comment on column AC_SUPP_INFO.fax
  is '传真号码';
comment on column AC_SUPP_INFO.email
  is '电子邮件';
comment on column AC_SUPP_INFO.homepage
  is '公司主页';
comment on column AC_SUPP_INFO.supp_description
  is '公司简介';
comment on column AC_SUPP_INFO.status
  is '供应商状态/审核状态';
comment on column AC_SUPP_INFO.ispassiso
  is '是否通过ISO';
comment on column AC_SUPP_INFO.unitcredit
  is '单位资信';
comment on column AC_SUPP_INFO.regeditcapital
  is '注册资本';
comment on column AC_SUPP_INFO.assetscapital
  is '固定资产';
comment on column AC_SUPP_INFO.flowcapital
  is '流动资金';
comment on column AC_SUPP_INFO.yearsellamount
  is '年销售额';
comment on column AC_SUPP_INFO.fatorynum
  is '工厂数量';
comment on column AC_SUPP_INFO.fatoryaddress
  is '工厂地址';
comment on column AC_SUPP_INFO.fatoryphone
  is '工厂电话';
comment on column AC_SUPP_INFO.prjfax
  is '工程传真';
comment on column AC_SUPP_INFO.employeenum
  is '公司员工总数';
comment on column AC_SUPP_INFO.technicalstaffnum
  is '技术人员数量';
comment on column AC_SUPP_INFO.managementstaffnum
  is '管理人员数量';
comment on column AC_SUPP_INFO.suppcertification
  is '供应商资质';
comment on column AC_SUPP_INFO.suppothercertification
  is '供应商其他专业资';
comment on column AC_SUPP_INFO.productcode
  is '产品代码';
comment on column AC_SUPP_INFO.productname
  is '产品名称';
comment on column AC_SUPP_INFO.productusage
  is '产品使用情况';
comment on column AC_SUPP_INFO.specification
  is '规格';
comment on column AC_SUPP_INFO.model
  is '型号';
comment on column AC_SUPP_INFO.budgetprice
  is '预算价格';
comment on column AC_SUPP_INFO.purchaseadvance
  is '采购提前期';
comment on column AC_SUPP_INFO.arrivaladvance
  is '到货提前期';
comment on column AC_SUPP_INFO.purchasecycle
  is 'PurchaseCycle';
comment on column AC_SUPP_INFO.feetype
  is '费用类别';
comment on column AC_SUPP_INFO.emp_code
  is '人员编号';
comment on column AC_SUPP_INFO.emp_name
  is '姓名';
comment on column AC_SUPP_INFO.emp_cardcode
  is '工号';
comment on column AC_SUPP_INFO.emp_sex
  is '性别';
comment on column AC_SUPP_INFO.emp_job
  is '职务';
comment on column AC_SUPP_INFO.emp_title
  is '职称';
comment on column AC_SUPP_INFO.emp_dept
  is '部门信息';
comment on column AC_SUPP_INFO.emp_call
  is '称呼';
comment on column AC_SUPP_INFO.emp_role
  is '角色';
comment on column AC_SUPP_INFO.emp_phone
  is '办公电话';
comment on column AC_SUPP_INFO.emp_fax
  is '传真';
comment on column AC_SUPP_INFO.emp_email
  is '电子邮件';
comment on column AC_SUPP_INFO.emp_address
  is '地址';
comment on column AC_SUPP_INFO.emp_postcode
  is '邮政编码';
comment on column AC_SUPP_INFO.emp_mobile
  is '移动电话';
comment on column AC_SUPP_INFO.emp_homecall
  is '家庭电话';
comment on column AC_SUPP_INFO.description
  is '操作描述';
comment on column AC_SUPP_INFO.creator_id
  is '创建者id';
comment on column AC_SUPP_INFO.creator
  is '创建者';
comment on column AC_SUPP_INFO.create_date
  is '创建日期';
comment on column AC_SUPP_INFO.modifiedby
  is '修改人';
comment on column AC_SUPP_INFO.modifiedby_id
  is '修改人id';
comment on column AC_SUPP_INFO.modified_date
  is '修改日期';
comment on column AC_SUPP_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column AC_SUPP_INFO.version
  is '版本号';
comment on column AC_SUPP_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column AC_SUPP_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column AC_SUPP_INFO.bus_date
  is '业务日期';
comment on column AC_SUPP_INFO.exa_remarks
  is '审批备注';
comment on column AC_SUPP_INFO.src_system
  is '来源系统';
comment on column AC_SUPP_INFO.sort_id
  is '排序字段';

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
  is '房屋销售合同表';
comment on column CONT_BUILDINGSSELL.id
  is 'ID';
comment on column CONT_BUILDINGSSELL.sid
  is '原系统ID';
comment on column CONT_BUILDINGSSELL.contid
  is 'ContID';
comment on column CONT_BUILDINGSSELL.stockcontid
  is '合同编号2';
comment on column CONT_BUILDINGSSELL.landlinencename
  is '建设用地规划许可证名称';
comment on column CONT_BUILDINGSSELL.landlinencecode
  is '建设用地规划许可证编号';
comment on column CONT_BUILDINGSSELL.landlinencearea
  is '建设用地规划许可证面积';
comment on column CONT_BUILDINGSSELL.landlinenceunit
  is '建设用地规划许可证发证单位';
comment on column CONT_BUILDINGSSELL.landlinencedate
  is '建设用地规划许可证日期';
comment on column CONT_BUILDINGSSELL.prjplanlinencename
  is '建设工程规划许可证名称';
comment on column CONT_BUILDINGSSELL.prjplanlinencecode
  is '建设工程规划许可证编号';
comment on column CONT_BUILDINGSSELL.prjplanlinencearea
  is '建设工程规划许可证面积';
comment on column CONT_BUILDINGSSELL.prjplanlinenceunit
  is '建设工程规划许可证发证单位';
comment on column CONT_BUILDINGSSELL.prjplanlinencedate
  is '建设工程规划许可证日期';
comment on column CONT_BUILDINGSSELL.prjplanlinenceperiod
  is '建设工程规划许可证年限';
comment on column CONT_BUILDINGSSELL.prjconstlinence
  is '建筑工程施工许可证';
comment on column CONT_BUILDINGSSELL.prjconstlinencecunit
  is '建筑工程施工发证单位';
comment on column CONT_BUILDINGSSELL.prjconstlinencedate
  is '建筑工程施工发证日期';
comment on column CONT_BUILDINGSSELL.prjconstlinenceunit
  is '建筑工程施工单位';
comment on column CONT_BUILDINGSSELL.landusecertificate
  is '土地使用证';
comment on column CONT_BUILDINGSSELL.landuseperiod
  is '土地使用年限';
comment on column CONT_BUILDINGSSELL.landcertificatenum
  is '土地证编号';
comment on column CONT_BUILDINGSSELL.landdevelopusing
  is '土地开发用途';
comment on column CONT_BUILDINGSSELL.landusecertificatearea
  is '土地使用证土地面积';
comment on column CONT_BUILDINGSSELL.landusecertificatecunit
  is '土地使用证发证单位';
comment on column CONT_BUILDINGSSELL.preselllinence
  is '商品房预售许可证';
comment on column CONT_BUILDINGSSELL.preselllinenceperiod
  is '预售许可日期';
comment on column CONT_BUILDINGSSELL.preselllinenceunit
  is '商品房预售发证单位';
comment on column CONT_BUILDINGSSELL.presellprojectname
  is '预售项目名称';
comment on column CONT_BUILDINGSSELL.presellprojectaddress
  is '预售项目地址';
comment on column CONT_BUILDINGSSELL.presellprojectusing
  is '预售房屋用途';
comment on column CONT_BUILDINGSSELL.presellobjectid
  is '预售对象ID';
comment on column CONT_BUILDINGSSELL.presellobject
  is '预售对象';
comment on column CONT_BUILDINGSSELL.presellnumber
  is '预售套数';
comment on column CONT_BUILDINGSSELL.preselltotalarea
  is '预售总面积';
comment on column CONT_BUILDINGSSELL.projectareas
  is '项目所在区域';
comment on column CONT_BUILDINGSSELL.projectlandlevel
  is '项目用地等级';
comment on column CONT_BUILDINGSSELL.developunit
  is '开发公司';
comment on column CONT_BUILDINGSSELL.unitcharater
  is '单位性质';
comment on column CONT_BUILDINGSSELL.unitaddress
  is '公司地址';
comment on column CONT_BUILDINGSSELL.legalperson
  is '法人代表';
comment on column CONT_BUILDINGSSELL.projectmanager
  is '项目负责人';
comment on column CONT_BUILDINGSSELL.contactphone
  is '联系电话';
comment on column CONT_BUILDINGSSELL.capitalregulationbank
  is '资金监管银行';
comment on column CONT_BUILDINGSSELL.capitalregulationaccount
  is '资金监管账号';
comment on column CONT_BUILDINGSSELL.buildingname
  is '楼盘名称';
comment on column CONT_BUILDINGSSELL.buildingnumber
  is '幢号';
comment on column CONT_BUILDINGSSELL.buildingunitnumber
  is '单元号';
comment on column CONT_BUILDINGSSELL.housenumber
  is '房号';
comment on column CONT_BUILDINGSSELL.housecode
  is '房屋编号';
comment on column CONT_BUILDINGSSELL.contructionarea
  is '建筑面积';
comment on column CONT_BUILDINGSSELL.publicarea
  is '公推面积';
comment on column CONT_BUILDINGSSELL.privatearea
  is '套内面积';
comment on column CONT_BUILDINGSSELL.huxingid
  is '户型ID';
comment on column CONT_BUILDINGSSELL.huxing
  is '户型';
comment on column CONT_BUILDINGSSELL.toiletid
  is '卫生间ID';
comment on column CONT_BUILDINGSSELL.toilet
  is '卫生间';
comment on column CONT_BUILDINGSSELL.balconyid
  is '阳台ID';
comment on column CONT_BUILDINGSSELL.balcony
  is '阳台';
comment on column CONT_BUILDINGSSELL.propertytypeid
  is '物业类型ID';
comment on column CONT_BUILDINGSSELL.propertytype
  is '物业类型';
comment on column CONT_BUILDINGSSELL.preselltotalamount
  is '预售总金额';
comment on column CONT_BUILDINGSSELL.housestatus
  is '房屋状态';
comment on column CONT_BUILDINGSSELL.wherehouse
  is '房屋坐落';
comment on column CONT_BUILDINGSSELL.whencreate
  is '建成年份';
comment on column CONT_BUILDINGSSELL.structure
  is '结构';
comment on column CONT_BUILDINGSSELL.bulidtotalfloots
  is '房屋总层数';
comment on column CONT_BUILDINGSSELL.floots
  is '所在层数';
comment on column CONT_BUILDINGSSELL.housecharaterid
  is '房屋性质ID';
comment on column CONT_BUILDINGSSELL.housecharater
  is '房屋性质';
comment on column CONT_BUILDINGSSELL.flootheight
  is '层高';
comment on column CONT_BUILDINGSSELL.sellername
  is '卖方名称';
comment on column CONT_BUILDINGSSELL.bussinesslinence
  is '营业执照号';
comment on column CONT_BUILDINGSSELL.sellerlegalperson
  is '卖方法人代表';
comment on column CONT_BUILDINGSSELL.authorizeperson
  is '法人代表';
comment on column CONT_BUILDINGSSELL.certificationlevel
  is '授权代表';
comment on column CONT_BUILDINGSSELL.sellercontactphone
  is '资质等级';
comment on column CONT_BUILDINGSSELL.isclient
  is '联系电话';
comment on column CONT_BUILDINGSSELL.clientname
  is '联系电话';
comment on column CONT_BUILDINGSSELL.clientlegalperson
  is '是否委托代理';
comment on column CONT_BUILDINGSSELL.sellercontactaddress
  is '委托代理人名称';
comment on column CONT_BUILDINGSSELL.sellerbank
  is '委托代理人法人代表';
comment on column CONT_BUILDINGSSELL.sellerbankaccount
  is '卖方联系地址';
comment on column CONT_BUILDINGSSELL.buyername
  is '卖方开户行';
comment on column CONT_BUILDINGSSELL.buyername2
  is '卖方开户行帐号';
comment on column CONT_BUILDINGSSELL.buyercertification
  is '买方姓名';
comment on column CONT_BUILDINGSSELL.certificationnum
  is '买方姓名（共有权人）';
comment on column CONT_BUILDINGSSELL.buyercontactphone
  is '买方证件';
comment on column CONT_BUILDINGSSELL.buyercontactaddress
  is '证件号码';
comment on column CONT_BUILDINGSSELL.buyersex
  is '买方联系电话';
comment on column CONT_BUILDINGSSELL.buyernationality
  is '买方联系地址';
comment on column CONT_BUILDINGSSELL.buyernation
  is '买方姓别';
comment on column CONT_BUILDINGSSELL.payoffmode
  is '买方国籍';
comment on column CONT_BUILDINGSSELL.contcode
  is '买方民族';
comment on column CONT_BUILDINGSSELL.contracttime
  is '付款方式';
comment on column CONT_BUILDINGSSELL.contbackuptime
  is '合同编号';
comment on column CONT_BUILDINGSSELL.firstpay
  is '合同签订时间';
comment on column CONT_BUILDINGSSELL.firstpayratio
  is '合同备案时间';
comment on column CONT_BUILDINGSSELL.loanamount
  is '首付款额';
comment on column CONT_BUILDINGSSELL.loanperiod
  is '首付款比例';
comment on column CONT_BUILDINGSSELL.fundloan
  is '贷款额度';
comment on column CONT_BUILDINGSSELL.bussinessloan
  is '贷款年限';
comment on column CONT_BUILDINGSSELL.paymentaccount
  is '公积金贷款';
comment on column CONT_BUILDINGSSELL.accountbank
  is '商业贷款';
comment on column CONT_BUILDINGSSELL.sellprice
  is '还款帐户';
comment on column CONT_BUILDINGSSELL.selltotalamount
  is '开户银行';
comment on column CONT_BUILDINGSSELL.areasupplement
  is '销售单价';
comment on column CONT_BUILDINGSSELL.getintime
  is '销售总价';
comment on column CONT_BUILDINGSSELL.propertyfeestandand
  is '面积补差';
comment on column CONT_BUILDINGSSELL.propertyunitname
  is '入伙时间';
comment on column CONT_BUILDINGSSELL.propertylegalperson
  is '物业费标准';
comment on column CONT_BUILDINGSSELL.propertybussinessnum
  is '物业公司名称';
comment on column CONT_BUILDINGSSELL.propertycertificationlevel
  is '物业公司法人代表';
comment on column CONT_BUILDINGSSELL.propertymanagementperiod
  is '营业执照号';
comment on column CONT_BUILDINGSSELL.createpersonid
  is '营业执照号';
comment on column CONT_BUILDINGSSELL.createperson
  is '资质等级';
comment on column CONT_BUILDINGSSELL.createtime
  is '资质等级';
comment on column CONT_BUILDINGSSELL.sbjstate
  is '物业管理合同期限';
comment on column CONT_BUILDINGSSELL.description
  is '操作描述';
comment on column CONT_BUILDINGSSELL.creator_id
  is '创建者id';
comment on column CONT_BUILDINGSSELL.creator
  is '创建者';
comment on column CONT_BUILDINGSSELL.create_date
  is '创建日期';
comment on column CONT_BUILDINGSSELL.modifiedby
  is '修改人';
comment on column CONT_BUILDINGSSELL.modifiedby_id
  is '修改人id';
comment on column CONT_BUILDINGSSELL.modified_date
  is '修改日期';
comment on column CONT_BUILDINGSSELL.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CONT_BUILDINGSSELL.version
  is '版本号';
comment on column CONT_BUILDINGSSELL.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column CONT_BUILDINGSSELL.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column CONT_BUILDINGSSELL.bus_date
  is '业务日期';
comment on column CONT_BUILDINGSSELL.exa_remarks
  is '审批备注';

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
  is '支付明细表';
comment on column CONT_BUYLANDPAYOFFDETAIL.id
  is 'ID';
comment on column CONT_BUYLANDPAYOFFDETAIL.sid
  is '原系统ID';
comment on column CONT_BUYLANDPAYOFFDETAIL.buyinfoid
  is 'BuyInfoId';
comment on column CONT_BUYLANDPAYOFFDETAIL.areanum
  is '区域编号';
comment on column CONT_BUYLANDPAYOFFDETAIL.landnum
  is '地块编号';
comment on column CONT_BUYLANDPAYOFFDETAIL.area
  is '面积';
comment on column CONT_BUYLANDPAYOFFDETAIL.planpayoff
  is '计划支付金额';
comment on column CONT_BUYLANDPAYOFFDETAIL.landtype
  is '土地类型';
comment on column CONT_BUYLANDPAYOFFDETAIL.payoffitem
  is '支出项目';
comment on column CONT_BUYLANDPAYOFFDETAIL.nowpayoff
  is '本次支出金额';
comment on column CONT_BUYLANDPAYOFFDETAIL.totalpayoff
  is '累计支出金额';
comment on column CONT_BUYLANDPAYOFFDETAIL.description
  is '操作描述';
comment on column CONT_BUYLANDPAYOFFDETAIL.creator_id
  is '创建者id';
comment on column CONT_BUYLANDPAYOFFDETAIL.creator
  is '创建者';
comment on column CONT_BUYLANDPAYOFFDETAIL.create_date
  is '创建日期';
comment on column CONT_BUYLANDPAYOFFDETAIL.modifiedby
  is '修改人';
comment on column CONT_BUYLANDPAYOFFDETAIL.modifiedby_id
  is '修改人id';
comment on column CONT_BUYLANDPAYOFFDETAIL.modified_date
  is '修改日期';
comment on column CONT_BUYLANDPAYOFFDETAIL.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CONT_BUYLANDPAYOFFDETAIL.version
  is '版本号';
comment on column CONT_BUYLANDPAYOFFDETAIL.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column CONT_BUYLANDPAYOFFDETAIL.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column CONT_BUYLANDPAYOFFDETAIL.bus_date
  is '业务日期';
comment on column CONT_BUYLANDPAYOFFDETAIL.exa_remarks
  is '审批备注';

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
  is '征地支付信息表';
comment on column CONT_BUYLANDPAYOFFINFO.id
  is 'ID';
comment on column CONT_BUYLANDPAYOFFINFO.sid
  is '原系统ID';
comment on column CONT_BUYLANDPAYOFFINFO.edetailid
  is 'EDetailID';
comment on column CONT_BUYLANDPAYOFFINFO.approvenum
  is '批准文号';
comment on column CONT_BUYLANDPAYOFFINFO.approvedate
  is '批准时间';
comment on column CONT_BUYLANDPAYOFFINFO.prjcode
  is '项目编号';
comment on column CONT_BUYLANDPAYOFFINFO.prjname
  is '项目名称';
comment on column CONT_BUYLANDPAYOFFINFO.ownerunit
  is '业主单位';
comment on column CONT_BUYLANDPAYOFFINFO.createrunit
  is '立项单位';
comment on column CONT_BUYLANDPAYOFFINFO.payofflimit
  is '支出金额';
comment on column CONT_BUYLANDPAYOFFINFO.whichtimes
  is '第_次付款';
comment on column CONT_BUYLANDPAYOFFINFO.description
  is '操作描述';
comment on column CONT_BUYLANDPAYOFFINFO.creator_id
  is '创建者id';
comment on column CONT_BUYLANDPAYOFFINFO.creator
  is '创建者';
comment on column CONT_BUYLANDPAYOFFINFO.create_date
  is '创建日期';
comment on column CONT_BUYLANDPAYOFFINFO.modifiedby
  is '修改人';
comment on column CONT_BUYLANDPAYOFFINFO.modifiedby_id
  is '修改人id';
comment on column CONT_BUYLANDPAYOFFINFO.modified_date
  is '修改日期';
comment on column CONT_BUYLANDPAYOFFINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CONT_BUYLANDPAYOFFINFO.version
  is '版本号';
comment on column CONT_BUYLANDPAYOFFINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column CONT_BUYLANDPAYOFFINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column CONT_BUYLANDPAYOFFINFO.bus_date
  is '业务日期';
comment on column CONT_BUYLANDPAYOFFINFO.exa_remarks
  is '审批备注';

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
  is '合同明细表';
comment on column CONT_DETAIL.id
  is 'ID';
comment on column CONT_DETAIL.sid
  is '原系统ID';
comment on column CONT_DETAIL.contid
  is 'ContID';
comment on column CONT_DETAIL.stockcontid
  is '合同编号';
comment on column CONT_DETAIL.payitemcode
  is '支付项代码';
comment on column CONT_DETAIL.payitemname
  is '支付项名称';
comment on column CONT_DETAIL.contnum
  is '合同数量';
comment on column CONT_DETAIL.contunit
  is '合同单价';
comment on column CONT_DETAIL.contcost
  is '本项费用';
comment on column CONT_DETAIL.contratio
  is '支付系数';
comment on column CONT_DETAIL.processrelationid
  is '进度关联ID';
comment on column CONT_DETAIL.processrelation
  is '进度关联';
comment on column CONT_DETAIL.numctrlid
  is '数量控制ID';
comment on column CONT_DETAIL.numctrl
  is '数量控制';
comment on column CONT_DETAIL.standard
  is '规格';
comment on column CONT_DETAIL.countingunit
  is '计量单位';
comment on column CONT_DETAIL.valuation
  is '履约评价';
comment on column CONT_DETAIL.description
  is '操作描述';
comment on column CONT_DETAIL.creator_id
  is '创建者id';
comment on column CONT_DETAIL.creator
  is '创建者';
comment on column CONT_DETAIL.create_date
  is '创建日期';
comment on column CONT_DETAIL.modifiedby
  is '修改人';
comment on column CONT_DETAIL.modifiedby_id
  is '修改人id';
comment on column CONT_DETAIL.modified_date
  is '修改日期';
comment on column CONT_DETAIL.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CONT_DETAIL.version
  is '版本号';
comment on column CONT_DETAIL.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column CONT_DETAIL.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column CONT_DETAIL.bus_date
  is '业务日期';
comment on column CONT_DETAIL.exa_remarks
  is '审批备注';

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
  is '合同履行情况表';
comment on column CONT_FULFILLMENT.id
  is 'ID';
comment on column CONT_FULFILLMENT.sid
  is '原系统ID';
comment on column CONT_FULFILLMENT.contprjid
  is 'ContPrjID';
comment on column CONT_FULFILLMENT.areadyfinish
  is '已完成量情况';
comment on column CONT_FULFILLMENT.stopworkdays
  is '停工天数';
comment on column CONT_FULFILLMENT.settledamount
  is '已结算金额';
comment on column CONT_FULFILLMENT.trialbalance
  is '初审结算';
comment on column CONT_FULFILLMENT.clearingtime
  is '结算时间';
comment on column CONT_FULFILLMENT.description
  is '操作描述';
comment on column CONT_FULFILLMENT.creator_id
  is '创建者id';
comment on column CONT_FULFILLMENT.creator
  is '创建者';
comment on column CONT_FULFILLMENT.create_date
  is '创建日期';
comment on column CONT_FULFILLMENT.modifiedby
  is '修改人';
comment on column CONT_FULFILLMENT.modifiedby_id
  is '修改人id';
comment on column CONT_FULFILLMENT.modified_date
  is '修改日期';
comment on column CONT_FULFILLMENT.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CONT_FULFILLMENT.version
  is '版本号';
comment on column CONT_FULFILLMENT.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column CONT_FULFILLMENT.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column CONT_FULFILLMENT.bus_date
  is '业务日期';
comment on column CONT_FULFILLMENT.exa_remarks
  is '审批备注';

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
  is '合同基本信息表';
comment on column CONT_INFO.id
  is 'ID ';
comment on column CONT_INFO.sid
  is '原系统ID ';
comment on column CONT_INFO.stockcontid
  is '合同编号 ';
comment on column CONT_INFO.stockcontname
  is '合同名称 ';
comment on column CONT_INFO.conttypeid
  is '合同状态ID ';
comment on column CONT_INFO.conttype
  is '合同状态 ';
comment on column CONT_INFO.stakeholderid
  is '合同甲方ID ';
comment on column CONT_INFO.stakeholder
  is '合同甲方 ';
comment on column CONT_INFO.stakelinkmanid
  is '合同甲方联系人ID ';
comment on column CONT_INFO.stakelinkman
  is '合同甲方联系人 ';
comment on column CONT_INFO.stakesubdate
  is '合同甲方签署日期 ';
comment on column CONT_INFO.stakesignerid
  is '合同甲方签署人ID ';
comment on column CONT_INFO.stakesigner
  is '合同甲方签署人 ';
comment on column CONT_INFO.associatorid
  is '合同乙方ID ';
comment on column CONT_INFO.associator
  is '合同乙方 ';
comment on column CONT_INFO.assoclinkmanid
  is '合同乙方联系人ID ';
comment on column CONT_INFO.assoclinkman
  is '合同乙方联系人 ';
comment on column CONT_INFO.associatedate
  is '合同乙方签署日期 ';
comment on column CONT_INFO.associatesignerid
  is '合同乙方签署人ID ';
comment on column CONT_INFO.associatesigner
  is '合同乙方签署人 ';
comment on column CONT_INFO.associatorid2
  is '合同丙方ID ';
comment on column CONT_INFO.associator2
  is '合同丙方 ';
comment on column CONT_INFO.assoclinkmanid2
  is '合同丙方联系人ID ';
comment on column CONT_INFO.assoclinkman2
  is '合同丙方联系人 ';
comment on column CONT_INFO.associatedate2
  is '合同丙方签署日期 ';
comment on column CONT_INFO.associatesigner2id
  is '合同丙方签署人ID ';
comment on column CONT_INFO.associatesigner2
  is '合同丙方签署人 ';
comment on column CONT_INFO.contacttypeid
  is '合同类别ID ';
comment on column CONT_INFO.contacttype
  is '合同类别 ';
comment on column CONT_INFO.powertree
  is '管理权限树 ';
comment on column CONT_INFO.sendapprovetypeid
  is '送审类别ID ';
comment on column CONT_INFO.sendapprovetype
  is '送审类别 ';
comment on column CONT_INFO.paytypeid
  is '支付项类型ID ';
comment on column CONT_INFO.paytype
  is '支付项类型 ';
comment on column CONT_INFO.contractprice
  is '合同金额 ';
comment on column CONT_INFO.moneytypename
  is '币种名 ';
comment on column CONT_INFO.moneytype
  is '币种 ';
comment on column CONT_INFO.validdate
  is '生效日期 ';
comment on column CONT_INFO.finishdate
  is '完工日期 ';
comment on column CONT_INFO.description
  is '操作描述';
comment on column CONT_INFO.creator_id
  is '创建者id';
comment on column CONT_INFO.creator
  is '创建者';
comment on column CONT_INFO.create_date
  is '创建日期';
comment on column CONT_INFO.modifiedby
  is '修改人';
comment on column CONT_INFO.modifiedby_id
  is '修改人id';
comment on column CONT_INFO.modified_date
  is '修改日期';
comment on column CONT_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CONT_INFO.version
  is '版本号';
comment on column CONT_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column CONT_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column CONT_INFO.bus_date
  is '业务日期';
comment on column CONT_INFO.exa_remarks
  is '审批备注';

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
  is '土地租赁合同表';
comment on column CONT_LANDLEASE.id
  is 'ID';
comment on column CONT_LANDLEASE.sid
  is '原系统ID';
comment on column CONT_LANDLEASE.contid
  is 'ContID';
comment on column CONT_LANDLEASE.stockcontid
  is '合同编号';
comment on column CONT_LANDLEASE.leasename
  is '租赁合同名称';
comment on column CONT_LANDLEASE.propertytypeid
  is '物业类型ID';
comment on column CONT_LANDLEASE.propertytype
  is '物业类型';
comment on column CONT_LANDLEASE.ownership
  is '所有权归属';
comment on column CONT_LANDLEASE.begintime
  is '合同起始日期';
comment on column CONT_LANDLEASE.endtime
  is '合同截止日期';
comment on column CONT_LANDLEASE.usingunit
  is '使用单位';
comment on column CONT_LANDLEASE.legalperson
  is '法定代表人';
comment on column CONT_LANDLEASE.licensenum
  is '营业执照号码';
comment on column CONT_LANDLEASE.contactperson
  is '使用单位联系人';
comment on column CONT_LANDLEASE.contacttel
  is '联系电话';
comment on column CONT_LANDLEASE.constructionarea
  is '建筑面积';
comment on column CONT_LANDLEASE.leaseprice
  is '出租单价';
comment on column CONT_LANDLEASE.remark
  is '备注';
comment on column CONT_LANDLEASE.description
  is '操作描述';
comment on column CONT_LANDLEASE.creator_id
  is '创建者id';
comment on column CONT_LANDLEASE.creator
  is '创建者';
comment on column CONT_LANDLEASE.create_date
  is '创建日期';
comment on column CONT_LANDLEASE.modifiedby
  is '修改人';
comment on column CONT_LANDLEASE.modifiedby_id
  is '修改人id';
comment on column CONT_LANDLEASE.modified_date
  is '修改日期';
comment on column CONT_LANDLEASE.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CONT_LANDLEASE.version
  is '版本号';
comment on column CONT_LANDLEASE.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column CONT_LANDLEASE.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column CONT_LANDLEASE.bus_date
  is '业务日期';
comment on column CONT_LANDLEASE.exa_remarks
  is '审批备注';

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
  is '造地支付挖方区信息';
comment on column CONT_MAKELANDDIGINFO.id
  is 'ID';
comment on column CONT_MAKELANDDIGINFO.sid
  is '原系统ID';
comment on column CONT_MAKELANDDIGINFO.mpayoffid
  is 'MPayOffID';
comment on column CONT_MAKELANDDIGINFO.areanum
  is '挖方区区域编号';
comment on column CONT_MAKELANDDIGINFO.landnum
  is '地块编号';
comment on column CONT_MAKELANDDIGINFO.estimatarea
  is '预计挖方面积';
comment on column CONT_MAKELANDDIGINFO.estimatquantity
  is '预计工程量';
comment on column CONT_MAKELANDDIGINFO.estimatcost
  is '预计成本';
comment on column CONT_MAKELANDDIGINFO.completedquantity
  is '本次完成工程量';
comment on column CONT_MAKELANDDIGINFO.nowpayoff
  is '本次支持金额';
comment on column CONT_MAKELANDDIGINFO.totalpayoff
  is '累计支出金额';
comment on column CONT_MAKELANDDIGINFO.totalquantity
  is '累计完成工程量';
comment on column CONT_MAKELANDDIGINFO.description
  is '操作描述';
comment on column CONT_MAKELANDDIGINFO.creator_id
  is '创建者id';
comment on column CONT_MAKELANDDIGINFO.creator
  is '创建者';
comment on column CONT_MAKELANDDIGINFO.create_date
  is '创建日期';
comment on column CONT_MAKELANDDIGINFO.modifiedby
  is '修改人';
comment on column CONT_MAKELANDDIGINFO.modifiedby_id
  is '修改人id';
comment on column CONT_MAKELANDDIGINFO.modified_date
  is '修改日期';
comment on column CONT_MAKELANDDIGINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CONT_MAKELANDDIGINFO.version
  is '版本号';
comment on column CONT_MAKELANDDIGINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column CONT_MAKELANDDIGINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column CONT_MAKELANDDIGINFO.bus_date
  is '业务日期';
comment on column CONT_MAKELANDDIGINFO.exa_remarks
  is '审批备注';

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
  is '造地支付信息表';
comment on column CONT_MAKELANDPAYOFFINFO.id
  is 'ID';
comment on column CONT_MAKELANDPAYOFFINFO.sid
  is '原系统ID';
comment on column CONT_MAKELANDPAYOFFINFO.edetailid
  is 'EDetailID';
comment on column CONT_MAKELANDPAYOFFINFO.approvenum
  is '批准文号';
comment on column CONT_MAKELANDPAYOFFINFO.approvedate
  is '批准时间';
comment on column CONT_MAKELANDPAYOFFINFO.prjcode
  is '项目编号';
comment on column CONT_MAKELANDPAYOFFINFO.prjname
  is '项目名称';
comment on column CONT_MAKELANDPAYOFFINFO.contractcode
  is '合同编号';
comment on column CONT_MAKELANDPAYOFFINFO.contractamount
  is '合同金额';
comment on column CONT_MAKELANDPAYOFFINFO.projecttimelimit
  is '工程工期';
comment on column CONT_MAKELANDPAYOFFINFO.estimatequantities
  is '预计工程量';
comment on column CONT_MAKELANDPAYOFFINFO.workingunit
  is '施工单位';
comment on column CONT_MAKELANDPAYOFFINFO.isdigpayid
  is '是否挖方区付款ID';
comment on column CONT_MAKELANDPAYOFFINFO.isdigpay
  is '是否挖方区付款';
comment on column CONT_MAKELANDPAYOFFINFO.description
  is '操作描述';
comment on column CONT_MAKELANDPAYOFFINFO.creator_id
  is '创建者id';
comment on column CONT_MAKELANDPAYOFFINFO.creator
  is '创建者';
comment on column CONT_MAKELANDPAYOFFINFO.create_date
  is '创建日期';
comment on column CONT_MAKELANDPAYOFFINFO.modifiedby
  is '修改人';
comment on column CONT_MAKELANDPAYOFFINFO.modifiedby_id
  is '修改人id';
comment on column CONT_MAKELANDPAYOFFINFO.modified_date
  is '修改日期';
comment on column CONT_MAKELANDPAYOFFINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CONT_MAKELANDPAYOFFINFO.version
  is '版本号';
comment on column CONT_MAKELANDPAYOFFINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column CONT_MAKELANDPAYOFFINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column CONT_MAKELANDPAYOFFINFO.bus_date
  is '业务日期';
comment on column CONT_MAKELANDPAYOFFINFO.exa_remarks
  is '审批备注';

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
  is '支付填方区信息表';
comment on column CONT_MCOVERINFO.id
  is 'ID';
comment on column CONT_MCOVERINFO.sid
  is '原系统ID';
comment on column CONT_MCOVERINFO.mpayoffid
  is 'MPayOffID';
comment on column CONT_MCOVERINFO.areanum
  is '填方区区域编号';
comment on column CONT_MCOVERINFO.landnum
  is '填方区地块编号';
comment on column CONT_MCOVERINFO.landname
  is '填方区地块名称';
comment on column CONT_MCOVERINFO.buystonecount
  is '购入土石方量';
comment on column CONT_MCOVERINFO.costamount
  is '成本金额';
comment on column CONT_MCOVERINFO.description
  is '操作描述';
comment on column CONT_MCOVERINFO.creator_id
  is '创建者id';
comment on column CONT_MCOVERINFO.creator
  is '创建者';
comment on column CONT_MCOVERINFO.create_date
  is '创建日期';
comment on column CONT_MCOVERINFO.modifiedby
  is '修改人';
comment on column CONT_MCOVERINFO.modifiedby_id
  is '修改人id';
comment on column CONT_MCOVERINFO.modified_date
  is '修改日期';
comment on column CONT_MCOVERINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CONT_MCOVERINFO.version
  is '版本号';
comment on column CONT_MCOVERINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column CONT_MCOVERINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column CONT_MCOVERINFO.bus_date
  is '业务日期';
comment on column CONT_MCOVERINFO.exa_remarks
  is '审批备注';

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
  is '工程类合同表';
comment on column CONT_PROJECT.id
  is 'ID';
comment on column CONT_PROJECT.sid
  is '原系统ID';
comment on column CONT_PROJECT.contid
  is 'ContID';
comment on column CONT_PROJECT.stockcontid
  is '合同编号';
comment on column CONT_PROJECT.unitid
  is '单位名称ID';
comment on column CONT_PROJECT.unitname
  is '单位名称';
comment on column CONT_PROJECT.appointedperson
  is '约定代表人';
comment on column CONT_PROJECT.clientperson
  is '委托代表人';
comment on column CONT_PROJECT.phone
  is '联系电话';
comment on column CONT_PROJECT.signingdeptid
  is '签约部门ID';
comment on column CONT_PROJECT.signingdept
  is '签约部门';
comment on column CONT_PROJECT.agentid
  is '委托代理人ID';
comment on column CONT_PROJECT.agent
  is '委托代理人';
comment on column CONT_PROJECT.authorizationnum
  is '授权委托书号';
comment on column CONT_PROJECT.approvalleaderid
  is '审批领导ID';
comment on column CONT_PROJECT.approvalleader
  is '审批领导';
comment on column CONT_PROJECT.description
  is '操作描述';
comment on column CONT_PROJECT.creator_id
  is '创建者id';
comment on column CONT_PROJECT.creator
  is '创建者';
comment on column CONT_PROJECT.create_date
  is '创建日期';
comment on column CONT_PROJECT.modifiedby
  is '修改人';
comment on column CONT_PROJECT.modifiedby_id
  is '修改人id';
comment on column CONT_PROJECT.modified_date
  is '修改日期';
comment on column CONT_PROJECT.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CONT_PROJECT.version
  is '版本号';
comment on column CONT_PROJECT.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column CONT_PROJECT.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column CONT_PROJECT.bus_date
  is '业务日期';
comment on column CONT_PROJECT.exa_remarks
  is '审批备注';

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
  is '合同主要条款信息表';
comment on column CONT_PROVISIONINFO.id
  is 'ID';
comment on column CONT_PROVISIONINFO.sid
  is '原系统ID';
comment on column CONT_PROVISIONINFO.contprjid
  is 'ContPrjID';
comment on column CONT_PROVISIONINFO.area
  is '面积';
comment on column CONT_PROVISIONINFO.qualitystandard
  is '质量标准';
comment on column CONT_PROVISIONINFO.begindate
  is '开工日期';
comment on column CONT_PROVISIONINFO.price
  is '单价';
comment on column CONT_PROVISIONINFO.amount
  is '合同金额';
comment on column CONT_PROVISIONINFO.finishdate
  is '竣工日期';
comment on column CONT_PROVISIONINFO.cont_mode
  is '结算方式';
comment on column CONT_PROVISIONINFO.cont_period
  is '结算期限';
comment on column CONT_PROVISIONINFO.comflictplace
  is '争议解决地点';
comment on column CONT_PROVISIONINFO.comflictmode
  is '争议解决方式';
comment on column CONT_PROVISIONINFO.description
  is '操作描述';
comment on column CONT_PROVISIONINFO.creator_id
  is '创建者id';
comment on column CONT_PROVISIONINFO.creator
  is '创建者';
comment on column CONT_PROVISIONINFO.create_date
  is '创建日期';
comment on column CONT_PROVISIONINFO.modifiedby
  is '修改人';
comment on column CONT_PROVISIONINFO.modifiedby_id
  is '修改人id';
comment on column CONT_PROVISIONINFO.modified_date
  is '修改日期';
comment on column CONT_PROVISIONINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CONT_PROVISIONINFO.version
  is '版本号';
comment on column CONT_PROVISIONINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column CONT_PROVISIONINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column CONT_PROVISIONINFO.bus_date
  is '业务日期';
comment on column CONT_PROVISIONINFO.exa_remarks
  is '审批备注';

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
  is '采购合同表';
comment on column CONT_PURCHASE.id
  is 'ID';
comment on column CONT_PURCHASE.sid
  is '原系统ID';
comment on column CONT_PURCHASE.contid
  is 'ContID';
comment on column CONT_PURCHASE.contcode
  is '合同编号';
comment on column CONT_PURCHASE.signingtime
  is '签约时间';
comment on column CONT_PURCHASE.unitname
  is '单位名称';
comment on column CONT_PURCHASE.contstandard
  is '合同标准';
comment on column CONT_PURCHASE.qualitystandard
  is '质量标准';
comment on column CONT_PURCHASE.num
  is '数量';
comment on column CONT_PURCHASE.price
  is '单价';
comment on column CONT_PURCHASE.totalamout
  is '合同总金额';
comment on column CONT_PURCHASE.submittime
  is '提（交）货时间';
comment on column CONT_PURCHASE.submitnum
  is '提（交）货数量';
comment on column CONT_PURCHASE.paymenttime
  is '付款时间';
comment on column CONT_PURCHASE.submitedtime
  is '已提（交）货时间';
comment on column CONT_PURCHASE.submitednum
  is '已提（交）货数量';
comment on column CONT_PURCHASE.qualityproblem
  is '质量问题';
comment on column CONT_PURCHASE.paidamout
  is '已付款金额';
comment on column CONT_PURCHASE.paycode
  is '付款凭号';
comment on column CONT_PURCHASE.changerelease
  is '变更解除情况';
comment on column CONT_PURCHASE.dispute
  is '发生纠纷情况';
comment on column CONT_PURCHASE.description
  is '操作描述';
comment on column CONT_PURCHASE.creator_id
  is '创建者id';
comment on column CONT_PURCHASE.creator
  is '创建者';
comment on column CONT_PURCHASE.create_date
  is '创建日期';
comment on column CONT_PURCHASE.modifiedby
  is '修改人';
comment on column CONT_PURCHASE.modifiedby_id
  is '修改人id';
comment on column CONT_PURCHASE.modified_date
  is '修改日期';
comment on column CONT_PURCHASE.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CONT_PURCHASE.version
  is '版本号';
comment on column CONT_PURCHASE.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column CONT_PURCHASE.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column CONT_PURCHASE.bus_date
  is '业务日期';
comment on column CONT_PURCHASE.exa_remarks
  is '审批备注';

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
  is '关联项目表';
comment on column CONT_RELATION.id
  is 'ID ';
comment on column CONT_RELATION.sid
  is '原系统ID ';
comment on column CONT_RELATION.contid
  is 'ContID ';
comment on column CONT_RELATION.stockcontid
  is '合同编号 ';
comment on column CONT_RELATION.prjcode
  is '项目代码 ';
comment on column CONT_RELATION.prjname
  is '项目名称 ';
comment on column CONT_RELATION.prjplace
  is '项目地点 ';
comment on column CONT_RELATION.planbegindate
  is '计划开始时间 ';
comment on column CONT_RELATION.planenddate
  is '计划结束时间 ';
comment on column CONT_RELATION.capitaldivisionratio
  is '资金分配比例 ';
comment on column CONT_RELATION.description
  is '操作描述';
comment on column CONT_RELATION.creator_id
  is '创建者id';
comment on column CONT_RELATION.creator
  is '创建者';
comment on column CONT_RELATION.create_date
  is '创建日期';
comment on column CONT_RELATION.modifiedby
  is '修改人';
comment on column CONT_RELATION.modifiedby_id
  is '修改人id';
comment on column CONT_RELATION.modified_date
  is '修改日期';
comment on column CONT_RELATION.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CONT_RELATION.version
  is '版本号';
comment on column CONT_RELATION.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column CONT_RELATION.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column CONT_RELATION.bus_date
  is '业务日期';
comment on column CONT_RELATION.exa_remarks
  is '审批备注';

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
  is '销售合同附件表';
comment on column CONT_SELLATTACHMENT.id
  is 'ID';
comment on column CONT_SELLATTACHMENT.sid
  is '原系统ID';
comment on column CONT_SELLATTACHMENT.contid
  is '合同编号';
comment on column CONT_SELLATTACHMENT.stockcontid
  is '合同编号2';
comment on column CONT_SELLATTACHMENT.name
  is '合同附件名称';
comment on column CONT_SELLATTACHMENT.type
  is '合同附件类型';
comment on column CONT_SELLATTACHMENT.pagenum
  is '合同附件页数';
comment on column CONT_SELLATTACHMENT.author
  is '合同附件作者';
comment on column CONT_SELLATTACHMENT.attachversion
  is '合同附件版本';
comment on column CONT_SELLATTACHMENT.description
  is '操作描述';
comment on column CONT_SELLATTACHMENT.creator_id
  is '创建者id';
comment on column CONT_SELLATTACHMENT.creator
  is '创建者';
comment on column CONT_SELLATTACHMENT.create_date
  is '创建日期';
comment on column CONT_SELLATTACHMENT.modifiedby
  is '修改人';
comment on column CONT_SELLATTACHMENT.modifiedby_id
  is '修改人id';
comment on column CONT_SELLATTACHMENT.modified_date
  is '修改日期';
comment on column CONT_SELLATTACHMENT.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CONT_SELLATTACHMENT.version
  is '版本号';
comment on column CONT_SELLATTACHMENT.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column CONT_SELLATTACHMENT.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column CONT_SELLATTACHMENT.bus_date
  is '业务日期';
comment on column CONT_SELLATTACHMENT.exa_remarks
  is '审批备注';

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
  is '销售合同收入表';
comment on column CONT_SELLINCOME.id
  is 'ID';
comment on column CONT_SELLINCOME.sid
  is '原系统ID';
comment on column CONT_SELLINCOME.contid
  is 'ContID';
comment on column CONT_SELLINCOME.billcode
  is '收款单编号';
comment on column CONT_SELLINCOME.billdate
  is '收款日期';
comment on column CONT_SELLINCOME.approvecode
  is '批准文号';
comment on column CONT_SELLINCOME.contcode
  is '合同编号';
comment on column CONT_SELLINCOME.contname
  is '合同名称';
comment on column CONT_SELLINCOME.prelandsellcontid
  is '原土地出让合同号';
comment on column CONT_SELLINCOME.prelandsellcontname
  is '原土地出让合同名称';
comment on column CONT_SELLINCOME.moneytype
  is '币种';
comment on column CONT_SELLINCOME.transfertotalcost
  is '转让总价';
comment on column CONT_SELLINCOME.nowbillamount
  is '本次收款金额';
comment on column CONT_SELLINCOME.payee
  is '收款人';
comment on column CONT_SELLINCOME.transfereeunit
  is '受让单位';
comment on column CONT_SELLINCOME.description
  is '操作描述';
comment on column CONT_SELLINCOME.creator_id
  is '创建者id';
comment on column CONT_SELLINCOME.creator
  is '创建者';
comment on column CONT_SELLINCOME.create_date
  is '创建日期';
comment on column CONT_SELLINCOME.modifiedby
  is '修改人';
comment on column CONT_SELLINCOME.modifiedby_id
  is '修改人id';
comment on column CONT_SELLINCOME.modified_date
  is '修改日期';
comment on column CONT_SELLINCOME.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CONT_SELLINCOME.version
  is '版本号';
comment on column CONT_SELLINCOME.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column CONT_SELLINCOME.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column CONT_SELLINCOME.bus_date
  is '业务日期';
comment on column CONT_SELLINCOME.exa_remarks
  is '审批备注';

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
  is '销售地块信息表';
comment on column CONT_SELLLANDINFO.id
  is 'ID';
comment on column CONT_SELLLANDINFO.sid
  is '原系统ID';
comment on column CONT_SELLLANDINFO.incomeid
  is 'IncomeID';
comment on column CONT_SELLLANDINFO.billcode
  is '收款单编号';
comment on column CONT_SELLLANDINFO.landcode
  is '地块编号';
comment on column CONT_SELLLANDINFO.landarea_mu
  is '地块面积';
comment on column CONT_SELLLANDINFO.landusing
  is '地块用途';
comment on column CONT_SELLLANDINFO.description
  is '操作描述';
comment on column CONT_SELLLANDINFO.creator_id
  is '创建者id';
comment on column CONT_SELLLANDINFO.creator
  is '创建者';
comment on column CONT_SELLLANDINFO.create_date
  is '创建日期';
comment on column CONT_SELLLANDINFO.modifiedby
  is '修改人';
comment on column CONT_SELLLANDINFO.modifiedby_id
  is '修改人id';
comment on column CONT_SELLLANDINFO.modified_date
  is '修改日期';
comment on column CONT_SELLLANDINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CONT_SELLLANDINFO.version
  is '版本号';
comment on column CONT_SELLLANDINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column CONT_SELLLANDINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column CONT_SELLLANDINFO.bus_date
  is '业务日期';
comment on column CONT_SELLLANDINFO.exa_remarks
  is '审批备注';

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
  is '销售合同到账计划表';
comment on column CONT_SELLTOACCOUNTPLAN.id
  is 'ID';
comment on column CONT_SELLTOACCOUNTPLAN.sid
  is '原系统ID';
comment on column CONT_SELLTOACCOUNTPLAN.contid
  is 'ContID';
comment on column CONT_SELLTOACCOUNTPLAN.contcode
  is '合同编号';
comment on column CONT_SELLTOACCOUNTPLAN.totalcapital
  is '资金到账金额总计';
comment on column CONT_SELLTOACCOUNTPLAN.howmuchperiod
  is '共分_期支付';
comment on column CONT_SELLTOACCOUNTPLAN.paydesc
  is '支付说明';
comment on column CONT_SELLTOACCOUNTPLAN.planpaydate
  is '计划支付日期';
comment on column CONT_SELLTOACCOUNTPLAN.planpayamount
  is '计划支付金额';
comment on column CONT_SELLTOACCOUNTPLAN.remark
  is '备注事项';
comment on column CONT_SELLTOACCOUNTPLAN.description
  is '操作描述';
comment on column CONT_SELLTOACCOUNTPLAN.creator_id
  is '创建者id';
comment on column CONT_SELLTOACCOUNTPLAN.creator
  is '创建者';
comment on column CONT_SELLTOACCOUNTPLAN.create_date
  is '创建日期';
comment on column CONT_SELLTOACCOUNTPLAN.modifiedby
  is '修改人';
comment on column CONT_SELLTOACCOUNTPLAN.modifiedby_id
  is '修改人id';
comment on column CONT_SELLTOACCOUNTPLAN.modified_date
  is '修改日期';
comment on column CONT_SELLTOACCOUNTPLAN.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CONT_SELLTOACCOUNTPLAN.version
  is '版本号';
comment on column CONT_SELLTOACCOUNTPLAN.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column CONT_SELLTOACCOUNTPLAN.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column CONT_SELLTOACCOUNTPLAN.bus_date
  is '业务日期';
comment on column CONT_SELLTOACCOUNTPLAN.exa_remarks
  is '审批备注';

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
  is '监理合同支付信息明细表';
comment on column CONT_SUPERVISORINFO.id
  is 'ID';
comment on column CONT_SUPERVISORINFO.sid
  is '原系统ID';
comment on column CONT_SUPERVISORINFO.contid
  is 'ContID';
comment on column CONT_SUPERVISORINFO.stockcontid
  is '合同编号';
comment on column CONT_SUPERVISORINFO.billcode
  is '单据编号';
comment on column CONT_SUPERVISORINFO.billdate
  is '单据时间';
comment on column CONT_SUPERVISORINFO.makelandprjid
  is '造地项目ID';
comment on column CONT_SUPERVISORINFO.makelandprj
  is '造地项目';
comment on column CONT_SUPERVISORINFO.supervisorunitid
  is '监理单位ID';
comment on column CONT_SUPERVISORINFO.supervisorunit
  is '监理单位';
comment on column CONT_SUPERVISORINFO.applicationonid
  is '申请付款人ID';
comment on column CONT_SUPERVISORINFO.applicationon
  is '申请付款人';
comment on column CONT_SUPERVISORINFO.approverid
  is '审批人ID';
comment on column CONT_SUPERVISORINFO.approver
  is '审批人';
comment on column CONT_SUPERVISORINFO.nowpayoff
  is '本次付款金额';
comment on column CONT_SUPERVISORINFO.totalpayoff
  is '累计付款金额';
comment on column CONT_SUPERVISORINFO.whichtimes
  is '第几次付款';
comment on column CONT_SUPERVISORINFO.payoffdesc
  is '付款说明';
comment on column CONT_SUPERVISORINFO.description
  is '操作描述';
comment on column CONT_SUPERVISORINFO.creator_id
  is '创建者id';
comment on column CONT_SUPERVISORINFO.creator
  is '创建者';
comment on column CONT_SUPERVISORINFO.create_date
  is '创建日期';
comment on column CONT_SUPERVISORINFO.modifiedby
  is '修改人';
comment on column CONT_SUPERVISORINFO.modifiedby_id
  is '修改人id';
comment on column CONT_SUPERVISORINFO.modified_date
  is '修改日期';
comment on column CONT_SUPERVISORINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CONT_SUPERVISORINFO.version
  is '版本号';
comment on column CONT_SUPERVISORINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column CONT_SUPERVISORINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column CONT_SUPERVISORINFO.bus_date
  is '业务日期';
comment on column CONT_SUPERVISORINFO.exa_remarks
  is '审批备注';

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
  is '联系人信息表';
comment on column CUST_CONTACTS.id
  is 'ID';
comment on column CUST_CONTACTS.sid
  is '原系统ID';
comment on column CUST_CONTACTS.custid
  is 'CustID';
comment on column CUST_CONTACTS.custcode
  is '客户代码';
comment on column CUST_CONTACTS.code
  is '人员编号';
comment on column CUST_CONTACTS.name
  is '姓名';
comment on column CUST_CONTACTS.sexid
  is '性别ID';
comment on column CUST_CONTACTS.sex
  is '性别';
comment on column CUST_CONTACTS.job
  is '职位';
comment on column CUST_CONTACTS.phone
  is '办公电话';
comment on column CUST_CONTACTS.fax
  is '传真';
comment on column CUST_CONTACTS.email
  is '电子邮件';
comment on column CUST_CONTACTS.address
  is '地址';
comment on column CUST_CONTACTS.postalcode
  is '邮政编码';
comment on column CUST_CONTACTS.mobile
  is '移动电话';
comment on column CUST_CONTACTS.homecall
  is '家庭电话';
comment on column CUST_CONTACTS.othermethod
  is '其他联系方式';
comment on column CUST_CONTACTS.description
  is '操作描述';
comment on column CUST_CONTACTS.creator_id
  is '创建者id';
comment on column CUST_CONTACTS.creator
  is '创建者';
comment on column CUST_CONTACTS.create_date
  is '创建日期';
comment on column CUST_CONTACTS.modifiedby
  is '修改人';
comment on column CUST_CONTACTS.modifiedby_id
  is '修改人id';
comment on column CUST_CONTACTS.modified_date
  is '修改日期';
comment on column CUST_CONTACTS.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CUST_CONTACTS.version
  is '版本号';
comment on column CUST_CONTACTS.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column CUST_CONTACTS.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column CUST_CONTACTS.bus_date
  is '业务时间';
comment on column CUST_CONTACTS.exa_remarks
  is '审批备注';

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
  is '客户基本信息';
comment on column CUST_INFO.id
  is 'ID';
comment on column CUST_INFO.sid
  is '原系统ID';
comment on column CUST_INFO.code
  is '客户代码';
comment on column CUST_INFO.name
  is '客户名称';
comment on column CUST_INFO.certificatenum
  is '法人证件号码';
comment on column CUST_INFO.companynatureid
  is '企业性质ID';
comment on column CUST_INFO.companynature
  is '企业性质';
comment on column CUST_INFO.registeredcapital
  is '注册资本';
comment on column CUST_INFO.city
  is '所在城市';
comment on column CUST_INFO.bank
  is '开户银行';
comment on column CUST_INFO.account
  is '银行账号';
comment on column CUST_INFO.representative
  is '法人代表';
comment on column CUST_INFO.contactperson
  is '联系人';
comment on column CUST_INFO.businesslicense
  is '营业执照号';
comment on column CUST_INFO.orgcode
  is '组织机构代码证';
comment on column CUST_INFO.areataxnum
  is '地税登记号';
comment on column CUST_INFO.nationtaxnum
  is '国税登记号';
comment on column CUST_INFO.address
  is '通讯地址';
comment on column CUST_INFO.postalcode
  is '邮政编码';
comment on column CUST_INFO.phone
  is '电话号码';
comment on column CUST_INFO.fax
  is '传真号码';
comment on column CUST_INFO.email
  is '电子邮件';
comment on column CUST_INFO.homepage
  is '公司主页';
comment on column CUST_INFO.cust_description
  is '公司简介';
comment on column CUST_INFO.bussinessscope
  is '经营范围';
comment on column CUST_INFO.description
  is '操作描述';
comment on column CUST_INFO.creator_id
  is '创建者id';
comment on column CUST_INFO.creator
  is '创建者';
comment on column CUST_INFO.create_date
  is '创建日期';
comment on column CUST_INFO.modifiedby
  is '修改人';
comment on column CUST_INFO.modifiedby_id
  is '修改人id';
comment on column CUST_INFO.modified_date
  is '修改日期';
comment on column CUST_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CUST_INFO.version
  is '版本号';
comment on column CUST_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column CUST_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column CUST_INFO.bus_date
  is '业务时间';
comment on column CUST_INFO.exa_remarks
  is '审批备注';

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
  is '交易属性表';
comment on column CUST_TRANSACTION.id
  is 'ID';
comment on column CUST_TRANSACTION.sid
  is '原系统ID';
comment on column CUST_TRANSACTION.custid
  is 'CustID';
comment on column CUST_TRANSACTION.custcode
  is '客户代码';
comment on column CUST_TRANSACTION.transationtypeid
  is '交易类型ID';
comment on column CUST_TRANSACTION.transationtype
  is '交易类型';
comment on column CUST_TRANSACTION.statusid
  is '客户状态ID';
comment on column CUST_TRANSACTION.status
  is '客户状态';
comment on column CUST_TRANSACTION.buyprice
  is '购买价格';
comment on column CUST_TRANSACTION.rentalprice
  is '租赁价格';
comment on column CUST_TRANSACTION.transationcode
  is '交易编号';
comment on column CUST_TRANSACTION.contcode
  is '合同编号';
comment on column CUST_TRANSACTION.contname
  is '合同名称';
comment on column CUST_TRANSACTION.investprjname
  is '投资项目名称';
comment on column CUST_TRANSACTION.agent
  is '委托代理人';
comment on column CUST_TRANSACTION.clientcertificatenum
  is '委托人证件号码';
comment on column CUST_TRANSACTION.clientphone
  is '委托人电话';
comment on column CUST_TRANSACTION.clientaddress
  is '委托人地址';
comment on column CUST_TRANSACTION.description
  is '操作描述';
comment on column CUST_TRANSACTION.creator_id
  is '创建者id';
comment on column CUST_TRANSACTION.creator
  is '创建者';
comment on column CUST_TRANSACTION.create_date
  is '创建日期';
comment on column CUST_TRANSACTION.modifiedby
  is '修改人';
comment on column CUST_TRANSACTION.modifiedby_id
  is '修改人id';
comment on column CUST_TRANSACTION.modified_date
  is '修改日期';
comment on column CUST_TRANSACTION.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column CUST_TRANSACTION.version
  is '版本号';
comment on column CUST_TRANSACTION.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column CUST_TRANSACTION.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column CUST_TRANSACTION.bus_date
  is '业务时间';
comment on column CUST_TRANSACTION.exa_remarks
  is '审批备注';

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
  is '能力属性表';
comment on column EMP_ABILITYATTRIBUTE.id
  is '主键';
comment on column EMP_ABILITYATTRIBUTE.sid
  is '原系统ID';
comment on column EMP_ABILITYATTRIBUTE.empid
  is 'EmpID';
comment on column EMP_ABILITYATTRIBUTE.empcode
  is '员工编号';
comment on column EMP_ABILITYATTRIBUTE.educationid
  is '学历ID';
comment on column EMP_ABILITYATTRIBUTE.education
  is '学历';
comment on column EMP_ABILITYATTRIBUTE.academicdegreeid
  is '学位ID';
comment on column EMP_ABILITYATTRIBUTE.academicdegree
  is '学位';
comment on column EMP_ABILITYATTRIBUTE.graguateduniversity
  is '毕业院校';
comment on column EMP_ABILITYATTRIBUTE.profession
  is '专业';
comment on column EMP_ABILITYATTRIBUTE.begindate
  is '入学时间';
comment on column EMP_ABILITYATTRIBUTE.enddate
  is '毕业时间';
comment on column EMP_ABILITYATTRIBUTE.foreignlanguage
  is '外语语种';
comment on column EMP_ABILITYATTRIBUTE.languagelevel
  is '外语等级';
comment on column EMP_ABILITYATTRIBUTE.technicaltitle
  is '技术职称';
comment on column EMP_ABILITYATTRIBUTE.titlelevelid
  is '职称等级ID';
comment on column EMP_ABILITYATTRIBUTE.titlelevel
  is '职称等级';
comment on column EMP_ABILITYATTRIBUTE.occupationqualification
  is '职业资格';
comment on column EMP_ABILITYATTRIBUTE.certification
  is '上岗证(操作证)';
comment on column EMP_ABILITYATTRIBUTE.description
  is '操作描述';
comment on column EMP_ABILITYATTRIBUTE.creator_id
  is '创建者id';
comment on column EMP_ABILITYATTRIBUTE.creator
  is '创建者';
comment on column EMP_ABILITYATTRIBUTE.create_date
  is '创建日期';
comment on column EMP_ABILITYATTRIBUTE.modifiedby
  is '修改人';
comment on column EMP_ABILITYATTRIBUTE.modifiedby_id
  is '修改人id';
comment on column EMP_ABILITYATTRIBUTE.modified_date
  is '修改日期';
comment on column EMP_ABILITYATTRIBUTE.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column EMP_ABILITYATTRIBUTE.version
  is '版本号';
comment on column EMP_ABILITYATTRIBUTE.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column EMP_ABILITYATTRIBUTE.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column EMP_ABILITYATTRIBUTE.bus_date
  is '业务时间';
comment on column EMP_ABILITYATTRIBUTE.exa_remarks
  is '审批备注';

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
  is '教育经历表';
comment on column EMP_EDUCATIONATTRIBUTE.id
  is '主键';
comment on column EMP_EDUCATIONATTRIBUTE.sid
  is '原系统ID';
comment on column EMP_EDUCATIONATTRIBUTE.empid
  is 'EmpID';
comment on column EMP_EDUCATIONATTRIBUTE.empcode
  is '员工编号';
comment on column EMP_EDUCATIONATTRIBUTE.graduatecollage
  is '毕业院校';
comment on column EMP_EDUCATIONATTRIBUTE.perfession
  is '所学专业';
comment on column EMP_EDUCATIONATTRIBUTE.educationid
  is '学历ID';
comment on column EMP_EDUCATIONATTRIBUTE.education
  is '学历';
comment on column EMP_EDUCATIONATTRIBUTE.academicdegreeid
  is '学位ID';
comment on column EMP_EDUCATIONATTRIBUTE.academicdegree
  is '学位';
comment on column EMP_EDUCATIONATTRIBUTE.learntypeid
  is '学习方式ID';
comment on column EMP_EDUCATIONATTRIBUTE.learntype
  is '学习方式';
comment on column EMP_EDUCATIONATTRIBUTE.begindate
  is '入学时间';
comment on column EMP_EDUCATIONATTRIBUTE.enddate
  is '毕业时间';
comment on column EMP_EDUCATIONATTRIBUTE.description
  is '操作描述';
comment on column EMP_EDUCATIONATTRIBUTE.creator_id
  is '创建者id';
comment on column EMP_EDUCATIONATTRIBUTE.creator
  is '创建者';
comment on column EMP_EDUCATIONATTRIBUTE.create_date
  is '创建日期';
comment on column EMP_EDUCATIONATTRIBUTE.modifiedby
  is '修改人';
comment on column EMP_EDUCATIONATTRIBUTE.modifiedby_id
  is '修改人id';
comment on column EMP_EDUCATIONATTRIBUTE.modified_date
  is '修改日期';
comment on column EMP_EDUCATIONATTRIBUTE.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column EMP_EDUCATIONATTRIBUTE.version
  is '版本号';
comment on column EMP_EDUCATIONATTRIBUTE.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column EMP_EDUCATIONATTRIBUTE.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column EMP_EDUCATIONATTRIBUTE.bus_date
  is '业务时间';
comment on column EMP_EDUCATIONATTRIBUTE.exa_remarks
  is '审批备注';

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
  is '家庭信息表';
comment on column EMP_FRAMILYINFO.id
  is '主键';
comment on column EMP_FRAMILYINFO.empid
  is 'EmpID';
comment on column EMP_FRAMILYINFO.empcode
  is '人员编码';
comment on column EMP_FRAMILYINFO.membername
  is '成员姓名';
comment on column EMP_FRAMILYINFO.relationid
  is '与本人关系ID';
comment on column EMP_FRAMILYINFO.relation
  is '与本人关系';
comment on column EMP_FRAMILYINFO.birthday
  is '出生日期';
comment on column EMP_FRAMILYINFO.unit
  is '工作单位';
comment on column EMP_FRAMILYINFO.job
  is '职务';
comment on column EMP_FRAMILYINFO.phone
  is '联系电话';
comment on column EMP_FRAMILYINFO.sexid
  is '性别ID';
comment on column EMP_FRAMILYINFO.sex
  is '性别';
comment on column EMP_FRAMILYINFO.description
  is '操作描述';
comment on column EMP_FRAMILYINFO.creator_id
  is '创建者id';
comment on column EMP_FRAMILYINFO.creator
  is '创建者';
comment on column EMP_FRAMILYINFO.create_date
  is '创建日期';
comment on column EMP_FRAMILYINFO.modifiedby
  is '修改人';
comment on column EMP_FRAMILYINFO.modifiedby_id
  is '修改人id';
comment on column EMP_FRAMILYINFO.modified_date
  is '修改日期';
comment on column EMP_FRAMILYINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column EMP_FRAMILYINFO.version
  is '版本号';
comment on column EMP_FRAMILYINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column EMP_FRAMILYINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column EMP_FRAMILYINFO.bus_date
  is '业务时间';
comment on column EMP_FRAMILYINFO.exa_remarks
  is '审批备注';

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
  is '人口基本信息';
comment on column EMP_INFO.id
  is '主键';
comment on column EMP_INFO.code
  is '员工编号';
comment on column EMP_INFO.cardcode
  is '工卡号';
comment on column EMP_INFO.name
  is '姓名';
comment on column EMP_INFO.pinyin
  is '汉语拼音';
comment on column EMP_INFO.sexid
  is '性别ID';
comment on column EMP_INFO.sex
  is '性别';
comment on column EMP_INFO.birthday
  is '出生日期';
comment on column EMP_INFO.bloodtypeid
  is '血型ID';
comment on column EMP_INFO.bloodtype
  is '血型';
comment on column EMP_INFO.idcard
  is '身份证号';
comment on column EMP_INFO.marryid
  is '婚姻状况ID';
comment on column EMP_INFO.marry
  is '婚姻状况';
comment on column EMP_INFO.nation
  is '民族';
comment on column EMP_INFO.nationid
  is '民族ID';
comment on column EMP_INFO.birthplace
  is '出生地点';
comment on column EMP_INFO.originplace
  is '籍贯';
comment on column EMP_INFO.photo
  is '照片附件';
comment on column EMP_INFO.personindentityid
  is '个人身份ID';
comment on column EMP_INFO.personindentity
  is '个人身份';
comment on column EMP_INFO.politicaloutlookid
  is '政治面貌ID';
comment on column EMP_INFO.politicaloutlook
  is '政治面貌';
comment on column EMP_INFO.joininparty
  is '参加党团时间';
comment on column EMP_INFO.partyoffice
  is '党团职务';
comment on column EMP_INFO.workingtime
  is '参加工作时间';
comment on column EMP_INFO.city
  is '工作城市';
comment on column EMP_INFO.officeaddress
  is '办公地址';
comment on column EMP_INFO.officephone
  is '固定电话';
comment on column EMP_INFO.mobile
  is '移动电话';
comment on column EMP_INFO.email
  is '电子邮件';
comment on column EMP_INFO.officepostalcode
  is '办公地邮政编码';
comment on column EMP_INFO.homeaddress
  is '家庭住址';
comment on column EMP_INFO.homephone
  is '住宅电话';
comment on column EMP_INFO.homepostalcode
  is '家庭所在地邮政编码';
comment on column EMP_INFO.emergencyperson
  is '紧急联络人';
comment on column EMP_INFO.emergencyphone
  is '紧急联络电话';
comment on column EMP_INFO.description
  is '操作描述';
comment on column EMP_INFO.creator_id
  is '创建者id';
comment on column EMP_INFO.creator
  is '创建者';
comment on column EMP_INFO.create_date
  is '创建日期';
comment on column EMP_INFO.modifiedby
  is '修改人';
comment on column EMP_INFO.modifiedby_id
  is '修改人id';
comment on column EMP_INFO.modified_date
  is '修改日期';
comment on column EMP_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column EMP_INFO.version
  is '版本号';
comment on column EMP_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column EMP_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column EMP_INFO.bus_date
  is '业务时间';
comment on column EMP_INFO.exa_remarks
  is '审批备注';

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
  is '行政属性表';
comment on column EMP_MANAGEMENTINFO.id
  is '主键';
comment on column EMP_MANAGEMENTINFO.sid
  is '原系统ID';
comment on column EMP_MANAGEMENTINFO.empid
  is 'EmpID';
comment on column EMP_MANAGEMENTINFO.empcode
  is '员工编号';
comment on column EMP_MANAGEMENTINFO.joininipbtime
  is '进入招商局系统工作时间';
comment on column EMP_MANAGEMENTINFO.unit
  is '所在单位';
comment on column EMP_MANAGEMENTINFO.department
  is '部门';
comment on column EMP_MANAGEMENTINFO.joinincorptime
  is '入司日期';
comment on column EMP_MANAGEMENTINFO.statusdate
  is '转正日期';
comment on column EMP_MANAGEMENTINFO.emptypeid
  is '员工类别ID';
comment on column EMP_MANAGEMENTINFO.emptype
  is '员工类别';
comment on column EMP_MANAGEMENTINFO.joinintypeid
  is '入司方式ID';
comment on column EMP_MANAGEMENTINFO.joinintype
  is '入司方式';
comment on column EMP_MANAGEMENTINFO.job
  is '职务';
comment on column EMP_MANAGEMENTINFO.joblevel
  is '职务级别';
comment on column EMP_MANAGEMENTINFO.nowjobbegindate
  is '现职开始日期';
comment on column EMP_MANAGEMENTINFO.contracttypeid
  is '合同类别ID';
comment on column EMP_MANAGEMENTINFO.contracttype
  is '合同类别';
comment on column EMP_MANAGEMENTINFO.contractbegindate
  is '合同签订日期';
comment on column EMP_MANAGEMENTINFO.contractenddate
  is '合同到期日期';
comment on column EMP_MANAGEMENTINFO.description
  is '操作描述';
comment on column EMP_MANAGEMENTINFO.creator_id
  is '创建者id';
comment on column EMP_MANAGEMENTINFO.creator
  is '创建者';
comment on column EMP_MANAGEMENTINFO.create_date
  is '创建日期';
comment on column EMP_MANAGEMENTINFO.modifiedby
  is '修改人';
comment on column EMP_MANAGEMENTINFO.modifiedby_id
  is '修改人id';
comment on column EMP_MANAGEMENTINFO.modified_date
  is '修改日期';
comment on column EMP_MANAGEMENTINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column EMP_MANAGEMENTINFO.version
  is '版本号';
comment on column EMP_MANAGEMENTINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column EMP_MANAGEMENTINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column EMP_MANAGEMENTINFO.bus_date
  is '业务时间';
comment on column EMP_MANAGEMENTINFO.exa_remarks
  is '审批备注';

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
  is '培训经历表';
comment on column EMP_TRAINEXP.id
  is '主键 ';
comment on column EMP_TRAINEXP.sid
  is '原系统ID ';
comment on column EMP_TRAINEXP.empid
  is 'EmpID ';
comment on column EMP_TRAINEXP.empcode
  is '员工编号 ';
comment on column EMP_TRAINEXP.begindate
  is '开始日期 ';
comment on column EMP_TRAINEXP.enddate
  is '结束日期 ';
comment on column EMP_TRAINEXP.content
  is '培训内容 ';
comment on column EMP_TRAINEXP.unit
  is '培训机构 ';
comment on column EMP_TRAINEXP.typeid
  is '培训类型ID ';
comment on column EMP_TRAINEXP.type
  is '培训类型 ';
comment on column EMP_TRAINEXP.modeid
  is '培训方式ID ';
comment on column EMP_TRAINEXP.trainmode
  is '培训方式 ';
comment on column EMP_TRAINEXP.description
  is '操作描述';
comment on column EMP_TRAINEXP.creator_id
  is '创建者id';
comment on column EMP_TRAINEXP.creator
  is '创建者';
comment on column EMP_TRAINEXP.create_date
  is '创建日期';
comment on column EMP_TRAINEXP.modifiedby
  is '修改人';
comment on column EMP_TRAINEXP.modifiedby_id
  is '修改人id';
comment on column EMP_TRAINEXP.modified_date
  is '修改日期';
comment on column EMP_TRAINEXP.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column EMP_TRAINEXP.version
  is '版本号';
comment on column EMP_TRAINEXP.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column EMP_TRAINEXP.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column EMP_TRAINEXP.bus_date
  is '业务时间';
comment on column EMP_TRAINEXP.exa_remarks
  is '审批备注';

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
  is '工作经历表';
comment on column EMP_WORK_EXP.id
  is '主键';
comment on column EMP_WORK_EXP.sid
  is '原系统ID';
comment on column EMP_WORK_EXP.empid
  is 'EmpID';
comment on column EMP_WORK_EXP.empcode
  is '员工编号';
comment on column EMP_WORK_EXP.begindate
  is '开始日期';
comment on column EMP_WORK_EXP.enddate
  is '结束日期';
comment on column EMP_WORK_EXP.unit
  is '单位';
comment on column EMP_WORK_EXP.department
  is '部门';
comment on column EMP_WORK_EXP.job
  is '职务';
comment on column EMP_WORK_EXP.working
  is '所从事（分管）的工作';
comment on column EMP_WORK_EXP.description
  is '操作描述';
comment on column EMP_WORK_EXP.creator_id
  is '创建者id';
comment on column EMP_WORK_EXP.creator
  is '创建者';
comment on column EMP_WORK_EXP.create_date
  is '创建日期';
comment on column EMP_WORK_EXP.modifiedby
  is '修改人';
comment on column EMP_WORK_EXP.modifiedby_id
  is '修改人id';
comment on column EMP_WORK_EXP.modified_date
  is '修改日期';
comment on column EMP_WORK_EXP.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column EMP_WORK_EXP.version
  is '版本号';
comment on column EMP_WORK_EXP.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column EMP_WORK_EXP.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column EMP_WORK_EXP.bus_date
  is '业务时间';
comment on column EMP_WORK_EXP.exa_remarks
  is '审批备注';

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
  is '土地基本信息表';
comment on column LAND_INFO.id
  is 'ID';
comment on column LAND_INFO.sid
  is '原系统ID';
comment on column LAND_INFO.syscode
  is '系统编码';
comment on column LAND_INFO.landcode
  is '地块编码';
comment on column LAND_INFO.landtypeid
  is '地块类型ID';
comment on column LAND_INFO.landtype
  is '地块类型';
comment on column LAND_INFO.landposition
  is '地块位置';
comment on column LAND_INFO.landname
  is '地块名称';
comment on column LAND_INFO.landareadivisionid
  is '地块区划ID';
comment on column LAND_INFO.landareadivision
  is '地块区划';
comment on column LAND_INFO.landapprovenumber
  is '地块批准文号';
comment on column LAND_INFO.landapprovedate
  is '地块批准时间';
comment on column LAND_INFO.parentname
  is '权属名称';
comment on column LAND_INFO.landstatusid
  is '地块状态ID';
comment on column LAND_INFO.landstatus
  is '地块状态';
comment on column LAND_INFO.landshape
  is '地块形状';
comment on column LAND_INFO.landlength
  is '地块长度';
comment on column LAND_INFO.landwidth
  is '地块宽度';
comment on column LAND_INFO.landarea_mu
  is '地块面积（亩）';
comment on column LAND_INFO.landarea_square
  is '地块面积（平方米）';
comment on column LAND_INFO.landphoto
  is '地块图片';
comment on column LAND_INFO.landusingid
  is '地块用途ID';
comment on column LAND_INFO.landusing
  is '地块用途';
comment on column LAND_INFO.description
  is '操作描述';
comment on column LAND_INFO.creator_id
  is '创建者id';
comment on column LAND_INFO.creator
  is '创建者';
comment on column LAND_INFO.create_date
  is '创建日期';
comment on column LAND_INFO.modifiedby
  is '修改人';
comment on column LAND_INFO.modifiedby_id
  is '修改人id';
comment on column LAND_INFO.modified_date
  is '修改日期';
comment on column LAND_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LAND_INFO.version
  is '版本号';
comment on column LAND_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LAND_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LAND_INFO.bus_date
  is '业务时间';
comment on column LAND_INFO.exa_remarks
  is '审批备注';

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
  is '造地信息表';
comment on column LAND_MAKEINFO.id
  is 'ID';
comment on column LAND_MAKEINFO.sid
  is '原系统ID';
comment on column LAND_MAKEINFO.landid
  is 'LandID';
comment on column LAND_MAKEINFO.landcode
  is '地块编码';
comment on column LAND_MAKEINFO.makecost
  is '造地成本';
comment on column LAND_MAKEINFO.makeprice
  is '造地单价';
comment on column LAND_MAKEINFO.stonevolume
  is '土石方量';
comment on column LAND_MAKEINFO.makeyear
  is '造地年份';
comment on column LAND_MAKEINFO.contcode
  is '合同编号';
comment on column LAND_MAKEINFO.description
  is '操作描述';
comment on column LAND_MAKEINFO.creator_id
  is '创建者id';
comment on column LAND_MAKEINFO.creator
  is '创建者';
comment on column LAND_MAKEINFO.create_date
  is '创建日期';
comment on column LAND_MAKEINFO.modifiedby
  is '修改人';
comment on column LAND_MAKEINFO.modifiedby_id
  is '修改人id';
comment on column LAND_MAKEINFO.modified_date
  is '修改日期';
comment on column LAND_MAKEINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LAND_MAKEINFO.version
  is '版本号';
comment on column LAND_MAKEINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LAND_MAKEINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LAND_MAKEINFO.bus_date
  is '业务时间';
comment on column LAND_MAKEINFO.exa_remarks
  is '审批备注';

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
  is '规划信息表';
comment on column LAND_PLANINFO.id
  is 'ID';
comment on column LAND_PLANINFO.sid
  is '原系统ID';
comment on column LAND_PLANINFO.landid
  is 'LandID';
comment on column LAND_PLANINFO.landcode
  is '地块编码';
comment on column LAND_PLANINFO.buydate
  is '征地时间';
comment on column LAND_PLANINFO.developdate
  is '开发时间';
comment on column LAND_PLANINFO.iguid
  is 'IGUID';
comment on column LAND_PLANINFO.transferdate
  is '转让时间';
comment on column LAND_PLANINFO.transferperiod
  is '转让期限';
comment on column LAND_PLANINFO.transferprice
  is '转让价格';
comment on column LAND_PLANINFO.usingunitid
  is '使用单位ID';
comment on column LAND_PLANINFO.usingunit
  is '使用单位';
comment on column LAND_PLANINFO.parcelcode
  is '宗地编号';
comment on column LAND_PLANINFO.makecost
  is '造地成本';
comment on column LAND_PLANINFO.buycost
  is '征地成本';
comment on column LAND_PLANINFO.transferprofit
  is '转让收益';
comment on column LAND_PLANINFO.financefee
  is '财务费用';
comment on column LAND_PLANINFO.managefee
  is '管理费用';
comment on column LAND_PLANINFO.areacode
  is '区域编号';
comment on column LAND_PLANINFO.areameasure
  is '区域面积';
comment on column LAND_PLANINFO.landscopelineid
  is '用地范围线ID';
comment on column LAND_PLANINFO.landscopeline
  is '用地范围线';
comment on column LAND_PLANINFO.landplanlayerid
  is '用地规划图层ID';
comment on column LAND_PLANINFO.landplanlayer
  is '用地规划图层';
comment on column LAND_PLANINFO.description
  is '操作描述';
comment on column LAND_PLANINFO.creator_id
  is '创建者id';
comment on column LAND_PLANINFO.creator
  is '创建者';
comment on column LAND_PLANINFO.create_date
  is '创建日期';
comment on column LAND_PLANINFO.modifiedby
  is '修改人';
comment on column LAND_PLANINFO.modifiedby_id
  is '修改人id';
comment on column LAND_PLANINFO.modified_date
  is '修改日期';
comment on column LAND_PLANINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LAND_PLANINFO.version
  is '版本号';
comment on column LAND_PLANINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LAND_PLANINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LAND_PLANINFO.bus_date
  is '业务时间';
comment on column LAND_PLANINFO.exa_remarks
  is '审批备注';

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
  is '售地信息表';
comment on column LAND_SELLINFO.id
  is 'ID';
comment on column LAND_SELLINFO.sid
  is '原系统ID';
comment on column LAND_SELLINFO.landid
  is 'LandID';
comment on column LAND_SELLINFO.landcode
  is '地块编码';
comment on column LAND_SELLINFO.sellyear
  is '售地年份';
comment on column LAND_SELLINFO.plantransferyear
  is '计划转让年份';
comment on column LAND_SELLINFO.sellcontcode
  is '售地合同编号';
comment on column LAND_SELLINFO.parcelcode
  is '宗地号';
comment on column LAND_SELLINFO.transfer
  is '地块转让方';
comment on column LAND_SELLINFO.transferee
  is '地块受让方';
comment on column LAND_SELLINFO.dealdate
  is '交地时间';
comment on column LAND_SELLINFO.contcode
  is '合同编号';
comment on column LAND_SELLINFO.contname
  is '合同名称';
comment on column LAND_SELLINFO.prelandtransferbuycontcode
  is '原土地出让合同号（征地合同）';
comment on column LAND_SELLINFO.prelandtransferbuycontname
  is '原土地出让合同名称';
comment on column LAND_SELLINFO.landtransferperiod
  is '土地转让年限';
comment on column LAND_SELLINFO.transfertotalamount
  is '转让总价';
comment on column LAND_SELLINFO.sellprice
  is '售地单价';
comment on column LAND_SELLINFO.conttotalamount
  is '合同金额';
comment on column LAND_SELLINFO.agreedate
  is '约定交地时间';
comment on column LAND_SELLINFO.reallydate
  is '实际交地时间';
comment on column LAND_SELLINFO.bookingpayoffdate
  is '预订付款时间';
comment on column LAND_SELLINFO.reallypayoffdate
  is '实际付款时间';
comment on column LAND_SELLINFO.description
  is '操作描述';
comment on column LAND_SELLINFO.creator_id
  is '创建者id';
comment on column LAND_SELLINFO.creator
  is '创建者';
comment on column LAND_SELLINFO.create_date
  is '创建日期';
comment on column LAND_SELLINFO.modifiedby
  is '修改人';
comment on column LAND_SELLINFO.modifiedby_id
  is '修改人id';
comment on column LAND_SELLINFO.modified_date
  is '修改日期';
comment on column LAND_SELLINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LAND_SELLINFO.version
  is '版本号';
comment on column LAND_SELLINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LAND_SELLINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LAND_SELLINFO.bus_date
  is '业务时间';
comment on column LAND_SELLINFO.exa_remarks
  is '审批备注';

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
  is '储地信息表';
comment on column LAND_STORAGEINFO.id
  is 'ID';
comment on column LAND_STORAGEINFO.sid
  is '原系统ID';
comment on column LAND_STORAGEINFO.landid
  is 'LandID';
comment on column LAND_STORAGEINFO.landcode
  is '地块编码';
comment on column LAND_STORAGEINFO.storagecode
  is '地块开发编码';
comment on column LAND_STORAGEINFO.projectname
  is '地块开发名称';
comment on column LAND_STORAGEINFO.storageyear
  is '开发年份';
comment on column LAND_STORAGEINFO.description
  is '操作描述';
comment on column LAND_STORAGEINFO.creator_id
  is '创建者id';
comment on column LAND_STORAGEINFO.creator
  is '创建者';
comment on column LAND_STORAGEINFO.create_date
  is '创建日期';
comment on column LAND_STORAGEINFO.modifiedby
  is '修改人';
comment on column LAND_STORAGEINFO.modifiedby_id
  is '修改人id';
comment on column LAND_STORAGEINFO.modified_date
  is '修改日期';
comment on column LAND_STORAGEINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LAND_STORAGEINFO.version
  is '版本号';
comment on column LAND_STORAGEINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LAND_STORAGEINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LAND_STORAGEINFO.bus_date
  is '业务时间';
comment on column LAND_STORAGEINFO.exa_remarks
  is '审批备注';

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
  is '征地合同表';
comment on column LC_CONT_BUYLANDDETAIL.stockcontid
  is '合同编号';
comment on column LC_CONT_BUYLANDDETAIL.payitemcode
  is '支付项代码';
comment on column LC_CONT_BUYLANDDETAIL.payitemname
  is '支付项名称';
comment on column LC_CONT_BUYLANDDETAIL.contnum
  is '合同数量';
comment on column LC_CONT_BUYLANDDETAIL.contunit
  is '合同单价';
comment on column LC_CONT_BUYLANDDETAIL.contcost
  is '本项费用';
comment on column LC_CONT_BUYLANDDETAIL.contratio
  is '支付系数';
comment on column LC_CONT_BUYLANDDETAIL.processrelation
  is '进度关联';
comment on column LC_CONT_BUYLANDDETAIL.numctrl
  is '数量控制';
comment on column LC_CONT_BUYLANDDETAIL.standard
  is '规格';
comment on column LC_CONT_BUYLANDDETAIL.countingunit
  is '计量单位';
comment on column LC_CONT_BUYLANDDETAIL.valuation
  is '履约评价';
comment on column LC_CONT_BUYLANDDETAIL.areanum
  is '区域编号';
comment on column LC_CONT_BUYLANDDETAIL.landnum
  is '地块编号';
comment on column LC_CONT_BUYLANDDETAIL.area
  is '面积';
comment on column LC_CONT_BUYLANDDETAIL.planpayoff
  is '计划支付金额';
comment on column LC_CONT_BUYLANDDETAIL.landtype
  is '土地类型';
comment on column LC_CONT_BUYLANDDETAIL.payoffitem
  is '支出项目';
comment on column LC_CONT_BUYLANDDETAIL.nowpayoff
  is '本次支出金额';
comment on column LC_CONT_BUYLANDDETAIL.totalpayoff
  is '累计支出金额';
comment on column LC_CONT_BUYLANDDETAIL.edetailid
  is 'EDetailID';
comment on column LC_CONT_BUYLANDDETAIL.approvenum
  is '批准文号';
comment on column LC_CONT_BUYLANDDETAIL.approvedate
  is '批准时间';
comment on column LC_CONT_BUYLANDDETAIL.prjcode
  is '项目编号';
comment on column LC_CONT_BUYLANDDETAIL.prjname
  is '项目名称';
comment on column LC_CONT_BUYLANDDETAIL.ownerunit
  is '业主单位';
comment on column LC_CONT_BUYLANDDETAIL.createrunit
  is '立项单位';
comment on column LC_CONT_BUYLANDDETAIL.payofflimit
  is '支出金额';
comment on column LC_CONT_BUYLANDDETAIL.whichtimes
  is '第_次付款';
comment on column LC_CONT_BUYLANDDETAIL.description
  is '操作描述';
comment on column LC_CONT_BUYLANDDETAIL.creator_id
  is '创建者id';
comment on column LC_CONT_BUYLANDDETAIL.creator
  is '创建者';
comment on column LC_CONT_BUYLANDDETAIL.create_date
  is '创建日期';
comment on column LC_CONT_BUYLANDDETAIL.modifiedby
  is '修改人';
comment on column LC_CONT_BUYLANDDETAIL.modifiedby_id
  is '修改人id';
comment on column LC_CONT_BUYLANDDETAIL.modified_date
  is '修改日期';
comment on column LC_CONT_BUYLANDDETAIL.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_CONT_BUYLANDDETAIL.version
  is '版本号';
comment on column LC_CONT_BUYLANDDETAIL.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_CONT_BUYLANDDETAIL.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_CONT_BUYLANDDETAIL.bus_date
  is '业务日期';
comment on column LC_CONT_BUYLANDDETAIL.exa_remarks
  is '审批备注';
comment on column LC_CONT_BUYLANDDETAIL.src_table
  is '来源实体';
comment on column LC_CONT_BUYLANDDETAIL.src_system
  is '来源系统';
comment on column LC_CONT_BUYLANDDETAIL.sort_id
  is '排序字段';

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
  is '房屋销售合同信息表';
comment on column LC_CONT_HOUSESALEINFO.landlinencename
  is '建设用地规划许可证名称';
comment on column LC_CONT_HOUSESALEINFO.landlinencecode
  is '建设用地规划许可证编号';
comment on column LC_CONT_HOUSESALEINFO.landlinencearea
  is '建设用地规划许可证面积';
comment on column LC_CONT_HOUSESALEINFO.landlinenceunit
  is '建设用地规划许可证发证单位';
comment on column LC_CONT_HOUSESALEINFO.landlinencedate
  is '建设用地规划许可证日期';
comment on column LC_CONT_HOUSESALEINFO.prjplanlinencename
  is '建设工程规划许可证名称';
comment on column LC_CONT_HOUSESALEINFO.prjplanlinencecode
  is '建设工程规划许可证编号';
comment on column LC_CONT_HOUSESALEINFO.prjplanlinencearea
  is '建设工程规划许可证面积';
comment on column LC_CONT_HOUSESALEINFO.prjplanlinenceunit
  is '建设工程规划许可证发证单位';
comment on column LC_CONT_HOUSESALEINFO.prjplanlinencedate
  is '建设工程规划许可证日期';
comment on column LC_CONT_HOUSESALEINFO.prjplanlinenceperiod
  is '建设工程规划许可证年限';
comment on column LC_CONT_HOUSESALEINFO.prjconstlinence
  is '建筑工程施工许可证';
comment on column LC_CONT_HOUSESALEINFO.prjconstlinencecunit
  is '建筑工程施工发证单位';
comment on column LC_CONT_HOUSESALEINFO.prjconstlinencedate
  is '建筑工程施工发证日期';
comment on column LC_CONT_HOUSESALEINFO.prjconstlinenceunit
  is '建筑工程施工单位';
comment on column LC_CONT_HOUSESALEINFO.landusecertificate
  is '土地使用证';
comment on column LC_CONT_HOUSESALEINFO.landuseperiod
  is '土地使用年限';
comment on column LC_CONT_HOUSESALEINFO.landcertificatenum
  is '土地证编号';
comment on column LC_CONT_HOUSESALEINFO.landdevelopusing
  is '土地开发用途';
comment on column LC_CONT_HOUSESALEINFO.landusecertificatearea
  is '土地使用证土地面积';
comment on column LC_CONT_HOUSESALEINFO.landusecertificatecunit
  is '土地使用证发证单位';
comment on column LC_CONT_HOUSESALEINFO.preselllinence
  is '商品房预售许可证';
comment on column LC_CONT_HOUSESALEINFO.preselllinenceperiod
  is '预售许可日期';
comment on column LC_CONT_HOUSESALEINFO.preselllinenceunit
  is '商品房预售发证单位';
comment on column LC_CONT_HOUSESALEINFO.presellprojectname
  is '预售项目名称';
comment on column LC_CONT_HOUSESALEINFO.presellprojectaddress
  is '预售项目地址';
comment on column LC_CONT_HOUSESALEINFO.presellprojectusing
  is '预售房屋用途';
comment on column LC_CONT_HOUSESALEINFO.presellobject
  is '预售对象';
comment on column LC_CONT_HOUSESALEINFO.presellnumber
  is '预售套数';
comment on column LC_CONT_HOUSESALEINFO.preselltotalarea
  is '预售总面积';
comment on column LC_CONT_HOUSESALEINFO.projectareas
  is '项目所在区域';
comment on column LC_CONT_HOUSESALEINFO.projectlandlevel
  is '项目用地等级';
comment on column LC_CONT_HOUSESALEINFO.developunit
  is '开发公司';
comment on column LC_CONT_HOUSESALEINFO.unitcharater
  is '单位性质';
comment on column LC_CONT_HOUSESALEINFO.unitaddress
  is '公司地址';
comment on column LC_CONT_HOUSESALEINFO.legalperson
  is '法人代表';
comment on column LC_CONT_HOUSESALEINFO.projectmanager
  is '项目负责人';
comment on column LC_CONT_HOUSESALEINFO.contactphone
  is '联系电话';
comment on column LC_CONT_HOUSESALEINFO.capitalregulationbank
  is '资金监管银行';
comment on column LC_CONT_HOUSESALEINFO.capitalregulationaccount
  is '资金监管账号';
comment on column LC_CONT_HOUSESALEINFO.buildingname
  is '楼盘名称';
comment on column LC_CONT_HOUSESALEINFO.buildingnumber
  is '幢号';
comment on column LC_CONT_HOUSESALEINFO.buildingunitnumber
  is '单元号';
comment on column LC_CONT_HOUSESALEINFO.housenumber
  is '房号';
comment on column LC_CONT_HOUSESALEINFO.housecode
  is '房屋编号';
comment on column LC_CONT_HOUSESALEINFO.contructionarea
  is '建筑面积';
comment on column LC_CONT_HOUSESALEINFO.publicarea
  is '公推面积';
comment on column LC_CONT_HOUSESALEINFO.privatearea
  is '套内面积';
comment on column LC_CONT_HOUSESALEINFO.huxing
  is '户型';
comment on column LC_CONT_HOUSESALEINFO.toilet
  is '卫生间';
comment on column LC_CONT_HOUSESALEINFO.balcony
  is '阳台';
comment on column LC_CONT_HOUSESALEINFO.propertytype
  is '物业类型';
comment on column LC_CONT_HOUSESALEINFO.preselltotalamount
  is '预售总金额';
comment on column LC_CONT_HOUSESALEINFO.housestatus
  is '房屋状态';
comment on column LC_CONT_HOUSESALEINFO.wherehouse
  is '房屋坐落';
comment on column LC_CONT_HOUSESALEINFO.whencreate
  is '建成年份';
comment on column LC_CONT_HOUSESALEINFO.structure
  is '结构';
comment on column LC_CONT_HOUSESALEINFO.bulidtotalfloots
  is '房屋总层数';
comment on column LC_CONT_HOUSESALEINFO.floots
  is '所在层数';
comment on column LC_CONT_HOUSESALEINFO.housecharater
  is '房屋性质';
comment on column LC_CONT_HOUSESALEINFO.flootheight
  is '层高';
comment on column LC_CONT_HOUSESALEINFO.sellername
  is '卖方名称';
comment on column LC_CONT_HOUSESALEINFO.bussinesslinence
  is '营业执照号';
comment on column LC_CONT_HOUSESALEINFO.authorizeperson
  is '法人代表';
comment on column LC_CONT_HOUSESALEINFO.certificationlevel
  is '授权代表';
comment on column LC_CONT_HOUSESALEINFO.sellercontactphone
  is '资质等级';
comment on column LC_CONT_HOUSESALEINFO.isclient
  is '联系电话';
comment on column LC_CONT_HOUSESALEINFO.clientname
  is '联系电话';
comment on column LC_CONT_HOUSESALEINFO.clientlegalperson
  is '是否委托代理';
comment on column LC_CONT_HOUSESALEINFO.sellercontactaddress
  is '委托代理人名称';
comment on column LC_CONT_HOUSESALEINFO.sellerbank
  is '委托代理人法人代表';
comment on column LC_CONT_HOUSESALEINFO.sellerbankaccount
  is '卖方联系地址';
comment on column LC_CONT_HOUSESALEINFO.buyername
  is '卖方开户行';
comment on column LC_CONT_HOUSESALEINFO.buyername2
  is '卖方开户行帐号';
comment on column LC_CONT_HOUSESALEINFO.buyercertification
  is '买方姓名';
comment on column LC_CONT_HOUSESALEINFO.certificationnum
  is '买方姓名（共有权人）';
comment on column LC_CONT_HOUSESALEINFO.buyercontactphone
  is '买方证件';
comment on column LC_CONT_HOUSESALEINFO.buyercontactaddress
  is '证件号码';
comment on column LC_CONT_HOUSESALEINFO.buyersex
  is '买方联系电话';
comment on column LC_CONT_HOUSESALEINFO.buyernationality
  is '买方联系地址';
comment on column LC_CONT_HOUSESALEINFO.buyernation
  is '买方姓别';
comment on column LC_CONT_HOUSESALEINFO.payoffmode
  is '买方国籍';
comment on column LC_CONT_HOUSESALEINFO.contcode
  is '买方民族';
comment on column LC_CONT_HOUSESALEINFO.stockcontid
  is '合同编号';
comment on column LC_CONT_HOUSESALEINFO.contracttime
  is '付款方式';
comment on column LC_CONT_HOUSESALEINFO.contbackuptime
  is '合同编号';
comment on column LC_CONT_HOUSESALEINFO.firstpay
  is '合同签订时间';
comment on column LC_CONT_HOUSESALEINFO.firstpayratio
  is '合同备案时间';
comment on column LC_CONT_HOUSESALEINFO.loanamount
  is '首付款额';
comment on column LC_CONT_HOUSESALEINFO.loanperiod
  is '首付款比例';
comment on column LC_CONT_HOUSESALEINFO.fundloan
  is '贷款额度';
comment on column LC_CONT_HOUSESALEINFO.bussinessloan
  is '贷款年限';
comment on column LC_CONT_HOUSESALEINFO.paymentaccount
  is '公积金贷款';
comment on column LC_CONT_HOUSESALEINFO.accountbank
  is '商业贷款';
comment on column LC_CONT_HOUSESALEINFO.sellprice
  is '还款帐户';
comment on column LC_CONT_HOUSESALEINFO.selltotalamount
  is '开户银行';
comment on column LC_CONT_HOUSESALEINFO.areasupplement
  is '销售单价';
comment on column LC_CONT_HOUSESALEINFO.getintime
  is '销售总价';
comment on column LC_CONT_HOUSESALEINFO.propertyfeestandand
  is '面积补差';
comment on column LC_CONT_HOUSESALEINFO.propertyunitname
  is '入伙时间';
comment on column LC_CONT_HOUSESALEINFO.propertylegalperson
  is '物业费标准';
comment on column LC_CONT_HOUSESALEINFO.propertybussinessnum
  is '物业公司名称';
comment on column LC_CONT_HOUSESALEINFO.propertycertificationlevel
  is '物业公司法人代表';
comment on column LC_CONT_HOUSESALEINFO.propertymanagementperiod
  is '营业执照号';
comment on column LC_CONT_HOUSESALEINFO.createpersonid
  is '营业执照号';
comment on column LC_CONT_HOUSESALEINFO.createperson
  is '资质等级';
comment on column LC_CONT_HOUSESALEINFO.createtime
  is '资质等级';
comment on column LC_CONT_HOUSESALEINFO.sbjstate
  is '物业管理合同期限';
comment on column LC_CONT_HOUSESALEINFO.description
  is '操作描述';
comment on column LC_CONT_HOUSESALEINFO.creator_id
  is '创建者id';
comment on column LC_CONT_HOUSESALEINFO.creator
  is '创建者';
comment on column LC_CONT_HOUSESALEINFO.create_date
  is '创建日期';
comment on column LC_CONT_HOUSESALEINFO.modifiedby
  is '修改人';
comment on column LC_CONT_HOUSESALEINFO.modifiedby_id
  is '修改人id';
comment on column LC_CONT_HOUSESALEINFO.modified_date
  is '修改日期';
comment on column LC_CONT_HOUSESALEINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_CONT_HOUSESALEINFO.version
  is '版本号';
comment on column LC_CONT_HOUSESALEINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_CONT_HOUSESALEINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_CONT_HOUSESALEINFO.bus_date
  is '业务日期';
comment on column LC_CONT_HOUSESALEINFO.exa_remarks
  is '审批备注';
comment on column LC_CONT_HOUSESALEINFO.src_table
  is '来源实体';
comment on column LC_CONT_HOUSESALEINFO.src_system
  is '来源系统';
comment on column LC_CONT_HOUSESALEINFO.sort_id
  is '排序字段';

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
  is '合同基本信息表';
comment on column LC_CONT_INFO.stockcontid
  is '合同编号';
comment on column LC_CONT_INFO.stockcontname
  is '合同名称';
comment on column LC_CONT_INFO.conttype
  is '合同状态';
comment on column LC_CONT_INFO.stakeholder
  is '合同甲方';
comment on column LC_CONT_INFO.stakelinkman
  is '合同甲方联系人';
comment on column LC_CONT_INFO.stakesubdate
  is '合同甲方签署日期';
comment on column LC_CONT_INFO.stakesigner
  is '合同甲方签署人';
comment on column LC_CONT_INFO.associator
  is '合同乙方';
comment on column LC_CONT_INFO.assoclinkman
  is '合同乙方联系人';
comment on column LC_CONT_INFO.associatedate
  is '合同乙方签署日期';
comment on column LC_CONT_INFO.associatesigner
  is '合同乙方签署人';
comment on column LC_CONT_INFO.associator2
  is '合同丙方';
comment on column LC_CONT_INFO.assoclinkman2
  is '合同丙方联系人';
comment on column LC_CONT_INFO.associatedate2
  is '合同丙方签署日期';
comment on column LC_CONT_INFO.associatesigner2
  is '合同丙方签署人';
comment on column LC_CONT_INFO.contacttype
  is '合同类别';
comment on column LC_CONT_INFO.powertree
  is '管理权限树';
comment on column LC_CONT_INFO.sendapprovetype
  is '送审类别';
comment on column LC_CONT_INFO.paytype
  is '支付项类型';
comment on column LC_CONT_INFO.contractprice
  is '合同金额';
comment on column LC_CONT_INFO.moneytype
  is '币种';
comment on column LC_CONT_INFO.validdate
  is '生效日期';
comment on column LC_CONT_INFO.finishdate
  is '完工日期';
comment on column LC_CONT_INFO.prjcode
  is '项目代码';
comment on column LC_CONT_INFO.prjname
  is '项目名称';
comment on column LC_CONT_INFO.prjplace
  is '项目地点';
comment on column LC_CONT_INFO.planbegindate
  is '计划开始时间';
comment on column LC_CONT_INFO.planenddate
  is '计划结束时间';
comment on column LC_CONT_INFO.capitaldivisionratio
  is '资金分配比例';
comment on column LC_CONT_INFO.description
  is '操作描述';
comment on column LC_CONT_INFO.creator_id
  is '创建者id';
comment on column LC_CONT_INFO.creator
  is '创建者';
comment on column LC_CONT_INFO.create_date
  is '创建日期';
comment on column LC_CONT_INFO.modifiedby
  is '修改人';
comment on column LC_CONT_INFO.modifiedby_id
  is '修改人id';
comment on column LC_CONT_INFO.modified_date
  is '修改日期';
comment on column LC_CONT_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_CONT_INFO.version
  is '版本号';
comment on column LC_CONT_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_CONT_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_CONT_INFO.bus_date
  is '业务日期';
comment on column LC_CONT_INFO.exa_remarks
  is '审批备注';
comment on column LC_CONT_INFO.src_table
  is '来源实体';
comment on column LC_CONT_INFO.src_system
  is '来源系统';
comment on column LC_CONT_INFO.sort_id
  is '排序字段';

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
  is '租赁合同表';
comment on column LC_CONT_LANDLEASE.stockcontid
  is '合同编号';
comment on column LC_CONT_LANDLEASE.leasename
  is '租赁合同名称';
comment on column LC_CONT_LANDLEASE.propertytype
  is '物业类型';
comment on column LC_CONT_LANDLEASE.ownership
  is '所有权归属';
comment on column LC_CONT_LANDLEASE.begintime
  is '合同起始日期';
comment on column LC_CONT_LANDLEASE.endtime
  is '合同截止日期';
comment on column LC_CONT_LANDLEASE.usingunit
  is '使用单位';
comment on column LC_CONT_LANDLEASE.legalperson
  is '法定代表人';
comment on column LC_CONT_LANDLEASE.licensenum
  is '营业执照号码';
comment on column LC_CONT_LANDLEASE.contactperson
  is '使用单位联系人';
comment on column LC_CONT_LANDLEASE.contacttel
  is '联系电话';
comment on column LC_CONT_LANDLEASE.constructionarea
  is '建筑面积';
comment on column LC_CONT_LANDLEASE.leaseprice
  is '出租单价';
comment on column LC_CONT_LANDLEASE.remark
  is '备注';
comment on column LC_CONT_LANDLEASE.description
  is '操作描述';
comment on column LC_CONT_LANDLEASE.creator_id
  is '创建者id';
comment on column LC_CONT_LANDLEASE.creator
  is '创建者';
comment on column LC_CONT_LANDLEASE.create_date
  is '创建日期';
comment on column LC_CONT_LANDLEASE.modifiedby
  is '修改人';
comment on column LC_CONT_LANDLEASE.modifiedby_id
  is '修改人id';
comment on column LC_CONT_LANDLEASE.modified_date
  is '修改日期';
comment on column LC_CONT_LANDLEASE.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_CONT_LANDLEASE.version
  is '版本号';
comment on column LC_CONT_LANDLEASE.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_CONT_LANDLEASE.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_CONT_LANDLEASE.bus_date
  is '业务日期';
comment on column LC_CONT_LANDLEASE.exa_remarks
  is '审批备注';
comment on column LC_CONT_LANDLEASE.src_table
  is '来源实体';
comment on column LC_CONT_LANDLEASE.src_system
  is '来源系统';
comment on column LC_CONT_LANDLEASE.sort_id
  is '排序字段';

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
  is '造地合同表';
comment on column LC_CONT_MAKELANDDETAIL.stockcontid
  is '合同编号';
comment on column LC_CONT_MAKELANDDETAIL.payitemcode
  is '支付项代码';
comment on column LC_CONT_MAKELANDDETAIL.payitemname
  is '支付项名称';
comment on column LC_CONT_MAKELANDDETAIL.contnum
  is '合同数量';
comment on column LC_CONT_MAKELANDDETAIL.contunit
  is '合同单价';
comment on column LC_CONT_MAKELANDDETAIL.contcost
  is '本项费用';
comment on column LC_CONT_MAKELANDDETAIL.contratio
  is '支付系数';
comment on column LC_CONT_MAKELANDDETAIL.processrelation
  is '进度关联';
comment on column LC_CONT_MAKELANDDETAIL.numctrl
  is '数量控制';
comment on column LC_CONT_MAKELANDDETAIL.standard
  is '规格';
comment on column LC_CONT_MAKELANDDETAIL.countingunit
  is '计量单位';
comment on column LC_CONT_MAKELANDDETAIL.valuation
  is '履约评价';
comment on column LC_CONT_MAKELANDDETAIL.approvenum
  is '批准文号';
comment on column LC_CONT_MAKELANDDETAIL.approvedate
  is '批准时间';
comment on column LC_CONT_MAKELANDDETAIL.prjcode
  is '项目编号';
comment on column LC_CONT_MAKELANDDETAIL.prjname
  is '项目名称';
comment on column LC_CONT_MAKELANDDETAIL.contractcode
  is '合同编号';
comment on column LC_CONT_MAKELANDDETAIL.contractamount
  is '合同金额';
comment on column LC_CONT_MAKELANDDETAIL.projecttimelimit
  is '工程工期';
comment on column LC_CONT_MAKELANDDETAIL.estimatequantities
  is '预计工程量';
comment on column LC_CONT_MAKELANDDETAIL.workingunit
  is '施工单位';
comment on column LC_CONT_MAKELANDDETAIL.isdigpay
  is '是否挖方区付款';
comment on column LC_CONT_MAKELANDDETAIL.digareanum
  is '挖方区区域编号';
comment on column LC_CONT_MAKELANDDETAIL.diglandnum
  is '地块编号';
comment on column LC_CONT_MAKELANDDETAIL.estimatarea
  is '预计挖方面积';
comment on column LC_CONT_MAKELANDDETAIL.estimatquantity
  is '预计工程量';
comment on column LC_CONT_MAKELANDDETAIL.estimatcost
  is '预计成本';
comment on column LC_CONT_MAKELANDDETAIL.completedquantity
  is '本次完成工程量';
comment on column LC_CONT_MAKELANDDETAIL.nowpayoff
  is '本次支持金额';
comment on column LC_CONT_MAKELANDDETAIL.totalpayoff
  is '累计支出金额';
comment on column LC_CONT_MAKELANDDETAIL.totalquantity
  is '累计完成工程量';
comment on column LC_CONT_MAKELANDDETAIL.mcoareanum
  is '填方区区域编号';
comment on column LC_CONT_MAKELANDDETAIL.mcolandnum
  is '填方区地块编号';
comment on column LC_CONT_MAKELANDDETAIL.mcolandname
  is '填方区地块名称';
comment on column LC_CONT_MAKELANDDETAIL.buystonecount
  is '购入土石方量';
comment on column LC_CONT_MAKELANDDETAIL.costamount
  is '成本金额';
comment on column LC_CONT_MAKELANDDETAIL.description
  is '操作描述';
comment on column LC_CONT_MAKELANDDETAIL.creator_id
  is '创建者id';
comment on column LC_CONT_MAKELANDDETAIL.creator
  is '创建者';
comment on column LC_CONT_MAKELANDDETAIL.create_date
  is '创建日期';
comment on column LC_CONT_MAKELANDDETAIL.modifiedby
  is '修改人';
comment on column LC_CONT_MAKELANDDETAIL.modifiedby_id
  is '修改人id';
comment on column LC_CONT_MAKELANDDETAIL.modified_date
  is '修改日期';
comment on column LC_CONT_MAKELANDDETAIL.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_CONT_MAKELANDDETAIL.version
  is '版本号';
comment on column LC_CONT_MAKELANDDETAIL.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_CONT_MAKELANDDETAIL.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_CONT_MAKELANDDETAIL.bus_date
  is '业务日期';
comment on column LC_CONT_MAKELANDDETAIL.exa_remarks
  is '审批备注';
comment on column LC_CONT_MAKELANDDETAIL.src_table
  is '来源实体';
comment on column LC_CONT_MAKELANDDETAIL.src_system
  is '来源系统';
comment on column LC_CONT_MAKELANDDETAIL.sort_id
  is '排序字段';

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
  is '工程类合同信息表';
comment on column LC_CONT_PRJTERMS.stockcontid
  is '合同编号';
comment on column LC_CONT_PRJTERMS.area
  is '面积';
comment on column LC_CONT_PRJTERMS.qualitystandard
  is '质量标准';
comment on column LC_CONT_PRJTERMS.begindate
  is '开工日期';
comment on column LC_CONT_PRJTERMS.price
  is '单价';
comment on column LC_CONT_PRJTERMS.amount
  is '合同金额';
comment on column LC_CONT_PRJTERMS.finishdate
  is '竣工日期';
comment on column LC_CONT_PRJTERMS.termsmode
  is '结算方式';
comment on column LC_CONT_PRJTERMS.termsperiod
  is '结算期限';
comment on column LC_CONT_PRJTERMS.comflictplace
  is '争议解决地点';
comment on column LC_CONT_PRJTERMS.comflictmode
  is '争议解决方式';
comment on column LC_CONT_PRJTERMS.unitname
  is '单位名称';
comment on column LC_CONT_PRJTERMS.appointedperson
  is '约定代表人';
comment on column LC_CONT_PRJTERMS.clientperson
  is '委托代表人';
comment on column LC_CONT_PRJTERMS.phone
  is '联系电话';
comment on column LC_CONT_PRJTERMS.signingdept
  is '签约部门';
comment on column LC_CONT_PRJTERMS.agent
  is '委托代理人';
comment on column LC_CONT_PRJTERMS.authorizationnum
  is '授权委托书号';
comment on column LC_CONT_PRJTERMS.approvalleader
  is '审批领导';
comment on column LC_CONT_PRJTERMS.areadyfinish
  is '已完成量情况';
comment on column LC_CONT_PRJTERMS.stopworkdays
  is '停工天数';
comment on column LC_CONT_PRJTERMS.settledamount
  is '已结算金额';
comment on column LC_CONT_PRJTERMS.trialbalance
  is '初审结算';
comment on column LC_CONT_PRJTERMS.clearingtime
  is '结算时间';
comment on column LC_CONT_PRJTERMS.description
  is '操作描述';
comment on column LC_CONT_PRJTERMS.creator_id
  is '创建者id';
comment on column LC_CONT_PRJTERMS.creator
  is '创建者';
comment on column LC_CONT_PRJTERMS.create_date
  is '创建日期';
comment on column LC_CONT_PRJTERMS.modifiedby
  is '修改人';
comment on column LC_CONT_PRJTERMS.modifiedby_id
  is '修改人id';
comment on column LC_CONT_PRJTERMS.modified_date
  is '修改日期';
comment on column LC_CONT_PRJTERMS.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_CONT_PRJTERMS.version
  is '版本号';
comment on column LC_CONT_PRJTERMS.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_CONT_PRJTERMS.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_CONT_PRJTERMS.bus_date
  is '业务日期';
comment on column LC_CONT_PRJTERMS.exa_remarks
  is '审批备注';
comment on column LC_CONT_PRJTERMS.src_table
  is '来源实体';
comment on column LC_CONT_PRJTERMS.src_system
  is '来源系统';
comment on column LC_CONT_PRJTERMS.sort_id
  is '排序字段';

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
  is '采购合同表';
comment on column LC_CONT_PURCHASE.stockcontid
  is '合同编号';
comment on column LC_CONT_PURCHASE.contcode
  is '合同编号';
comment on column LC_CONT_PURCHASE.signingtime
  is '签约时间';
comment on column LC_CONT_PURCHASE.unitname
  is '单位名称';
comment on column LC_CONT_PURCHASE.contstandard
  is '合同标准';
comment on column LC_CONT_PURCHASE.qualitystandard
  is '质量标准';
comment on column LC_CONT_PURCHASE.num
  is '数量';
comment on column LC_CONT_PURCHASE.price
  is '单价';
comment on column LC_CONT_PURCHASE.totalamout
  is '合同总金额';
comment on column LC_CONT_PURCHASE.submittime
  is '提（交）货时间';
comment on column LC_CONT_PURCHASE.submitnum
  is '提（交）货数量';
comment on column LC_CONT_PURCHASE.paymenttime
  is '付款时间';
comment on column LC_CONT_PURCHASE.submitedtime
  is '已提（交）货时间';
comment on column LC_CONT_PURCHASE.submitednum
  is '已提（交）货数量';
comment on column LC_CONT_PURCHASE.qualityproblem
  is '质量问题';
comment on column LC_CONT_PURCHASE.paidamout
  is '已付款金额';
comment on column LC_CONT_PURCHASE.paycode
  is '付款凭号';
comment on column LC_CONT_PURCHASE.changerelease
  is '变更解除情况';
comment on column LC_CONT_PURCHASE.dispute
  is '发生纠纷情况';
comment on column LC_CONT_PURCHASE.description
  is '操作描述';
comment on column LC_CONT_PURCHASE.creator_id
  is '创建者id';
comment on column LC_CONT_PURCHASE.creator
  is '创建者';
comment on column LC_CONT_PURCHASE.create_date
  is '创建日期';
comment on column LC_CONT_PURCHASE.modifiedby
  is '修改人';
comment on column LC_CONT_PURCHASE.modifiedby_id
  is '修改人id';
comment on column LC_CONT_PURCHASE.modified_date
  is '修改日期';
comment on column LC_CONT_PURCHASE.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_CONT_PURCHASE.version
  is '版本号';
comment on column LC_CONT_PURCHASE.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_CONT_PURCHASE.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_CONT_PURCHASE.bus_date
  is '业务日期';
comment on column LC_CONT_PURCHASE.exa_remarks
  is '审批备注';
comment on column LC_CONT_PURCHASE.src_table
  is '来源实体';
comment on column LC_CONT_PURCHASE.src_system
  is '来源系统';
comment on column LC_CONT_PURCHASE.sort_id
  is '排序字段';

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
  is '销售合同附件表';
comment on column LC_CONT_SELLATTACHMENT.stockcontid
  is '合同编号';
comment on column LC_CONT_SELLATTACHMENT.pagenum
  is '合同附件页数';
comment on column LC_CONT_SELLATTACHMENT.author
  is '合同附件作者';
comment on column LC_CONT_SELLATTACHMENT.attachversion
  is '合同附件版本';
comment on column LC_CONT_SELLATTACHMENT.description
  is '操作描述';
comment on column LC_CONT_SELLATTACHMENT.creator_id
  is '创建者id';
comment on column LC_CONT_SELLATTACHMENT.creator
  is '创建者';
comment on column LC_CONT_SELLATTACHMENT.create_date
  is '创建日期';
comment on column LC_CONT_SELLATTACHMENT.modifiedby
  is '修改人';
comment on column LC_CONT_SELLATTACHMENT.modifiedby_id
  is '修改人id';
comment on column LC_CONT_SELLATTACHMENT.modified_date
  is '修改日期';
comment on column LC_CONT_SELLATTACHMENT.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_CONT_SELLATTACHMENT.version
  is '版本号';
comment on column LC_CONT_SELLATTACHMENT.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_CONT_SELLATTACHMENT.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_CONT_SELLATTACHMENT.bus_date
  is '业务日期';
comment on column LC_CONT_SELLATTACHMENT.exa_remarks
  is '审批备注';
comment on column LC_CONT_SELLATTACHMENT.src_table
  is '来源实体';
comment on column LC_CONT_SELLATTACHMENT.src_system
  is '来源系统';
comment on column LC_CONT_SELLATTACHMENT.sort_id
  is '排序字段';

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
  is '销售合同收入表';
comment on column LC_CONT_SELLINCOME.stockcontid
  is '合同编号';
comment on column LC_CONT_SELLINCOME.billcode
  is '收款单编号';
comment on column LC_CONT_SELLINCOME.billdate
  is '收款日期';
comment on column LC_CONT_SELLINCOME.approvecode
  is '批准文号';
comment on column LC_CONT_SELLINCOME.contcode
  is '合同编号';
comment on column LC_CONT_SELLINCOME.contname
  is '合同名称';
comment on column LC_CONT_SELLINCOME.prelandsellcontid
  is '原土地出让合同号';
comment on column LC_CONT_SELLINCOME.prelandsellcontname
  is '原土地出让合同名称';
comment on column LC_CONT_SELLINCOME.moneytype
  is '币种';
comment on column LC_CONT_SELLINCOME.transfertotalcost
  is '转让总价';
comment on column LC_CONT_SELLINCOME.nowbillamount
  is '本次收款金额';
comment on column LC_CONT_SELLINCOME.landcode
  is '地块编号';
comment on column LC_CONT_SELLINCOME.landarea_mu
  is '地块面积';
comment on column LC_CONT_SELLINCOME.landusing
  is '地块用途';
comment on column LC_CONT_SELLINCOME.description
  is '操作描述';
comment on column LC_CONT_SELLINCOME.creator_id
  is '创建者id';
comment on column LC_CONT_SELLINCOME.creator
  is '创建者';
comment on column LC_CONT_SELLINCOME.create_date
  is '创建日期';
comment on column LC_CONT_SELLINCOME.modifiedby
  is '修改人';
comment on column LC_CONT_SELLINCOME.modifiedby_id
  is '修改人id';
comment on column LC_CONT_SELLINCOME.modified_date
  is '修改日期';
comment on column LC_CONT_SELLINCOME.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_CONT_SELLINCOME.version
  is '版本号';
comment on column LC_CONT_SELLINCOME.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_CONT_SELLINCOME.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_CONT_SELLINCOME.bus_date
  is '业务日期';
comment on column LC_CONT_SELLINCOME.exa_remarks
  is '审批备注';
comment on column LC_CONT_SELLINCOME.src_table
  is '来源实体';
comment on column LC_CONT_SELLINCOME.src_system
  is '来源系统';
comment on column LC_CONT_SELLINCOME.sort_id
  is '排序字段';

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
  is '销售合同到账计划表';
comment on column LC_CONT_SELLTOACCOUNTPLAN.stockcontid
  is '合同编号';
comment on column LC_CONT_SELLTOACCOUNTPLAN.totalcapital
  is '资金到账金额总计';
comment on column LC_CONT_SELLTOACCOUNTPLAN.howmuchperiod
  is '共分_期支付';
comment on column LC_CONT_SELLTOACCOUNTPLAN.paydesc
  is '支付说明';
comment on column LC_CONT_SELLTOACCOUNTPLAN.planpaydate
  is '计划支付日期';
comment on column LC_CONT_SELLTOACCOUNTPLAN.planpayamount
  is '计划支付金额';
comment on column LC_CONT_SELLTOACCOUNTPLAN.remark
  is '备注事项';
comment on column LC_CONT_SELLTOACCOUNTPLAN.description
  is '操作描述';
comment on column LC_CONT_SELLTOACCOUNTPLAN.creator_id
  is '创建者id';
comment on column LC_CONT_SELLTOACCOUNTPLAN.creator
  is '创建者';
comment on column LC_CONT_SELLTOACCOUNTPLAN.create_date
  is '创建日期';
comment on column LC_CONT_SELLTOACCOUNTPLAN.modifiedby
  is '修改人';
comment on column LC_CONT_SELLTOACCOUNTPLAN.modifiedby_id
  is '修改人id';
comment on column LC_CONT_SELLTOACCOUNTPLAN.modified_date
  is '修改日期';
comment on column LC_CONT_SELLTOACCOUNTPLAN.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_CONT_SELLTOACCOUNTPLAN.version
  is '版本号';
comment on column LC_CONT_SELLTOACCOUNTPLAN.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_CONT_SELLTOACCOUNTPLAN.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_CONT_SELLTOACCOUNTPLAN.bus_date
  is '业务日期';
comment on column LC_CONT_SELLTOACCOUNTPLAN.exa_remarks
  is '审批备注';
comment on column LC_CONT_SELLTOACCOUNTPLAN.src_table
  is '来源实体';
comment on column LC_CONT_SELLTOACCOUNTPLAN.src_system
  is '来源系统';
comment on column LC_CONT_SELLTOACCOUNTPLAN.sort_id
  is '排序字段';

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
  is '监理合同支付信息表';
comment on column LC_CONT_SUPERVISORINFO.stockcontid
  is '合同编号';
comment on column LC_CONT_SUPERVISORINFO.billcode
  is '单据编号';
comment on column LC_CONT_SUPERVISORINFO.billdate
  is '单据时间';
comment on column LC_CONT_SUPERVISORINFO.makelandprj
  is '造地项目';
comment on column LC_CONT_SUPERVISORINFO.supervisorunit
  is '监理单位';
comment on column LC_CONT_SUPERVISORINFO.applicationon
  is '申请付款人';
comment on column LC_CONT_SUPERVISORINFO.approver
  is '审批人';
comment on column LC_CONT_SUPERVISORINFO.whichtimes
  is '第几次付款';
comment on column LC_CONT_SUPERVISORINFO.payoffdesc
  is '付款说明';
comment on column LC_CONT_SUPERVISORINFO.nowpayoff
  is '本次付款金额';
comment on column LC_CONT_SUPERVISORINFO.totalpayoff
  is '累计付款金额';
comment on column LC_CONT_SUPERVISORINFO.prjcontcode
  is '工程合同号';
comment on column LC_CONT_SUPERVISORINFO.prjcontname
  is '工程合同名称';
comment on column LC_CONT_SUPERVISORINFO.prjcontamount
  is '工程合同金额';
comment on column LC_CONT_SUPERVISORINFO.prjconttotalamount
  is '工程合同结算金额';
comment on column LC_CONT_SUPERVISORINFO.payoffratio
  is '付款比例';
comment on column LC_CONT_SUPERVISORINFO.supervisor
  is '监理合同金额';
comment on column LC_CONT_SUPERVISORINFO.description
  is '操作描述';
comment on column LC_CONT_SUPERVISORINFO.creator_id
  is '创建者id';
comment on column LC_CONT_SUPERVISORINFO.creator
  is '创建者';
comment on column LC_CONT_SUPERVISORINFO.create_date
  is '创建日期';
comment on column LC_CONT_SUPERVISORINFO.modifiedby
  is '修改人';
comment on column LC_CONT_SUPERVISORINFO.modifiedby_id
  is '修改人id';
comment on column LC_CONT_SUPERVISORINFO.modified_date
  is '修改日期';
comment on column LC_CONT_SUPERVISORINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_CONT_SUPERVISORINFO.version
  is '版本号';
comment on column LC_CONT_SUPERVISORINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_CONT_SUPERVISORINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_CONT_SUPERVISORINFO.bus_date
  is '业务日期';
comment on column LC_CONT_SUPERVISORINFO.exa_remarks
  is '审批备注';
comment on column LC_CONT_SUPERVISORINFO.src_table
  is '来源实体';
comment on column LC_CONT_SUPERVISORINFO.src_system
  is '来源系统';
comment on column LC_CONT_SUPERVISORINFO.sort_id
  is '排序字段';

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
  is '客户信息表';
comment on column LC_CUST_INFO.code
  is '客户代码';
comment on column LC_CUST_INFO.name
  is '客户名称';
comment on column LC_CUST_INFO.certificatenum
  is '法人证件号码';
comment on column LC_CUST_INFO.companynatureid
  is '企业性质';
comment on column LC_CUST_INFO.registeredcapital
  is '注册资本';
comment on column LC_CUST_INFO.city
  is '所在城市';
comment on column LC_CUST_INFO.bank
  is '开户银行';
comment on column LC_CUST_INFO.account
  is '银行账号';
comment on column LC_CUST_INFO.representative
  is '法人代表';
comment on column LC_CUST_INFO.contactperson
  is '联系人';
comment on column LC_CUST_INFO.businesslicense
  is '营业执照号';
comment on column LC_CUST_INFO.bussinessscope
  is '经营范围';
comment on column LC_CUST_INFO.orgcode
  is '组织机构代码证';
comment on column LC_CUST_INFO.areataxnum
  is '地税登记号';
comment on column LC_CUST_INFO.nationtaxnum
  is '国税登记号';
comment on column LC_CUST_INFO.address
  is '通讯地址';
comment on column LC_CUST_INFO.postalcode
  is '邮政编码';
comment on column LC_CUST_INFO.phone
  is '电话号码';
comment on column LC_CUST_INFO.fax
  is '传真号码';
comment on column LC_CUST_INFO.email
  is '电子邮件';
comment on column LC_CUST_INFO.homepage
  is '公司主页';
comment on column LC_CUST_INFO.cust_description
  is '公司简介';
comment on column LC_CUST_INFO.transationtypeid
  is '交易类型';
comment on column LC_CUST_INFO.statusid
  is '客户状态';
comment on column LC_CUST_INFO.buyprice
  is '购买价格';
comment on column LC_CUST_INFO.rentalprice
  is '租赁价格';
comment on column LC_CUST_INFO.transationcode
  is '交易编号';
comment on column LC_CUST_INFO.contcode
  is '合同编号';
comment on column LC_CUST_INFO.contname
  is '合同名称';
comment on column LC_CUST_INFO.investprjname
  is '投资项目名称';
comment on column LC_CUST_INFO.agent
  is '委托代理人';
comment on column LC_CUST_INFO.clientcertificatenum
  is '委托人证件号码';
comment on column LC_CUST_INFO.clientphone
  is '委托人电话';
comment on column LC_CUST_INFO.clientaddress
  is '委托人地址';
comment on column LC_CUST_INFO.emp_code
  is '人员编号';
comment on column LC_CUST_INFO.emp_name
  is '姓名';
comment on column LC_CUST_INFO.emp_sex
  is '性别';
comment on column LC_CUST_INFO.emp_job
  is '职位';
comment on column LC_CUST_INFO.emp_phone
  is '办公电话';
comment on column LC_CUST_INFO.emp_fax
  is '传真';
comment on column LC_CUST_INFO.emp_email
  is '电子邮件';
comment on column LC_CUST_INFO.emp_address
  is '地址';
comment on column LC_CUST_INFO.emp_postalcode
  is '邮政编码';
comment on column LC_CUST_INFO.emp_mobile
  is '移动电话';
comment on column LC_CUST_INFO.emp_homecall
  is '家庭电话';
comment on column LC_CUST_INFO.emp_othermethod
  is '其他联系方式';
comment on column LC_CUST_INFO.description
  is '操作描述';
comment on column LC_CUST_INFO.creator_id
  is '创建者id';
comment on column LC_CUST_INFO.creator
  is '创建者';
comment on column LC_CUST_INFO.create_date
  is '创建日期';
comment on column LC_CUST_INFO.modifiedby
  is '修改人';
comment on column LC_CUST_INFO.modifiedby_id
  is '修改人id';
comment on column LC_CUST_INFO.modified_date
  is '修改日期';
comment on column LC_CUST_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_CUST_INFO.version
  is '版本号';
comment on column LC_CUST_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_CUST_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_CUST_INFO.bus_date
  is '业务日期';
comment on column LC_CUST_INFO.exa_remarks
  is '审批备注';
comment on column LC_CUST_INFO.src_table
  is '来源实体';
comment on column LC_CUST_INFO.src_system
  is '来源系统';
comment on column LC_CUST_INFO.sort_id
  is '排序字段';

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
  is '人员信息表';
comment on column LC_EMP_INFO.code
  is '员工编号';
comment on column LC_EMP_INFO.cardcode
  is '工卡号';
comment on column LC_EMP_INFO.name
  is '姓名';
comment on column LC_EMP_INFO.pinyin
  is '汉语拼音';
comment on column LC_EMP_INFO.sex
  is '性别';
comment on column LC_EMP_INFO.birthday
  is '出生日期';
comment on column LC_EMP_INFO.bloodtype
  is '血型';
comment on column LC_EMP_INFO.idcard
  is '身份证号';
comment on column LC_EMP_INFO.marry
  is '婚姻状况';
comment on column LC_EMP_INFO.nation
  is '民族';
comment on column LC_EMP_INFO.birthplace
  is '出生地点';
comment on column LC_EMP_INFO.originplace
  is '籍贯';
comment on column LC_EMP_INFO.photo
  is '照片附件';
comment on column LC_EMP_INFO.personindentity
  is '个人身份';
comment on column LC_EMP_INFO.politicaloutlook
  is '政治面貌';
comment on column LC_EMP_INFO.joininparty
  is '参加党团时间';
comment on column LC_EMP_INFO.partyoffice
  is '党团职务';
comment on column LC_EMP_INFO.workingtime
  is '参加工作时间';
comment on column LC_EMP_INFO.joininipbtime
  is '进入招商局系统工作时间';
comment on column LC_EMP_INFO.mana_unit
  is '行政所在单位';
comment on column LC_EMP_INFO.department
  is '行政部门';
comment on column LC_EMP_INFO.joinincorptime
  is '入司日期';
comment on column LC_EMP_INFO.statusdate
  is '转正日期';
comment on column LC_EMP_INFO.emptype
  is '员工类别';
comment on column LC_EMP_INFO.joinintype
  is '入司方式';
comment on column LC_EMP_INFO.mana_job
  is '行政职务';
comment on column LC_EMP_INFO.mana_joblevel
  is '职务级别';
comment on column LC_EMP_INFO.nowjobbegindate
  is '现职开始日期';
comment on column LC_EMP_INFO.contracttype
  is '合同类别';
comment on column LC_EMP_INFO.contractbegindate
  is '合同签订日期';
comment on column LC_EMP_INFO.contractenddate
  is '合同到期日期';
comment on column LC_EMP_INFO.education
  is '学历';
comment on column LC_EMP_INFO.academicdegree
  is '学位';
comment on column LC_EMP_INFO.graguateduniversity
  is '毕业院校';
comment on column LC_EMP_INFO.profession
  is '专业';
comment on column LC_EMP_INFO.edu_begindate
  is '入学时间';
comment on column LC_EMP_INFO.edu_enddate
  is '毕业时间';
comment on column LC_EMP_INFO.foreignlanguage
  is '外语语种';
comment on column LC_EMP_INFO.languagelevel
  is '外语等级';
comment on column LC_EMP_INFO.technicaltitle
  is '技术职称';
comment on column LC_EMP_INFO.titlelevel
  is '职称等级';
comment on column LC_EMP_INFO.occupationqualification
  is '职业资格';
comment on column LC_EMP_INFO.certification
  is '上岗证(操作证)';
comment on column LC_EMP_INFO.city
  is '工作城市';
comment on column LC_EMP_INFO.officeaddress
  is '办公地址';
comment on column LC_EMP_INFO.officephone
  is '固定电话';
comment on column LC_EMP_INFO.mobile
  is '移动电话';
comment on column LC_EMP_INFO.email
  is '电子邮件';
comment on column LC_EMP_INFO.officepostalcode
  is '办公地邮政编码';
comment on column LC_EMP_INFO.homeaddress
  is '家庭住址';
comment on column LC_EMP_INFO.homephone
  is '住宅电话';
comment on column LC_EMP_INFO.homepostalcode
  is '家庭所在地邮政编码';
comment on column LC_EMP_INFO.emergencyperson
  is '紧急联络人';
comment on column LC_EMP_INFO.emergencyphone
  is '紧急联络电话';
comment on column LC_EMP_INFO.worked_begindate
  is '工作开始日期';
comment on column LC_EMP_INFO.worked_enddate
  is '工作结束日期';
comment on column LC_EMP_INFO.worked_unit
  is '工作单位';
comment on column LC_EMP_INFO.worked_department
  is '工作部门';
comment on column LC_EMP_INFO.worked_job
  is '工作职务';
comment on column LC_EMP_INFO.working
  is '所从事（分管）的工作';
comment on column LC_EMP_INFO.tra_begindate
  is '培训开始日期';
comment on column LC_EMP_INFO.tra_enddate
  is '培训结束日期';
comment on column LC_EMP_INFO.tra_content
  is '培训内容';
comment on column LC_EMP_INFO.tra_unit
  is '培训机构';
comment on column LC_EMP_INFO.tra_type
  is '培训类型';
comment on column LC_EMP_INFO.tra_mode
  is '培训方式';
comment on column LC_EMP_INFO.membername
  is '家庭成员姓名';
comment on column LC_EMP_INFO.relation
  is '与本人关系';
comment on column LC_EMP_INFO.fra_birthday
  is '家庭成员出生日期';
comment on column LC_EMP_INFO.fra_unit
  is '家庭成员工作单位';
comment on column LC_EMP_INFO.fra_job
  is '家庭成员职务';
comment on column LC_EMP_INFO.fra_phone
  is '家庭成员联系电话';
comment on column LC_EMP_INFO.fra_sex
  is '家庭成员性别';
comment on column LC_EMP_INFO.description
  is '操作描述';
comment on column LC_EMP_INFO.creator_id
  is '创建者id';
comment on column LC_EMP_INFO.creator
  is '创建者';
comment on column LC_EMP_INFO.create_date
  is '创建日期';
comment on column LC_EMP_INFO.modifiedby
  is '修改人';
comment on column LC_EMP_INFO.modifiedby_id
  is '修改人id';
comment on column LC_EMP_INFO.modified_date
  is '修改日期';
comment on column LC_EMP_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_EMP_INFO.version
  is '版本号';
comment on column LC_EMP_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_EMP_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_EMP_INFO.bus_date
  is '业务日期';
comment on column LC_EMP_INFO.exa_remarks
  is '审批备注';
comment on column LC_EMP_INFO.src_table
  is '来源实体';
comment on column LC_EMP_INFO.src_system
  is '来源系统';
comment on column LC_EMP_INFO.sort_id
  is '排序字段';

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
  is '地块征地基本信息表';
comment on column LC_LAND_BUYINFO.landcode
  is '地块编码';
comment on column LC_LAND_BUYINFO.buycost
  is '征地成本';
comment on column LC_LAND_BUYINFO.buyyear
  is '征地年份';
comment on column LC_LAND_BUYINFO.buytype
  is '征地类别';
comment on column LC_LAND_BUYINFO.buytimes
  is '征地批次';
comment on column LC_LAND_BUYINFO.contcode
  is '合同编号';
comment on column LC_LAND_BUYINFO.description
  is '操作描述';
comment on column LC_LAND_BUYINFO.creator_id
  is '创建者id';
comment on column LC_LAND_BUYINFO.creator
  is '创建者';
comment on column LC_LAND_BUYINFO.create_date
  is '创建日期';
comment on column LC_LAND_BUYINFO.modifiedby
  is '修改人';
comment on column LC_LAND_BUYINFO.modifiedby_id
  is '修改人id';
comment on column LC_LAND_BUYINFO.modified_date
  is '修改日期';
comment on column LC_LAND_BUYINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_LAND_BUYINFO.version
  is '版本号';
comment on column LC_LAND_BUYINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_LAND_BUYINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_LAND_BUYINFO.bus_date
  is '业务日期';
comment on column LC_LAND_BUYINFO.exa_remarks
  is '审批备注';
comment on column LC_LAND_BUYINFO.src_table
  is '来源实体';
comment on column LC_LAND_BUYINFO.src_system
  is '来源系统';
comment on column LC_LAND_BUYINFO.sort_id
  is '排序字段';

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
  is '地块造地开发信息表';
comment on column LC_LAND_DEVELOP.landcode
  is '地块编码';
comment on column LC_LAND_DEVELOP.storagecode
  is '地块开发编码';
comment on column LC_LAND_DEVELOP.projectname
  is '地块开发名称';
comment on column LC_LAND_DEVELOP.storageyear
  is '开发年份';
comment on column LC_LAND_DEVELOP.description
  is '操作描述';
comment on column LC_LAND_DEVELOP.creator_id
  is '创建者id';
comment on column LC_LAND_DEVELOP.creator
  is '创建者';
comment on column LC_LAND_DEVELOP.create_date
  is '创建日期';
comment on column LC_LAND_DEVELOP.modifiedby
  is '修改人';
comment on column LC_LAND_DEVELOP.modifiedby_id
  is '修改人id';
comment on column LC_LAND_DEVELOP.modified_date
  is '修改日期';
comment on column LC_LAND_DEVELOP.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_LAND_DEVELOP.version
  is '版本号';
comment on column LC_LAND_DEVELOP.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_LAND_DEVELOP.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_LAND_DEVELOP.bus_date
  is '业务日期';
comment on column LC_LAND_DEVELOP.exa_remarks
  is '审批备注';
comment on column LC_LAND_DEVELOP.src_table
  is '来源实体';
comment on column LC_LAND_DEVELOP.src_system
  is '来源系统';
comment on column LC_LAND_DEVELOP.sort_id
  is '排序字段';

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
  is '地块基本信息表';
comment on column LC_LAND_INFO.landcode
  is '地块编码';
comment on column LC_LAND_INFO.landtype
  is '地块类型';
comment on column LC_LAND_INFO.landposition
  is '地块位置';
comment on column LC_LAND_INFO.landname
  is '地块名称';
comment on column LC_LAND_INFO.landareadivision
  is '地块区划';
comment on column LC_LAND_INFO.landapprovenumber
  is '地块批准文号';
comment on column LC_LAND_INFO.landapprovedate
  is '地块批准时间';
comment on column LC_LAND_INFO.parentname
  is '权属名称';
comment on column LC_LAND_INFO.landstatus
  is '地块状态';
comment on column LC_LAND_INFO.landshape
  is '地块形状';
comment on column LC_LAND_INFO.landlength
  is '地块长度';
comment on column LC_LAND_INFO.landwidth
  is '地块宽度';
comment on column LC_LAND_INFO.landarea_mu
  is '地块面积（亩）';
comment on column LC_LAND_INFO.landarea_square
  is '地块面积（平方米）';
comment on column LC_LAND_INFO.landphoto
  is '地块图片';
comment on column LC_LAND_INFO.landusing
  is '地块用途';
comment on column LC_LAND_INFO.description
  is '操作描述';
comment on column LC_LAND_INFO.creator_id
  is '创建者id';
comment on column LC_LAND_INFO.creator
  is '创建者';
comment on column LC_LAND_INFO.create_date
  is '创建日期';
comment on column LC_LAND_INFO.modifiedby
  is '修改人';
comment on column LC_LAND_INFO.modifiedby_id
  is '修改人id';
comment on column LC_LAND_INFO.modified_date
  is '修改日期';
comment on column LC_LAND_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_LAND_INFO.version
  is '版本号';
comment on column LC_LAND_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_LAND_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_LAND_INFO.bus_date
  is '业务日期';
comment on column LC_LAND_INFO.exa_remarks
  is '审批备注';
comment on column LC_LAND_INFO.src_table
  is '来源实体';
comment on column LC_LAND_INFO.src_system
  is '来源系统';
comment on column LC_LAND_INFO.sort_id
  is '排序字段';

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
  is '地块收储信息表';
comment on column LC_LAND_MAKEINFO.landcode
  is '地块编码';
comment on column LC_LAND_MAKEINFO.makecost
  is '造地成本';
comment on column LC_LAND_MAKEINFO.makeprice
  is '造地单价';
comment on column LC_LAND_MAKEINFO.stonevolume
  is '土石方量';
comment on column LC_LAND_MAKEINFO.makeyear
  is '造地年份';
comment on column LC_LAND_MAKEINFO.contcode
  is '合同编号';
comment on column LC_LAND_MAKEINFO.description
  is '操作描述';
comment on column LC_LAND_MAKEINFO.creator_id
  is '创建者id';
comment on column LC_LAND_MAKEINFO.creator
  is '创建者';
comment on column LC_LAND_MAKEINFO.create_date
  is '创建日期';
comment on column LC_LAND_MAKEINFO.modifiedby
  is '修改人';
comment on column LC_LAND_MAKEINFO.modifiedby_id
  is '修改人id';
comment on column LC_LAND_MAKEINFO.modified_date
  is '修改日期';
comment on column LC_LAND_MAKEINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_LAND_MAKEINFO.version
  is '版本号';
comment on column LC_LAND_MAKEINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_LAND_MAKEINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_LAND_MAKEINFO.bus_date
  is '业务日期';
comment on column LC_LAND_MAKEINFO.exa_remarks
  is '审批备注';
comment on column LC_LAND_MAKEINFO.src_table
  is '来源实体';
comment on column LC_LAND_MAKEINFO.src_system
  is '来源系统';
comment on column LC_LAND_MAKEINFO.sort_id
  is '排序字段';

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
  is '地块售地运作信息表';
comment on column LC_LAND_OPERATIONSINFO.landcode
  is '地块编码';
comment on column LC_LAND_OPERATIONSINFO.contcode
  is '合同编号';
comment on column LC_LAND_OPERATIONSINFO.contname
  is '合同名称';
comment on column LC_LAND_OPERATIONSINFO.prelandtransferbuycontcode
  is '原土地出让合同号（征地合同）';
comment on column LC_LAND_OPERATIONSINFO.prelandtransferbuycontname
  is '原土地出让合同名称';
comment on column LC_LAND_OPERATIONSINFO.landtransferperiod
  is '土地转让年限';
comment on column LC_LAND_OPERATIONSINFO.transfertotalamount
  is '转让总价';
comment on column LC_LAND_OPERATIONSINFO.sellprice
  is '售地单价';
comment on column LC_LAND_OPERATIONSINFO.conttotalamount
  is '合同金额';
comment on column LC_LAND_OPERATIONSINFO.agreedate
  is '约定交地时间';
comment on column LC_LAND_OPERATIONSINFO.reallydate
  is '实际交地时间';
comment on column LC_LAND_OPERATIONSINFO.bookingpayoffdate
  is '预订付款时间';
comment on column LC_LAND_OPERATIONSINFO.reallypayoffdate
  is '实际付款时间';
comment on column LC_LAND_OPERATIONSINFO.description
  is '操作描述';
comment on column LC_LAND_OPERATIONSINFO.creator_id
  is '创建者id';
comment on column LC_LAND_OPERATIONSINFO.creator
  is '创建者';
comment on column LC_LAND_OPERATIONSINFO.create_date
  is '创建日期';
comment on column LC_LAND_OPERATIONSINFO.modifiedby
  is '修改人';
comment on column LC_LAND_OPERATIONSINFO.modifiedby_id
  is '修改人id';
comment on column LC_LAND_OPERATIONSINFO.modified_date
  is '修改日期';
comment on column LC_LAND_OPERATIONSINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_LAND_OPERATIONSINFO.version
  is '版本号';
comment on column LC_LAND_OPERATIONSINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_LAND_OPERATIONSINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_LAND_OPERATIONSINFO.bus_date
  is '业务日期';
comment on column LC_LAND_OPERATIONSINFO.exa_remarks
  is '审批备注';
comment on column LC_LAND_OPERATIONSINFO.src_table
  is '来源实体';
comment on column LC_LAND_OPERATIONSINFO.src_system
  is '来源系统';
comment on column LC_LAND_OPERATIONSINFO.sort_id
  is '排序字段';

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
  is '地块规划信息表';
comment on column LC_LAND_PLANINFO.landcode
  is '地块编码';
comment on column LC_LAND_PLANINFO.buydate
  is '征地时间';
comment on column LC_LAND_PLANINFO.developdate
  is '开发时间';
comment on column LC_LAND_PLANINFO.transferdate
  is '转让时间';
comment on column LC_LAND_PLANINFO.transferperiod
  is '转让期限';
comment on column LC_LAND_PLANINFO.transferprice
  is '转让价格';
comment on column LC_LAND_PLANINFO.usingunit
  is '使用单位';
comment on column LC_LAND_PLANINFO.parcelcode
  is '宗地编号';
comment on column LC_LAND_PLANINFO.iguid
  is 'IGUID';
comment on column LC_LAND_PLANINFO.makecost
  is '造地成本';
comment on column LC_LAND_PLANINFO.buycost
  is '征地成本';
comment on column LC_LAND_PLANINFO.transferprofit
  is '转让收益';
comment on column LC_LAND_PLANINFO.financefee
  is '财务费用';
comment on column LC_LAND_PLANINFO.managefee
  is '管理费用';
comment on column LC_LAND_PLANINFO.description
  is '操作描述';
comment on column LC_LAND_PLANINFO.creator_id
  is '创建者id';
comment on column LC_LAND_PLANINFO.creator
  is '创建者';
comment on column LC_LAND_PLANINFO.create_date
  is '创建日期';
comment on column LC_LAND_PLANINFO.modifiedby
  is '修改人';
comment on column LC_LAND_PLANINFO.modifiedby_id
  is '修改人id';
comment on column LC_LAND_PLANINFO.modified_date
  is '修改日期';
comment on column LC_LAND_PLANINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_LAND_PLANINFO.version
  is '版本号';
comment on column LC_LAND_PLANINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_LAND_PLANINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_LAND_PLANINFO.bus_date
  is '业务日期';
comment on column LC_LAND_PLANINFO.exa_remarks
  is '审批备注';
comment on column LC_LAND_PLANINFO.src_table
  is '来源实体';
comment on column LC_LAND_PLANINFO.src_system
  is '来源系统';
comment on column LC_LAND_PLANINFO.sort_id
  is '排序字段';

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
  is '地块售地信息表';
comment on column LC_LAND_SELLINFO.landcode
  is '地块编码';
comment on column LC_LAND_SELLINFO.sellyear
  is '售地年份';
comment on column LC_LAND_SELLINFO.plantransferyear
  is '计划转让年份';
comment on column LC_LAND_SELLINFO.sellcontcode
  is '售地合同编号';
comment on column LC_LAND_SELLINFO.parcelcode
  is '宗地号';
comment on column LC_LAND_SELLINFO.transfer
  is '地块转让方';
comment on column LC_LAND_SELLINFO.transferee
  is '地块受让方';
comment on column LC_LAND_SELLINFO.dealdate
  is '交地时间';
comment on column LC_LAND_SELLINFO.description
  is '操作描述';
comment on column LC_LAND_SELLINFO.creator_id
  is '创建者id';
comment on column LC_LAND_SELLINFO.creator
  is '创建者';
comment on column LC_LAND_SELLINFO.create_date
  is '创建日期';
comment on column LC_LAND_SELLINFO.modifiedby
  is '修改人';
comment on column LC_LAND_SELLINFO.modifiedby_id
  is '修改人id';
comment on column LC_LAND_SELLINFO.modified_date
  is '修改日期';
comment on column LC_LAND_SELLINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_LAND_SELLINFO.version
  is '版本号';
comment on column LC_LAND_SELLINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_LAND_SELLINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_LAND_SELLINFO.bus_date
  is '业务日期';
comment on column LC_LAND_SELLINFO.exa_remarks
  is '审批备注';
comment on column LC_LAND_SELLINFO.src_table
  is '来源实体';
comment on column LC_LAND_SELLINFO.src_system
  is '来源系统';
comment on column LC_LAND_SELLINFO.sort_id
  is '排序字段';

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
  is '地块储地信息表';
comment on column LC_LAND_STORAGEINFO.landcode
  is '地块编码';
comment on column LC_LAND_STORAGEINFO.storecode
  is '收储编号';
comment on column LC_LAND_STORAGEINFO.prjname
  is '项目名称';
comment on column LC_LAND_STORAGEINFO.storeyear
  is '收储年份';
comment on column LC_LAND_STORAGEINFO.description
  is '操作描述';
comment on column LC_LAND_STORAGEINFO.creator_id
  is '创建者id';
comment on column LC_LAND_STORAGEINFO.creator
  is '创建者';
comment on column LC_LAND_STORAGEINFO.create_date
  is '创建日期';
comment on column LC_LAND_STORAGEINFO.modifiedby
  is '修改人';
comment on column LC_LAND_STORAGEINFO.modifiedby_id
  is '修改人id';
comment on column LC_LAND_STORAGEINFO.modified_date
  is '修改日期';
comment on column LC_LAND_STORAGEINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_LAND_STORAGEINFO.version
  is '版本号';
comment on column LC_LAND_STORAGEINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_LAND_STORAGEINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_LAND_STORAGEINFO.bus_date
  is '业务日期';
comment on column LC_LAND_STORAGEINFO.exa_remarks
  is '审批备注';
comment on column LC_LAND_STORAGEINFO.src_table
  is '来源实体';
comment on column LC_LAND_STORAGEINFO.src_system
  is '来源系统';
comment on column LC_LAND_STORAGEINFO.sort_id
  is '排序字段';

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
  is '地块用地范围信息表';
comment on column LC_LAND_USERANGE.landcode
  is '地块编码';
comment on column LC_LAND_USERANGE.areacode
  is '区域编号';
comment on column LC_LAND_USERANGE.areameasure
  is '区域面积';
comment on column LC_LAND_USERANGE.landscopeline
  is '用地范围线';
comment on column LC_LAND_USERANGE.landplanlayer
  is '用地规划图层';
comment on column LC_LAND_USERANGE.description
  is '操作描述';
comment on column LC_LAND_USERANGE.creator_id
  is '创建者id';
comment on column LC_LAND_USERANGE.creator
  is '创建者';
comment on column LC_LAND_USERANGE.create_date
  is '创建日期';
comment on column LC_LAND_USERANGE.modifiedby
  is '修改人';
comment on column LC_LAND_USERANGE.modifiedby_id
  is '修改人id';
comment on column LC_LAND_USERANGE.modified_date
  is '修改日期';
comment on column LC_LAND_USERANGE.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_LAND_USERANGE.version
  is '版本号';
comment on column LC_LAND_USERANGE.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_LAND_USERANGE.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_LAND_USERANGE.bus_date
  is '业务日期';
comment on column LC_LAND_USERANGE.exa_remarks
  is '审批备注';
comment on column LC_LAND_USERANGE.src_table
  is '来源实体';
comment on column LC_LAND_USERANGE.src_system
  is '来源系统';
comment on column LC_LAND_USERANGE.sort_id
  is '排序字段';

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
  is '组织基本信息表';
comment on column LC_ORG_INFO.code
  is '组织代码';
comment on column LC_ORG_INFO.name
  is '组织名称';
comment on column LC_ORG_INFO.org_type
  is '组织类型';
comment on column LC_ORG_INFO.shortname
  is '组织简称';
comment on column LC_ORG_INFO.relation
  is '隶属关系';
comment on column LC_ORG_INFO.org_level
  is '组织级别';
comment on column LC_ORG_INFO.competentorg
  is '主管单位名称';
comment on column LC_ORG_INFO.properties
  is '组织性质';
comment on column LC_ORG_INFO.established
  is '成立时间';
comment on column LC_ORG_INFO.personsresponsible
  is '负责人';
comment on column LC_ORG_INFO.contactperson
  is '联系人';
comment on column LC_ORG_INFO.corporateinterest
  is '权益公司';
comment on column LC_ORG_INFO.corporateinteresttype
  is '权益公司类型';
comment on column LC_ORG_INFO.rightproportion
  is '权益比例';
comment on column LC_ORG_INFO.shareholdingratio
  is '持股比例';
comment on column LC_ORG_INFO.amountcontribution
  is '总出资额';
comment on column LC_ORG_INFO.accountingmethod
  is '核算方法';
comment on column LC_ORG_INFO.begindate
  is '开始时间';
comment on column LC_ORG_INFO.enddate
  is '结束时间';
comment on column LC_ORG_INFO.registeredcapital
  is '注册资本';
comment on column LC_ORG_INFO.paidupcapital
  is '实收资本';
comment on column LC_ORG_INFO.emp_inside
  is '董事（内部人员）';
comment on column LC_ORG_INFO.emp_outside
  is '董事（外部人员）';
comment on column LC_ORG_INFO.emp_independent
  is '独立董事姓名';
comment on column LC_ORG_INFO.emp_supervisor
  is '监事（内部人员）';
comment on column LC_ORG_INFO.postaladdress
  is '通讯地址';
comment on column LC_ORG_INFO.zipcode
  is '邮政编码';
comment on column LC_ORG_INFO.phonenumber
  is '电话号码';
comment on column LC_ORG_INFO.faxno
  is '传真号码';
comment on column LC_ORG_INFO.cablenumber
  is '电报号码';
comment on column LC_ORG_INFO.description
  is '操作描述';
comment on column LC_ORG_INFO.creator_id
  is '创建者id';
comment on column LC_ORG_INFO.creator
  is '创建者';
comment on column LC_ORG_INFO.create_date
  is '创建日期';
comment on column LC_ORG_INFO.modifiedby
  is '修改人';
comment on column LC_ORG_INFO.modifiedby_id
  is '修改人id';
comment on column LC_ORG_INFO.modified_date
  is '修改日期';
comment on column LC_ORG_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_ORG_INFO.version
  is '版本号';
comment on column LC_ORG_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_ORG_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_ORG_INFO.bus_date
  is '业务日期';
comment on column LC_ORG_INFO.exa_remarks
  is '审批备注';
comment on column LC_ORG_INFO.src_table
  is '来源实体';
comment on column LC_ORG_INFO.src_system
  is '来源系统';
comment on column LC_ORG_INFO.sort_id
  is '排序字段';

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
  is '项目招投标表';
comment on column LC_PRJ_BID.projectcode
  is '项目编号';
comment on column LC_PRJ_BID.bidcode
  is '招标编号';
comment on column LC_PRJ_BID.bidname
  is '招标名称';
comment on column LC_PRJ_BID.statuscode
  is '状态';
comment on column LC_PRJ_BID.bidtypeid
  is '招标方式';
comment on column LC_PRJ_BID.budgetcost
  is '预算价';
comment on column LC_PRJ_BID.maxctrlprice
  is '最高控制价';
comment on column LC_PRJ_BID.minctrlprice
  is '最低控制价';
comment on column LC_PRJ_BID.maxctrlrate
  is '最高控制价下浮率';
comment on column LC_PRJ_BID.minctrlrate
  is '最低控制价下浮率';
comment on column LC_PRJ_BID.tendcost
  is '中标价';
comment on column LC_PRJ_BID.booker
  is '编制人';
comment on column LC_PRJ_BID.bookerdate
  is '编制日期';
comment on column LC_PRJ_BID.constructperiod
  is '施工工期';
comment on column LC_PRJ_BID.qualitydesc
  is '质量要求';
comment on column LC_PRJ_BID.bidbond
  is '投标保证金';
comment on column LC_PRJ_BID.contracttype
  is '承包方式';
comment on column LC_PRJ_BID.bidqualification
  is '投标资质';
comment on column LC_PRJ_BID.tenderchoosetype
  is '评标方式';
comment on column LC_PRJ_BID.desctext
  is '备注';
comment on column LC_PRJ_BID.description
  is '操作描述';
comment on column LC_PRJ_BID.creator_id
  is '创建者id';
comment on column LC_PRJ_BID.creator
  is '创建者';
comment on column LC_PRJ_BID.create_date
  is '创建日期';
comment on column LC_PRJ_BID.modifiedby
  is '修改人';
comment on column LC_PRJ_BID.modifiedby_id
  is '修改人id';
comment on column LC_PRJ_BID.modified_date
  is '修改日期';
comment on column LC_PRJ_BID.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_PRJ_BID.version
  is '版本号';
comment on column LC_PRJ_BID.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_PRJ_BID.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_PRJ_BID.bus_date
  is '业务日期';
comment on column LC_PRJ_BID.exa_remarks
  is '审批备注';
comment on column LC_PRJ_BID.src_table
  is '来源实体';
comment on column LC_PRJ_BID.src_system
  is '来源系统';
comment on column LC_PRJ_BID.sort_id
  is '排序字段';

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
  is '预算属性表';
comment on column LC_PRJ_BUDGET.projectcode
  is '项目编号';
comment on column LC_PRJ_BUDGET.budgetcode
  is '预算编号';
comment on column LC_PRJ_BUDGET.budgetname
  is '预算名称';
comment on column LC_PRJ_BUDGET.statuscode
  is '预算状态';
comment on column LC_PRJ_BUDGET.plancost
  is '基建计划投资额';
comment on column LC_PRJ_BUDGET.applyprice
  is '送审造价';
comment on column LC_PRJ_BUDGET.auditprice
  is '审核造价';
comment on column LC_PRJ_BUDGET.bookername
  is '预算编制人';
comment on column LC_PRJ_BUDGET.bookdate
  is '预算编制日期';
comment on column LC_PRJ_BUDGET.auditorname
  is '预算审核人';
comment on column LC_PRJ_BUDGET.auditdate
  is '预算审核日期';
comment on column LC_PRJ_BUDGET.enclosure
  is '附件';
comment on column LC_PRJ_BUDGET.checkername
  is '预算复核人';
comment on column LC_PRJ_BUDGET.description
  is '操作描述';
comment on column LC_PRJ_BUDGET.creator_id
  is '创建者id';
comment on column LC_PRJ_BUDGET.creator
  is '创建者';
comment on column LC_PRJ_BUDGET.create_date
  is '创建日期';
comment on column LC_PRJ_BUDGET.modifiedby
  is '修改人';
comment on column LC_PRJ_BUDGET.modifiedby_id
  is '修改人id';
comment on column LC_PRJ_BUDGET.modified_date
  is '修改日期';
comment on column LC_PRJ_BUDGET.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_PRJ_BUDGET.version
  is '版本号';
comment on column LC_PRJ_BUDGET.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_PRJ_BUDGET.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_PRJ_BUDGET.bus_date
  is '业务日期';
comment on column LC_PRJ_BUDGET.exa_remarks
  is '审批备注';
comment on column LC_PRJ_BUDGET.src_table
  is '来源实体';
comment on column LC_PRJ_BUDGET.src_system
  is '来源系统';
comment on column LC_PRJ_BUDGET.sort_id
  is '排序字段';

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
  is '项目投资信息表';
comment on column LC_PRJ_INVESTMENT.project_id
  is '项目号';
comment on column LC_PRJ_INVESTMENT.project_code
  is '项目编号';
comment on column LC_PRJ_INVESTMENT.originalamount
  is '原始投资额';
comment on column LC_PRJ_INVESTMENT.currentamount
  is '当前累计投资额';
comment on column LC_PRJ_INVESTMENT.investyear
  is '投资年度';
comment on column LC_PRJ_INVESTMENT.investamount
  is '投资总额';
comment on column LC_PRJ_INVESTMENT.plannedamount
  is '投资计划总额';
comment on column LC_PRJ_INVESTMENT.actualamount
  is '实际已完成投资';
comment on column LC_PRJ_INVESTMENT.estimateinvestment
  is '估算投资额';
comment on column LC_PRJ_INVESTMENT.budgetaryinvestment
  is '概算投资额';
comment on column LC_PRJ_INVESTMENT.contractcode
  is '合同代码';
comment on column LC_PRJ_INVESTMENT.contractname
  is '合同名称';
comment on column LC_PRJ_INVESTMENT.description
  is '操作描述';
comment on column LC_PRJ_INVESTMENT.creator_id
  is '创建者id';
comment on column LC_PRJ_INVESTMENT.creator
  is '创建者';
comment on column LC_PRJ_INVESTMENT.create_date
  is '创建日期';
comment on column LC_PRJ_INVESTMENT.modifiedby
  is '修改人';
comment on column LC_PRJ_INVESTMENT.modifiedby_id
  is '修改人id';
comment on column LC_PRJ_INVESTMENT.modified_date
  is '修改日期';
comment on column LC_PRJ_INVESTMENT.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_PRJ_INVESTMENT.version
  is '版本号';
comment on column LC_PRJ_INVESTMENT.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_PRJ_INVESTMENT.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_PRJ_INVESTMENT.bus_date
  is '业务日期';
comment on column LC_PRJ_INVESTMENT.exa_remarks
  is '审批备注';
comment on column LC_PRJ_INVESTMENT.src_table
  is '来源表';
comment on column LC_PRJ_INVESTMENT.src_system
  is '来源系统';
comment on column LC_PRJ_INVESTMENT.sort_id
  is '排序字段';

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
  is '土地经营类项目信息';
comment on column LC_PRJ_LANDPRJ.project_id
  is '项目号';
comment on column LC_PRJ_LANDPRJ.project_code
  is '项目编码';
comment on column LC_PRJ_LANDPRJ.project_name
  is '项目名称';
comment on column LC_PRJ_LANDPRJ.projectsetuptime
  is '立项时间';
comment on column LC_PRJ_LANDPRJ.approvefile
  is '立项批文';
comment on column LC_PRJ_LANDPRJ.approveunit
  is '立项批复单位';
comment on column LC_PRJ_LANDPRJ.projectstatus
  is '项目状态名称';
comment on column LC_PRJ_LANDPRJ.projectstatuscode
  is '项目状态';
comment on column LC_PRJ_LANDPRJ.projecttype
  is '项目类型名称';
comment on column LC_PRJ_LANDPRJ.projecttypecode
  is '项目类型';
comment on column LC_PRJ_LANDPRJ.targetbegintime
  is '计划开始日期';
comment on column LC_PRJ_LANDPRJ.targetendtime
  is '计划结束日期';
comment on column LC_PRJ_LANDPRJ.neworcontinued
  is '新建/续建';
comment on column LC_PRJ_LANDPRJ.actbegintime
  is '实际开始时间';
comment on column LC_PRJ_LANDPRJ.actendtime
  is '实际完成日期';
comment on column LC_PRJ_LANDPRJ.investamount
  is '总投资额';
comment on column LC_PRJ_LANDPRJ.investamountyear
  is '本年投资额';
comment on column LC_PRJ_LANDPRJ.projectscale
  is '建设规模';
comment on column LC_PRJ_LANDPRJ.projectcontent
  is '建设内容';
comment on column LC_PRJ_LANDPRJ.projectaddr
  is '项目地址';
comment on column LC_PRJ_LANDPRJ.projecteps
  is '项目EPS';
comment on column LC_PRJ_LANDPRJ.responsibleteam
  is '责任团队';
comment on column LC_PRJ_LANDPRJ.desctext
  is '备注';
comment on column LC_PRJ_LANDPRJ.role
  is '项目角色';
comment on column LC_PRJ_LANDPRJ.unitcode
  is '单位代码';
comment on column LC_PRJ_LANDPRJ.unitname
  is '单位名称';
comment on column LC_PRJ_LANDPRJ.contactperson
  is '联系人';
comment on column LC_PRJ_LANDPRJ.land_code
  is '地块编码';
comment on column LC_PRJ_LANDPRJ.land_name
  is '地块名称';
comment on column LC_PRJ_LANDPRJ.land_finishdate
  is '设计完成时间';
comment on column LC_PRJ_LANDPRJ.land_type
  is '地块类型';
comment on column LC_PRJ_LANDPRJ.land_realarrivesate
  is '实际达到状态';
comment on column LC_PRJ_LANDPRJ.changereason
  is '项目变更原因';
comment on column LC_PRJ_LANDPRJ.changedate
  is '变更时间';
comment on column LC_PRJ_LANDPRJ.changeamount
  is '变更金额';
comment on column LC_PRJ_LANDPRJ.buyredline54coord
  is '征地红线图及坐标（54坐标系）';
comment on column LC_PRJ_LANDPRJ.buyredline80coord
  is '征地红线图及坐标（80坐标系）';
comment on column LC_PRJ_LANDPRJ.isredclaim
  is '是否超红线理赔';
comment on column LC_PRJ_LANDPRJ.claimscope
  is '理赔范围图';
comment on column LC_PRJ_LANDPRJ.ownerunit
  is '业主单位';
comment on column LC_PRJ_LANDPRJ.prjunit
  is '立项单位';
comment on column LC_PRJ_LANDPRJ.land_description
  is '用地概况';
comment on column LC_PRJ_LANDPRJ.planprice
  is '计划单价';
comment on column LC_PRJ_LANDPRJ.plantotalamout
  is '计划总金额';
comment on column LC_PRJ_LANDPRJ.claimfinishdate
  is '征地理赔完成时间';
comment on column LC_PRJ_LANDPRJ.referdate
  is '交地时间';
comment on column LC_PRJ_LANDPRJ.approvenum
  is '地块批准文号';
comment on column LC_PRJ_LANDPRJ.approvedate
  is '地块批文时间';
comment on column LC_PRJ_LANDPRJ.buyarea_mu
  is '地块本次征地面积(亩)';
comment on column LC_PRJ_LANDPRJ.buyarea_square
  is '地块本次征地面积（平方米）';
comment on column LC_PRJ_LANDPRJ.payoffprj
  is '征地支出项目';
comment on column LC_PRJ_LANDPRJ.makeprjnum
  is '造地项目编号';
comment on column LC_PRJ_LANDPRJ.makeprjcode
  is '造地项目名称';
comment on column LC_PRJ_LANDPRJ.contamount
  is '合同金额';
comment on column LC_PRJ_LANDPRJ.prjperiod
  is '工程工期';
comment on column LC_PRJ_LANDPRJ.conttotalamount
  is '合同结算金额';
comment on column LC_PRJ_LANDPRJ.estimatequantity
  is '预计工程量';
comment on column LC_PRJ_LANDPRJ.coverstonebuyprice
  is '填方区购土石方单价';
comment on column LC_PRJ_LANDPRJ.coverestimatetotalcost
  is '填方区预计总成本';
comment on column LC_PRJ_LANDPRJ.digestimatetotalcost
  is '挖方区预计总成本';
comment on column LC_PRJ_LANDPRJ.performancebond
  is '履约保证金';
comment on column LC_PRJ_LANDPRJ.emergencybond
  is '安全应急金';
comment on column LC_PRJ_LANDPRJ.constructionunit
  is '施工单位';
comment on column LC_PRJ_LANDPRJ.digareanum
  is '挖方区区域编号';
comment on column LC_PRJ_LANDPRJ.diglandnum
  is '挖方区地块编号';
comment on column LC_PRJ_LANDPRJ.expectedigarea
  is '预计挖方区面积';
comment on column LC_PRJ_LANDPRJ.coverareanum
  is '填方区区域编号';
comment on column LC_PRJ_LANDPRJ.coverlandnum
  is '填方区地块编号';
comment on column LC_PRJ_LANDPRJ.expectecoverarea
  is '预计填方区面积';
comment on column LC_PRJ_LANDPRJ.description
  is '操作描述';
comment on column LC_PRJ_LANDPRJ.creator_id
  is '创建者id';
comment on column LC_PRJ_LANDPRJ.creator
  is '创建者';
comment on column LC_PRJ_LANDPRJ.create_date
  is '创建日期';
comment on column LC_PRJ_LANDPRJ.modifiedby
  is '修改人';
comment on column LC_PRJ_LANDPRJ.modifiedby_id
  is '修改人id';
comment on column LC_PRJ_LANDPRJ.modified_date
  is '修改日期';
comment on column LC_PRJ_LANDPRJ.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_PRJ_LANDPRJ.version
  is '版本号';
comment on column LC_PRJ_LANDPRJ.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_PRJ_LANDPRJ.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_PRJ_LANDPRJ.bus_date
  is '业务日期';
comment on column LC_PRJ_LANDPRJ.exa_remarks
  is '审批备注';
comment on column LC_PRJ_LANDPRJ.src_table
  is '来源表';
comment on column LC_PRJ_LANDPRJ.src_system
  is '来源系统';
comment on column LC_PRJ_LANDPRJ.sort_id
  is '排序字段';

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
  is '其他项目基本信息';
comment on column LC_PRJ_OTHERBASEINFO.projectcode
  is '项目编码';
comment on column LC_PRJ_OTHERBASEINFO.projectname
  is '项目名称';
comment on column LC_PRJ_OTHERBASEINFO.projectsetuptime
  is '立项时间';
comment on column LC_PRJ_OTHERBASEINFO.approvefile
  is '立项批文';
comment on column LC_PRJ_OTHERBASEINFO.approveunit
  is '立项批复单位';
comment on column LC_PRJ_OTHERBASEINFO.projectstatus
  is '项目状态名称';
comment on column LC_PRJ_OTHERBASEINFO.projectstatuscode
  is '项目状态';
comment on column LC_PRJ_OTHERBASEINFO.projecttype
  is '项目类型名称';
comment on column LC_PRJ_OTHERBASEINFO.projecttypecode
  is '项目类型';
comment on column LC_PRJ_OTHERBASEINFO.targetbegintime
  is '计划开始日期';
comment on column LC_PRJ_OTHERBASEINFO.targetendtime
  is '计划结束日期';
comment on column LC_PRJ_OTHERBASEINFO.neworcontinued
  is '新建/续建';
comment on column LC_PRJ_OTHERBASEINFO.actbegintime
  is '实际开始时间';
comment on column LC_PRJ_OTHERBASEINFO.actendtime
  is '实际完成日期';
comment on column LC_PRJ_OTHERBASEINFO.investamount
  is '总投资额';
comment on column LC_PRJ_OTHERBASEINFO.investamountyear
  is '本年投资额';
comment on column LC_PRJ_OTHERBASEINFO.projectscale
  is '建设规模';
comment on column LC_PRJ_OTHERBASEINFO.projectcontent
  is '建设内容';
comment on column LC_PRJ_OTHERBASEINFO.projectaddr
  is '项目地址';
comment on column LC_PRJ_OTHERBASEINFO.responsibleteam
  is '责任团队';
comment on column LC_PRJ_OTHERBASEINFO.desctext
  is '备注';
comment on column LC_PRJ_OTHERBASEINFO.suppcode
  is '供应商代码';
comment on column LC_PRJ_OTHERBASEINFO.suppname
  is '供应商名称';
comment on column LC_PRJ_OTHERBASEINFO.suppcontacts
  is '供应商联系人';
comment on column LC_PRJ_OTHERBASEINFO.description
  is '操作描述';
comment on column LC_PRJ_OTHERBASEINFO.creator_id
  is '创建者id';
comment on column LC_PRJ_OTHERBASEINFO.creator
  is '创建者';
comment on column LC_PRJ_OTHERBASEINFO.create_date
  is '创建日期';
comment on column LC_PRJ_OTHERBASEINFO.modifiedby
  is '修改人';
comment on column LC_PRJ_OTHERBASEINFO.modifiedby_id
  is '修改人id';
comment on column LC_PRJ_OTHERBASEINFO.modified_date
  is '修改日期';
comment on column LC_PRJ_OTHERBASEINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_PRJ_OTHERBASEINFO.version
  is '版本号';
comment on column LC_PRJ_OTHERBASEINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_PRJ_OTHERBASEINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_PRJ_OTHERBASEINFO.bus_date
  is '业务日期';
comment on column LC_PRJ_OTHERBASEINFO.exa_remarks
  is '审批备注';
comment on column LC_PRJ_OTHERBASEINFO.src_table
  is '来源实体';
comment on column LC_PRJ_OTHERBASEINFO.src_system
  is '来源系统';
comment on column LC_PRJ_OTHERBASEINFO.sort_id
  is '排序字段';

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
  is '供科目基本信息表';
comment on column LC_SBJ_INFO.sbjcode
  is '科目编码';
comment on column LC_SBJ_INFO.sbjtype
  is '科目类型';
comment on column LC_SBJ_INFO.englishname
  is '英文_名称';
comment on column LC_SBJ_INFO.schinesename
  is '简体中文_名称';
comment on column LC_SBJ_INFO.tchinesename
  is '繁体中文_名称';
comment on column LC_SBJ_INFO.parentsbjcode
  is '父科目编码';
comment on column LC_SBJ_INFO.ctrllevel_quote
  is '控制级次（引用用）';
comment on column LC_SBJ_INFO.ctrllevel_distribution
  is '控制级次（分配用）';
comment on column LC_SBJ_INFO.mnemoniccode
  is '助记码';
comment on column LC_SBJ_INFO.balancedirectionid
  is '余额方向';
comment on column LC_SBJ_INFO.currencyaccounting
  is '币别核算';
comment on column LC_SBJ_INFO.currencycode
  is '币别编码';
comment on column LC_SBJ_INFO.finalcurrencyid
  is '期末调汇';
comment on column LC_SBJ_INFO.isjournalid
  is '是否出日记账';
comment on column LC_SBJ_INFO.iscashid
  is '是否现金科目';
comment on column LC_SBJ_INFO.isbankid
  is '是否银行科目';
comment on column LC_SBJ_INFO.iscashequalid
  is '是否现金等价物';
comment on column LC_SBJ_INFO.isnumaccountingid
  is '科目编码';
comment on column LC_SBJ_INFO.groupcoding
  is '计量单位组编码';
comment on column LC_SBJ_INFO.unitcode
  is '计量单位编码';
comment on column LC_SBJ_INFO.noticesid
  is '往来通知';
comment on column LC_SBJ_INFO.currentverificationid
  is '往来核销';
comment on column LC_SBJ_INFO.cusbjtype
  is '本级CU本级科目辅助账类型';
comment on column LC_SBJ_INFO.cuauxiliarytype
  is '上级CU辅助账类型';
comment on column LC_SBJ_INFO.sbjauxiliarytype
  is '上级科目辅助账类型';
comment on column LC_SBJ_INFO.losttype
  is '损益类型';
comment on column LC_SBJ_INFO.bectrlsys
  is '受控系统';
comment on column LC_SBJ_INFO.customattributes
  is '科目自定义属性';
comment on column LC_SBJ_INFO.isaddbelowsbj_quote
  is '能否增加下级科目（引用用）';
comment on column LC_SBJ_INFO.isaddbelowsbj_distribution
  is '能否增加下级科目（分配用）';
comment on column LC_SBJ_INFO.ispcuinvalidid
  is '上级CU是否禁用';
comment on column LC_SBJ_INFO.iscuinvalidid
  is '本级CU是否禁用';
comment on column LC_SBJ_INFO.sbjinvalidid
  is '本级科目禁用';
comment on column LC_SBJ_INFO.psbjinvalidid
  is '父科目禁用';
comment on column LC_SBJ_INFO.creater
  is '创建人编码';
comment on column LC_SBJ_INFO.createdate
  is '创建时间';
comment on column LC_SBJ_INFO.isoutsidesbjid
  is '是否表外科目';
comment on column LC_SBJ_INFO.mastertableprj
  is '主表项目';
comment on column LC_SBJ_INFO.scheduleproject
  is '附表项目';
comment on column LC_SBJ_INFO.description
  is '操作描述';
comment on column LC_SBJ_INFO.creator_id
  is '创建者id';
comment on column LC_SBJ_INFO.creator
  is '创建者';
comment on column LC_SBJ_INFO.create_date
  is '创建日期';
comment on column LC_SBJ_INFO.modifiedby
  is '修改人';
comment on column LC_SBJ_INFO.modifiedby_id
  is '修改人id';
comment on column LC_SBJ_INFO.modified_date
  is '修改日期';
comment on column LC_SBJ_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_SBJ_INFO.version
  is '版本号';
comment on column LC_SBJ_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_SBJ_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_SBJ_INFO.bus_date
  is '业务日期';
comment on column LC_SBJ_INFO.exa_remarks
  is '审批备注';
comment on column LC_SBJ_INFO.src_table
  is '来源实体';
comment on column LC_SBJ_INFO.src_system
  is '来源系统';
comment on column LC_SBJ_INFO.sort_id
  is '排序字段';

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
  is '供应商基本信息表';
comment on column LC_SUPP_INFO.suppcode
  is '供应商代码';
comment on column LC_SUPP_INFO.suppname
  is '供应商名称';
comment on column LC_SUPP_INFO.unitrole
  is '单位角色';
comment on column LC_SUPP_INFO.legalperson
  is '法人代表';
comment on column LC_SUPP_INFO.unitnature
  is '单位性质';
comment on column LC_SUPP_INFO.provincecity
  is '所在省市';
comment on column LC_SUPP_INFO.regeditaddress
  is '注册地址';
comment on column LC_SUPP_INFO.bank
  is '开户银行';
comment on column LC_SUPP_INFO.bankaccount
  is '银行账号';
comment on column LC_SUPP_INFO.bussinesslicence
  is '营业执照号';
comment on column LC_SUPP_INFO.whichindustry
  is '所属行业';
comment on column LC_SUPP_INFO.orgcode
  is '组织机构代码证';
comment on column LC_SUPP_INFO.areataxnum
  is '地税登记号';
comment on column LC_SUPP_INFO.nationtaxnum
  is '国税登记号';
comment on column LC_SUPP_INFO.address
  is '通讯地址';
comment on column LC_SUPP_INFO.postalcode
  is '邮政编码';
comment on column LC_SUPP_INFO.phone
  is '电话号码';
comment on column LC_SUPP_INFO.fax
  is '传真号码';
comment on column LC_SUPP_INFO.email
  is '电子邮件';
comment on column LC_SUPP_INFO.homepage
  is '公司主页';
comment on column LC_SUPP_INFO.supp_description
  is '公司简介';
comment on column LC_SUPP_INFO.status
  is '供应商状态/审核状态';
comment on column LC_SUPP_INFO.ispassiso
  is '是否通过ISO';
comment on column LC_SUPP_INFO.unitcredit
  is '单位资信';
comment on column LC_SUPP_INFO.regeditcapital
  is '注册资本';
comment on column LC_SUPP_INFO.assetscapital
  is '固定资产';
comment on column LC_SUPP_INFO.flowcapital
  is '流动资金';
comment on column LC_SUPP_INFO.yearsellamount
  is '年销售额';
comment on column LC_SUPP_INFO.fatorynum
  is '工厂数量';
comment on column LC_SUPP_INFO.fatoryaddress
  is '工厂地址';
comment on column LC_SUPP_INFO.fatoryphone
  is '工厂电话';
comment on column LC_SUPP_INFO.prjfax
  is '工程传真';
comment on column LC_SUPP_INFO.employeenum
  is '公司员工总数';
comment on column LC_SUPP_INFO.technicalstaffnum
  is '技术人员数量';
comment on column LC_SUPP_INFO.managementstaffnum
  is '管理人员数量';
comment on column LC_SUPP_INFO.suppcertification
  is '供应商资质';
comment on column LC_SUPP_INFO.suppothercertification
  is '供应商其他专业资';
comment on column LC_SUPP_INFO.productcode
  is '产品代码';
comment on column LC_SUPP_INFO.productname
  is '产品名称';
comment on column LC_SUPP_INFO.productusage
  is '产品使用情况';
comment on column LC_SUPP_INFO.specification
  is '规格';
comment on column LC_SUPP_INFO.model
  is '型号';
comment on column LC_SUPP_INFO.budgetprice
  is '预算价格';
comment on column LC_SUPP_INFO.purchaseadvance
  is '采购提前期';
comment on column LC_SUPP_INFO.arrivaladvance
  is '到货提前期';
comment on column LC_SUPP_INFO.purchasecycle
  is 'PurchaseCycle';
comment on column LC_SUPP_INFO.feetype
  is '费用类别';
comment on column LC_SUPP_INFO.emp_code
  is '人员编号';
comment on column LC_SUPP_INFO.emp_name
  is '姓名';
comment on column LC_SUPP_INFO.emp_cardcode
  is '工号';
comment on column LC_SUPP_INFO.emp_sex
  is '性别';
comment on column LC_SUPP_INFO.emp_job
  is '职务';
comment on column LC_SUPP_INFO.emp_title
  is '职称';
comment on column LC_SUPP_INFO.emp_dept
  is '部门信息';
comment on column LC_SUPP_INFO.emp_call
  is '称呼';
comment on column LC_SUPP_INFO.emp_role
  is '角色';
comment on column LC_SUPP_INFO.emp_phone
  is '办公电话';
comment on column LC_SUPP_INFO.emp_fax
  is '传真';
comment on column LC_SUPP_INFO.emp_email
  is '电子邮件';
comment on column LC_SUPP_INFO.emp_address
  is '地址';
comment on column LC_SUPP_INFO.emp_postcode
  is '邮政编码';
comment on column LC_SUPP_INFO.emp_mobile
  is '移动电话';
comment on column LC_SUPP_INFO.emp_homecall
  is '家庭电话';
comment on column LC_SUPP_INFO.description
  is '操作描述';
comment on column LC_SUPP_INFO.creator_id
  is '创建者id';
comment on column LC_SUPP_INFO.creator
  is '创建者';
comment on column LC_SUPP_INFO.create_date
  is '创建日期';
comment on column LC_SUPP_INFO.modifiedby
  is '修改人';
comment on column LC_SUPP_INFO.modifiedby_id
  is '修改人id';
comment on column LC_SUPP_INFO.modified_date
  is '修改日期';
comment on column LC_SUPP_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column LC_SUPP_INFO.version
  is '版本号';
comment on column LC_SUPP_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column LC_SUPP_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column LC_SUPP_INFO.bus_date
  is '业务日期';
comment on column LC_SUPP_INFO.exa_remarks
  is '审批备注';
comment on column LC_SUPP_INFO.src_system
  is '来源系统';
comment on column LC_SUPP_INFO.sort_id
  is '排序字段';

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
  is '组织基本信息表';
comment on column ORG.id
  is '主键';
comment on column ORG.sid
  is '原系统ID';
comment on column ORG.code
  is '组织代码';
comment on column ORG.name
  is '组织名称';
comment on column ORG.type
  is '组织类型';
comment on column ORG.typeid
  is '组织类型ID';
comment on column ORG.shortname
  is '组织简称';
comment on column ORG.parentid
  is '父节点';
comment on column ORG.relationid
  is '隶属关系ID';
comment on column ORG.relation
  is '隶属关系';
comment on column ORG.levelid
  is '组织级别ID';
comment on column ORG.org_level
  is '组织级别';
comment on column ORG.city
  is '所在城市';
comment on column ORG.competentorg
  is '主管单位名称';
comment on column ORG.propertiesid
  is '组织性质ID';
comment on column ORG.properties
  is '组织性质';
comment on column ORG.established
  is '成立时间';
comment on column ORG.registeredaddress
  is '注册地址';
comment on column ORG.legalrepresentative
  is '法人代表';
comment on column ORG.personsresponsible
  is '负责人';
comment on column ORG.fullname
  is '全名';
comment on column ORG.contactperson
  is '联系人';
comment on column ORG.description
  is '操作描述';
comment on column ORG.creator_id
  is '创建者id';
comment on column ORG.creator
  is '创建者';
comment on column ORG.create_date
  is '创建日期';
comment on column ORG.modifiedby
  is '修改人';
comment on column ORG.modifiedby_id
  is '修改人id';
comment on column ORG.modified_date
  is '修改日期';
comment on column ORG.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column ORG.version
  is '版本号';
comment on column ORG.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column ORG.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column ORG.bus_date
  is '业务时间';
comment on column ORG.exa_remarks
  is '审批备注';

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
  is '上级组织编码';
comment on column ORGANIZATION.codeitemdesc
  is '组织名称描述';
comment on column ORGANIZATION.start_date
  is '生效时间';
comment on column ORGANIZATION.end_date
  is '失效时间';
comment on column ORGANIZATION.codeitemid
  is '组织/部门编码';
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
  is '联系属性';
comment on column ORG_CONTACTINFO.id
  is 'ID';
comment on column ORG_CONTACTINFO.sid
  is '原系统ID';
comment on column ORG_CONTACTINFO.orgid
  is 'OrgID';
comment on column ORG_CONTACTINFO.code
  is '组织代码';
comment on column ORG_CONTACTINFO.postaladdress
  is '通讯地址';
comment on column ORG_CONTACTINFO.zipcode
  is '邮政编码';
comment on column ORG_CONTACTINFO.phonenumber
  is '电话号码';
comment on column ORG_CONTACTINFO.faxno
  is '传真号码';
comment on column ORG_CONTACTINFO.cablenumber
  is '电报号码';
comment on column ORG_CONTACTINFO.homepage
  is '公司主页';
comment on column ORG_CONTACTINFO.brief
  is '公司简介';
comment on column ORG_CONTACTINFO.description
  is '操作描述';
comment on column ORG_CONTACTINFO.creator_id
  is '创建者id';
comment on column ORG_CONTACTINFO.creator
  is '创建者';
comment on column ORG_CONTACTINFO.create_date
  is '创建日期';
comment on column ORG_CONTACTINFO.modifiedby
  is '修改人';
comment on column ORG_CONTACTINFO.modifiedby_id
  is '修改人id';
comment on column ORG_CONTACTINFO.modified_date
  is '修改日期';
comment on column ORG_CONTACTINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column ORG_CONTACTINFO.version
  is '版本号';
comment on column ORG_CONTACTINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column ORG_CONTACTINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column ORG_CONTACTINFO.bus_date
  is '业务时间';
comment on column ORG_CONTACTINFO.exa_remarks
  is '审批备注';

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
  is '人员属性';
comment on column ORG_EMP.id
  is 'ID';
comment on column ORG_EMP.sid
  is '原系统ID';
comment on column ORG_EMP.orgid
  is '组织id';
comment on column ORG_EMP.code
  is '组织代码';
comment on column ORG_EMP.inside
  is '董事（内部人员）';
comment on column ORG_EMP.outside
  is '董事（外部人员）';
comment on column ORG_EMP.independent
  is '独立董事姓名';
comment on column ORG_EMP.supervisor
  is '监事（内部人员）';
comment on column ORG_EMP.description
  is '操作描述';
comment on column ORG_EMP.creator_id
  is '创建者id';
comment on column ORG_EMP.creator
  is '创建者';
comment on column ORG_EMP.create_date
  is '创建日期';
comment on column ORG_EMP.modifiedby
  is '修改人';
comment on column ORG_EMP.modifiedby_id
  is '修改人id';
comment on column ORG_EMP.modified_date
  is '修改日期';
comment on column ORG_EMP.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column ORG_EMP.version
  is '版本号';
comment on column ORG_EMP.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column ORG_EMP.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column ORG_EMP.bus_date
  is '业务时间';
comment on column ORG_EMP.exa_remarks
  is '审批备注';

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
  is '经营属性';
comment on column ORG_MANAGEMENTINFO.id
  is 'ID';
comment on column ORG_MANAGEMENTINFO.sid
  is '原系统ID';
comment on column ORG_MANAGEMENTINFO.origid
  is 'OrigID';
comment on column ORG_MANAGEMENTINFO.code
  is '组织代码';
comment on column ORG_MANAGEMENTINFO.corporateinterest
  is '权益公司';
comment on column ORG_MANAGEMENTINFO.corporateinteresttypeid
  is '权益公司类型ID';
comment on column ORG_MANAGEMENTINFO.corporateinteresttype
  is '权益公司类型';
comment on column ORG_MANAGEMENTINFO.rightproportion
  is '权益比例';
comment on column ORG_MANAGEMENTINFO.shareholdingratio
  is '持股比例';
comment on column ORG_MANAGEMENTINFO.amountcontribution
  is '总出资额';
comment on column ORG_MANAGEMENTINFO.accountingmethodid
  is '核算方法ID';
comment on column ORG_MANAGEMENTINFO.accountingmethod
  is '核算方法';
comment on column ORG_MANAGEMENTINFO.begindate
  is '开始时间';
comment on column ORG_MANAGEMENTINFO.enddate
  is '结束时间';
comment on column ORG_MANAGEMENTINFO.registeredcapital
  is '注册资本';
comment on column ORG_MANAGEMENTINFO.paidupcapital
  is '实收资本';
comment on column ORG_MANAGEMENTINFO.description
  is '操作描述';
comment on column ORG_MANAGEMENTINFO.creator_id
  is '创建者id';
comment on column ORG_MANAGEMENTINFO.creator
  is '创建者';
comment on column ORG_MANAGEMENTINFO.create_date
  is '创建日期';
comment on column ORG_MANAGEMENTINFO.modifiedby
  is '修改人';
comment on column ORG_MANAGEMENTINFO.modifiedby_id
  is '修改人id';
comment on column ORG_MANAGEMENTINFO.modified_date
  is '修改日期';
comment on column ORG_MANAGEMENTINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column ORG_MANAGEMENTINFO.version
  is '版本号';
comment on column ORG_MANAGEMENTINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column ORG_MANAGEMENTINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column ORG_MANAGEMENTINFO.bus_date
  is '业务时间';
comment on column ORG_MANAGEMENTINFO.exa_remarks
  is '审批备注';

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
  is '项目分类码类型';
comment on column PLN_PCATTYPE.proj_catg_type_id
  is '分类码类型id';
comment on column PLN_PCATTYPE.seq_num
  is '排序';
comment on column PLN_PCATTYPE.proj_catg_short_len
  is '码值长度';
comment on column PLN_PCATTYPE.proj_catg_type
  is '分类码类型';
comment on column PLN_PCATTYPE.super_flag
  is '保密码';
comment on column PLN_PCATTYPE.proj_catg_type_wt
  is '分类码类型权重';
comment on column PLN_PCATTYPE.max_proj_catg_wt
  is '最大分类码类型权重';
comment on column PLN_PCATTYPE.update_date
  is '更新时间';
comment on column PLN_PCATTYPE.update_user
  is '更新用户';
comment on column PLN_PCATTYPE.pln_create_date
  is '创建时间';
comment on column PLN_PCATTYPE.create_user
  is '创建用户';
comment on column PLN_PCATTYPE.delete_session_id
  is '删除id';
comment on column PLN_PCATTYPE.delete_date
  is '删除时间';
comment on column PLN_PCATTYPE.p3_flag
  is '是否为p3导入的分类码';
comment on column PLN_PCATTYPE.p3_proj_catg_type_id
  is 'p3分类码类型id';
comment on column PLN_PCATTYPE.description
  is '操作描述';
comment on column PLN_PCATTYPE.creator_id
  is '创建者id';
comment on column PLN_PCATTYPE.creator
  is '创建者';
comment on column PLN_PCATTYPE.create_date
  is '创建日期';
comment on column PLN_PCATTYPE.modifiedby
  is '修改人';
comment on column PLN_PCATTYPE.modifiedby_id
  is '修改人id';
comment on column PLN_PCATTYPE.modified_date
  is '修改日期';
comment on column PLN_PCATTYPE.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column PLN_PCATTYPE.version
  is '版本号';
comment on column PLN_PCATTYPE.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column PLN_PCATTYPE.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column PLN_PCATTYPE.bus_date
  is '业务日期';
comment on column PLN_PCATTYPE.exa_remarks
  is '审批备注';

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
  is '项目分类码值';
comment on column PLN_PCATVAL.proj_catg_id
  is '主键';
comment on column PLN_PCATVAL.proj_catg_type_id
  is '项目分类码类型id';
comment on column PLN_PCATVAL.seq_num
  is '排序';
comment on column PLN_PCATVAL.proj_catg_short_name
  is '项目分类码码值的代码';
comment on column PLN_PCATVAL.parent_proj_catg_id
  is '项目分类码父节点';
comment on column PLN_PCATVAL.proj_catg_name
  is '项目分类码码值名称';
comment on column PLN_PCATVAL.proj_catg_wt
  is '项目分类码码值比重';
comment on column PLN_PCATVAL.update_date
  is '更新时间';
comment on column PLN_PCATVAL.update_user
  is '更新用户';
comment on column PLN_PCATVAL.pln_create_date
  is '创建时间';
comment on column PLN_PCATVAL.create_user
  is '创建用户';
comment on column PLN_PCATVAL.delete_session_id
  is '删除id';
comment on column PLN_PCATVAL.delete_date
  is '删除时间';
comment on column PLN_PCATVAL.p3_flag
  is '是否为p3导入的码值';
comment on column PLN_PCATVAL.p3_proj_catg_id
  is '对应p3的码值id';
comment on column PLN_PCATVAL.description
  is '操作描述';
comment on column PLN_PCATVAL.creator_id
  is '创建者id';
comment on column PLN_PCATVAL.creator
  is '创建者';
comment on column PLN_PCATVAL.create_date
  is '创建日期';
comment on column PLN_PCATVAL.modifiedby
  is '修改人';
comment on column PLN_PCATVAL.modifiedby_id
  is '修改人id';
comment on column PLN_PCATVAL.modified_date
  is '修改日期';
comment on column PLN_PCATVAL.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column PLN_PCATVAL.version
  is '版本号';
comment on column PLN_PCATVAL.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column PLN_PCATVAL.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column PLN_PCATVAL.bus_date
  is '业务日期';
comment on column PLN_PCATVAL.exa_remarks
  is '审批备注';

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
  is '项目表';
comment on column PLN_PROJECT.project_id
  is '项目号';
comment on column PLN_PROJECT.project_shortname
  is '项目代码';
comment on column PLN_PROJECT.project_name
  is '项目名称';
comment on column PLN_PROJECT.parent_id
  is '项目父节点id';
comment on column PLN_PROJECT.remark
  is '项目备注';
comment on column PLN_PROJECT.user_sid
  is '用户id';
comment on column PLN_PROJECT.project_type
  is '项目类型';
comment on column PLN_PROJECT.est_wt
  is '权重';
comment on column PLN_PROJECT.obs_sid
  is '权限id';
comment on column PLN_PROJECT.haschild
  is '是否有子节点';
comment on column PLN_PROJECT.p3ec
  is '是否为p3导入项目';
comment on column PLN_PROJECT.treelevel
  is '树结构的第几层';
comment on column PLN_PROJECT.note
  is '说明';
comment on column PLN_PROJECT.p3ec_project_id
  is '对应的p3项目号，不是p3导入项目，该值为null';
comment on column PLN_PROJECT.contract_id
  is '施工合同的主键';
comment on column PLN_PROJECT.displayid
  is '显示';
comment on column PLN_PROJECT.discolor
  is '展示颜色';
comment on column PLN_PROJECT.project_type_sid
  is '项目类型id';
comment on column PLN_PROJECT.project_status_sid
  is '项目状态id';
comment on column PLN_PROJECT.project_address
  is '项目所处地理位置';
comment on column PLN_PROJECT.target_start_date
  is '期望开始时间';
comment on column PLN_PROJECT.target_end_date
  is '期望完成时间';
comment on column PLN_PROJECT.act_start_date
  is '实际开始时间';
comment on column PLN_PROJECT.act_end_date
  is '时间完成时间';
comment on column PLN_PROJECT.data_date
  is '数据日期';
comment on column PLN_PROJECT.compute_end_date
  is '计算完成';
comment on column PLN_PROJECT.expect_start_date
  is '期望开始';
comment on column PLN_PROJECT.expect_end_date
  is '期望完成';
comment on column PLN_PROJECT.uncontract_id
  is '进项合同（投资）主键';
comment on column PLN_PROJECT.complete_pct
  is '完成比百分比';
comment on column PLN_PROJECT.allow_diy_web
  is '是否可自定义网络';
comment on column PLN_PROJECT.program_id
  is '项目群id';
comment on column PLN_PROJECT.risk_level
  is '风险等级';
comment on column PLN_PROJECT.proj_url
  is '项目网站地址';
comment on column PLN_PROJECT.def_duration_type
  is '默认工期类型，同p3ec，现在字符型以后换成数字型';
comment on column PLN_PROJECT.def_complete_pct_type
  is '默认完成百分比类型';
comment on column PLN_PROJECT.def_task_type
  is '默认作业类型';
comment on column PLN_PROJECT.acct_id
  is '费用科目编号';
comment on column PLN_PROJECT.clndr_id
  is '日立编号';
comment on column PLN_PROJECT.week_id
  is '周期id';
comment on column PLN_PROJECT.update_date
  is '更新日期';
comment on column PLN_PROJECT.critical_drtn_hr_cnt
  is '关键路径小时';
comment on column PLN_PROJECT.critical_path_type
  is '关键路径类型';
comment on column PLN_PROJECT.start_date
  is '开始日期';
comment on column PLN_PROJECT.end_date
  is '结束日期';
comment on column PLN_PROJECT.investplanstartdate
  is '投资计划开始日期';
comment on column PLN_PROJECT.investplanenddate
  is '投资计划结束日期';
comment on column PLN_PROJECT.project_level
  is '项目级别';
comment on column PLN_PROJECT.parent_proj_id
  is '父类项目id';
comment on column PLN_PROJECT.manageruserid
  is '未使用';
comment on column PLN_PROJECT.managerid
  is '未使用';
comment on column PLN_PROJECT.managername
  is '未使用';
comment on column PLN_PROJECT.flockstatus
  is '未使用';
comment on column PLN_PROJECT.acreage
  is '未使用';
comment on column PLN_PROJECT.infactacreage
  is '实际面积';
comment on column PLN_PROJECT.content
  is '项目内容';
comment on column PLN_PROJECT.scale
  is '建设规模';
comment on column PLN_PROJECT.totalinvest
  is '总投资';
comment on column PLN_PROJECT.thisyearinvest
  is '今年投资';
comment on column PLN_PROJECT.dikuai_code
  is '地块编码';
comment on column PLN_PROJECT.shortcode
  is '项目简写';
comment on column PLN_PROJECT.assess_projectid
  is '评估项目id';
comment on column PLN_PROJECT.acreaprice
  is '地块大小';
comment on column PLN_PROJECT.plan_state
  is '计划状态';
comment on column PLN_PROJECT.ycoordinate
  is '项目坐标_Y轴';
comment on column PLN_PROJECT.xcoordinate
  is '项目坐标_X轴';
comment on column PLN_PROJECT.description
  is '操作描述';
comment on column PLN_PROJECT.creator_id
  is '创建者id';
comment on column PLN_PROJECT.creator
  is '创建者';
comment on column PLN_PROJECT.create_date
  is '创建日期';
comment on column PLN_PROJECT.modifiedby
  is '修改人';
comment on column PLN_PROJECT.modifiedby_id
  is '修改人id';
comment on column PLN_PROJECT.modified_date
  is '修改日期';
comment on column PLN_PROJECT.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column PLN_PROJECT.version
  is '版本号';
comment on column PLN_PROJECT.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column PLN_PROJECT.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column PLN_PROJECT.bus_date
  is '业务日期';
comment on column PLN_PROJECT.exa_remarks
  is '审批备注';

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
  is '项目和项目分类码关系表';
comment on column PLN_PROJPCAT.proj_id
  is '项目号';
comment on column PLN_PROJPCAT.proj_catg_type_id
  is '项目分类码类型号';
comment on column PLN_PROJPCAT.proj_catg_id
  is '项目分类码号';
comment on column PLN_PROJPCAT.update_date
  is '更新日期';
comment on column PLN_PROJPCAT.update_user
  is '更新用户';
comment on column PLN_PROJPCAT.pln_create_date
  is '创建日期';
comment on column PLN_PROJPCAT.create_user
  is '创建用户';
comment on column PLN_PROJPCAT.delete_session_id
  is '删除id';
comment on column PLN_PROJPCAT.delete_date
  is '删除日期';
comment on column PLN_PROJPCAT.description
  is '操作描述';
comment on column PLN_PROJPCAT.creator_id
  is '创建者id';
comment on column PLN_PROJPCAT.creator
  is '创建者';
comment on column PLN_PROJPCAT.create_date
  is '创建日期';
comment on column PLN_PROJPCAT.modifiedby
  is '修改人';
comment on column PLN_PROJPCAT.modifiedby_id
  is '修改人id';
comment on column PLN_PROJPCAT.modified_date
  is '修改日期';
comment on column PLN_PROJPCAT.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column PLN_PROJPCAT.version
  is '版本号';
comment on column PLN_PROJPCAT.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column PLN_PROJPCAT.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column PLN_PROJPCAT.bus_date
  is '业务日期';
comment on column PLN_PROJPCAT.exa_remarks
  is '审批备注';

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
  is '资质表';
comment on column SUPP_CERTIFICATION.id
  is 'ID';
comment on column SUPP_CERTIFICATION.sid
  is '原系统ID';
comment on column SUPP_CERTIFICATION.suppid
  is 'SuppID';
comment on column SUPP_CERTIFICATION.suppcode
  is '供应商代码';
comment on column SUPP_CERTIFICATION.suppcertificationid
  is '供应商资质ID';
comment on column SUPP_CERTIFICATION.suppcertification
  is '供应商资质';
comment on column SUPP_CERTIFICATION.suppothercertificationid
  is '供应商其他专业资质ID';
comment on column SUPP_CERTIFICATION.suppothercertification
  is '供应商其他专业资质';
comment on column SUPP_CERTIFICATION.description
  is '操作描述';
comment on column SUPP_CERTIFICATION.creator_id
  is '创建者id';
comment on column SUPP_CERTIFICATION.creator
  is '创建者';
comment on column SUPP_CERTIFICATION.create_date
  is '创建日期';
comment on column SUPP_CERTIFICATION.modifiedby
  is '修改人';
comment on column SUPP_CERTIFICATION.modifiedby_id
  is '修改人id';
comment on column SUPP_CERTIFICATION.modified_date
  is '修改日期';
comment on column SUPP_CERTIFICATION.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column SUPP_CERTIFICATION.version
  is '版本号';
comment on column SUPP_CERTIFICATION.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column SUPP_CERTIFICATION.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column SUPP_CERTIFICATION.bus_date
  is '业务时间';
comment on column SUPP_CERTIFICATION.exa_remarks
  is '审批备注';

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
  is '联系人属性表';
comment on column SUPP_CONTACTINFO.id
  is 'ID';
comment on column SUPP_CONTACTINFO.sid
  is '原系统ID';
comment on column SUPP_CONTACTINFO.suppid
  is 'SuppID';
comment on column SUPP_CONTACTINFO.suppcode
  is '供应商代码';
comment on column SUPP_CONTACTINFO.code
  is '人员编号';
comment on column SUPP_CONTACTINFO.name
  is '姓名';
comment on column SUPP_CONTACTINFO.cardcode
  is '工号';
comment on column SUPP_CONTACTINFO.sex
  is '性别';
comment on column SUPP_CONTACTINFO.job
  is '职务';
comment on column SUPP_CONTACTINFO.title
  is '职称';
comment on column SUPP_CONTACTINFO.dept
  is '部门信息';
comment on column SUPP_CONTACTINFO.call
  is '称呼';
comment on column SUPP_CONTACTINFO.role
  is '角色';
comment on column SUPP_CONTACTINFO.phone
  is '办公室电话';
comment on column SUPP_CONTACTINFO.fax
  is '传真';
comment on column SUPP_CONTACTINFO.email
  is '电子邮件';
comment on column SUPP_CONTACTINFO.address
  is '地址';
comment on column SUPP_CONTACTINFO.postcode
  is '邮编';
comment on column SUPP_CONTACTINFO.mobile
  is '移动电话';
comment on column SUPP_CONTACTINFO.homecall
  is '家庭电话';
comment on column SUPP_CONTACTINFO.photo
  is '照片';
comment on column SUPP_CONTACTINFO.description
  is '操作描述';
comment on column SUPP_CONTACTINFO.creator_id
  is '创建者id';
comment on column SUPP_CONTACTINFO.creator
  is '创建者';
comment on column SUPP_CONTACTINFO.create_date
  is '创建日期';
comment on column SUPP_CONTACTINFO.modifiedby
  is '修改人';
comment on column SUPP_CONTACTINFO.modifiedby_id
  is '修改人id';
comment on column SUPP_CONTACTINFO.modified_date
  is '修改日期';
comment on column SUPP_CONTACTINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column SUPP_CONTACTINFO.version
  is '版本号';
comment on column SUPP_CONTACTINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column SUPP_CONTACTINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column SUPP_CONTACTINFO.bus_date
  is '业务时间';
comment on column SUPP_CONTACTINFO.exa_remarks
  is '审批备注';

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
  is '供应商基本信息表';
comment on column SUPP_INFO.id
  is 'ID';
comment on column SUPP_INFO.sid
  is '原系统ID';
comment on column SUPP_INFO.suppcode
  is '供应商代码';
comment on column SUPP_INFO.suppname
  is '供应商名称';
comment on column SUPP_INFO.unitroleid
  is '单位角色ID';
comment on column SUPP_INFO.unitrole
  is '单位角色';
comment on column SUPP_INFO.legalperson
  is '法人代表';
comment on column SUPP_INFO.unitnatureid
  is '单位性质ID';
comment on column SUPP_INFO.unitnature
  is '单位性质';
comment on column SUPP_INFO.provincecity
  is '所在省市';
comment on column SUPP_INFO.regeditaddress
  is '注册地址';
comment on column SUPP_INFO.bank
  is '开户银行';
comment on column SUPP_INFO.bankaccount
  is '银行账号';
comment on column SUPP_INFO.bussinesslicence
  is '营业执照号';
comment on column SUPP_INFO.whichindustry
  is '所在行业';
comment on column SUPP_INFO.orgcode
  is '组织机构代码证';
comment on column SUPP_INFO.areataxnum
  is '地税登记号';
comment on column SUPP_INFO.nationtaxnum
  is '国税登记号';
comment on column SUPP_INFO.address
  is '通讯地址';
comment on column SUPP_INFO.postalcode
  is '邮政编码';
comment on column SUPP_INFO.phone
  is '电话号码';
comment on column SUPP_INFO.fax
  is '传真号码';
comment on column SUPP_INFO.email
  is '电子邮件';
comment on column SUPP_INFO.homepage
  is '公司主页';
comment on column SUPP_INFO.supp_description
  is '公司简介';
comment on column SUPP_INFO.description
  is '操作描述';
comment on column SUPP_INFO.creator_id
  is '创建者id';
comment on column SUPP_INFO.creator
  is '创建者';
comment on column SUPP_INFO.create_date
  is '创建日期';
comment on column SUPP_INFO.modifiedby
  is '修改人';
comment on column SUPP_INFO.modifiedby_id
  is '修改人id';
comment on column SUPP_INFO.modified_date
  is '修改日期';
comment on column SUPP_INFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column SUPP_INFO.version
  is '版本号';
comment on column SUPP_INFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column SUPP_INFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column SUPP_INFO.bus_date
  is '业务时间';
comment on column SUPP_INFO.exa_remarks
  is '审批备注';

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
  is '经营属性表';
comment on column SUPP_MANAGEMENTINFO.id
  is 'ID';
comment on column SUPP_MANAGEMENTINFO.sid
  is '原系统ID';
comment on column SUPP_MANAGEMENTINFO.suppid
  is 'SuppID';
comment on column SUPP_MANAGEMENTINFO.suppcode
  is '供应商代码';
comment on column SUPP_MANAGEMENTINFO.statusid
  is '供应商状态/审核状态ID';
comment on column SUPP_MANAGEMENTINFO.status
  is '供应商状态/审核状态';
comment on column SUPP_MANAGEMENTINFO.ispassisoid
  is '是否通过ISOID';
comment on column SUPP_MANAGEMENTINFO.ispassiso
  is '是否通过ISO';
comment on column SUPP_MANAGEMENTINFO.unitcreditid
  is '单位资信ID';
comment on column SUPP_MANAGEMENTINFO.unitcredit
  is '单位资信';
comment on column SUPP_MANAGEMENTINFO.regeditcapital
  is '注册资本';
comment on column SUPP_MANAGEMENTINFO.assetscapital
  is '固定资产';
comment on column SUPP_MANAGEMENTINFO.flowcapital
  is '流动资金';
comment on column SUPP_MANAGEMENTINFO.yearsellamount
  is '年销售额';
comment on column SUPP_MANAGEMENTINFO.fatorynum
  is '工厂数量';
comment on column SUPP_MANAGEMENTINFO.fatoryaddress
  is '工厂地址';
comment on column SUPP_MANAGEMENTINFO.fatoryphone
  is '工厂电话';
comment on column SUPP_MANAGEMENTINFO.prjfax
  is '工程传真';
comment on column SUPP_MANAGEMENTINFO.employeenum
  is '公司员工总数';
comment on column SUPP_MANAGEMENTINFO.technicalstaffnum
  is '技术人员数量';
comment on column SUPP_MANAGEMENTINFO.managementstaffnum
  is '管理人员数量';
comment on column SUPP_MANAGEMENTINFO.description
  is '操作描述';
comment on column SUPP_MANAGEMENTINFO.creator_id
  is '创建者id';
comment on column SUPP_MANAGEMENTINFO.creator
  is '创建者';
comment on column SUPP_MANAGEMENTINFO.create_date
  is '创建日期';
comment on column SUPP_MANAGEMENTINFO.modifiedby
  is '修改人';
comment on column SUPP_MANAGEMENTINFO.modifiedby_id
  is '修改人id';
comment on column SUPP_MANAGEMENTINFO.modified_date
  is '修改日期';
comment on column SUPP_MANAGEMENTINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column SUPP_MANAGEMENTINFO.version
  is '版本号';
comment on column SUPP_MANAGEMENTINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column SUPP_MANAGEMENTINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column SUPP_MANAGEMENTINFO.bus_date
  is '业务时间';
comment on column SUPP_MANAGEMENTINFO.exa_remarks
  is '审批备注';

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
  is '产品属性表';
comment on column SUPP_PRODUCTINFO.id
  is 'ID';
comment on column SUPP_PRODUCTINFO.sid
  is '原系统ID';
comment on column SUPP_PRODUCTINFO.suppid
  is 'SuppID';
comment on column SUPP_PRODUCTINFO.suppcode
  is '供应商代码';
comment on column SUPP_PRODUCTINFO.productcode
  is '产品代码';
comment on column SUPP_PRODUCTINFO.productname
  is '产品名称';
comment on column SUPP_PRODUCTINFO.specification
  is '规格';
comment on column SUPP_PRODUCTINFO.model
  is '型号';
comment on column SUPP_PRODUCTINFO.budgetprice
  is '预算价格';
comment on column SUPP_PRODUCTINFO.purchaseadvance
  is '采购提前期';
comment on column SUPP_PRODUCTINFO.arrivaladvance
  is '到货提前期';
comment on column SUPP_PRODUCTINFO.purchasecycle
  is '采购周期';
comment on column SUPP_PRODUCTINFO.feetype
  is '费用类别';
comment on column SUPP_PRODUCTINFO.description
  is '操作描述';
comment on column SUPP_PRODUCTINFO.creator_id
  is '创建者id';
comment on column SUPP_PRODUCTINFO.creator
  is '创建者';
comment on column SUPP_PRODUCTINFO.create_date
  is '创建日期';
comment on column SUPP_PRODUCTINFO.modifiedby
  is '修改人';
comment on column SUPP_PRODUCTINFO.modifiedby_id
  is '修改人id';
comment on column SUPP_PRODUCTINFO.modified_date
  is '修改日期';
comment on column SUPP_PRODUCTINFO.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column SUPP_PRODUCTINFO.version
  is '版本号';
comment on column SUPP_PRODUCTINFO.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column SUPP_PRODUCTINFO.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column SUPP_PRODUCTINFO.bus_date
  is '业务时间';
comment on column SUPP_PRODUCTINFO.exa_remarks
  is '审批备注';

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
  is '接触记录表';
comment on column SUPP_TOUCHRECORD.id
  is 'ID';
comment on column SUPP_TOUCHRECORD.sid
  is '原系统ID';
comment on column SUPP_TOUCHRECORD.suppid
  is 'SuppID';
comment on column SUPP_TOUCHRECORD.suppcode
  is '供应商代码';
comment on column SUPP_TOUCHRECORD.contcode
  is '合同编号';
comment on column SUPP_TOUCHRECORD.contname
  is '合同名称';
comment on column SUPP_TOUCHRECORD.performanceevaluation
  is '履约评价';
comment on column SUPP_TOUCHRECORD.biddate
  is '应标日期';
comment on column SUPP_TOUCHRECORD.biddingresultsid
  is '应标结果ID';
comment on column SUPP_TOUCHRECORD.biddingresults
  is '应标结果';
comment on column SUPP_TOUCHRECORD.description
  is '操作描述';
comment on column SUPP_TOUCHRECORD.creator_id
  is '创建者id';
comment on column SUPP_TOUCHRECORD.creator
  is '创建者';
comment on column SUPP_TOUCHRECORD.create_date
  is '创建日期';
comment on column SUPP_TOUCHRECORD.modifiedby
  is '修改人';
comment on column SUPP_TOUCHRECORD.modifiedby_id
  is '修改人id';
comment on column SUPP_TOUCHRECORD.modified_date
  is '修改日期';
comment on column SUPP_TOUCHRECORD.version_status
  is '版本状态(1:启用，0：不启用)';
comment on column SUPP_TOUCHRECORD.version
  is '版本号';
comment on column SUPP_TOUCHRECORD.latestversion
  is '是否最新版本（1：是，0：否）';
comment on column SUPP_TOUCHRECORD.approvalstae
  is '审批状态（0:待审批;1:  审批通过;2:审批未通过)';
comment on column SUPP_TOUCHRECORD.bus_date
  is '业务时间';
comment on column SUPP_TOUCHRECORD.exa_remarks
  is '审批备注';


spool off
