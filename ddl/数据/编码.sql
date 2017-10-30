--------------------------------------------
-- Export file for user C##_BIGDATA@ZZMDM --
-- Created by zhy on 2017/10/13, 11:23:48 --
--------------------------------------------

set define off
spool ����.log

prompt
prompt Creating table CODE_CODING
prompt ==========================
prompt
create table CODE_CODING
(
  coding_code   VARCHAR2(120) not null,
  coding_name   VARCHAR2(120),
  coding_type   VARCHAR2(120),
  coding_level  NUMBER(8),
  apply_code    VARCHAR2(120),
  version       NUMBER(8),
  creator       VARCHAR2(120),
  create_date   DATE,
  parent_coding VARCHAR2(120)
)
;
comment on column CODE_CODING.coding_code
  is '�������';
comment on column CODE_CODING.coding_name
  is '��������';
comment on column CODE_CODING.coding_type
  is '�������';
comment on column CODE_CODING.coding_level
  is '����㼶';
comment on column CODE_CODING.apply_code
  is '���뵥��';
comment on column CODE_CODING.version
  is '�汾';
comment on column CODE_CODING.creator
  is '������';
comment on column CODE_CODING.create_date
  is '����ʱ��';
comment on column CODE_CODING.parent_coding
  is '�ϼ�����';

prompt
prompt Creating table CODE_CUSTOM
prompt ==========================
prompt
create table CODE_CUSTOM
(
  code_name      VARCHAR2(128),
  code_value     VARCHAR2(100),
  type_code      VARCHAR2(100),
  remarks        VARCHAR2(255),
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
  parent_code    VARCHAR2(120)
)
;
comment on column CODE_CUSTOM.code_name
  is '�Զ����������';
comment on column CODE_CUSTOM.code_value
  is '�Զ������ֵ';
comment on column CODE_CUSTOM.type_code
  is '�Զ���������ͱ���';
comment on column CODE_CUSTOM.remarks
  is '��ע';
comment on column CODE_CUSTOM.sort_id
  is '����';
comment on column CODE_CUSTOM.description
  is '��������';
comment on column CODE_CUSTOM.creator_id
  is '������id';
comment on column CODE_CUSTOM.creator
  is '������';
comment on column CODE_CUSTOM.create_date
  is '��������';
comment on column CODE_CUSTOM.modifiedby
  is '�޸���';
comment on column CODE_CUSTOM.modifiedby_id
  is '�޸���id';
comment on column CODE_CUSTOM.modified_date
  is '�޸�����';
comment on column CODE_CUSTOM.version_status
  is '�汾״̬(1:���ã�0��������)';
comment on column CODE_CUSTOM.version
  is '�汾��';
comment on column CODE_CUSTOM.parent_code
  is '��������';


spool off
