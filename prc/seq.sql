--------------------------------------------
-- Export file for user C##_BIGDATA@ZZMDM --
-- Created by zhy on 2017/10/13, 13:13:40 --
--------------------------------------------

set define off
spool seq.log

prompt
prompt Creating sequence DATACONFIG_SEQ
prompt ================================
prompt
create sequence DATACONFIG_SEQ
minvalue 1
maxvalue 9999999999999999999999999999
start with 791
increment by 1
cache 10;


spool off
