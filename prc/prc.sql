--------------------------------------------
-- Export file for user C##_BIGDATA@ZZMDM --
-- Created by zhy on 2017/10/13, 13:12:47 --
--------------------------------------------

set define off
spool prc.log

prompt
prompt Creating procedure CONVERSION
prompt =============================
prompt
create or replace procedure conversion as
--�˴洢���������������CODE_CODING_TYPE��ʼ����DATA_CONFIG���ñ�
  CURSOR jgj IS
   select CODING_TYPE_CODE,CODING_CLASSIFY from CODE_CODING_TYPE;
   obj  jgj%ROWTYPE;
   typecodin varchar2(40);--��׼�������ֵ
   isdata INTEGER;--�����ж�
   istype varchar2(20);--�������ͣ��ж����Զ�����뻹�Ǳ�׼���룩
   typecode varchar2(40);--�Զ���������ֵ
begin
  OPEN jgj;
  LOOP
    FETCH jgj
      INTO obj;
    Exit when jgj%NOTFOUND;
    typecodin:='CODING_TYPE:'||obj.CODING_TYPE_CODE;
    istype:=obj.CODING_CLASSIFY;
    typecode:='TYPE_CODE:'||obj.CODING_TYPE_CODE;
     select count(1) into isdata from DATA_CONFIG where FILTER_CON in(typecodin,typecode);
    if isdata = 0 then
      if istype = 1 then
         INSERT INTO DATA_CONFIG ( CONFIG_ID,TABLENAME,TABLEFIELD,FILTER_CON,SERVICETIME,TABLECNNAME,TABLECNFIELD,RESPONSETYPE,DATATYPE)
         VALUES(dataConfig_seq.NEXTVAL,'code_custom','code_name,code_value,',typecode,'0 0 0 * * ?','�Զ������','code_name:�Զ����������//code_value:�Զ������ֵ//','1','1');
      end if;

        INSERT INTO DATA_CONFIG ( CONFIG_ID,TABLENAME,TABLEFIELD,FILTER_CON,SERVICETIME,TABLECNNAME,TABLECNFIELD,RESPONSETYPE,DATATYPE)
         VALUES(dataConfig_seq.NEXTVAL,'code_coding','coding_name,coding_code,',typecodin,'0 0 0 * * ?','��׼����','coding_name:��׼��������//coding_code:��׼����ֵ//','1','1');
     end if;
  END LOOP;
  CLOSE jgj;
  commit;
  EXCEPTION
    WHEN OTHERS THEN
  ROLLBACK;
end;
/

prompt
prompt Creating procedure GETPROVINCE
prompt ==============================
prompt
CREATE OR REPLACE PROCEDURE GETPROVINCE (cur out person_package.Result_Cur)
as
str_sql varchar2(200):='select distinct province_code ,
province_name from dim_area_level order by province_code';
begin
open cur for str_sql;
end;
/

prompt
prompt Creating procedure PRC_PROC_LOG
prompt ===============================
prompt
CREATE OR REPLACE PROCEDURE prc_proc_log(v_proc_id     IN NUMBER,  ---�洢���̵�ID��ʶ
                                         iv_date       IN VARCHAR2,---����ͳ������
                                         v_proc_name   IN VARCHAR2,---�洢��������
                                         v_tab_name    IN VARCHAR2,---Ŀ�����
                                         v_step_name   IN VARCHAR2,---��������
                                         v_begin_time  IN VARCHAR2,---�洢����ִ�еĿ�ʼʱ��
                                         v_end_time    IN VARCHAR2,---�洢����ִ�еĽ���ʱ��
                                         v_error_flag  IN VARCHAR2,-----�����־��0��������1������
                                         v_log_mess    IN VARCHAR2,-----��־��Ϣ
                                         v_effect_rows IN NUMBER)  -----��Ч��¼
IS
  v_proc_name_upper VARCHAR2(32) := upper(v_proc_name);
  v_tab_name_upper  VARCHAR2(32) := upper(v_tab_name);
  v_step_name_upper VARCHAR2(200) := upper(v_step_name);
BEGIN
  INSERT INTO PROC_LOG
    (proc_id,
     mark_time,
     Proc_Name,
     tab_name,
     Step_Name,
     Begin_Time,
     End_Time,
     Error_Flag,
     Log_Mess,
     effect_rows)
  VALUES
    (v_proc_id,
     iv_date,
     v_proc_name_upper,
     v_tab_name_upper,
     v_step_name_upper,
     v_begin_time,
     v_end_time,
     v_error_flag,
     substr(v_log_mess, 1, 300),
     v_effect_rows);
  COMMIT;
EXCEPTION
  WHEN OTHERS THEN
    RAISE;
END prc_proc_log;
/

prompt
prompt Creating procedure PRC_CREATE_SNAPVIEW
prompt ======================================
prompt
create or replace procedure prc_create_snapview
(
  iv_date    in varchar2  -- ����ͳ�����ڣ���ʽ��yyyymm
)
is
/***************************************************************************************************
  * Ŀ���SNAP_VIEWS��������ͼ��
  * Դ��SNAP_CONFIG(�������ñ�)

  * ��ʽ��     ����
  * ����Ƶ�ȣ� ����
  * ������˵��: ���ݿ������ñ��������ԵĿ�����ͼ
  * ��������� iv_date    �������ڣ���ʽ��yyyymmdd

  * ��������� ��
  * ���ߣ�        ����
  * �������ڣ�    2017-8-4
  *
  * �޸ļ�¼
  **************************************************************************************************
  * �޸���                  �޸�����          �޸�����
  *************************************************************************************************/
  v_proc_name   varchar2(32) := 'CREATE_SNAPVIEW'; --�洢������
  v_tab_name    varchar2(32) := 'SNAP_CONFIG';--Ŀ�����
  v_step_name   varchar2(100):= '���������ԵĿ�����ͼ'; --��������
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --����ʱ��
  v_error_flag  varchar2(4)  := '0'; --�����־��0��������1������
  v_log_mess    varchar2(300):='insert into snap_views normal'; --��־��Ϣ
  v_effect_rows number := 0; --��ЧӰ������
  v_proc_id     number := seq_proc_log.nextval; --�洢���̵�ID��
  v_createview_sql varchar2(10000);  /*������ͼ�����*/
  v_snap_views     varchar2(1000);   /*ɾ�����еĿ�����ͼ��ļ�¼*/
  v_sql_tmp1       varchar2(1000);  /*��¼����������ͼasǰ���ַ���*/
  v_sql_tmp2       varchar2(1000);  /*ƴ����ͼ��sql��ɸѡ�����޸�ʱ�������¼�¼��������ַ���*/
  v_sql_tmp3       varchar2(1000);  /*v_sql_tmp2ȥ�����һ������*/
  v_sql_tmp4       varchar2(1000);  /*ƴ����ͼ��sql��ɸѡ�����޸�ʱ�������¼�¼�Ĺ�������ַ���*/
  v_sql_tmp5       varchar2(1000); /*v_sql_tmp4ȥ�����һ������*/
  v_sql_tmp6       varchar2(1000); /*��ȡ����sql��ѡ���ֶ�*/
  v_sql_tmp7       varchar2(1000); /*��ȡ���ñ���sql��on֮�����������*/
  v_sql_con1       varchar2(1000);/*ɸѡ�������µļ�¼����*/
  v_sql_con2       varchar2(1000);/*ɸѡ���������µļ�¼����*/
  v_busdate        varchar2(1000);  /*��¼���ñ���ҵ�����ڷָ���ÿ�������ݶ�Ӧ��ҵ������*/
  bus_indx         number  :=0;     /*ҵ������ѭ������*/
  v_mtabnames      varchar2(1000);  /*�������鼯��*/
  v_mtabname       varchar2(1000);
  v_ctabnames      varchar2(1000);   /*���������鼯��*/
  v_ctabname       varchar2(1000);
  v_uniq_key       varchar2(1000);  /*��¼�����ݱ���߼������ֶ�*/
  mtab_indx        number  :=0; /*����ѭ������*/
  mtab_cnt         number;  /*ͳ������ĸ���*/
  ctab_indx        number  :=0; /*������ѭ������*/
  ctab_cnt         number;  /*ͳ�ƹ�����ĸ���*/
  cursor c_viewname is select snap_tabname,--���յ������ݱ���
                              snap_viewname,--���յ���ͼ��
                              view_type,--������ͼ����������
                              patch_code,--�����ݵ�ҵ������
                              sql_text --����������ͼ������sql
                        from snap_config where snap_type='C';
  c_row c_viewname%rowtype;
begin
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '����ʼִ��'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, 'Procedure begins successfully', v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  
  /*������ͼ*/
  for c_row in c_viewname loop
      v_effect_rows := 0;
      v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
      v_step_name:= '��ʼɾ��snap_views���к��е�ǰ��ͼ���Ƶ�����'; --��������
      prc_proc_log(v_proc_id,iv_date,v_proc_name,''  || c_row.snap_viewname  ||'', v_step_name, v_begin_time, v_end_time, v_error_flag, 'create view '  || c_row.snap_viewname  ||' normal', v_effect_rows);
      v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
      
      v_snap_views :='delete from snap_views where view_name='||''''||c_row.snap_viewname||'_'||iv_date||''''||'';

      --dbms_output.put_line(v_snap_views);
      execute immediate v_snap_views;

      v_effect_rows := sql%rowcount; --��ЧӰ������
      v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
      v_step_name:= 'ɾ��ɾ��snap_views���к��е�ǰ��ͼ���Ƶ����ݽ���'; --��������
      prc_proc_log(v_proc_id,iv_date,v_proc_name,''  || c_row.snap_viewname  ||'', v_step_name, v_begin_time, v_end_time, v_error_flag, 'create view '  || c_row.snap_viewname  ||' normal', v_effect_rows);
      v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
      commit;
             
      v_sql_tmp1 :='create view  '||c_row.snap_viewname||'_'||iv_date||' as ';
      if c_row.view_type = 'V'
      then
         if instr(c_row.sql_text,'INNER JOIN',1,1)!=0
         then 
           /*��ȡ�����ַ���*/
             v_mtabnames :=replace(substr(c_row.sql_text,instr(c_row.sql_text,'FROM',1,1)+4,instr(c_row.sql_text,'INNER',1,1)-instr(c_row.sql_text,'FROM',1,1)-4),' ','');
             v_ctabnames :=replace(substr(c_row.sql_text,instr(c_row.sql_text,'JOIN',1,1)+4,instr(c_row.sql_text,' ON',1,1)-instr(c_row.sql_text,'JOIN',1,1)-3),' ','');
             loop
                    bus_indx :=bus_indx+1;
                    select regexp_substr(c_row.patch_code, '[^,]+', 1, bus_indx) 
                      into v_busdate 
                      from dual;
                    mtab_indx :=mtab_indx+1;
                    /*������������,Ϊ�ָ����������*/
                    select regexp_substr(v_mtabnames, '[^,]+', 1, mtab_indx),length(v_mtabnames)-length(replace(v_mtabnames,','))+1 
                      into v_mtabname,mtab_cnt 
                      from dual;
                    select tar_attri_en_nm
                      into v_uniq_key
                      from meta_tar_attri c
                     where c.tar_entity_id in(select tar_entity_id 
                                                from meta_tar_entity p 
                                                where p.tar_tab_en_nm=v_mtabname 
                                                and p.versionstatus=1) 
                      and c.unique_flay='Y';
                    v_sql_tmp2 := v_sql_tmp2||'(select '|| '' ||v_mtabname|| ''||'.*,row_number()over(partition by '|| '' ||v_uniq_key|| ''||' order by version desc) rm_'|| '' ||mtab_indx|| '' ||' from '|| '' ||v_mtabname|| '' ||' where modified_date<to_date(' || '''' ||iv_date|| '''' || ',''yyyymm'') and patch_code = ' || '''' ||v_busdate|| '''' || ') '|| ''||v_mtabname|| ''||',' ;
                    dbms_output.put_line(v_sql_tmp2);
                    v_sql_con1 :=v_sql_con1||' AND '|| '' ||v_mtabname|| ''||'.rm_'|| '' ||mtab_indx|| '' ||'=1';
             exit when mtab_indx = mtab_cnt;
             end loop;
             v_sql_tmp3 :=substr(v_sql_tmp2,1,length(v_sql_tmp2)-1);
             loop
                    bus_indx :=bus_indx+1;
                    select regexp_substr(c_row.patch_code, '[^,]+', 1, bus_indx) 
                      into v_busdate 
                      from dual;
                    ctab_indx :=ctab_indx+1;
                    /*�ӹ�����������,Ϊ�ָ����������*/
                    select regexp_substr(v_ctabnames, '[^,]+', 1, ctab_indx),length(v_ctabnames)-length(replace(v_ctabnames,','))+1 
                      into v_ctabname,ctab_cnt 
                      from dual;
                    select tar_attri_en_nm
                      into v_uniq_key
                      from meta_tar_attri c
                     where c.tar_entity_id in(select tar_entity_id 
                                                from meta_tar_entity p 
                                                where p.tar_tab_en_nm=v_ctabname 
                                                and p.versionstatus=1) 
                       and c.unique_flay='Y';
                     v_sql_tmp4 := v_sql_tmp4||'(select '|| '' ||v_ctabname|| ''||'.*,row_number()over(partition by '|| '' ||v_uniq_key|| ''||' order by version desc) rc_'|| '' ||ctab_indx|| '' ||' from '|| '' ||v_ctabname|| '' ||' where modified_date<to_date(' || '''' ||iv_date|| '''' || ',''yyyymm'') and patch_code = ' || '''' ||v_busdate|| '''' || ') '|| ''||v_ctabname|| ''||',' ;
                     v_sql_con2 :=v_sql_con2||' AND '|| '' ||v_ctabname|| ''||'.rc_'|| '' ||ctab_indx|| '' ||'=1';
             exit when ctab_indx = ctab_cnt;
             end loop;            
             v_sql_tmp5 :=substr(v_sql_tmp4,1,length(v_sql_tmp4)-1);
             v_sql_tmp6 := replace(substr(c_row.sql_text,7,instr(c_row.sql_text,'FROM',1)-instr(c_row.sql_text,'SELECT',1)-6),' ');
             v_sql_tmp7 := substr(c_row.sql_text,instr(c_row.sql_text,' ON',1));
             v_createview_sql :=v_sql_tmp1||'SELECT '||v_sql_tmp6||' FROM '||v_sql_tmp3||' INNER JOIN '||v_sql_tmp5||v_sql_tmp7||v_sql_con1||v_sql_con2;
             --dbms_output.put_line(v_createview_sql);
             
             v_effect_rows := 0;
             v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
             v_step_name:= '��ʼ����'  || c_row.snap_viewname  ||'��ͼ'; --��������
             prc_proc_log(v_proc_id,iv_date,v_proc_name,''  || c_row.snap_viewname  ||'', v_step_name, v_begin_time, v_end_time, v_error_flag, 'create view '  || c_row.snap_viewname  ||' normal', v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
             
             execute immediate v_createview_sql;
             
             v_effect_rows := sql%rowcount; --��ЧӰ������
             v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
             v_step_name:= '����'  || c_row.snap_viewname  ||'��ͼ����'; --��������
             prc_proc_log(v_proc_id,iv_date,v_proc_name,''  || c_row.snap_viewname  ||'', v_step_name, v_begin_time, v_end_time, v_error_flag, 'create view '  || c_row.snap_viewname  ||' normal', v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
             commit;
             
             v_effect_rows := 0;
             v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
             v_step_name:= '��ʼ������ͼ��Ϣ��SNAP_VIEWS����'; --��������
             prc_proc_log(v_proc_id,iv_date,v_proc_name,'SNAP_VIEWS', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
                            
             /*��ͼ���������ͼ��Ϣ���뵽������ͼ��*/
             insert into snap_views
                  select sys_guid(),
                         t.snap_id,
                         c_row.snap_viewname||'_'||iv_date,
                         sysdate,
                         ''
                    from snap_config t
                   where t.snap_viewname=c_row.snap_viewname;
                   
             v_effect_rows := sql%rowcount; --��ЧӰ������
             v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
             v_step_name:= '������ͼ��Ϣ��SNAP_VIEWS���н���'; --��������
             prc_proc_log(v_proc_id,iv_date,v_proc_name,'SNAP_VIEWS', v_step_name, v_begin_time, v_end_time, v_error_flag,v_log_mess, v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
             commit; 
                      
          elsif instr(c_row.sql_text,'LEFT JOIN',1,1)!=0
          then
            /*��ȡ�����ַ���*/
             v_mtabnames := replace(substr(c_row.sql_text,instr(c_row.sql_text,'FROM',1,1)+4,instr(c_row.sql_text,'LEFT',1,1)-instr(c_row.sql_text,'FROM',1,1)-5),' ','');
             v_ctabnames :=replace(substr(c_row.sql_text,instr(c_row.sql_text,'JOIN',1,1)+4,instr(c_row.sql_text,' ON',1,1)-instr(c_row.sql_text,'JOIN',1,1)-3),' ','');
             loop
                bus_indx :=bus_indx+1;
                select regexp_substr(c_row.patch_code, '[^,]+', 1, bus_indx) 
                  into v_busdate 
                  from dual;        
                mtab_indx :=mtab_indx+1;
                /*������������,Ϊ�ָ����������*/
                select regexp_substr(v_mtabnames, '[^,]+', 1, mtab_indx),length(v_mtabnames)-length(replace(v_mtabnames,','))+1 
                  into v_mtabname,mtab_cnt 
                  from dual;
                select tar_attri_en_nm
                  into v_uniq_key
                  from meta_tar_attri c
                 where c.tar_entity_id in(select tar_entity_id 
                                            from meta_tar_entity p 
                                            where p.tar_tab_en_nm=v_mtabname 
                                            and p.versionstatus=1) 
                   and c.unique_flay='Y';
                v_sql_tmp2 := v_sql_tmp2||'(select '|| '' ||v_mtabname|| ''||'.*,row_number()over(partition by '|| '' ||v_uniq_key|| ''||' order by version desc) rm_'|| '' ||mtab_indx|| '' ||' from '|| '' ||v_mtabname|| '' ||' where modified_date<to_date(' || '''' ||iv_date|| '''' || ',''yyyymm'') and patch_code = ' || '''' ||v_busdate|| '''' || ') '|| ''||v_mtabname|| ''||',' ;
                v_sql_con1 :=v_sql_con1||' AND '|| '' ||v_mtabname|| ''||'.rm_'|| '' ||mtab_indx|| '' ||'=1';
             exit when mtab_indx = mtab_cnt;
             end loop;
             v_sql_tmp3 :=substr(v_sql_tmp2,1,length(v_sql_tmp2)-1);
             loop
                bus_indx :=bus_indx+1;
                select regexp_substr(c_row.patch_code, '[^,]+', 1, bus_indx) 
                  into v_busdate 
                  from dual;
                ctab_indx :=ctab_indx+1;
                /*�ӹ�����������,Ϊ�ָ����������*/
                select regexp_substr(v_ctabnames, '[^,]+', 1, ctab_indx),length(v_ctabnames)-length(replace(v_ctabnames,','))+1 
                  into v_ctabname,ctab_cnt 
                  from dual;
                select tar_attri_en_nm
                  into v_uniq_key
                  from meta_tar_attri c
                 where c.tar_entity_id in(select tar_entity_id 
                                            from meta_tar_entity p 
                                            where p.tar_tab_en_nm=v_ctabname 
                                            and p.versionstatus=1) 
                   and c.unique_flay='Y';
                v_sql_tmp4 := v_sql_tmp4||'(select '|| '' ||v_ctabname|| ''||'.*,row_number()over(partition by '|| '' ||v_uniq_key|| ''||' order by version desc) rc_'|| '' ||ctab_indx|| '' ||' from '|| '' ||v_ctabname|| '' ||' where modified_date<to_date(' || '''' ||iv_date|| '''' || ',''yyyymm'') and patch_code = ' || '''' ||v_busdate|| '''' || ') '|| ''||v_ctabname|| ''||',' ;
                v_sql_con2 :=v_sql_con2||' AND '|| '' ||v_ctabname|| ''||'.rc_'|| '' ||ctab_indx|| '' ||'=1';
             exit when ctab_indx = ctab_cnt;
             end loop;            
             v_sql_tmp5 :=substr(v_sql_tmp4,1,length(v_sql_tmp4)-1);
             v_sql_tmp6 := replace(substr(c_row.sql_text,7,instr(c_row.sql_text,'FROM',1)-instr(c_row.sql_text,'SELECT',1)-6),' ');
             v_sql_tmp7 := substr(c_row.sql_text,instr(c_row.sql_text,' ON',1));
             v_createview_sql :=v_sql_tmp1||'SELECT '||v_sql_tmp6||' FROM '||v_sql_tmp3||' LEFT JOIN '||v_sql_tmp5||v_sql_tmp7||v_sql_con1||v_sql_con2;
             --dbms_output.put_line(v_createview_sql);
             
             v_effect_rows := 0;
             v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
             v_step_name:= '��ʼ����'  || c_row.snap_viewname  ||'��ͼ'; --��������
             prc_proc_log(v_proc_id,iv_date,v_proc_name,''  || c_row.snap_viewname  ||'', v_step_name, v_begin_time, v_end_time, v_error_flag, 'create view '  || c_row.snap_viewname  ||' normal', v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
             
             execute immediate v_createview_sql;
             
             v_effect_rows := sql%rowcount; --��ЧӰ������
             v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
             v_step_name:= '����'  || c_row.snap_viewname  ||'��ͼ����'; --��������
             prc_proc_log(v_proc_id,iv_date,v_proc_name,''  || c_row.snap_viewname  ||'', v_step_name, v_begin_time, v_end_time, v_error_flag, 'create view '  || c_row.snap_viewname  ||' normal', v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
             commit;
             
             v_effect_rows := 0;
             v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
             v_step_name:= '��ʼ������ͼ��Ϣ��SNAP_VIEWS����'; --��������
             prc_proc_log(v_proc_id,iv_date,v_proc_name,'SNAP_VIEWS', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
             /*��ͼ���������ͼ��Ϣ���뵽������ͼ��*/
             insert into snap_views
                  select sys_guid(),
                         t.snap_id,
                         c_row.snap_viewname||'_'||iv_date,
                         sysdate,
                         ''
                    from snap_config t
                   where t.snap_viewname=c_row.snap_viewname;
                   
             v_effect_rows := sql%rowcount; --��ЧӰ������
             v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
             v_step_name:= '������ͼ��Ϣ��SNAP_VIEWS���н���'; --��������
             prc_proc_log(v_proc_id,iv_date,v_proc_name,'SNAP_VIEWS', v_step_name, v_begin_time, v_end_time, v_error_flag,v_log_mess, v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
             commit;
           else
             /*��ȡ�����ַ���*/
             v_mtabnames :=replace(substr(c_row.sql_text,instr(c_row.sql_text,'FROM',1,1)+4,instr(c_row.sql_text,'RIGHT',1,1)-instr(c_row.sql_text,'FROM',1,1)-4),' ','');
             v_ctabnames :=replace(substr(c_row.sql_text,instr(c_row.sql_text,'JOIN',1,1)+4,instr(c_row.sql_text,' ON',1,1)-instr(c_row.sql_text,'JOIN',1,1)-3),' ','');
             loop
                bus_indx :=bus_indx+1;
                select regexp_substr(c_row.patch_code, '[^,]+', 1, bus_indx) 
                  into v_busdate 
                  from dual;
                mtab_indx :=mtab_indx+1;
                /*������������,Ϊ�ָ����������*/
                select regexp_substr(v_mtabnames, '[^,]+', 1, mtab_indx),length(v_mtabnames)-length(replace(v_mtabnames,','))+1 
                  into v_mtabname,mtab_cnt 
                  from dual;
                select tar_attri_en_nm
                  into v_uniq_key
                  from meta_tar_attri c
                 where c.tar_entity_id in(select tar_entity_id 
                                            from meta_tar_entity p 
                                            where p.tar_tab_en_nm=v_mtabname 
                                            and p.versionstatus=1) 
                  and c.unique_flay='Y';
                v_sql_tmp2 := v_sql_tmp2||'(select '|| '' ||v_mtabname|| ''||'.*,row_number()over(partition by '|| '' ||v_uniq_key|| ''||' order by version desc) rm_'|| '' ||mtab_indx|| '' ||' from '|| '' ||v_mtabname|| '' ||' where modified_date<to_date(' || '''' ||iv_date|| '''' || ',''yyyymm'') and patch_code = ' || '''' ||v_busdate|| '''' || ') '|| ''||v_mtabname|| ''||',' ;
                v_sql_con1 :=v_sql_con1||' AND '|| '' ||v_mtabname|| ''||'.rm_'|| '' ||mtab_indx|| '' ||'=1';
             exit when mtab_indx = mtab_cnt;
             end loop;
             v_sql_tmp3 :=substr(v_sql_tmp2,1,length(v_sql_tmp2)-1);
             loop
                bus_indx :=bus_indx+1;
                select regexp_substr(c_row.patch_code, '[^,]+', 1, bus_indx) 
                  into v_busdate 
                  from dual;
                ctab_indx :=ctab_indx+1;
                /*�ӹ�����������,Ϊ�ָ����������*/
                select regexp_substr(v_ctabnames, '[^,]+', 1, ctab_indx),length(v_ctabnames)-length(replace(v_ctabnames,','))+1 
                  into v_ctabname,ctab_cnt 
                  from dual;
                select tar_attri_en_nm
                  into v_uniq_key
                  from meta_tar_attri c
                 where c.tar_entity_id in(select tar_entity_id 
                                            from meta_tar_entity p 
                                            where p.tar_tab_en_nm=v_ctabname 
                                            and p.versionstatus=1) 
                   and c.unique_flay='Y';
                v_sql_tmp4 := v_sql_tmp4||'(select '|| '' ||v_ctabname|| ''||'.*,row_number()over(partition by '|| '' ||v_uniq_key|| ''||' order by version desc) rc_'|| '' ||ctab_indx|| '' ||' from '|| '' ||v_ctabname|| '' ||' where modified_date<to_date(' || '''' ||iv_date|| '''' || ',''yyyymm'') and patch_code = ' || '''' ||v_busdate|| '''' || ') '|| ''||v_ctabname|| ''||',' ;
                v_sql_con2 :=v_sql_con2||' AND '|| '' ||v_ctabname|| ''||'.rc_'|| '' ||ctab_indx|| '' ||'=1';
             exit when ctab_indx = ctab_cnt;
             end loop;            
             v_sql_tmp5 :=substr(v_sql_tmp4,1,length(v_sql_tmp4)-1);
             v_sql_tmp6 := replace(substr(c_row.sql_text,7,instr(c_row.sql_text,'FROM',1)-instr(c_row.sql_text,'SELECT',1)-6),' ');
             v_sql_tmp7 := substr(c_row.sql_text,instr(c_row.sql_text,' ON',1));
             v_createview_sql :=v_sql_tmp1||'SELECT '||v_sql_tmp6||' FROM '||v_sql_tmp3||' RIGHT JOIN '||v_sql_tmp5||v_sql_tmp7||v_sql_con1||v_sql_con2;  
             --dbms_output.put_line(v_createview_sql);

             v_effect_rows := 0;
             v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
             v_step_name:= '��ʼ����'  || c_row.snap_viewname  ||'��ͼ'; --��������
             prc_proc_log(v_proc_id,iv_date,v_proc_name,''  || c_row.snap_viewname  ||'', v_step_name, v_begin_time, v_end_time, v_error_flag, 'create view '  || c_row.snap_viewname  ||' normal', v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
             
             execute immediate v_createview_sql;
             
             v_effect_rows := sql%rowcount; --��ЧӰ������
             v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
             v_step_name:= '����'  || c_row.snap_viewname  ||'��ͼ����'; --��������
             prc_proc_log(v_proc_id,iv_date,v_proc_name,''  || c_row.snap_viewname  ||'', v_step_name, v_begin_time, v_end_time, v_error_flag, 'create view '  || c_row.snap_viewname  ||' normal', v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
             commit;

             v_effect_rows := 0;
             v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
             v_step_name:= '��ʼ������ͼ��Ϣ��SNAP_VIEWS����'; --��������
             prc_proc_log(v_proc_id,iv_date,v_proc_name,'SNAP_VIEWS', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
             /*��ͼ���������ͼ��Ϣ���뵽������ͼ��*/
             insert into snap_views
                  select sys_guid(),
                         t.snap_id,
                         c_row.snap_viewname||'_'||iv_date,
                         sysdate,
                         ''
                    from snap_config t
                   where t.snap_viewname=c_row.snap_viewname;

             v_effect_rows := sql%rowcount; --��ЧӰ������
             v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
             v_step_name:= '������ͼ��Ϣ��SNAP_VIEWS���н���'; --��������
             prc_proc_log(v_proc_id,iv_date,v_proc_name,'SNAP_VIEWS', v_step_name, v_begin_time, v_end_time, v_error_flag,v_log_mess, v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
             commit;
          end if;
     else
        select tar_attri_en_nm
                  into v_uniq_key
                  from meta_tar_attri c
                 where c.tar_entity_id in(select tar_entity_id 
                                            from meta_tar_entity p 
                                            where p.tar_tab_en_nm=c_row.snap_tabname 
                                              and p.versionstatus=1) 
                   and c.unique_flay='Y';
        v_sql_tmp7 := substr(c_row.sql_text,instr(c_row.sql_text,' WHERE',1));
        v_createview_sql :=v_sql_tmp1||' select * from (select '||''||c_row.snap_tabname||''||'.*,row_number()over(partition by '||''||v_uniq_key||''||' order by version desc) rc from '||''||c_row.snap_tabname||''||''||v_sql_tmp7||') where  modified_date < to_date(' || '''' ||iv_date|| '''' || ',''yyyymm'') and patch_code = ' || '''' ||c_row.patch_code|| '''' || ' and rc=1';
        dbms_output.put_line(v_createview_sql);
        
        v_effect_rows := 0;
        v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
        v_step_name:= '��ʼ����'  || c_row.snap_viewname  ||'��ͼ'; --��������
        prc_proc_log(v_proc_id,iv_date,v_proc_name,''  || c_row.snap_viewname  ||'', v_step_name, v_begin_time, v_end_time, v_error_flag, 'create view '  || c_row.snap_viewname  ||' normal', v_effect_rows);
        v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
             
        execute immediate v_createview_sql;
             
        v_effect_rows := sql%rowcount; --��ЧӰ������
        v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
        v_step_name:= '����'  || c_row.snap_viewname  ||'��ͼ����'; --��������
        prc_proc_log(v_proc_id,iv_date,v_proc_name,''  || c_row.snap_viewname  ||'', v_step_name, v_begin_time, v_end_time, v_error_flag, 'create view '  || c_row.snap_viewname  ||' normal', v_effect_rows);
        v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
        commit;

        v_effect_rows := 0;
        v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
        v_step_name:= '��ʼ������ͼ��Ϣ��SNAP_VIEWS����'; --��������
        prc_proc_log(v_proc_id,iv_date,v_proc_name,'SNAP_VIEWS', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
        v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
        
        /*��ͼ���������ͼ��Ϣ���뵽������ͼ��*/
         insert into snap_views
              select sys_guid(),
                     t.snap_id,
                     c_row.snap_viewname||'_'||iv_date,
                     sysdate,
                     ''
                 from snap_config t
                where t.snap_viewname=c_row.snap_viewname;
        v_effect_rows := sql%rowcount; --��ЧӰ������
        v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
        v_step_name:= '������ͼ��Ϣ��SNAP_VIEWS���н���'; --��������
        prc_proc_log(v_proc_id,iv_date,v_proc_name,'SNAP_VIEWS', v_step_name, v_begin_time, v_end_time, v_error_flag,v_log_mess, v_effect_rows);
        v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
        commit;
     end if;
  end loop;
  
   /*************************��������***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '����ִ�����'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);  
    
  /**********�쳣����Ҳ������������Ҫ�����쳣���Ƶĵط������쳣����*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'insert into snap_views fail: ' || substr(sqlerrm, 1, 300); --�쳣��־��Ϣ
      prc_proc_log(v_proc_id,iv_date,v_proc_name,''  || c_row.snap_viewname  ||'', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_DIM_AGE_RANGE
prompt ====================================
prompt
create or replace procedure prc_dim_age_range
(
  iv_date  in  varchar2  ---����ͳ�����ڣ���ʽ��yyyymmdd
)
/*************************************************************************
  * Ŀ���dim_age_range�������ά��
  * Դ��

  * ��ʽ��     ����
  * ����Ƶ�ȣ� ����
  * ������˵��: ����dim_age_range�����ά��Ŀ�ʼʱ��ͽ���ʱ������
  * ��������� iv_date    �������ڣ���ʽ��yyyymmdd
  * ��������� ��
  * ���ߣ�        ����
  * �������ڣ�    2017-2-27
  *
  * �޸ļ�¼
  *************************************************************************
  * �޸���                  �޸�����          �޸�����

  *************************************************************************/
is
  v_proc_name   varchar2(32) := 'PRC_DIM_AGE_RANGE'; --�洢������
  v_tab_name    varchar2(32) := 'DIM_AGE_RANGE';
  v_step_name   varchar2(50) := '���������ά��Ŀ�ʼʱ��ͽ���ʱ��'; --��������
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --����ʱ��
  v_error_flag  varchar2(4) := '0'; --�����־��0��������1������
  v_log_mess    varchar2(300) := 'update dim_age_range normal'; --��־��Ϣ
  v_effect_rows number := 0; --��ЧӰ������
  v_proc_id       number := seq_proc_log.nextval; --�洢���̵�ID��
begin
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '����ʼִ��'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time  := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '��ʼ����dim_age_range�����ά���ʱ������'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  
  /*���������ά��Ŀ�ʼʱ��ͽ���ʱ��*/
     update dim_age_range t
       set start_time =  case when t.to_now_months_max is null then '18000101'  ---��ʼʱ��ļ��޶�Ϊ18000101
                           else  to_char(add_months(sysdate , 0-t.to_now_months_max )+1 ,'yyyymmdd') ---��ǰʱ��������·�֮�����Ϊ��ʼʱ��
                          end ,
            end_time  =  case when t.to_now_months_min is null then '99991231'   ---����ʱ��ļ��޶�Ϊ99991231
                           else  to_char(add_months(sysdate , 0-t.to_now_months_min ) ,'yyyymmdd')   ----��ǰʱ������С�·�֮�����Ϊ����ʱ��
                         end;
                       
   v_effect_rows := sql%rowcount; --��ЧӰ������                   
   commit;
      v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
      v_step_name:= '����dim_age_range�����ά���ʱ�����ݽ���'; --��������
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
      v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    /*************************��������***************************************/
      v_effect_rows := 0;
      v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
      v_step_name:= '����ִ�����'; --��������
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   
 /**********�쳣����Ҳ������������Ҫ�����쳣���Ƶĵط������쳣����*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'update dim_age_range fail: ' || substr(sqlerrm, 1, 300); --�쳣��־��Ϣ
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;

end;
/

prompt
prompt Creating procedure PRC_DM_LEG_PER_BASIC_INFO
prompt ============================================
prompt
create or replace procedure prc_dm_leg_per_basic_info  ----������Ϣ���ܱ�
(
  iv_date  in  varchar2  ---����ͳ�����ڣ���ʽ��yyyymmdd
)
/*************************************************************************
  * Ŀ���dm_leg_per_basic_info��������Ϣ���ܱ�
  * Դ��leg_per_basic_info�����˻�����Ϣ��
          leg_per_reg_info�����˵Ǽ���Ϣ��
          dim_idt_ctgr����ҵ����ά��
          dim_reg_type���Ǽ�����ά��

  * ��ʽ��     ����
  * ����Ƶ�ȣ� ����
  * ������˵��: ���뷨����Ϣ��������
  * ��������� iv_date    �������ڣ���ʽ��yyyymmdd
  * ��������� ��
  * ���ߣ�        ����
  * �������ڣ�    2017-2-27
  *
  * �޸ļ�¼
  *************************************************************************
  * �޸���                  �޸�����          �޸�����

  *************************************************************************/
is
  v_proc_name   varchar2(32) := 'PRC_DM_LEG_PER_BASIC_INFO'; --�洢������
  v_tab_name    varchar2(32) := 'DM_LEG_PER_BASIC_INFO';--Ŀ�����
  v_step_name   varchar2(50) := '���뷨����Ϣ��������'; --��������
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --����ʱ��
  v_error_flag  varchar2(4) := '0'; --�����־��0��������1������
  v_log_mess    varchar2(300) := 'insert into dm_leg_per_basic_info normal'; --��־��Ϣ
  v_effect_rows number := 0; --��ЧӰ������
  v_proc_id     number := seq_proc_log.nextval; --�洢���̵�ID��
begin
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '����ʼִ��'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  execute immediate 'truncate table dm_leg_per_basic_info';---���±�֮ǰ����ձ������


  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '��ʼ����dm_leg_per_basic_info������'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     /*������ҵ���ࡢ�Ǽ����͡�ͳ�Ʒ���������*/
     insert into dm_leg_per_basic_info(idt_ctgr_code,reg_type_code,leg_per_cnt)
          select 
                 nvl(t1.idt_ctgr_code,'9999'),  ---��ҵ�������
                 t2.reg_type_code,     ---�Ǽ����ͱ���
                 count(tt1.reg_num)
           from  
                 leg_per_basic_info tt1,
                 leg_per_reg_info   tt2,
                 dim_idt_ctgr t1,
                 dim_reg_type t2
           where  tt1.reg_num = tt2.reg_num��+��---tt1��ע��Ŷ��ڻ����tt2���
             and tt1.reg_type_code=t2.reg_type_code
             and tt2.idt_ctgr_code=t1.idt_ctgr_code(+)--��tt2��������Ķ�Ҫ����
        group by t1.idt_ctgr_code,
                 t2.reg_type_code;

      v_effect_rows := sql%rowcount; --��ЧӰ������
      commit;
      v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
      v_step_name:= '�������dm_leg_per_basic_info����������'; --��������
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
      v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  /*************************��������***************************************/
    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '����ִ�����'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********�쳣����Ҳ������������Ҫ�����쳣���Ƶĵط������쳣����*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'insert into dm_leg_per_basic_info fail: ' || substr(sqlerrm, 1, 300); --�쳣��־��Ϣ
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;

end ;
/

prompt
prompt Creating procedure PRC_DM_POP_BASIC_INFO
prompt ========================================
prompt
create or replace procedure prc_dm_pop_basic_info  ----�˿���Ϣ���ܱ�
(
  iv_date  in  varchar2  ---����ͳ�����ڣ���ʽ��yyyymmdd
)
/*************************************************************************
  * Ŀ���dm_pop_basic_info(�˿���Ϣ���ܱ�)
  * Դ��  pop_basic_info���˿ڻ�����Ϣ��
            dim_education  ��ѧ��ά��
            dim_age_range �������ά��
            dim_childbbear_age�����举Ůά��
            dim_marry_status������״��ά��
            dim_region������ά��
            dim_sex ���Ա�ά��

  * ��ʽ��     ����
  * ����Ƶ�ȣ� ����
  * ������˵��: �����˿ڻ�������
  * ���������iv_date    �������ڣ���ʽ��yyyymmdd
  * ��������� ��
  * ���ߣ�        ����
  * �������ڣ�    2017-2-27
  *
  * �޸ļ�¼
  *************************************************************************
  * �޸���                  �޸�����          �޸�����

  *************************************************************************/
is
  v_proc_name   varchar2(32) := 'PRC_DM_POP_BASIC_INFO'; --�洢������
  v_tab_name    varchar2(32) := 'DM_POP_BASIC_INFO';--Ŀ�����
  v_step_name   varchar2(50) := '�����˿ڻ�������'; --��������
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --����ʱ��
  v_error_flag  varchar2(4) := '0'; --�����־��0��������1������
  v_log_mess    varchar2(300) := 'insert into dm_pop_basic_info normal'; --��־��Ϣ
  v_effect_rows number := 0; --��ЧӰ������
  v_proc_id     number := seq_proc_log.nextval; --�洢���̵�ID��
begin 
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '����ʼִ��'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  
  execute immediate 'truncate table dm_pop_basic_info';---��������֮ǰ����ձ������
  

  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '��ʼ����dm_pop_basic_info������'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  
  /*��ѧ��������Ρ��Ƿ����䡢����״�����������Ա�����ά��Ϊ��ͳ���˿ڱ������*/
     insert into dm_pop_basic_info
           (education_code,age_range_code,is_childbear_age_code,marry_status_code,region_code,sex_code,pop_cnt_1,pop_cnt_2,pop_cnt_3)
     select  c1.education_code ,--ѧ������
             c21.age_range_code, --����α���
             c3.is_childbear_age_code, --�Ƿ��������
             c4.marry_status_code, --����״������
             c5.region_code,  ---��������
             c6.sex_code,  ---�Ա����
             count(tt.account_no) pop_cnt_1,
             0 pop_cnt_2,
             0 pop_cnt_3
     from    pop_basic_info tt,
             dim_education  c1,
             dim_age_range  c21,
             dim_childbbear_age c3,
             dim_marry_status  c4,
             dim_region  c5,
             dim_sex    c6
     where     nvl(tt.education_code,'9999') = c1.education_code 
       and     nvl(tt.birthday , date'9999-12-31') >=  to_date(nvl(c21.start_time,'18000101'),'yyyymmdd')--�жϳ��������Ƿ��ڿ�ʼʱ��ͽ���ʱ��֮��
       and     nvl(tt.birthday , date'9999-12-31') <= to_date(nvl(c21.end_time  ,'99991231'),'yyyymmdd')
       and     nvl(tt.is_childbear_age_code,'9999') = c3.is_childbear_age_code
       and     nvl(tt.marry_status_code,'9999') = c4.marry_status_code
       and     nvl(tt.region_code,'9999')  =c5.region_code
       and     nvl(tt.pop_sex_code,'9999')  = c6.sex_code
       and     tt.version_status=1
       and     tt.latestversion=1
       and     c21.age_range_type='01'
     group by c1.education_code ,
              c21.age_range_code,
              c3.is_childbear_age_code,
              c4.marry_status_code,
              c5.region_code,
              c6.sex_code
     union all
     select  c1.education_code ,--ѧ������
             c22.age_range_code, --����α���
             c3.is_childbear_age_code, --�Ƿ��������
             c4.marry_status_code, --����״������
             c5.region_code,  ---��������
             c6.sex_code,  ---�Ա����
             0 pop_cnt_1,
             count(tt.account_no) pop_cnt_2,
             0 pop_cnt_3
     from    pop_basic_info tt,
             dim_education  c1,
             dim_age_range  c22,
             dim_childbbear_age c3,
             dim_marry_status  c4,
             dim_region  c5,
             dim_sex    c6
     where     nvl(tt.education_code,'9999') = c1.education_code 
       and     nvl(tt.birthday , date'9999-12-31') >=  to_date(nvl(c22.start_time,'18000101'),'yyyymmdd')--�жϳ��������Ƿ��ڿ�ʼʱ��ͽ���ʱ��֮��
       and     nvl(tt.birthday , date'9999-12-31') <= to_date(nvl(c22.end_time  ,'99991231'),'yyyymmdd')
       and     nvl(tt.is_childbear_age_code,'9999') = c3.is_childbear_age_code
       and     nvl(tt.marry_status_code,'9999') = c4.marry_status_code
       and     nvl(tt.region_code,'9999')  =c5.region_code
       and     nvl(tt.pop_sex_code,'9999')  = c6.sex_code
       and     tt.version_status=1
       and     tt.latestversion=1
       and     c22.age_range_type='02'
     group by c1.education_code ,
              c22.age_range_code,
              c3.is_childbear_age_code,
              c4.marry_status_code,
              c5.region_code,
              c6.sex_code
     union all
     select  c1.education_code ,--ѧ������
             c23.age_range_code, --����α���
             c3.is_childbear_age_code, --�Ƿ��������
             c4.marry_status_code, --����״������
             c5.region_code,  ---��������
             c6.sex_code,  ---�Ա����
             0 pop_cnt_1,
             0 pop_cnt_2,
             count(tt.account_no) pop_cnt_3
     from    pop_basic_info tt,
             dim_education  c1,
             dim_age_range  c23,
             dim_childbbear_age c3,
             dim_marry_status  c4,
             dim_region  c5,
             dim_sex    c6
     where     nvl(tt.education_code,'9999') = c1.education_code 
       and     nvl(tt.birthday , date'9999-12-31') >=  to_date(nvl(c23.start_time,'18000101'),'yyyymmdd')--�жϳ��������Ƿ��ڿ�ʼʱ��ͽ���ʱ��֮��
       and     nvl(tt.birthday , date'9999-12-31') <= to_date(nvl(c23.end_time  ,'99991231'),'yyyymmdd')
       and     nvl(tt.is_childbear_age_code,'9999') = c3.is_childbear_age_code
       and     nvl(tt.marry_status_code,'9999') = c4.marry_status_code
       and     nvl(tt.region_code,'9999')  =c5.region_code
       and     nvl(tt.pop_sex_code,'9999')  = c6.sex_code
       and     tt.version_status=1
       and     tt.latestversion=1
       and     c23.age_range_type='03'
     group by c1.education_code ,
              c23.age_range_code,
              c3.is_childbear_age_code,
              c4.marry_status_code,
              c5.region_code,
              c6.sex_code;
    
      v_effect_rows := sql%rowcount; --��ЧӰ������
      commit;
      v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
      v_step_name:= '�������dm_pop_basic_info����������'; --��������
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
      v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  /*************************��������***************************************/
    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '����ִ�����'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    
  /**********�쳣����Ҳ������������Ҫ�����쳣���Ƶĵط������쳣����*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'insert into dm_pop_basic_info fail: ' || substr(sqlerrm, 1, 300); --�쳣��־��Ϣ
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;

end ;
/

prompt
prompt Creating procedure PRC_LEG_PER_BASIC_INFO
prompt =========================================
prompt
create or replace procedure prc_leg_per_basic_info ---���˻�����Ϣ
(
    iv_date    in varchar2  -- ����ͳ�����ڣ���ʽ��yyyymmdd
)
/***************************************************************************************************
  * Ŀ���LEG_PER_BASIC_INFO(���˻�����Ϣ)
  * Դ��SRC0126_CORP_INFO(���ʱ�)
          SRC0126_INDIV_INFO(�����)

  * ��ʽ��     ����
  * ����Ƶ�ȣ� ����
  * ������˵��: ���ط��˻�����Ϣ������
  * ��������� iv_date    �������ڣ���ʽ��yyyymmdd

  * ��������� ��
  * ���ߣ�        ����
  * �������ڣ�    2017-3-1
  *
  * �޸ļ�¼
  **************************************************************************************************
  * �޸���                  �޸�����          �޸�����
    ����                   2017-5-23          �ɵ����ݰ汾��Ϊ������汾���µ����ݲ��뵽�����ݱ���
  *************************************************************************************************/
is
   v_proc_name   varchar2(32) := 'PRC_LEG_PER_BASIC_INFO'; --�洢������
   v_tab_name    varchar2(32) := 'LEG_PER_BASIC_INFO';--Ŀ�����
   v_step_name   varchar2(200) := '���ط��˻�����Ϣ������'; --��������
   v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --����ʱ��
   v_error_flag  varchar2(4) := '0'; --�����־��0��������1������
   v_log_mess    varchar2(300) := 'merge into LEG_PER_BASIC_INFO normal'; --��־��Ϣ
   v_effect_rows number := 0; --��ЧӰ������
   v_proc_id     number := seq_proc_log.nextval; --�洢���̵�ID��
   v_sortid      number;
   v_patch       varchar(255);
begin
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '����ʼִ��'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   
   select nvl(max(sort_id),0)+1 into v_sortid from leg_per_basic_info ;--��ȡleg_per_basic_info�������������
   
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ���TMP_LEG_PER_BASIC_INFO�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_BASIC_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
   delete from tmp_leg_per_basic_info;
   
   delete from tmp_leg_per_basic_info_bak;
     
   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '���TMP_LEG_PER_BASIC_INFO����������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_BASIC_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;
   
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ����LEG_PER_BASIC_INFO��ִ��ʱ�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
   insert into tmp_leg_per_basic_info_bak select * from leg_per_basic_info where latestversion=1 and description ='���ô洢����';
     
   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '����LEG_PER_BASIC_INFO��ִ��ʱ������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;
   
   /*�ֹ�ִ��*/
   --delete from leg_per_basic_info 
    --where modified_date >= to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd') 
   -- and modified_date< to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd') + 1
   -- and description ='���ô洢����';
    --commit;
    
    /*��ԭ����*/
    --insert into leg_per_basic_info select * from tmp_leg_per_basic_info_bak;
    --commit;

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '��ʼ��ȡSRC0126_CORP_INFO�����ݲ�����µ�TMP_LEG_PER_BASIC_INFO����'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_BASIC_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    
    
    /*���ҳ������ݱ������µ�����*/
    select t.patch_code
      into v_patch
      from patch_config t
      where t.patch_status=1
        and t.tar_tab_enname='LEG_PER_BASIC_INFO';
      
   
    /*�������ʱ�����ݵ����˻�����Ϣ��ʱ����*/
     insert into tmp_leg_per_basic_info
      select t1.usc_code,
             substr(t1.usc_code,9,9),--ͳһ������ô��루9-17λ��
             t1.mer_name,
             t1.state,
             t2.reg_type_code,
             t1.reg_type,
             t1.residence,
             t1.legal,
             t1.esta_date,
             t1.reg_dpt,
             t1.reg_num,
             t1.time,
             v_sortid ,
             '���ô洢����',
             '',
             '',
             sysdate,
             '',
             '',
             sysdate,
             1,
             a.max_version+1,
             1,
             0,
             '',
             'SRC0126_CORP_INFO',        --0�������ʱ�
             v_patch
       from src0126_corp_info t1,
            dim_reg_type t2,
            (select reg_num,patch_code,max(version) max_version from leg_per_basic_info group by reg_num,patch_code) a
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and nvl(t1.reg_type,'δ֪')=t2.reg_type_name(+) ---ƥ��Ǽ���������
        and a.reg_num=t1.reg_num
        and a.patch_code=v_patch
     union all
           select t1.usc_code,
             substr(t1.usc_code,9,9),--ͳһ������ô��루9-17λ��
             t1.mer_name,
             t1.state,
             t2.reg_type_code,
             t1.reg_type,
             t1.residence,
             t1.legal,
             t1.esta_date,
             t1.reg_dpt,
             t1.reg_num,
             t1.time,
             v_sortid ,
             '���ô洢����',
             '',
             '',
             sysdate,
             '',
             '',
             sysdate,
             1,
             1,
             1,
             0,
             '',
             'SRC0126_CORP_INFO',        --0�������ʱ�
             v_patch
       from src0126_corp_info t1,
            dim_reg_type t2,
            (select reg_num,patch_code,max(version) max_version from leg_per_basic_info group by reg_num,patch_code) a
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and nvl(t1.reg_type,'δ֪')=t2.reg_type_name(+) ---ƥ��Ǽ���������
        and a.reg_num=t1.reg_num
        and v_patch not in (select distinct patch_code  from leg_per_basic_info)
     union all
      select t1.usc_code,
             substr(t1.usc_code,9,9),--ͳһ������ô��루9-17λ��
             t1.mer_name,
             t1.state,
             t2.reg_type_code,
             t1.reg_type,
             t1.residence,
             t1.legal,
             t1.esta_date,
             t1.reg_dpt,
             t1.reg_num,
             t1.time,
             v_sortid ,
             '���ô洢����',
             '',
             '',
             sysdate,
             '',
             '',
             sysdate,
             1,
             1,
             1,
             0,
             '',
             'SRC0126_CORP_INFO',        --0�������ʱ�
             v_patch
       from src0126_corp_info t1,
            dim_reg_type t2
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and nvl(t1.reg_type,'δ֪')=t2.reg_type_name(+) ---ƥ��Ǽ���������
        and t1.reg_num not in (select s.reg_num from leg_per_basic_info s );
   
     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ȡSRC0126_CORP_INFO�����ݲ�����µ�TMP_LEG_PER_BASIC_INFO�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_BASIC_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��ȡSRC0126_INDIV_INFO�����ݲ�����µ�TMP_LEG_PER_BASIC_INFO����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_BASIC_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
 
   /*������������ݵ����˻�����Ϣ��ʱ����*/
     insert into tmp_leg_per_basic_info
      select '',
             '',
             t1.mer_name,
             t1.state,
             t2.reg_type_code,
             t1.form,
             t1.bus_place,
             t1.operator,
             t1.open_date,
             t1.reg_dpt,
             t1.reg_num,
             t1.time,
             v_sortid ,
             '���ô洢����',
             '',
             '',
             sysdate,
             '',
             '',
             sysdate,
             1,
             a.max_version+1,
             1,
             0,
             '',
             'SRC0126_INDIV_INFO',        --1��������
             v_patch
       from src0126_indiv_info t1,
            dim_reg_type t2,
            (select reg_num,patch_code,max(version) max_version from leg_per_basic_info group by reg_num,patch_code) a
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and nvl(t1.form,'δ֪')=t2.reg_type_name(+) ---ƥ��Ǽ���������
        and a.reg_num=t1.reg_num
        and a.patch_code=v_patch
     union all
           select '',
             '',
             t1.mer_name,
             t1.state,
             t2.reg_type_code,
             t1.form,
             t1.bus_place,
             t1.operator,
             t1.open_date,
             t1.reg_dpt,
             t1.reg_num,
             t1.time,
             v_sortid ,
             '���ô洢����',
             '',
             '',
             sysdate,
             '',
             '',
             sysdate,
             1,
             1,
             1,
             0,
             '',
             'SRC0126_INDIV_INFO',        --1��������
             v_patch
       from src0126_indiv_info t1,
            dim_reg_type t2,
            (select reg_num,patch_code,max(version) max_version from leg_per_basic_info group by reg_num,patch_code) a
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and nvl(t1.form,'δ֪')=t2.reg_type_name(+) ---ƥ��Ǽ���������
        and a.reg_num=t1.reg_num
        and v_patch not in (select distinct patch_code  from leg_per_basic_info)
     union all
      select '',
             '',
             t1.mer_name,
             t1.state,
             t2.reg_type_code,
             t1.form,
             t1.bus_place,
             t1.operator,
             t1.open_date,
             t1.reg_dpt,
             t1.reg_num,
             t1.time,
             v_sortid ,
             '���ô洢����',
             '',
             '',
             sysdate,
             '',
             '',
             sysdate,
             1,
             1,
             1,
             0,
             '',
             'SRC0126_INDIV_INFO',        --1��������
             v_patch
       from src0126_indiv_info t1,
            dim_reg_type t2
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and nvl(t1.form,'δ֪')=t2.reg_type_name(+) ---ƥ��Ǽ���������
        and t1.reg_num not in (select s.reg_num from leg_per_basic_info s );
        
     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ȡSRC0126_INDIV_INFO�����ݲ�����µ�TMP_LEG_PER_BASIC_INFO�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_BASIC_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;
    
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����LEG_PER_BASIC_INFO�����У���SRC0126_CORP_INFO��SRC0126_INDIV_INFO����Ҫ�޸ĵ���Ч�汾Ϊ��Ч'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
     update leg_per_basic_info s 
        set s.latestversion=0
      where s.latestversion=1
        and s.reg_num in(select t.reg_num from tmp_leg_per_basic_info t);
     
     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����LEG_PER_BASIC_INFO�İ汾���ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��TMP_LEG_PER_BASIC_INFO�����ݲ��뵽LEG_PER_BASIC_INFO����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
        
     insert into leg_per_basic_info select * from tmp_leg_per_basic_info;
     
     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����LEG_PER_BASIC_INFO������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ���TMP_LEG_PER_BASIC_INFO�������'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_BASIC_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
     delete from tmp_leg_per_basic_info;
     
     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '���TMP_LEG_PER_BASIC_INFO����������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_BASIC_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;
   
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����sys_md_apply_cfg���е�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
     /*���sys_md_apply_cfg�������leg_per_basic_info������Ҫ���*/
     merge into sys_md_apply_cfg b
          using(select sys_guid() next_cfgid from dual)s
             on(b.tablename=v_tab_name)
     when not matched then
          insert (cfg_id,
                  tablename
                  )
          values (
                 s.next_cfgid,
                 v_tab_name
                 );
     v_effect_rows := sql%rowcount; --��ЧӰ������
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����sys_md_apply_cfg���е����ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����sys_md_select_cfg���е�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
     /*���������ݼ�������ѡ��������*/
     merge into sys_md_select_cfg c
           using(select sys_guid() next_cfgid from dual)s
              on(c.tab_en_nm=v_tab_name and c.attri_en_nm='PATCH_CODE' and c.value=v_patch)
      when not matched then
           insert (
                   select_id,
                   tab_en_nm,
                   attri_en_nm,
                   value
                  )
           values (
                   s.next_cfgid,
                   v_tab_name,
                   'PATCH_CODE',
                   v_patch
                  );
     v_effect_rows := sql%rowcount; --��ЧӰ������
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����sys_md_select_cfg���е����ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��              
  /*************************��������***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '����ִ�����'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********�쳣����Ҳ������������Ҫ�����쳣���Ƶĵط������쳣����*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into LEG_PER_BASIC_INFO fail: ' || substr(sqlerrm, 1, 300); --�쳣��־��Ϣ
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_LEG_PER_CONTACT_INFO
prompt ===========================================
prompt
create or replace procedure prc_leg_per_contact_info ---������ϵ��Ϣ
(
    iv_date    in varchar2  -- ����ͳ�����ڣ���ʽ��yyyymmdd
)
/***************************************************************************************************
  * Ŀ���LEG_PER_CONTACT_INFO(������ϵ��Ϣ)
  * Դ��SRC0126_CORP_INFO(���ʱ�)
          SRC0126_INDIV_INFO(�����)


  * ��ʽ��     ����
  * ����Ƶ�ȣ� ����
  * ������˵��: ���ط�����ϵ��Ϣ������
  * ��������� iv_date    �������ڣ���ʽ��yyyymmdd
  * ��������� ��
  * ���ߣ�        ����
  * �������ڣ�    2017-3-1
  *
  * �޸ļ�¼
  **************************************************************************************************
  * �޸���                  �޸�����          �޸�����
    ����                   2017-5-22          �ɵ����ݰ汾��Ϊ������汾���µ����ݲ��뵽�����ݱ���
  *************************************************************************************************/
is
   v_proc_name   varchar2(100) := 'PRC_LEG_PER_CONTACT_INFO'; --�洢������
   v_tab_name    varchar2(32) := 'LEG_PER_CONTACT_INFO'; --Ŀ�����
   v_step_name   varchar2(200) := '���ط�����ϵ��Ϣ������'; --��������
   v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --����ʱ��
   v_error_flag  varchar2(4) := '0'; --�����־��0��������1������
   v_log_mess    varchar2(300) := 'merge into LEG_PER_CONTACT_INFO normal'; --��־��Ϣ
   v_effect_rows number := 0; --��ЧӰ������
   v_proc_id     number := seq_proc_log.nextval; --�洢���̵�ID��
   v_sortid      number;
   v_patch       varchar(255);
begin
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '����ʼִ��'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   
   select nvl(max(sort_id),0)+1 into v_sortid from leg_per_contact_info ;--��ȡleg_per_contact_info�������������
   
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ���TMP_LEG_PER_CONTACT_INFO�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_CONTACT_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
   delete from tmp_leg_per_contact_info;
   delete from tmp_leg_per_contact_info_bak;
     
   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '���TMP_LEG_PER_CONTACT_INFO����������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_CONTACT_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;
   
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ����LEG_PER_CONTACT_INFO��ִ��ʱ�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
   insert into tmp_leg_per_contact_info_bak select * from leg_per_contact_info where latestversion=1 and description ='���ô洢����';
   
      /*�ֹ�ִ��*/
   --delete from leg_per_contact_info 
   --where modified_date >= to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd') 
   -- and modified_date< to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd') + 1
   -- and description ='���ô洢����';
    --commit;
    
    /*��ԭ����*/
    --insert into leg_per_contact_info select * from tmp_leg_per_contact_info_bak;
    --commit;
    
   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '����LEG_PER_CONTACT_INFO��ִ��ʱ������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;
   
    /*���ҳ������ݱ������µ�����*/
    select t.patch_code
      into v_patch
      from patch_config t
      where t.patch_status=1
        and t.tar_tab_enname='LEG_PER_CONTACT_INFO';
   
    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '��ʼ��ȡSRC0126_CORP_INFO�����ݲ�����µ�TMP_LEG_PER_CONTACT_INFO����'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_CONTACT_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   
  /*�������ʱ�����ݵ�������ϵ��Ϣ����*/ 
     insert into tmp_leg_per_contact_info
      select t1.reg_num,
             t1.postcode,
             t1.operator_tel,
             '',
             '',
             t1.liaison,
             t1.liaison_tel,
             '',
             'SRC0126_CORP_INFO',        ----0�������ʱ�
             t1.time,
             v_sortid ,
             '���ô洢����',
             '',
             '',
             sysdate,
             '',
             '',
             sysdate,
             1,
             a.max_version+1,
             1,
             0,
             '',
             v_patch
       from src0126_corp_info t1,
            (select reg_num,patch_code,max(version) max_version from leg_per_contact_info group by reg_num,patch_code) a
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and a.reg_num=t1.reg_num
        and a.patch_code=v_patch
      union all
      select t1.reg_num,
             t1.postcode,
             t1.operator_tel,
             '',
             '',
             t1.liaison,
             t1.liaison_tel,
             '',
             'SRC0126_CORP_INFO',        ----0�������ʱ�
             t1.time,
             v_sortid ,
             '���ô洢����',
             '',
             '',
             sysdate,
             '',
             '',
             sysdate,
             1,
             1,
             1,
             0,
             '',
             v_patch
       from src0126_corp_info t1,
            (select reg_num,patch_code,max(version) max_version from leg_per_contact_info group by reg_num,patch_code) a
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and a.reg_num=t1.reg_num
        and v_patch not in (select distinct patch_code from leg_per_contact_info)
     union all
      select t1.reg_num,
             t1.postcode,
             t1.operator_tel,
             '',
             '',
             t1.liaison,
             t1.liaison_tel,
             '',
             'SRC0126_CORP_INFO',        --0�������ʱ�
             t1.time,
             v_sortid ,
             '���ô洢����',
             '',
             '',
             sysdate,
             '',
             '',
             sysdate,
             1,
             1,
             1,
             0,
             '',
             v_patch
       from src0126_corp_info t1
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and t1.reg_num not in (select s.reg_num from leg_per_contact_info s );
        
    v_effect_rows := sql%rowcount; --��ЧӰ������
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '��ȡSRC0126_CORP_INFO�����ݲ�����µ�TMP_LEG_PER_CONTACT_INFO�����'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_CONTACT_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    commit;
    
    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '��ʼ��ȡSRC0126_INDIV_INFO�����ݲ�����µ�TMP_LEG_PER_CONTACT_INFO����'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_CONTACT_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

   /*������������ݵ�������ϵ��Ϣ����*/
     insert into tmp_leg_per_contact_info
      select t1.reg_num,
             '',
             t1.operator_tel,
             '',
             '',
             t1.liaison,
             t1.liaison_tel,
             '',
             'SRC0126_INDIV_INFO',        --1��������
             t1.time,
             v_sortid ,
             '���ô洢����',
             '',
             '',
             sysdate,
             '',
             '',
             sysdate,
             1,
             a.max_version+1,
             1,
             0,
             '',
             v_patch
       from src0126_indiv_info t1,
            (select reg_num,patch_code,max(version) max_version from leg_per_contact_info group by reg_num,patch_code) a
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and a.reg_num=t1.reg_num
        and a.patch_code=v_patch
     union all
      select t1.reg_num,
             '',
             t1.operator_tel,
             '',
             '',
             t1.liaison,
             t1.liaison_tel,
             '',
             'SRC0126_INDIV_INFO',        --1��������
             t1.time,
             v_sortid ,
             '���ô洢����',
             '',
             '',
             sysdate,
             '',
             '',
             sysdate,
             1,
             1,
             1,
             0,
             '',
             v_patch
       from src0126_indiv_info t1,
            (select reg_num,patch_code,max(version) max_version from leg_per_contact_info group by reg_num,patch_code) a
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and a.reg_num=t1.reg_num
        and v_patch not in (select distinct patch_code  from leg_per_contact_info)
     union all
      select  t1.reg_num,
             '',
             t1.operator_tel,
             '',
             '',
             t1.liaison,
             t1.liaison_tel,
             '',
             'SRC0126_INDIV_INFO',        --1��������
             t1.time,
             v_sortid ,
             '���ô洢����',
             '',
             '',
             sysdate,
             '',
             '',
             sysdate,
             1,
             1,
             1,
             0,
             '',
             v_patch
       from src0126_indiv_info t1
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and t1.reg_num not in (select s.reg_num from leg_per_contact_info s );
     
     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ȡSRC0126_INDIV_INFO�����ݲ�����µ�TMP_LEG_PER_CONTACT_INFO�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_CONTACT_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    commit;
    
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����leg_per_contact_info���У���SRC0126_CORP_INFO��SRC0126_INDIV_INFO��Ҫ�޸ĵ���Ч�汾Ϊ��Ч'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
     update leg_per_contact_info s 
        set s.latestversion=0
      where s.latestversion=1
        and s.reg_num in(select t.reg_num from tmp_leg_per_contact_info t);
     
     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����LEG_PER_CONTACT_INFO�İ汾���ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��TMP_LEG_PER_CONTACT_INFO�����ݲ��뵽LEG_PER_CONTACT_INFO����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
        
     insert into leg_per_contact_info select * from tmp_leg_per_contact_info;
     
     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����LEG_PER_CONTACT_INFO������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ���TMP_LEG_PER_CONTACT_INFO�������'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_CONTACT_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
     delete from tmp_leg_per_contact_info;
     
     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '���TMP_LEG_PER_CONTACT_INFO����������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_CONTACT_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;
    
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����sys_md_apply_cfg���е�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
     /*���sys_md_apply_cfg�������leg_per_contact_info������Ҫ���*/
     merge into sys_md_apply_cfg b
          using(select sys_guid() next_cfgid from dual)s
             on(b.tablename=v_tab_name)
     when not matched then
          insert (cfg_id,
                  tablename
                  )
          values (
                 s.next_cfgid,
                 v_tab_name
                 );
     v_effect_rows := sql%rowcount; --��ЧӰ������
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����sys_md_apply_cfg���е����ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����sys_md_select_cfg���е�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
     /*���������ݼ�������ѡ��������*/
     merge into sys_md_select_cfg c
           using(select sys_guid() next_cfgid from dual)s
              on(c.tab_en_nm=v_tab_name and c.attri_en_nm='PATCH_CODE' and c.value=v_patch)
      when not matched then
           insert (
                   select_id,
                   tab_en_nm,
                   attri_en_nm,
                   value
                  )
           values (
                   s.next_cfgid,
                   v_tab_name,
                   'PATCH_CODE',
                   v_patch
                  );
     v_effect_rows := sql%rowcount; --��ЧӰ������
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����sys_md_select_cfg���е����ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��   
  /*************************��������***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '����ִ�����'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********�쳣����Ҳ������������Ҫ�����쳣���Ƶĵط������쳣����*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into LEG_PER_CONTACT_INFO fail: ' || substr(sqlerrm, 1, 300); --�쳣��־��Ϣ
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_LEG_PER_REG_INFO
prompt =======================================
prompt
create or replace procedure prc_leg_per_reg_info ---����ע���Ǽ���Ϣ��
(
    iv_date    in varchar2  -- ����ͳ�����ڣ���ʽ��yyyymmdd
)
is
/**************************************************************************************************
  * Ŀ���LEG_PER_REG_INFO(����ע���Ǽ���Ϣ��)
  * Դ��SRC0126_CORP_INFO(���ʱ�)
          SRC0126_INDIV_INFO(�����)

  * ��ʽ��     ����
  * ����Ƶ�ȣ� ����
  * ������˵��: ���ط���ע���Ǽ���Ϣ������
  * ��������� iv_date    �������ڣ���ʽ��yyyymmdd
  * ��������� ��
  * ���ߣ�        ����
  * �������ڣ�    2017-2-27
  *
  * �޸ļ�¼
  **************************************************************************************************
  * �޸���                  �޸�����          �޸�����
    ����                   2017-5-22          �ɵ����ݰ汾��Ϊ������汾���µ����ݲ��뵽�����ݱ���
  *************************************************************************************************/
  v_proc_name   varchar2(32) := 'PRC_LEG_PER_REG_INFO'; --�洢������
  v_tab_name    varchar2(32) := 'LEG_PER_REG_INFO'; --Ŀ�����
  v_step_name   varchar2(100) := '���ط���ע���Ǽ���Ϣ������'; --��������
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --����ʱ��
  v_error_flag  varchar2(4) := '0'; --�����־��0��������1������
  v_log_mess    varchar2(300) := 'merge into LEG_PER_REG_INFO normal'; --��־��Ϣ
  v_effect_rows number := 0; --��ЧӰ������
  v_proc_id     number := seq_proc_log.nextval; --�洢���̵�ID��
  v_sortid      number;
  v_patch       varchar(255);

begin
  
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '����ʼִ��'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    
  select nvl(max(sort_id),0)+1 into v_sortid from leg_per_reg_info ;--��ȡleg_per_reg_info�������������
  
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ���TMP_LEG_PER_REG_INFO�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_REG_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
   delete from tmp_leg_per_reg_info;
   delete from tmp_leg_per_reg_info_bak;
     
   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '���TMP_LEG_PER_REG_INFO����������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_REG_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ����LEG_PER_REG_INFO��ִ��ʱ�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   
    insert into tmp_leg_per_reg_info_bak select * from leg_per_reg_info where latestversion=1 and description ='���ô洢����';
     
   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '����LEG_PER_REG_INFO��ִ��ʱ������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;
   
    /*�ֹ�ִ��*/
   --delete from leg_per_reg_info 
   --where modified_date >= to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd') 
   -- and modified_date< to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd') + 1
   -- and description ='���ô洢����';
   --commit;
    
    /*��ԭ����*/
    --insert into leg_per_reg_info select * from tmp_leg_per_reg_info_bak;
    --commit;

    /*���ҳ������ݱ������µ�����*/
    select t.patch_code
      into v_patch
      from patch_config t
      where t.patch_status=1
        and t.tar_tab_enname='LEG_PER_REG_INFO';
   
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '��ʼ��ȡSRC0126_CORP_INFO�����ݲ�����µ�TMP_LEG_PER_REG_INFO����'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_REG_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

    /*�������ʱ�����ݵ�����ע���Ǽ���Ϣ����*/
     insert into tmp_leg_per_reg_info    
      select t1.reg_num,
             t1.mer_name,
             t2.idt_ctgr_code,
             t1.idt_ctgr,
             t1.trade_type,
             t1.trade_code,
             t1.bus_scope,
             '',
             '',
             '',
             t1.reg_capital,
             t1.paid_capital,
             '',
             t1.etp_ctg,
             t1.etp_type,
             t1.bus_term,
             '',
             '',
             '',
             t1.county_code,
             'SRC0126_CORP_INFO',        --0�������ʱ�
             t1.time,
             v_sortid ,
             '���ô洢����',
             '',
             '',
             sysdate,
             '',
             '',
             sysdate,
             1,
             a.max_version+1,
             1,
             0,
             '',
             v_patch
       from src0126_corp_info t1,
            dim_idt_ctgr t2,
            (select reg_num,patch_code,max(version) max_version from leg_per_reg_info group by reg_num,patch_code) a
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and a.reg_num=t1.reg_num
        and  nvl(t1.idt_ctgr,'δ֪'��=t2.idt_ctgr_name
        and  a.patch_code=v_patch
     union all
      select t1.reg_num,
             t1.mer_name,
             t2.idt_ctgr_code,
             t1.idt_ctgr,
             t1.trade_type,
             t1.trade_code,
             t1.bus_scope,
             '',
             '',
             '',
             t1.reg_capital,
             t1.paid_capital,
             '',
             t1.etp_ctg,
             t1.etp_type,
             t1.bus_term,
             '',
             '',
             '',
             t1.county_code,
             'SRC0126_CORP_INFO',        --0�������ʱ�
             t1.time,
             v_sortid ,
             '���ô洢����',
             '',
             '',
             sysdate,
             '',
             '',
             sysdate,
             1,
             1,
             1,
             0,
             '',
             v_patch
       from src0126_corp_info t1,
            dim_idt_ctgr t2,
            (select reg_num,patch_code,max(version) max_version from leg_per_reg_info group by reg_num,patch_code) a
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and a.reg_num=t1.reg_num
        and  nvl(t1.idt_ctgr,'δ֪'��=t2.idt_ctgr_name
        and  v_patch not in (select distinct patch_code  from leg_per_reg_info)
     union all
      select t1.reg_num,
             t1.mer_name,
             t2.idt_ctgr_code,
             t1.idt_ctgr,
             t1.trade_type,
             t1.trade_code,
             t1.bus_scope,
             '',
             '',
             '',
             t1.reg_capital,
             t1.paid_capital,
             '',
             t1.etp_ctg,
             t1.etp_type,
             t1.bus_term,
             '',
             '',
             '',
             t1.county_code,
             'SRC0126_CORP_INFO',        --0�������ʱ�
             t1.time,
             v_sortid ,
             '���ô洢����',
             '',
             '',
             sysdate,
             '',
             '',
             sysdate,
             1,
             1,
             1,
             0,
             '',
             v_patch
       from src0126_corp_info t1,
            dim_idt_ctgr t2
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and nvl(t1.idt_ctgr,'δ֪'��=t2.idt_ctgr_name ---ƥ����ҵ����ά���е���ҵ��������
        and t1.reg_num not in (select s.reg_num from leg_per_reg_info s );
        
    v_effect_rows := sql%rowcount; --��ЧӰ������
    commit;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '��ȡSRC0126_CORP_INFO�����ݲ�����µ�TMP_LEG_PER_REG_INFO�����'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_REG_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    
    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '��ʼ��ȡSRC0126_INDIV_INFO�����ݲ�����µ�TMP_LEG_PER_REG_INFO����'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_REG_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    
   /*������������ݵ�����ע���Ǽ���Ϣ����*/ 
     insert into tmp_leg_per_reg_info(reg_num,reg_org_name,idt_ctgr_code,idt_ctgr,trade_type,trade_code,bus_scope,reg_capital,country_code,src_entity,time_stamp,sort_id,description,create_date,modified_date,version_status,version,latestversion,approvalstae,patch_code)
      select t1.reg_num,
             t1.mer_name,
             t2.idt_ctgr_code,
             t1.idt_ctgr,
             t1.trade_type,
             t1.trade_code,
             t1.bus_scope,
             t1.money,
             t1.county_code,
             'SRC0126_INDIV_INFO',        --1��������
             t1.time,
             v_sortid ,
             '���ô洢����',
             sysdate,
             sysdate,
             1,
             a.max_version+1,
             1,
             0,
             v_patch
       from src0126_indiv_info t1,
            dim_idt_ctgr t2,
            (select reg_num,patch_code,max(version) max_version from leg_per_reg_info group by reg_num,patch_code) a
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and nvl(t1.idt_ctgr,'δ֪'��=t2.idt_ctgr_name ---ƥ����ҵ����ά���е���ҵ��������
        and a.reg_num=t1.reg_num
        and a.patch_code=v_patch
     union all
      select t1.reg_num,
             t1.mer_name,
             t2.idt_ctgr_code,
             t1.idt_ctgr,
             t1.trade_type,
             t1.trade_code,
             t1.bus_scope,
             t1.money,
             t1.county_code,
             'SRC0126_INDIV_INFO',        --1��������
             t1.time,
             v_sortid ,
             '���ô洢����',
             sysdate,
             sysdate,
             1,
             1,
             1,
             0,
             v_patch
       from src0126_indiv_info t1,
            dim_idt_ctgr t2,
            (select reg_num,patch_code,max(version) max_version from leg_per_reg_info group by reg_num,patch_code) a
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and nvl(t1.idt_ctgr,'δ֪'��=t2.idt_ctgr_name ---ƥ����ҵ����ά���е���ҵ��������
        and a.reg_num=t1.reg_num
        and v_patch not in (select distinct patch_code  from leg_per_reg_info)
     union all
      select t1.reg_num,
             t1.mer_name,
             t2.idt_ctgr_code,
             t1.idt_ctgr,
             t1.trade_type,
             t1.trade_code,
             t1.bus_scope,
             t1.money,
             t1.county_code,
             'SRC0126_INDIV_INFO',        --1��������
             t1.time,
             v_sortid ,
             '���ô洢����',
             sysdate,
             sysdate,
             1,
             1,
             1,
             0,
             v_patch
       from src0126_indiv_info t1,
            dim_idt_ctgr t2
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and nvl(t1.idt_ctgr,'δ֪'��=t2.idt_ctgr_name ---ƥ��Ǽ���������
        and t1.reg_num not in (select s.reg_num from leg_per_reg_info s );
                 
     v_effect_rows := sql%rowcount; --��ЧӰ������
    commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ȡSRC0126_INDIV_INFO�����ݲ�����µ�TMP_LEG_PER_REG_INFO�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_REG_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����LEG_PER_REG_INFO�����У���SRC0126_CORP_INFO��SRC0126_INDIV_INFO����Ҫ�޸ĵ���Ч�汾Ϊ��Ч'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
     update leg_per_reg_info s 
        set s.latestversion=0
      where s.latestversion=1
        and s.reg_num in(select t.reg_num from tmp_leg_per_reg_info t);
     
     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����LEG_PER_REG_INFO�İ汾���ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��TMP_LEG_PER_REG_INFO�����ݲ��뵽LEG_PER_REG_INFO����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
        
     insert into leg_per_reg_info select * from tmp_leg_per_reg_info;
     
     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����LEG_PER_REG_INFO������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ���TMP_LEG_PER_REG_INFO�������'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_REG_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
      delete from tmp_leg_per_reg_info;
     
     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '���TMP_LEG_PER_REG_INFO����������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_REG_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;
    
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����sys_md_apply_cfg���е�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     /*���sys_md_apply_cfg�������pop_basic_info������Ҫ���*/
     merge into sys_md_apply_cfg b
          using(select sys_guid() next_cfgid from dual)s
             on(b.tablename=v_tab_name)
     when not matched then
          insert (cfg_id,
                  tablename
                  )
          values (
                 s.next_cfgid,
                 v_tab_name
                 );
     v_effect_rows := sql%rowcount; --��ЧӰ������
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����sys_md_apply_cfg���е����ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����sys_md_select_cfg���е�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
     /*���������ݼ�������ѡ��������*/
     merge into sys_md_select_cfg c
           using(select sys_guid() next_cfgid from dual)s
              on(c.tab_en_nm=v_tab_name and c.attri_en_nm='PATCH_CODE' and c.value=v_patch)
      when not matched then
           insert (
                   select_id,
                   tab_en_nm,
                   attri_en_nm,
                   value
                  )
           values (
                   s.next_cfgid,
                   v_tab_name,
                   'PATCH_CODE',
                   v_patch
                  );
     v_effect_rows := sql%rowcount; --��ЧӰ������
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����sys_md_select_cfg���е����ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��   
  /*************************��������***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '����ִ�����'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********�쳣����Ҳ������������Ҫ�����쳣���Ƶĵط������쳣����*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into LEG_PER_REG_INFO fail: ' || substr(sqlerrm, 1, 300); --�쳣��־��Ϣ
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_LEG_PER_TAX_INFO
prompt =======================================
prompt
create or replace procedure prc_leg_per_tax_info ---˰����Ϣ
(
    iv_date    in varchar2  -- ����ͳ�����ڣ���ʽ��yyyymmdd
)
is
/**************************************************************************************************
  * Ŀ���LEG_PER_TAX_INFO(˰����Ϣ)
  * Դ��SRC0128_LANDTAX_BUS
  * ��ʽ��     ����
  * ����Ƶ�ȣ� ����
  * ������˵��: ���ط���˰����Ϣ������
  * ��������� iv_date    �������ڣ���ʽ��yyyymmdd
  * ��������� ��
  * ���ߣ�        ����
  * �������ڣ�    2017-3-1
  *
  * �޸ļ�¼
  **************************************************************************************************
  * �޸���                  �޸�����          �޸�����
    ����                   2017-5-23          �ɵ����ݰ汾��Ϊ������汾���µ����ݲ��뵽�����ݱ���
  *************************************************************************************************/
  v_proc_name   varchar2(32) := 'PRC_LEG_PER_TAX_INFO'; --�洢������
  v_tab_name    varchar2(32) := 'LEG_PER_TAX_INFO';
  v_step_name   varchar2(100) := '���ط���˰����Ϣ������'; --��������
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --����ʱ��
  v_error_flag  varchar2(4) := '0'; --�����־��0��������1������
  v_log_mess    varchar2(300) := 'merge into LEG_PER_TAX_INFO normal'; --��־��Ϣ
  v_effect_rows number := 0; --��ЧӰ������
  v_proc_id     number := seq_proc_log.nextval; --�洢���̵�ID��
  v_sortid      number;
  v_patch       varchar(255);
begin
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '����ʼִ��'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

   select nvl(max(sort_id),0)+1 into v_sortid from leg_per_tax_info ;--��ȡleg_per_tax_info�������������

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ���TMP_LEG_PER_TAX_INFO�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_TAX_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

   delete from tmp_leg_per_tax_info;
   delete from tmp_leg_per_tax_info_bak;

   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '���TMP_LEG_PER_TAX_INFO����������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_TAX_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;
   
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ����LEG_PER_TAX_INFO��ִ��ʱ�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   
   insert into tmp_leg_per_tax_info_bak select * from leg_per_tax_info where latestversion=1 and description ='���ô洢����';

     
   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '����LEG_PER_TAX_INFO��ִ��ʱ������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;
   
    /*�ֹ�ִ��*/
   --delete from leg_per_basic_info 
    --where modified_date >= to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd') 
   -- and modified_date< to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd') + 1
   -- and description ='���ô洢����';
    --commit;
    
    /*��ԭ����*/
    --insert into leg_per_basic_info select * from tmp_leg_per_basic_info_bak;
    --commit;
    
   /*���ҳ������ݱ������µ�����*/
    select t.patch_code
      into v_patch
      from patch_config t
      where t.patch_status=1
        and t.tar_tab_enname='LEG_PER_TAX_INFO';
     
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ��ȡSRC0128_LANDTAX_BUS�����ݲ�����µ�TMP_LEG_PER_TAX_INFO����'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_TAX_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

   /*�����˰������ݵ�˰����Ϣ��*/
     insert into tmp_leg_per_tax_info
      select t1.soc_cre_code,--��˰��ʶ���
             t1.com_tax_aut,--˰��Ǽǻ�������
             '',
             '',
             '',
             '',
             t1.time,
             v_sortid ,
             '���ô洢����',
             '',
             '',
             sysdate,
             '',
             '',
             sysdate,
             1,
             a.max_version+1,
             1,
             0,
             '',
             v_patch
       from src0128_landtax_bus t1,
            (select usc_code,patch_code,max(version) max_version from leg_per_tax_info group by usc_code,patch_code) a
      where t1.time >= to_date(iv_date , 'yyyymmdd')         ---������ȡ
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and a.usc_code=t1.soc_cre_code
        and a.patch_code=v_patch
     union all
      select t1.soc_cre_code,--��˰��ʶ���
             t1.com_tax_aut,--˰��Ǽǻ�������
             '',
             '',
             '',
             '',
             t1.time,
             v_sortid ,
             '���ô洢����',
             '',
             '',
             sysdate,
             '',
             '',
             sysdate,
             1,
             1,
             1,
             0,
             '',
             v_patch
       from src0128_landtax_bus t1,
            (select usc_code,patch_code,max(version) max_version from leg_per_tax_info group by usc_code,patch_code) a
      where t1.time >= to_date(iv_date , 'yyyymmdd')         ---������ȡ
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and a.usc_code=t1.soc_cre_code
        and v_patch not in (select distinct patch_code  from leg_per_tax_info)
     union all
      select t1.soc_cre_code,--��˰��ʶ���
             t1.com_tax_aut,--˰��Ǽǻ�������
             '',
             '',
             '',
             '',
             t1.time,
             v_sortid ,
             '���ô洢����',
             '',
             '',
             sysdate,
             '',
             '',
             sysdate,
             1,
             1,
             1,
             0,
             '',
             v_patch
       from src0128_landtax_bus t1
      where t1.time >= to_date(iv_date , 'yyyymmdd')         ---������ȡ
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and t1.soc_cre_code not in (select s.usc_code from leg_per_tax_info s );

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ȡSRC0128_LANDTAX_BUS�����ݲ�����µ�TMP_LEG_PER_TAX_INFO�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_TAX_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����LEG_PER_TAX_INFO���У���SRC0128_LANDTAX_BUS��Ҫ�޸ĵ���Ч�汾Ϊ��Ч'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     update leg_per_tax_info s
        set s.latestversion=0
      where s.latestversion=1
        and s.usc_code in(select t.usc_code from tmp_leg_per_tax_info t);

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����LEG_PER_TAX_INFO�İ汾���ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��TMP_LEG_PER_TAX_INFO�����ݲ��뵽LEG_PER_TAX_INFO����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     insert into leg_per_tax_info select * from tmp_leg_per_tax_info;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����LEG_PER_TAX_INFO������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ���TMP_LEG_PER_TAX_INFO�������'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_TAX_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     delete from tmp_leg_per_tax_info;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '���TMP_LEG_PER_TAX_INFO����������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_TAX_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����sys_md_apply_cfg���е�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     /*���sys_md_apply_cfg�������pop_basic_info������Ҫ���*/
     merge into sys_md_apply_cfg b
          using(select sys_guid() next_cfgid from dual)s
             on(b.tablename=v_tab_name)
     when not matched then
          insert (cfg_id,
                  tablename
                  )
          values (
                 s.next_cfgid,
                 v_tab_name
                 );
     v_effect_rows := sql%rowcount; --��ЧӰ������
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����sys_md_apply_cfg���е����ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����sys_md_select_cfg���е�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
     /*���������ݼ�������ѡ��������*/
     merge into sys_md_select_cfg c
           using(select sys_guid() next_cfgid from dual)s
              on(c.tab_en_nm=v_tab_name and c.attri_en_nm='PATCH_CODE' and c.value=v_patch)
      when not matched then
           insert (
                   select_id,
                   tab_en_nm,
                   attri_en_nm,
                   value
                  )
           values (
                   s.next_cfgid,
                   v_tab_name,
                   'PATCH_CODE',
                   v_patch
                  );
     v_effect_rows := sql%rowcount; --��ЧӰ������
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����sys_md_select_cfg���е����ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��   
  /*************************��������***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '����ִ�����'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********�쳣����Ҳ������������Ҫ�����쳣���Ƶĵط������쳣����*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into LEG_PER_TAX_INFO fail: ' || substr(sqlerrm, 1, 300); --�쳣��־��Ϣ
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_MAC_ECO_INDEX
prompt ====================================
prompt
create or replace procedure prc_mac_eco_index ---��۾���ָ���ۺϱ�
(
    iv_date    in varchar2  -- ����ͳ�����ڣ���ʽ��yyyymmdd
)
is
/*************************************************************************************************
  * Ŀ���MAC_ECO_INDEX(��۾���ָ���ۺϱ�)
  * Դ��SRC0108_SOCECO_INDI_Q
  * ��ʽ��     ����
  * ����Ƶ�ȣ� ����
  * ������˵��: ���غ�۾���ָ���ۺϱ�����
  * ��������� iv_date    �������ڣ���ʽ��yyyymmdd
  * ��������� ��
  * ���ߣ�        ����
  * �������ڣ�    2017-3-1
  *
  * �޸ļ�¼
  *************************************************************************************************
  * �޸���                  �޸�����          �޸�����
     ����                   2017-3-13         �޸�index_month��cur_month_val��4���ֶ�����
     ����                   2017-5-22         �ɵ����ݰ汾��Ϊ������汾���µ����ݲ��뵽�����ݱ���
  *************************************************************************************************/
  v_proc_name   varchar2(32) := 'PRC_MAC_ECO_INDEX'; --�洢������
  v_tab_name    varchar2(32) := 'MAC_ECO_INDEX';
  v_step_name   varchar2(200):= '���غ�۾���ָ���ۺϱ�����'; --��������
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --����ʱ��
  v_error_flag  varchar2(4)  := '0'; --�����־��0��������1������
  v_log_mess    varchar2(300) := 'merge into MAC_ECO_INDEX normal'; --��־��Ϣ
  v_effect_rows number := 0; --��ЧӰ������
  v_proc_id     number := seq_proc_log.nextval; --�洢���̵�ID��
  v_sortid      number;
  v_patch       varchar(255);
begin
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '����ʼִ��'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

   select max(nvl(sort_id,0))+1 into v_sortid from mac_eco_index ;--��ȡmac_eco_index�������������
   
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ���TMP_MAC_ECO_INDEX�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
   delete from tmp_mac_eco_index;
   delete from tmp_mac_eco_index_bak;
    
   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '���TMP_MAC_ECO_INDEX����������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;
   

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ����MAC_ECO_INDEX��ִ��ʱ�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   
   insert into tmp_mac_eco_index_bak select * from mac_eco_index where latestversion=1 and description ='���ô洢����';
     
   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '����MAC_ECO_INDEX��ִ��ʱ������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;
   
      /*�ֹ�ִ��*/
   --delete from mac_eco_index 
    --where modified_date >= to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd') 
   -- and modified_date< to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd') + 1
   -- and description ='���ô洢����';
    --commit;
    
    /*��ԭ����*/
    --insert into mac_eco_index select * from tmp_mac_eco_index_bak;
    --commit;
        
    /*���ҳ������ݱ������µ�����*/
    select t.patch_code
      into v_patch
      from patch_config t
      where t.patch_status=1
        and t.tar_tab_enname='MAC_ECO_INDEX';
    
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ��ȡSRC0108_SOCECO_INDI_Q�����ݲ�����µ�TMP_MAC_ECO_INDEX����'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_MAC_ECO_INDEX', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  
  /*�����۾���ָ���ۺϱ���ʱ�������*/
    insert into tmp_mac_eco_index
     select t1.code||substr(t1.input_date,1,4)||substr(t1.input_date,6,2) index_month,  --Դ�����ᾭ��ָ���ۺϱ���+����
            t1.code,
            t2.index_name,
            t1.unit,
            t1.cur_month_val,
            t1.cur_year_val,
            t1.last_year_val,
            t1.yoy_growth,
            t1.dz_grow_rate,
            t1.dz_com_rate,
            t1.zz_plan_task,
            t1.zz_com_rate,
            t1.notes,
            substr(t1.input_date,1,4)||substr(t1.input_date,6,2) ym_code, --���±��루ȥ���������֣�
            t1.input_date,
            t1.time,
            v_sortid,
            '���ô洢����',
            '',
            '',
            sysdate,
            '',
            '',
            sysdate,
            1,
            a.max_version+1,
            1,
            0,
            '',
            v_patch
      from src0108_soceco_indi_q t1,
           dim_eco_index  t2,
           (select s.index_month,s.patch_code,max(s.version) max_version from mac_eco_index s group by s.index_month,s.patch_code) a
     where t1.time >= to_date(iv_date , 'yyyymmdd')
       and t1.time < to_date(iv_date , 'yyyymmdd') + 1
       and t1.code=t2.index_code  --��۾���ָ���ۺϱ���
       and t2.latestversion=1
       and t1.code||substr(t1.input_date,1,4)||substr(t1.input_date,6,2)=a.index_month
       and a.patch_code=v_patch
    union all
         select t1.code||substr(t1.input_date,1,4)||substr(t1.input_date,6,2) index_month,  --Դ�����ᾭ��ָ���ۺϱ���+����
            t1.code,
            t2.index_name,
            t1.unit,
            t1.cur_month_val,
            t1.cur_year_val,
            t1.last_year_val,
            t1.yoy_growth,
            t1.dz_grow_rate,
            t1.dz_com_rate,
            t1.zz_plan_task,
            t1.zz_com_rate,
            t1.notes,
            substr(t1.input_date,1,4)||substr(t1.input_date,6,2) ym_code, --���±��루ȥ���������֣�
            t1.input_date,
            t1.time,
            v_sortid,
            '���ô洢����',
            '',
            '',
            sysdate,
            '',
            '',
            sysdate,
            1,
            1,
            1,
            0,
            '',
            v_patch
      from src0108_soceco_indi_q t1,
           dim_eco_index  t2,
           (select s.index_month,s.patch_code,max(s.version) max_version from mac_eco_index s group by s.index_month,s.patch_code) a
     where t1.time >= to_date(iv_date , 'yyyymmdd')
       and t1.time < to_date(iv_date , 'yyyymmdd') + 1
       and t1.code=t2.index_code  --��۾���ָ���ۺϱ���
       and t2.latestversion=1
       and t1.code||substr(t1.input_date,1,4)||substr(t1.input_date,6,2)=a.index_month
       and v_patch not in (select distinct patch_code  from mac_eco_index)
    union all 
    select  t1.code||substr(t1.input_date,1,4)||substr(t1.input_date,6,2) index_month,  --Դ�����ᾭ��ָ���ۺϱ���+����
            t1.code,
            t2.index_name,
            t1.unit,
            t1.cur_month_val,
            t1.cur_year_val,
            t1.last_year_val,
            t1.yoy_growth,
            t1.dz_grow_rate,
            t1.dz_com_rate,
            t1.zz_plan_task,
            t1.zz_com_rate,
            t1.notes,
            substr(t1.input_date,1,4)||substr(t1.input_date,6,2) ym_code, --���±��루ȥ���������֣�
            t1.input_date,
            t1.time,
            v_sortid,
            '���ô洢����',
            '',
            '',
            sysdate,
            '',
            '',
            sysdate,
            1,
            1,
            1,
            0,
            '',
            v_patch
      from src0108_soceco_indi_q t1,
           dim_eco_index  t2
     where t1.time >= to_date(iv_date , 'yyyymmdd')   
       and t1.time < to_date(iv_date , 'yyyymmdd') + 1
       and t1.code=t2.index_code  --��۾���ָ���ۺϱ���
       and t2.latestversion=1
       and t1.code||substr(t1.input_date,1,4)||substr(t1.input_date,6,2) not in 
           (select s.index_month from mac_eco_index s );
     
     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ȡSRC0108_SOCECO_INDI_Q�����ݲ�����µ�TMP_MAC_ECO_INDEX�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_MAC_ECO_INDEX', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;
    
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����mac_eco_index�������У���SRC0108_SOCECO_INDI_Q����Ҫ�޸ĵ���Ч�汾����Ϊ��Ч'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
     update mac_eco_index s 
        set s.latestversion=0
      where s.latestversion=1
        and s.index_month in(select t.index_month from tmp_mac_eco_index t);
        
     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����mac_eco_index�İ汾���ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;
      
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��tmp_mac_eco_index�����ݲ��뵽mac_eco_index����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
     insert into mac_eco_index select * from tmp_mac_eco_index;
     
     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����mac_eco_index������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ���TMP_MAC_ECO_INDEX�������'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
     delete from tmp_mac_eco_index;
    
     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '���TMP_MAC_ECO_INDEX����������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '��ʼ����sys_md_apply_cfg���е�����'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    
    /*���sys_md_apply_cfg�������mac_eco_index������Ҫ���*/
    merge into sys_md_apply_cfg b
          using(select sys_guid() next_cfgid from dual)s
          on(b.tablename=v_tab_name)
    when not matched then
         insert (cfg_id,
                 tablename
                 )
         values (
                 s.next_cfgid,
                 v_tab_name
                 );
    v_effect_rows := sql%rowcount; --��ЧӰ������
    commit;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '����sys_md_apply_cfg���е����ݽ���'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����sys_md_select_cfg���е�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
     /*���������ݼ�������ѡ��������*/
     merge into sys_md_select_cfg c
           using(select sys_guid() next_cfgid from dual)s
              on(c.tab_en_nm=v_tab_name and c.attri_en_nm='PATCH_CODE' and c.value=v_patch)
      when not matched then
           insert (
                   select_id,
                   tab_en_nm,
                   attri_en_nm,
                   value
                  )
           values (
                   s.next_cfgid,
                   v_tab_name,
                   'PATCH_CODE',
                   v_patch
                  );
     v_effect_rows := sql%rowcount; --��ЧӰ������
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����sys_md_select_cfg���е����ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��       
  /*************************��������***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '����ִ�����'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********�쳣����Ҳ������������Ҫ�����쳣���Ƶĵط������쳣����*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into MAC_ECO_INDEX fail: ' || substr(sqlerrm, 1, 300); --�쳣��־��Ϣ
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_META_E_TAR_ENTI_ATTR
prompt ===========================================
prompt
create or replace procedure prc_meta_e_tar_enti_attr
is
   cursor cur_tartab is select tablename,primarykey from meta_e_tar_proccfg where tablename not in (select tar_tab_en_nm from meta_e_tar_entity);
begin
   
   for tartab_row in cur_tartab
   loop
   
  /*����META_E_TAR_ENTITY�������*/
   insert into meta_e_tar_entity(tar_entity_id,tar_tab_en_nm,tar_tab_cn_nm,tar_tab_uniqueinfo,sub_domain_name,sub_domain_id,version,versionstatus,sub_domain_code,tar_tab_datarource_code,collecttime,opreasonexp,oppsrsonnel)
   select
          sys_guid() tar_entity_id,
          a.table_name tar_tab_en_nm,
          nvl(a.comments,'��ʱΪ��') tar_tab_cn_nm,
          a.comments tar_tab_uniqueinfo,
          nvl(d.sub_domain_name,'��ʱΪ��'),
          nvl(d.sub_domain_id,'��ʱΪ��'),
          1,
          1,
          d.sub_domain_code,
          'ORACLE',
          sysdate,
          'ͨ��sql�����ε���,���ɰ汾��Ϣ[ϵͳ�Զ�]!'��
          'admin'
     from dba_tab_comments a,
          meta_e_sub_domain d
     where a.table_name = tartab_row.tablename
       and a.owner='C##_BIGDATA'
       and substr(a.table_name,1,instr(a.table_name,'_',1,2)-1) =d.sub_domain_code;

   /*��ʼ����META_E_TAR_ATTRI�������*/
   insert into meta_e_tar_attri(tar_attri_id,tar_entity_id,tar_tab_entity,tar_tab_en_nm,tar_tab_cn_nm,tar_attri_en_nm,tar_attri_cn_nm,tar_attri_typ,tar_tab_fullinfo,sub_domain_name,sub_domain_code,sub_domain_id,tar_tab_rourcesys_type,tar_attri_length,null_flag,unique_flay)
   select
         sys_guid() tar_attri_id,
         e.tar_entity_id,
         '000001',
         e.tar_tab_en_nm,
         nvl(a.comments,'��ʱΪ��'),
         c.column_name,
         nvl(c.comments,'��ʱΪ��'),
         s.data_type,
         e.tar_tab_en_nm||'_'||c.column_name||'_'||d.sub_domain_id,
         nvl(d.sub_domain_name,'��ʱΪ��'),
         d.sub_domain_code,
         nvl(d.sub_domain_id,'��ʱΪ��'),
         'ORACLE',
         case when s.data_type='VARCHAR2' then s.data_length
              else 0 end,
         decode(c.column_name,tartab_row.primarykey,'N','Y'),
         decode(c.column_name,tartab_row.primarykey,'Y','N')
   from dba_col_comments c,
        dba_tab_comments a,
        dba_tab_cols s,
        meta_e_tar_entity e,
        meta_e_sub_domain d
   where c.table_name = tartab_row.tablename
     and c.table_name = e.tar_tab_en_nm
     and a.table_name= c.table_name
     and a.owner='C##_BIGDATA'
     and s.table_name= a.table_name
     and s.column_name=c.column_name
     and substr(a.table_name,1,instr(a.table_name,'_',1,2)-1) =d.sub_domain_code;
    
   commit;
   end loop;

    /**********�쳣����Ҳ������������Ҫ�����쳣���Ƶĵط������쳣����*********/
  exception
     when others then null;
  end;
/

prompt
prompt Creating procedure PRC_ODS_SPACEUSERATE
prompt =======================================
prompt
CREATE OR REPLACE PROCEDURE PRC_ODS_SPACEUSERATE is
  V_Month number;
  V_Year  number;
  cursor cs is
    select tablespace_name, sum(bytes) AS bytes
      from dba_data_files
     group by tablespace_name;
begin
  execute immediate 'delete  TAB_DATASPACE where to_char(collecttime,''yyyy-mm'')=to_char(sysdate,''yyyy-mm'') ';
  for c in cs loop
    V_Month :=0;
    V_Year :=0;
    BEGIN
      SELECT DBSIZE
        into V_Month
        FROM TAB_DATASPACE
       WHERE TO_CHAR(COLLECTTIME, 'YYYY-MM') =
             (SELECT TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE), -1), 'YYYY-MM')
                FROM DUAL)
         AND DBNAME = c.tablespace_name;
    EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
    END ; 
   
    BEGIN
      SELECT DBSIZE
        into V_Year
        FROM TAB_DATASPACE
       WHERE TO_CHAR(COLLECTTIME, 'YYYY-MM') =
             (SELECT TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE), -12), 'YYYY-MM')
                FROM DUAL)
         AND DBNAME = c.tablespace_name;
   EXCEPTION WHEN NO_DATA_FOUND THEN NULL;
   END ; 
    
    
      insert into TAB_DATASPACE
        (dbname, dbsize, monthStep, yearhStep, collecttime)
      values
        (c.tablespace_name,
         (c.bytes) / 1024 / 1024,            --M
         ((c.bytes) / 1024 / 1024 - V_Month), 
         ((c.bytes) / 1024 / 1024 - V_Year),
         sysdate);
 --END;
  end loop;
  commit;
end PRC_ODS_SPACEUSERATE;
/

prompt
prompt Creating procedure PRC_PATCH_CONFIG
prompt ===================================
prompt
create or replace procedure prc_patch_config
(
  iv_latest_patch_code in varchar,   ---���µ����κ�
  iv_tar_tabnames       in varchar,        ---�����ݱ�
  oi_return             out integer,  ---�������ݲ���Ľ��
  oi_err_msg            out varchar2  ---���ر�����Ϣ
)

is
  v_last_patch_code varchar2(500); ---��ȡ��һ�����κ�
  iv_tar_tabname    varchar2(500); ---��ȡ�����ݱ��ĵ�����Ա
  tar_tab_cnt       number;        ---�����ݱ�ĸ���
  tar_tab_indx      number;        ---��ֺ�ڼ��������ݱ�
  tmp_tar_tabname   varchar2(500); ---�����ݱ����ʱ��
  v_sql1            varchar2(500);
  v_sql2            varchar2(500);
  v_sql3            varchar2(500);
  v_sql4            varchar2(500);
  v_sql5            varchar2(500);
  v_sql6            varchar2(500);
begin

  tar_tab_indx :=0;
  /*ͳ�ƹ�ѡ�������ݱ�ĸ���*/
  select regexp_count(iv_tar_tabnames,',')+1 into tar_tab_cnt from dual;

  loop
    tar_tab_indx := tar_tab_indx +1;

    /*��������ݱ��������������ݱ����*/
    select regexp_substr(iv_tar_tabnames, '[^,]+', 1, tar_tab_indx)
      into iv_tar_tabname
      from dual;
    
    v_sql1 :='select distinct patch_code from '||iv_tar_tabname||' where latestversion =1 ';
    execute immediate v_sql1 into v_last_patch_code;

    select 'tmp_'||iv_tar_tabname
      into tmp_tar_tabname
      from dual;
      
    v_sql6 :='delete from '|| tmp_tar_tabname;
    execute immediate v_sql6;
    commit;
    
    /*������һ�����ε����ݵ���ʱ����*/
    v_sql3 :='insert into '|| tmp_tar_tabname||' select * from '|| iv_tar_tabname ||' where patch_code = '||''''||v_last_patch_code||''''||' and latestversion=1';
    execute immediate v_sql3;

    /*���������ݱ�����һ�����ε�����Ϊ������������*/
    v_sql2 := 'update '||iv_tar_tabname||' set latestversion = 0 where patch_code = '|| ''''||v_last_patch_code||''''||'';
    execute immediate v_sql2;
    commit;

    /*������ʱ���е����κ�Ϊ���µ����κ�*/
    v_sql4 :='update '||tmp_tar_tabname||' set patch_code = '|| ''''||iv_latest_patch_code||'''' ||',version=1,latestversion=1';
    execute immediate v_sql4;
    commit;
 
    v_sql5 :='insert into '|| iv_tar_tabname||' select * from '||tmp_tar_tabname;
    execute immediate v_sql5;
    commit;
    
    merge into sys_md_select_cfg c
        using(select sys_guid() next_cfgid from dual)s
          on(c.tab_en_nm=iv_tar_tabname and c.attri_en_nm='PATCH_CODE' and c.value=iv_latest_patch_code)
    when not matched then
        insert (
                 select_id,
                 tab_en_nm,
                 attri_en_nm,
                 value
                )
        values (
                  s.next_cfgid,
                  iv_tar_tabname,
                  'PATCH_CODE',
                  iv_latest_patch_code
                );
    
    v_sql6 :='delete from '|| tmp_tar_tabname;
    execute immediate v_sql6;
    commit;
  
    exit when tar_tab_indx = tar_tab_cnt;
    end loop;

    oi_return :=0; --���ݲ���ɹ�����0

exception
  when others then
    oi_err_msg  := substr(sqlerrm, 1, 300);
    oi_return :=-1;  --���ݲ���ʧ��,����-1
 
end;
/

prompt
prompt Creating procedure PRC_POP_BASIC_INFO
prompt =====================================
prompt
create or replace procedure prc_pop_basic_info
(
    iv_date   in varchar2---����ͳ�����ڣ���ʽ��yyyymmdd
)
is
/*************************************************************************************************
  * Ŀ���POP_BASIC_INFO(�˿ڻ�����Ϣ)
  * Դ��SRC0117_POP_BAISHA(��ɳ�˿���Ϣ)
          SRC0117_POP_DAJING(���˿���Ϣ)
          SRC0117_POP_DIANDI(����˿���Ϣ)
          SRC0117_POP_LINGBO(�貨�˿���Ϣ)
          SRC0117_POP_SHIKENG(ʯ���˿���Ϣ)
          SRC0117_POP_RECTIFICATION(������Ա��Ϣ)
          SRC0117_POP_SEV_MEN_PAT(��֢��������Ϣ��)
          SRC0117_POP_CULT(а����Ա��Ϣ��)

  * ��ʽ��     ����
  * ����Ƶ�ȣ� ����
  * ������˵��: �����˿ڻ�����Ϣ������
  * ��������� iv_date    �������ڣ���ʽ��yyyymmdd

  * ��������� ��
  * ���ߣ�        ����
  * �������ڣ�    2017-2-27
  *
  * �޸ļ�¼
  ************************************************************************************************
  * �޸���                  �޸�����          �޸�����
    ����                   2017-5-19          �ɵ����ݰ汾��Ϊ������汾���µ����ݲ��뵽�����ݱ���
  *************************************************************************************************/
  v_proc_name   varchar2(32) := 'PRC_POP_BASIC_INFO'; --�洢������
  v_tab_name    varchar2(32) := 'POP_BASIC_INFO';--Ŀ�����
  v_step_name   varchar2(100):= '�����˿ڻ�����Ϣ������'; --��������
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --����ʱ��
  v_error_flag  varchar2(4)  := '0'; --�����־��0��������1������
  v_log_mess    varchar2(300) := 'merge into POP_BASIC_INFO normal'; --��־��Ϣ
  v_effect_rows number := 0; --��ЧӰ������
  v_proc_id     number := seq_proc_log.nextval; --�洢���̵�ID��
  src_tabnames  varchar2(1000); /*Դ������*/
  src_tabname   varchar2(1000); /*Դ����*/
  ele_indx      number; /*�ڼ���Դ��*/
  ele_cnt       number; /*Դ��ĸ���*/
  ele_region    varchar2(100); /*����*/
  ele_type      varchar2(100); /*�˿�����*/
  exc_sql       varchar2(10000); /*��������������*/
  v_sortid      number;
  v_patch       varchar(255);
begin
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '����ʼִ��'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

  select nvl(max(sort_id),0)+1 into v_sortid from pop_basic_info ;--��ȡpop_basic_info�������������

  src_tabnames := 'SRC0117_POP_BAISHA,SRC0117_POP_DAJING,SRC0117_POP_DIANDI,SRC0117_POP_LINGBO,SRC0117_POP_SHIKENG,SRC0117_POP_RECTIFICATION,SRC0117_POP_SEV_MEN_PAT,SRC0117_POP_CULT';--Դ������
  ele_indx     := 0; --�ڼ���Ԫ��
  ele_cnt      := 8; --���м���Ԫ��

  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '��ʼ���TMP_POP_BASIC_INFO�������'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

  delete from tmp_pop_basic_info;
  delete from tmp_pop_basic_info_bak;

  v_effect_rows := sql%rowcount; --��ЧӰ������
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '���TMP_POP_BASIC_INFO����������ݽ���'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ����POP_BASIC_INFO��ִ��ʱ�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

   insert into tmp_pop_basic_info_bak select * from pop_basic_info where latestversion=1 and description ='���ô洢����';


   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '����POP_BASIC_INFO��ִ��ʱ������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;

   /*���������ֹ�ִ��*/
   --delete from pop_basic_info
   --where modified_date >= to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd')
   -- and modified_date< to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd') + 1
   -- and description ='���ô洢����';
   --commit;

    /*��ԭ����*/
    --insert into pop_basic_info select * from tmp_pop_basic_info_bak;
    --commit;

  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '��ʼ����POP_BASIC_INFO�������У���'  || src_tabname  ||'����Ҫ�޸ĵ���Ч�汾����Ϊ��Ч'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

    /*���˿ڻ�����Ϣ����������Ⱥ���ݵİ汾״̬��Ϊ��Ч���˰汾��Ϊ���°汾*/
    update pop_basic_info s
       set s.latestversion=0
     where s.latestversion=1
       and s.pop_type!='N';

  v_effect_rows := sql%rowcount; --��ЧӰ������
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '����POP_BASIC_INFO�İ汾���ݽ���'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  commit;

  /*���ҳ������ݱ������µ�����*/
   select t.patch_code
     into v_patch
     from patch_config t
    where t.patch_status=1
      and t.tar_tab_enname='POP_BASIC_INFO';

  /*ѭ����������*/
  loop
    ele_indx := ele_indx + 1;
    select regexp_substr(src_tabnames, '[^,]+', 1, ele_indx),---�Զ���Ϊ�ָ�����ȡ�����ԷǶ��ſ�ͷ��һ�������ַ�����Դ�����еĵ�ele_indx��Դ��ele_indx��1��ʼ����
           decode(regexp_substr(regexp_substr(src_tabnames, '[^,]+', 1, ele_indx), '[^_]+', 1, 3), 'RECTIFICATION', 'R', 'SEV', 'S', 'CULT', 'C', 'N'),
           --����ѡ�еĵ�ele_indx��Դ����_Ϊ�ָ��������ȡ������_Ϊ�ָ��ĵ������ַ�����RECTIFICATION�����˿����;�ΪR�������SEV�����˿�����ΪS�������CULT�����˿�����ΪC�����������˿�����ΪN�������ˣ�
           decode(regexp_substr(regexp_substr(src_tabnames, '[^,]+',1,ele_indx),'[^_]+',1,3),'BAISHA','baisha','DAJING','dajing','DIANDI','diandi','LINGBO','lingbo','SHIKENG','shikeng','RECTIFICATION','δ֪','SEV','δ֪','CULT','δ֪')
           --������ȡֵ��ͨ����ȡԴ�����_Ϊ�ָ��������ַ�����Сд���������˵ĵ���Ϊ��
      into src_tabname, ele_type, ele_region
      from dual;

     --����
     /*-- Create sequence
     create sequence seq_pop_basic_info
     maxvalue 9999999999999999999999
     start with 1
     increment by 1;*/

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��ȡ'  || src_tabname  ||'�����ݣ�������µ�tmp_pop_basic_info����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_POP_BASIC_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

   /*���˿�����Ϊ������ʱ����������˿ڻ�����Ϣ���������£�*/
     if ele_type = 'N'
    then   exc_sql := 'insert into tmp_pop_basic_info  /*���˿ڻ�����Ϣ��ʱ���в�����Ҫ���µ���������*/
                       select t1.account_no,          /*����������ݵ�֤���Ŵ������˿ڻ�����Ϣ����*/
                              t1.pop_name,
                              t2.sex_code,
                              t1.pop_sex,
                              t1.nation,
                              t1.birthday,
                              t1.form_name,
                              t1.height,
                              t3.marry_status_code,
                              t1.mar_status,
                              t1.mar_date,
                              t1.pol_visage,
                              t1.pop_ctg,
                              t1.fix_ttl,
                              t1.mb_phone,
                              '''',
                              '''',
                              t4.education_code,
                              t1.deg_edu,
                              ' || '''' || ele_type || '''' || ',
                              t5.region_code,
                              t5.region_name,
                              decode(substr(t1.gen_grid,1,1),''A'',''A����'',''B'',''B����'',''C'',''C����'',''D'',''D����'',''��'',''E����'',''δ֪''��,
                               --�����������ֶ�ͳһתΪ ��ĸ+����
                              t1.time,
                              ' || '''' || v_sortid || '''' || ',
                              ''���ô洢����'',
                              '''',
                              '''',
                              sysdate,
                              '''',
                              '''',
                              sysdate,
                              1,
                              s.max_version+1,
                              1 ,
                              0,
                              '''',
                              ' || '''' || src_tabname || '''' || ',
                              decode(' || '''' ||ele_region|| '''' || ',''baisha'',''��ɳ'',''dajing'',''��'',''diandi'',''���'',''lingbo'',''�貨'',''shikeng'',''ʯ��'',''δ֪''),
                              ' || '''' || v_patch || '''' || '
                              from '  || src_tabname  ||' t1,
                                   dim_sex t2,
                                   dim_marry_status t3,
                                   dim_education t4,
                                   dim_region t5,
                                   (select account_no,patch_code,max(version) max_version from pop_basic_info group by account_no,patch_code)s
                             where t1.time >= to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'')
                               and t1.time < to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'') + 1
                               and t2.sex_name=nvl(t1.pop_sex,''δ֪'') --�Ա�Ϊ�ղ�Ҫ©��
                               and t3.marry_status_name=nvl(t1.mar_status,''δ֪'')--����״��Ϊ�ղ�Ҫ©��
                               and t4.education_name=nvl(t1.deg_edu,''δ֪'')--ѧ��Ϊ�ղ�Ҫ©��
                               and nvl(' || '''' || ele_region || '''' || '|| decode(substr(t1.gen_grid,1,1),''��'',''E'',substr(t1.gen_grid,1,1)),''δ֪'')=t5.region_formname  --�� �貨������������ תΪE����
                               and t1.account_no = s.account_no
                               and s.patch_code=' || '''' || v_patch || '''' || '
                      union all
                       select t1.account_no,          /*����������ݵ�֤���Ŵ������˿ڻ�����Ϣ����*/
                              t1.pop_name,
                              t2.sex_code,
                              t1.pop_sex,
                              t1.nation,
                              t1.birthday,
                              t1.form_name,
                              t1.height,
                              t3.marry_status_code,
                              t1.mar_status,
                              t1.mar_date,
                              t1.pol_visage,
                              t1.pop_ctg,
                              t1.fix_ttl,
                              t1.mb_phone,
                              '''',
                              '''',
                              t4.education_code,
                              t1.deg_edu,
                              ' || '''' || ele_type || '''' || ',
                              t5.region_code,
                              t5.region_name,
                              decode(substr(t1.gen_grid,1,1),''A'',''A����'',''B'',''B����'',''C'',''C����'',''D'',''D����'',''��'',''E����'',''δ֪''��,
                               --�����������ֶ�ͳһתΪ ��ĸ+����
                              t1.time,
                              ' || '''' || v_sortid || '''' || ',
                              ''���ô洢����'',
                              '''',
                              '''',
                              sysdate,
                              '''',
                              '''',
                              sysdate,
                              1,
                              1,
                              1 ,
                              0,
                              '''',
                              ' || '''' || src_tabname || '''' || ',
                              decode(' || '''' ||ele_region|| '''' || ',''baisha'',''��ɳ'',''dajing'',''��'',''diandi'',''���'',''lingbo'',''�貨'',''shikeng'',''ʯ��'',''δ֪''),
                              ' || '''' || v_patch || '''' || '
                        from '  || src_tabname  ||' t1,
                             dim_sex t2,
                             dim_marry_status t3,
                             dim_education t4,
                             dim_region t5,
                             (select account_no,patch_code,max(version) max_version from pop_basic_info group by account_no,patch_code)s
                       where t1.time >= to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'')
                         and t1.time < to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'') + 1
                         and t2.sex_name=nvl(t1.pop_sex,''δ֪'') --�Ա�Ϊ�ղ�Ҫ©��
                         and t3.marry_status_name=nvl(t1.mar_status,''δ֪'')--����״��Ϊ�ղ�Ҫ©��
                         and t4.education_name=nvl(t1.deg_edu,''δ֪'')--ѧ��Ϊ�ղ�Ҫ©��
                         and nvl(' || '''' || ele_region || '''' || '|| decode(substr(t1.gen_grid,1,1),''��'',''E'',substr(t1.gen_grid,1,1)),''δ֪'')=t5.region_formname  --�� �貨������������ תΪE����
                         and t1.account_no = s.account_no
                         and ' || '''' || v_patch || '''' || ' not in (select distinct patch_code  from pop_basic_info)
                      union all
                      select  t1.account_no,   /*����������ݵ�֤���Ų��������˿ڻ�����Ϣ����*/
                              t1.pop_name,
                              t2.sex_code,
                              t1.pop_sex,
                              t1.nation,
                              t1.birthday,
                              t1.form_name,
                              t1.height,
                              t3.marry_status_code,
                              t1.mar_status,
                              t1.mar_date,
                              t1.pol_visage,
                              t1.pop_ctg,
                              t1.fix_ttl,
                              t1.mb_phone,
                              '''',
                              '''',
                              t4.education_code,
                              t1.deg_edu,
                               ' || '''' || ele_type || '''' || ',
                              t5.region_code,
                              t5.region_name,
                              decode(substr(t1.gen_grid,1,1),''A'',''A����'',''B'',''B����'',''C'',''C����'',''D'',''D����'',''��'',''E����'',''δ֪''��,
                               --�����������ֶ�ͳһתΪ ��ĸ+����
                              t1.time,
                              ' || '''' || v_sortid || '''' || ',
                              ''���ô洢����'',
                              '''',
                              '''',
                              sysdate,
                              '''',
                              '''',
                              sysdate,
                              1,
                              1,
                              1,
                              0,
                              '''',
                              ' || '''' || src_tabname || '''' || ',
                              decode(' || '''' ||ele_region|| '''' || ',''baisha'',''��ɳ'',''dajing'',''��'',''diandi'',''���'',''lingbo'',''�貨'',''shikeng'',''ʯ��''),
                              ' || '''' || v_patch || '''' || '
                       from '  || src_tabname  ||' t1,
                             dim_sex t2,
                             dim_marry_status t3,
                             dim_education t4,
                             dim_region t5
                       where t1.time>= to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'')  --������ȡ
                         and t1.time < to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'') + 1
                         and t2.sex_name=nvl(t1.pop_sex,''δ֪'') --�Ա�Ϊ�ղ�Ҫ©��
                         and t3.marry_status_name=nvl(t1.mar_status,''δ֪'')--����״��Ϊ�ղ�Ҫ©��
                         and t4.education_name=nvl(t1.deg_edu,''δ֪'')--ѧ��Ϊ�ղ�Ҫ©��
                         and nvl(' || '''' || ele_region || '''' || '|| decode(substr(t1.gen_grid,1,1),''��'',''E'',substr(t1.gen_grid,1,1)),''δ֪'')=t5.region_formname  --�� �貨������������ תΪE����
                         and t1.account_no not in(select s.account_no from tmp_pop_basic_info s)
                         and t1.account_no not in(select p.account_no from pop_basic_info p)';

    execute immediate exc_sql;
    v_effect_rows := sql%rowcount; --��ЧӰ������
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '��ȡ'  || src_tabname  ||'�����ݵ�tmp_pop_basic_info�й��̽���'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_POP_BASIC_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    commit;


     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����POP_BASIC_INFO�������У���'  || src_tabname  ||'����Ҫ�޸ĵ���Ч�汾����Ϊ��Ч'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    /*���˿ڻ�����Ϣ���д��ڵ�֤���ŵ����ݵİ汾״̬��Ϊ��Ч���˰汾��Ϊ���°汾*/
    update pop_basic_info s
       set s.latestversion=0
     where s.latestversion=1
       and s.pop_type='N'
       and s.account_no in(select t.account_no from tmp_pop_basic_info t);

    v_effect_rows := sql%rowcount; --��ЧӰ������
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '����POP_BASIC_INFO�İ汾���ݽ���'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    commit;

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '��ʼ��TMP_POP_BASIC_INFO�����ݲ��뵽pop_basic_info����'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    /*���˿ڻ�����Ϣ���в�����ʱ�������*/
    insert into pop_basic_info  select * from tmp_pop_basic_info;

    v_effect_rows := sql%rowcount; --��ЧӰ������
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '����POP_BASIC_INFO������ݽ���'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    commit;

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '��ʼ���TMP_POP_BASIC_INFO�������'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

    delete from tmp_pop_basic_info;

    v_effect_rows := sql%rowcount; --��ЧӰ������
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '���TMP_POP_BASIC_INFO����������ݽ���'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    commit;

    else
      /*���˿�����Ϊ��������ʱ��ֻ��¼���֤�ź�����*/
       exc_sql := 'insert into tmp_pop_basic_info(account_no,pop_name,pop_type,region_code,region,gen_grid,time_stamp,sort_id,description,create_date,modified_date,version_status,version,latestversion,approvalstae,src_entity,src_community,patch_code)
                      select                         /*֤��������������ƥ�䵽*/
                            t1.account_no,
                            t1.pop_name,
                             '|| '''' || ele_type || '''' || ',
                            ''9999'',
                            ''δ֪'',
                            ''δ֪'',
                            t1.time,
                            ' || '''' || v_sortid || '''' || ',
                            ''���ô洢����'',
                            sysdate,
                            sysdate,
                            1,
                            s.version+1,
                            1,
                            0,
                            ' || '''' || src_tabname || '''' || '��
                            ''δ֪'',
                            ' || '''' || v_patch || '''' || '
                      from '  || src_tabname  ||' t1,
                             pop_basic_info s
                      where t1.time>= to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'')  --������ȡ
                        and t1.time < to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'') + 1
                        and t1.account_no=s.account_no
                        and s.patch_code=' || '''' || v_patch || '''' || '
                        and s.pop_type=''N''
                        and s.latestversion=1
                    union all
                     select                         /*֤��������������ƥ�䵽*/
                            t1.account_no,
                            t1.pop_name,
                             '|| '''' || ele_type || '''' || ',
                            ''9999'',
                            ''δ֪'',
                            ''δ֪'',
                            t1.time,
                            ' || '''' || v_sortid || '''' || ',
                            ''���ô洢����'',
                            sysdate,
                            sysdate,
                            1,
                            1,
                            1,
                            0,
                            ' || '''' || src_tabname || '''' || '��
                            ''δ֪'',
                            ' || '''' || v_patch || '''' || '
                      from '  || src_tabname  ||' t1,
                             pop_basic_info s
                      where t1.time>= to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'')  --������ȡ
                        and t1.time < to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'') + 1
                        and t1.account_no=s.account_no
                        and s.patch_code=' || '''' || v_patch || '''' || '
                        and s.pop_type=''N''
                        and s.latestversion=1
                        and ' || '''' || v_patch || '''' || ' not in (select distinct patch_code  from pop_basic_info)
                    union all
                       select                        /*֤��������������ƥ�䲻��*/
                            t1.account_no,
                            t1.pop_name,
                            '|| '''' || ele_type || '''' || ',
                            ''9999'',
                            ''δ֪'',
                            ''δ֪'',
                            t1.time,
                            ' || '''' || v_sortid || '''' || ',
                            ''���ô洢����'',
                            sysdate,
                            sysdate,
                            1,
                            max_version+1,
                            1,
                            0,
                            ' || '''' || src_tabname || '''' || '��
                            ''δ֪'',
                            ' || '''' || v_patch || '''' || '
                      from '  || src_tabname  ||' t1,
                           (select account_no,patch_code,max(version) max_version from pop_basic_info where pop_type!=''N'' group by account_no,patch_code ) s
                      where t1.time>= to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'')  --������ȡ
                        and t1.time < to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'') + 1
                        and t1.account_no not in(select s.account_no from pop_basic_info s where s.pop_type=''N'' and s.latestversion=1)
                        and t1.account_no =s.account_no
                        and s.patch_code=' || '''' || v_patch || '''' || '
                      union all
                      select                        /*֤��������������ƥ�䲻��*/
                            t1.account_no,
                            t1.pop_name,
                            '|| '''' || ele_type || '''' || ',
                            ''9999'',
                            ''δ֪'',
                            ''δ֪'',
                            t1.time,
                            ' || '''' || v_sortid || '''' || ',
                            ''���ô洢����'',
                            sysdate,
                            sysdate,
                            1,
                            max_version+1,
                            1,
                            0,
                            ' || '''' || src_tabname || '''' || '��
                            ''δ֪'',
                            ' || '''' || v_patch || '''' || '
                      from '  || src_tabname  ||' t1,
                           (select account_no,patch_code,max(version) max_version from pop_basic_info where pop_type!=''N'' group by account_no,patch_code ) s
                      where t1.time>= to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'')  --������ȡ
                        and t1.time < to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'') + 1
                        and t1.account_no not in(select s.account_no from pop_basic_info s where s.pop_type=''N'' and s.latestversion=1)
                        and t1.account_no =s.account_no
                        and ' || '''' || v_patch || '''' || ' not in (select distinct patch_code  from pop_basic_info)
                      union all
                        select                        /*֤�����������ͷ���������ƥ�䲻��*/
                            t1.account_no,
                            t1.pop_name,
                            '|| '''' || ele_type || '''' || ',
                            ''9999'',
                            ''δ֪'',
                            ''δ֪'',
                            t1.time,
                            ' || '''' || v_sortid || '''' || ',
                            ''���ô洢����'',
                            sysdate,
                            sysdate,
                            1,
                            1,
                            1,
                            0,
                            ' || '''' || src_tabname || '''' || '��
                            ''δ֪'',
                            ' || '''' || v_patch || '''' || '
                      from '  || src_tabname  ||' t1
                      where t1.time>= to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'')  --������ȡ
                        and t1.time < to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'') + 1 
                        and t1.account_no not in(select s.account_no from pop_basic_info s where s.pop_type=''N'' and s.latestversion=1)
                        and t1.account_no not in(select s.account_no from pop_basic_info s where s.pop_type!=''N'')';
    dbms_output.put_line(exc_sql);
    execute immediate exc_sql;

    v_effect_rows := sql%rowcount; --��ЧӰ������
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '��ȡ'  || src_tabname  ||'�����ݵ�tmp_pop_basic_info�й��̽���'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_POP_BASIC_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    commit;
    end if;

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '��ʼ��TMP_POP_BASIC_INFO�����ݲ��뵽pop_basic_info����'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    /*���˿ڻ�����Ϣ���в�����ʱ�������*/
    merge into pop_basic_info  t
       using (select a.* from  tmp_pop_basic_info a  ) s
         on (t.account_no = s.account_no and t.latestversion=1 and t.patch_code=v_patch)
       when matched then
       update set  t.pop_type  = case when instr(t.pop_type ,s.pop_type) >0 then t.pop_type  --�������֮ǰ�����ʹ��ڴ����ͣ����˿����Ͳ���
                                      else t.pop_type ||'&'||s.pop_type  end,     --�������֮ǰ�����Ͳ����ڴ����ͣ���Ѹ�������ӵ��˿�������ȥ����&�ϲ�
                   t.src_entity = case when instr(t.src_entity ,s.src_entity) >0 then t.src_entity
                                        else t.src_entity ||'&'||s.src_entity  end
       where t.pop_type != s.pop_type
         --and t.src_tabname != s.src_tabname
         --and t.bus_date != s.bus_date
       when not matched then
       insert   (account_no      ,
                 pop_name        ,
                 pop_type        ,
                 region_code     ��
                 region          ,
                 gen_grid        ,
                 time_stamp      ,
                 sort_id         ,
                 description     ,
                 create_date     ,
                 modified_date   ,
                 version_status  ,
                 version         ,
                 latestversion   ,
                 approvalstae    ,
                 src_entity      ,
                 src_community   ,
                 patch_code)
       values   (s.account_no,
                 s.pop_name,
                 s.pop_type,
                 s.region_code,
                 s.region,
                 s.gen_grid,
                 s.time_stamp,
                 s.sort_id,
                 s.description,
                 s.create_date,
                 s.modified_date,
                 s.version_status,
                 s.version,
                 s.latestversion,
                 s.approvalstae,
                 s.src_entity,
                 s.src_community,
                 v_patch
                );

    v_effect_rows := sql%rowcount; --��ЧӰ������
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '����POP_BASIC_INFO������ݽ���'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    commit;

    exit when ele_indx = ele_cnt;
    end loop;

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '��ʼ���TMP_POP_BASIC_INFO�������'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

    --delete from tmp_pop_basic_info;

    v_effect_rows := sql%rowcount; --��ЧӰ������
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '���TMP_POP_BASIC_INFO����������ݽ���'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '�����Ƿ������ֶ�is_childbear_age��ʼ'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    update  POP_BASIC_INFO
    set  is_Childbear_age_code =  case when pop_sex_code='F' and trunc(months_between(sysdate,birthday)/12) between 15 and 49 then 'Y'
                                       when birthday is not null then 'N' end,
         is_childbear_age = case when pop_sex_code='F' and trunc(months_between(sysdate,birthday)/12) between 15 and 49 then '��'
                                 when birthday is not null then '��' end;

    v_effect_rows := sql%rowcount; --��ЧӰ������
    commit;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '�����Ƿ������ֶ�is_childbear_age����'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '��ʼ����sys_md_apply_cfg���е�����'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    /*���sys_md_apply_cfg�������pop_basic_info������Ҫ���*/
    merge into sys_md_apply_cfg b
          using(select sys_guid() next_cfgid from dual)s
          on(b.tablename=v_tab_name)
    when not matched then
         insert (cfg_id,
                 tablename
                 )
         values (
                 s.next_cfgid,
                 v_tab_name
                 );
    v_effect_rows := sql%rowcount; --��ЧӰ������
    commit;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '����sys_md_apply_cfg���е����ݽ���'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����sys_md_select_cfg���е�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     /*���������ݼ�������ѡ��������*/
     merge into sys_md_select_cfg c
           using(select sys_guid() next_cfgid from dual)s
              on(c.tab_en_nm=v_tab_name and c.attri_en_nm='PATCH_CODE' and c.value=v_patch)
      when not matched then
           insert (
                   select_id,
                   tab_en_nm,
                   attri_en_nm,
                   value
                  )
           values (
                   s.next_cfgid,
                   v_tab_name,
                   'PATCH_CODE',
                   v_patch
                  );
     v_effect_rows := sql%rowcount; --��ЧӰ������
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����sys_md_select_cfg���е����ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   /*************************��������***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '����ִ�����'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********�쳣����Ҳ������������Ҫ�����쳣���Ƶĵط������쳣����*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into POP_BASIC_INFO fail: ' || substr(sqlerrm, 1, 300); --�쳣��־��Ϣ
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_PRJ_BASEINFO
prompt ===================================
prompt
create or replace procedure prc_prj_baseinfo ---���ؾ�Ӫ����Ŀ������Ϣ
(
    iv_date    in varchar2  -- ����ͳ�����ڣ���ʽ��yyyymmdd
)
is
/*************************************************************************************************
  * Ŀ���AC_PRJ_BASEINFO��LC_PRJ_BASEINFO(���ؾ�Ӫ����Ŀ������Ϣ)
  * Դ��SRC0202_PLN_PROJECT
  * ��ʽ��     ����
  * ����Ƶ�ȣ� ����
  * ������˵��: ������Ŀ����й����ؾ�Ӫ����Ŀ������Ϣ������
  * ��������� iv_date    �������ڣ���ʽ��yyyymmdd
  * ��������� ��
  * ���ߣ�        ����
  * �������ڣ�    2017-7-11
  *
  * �޸ļ�¼
  *************************************************************************************************
  * �޸���                  �޸�����          �޸�����
  *************************************************************************************************/
  v_proc_name   varchar2(32) := 'PRC_AC_PRJ_BASEINFO'; --�洢������
  v_tab_name    varchar2(32) := 'AC_PRJ_BASEINFO';
  v_step_name   varchar2(200):= '�������ؾ�Ӫ����Ŀ������Ϣ������'; --��������
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --����ʱ��
  v_error_flag  varchar2(4)  := '0'; --�����־��0��������1������
  v_log_mess    varchar2(300) := 'merge into ac_prj_baseinfo normal'; --��־��Ϣ
  v_effect_rows number := 0; --��ЧӰ������
  v_proc_id     number := seq_proc_log.nextval; --�洢���̵�ID��
  v_sortid_ac   number;
  v_sortid_lc   number;
begin
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '����ʼִ��'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   
    select nvl(max(sort_id),0)+1 into v_sortid_ac from ac_prj_baseinfo ;--��ȡac_prj_baseinfo�������������
    
    select nvl(max(sort_id),0)+1 into v_sortid_lc from lc_prj_baseinfo ;--��ȡlc_prj_baseinfo�������������

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ���TMP_AC_PRJ_BASEINFO�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

   delete from tmp_ac_prj_baseinfo;

   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '���TMP_AC_PRJ_BASEINFO����������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ���Ŀ���ִ��ʱ�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

   delete from ac_prj_baseinfo c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---ɾ����Ҫ���ܵ�����
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;
   
   delete from lc_prj_baseinfo c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---ɾ����Ҫ���ܵ�����
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;

   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '���Ŀ���ִ��ʱ������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_BASEINFO����'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

  /*�����ί������ؾ�Ӫ����Ŀ������Ϣ��ʱ�������*/
    insert into tmp_ac_prj_baseinfo(project_id,project_code,project_name,projecttypecode,targetbegintime,targetendtime,actbegintime,actendtime,investamount,investamountyear,projectscale,projectcontent,projectaddr,
                                    desctext,description,create_date,modified_date,version_status,version,latestversion,approvalstae,bus_date,src_table,src_system,sort_id)
     select
            t1.project_id,
            t1.project_shortname,
            t1.project_name,
            t1.project_type,
            t1.target_start_date,
            t1.target_end_date,
            t1.target_end_date,
            t1.act_end_date,
            t1.totalinvest,
            t1.thisyearinvest,
            t1.scale,
            t1.content,
            t1.project_address,
            t1.remark,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT',
            v_sortid_ac
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from ac_prj_baseinfo s group by s.project_id) a
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.project_id=a.project_id
       and t1.program_id='194'
    union all
      select  
            t1.project_id,
            t1.project_shortname,
            t1.project_name,
            t1.project_type,
            t1.target_start_date,
            t1.target_end_date,
            t1.target_end_date,
            t1.act_end_date,
            t1.totalinvest,
            t1.thisyearinvest,
            t1.scale,
            t1.content,
            t1.project_address,
            t1.remark,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT'��
            v_sortid_ac
      from src0202_pln_project t1
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.program_id='194'
       and t1.project_id not in (select s.project_id from ac_prj_baseinfo s );
       
     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_BASEINFO�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����AC_PRJ_BASEINFO�������У���PLN_PROJECT����Ҫ�޸ĵ���Ч�汾����Ϊ��Ч'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     update ac_prj_baseinfo s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_baseinfo t);

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����AC_PRJ_BASEINFO�İ汾���ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��TMP_AC_PRJ_BASEINFO�����ݲ��뵽AC_PRJ_BASEINFO����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     insert into ac_prj_baseinfo select * from tmp_ac_prj_baseinfo;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����AC_PRJ_BASEINFO������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;       
       
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ���TMP_AC_PRJ_BASEINFO�������'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     delete from tmp_ac_prj_baseinfo;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '���TMP_AC_PRJ_BASEINFO����������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_BASEINFO����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

 /*���뿪����˾�����ؾ�Ӫ����Ŀ������Ϣ��ʱ�������*/
    insert into tmp_ac_prj_baseinfo(project_id,project_code,project_name,projecttypecode,targetbegintime,targetendtime,actbegintime,actendtime,investamount,investamountyear,projectscale,projectcontent,projectaddr,
                                    desctext,description,create_date,modified_date,version_status,version,latestversion,approvalstae,bus_date,src_table,src_system,sort_id)
      select
            t1.project_id,
            t1.project_shortname,
            t1.project_name,
            t1.project_type,
            t1.target_start_date,
            t1.target_end_date,
            t1.target_end_date,
            t1.act_end_date,
            t1.totalinvest,
            t1.thisyearinvest,
            t1.scale,
            t1.content,
            t1.project_address,
            t1.remark,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT'��
            v_sortid_lc
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from lc_prj_baseinfo s group by s.project_id) a
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.project_id=a.project_id
       and t1.program_id='195'
     union all
      select  
            t1.project_id,
            t1.project_shortname,
            t1.project_name,
            t1.project_type,
            t1.target_start_date,
            t1.target_end_date,
            t1.target_end_date,
            t1.act_end_date,
            t1.totalinvest,
            t1.thisyearinvest,
            t1.scale,
            t1.content,
            t1.project_address,
            t1.remark,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT',
            v_sortid_lc
      from src0202_pln_project t1
     where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.program_id='195'
       and t1.project_id not in (select s.project_id from lc_prj_baseinfo s );

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_BASEINFO�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����LC_PRJ_BASEINFO�������У���SRC0202_PLN_PROJECT����Ҫ�޸ĵ���Ч�汾����Ϊ��Ч'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'LC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     update lc_prj_baseinfo s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_baseinfo t);

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����LC_PRJ_BASEINFO�İ汾���ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'LC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��TMP_AC_PRJ_BASEINFO�����ݲ��뵽LC_PRJ_BASEINFO����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'LC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     insert into lc_prj_baseinfo select * from tmp_ac_prj_baseinfo;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����LC_PRJ_BASEINFO������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'LC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ���TMP_AC_PRJ_BASEINFO�������'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     delete from tmp_ac_prj_baseinfo;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '���TMP_AC_PRJ_BASEINFO����������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;
     
    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '��ʼ����sys_md_apply_cfg���е�����'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    
    /*���sys_md_apply_cfg����û�����Ŀ�������Ҫ���*/
    merge into sys_md_apply_cfg b
          using(select sys_guid() next_cfgid from dual)s
          on(b.tablename='AC_PRJ_BASEINFO')
    when not matched then
         insert (cfg_id,
                 tablename
                 )
         values (
                 s.next_cfgid,
                 'AC_PRJ_BASEINFO'
                 );
    merge into sys_md_apply_cfg b
          using(select sys_guid() next_cfgid from dual)s
          on(b.tablename='LC_PRJ_BASEINFO')
    when not matched then
         insert (cfg_id,
                 tablename
                 )
         values (
                 s.next_cfgid,
                 'LC_PRJ_BASEINFO'
                 );
    v_effect_rows := sql%rowcount; --��ЧӰ������
    commit;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '����sys_md_apply_cfg���е����ݽ���'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

  /*************************��������***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '����ִ�����'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********�쳣����Ҳ������������Ҫ�����쳣���Ƶĵط������쳣����*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into ac_prj_baseinfo fail: ' || substr(sqlerrm, 1, 300); --�쳣��־��Ϣ
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_PRJ_CONTRACT
prompt ===================================
prompt
create or replace procedure prc_prj_contract ---��غ�ͬ��
(
    iv_date    in varchar2  -- ����ͳ�����ڣ���ʽ��yyyymmdd
)
is
/*************************************************************************************************
  * Ŀ���AC_PRJ_CONTRACT��LC_PRJ_CONTRACT(��غ�ͬ��)
  * Դ��SRC0202_PLN_PROJECT
  * ��ʽ��     ����
  * ����Ƶ�ȣ� ����
  * ������˵��: ������Ŀ����й���غ�ͬ�������
  * ��������� iv_date    �������ڣ���ʽ��yyyymmdd
  * ��������� ��
  * ���ߣ�        ����
  * �������ڣ�    2017-7-11
  *
  * �޸ļ�¼
  *************************************************************************************************
  * �޸���                  �޸�����          �޸�����
  *************************************************************************************************/
  v_proc_name   varchar2(32) := 'PRC_AC_PRJ_CONTRACT'; --�洢������
  v_tab_name    varchar2(32) := 'AC_PRJ_CONTRACT';
  v_step_name   varchar2(200):= '������غ�ͬ������'; --��������
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --����ʱ��
  v_error_flag  varchar2(4)  := '0'; --�����־��0��������1������
  v_log_mess    varchar2(300) := 'merge into ac_prj_contract normal'; --��־��Ϣ
  v_effect_rows number := 0; --��ЧӰ������
  v_proc_id     number := seq_proc_log.nextval; --�洢���̵�ID��
  v_sortid_ac   number;
  v_sortid_lc   number;
begin
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '����ʼִ��'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   
    select nvl(max(sort_id),0)+1 into v_sortid_ac from ac_prj_contract ;--��ȡac_prj_baseinfo�������������
    
    select nvl(max(sort_id),0)+1 into v_sortid_lc from lc_prj_contract ;--��ȡlc_prj_baseinfo�������������

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ���TMP_AC_PRJ_CONTRACT�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_CONTRACT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

   delete from tmp_ac_prj_contract;

   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '���TMP_AC_PRJ_CONTRACT����������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_CONTRACT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ���Ŀ���ִ��ʱ�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

   delete from ac_prj_contract c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---ɾ����Ҫ���ܵ�����
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;
           
   delete from lc_prj_contract c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---ɾ����Ҫ���ܵ�����
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;       
   

   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '���Ŀ���ִ��ʱ������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_CONTRACT����'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_CONTRACT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

  /*�����ί�����غ�ͬ��ʱ�������*/
    insert into tmp_ac_prj_contract(project_id,project_code,contractcode,description,create_date,modified_date,version_status,version,latestversion,approvalstae, bus_date,src_table,src_system,sort_id)
     select
            t1.project_id,
            t1.project_shortname,
            t1.contract_id,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT',
            v_sortid_ac
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from ac_prj_contract s group by s.project_id) a
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.project_id=a.project_id
       and t1.program_id='194'
    union all
    select  t1.project_id,
            t1.project_shortname,
            t1.contract_id,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT',
            v_sortid_ac
      from src0202_pln_project t1
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.program_id='194'
       and t1.project_id not in (select s.project_id from ac_prj_contract s );

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_CONTRACT�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_CONTRACT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����AC_PRJ_CONTRACT�������У���SRC0202_PLN_PROJECT����Ҫ�޸ĵ���Ч�汾����Ϊ��Ч'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     update ac_prj_contract s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_contract t);

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����AC_PRJ_CONTRACT�İ汾���ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��TMP_AC_PRJ_CONTRACT�����ݲ��뵽AC_PRJ_CONTRACT����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     insert into ac_prj_contract select * from tmp_ac_prj_contract;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����AC_PRJ_CONTRACT������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ���TMP_AC_PRJ_CONTRACT�������'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_CONTRACT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     delete from tmp_ac_prj_contract;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '���TMP_AC_PRJ_CONTRACT����������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_CONTRACT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_CONTRACT����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_CONTRACT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
     /*���뿪����˾����غ�ͬ��ʱ�������*/
    insert into tmp_ac_prj_contract(project_id,project_code,contractcode,description,create_date,modified_date,version_status,version,latestversion,approvalstae, bus_date,src_table,src_system,sort_id)
     select
            t1.project_id,
            t1.project_shortname,
            t1.contract_id,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT',
            v_sortid_lc
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from lc_prj_contract s group by s.project_id) a
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.project_id=a.project_id
       and t1.program_id='195'
    union all
    select  t1.project_id,
            t1.project_shortname,
            t1.contract_id,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT',
            v_sortid_lc
      from src0202_pln_project t1
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.program_id='195'
       and t1.project_id not in (select s.project_id from lc_prj_contract s );

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_CONTRACT�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_CONTRACT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����LC_PRJ_CONTRACT�������У���SRC0202_PLN_PROJECT����Ҫ�޸ĵ���Ч�汾����Ϊ��Ч'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     update lc_prj_contract s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_contract t);

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����LC_PRJ_CONTRACT�İ汾���ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��TMP_AC_PRJ_CONTRACT�����ݲ��뵽LC_PRJ_CONTRACT����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     insert into lc_prj_contract select * from tmp_ac_prj_contract;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����LC_PRJ_CONTRACT������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ���TMP_AC_PRJ_CONTRACT�������'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_CONTRACT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     delete from tmp_ac_prj_contract;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '���TMP_AC_PRJ_CONTRACT����������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_CONTRACT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '��ʼ����sys_md_apply_cfg���е�����'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    
    /*���sys_md_apply_cfg����û�����Ŀ�������Ҫ���*/
    merge into sys_md_apply_cfg b
          using(select sys_guid() next_cfgid from dual)s
          on(b.tablename='AC_PRJ_CONTRACT')
    when not matched then
         insert (cfg_id,
                 tablename
                 )
         values (
                 s.next_cfgid,
                 'AC_PRJ_CONTRACT'
                 );
    merge into sys_md_apply_cfg b
          using(select sys_guid() next_cfgid from dual)s
          on(b.tablename='LC_PRJ_CONTRACT')
    when not matched then
         insert (cfg_id,
                 tablename
                 )
         values (
                 s.next_cfgid,
                 'LC_PRJ_CONTRACT'
                 );
    v_effect_rows := sql%rowcount; --��ЧӰ������
    commit;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '����sys_md_apply_cfg���е����ݽ���'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

  /*************************��������***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '����ִ�����'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********�쳣����Ҳ������������Ҫ�����쳣���Ƶĵط������쳣����*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into ac_prj_contract fail: ' || substr(sqlerrm, 1, 300); --�쳣��־��Ϣ
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_PRJ_INVESTINFO
prompt =====================================
prompt
create or replace procedure prc_prj_investinfo ---Ͷ���ܶ��
(
    iv_date    in varchar2  -- ����ͳ�����ڣ���ʽ��yyyymmdd
)
is
/*************************************************************************************************
  * Ŀ���AC_PRJ_INVESTINFO��LC_PRJ_INVESTINFO(Ͷ���ܶ��)
  * Դ��SRC0202_PLN_PROJECT
  * ��ʽ��     ����
  * ����Ƶ�ȣ� ����
  * ������˵��: ������Ŀ����й�Ͷ���ܶ�������
  * ��������� iv_date    �������ڣ���ʽ��yyyymmdd
  * ��������� ��
  * ���ߣ�        ����
  * �������ڣ�    2017-7-11
  *
  * �޸ļ�¼
  *************************************************************************************************
  * �޸���                  �޸�����          �޸�����
  *************************************************************************************************/
  v_proc_name   varchar2(32) := 'PRC_AC_PRJ_INVESTINFO'; --�洢������
  v_tab_name    varchar2(32) := 'AC_PRJ_INVESTINFO';
  v_step_name   varchar2(200):= '����Ͷ���ܶ������'; --��������
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --����ʱ��
  v_error_flag  varchar2(4)  := '0'; --�����־��0��������1������
  v_log_mess    varchar2(300) := 'merge into AC_PRJ_INVESTINFO normal'; --��־��Ϣ
  v_effect_rows number := 0; --��ЧӰ������
  v_proc_id     number := seq_proc_log.nextval; --�洢���̵�ID��
  v_sortid_ac   number;
  v_sortid_lc   number;
begin
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '����ʼִ��'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   
      
    select nvl(max(sort_id),0)+1 into v_sortid_ac from ac_prj_investinfo ;--��ȡac_prj_contract�������������
    
    select nvl(max(sort_id),0)+1 into v_sortid_lc from lc_prj_investinfo ;--��ȡlc_prj_contract�������������

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ���TMP_AC_PRJ_INVESTINFO�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

   delete from tmp_ac_prj_investinfo;

   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '���TMP_AC_PRJ_INVESTINFO����������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ���Ŀ���ִ��ʱ�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

   delete from ac_prj_investinfo c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---ɾ����Ҫ���ܵ�����
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;
           
   delete from lc_prj_investinfo c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---ɾ����Ҫ���ܵ�����
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;
           
   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '���Ŀ���ִ��ʱ������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_INVESTINFO����'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

  /*�����ί���Ͷ���ܶ���ʱ�������*/
    insert into tmp_ac_prj_investinfo(project_id,project_code,originalamount,currentamount,description,create_date,modified_date,version_status,version,latestversion,approvalstae,bus_date,src_table,src_system,sort_id)
     select
            t1.project_id,
            t1.project_shortname,
            t1.totalinvest,
            c.currentinvest,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT',
            v_sortid_ac
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from ac_prj_investinfo s group by s.project_id) a,
           (select project_id,sum(thisyearinvest) currentinvest from src0202_pln_project group by project_id) c
    where  t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.project_id=a.project_id
       and t1.project_id=c.project_id
       and t1.program_id='194'
    union all
    select  t1.project_id,
            t1.project_shortname,
            t1.totalinvest,
            c.currentinvest,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT',
            v_sortid_ac
      from src0202_pln_project t1,
           (select project_id,sum(thisyearinvest) currentinvest from src0202_pln_project group by project_id) c
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.project_id=c.project_id
       and t1.program_id='194'       
       and t1.project_id not in (select s.project_id from ac_prj_investinfo s );

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_INVESTINFO�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����AC_PRJ_INVESTINFO�������У���SRC0202_PLN_PROJECT����Ҫ�޸ĵ���Ч�汾����Ϊ��Ч'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     update ac_prj_investinfo s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_investinfo t);

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����AC_PRJ_INVESTINFO�İ汾���ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��TMP_AC_PRJ_INVESTINFO�����ݲ��뵽AC_PRJ_INVESTINFO����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     insert into ac_prj_investinfo select * from tmp_ac_prj_investinfo;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����AC_PRJ_INVESTINFO������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ���TMP_AC_PRJ_INVESTINFO�������'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     delete from tmp_ac_prj_investinfo;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '���TMP_AC_PRJ_INVESTINFO����������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_INVESTINFO����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

    /*���뿪����˾��Ͷ���ܶ���ʱ�������*/
     insert into tmp_ac_prj_investinfo(project_id,project_code,originalamount,currentamount,description,create_date,modified_date,version_status,version,latestversion,approvalstae,bus_date,src_table,src_system,sort_id)
      select
            t1.project_id,
            t1.project_shortname,
            t1.totalinvest,
            c.currentinvest,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT',
            v_sortid_lc
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from lc_prj_investinfo s group by s.project_id) a,
           (select project_id,sum(thisyearinvest) currentinvest from src0202_pln_project group by project_id) c
    where  t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.project_id=a.project_id
       and t1.project_id=c.project_id
       and t1.program_id='195'
    union all
    select  t1.project_id,
            t1.project_shortname,
            t1.totalinvest,
            c.currentinvest,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT',
            v_sortid_lc
      from src0202_pln_project t1,
           (select project_id,sum(thisyearinvest) currentinvest from src0202_pln_project group by project_id) c
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.project_id=c.project_id
       and t1.program_id='195'       
       and t1.project_id not in (select s.project_id from lc_prj_investinfo s );

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_INVESTINFO�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����LC_PRJ_INVESTINFO�������У���SRC0202_PLN_PROJECT����Ҫ�޸ĵ���Ч�汾����Ϊ��Ч'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     update lc_prj_investinfo s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_investinfo t);

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����LC_PRJ_INVESTINFO�İ汾���ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��TMP_AC_PRJ_INVESTINFO�����ݲ��뵽LC_PRJ_INVESTINFO����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     insert into lc_prj_investinfo select * from tmp_ac_prj_investinfo;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����LC_PRJ_INVESTINFO������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ���TMP_AC_PRJ_INVESTINFO�������'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     delete from tmp_ac_prj_investinfo;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '���TMP_AC_PRJ_INVESTINFO����������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '��ʼ����sys_md_apply_cfg���е�����'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    
    /*���sys_md_apply_cfg����û�����Ŀ�������Ҫ���*/
    merge into sys_md_apply_cfg b
          using(select sys_guid() next_cfgid from dual)s
          on(b.tablename='AC_PRJ_INVESTINFO')
    when not matched then
         insert (cfg_id,
                 tablename
                 )
         values (
                 s.next_cfgid,
                 'AC_PRJ_INVESTINFO'
                 );
    merge into sys_md_apply_cfg b
          using(select sys_guid() next_cfgid from dual)s
          on(b.tablename='LC_PRJ_INVESTINFO')
    when not matched then
         insert (cfg_id,
                 tablename
                 )
         values (
                 s.next_cfgid,
                 'LC_PRJ_INVESTINFO'
                 );
    v_effect_rows := sql%rowcount; --��ЧӰ������
    commit;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '����sys_md_apply_cfg���е����ݽ���'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

  /*************************��������***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '����ִ�����'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********�쳣����Ҳ������������Ҫ�����쳣���Ƶĵط������쳣����*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into AC_PRJ_INVESTINFO fail: ' || substr(sqlerrm, 1, 300); --�쳣��־��Ϣ
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_PRJ_INVESTMENT
prompt =====================================
prompt
create or replace procedure prc_prj_investment ---Ͷ���ܶ��
(
    iv_date    in varchar2  -- ����ͳ�����ڣ���ʽ��yyyymmdd
)
is
/*************************************************************************************************
  * Ŀ���AC_PRJ_INVESTMENT��LC_PRJ_INVESTMENT(Ͷ���ܶ��)
  * Դ��SRC0202_PLN_PROJECT
  * ��ʽ��     ����
  * ����Ƶ�ȣ� ����
  * ������˵��: ������Ŀ����й�Ͷ���ܶ�������
  * ��������� iv_date    �������ڣ���ʽ��yyyymmdd
  * ��������� ��
  * ���ߣ�        ����
  * �������ڣ�    2017-7-11
  *
  * �޸ļ�¼
  *************************************************************************************************
  * �޸���                  �޸�����          �޸�����
  *************************************************************************************************/
  v_proc_name   varchar2(32) := 'PRC_AC_PRJ_INVESTMENT'; --�洢������
  v_tab_name1    varchar2(32) := 'AC_PRJ_INVESTMENT';
  v_tab_name2    varchar2(32) := 'LC_PRJ_INVESTMENT';
  v_step_name   varchar2(200):= '����Ͷ���ܶ������'; --��������
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --����ʱ��
  v_error_flag  varchar2(4)  := '0'; --�����־��0��������1������
  v_log_mess    varchar2(300) := 'merge into ac_prj_investment normal'; --��־��Ϣ
  v_effect_rows number := 0; --��ЧӰ������
  v_proc_id     number := seq_proc_log.nextval; --�洢���̵�ID��
  v_sortid_ac   number;
  v_sortid_lc   number;
begin
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '����ʼִ��'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��


    select nvl(max(sort_id),0)+1 into v_sortid_ac from ac_prj_investment ;--��ȡac_prj_contract�������������

    select nvl(max(sort_id),0)+1 into v_sortid_lc from lc_prj_investment ;--��ȡlc_prj_contract�������������

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ���TMP_AC_PRJ_INVESTMENT�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTMENT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

   delete from tmp_ac_prj_investment;

   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '���TMP_AC_PRJ_INVESTMENT����������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTMENT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ���Ŀ���ִ��ʱ�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

   delete from ac_prj_investment c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---ɾ����Ҫ���ܵ�����
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;

   delete from lc_prj_investment c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---ɾ����Ҫ���ܵ�����
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;

   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '���Ŀ���ִ��ʱ������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_INVESTMENT����'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTMENT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

  /*�����ί���Ͷ���ܶ���ʱ�������*/
    insert into tmp_ac_prj_investment(project_id,project_code,originalamount,currentamount,contractcode,description,create_date,modified_date,version_status,version,latestversion,approvalstae,bus_date,src_table,src_system,sort_id)
     select
            t1.project_id,
            t1.project_shortname,
            t1.totalinvest,
            c.currentinvest,
            t1.contract_id,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT',
            v_sortid_ac
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from ac_prj_investment s group by s.project_id) a,
           (select project_id,sum(thisyearinvest) currentinvest from src0202_pln_project group by project_id) c
    where  t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')-1
       and t1.project_id=a.project_id
       and t1.project_id=c.project_id
       and t1.program_id='194'
    union all
    select  t1.project_id,
            t1.project_shortname,
            t1.totalinvest,
            c.currentinvest,
            t1.contract_id,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT',
            v_sortid_ac
      from src0202_pln_project t1,
           (select project_id,sum(thisyearinvest) currentinvest from src0202_pln_project group by project_id) c
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')-1
       and t1.project_id=c.project_id
       and t1.program_id='194'
       and t1.project_id not in (select s.project_id from ac_prj_investment s );

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_INVESTMENT�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTMENT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����AC_PRJ_INVESTMENT�������У���SRC0202_PLN_PROJECT����Ҫ�޸ĵ���Ч�汾����Ϊ��Ч'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     update ac_prj_investment s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_investment t);

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����AC_PRJ_INVESTMENT�İ汾���ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��TMP_AC_PRJ_INVESTMENT�����ݲ��뵽AC_PRJ_INVESTMENT����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     insert into ac_prj_investment select * from tmp_ac_prj_investment;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����AC_PRJ_INVESTMENT������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ���TMP_AC_PRJ_INVESTMENT�������'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTMENT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     delete from tmp_ac_prj_investment;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '���TMP_AC_PRJ_INVESTMENT����������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTMENT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_INVESTMENT����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTMENT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

    /*���뿪����˾��Ͷ���ܶ���ʱ�������*/
     insert into tmp_ac_prj_investment(project_id,project_code,originalamount,currentamount,contractcode,description,create_date,modified_date,version_status,version,latestversion,approvalstae,bus_date,src_table,src_system,sort_id)
      select
            t1.project_id,
            t1.project_shortname,
            t1.totalinvest,
            c.currentinvest,
            t1.contract_id,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT',
            v_sortid_lc
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from lc_prj_investment s group by s.project_id) a,
           (select project_id,sum(thisyearinvest) currentinvest from src0202_pln_project group by project_id) c
    where  t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')-1
       and t1.project_id=a.project_id
       and t1.project_id=c.project_id
       and t1.program_id='195'
    union all
    select  t1.project_id,
            t1.project_shortname,
            t1.totalinvest,
            c.currentinvest,
            t1.contract_id,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT',
            v_sortid_lc
      from src0202_pln_project t1,
           (select project_id,sum(thisyearinvest) currentinvest from src0202_pln_project group by project_id) c
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')-1
       and t1.project_id=c.project_id
       and t1.program_id='195'
       and t1.project_id not in (select s.project_id from lc_prj_investment s );

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_INVESTMENT�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTMENT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����LC_PRJ_INVESTMENT�������У���SRC0202_PLN_PROJECT����Ҫ�޸ĵ���Ч�汾����Ϊ��Ч'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name2, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     update lc_prj_investment s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_investment t);

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����LC_PRJ_INVESTMENT�İ汾���ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name2, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��TMP_AC_PRJ_INVESTMENT�����ݲ��뵽LC_PRJ_INVESTMENT����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name2, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     insert into lc_prj_investment select * from tmp_ac_prj_investment;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����LC_PRJ_INVESTMENT������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name2, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ���TMP_AC_PRJ_INVESTMENT�������'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTMENT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     delete from tmp_ac_prj_investment;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '���TMP_AC_PRJ_INVESTMENT����������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTMENT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '��ʼ����sys_md_apply_cfg���е�����'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

    /*���sys_md_apply_cfg����û�����Ŀ�������Ҫ���*/
    merge into sys_md_apply_cfg b
          using(select sys_guid() next_cfgid from dual)s
          on(b.tablename='AC_PRJ_INVESTMENT')
    when not matched then
         insert (cfg_id,
                 tablename
                 )
         values (
                 s.next_cfgid,
                 'AC_PRJ_INVESTMENT'
                 );
    merge into sys_md_apply_cfg b
          using(select sys_guid() next_cfgid from dual)s
          on(b.tablename='LC_PRJ_INVESTMENT')
    when not matched then
         insert (cfg_id,
                 tablename
                 )
         values (
                 s.next_cfgid,
                 'LC_PRJ_INVESTMENT'
                 );
    v_effect_rows := sql%rowcount; --��ЧӰ������
    commit;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '����sys_md_apply_cfg���е����ݽ���'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����sys_md_select_cfg���е�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
     /*���������ݼ�������ѡ��������*/
     merge into sys_md_select_cfg c
           using(select sys_guid() next_cfgid from dual)s
              on(c.tab_en_nm=v_tab_name1 and c.attri_en_nm='BUS_DATE' and c.value=to_char(to_date(iv_date,'yyyymmdd'),'yyyy-mm-dd'))
      when not matched then
           insert (
                   select_id,
                   tab_en_nm,
                   attri_en_nm,
                   value
                  )
           values (
                   s.next_cfgid,
                   v_tab_name1,
                   'BUS_DATE',
                   to_char(to_date(iv_date,'yyyymmdd'),'yyyy-mm-dd')
                  );
     merge into sys_md_select_cfg c
           using(select sys_guid() next_cfgid from dual)s
              on(c.tab_en_nm=v_tab_name2 and c.attri_en_nm='BUS_DATE' and c.value=to_char(to_date(iv_date,'yyyymmdd'),'yyyy-mm-dd'))
      when not matched then
           insert (
                   select_id,
                   tab_en_nm,
                   attri_en_nm,
                   value
                  )
           values (
                   s.next_cfgid,
                   v_tab_name2,
                   'BUS_DATE',
                   to_char(to_date(iv_date,'yyyymmdd'),'yyyy-mm-dd')
                  );                  
     v_effect_rows := sql%rowcount; --��ЧӰ������
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����sys_md_select_cfg���е����ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��   
  /*************************��������***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '����ִ�����'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name2, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********�쳣����Ҳ������������Ҫ�����쳣���Ƶĵط������쳣����*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into ac_prj_investment fail: ' || substr(sqlerrm, 1, 300); --�쳣��־��Ϣ
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_PRJ_LAND
prompt ===============================
prompt
create or replace procedure prc_prj_land ---�ؿ���Ϣ��
(
    iv_date    in varchar2  -- ����ͳ�����ڣ���ʽ��yyyymmdd
)
is
/*************************************************************************************************
  * Ŀ���AC_PRJ_LAND��LC_PRJ_LAND(�ؿ���Ϣ��)
  * Դ��SRC0202_PLN_PROJECT
  * ��ʽ��     ����
  * ����Ƶ�ȣ� ����
  * ������˵��: ������Ŀ����йصؿ���Ϣ�������
  * ��������� iv_date    �������ڣ���ʽ��yyyymmdd
  * ��������� ��
  * ���ߣ�        ����
  * �������ڣ�    2017-7-11
  *
  * �޸ļ�¼
  *************************************************************************************************
  * �޸���                  �޸�����          �޸�����
  *************************************************************************************************/
  v_proc_name   varchar2(32) := 'PRC_AC_PRJ_LAND'; --�洢������
  v_tab_name    varchar2(32) := 'AC_PRJ_LAND';
  v_step_name   varchar2(200):= '���صؿ���Ϣ������'; --��������
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --����ʱ��
  v_error_flag  varchar2(4)  := '0'; --�����־��0��������1������
  v_log_mess    varchar2(300) := 'merge into ac_prj_land normal'; --��־��Ϣ
  v_effect_rows number := 0; --��ЧӰ������
  v_proc_id     number := seq_proc_log.nextval; --�洢���̵�ID��
  v_sortid_ac   number;
  v_sortid_lc   number;
begin
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '����ʼִ��'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   
    select nvl(max(sort_id),0)+1 into v_sortid_ac from ac_prj_land ;--��ȡac_prj_land�������������
    
    select nvl(max(sort_id),0)+1 into v_sortid_lc from lc_prj_land ;--��ȡlc_prj_land�������������

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ���TMP_AC_PRJ_LAND�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LAND', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

   delete from tmp_ac_prj_land;

   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '���TMP_AC_PRJ_LAND����������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LAND', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ���Ŀ���ִ��ʱ�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

   delete from ac_prj_land c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---ɾ����Ҫ���ܵ�����
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;
           
   delete from lc_prj_land c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---ɾ����Ҫ���ܵ�����
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;

   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '���Ŀ���ִ��ʱ������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_LAND����'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LAND', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

  /*�����ί��ĵؿ���Ϣ��ʱ�������*/
    insert into tmp_ac_prj_land(project_id,project_code,code,arrivesate,description,create_date, modified_date, version_status, version, latestversion, approvalstae, bus_date,src_table,src_system,sort_id)
     select
            t1.project_id,
            t1.project_shortname,
            t1.dikuai_code,
            t1.plan_state,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT',
            v_sortid_ac
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from ac_prj_land s group by s.project_id) a
    where  t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.project_id=a.project_id
       and t1.program_id='194'
    union all
    select  t1.project_id,
            t1.project_shortname,
            t1.dikuai_code,
            t1.plan_state,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT',
            v_sortid_ac
      from src0202_pln_project t1
    where  t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.program_id='194'
       and t1.project_id not in (select s.project_id from ac_prj_land s );

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_LAND�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LAND', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����AC_PRJ_LAND�������У���SRC0202_PLN_PROJECT����Ҫ�޸ĵ���Ч�汾����Ϊ��Ч'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     update ac_prj_land s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_land t);

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����AC_PRJ_LAND�İ汾���ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��TMP_AC_PRJ_LAND�����ݲ��뵽AC_PRJ_LAND����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     insert into ac_prj_land select * from tmp_ac_prj_land;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����AC_PRJ_LAND������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ���TMP_AC_PRJ_LAND�������'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LAND', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     delete from tmp_ac_prj_land;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '���TMP_AC_PRJ_LAND����������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LAND', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_LAND����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LAND', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

  /*���뿪����˾�ĵؿ���Ϣ��ʱ�������*/
    insert into tmp_ac_prj_land(project_id,project_code,code,arrivesate,description,create_date, modified_date, version_status, version, latestversion, approvalstae, bus_date,src_table,src_system,sort_id)
     select
            t1.project_id,
            t1.project_shortname,
            t1.dikuai_code,
            t1.plan_state,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT',
            v_sortid_lc
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from lc_prj_land s group by s.project_id) a
    where  t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.project_id=a.project_id
       and t1.program_id='194'
    union all
    select  t1.project_id,
            t1.project_shortname,
            t1.dikuai_code,
            t1.plan_state,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT',
            v_sortid_lc
      from src0202_pln_project t1
    where  t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.program_id='194'
       and t1.project_id not in (select s.project_id from lc_prj_land s );

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_LAND�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LAND', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����LC_PRJ_LAND�������У���SRC0202_PLN_PROJECT����Ҫ�޸ĵ���Ч�汾����Ϊ��Ч'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     update lc_prj_land s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_land t);

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����LC_PRJ_LAND�İ汾���ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��TMP_AC_PRJ_LAND�����ݲ��뵽LC_PRJ_LAND����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     insert into lc_prj_land select * from tmp_ac_prj_land;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����LC_PRJ_LAND������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ���TMP_AC_PRJ_LAND�������'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LAND', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     delete from tmp_ac_prj_land;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '���TMP_AC_PRJ_LAND����������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LAND', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '��ʼ����sys_md_apply_cfg���е�����'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
    
    /*���sys_md_apply_cfg����û�����Ŀ�������Ҫ���*/
    merge into sys_md_apply_cfg b
          using(select sys_guid() next_cfgid from dual)s
          on(b.tablename='AC_PRJ_LAND')
    when not matched then
         insert (cfg_id,
                 tablename
                 )
         values (
                 s.next_cfgid,
                 'AC_PRJ_LAND'
                 );
    merge into sys_md_apply_cfg b
          using(select sys_guid() next_cfgid from dual)s
          on(b.tablename='LC_PRJ_LAND')
    when not matched then
         insert (cfg_id,
                 tablename
                 )
         values (
                 s.next_cfgid,
                 'LC_PRJ_LAND'
                 );    
    v_effect_rows := sql%rowcount; --��ЧӰ������
    commit;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '����sys_md_apply_cfg���е����ݽ���'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

  /*************************��������***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '����ִ�����'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********�쳣����Ҳ������������Ҫ�����쳣���Ƶĵط������쳣����*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into ac_prj_land fail: ' || substr(sqlerrm, 1, 300); --�쳣��־��Ϣ
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_PRJ_LANDPRJ
prompt ==================================
prompt
create or replace procedure prc_prj_landprj ---���ؾ�Ӫ����Ŀ������Ϣ
(
    iv_date    in varchar2  -- ����ͳ�����ڣ���ʽ��yyyymmdd
)
is
/*************************************************************************************************
  * Ŀ���AC_PRJ_LANDPRJ��LC_PRJ_LANDPRJ(���ؾ�Ӫ����Ŀ������Ϣ)
  * Դ��SRC0202_PLN_PROJECT
  * ��ʽ��     ����
  * ����Ƶ�ȣ� ����
  * ������˵��: ������Ŀ����й����ؾ�Ӫ����Ŀ������Ϣ������
  * ��������� iv_date    �������ڣ���ʽ��yyyymmdd
  * ��������� ��
  * ���ߣ�        ����
  * �������ڣ�    2017-7-11
  *
  * �޸ļ�¼
  *************************************************************************************************
  * �޸���                  �޸�����          �޸�����
  *************************************************************************************************/
  v_proc_name   varchar2(32) := 'PRC_PRJ_LANDPRJ'; --�洢������
  v_tab_name1   varchar2(32) := 'AC_PRJ_LANDPRJ';
  v_tab_name2   varchar2(32) := 'LC_PRJ_LANDPRJ';
  v_step_name   varchar2(200):= '�������ؾ�Ӫ����Ŀ������Ϣ������'; --��������
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --����ʱ��
  v_error_flag  varchar2(4)  := '0'; --�����־��0��������1������
  v_log_mess    varchar2(300) := 'merge into ac_prj_landprj normal'; --��־��Ϣ
  v_effect_rows number := 0; --��ЧӰ������
  v_proc_id     number := seq_proc_log.nextval; --�洢���̵�ID��
  v_sortid_ac   number;
  v_sortid_lc   number;
begin
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '����ʼִ��'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

    select nvl(max(sort_id),0)+1 into v_sortid_ac from ac_prj_landprj ;--��ȡAC_PRJ_LANDPRJ�������������

    select nvl(max(sort_id),0)+1 into v_sortid_lc from lc_prj_landprj ;--��ȡLC_PRJ_LANDPRJ�������������

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ���TMP_AC_PRJ_LANDPRJ�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

   delete from tmp_ac_prj_landprj;

   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '���TMP_AC_PRJ_LANDPRJ����������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ���Ŀ���ִ��ʱ�������'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

   delete from ac_prj_landprj c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---ɾ����Ҫ���ܵ�����
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;

   delete from LC_PRJ_LANDPRJ c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---ɾ����Ҫ���ܵ�����
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;

   v_effect_rows := sql%rowcount; --��ЧӰ������
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '���Ŀ���ִ��ʱ������ݽ���'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '��ʼ��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_LANDPRJ����'; --��������
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

  /*�����ί������ؾ�Ӫ����Ŀ������Ϣ��ʱ�������*/
    insert into tmp_ac_prj_landprj(project_id,project_code,project_name,projecttypecode,targetbegintime,targetendtime,actbegintime,actendtime,investamount,investamountyear,projectscale,projectcontent,projectaddr,
                                    desctext,land_code,land_arrivesate,description,create_date,modified_date,version_status,version,latestversion,approvalstae,bus_date,src_table,src_system,sort_id)
     select
            t1.project_id,
            t1.project_shortname,
            t1.project_name,
            t1.project_type,
            t1.target_start_date,
            t1.target_end_date,
            t1.target_end_date,
            t1.act_end_date,
            t1.totalinvest,
            t1.thisyearinvest,
            t1.scale,
            t1.content,
            t1.project_address,
            t1.remark,
            t1.dikuai_code,
            t1.plan_state,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT',
            v_sortid_ac
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from ac_prj_landprj s group by s.project_id) a
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')-1
       and t1.project_id=a.project_id
       and t1.program_id='194'
    union all
      select
            t1.project_id,
            t1.project_shortname,
            t1.project_name,
            t1.project_type,
            t1.target_start_date,
            t1.target_end_date,
            t1.target_end_date,
            t1.act_end_date,
            t1.totalinvest,
            t1.thisyearinvest,
            t1.scale,
            t1.content,
            t1.project_address,
            t1.remark,
            t1.dikuai_code,
            t1.plan_state,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT'��
            v_sortid_ac
      from src0202_pln_project t1
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')-1
       and t1.program_id='194'
       and t1.project_id not in (select s.project_id from ac_prj_landprj s );

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_LANDPRJ�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����AC_PRJ_LANDPRJ�������У���PLN_PROJECT����Ҫ�޸ĵ���Ч�汾����Ϊ��Ч'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     update ac_prj_landprj s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_landprj t);

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����AC_PRJ_LANDPRJ�İ汾���ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��TMP_AC_PRJ_LANDPRJ�����ݲ��뵽AC_PRJ_LANDPRJ����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     insert into ac_prj_landprj select * from tmp_ac_prj_landprj;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����AC_PRJ_LANDPRJ������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ���TMP_AC_PRJ_LANDPRJ�������'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     delete from tmp_ac_prj_landprj;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '���TMP_AC_PRJ_LANDPRJ����������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_LANDPRJ����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

 /*���뿪����˾�����ؾ�Ӫ����Ŀ������Ϣ��ʱ�������*/
    insert into tmp_ac_prj_landprj(project_id,project_code,project_name,projecttypecode,targetbegintime,targetendtime,actbegintime,actendtime,investamount,investamountyear,projectscale,projectcontent,projectaddr,
                                    desctext,land_code,land_arrivesate,description,create_date,modified_date,version_status,version,latestversion,approvalstae,bus_date,src_table,src_system,sort_id)
      select
            t1.project_id,
            t1.project_shortname,
            t1.project_name,
            t1.project_type,
            t1.target_start_date,
            t1.target_end_date,
            t1.target_end_date,
            t1.act_end_date,
            t1.totalinvest,
            t1.thisyearinvest,
            t1.scale,
            t1.content,
            t1.project_address,
            t1.remark,
            t1.dikuai_code,
            t1.plan_state,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT'��
            v_sortid_lc
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from lc_prj_landprj s group by s.project_id) a
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')-1
       and t1.project_id=a.project_id
       and t1.program_id='195'
     union all
      select
            t1.project_id,
            t1.project_shortname,
            t1.project_name,
            t1.project_type,
            t1.target_start_date,
            t1.target_end_date,
            t1.target_end_date,
            t1.act_end_date,
            t1.totalinvest,
            t1.thisyearinvest,
            t1.scale,
            t1.content,
            t1.project_address,
            t1.remark,
            t1.dikuai_code,
            t1.plan_state,
            '�洢���̵���',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMSϵͳ',
            'SRC0202_PLN_PROJECT',
            v_sortid_lc
      from src0202_pln_project t1
     where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --���¹�����
       and t1.update_date<=to_date(iv_date,'yyyymmdd')-1
       and t1.program_id='195'
       and t1.project_id not in (select s.project_id from lc_prj_landprj s );

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ȡSRC0202_PLN_PROJECT�����ݲ�����µ�TMP_AC_PRJ_LANDPRJ�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����LC_PRJ_LANDPRJ�������У���SRC0202_PLN_PROJECT����Ҫ�޸ĵ���Ч�汾����Ϊ��Ч'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'LC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     update lc_prj_landprj s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_landprj t);

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����LC_PRJ_LANDPRJ�İ汾���ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'LC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ��TMP_AC_PRJ_LANDPRJ�����ݲ��뵽LC_PRJ_LANDPRJ����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'LC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     insert into lc_prj_landprj select * from tmp_ac_prj_landprj;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����LC_PRJ_LANDPRJ������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'LC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ���TMP_AC_PRJ_LANDPRJ�������'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     delete from tmp_ac_prj_landprj;

     v_effect_rows := sql%rowcount; --��ЧӰ������
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '���TMP_AC_PRJ_LANDPRJ����������ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     commit;

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '��ʼ����sys_md_apply_cfg���е�����'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

    /*���sys_md_apply_cfg����û�����Ŀ�������Ҫ���*/
    merge into sys_md_apply_cfg b
          using(select sys_guid() next_cfgid from dual)s
          on(b.tablename='AC_PRJ_LANDPRJ')
    when not matched then
         insert (cfg_id,
                 tablename
                 )
         values (
                 s.next_cfgid,
                 'AC_PRJ_LANDPRJ'
                 );
    merge into sys_md_apply_cfg b
          using(select sys_guid() next_cfgid from dual)s
          on(b.tablename='LC_PRJ_LANDPRJ')
    when not matched then
         insert (cfg_id,
                 tablename
                 )
         values (
                 s.next_cfgid,
                 'LC_PRJ_LANDPRJ'
                 );
    v_effect_rows := sql%rowcount; --��ЧӰ������
    commit;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '����sys_md_apply_cfg���е����ݽ���'; --��������
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '��ʼ����sys_md_select_cfg���е�����'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��
     
     /*���������ݼ�������ѡ��������*/
     merge into sys_md_select_cfg c
           using(select sys_guid() next_cfgid from dual)s
              on(c.tab_en_nm=v_tab_name1 and c.attri_en_nm='BUS_DATE' and c.value=to_char(to_date(iv_date,'yyyymmdd'),'yyyy-mm-dd'))
      when not matched then
           insert (
                   select_id,
                   tab_en_nm,
                   attri_en_nm,
                   value
                  )
           values (
                   s.next_cfgid,
                   v_tab_name1,
                   'BUS_DATE',
                   to_char(to_date(iv_date,'yyyymmdd'),'yyyy-mm-dd')
                  );
     merge into sys_md_select_cfg c
           using(select sys_guid() next_cfgid from dual)s
              on(c.tab_en_nm=v_tab_name2 and c.attri_en_nm='BUS_DATE' and c.value=to_char(to_date(iv_date,'yyyymmdd'),'yyyy-mm-dd'))
      when not matched then
           insert (
                   select_id,
                   tab_en_nm,
                   attri_en_nm,
                   value
                  )
           values (
                   s.next_cfgid,
                   v_tab_name2,
                   'BUS_DATE',
                   to_char(to_date(iv_date,'yyyymmdd'),'yyyy-mm-dd')
                  );                  
     v_effect_rows := sql%rowcount; --��ЧӰ������
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '����sys_md_select_cfg���е����ݽ���'; --��������
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --��ʼʱ��   
  /*************************��������***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '����ִ�����'; --��������
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name2, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********�쳣����Ҳ������������Ҫ�����쳣���Ƶĵط������쳣����*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into ac_prj_landprj fail: ' || substr(sqlerrm, 1, 300); --�쳣��־��Ϣ
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_SQL_CHECK
prompt ================================
prompt
create or replace procedure prc_sql_check
(
 iv_proc      in varchar2,--��������´洢�������
 iv_sql       in varchar2,--�ṩ��sql���
 oi_err_msg   out varchar2,--����sql������Ϣ
 oi_return    out integer, --����sql����ı�־λ
 oc_sql_data  out sys_refcursor, --���ؽ����
 oi_tabname   out sys_refcursor, --����sql��ѯ�ı���
 oi_viewname  out sys_refcursor --����sql��ѯ����ͼ��
)
is
tab_cnt varchar2(10);---ͳ��sql����������ѯ��ĸ���
sql_cnt number;
vv_sql  varchar2(10000);
begin
   
   vv_sql := 'select count(1)  from ('|| '' ||iv_sql|| '' ||')';
   execute immediate vv_sql into sql_cnt;
   execute immediate iv_proc;
   
   select sum(tab_cnt1) into tab_cnt
   from (
         select count(a.referenced_name) tab_cnt1
           from user_dependencies a
          where a.type ='PROCEDURE'
            and a.name = 'PRC_SQL_EXC'
            and a.referenced_type = 'TABLE'
            and a.referenced_name in( select t.tar_tab_en_nm
                                        from meta_tar_entity t  --���ñ�
                                       where t.versionstatus=1)
         union all
         select count(a.referenced_name) tab_cnt1
           from user_dependencies a
          where a.type ='PROCEDURE'
            and a.name = 'PRC_SQL_EXC'
            and a.referenced_type = 'VIEW'
            and a.referenced_name in(select upper(view_name) from snap_views)
         union all
         select count(a.referenced_name) tab_cnt1
           from user_dependencies a
          where a.type ='PROCEDURE'
           and a.name = 'PRC_SQL_EXC'
           and a.referenced_type = 'VIEW'
           and a.referenced_name in(select upper(snap_viewname) from snap_config where snap_type='M')
           );
      
    if tab_cnt =0 
    then
        oi_return :=-2; --sqlִ�еı��ڹ涨�����ñ�����ѯ�ı��ǲ������ѯ�ı�����-2
        oi_err_msg :='û��Ȩ�޲�ѯsql����еı�';
    else
        open oc_sql_data for iv_sql ;
        open oi_viewname for   select a.referenced_name
                                from user_dependencies a
                               where a.type ='PROCEDURE'
                                 and a.name = 'PRC_SQL_EXC'
                                 and a.referenced_type = 'VIEW'
                                 and a.referenced_name in(select upper(snap_viewname) from snap_config where snap_type='M')
                              union all
                              select a.referenced_name  
                               from user_dependencies a
                               where a.type ='PROCEDURE'
                                 and a.name = 'PRC_SQL_EXC'
                                 and a.referenced_type = 'VIEW'
                                 and a.referenced_name in(select upper(view_name) from snap_views);  
        open oi_tabname for  select a.referenced_name
                               from user_dependencies a
                               where a.type ='PROCEDURE'
                                 and a.name = 'PRC_SQL_EXC'
                                 and a.referenced_type = 'TABLE'
                                 and a.referenced_name in( select t.tar_tab_en_nm
                                                             from meta_tar_entity t 
                                                             where t.versionstatus=1);
           oi_return :=0; --sqlִ�гɹ�����0
    end if;
exception
  when others then
    oi_err_msg  := substr(sqlerrm, 1, 300);
    oi_return :=-1;  --sql���ִ��ʧ��,����-1
end;
/

prompt
prompt Creating procedure PRC_SQL_EXC
prompt ==============================
prompt
create or replace procedure prc_sql_exc is exc_sql_cnt integer; begin select count(1) into exc_sql_cnt from (select * from(SELECT DESCRIPTION,CREATOR_ID,CREATOR FROM LEG_PER_BASIC_INFO WHERE 1=1  AND LEG_PER_BASIC_INFO.PATCH_CODE='proc_patch' AND (LEG_PER_BASIC_INFO.REG_NUM,LEG_PER_BASIC_INFO.VERSION) IN (SELECT LEG_PER_BASIC_INFO.REG_NUM, MAX(LEG_PER_BASIC_INFO.VERSION) VERSION FROM LEG_PER_BASIC_INFO WHERE LEG_PER_BASIC_INFO.PATCH_CODE = 'proc_patch' GROUP BY LEG_PER_BASIC_INFO.REG_NUM)) where 1=1 and rownum < 10) s; end;
/

prompt
prompt Creating procedure PRC_TAR_DOMAINCHANGE
prompt =======================================
prompt
CREATE OR REPLACE PROCEDURE PRC_TAR_DOMAINCHANGE is
 add_num number;
 reduce_num number;
 change_num number;
cursor cs is  select sub_domain_id,SUB_DOMAIN_NAME,count(TAR_ENTITY_ID) as num from
                  meta_tar_entity
                  where VERSIONSTATUS = 1
                  and to_char(COLLECTTIME,'yyyy-MM') = to_char(sysdate,'yyyy-mm')
                  group by sub_domain_name, sub_domain_id;
    begin
    execute immediate 'delete  tab_datastructure_change where to_char(collecttime,''yyyy-mm'')=to_char(sysdate,''yyyy-mm'')';
    for c in cs loop
        BEGIN
        select c.num-num1.num into add_num from(
            select version,count(TAR_ENTITY_ID) as num
            from meta_tar_entity
            where to_char(COLLECTTIME,'yyyy-mm')=to_char(sysdate,'yyyy-mm')
            and sub_domain_id = c.sub_domain_id
            group by version
            order by version
          ) num1
          where rownum = 1;


       if add_num>0 then reduce_num:=0;
          else reduce_num:=0- add_num;
              add_num:=0;
       end if;


        select count(*) into change_num from
        (
          select TAR_TAB_EN_NM,count(TAR_TAB_EN_NM) as change_num
                  from meta_tar_entity
                  where to_char(COLLECTTIME,'yyyy-mm')=to_char(sysdate,'yyyy-mm')
                  and sub_domain_id = c.sub_domain_id
          group by TAR_TAB_EN_NM
        ) tar
        where tar.change_num >1;

        insert into tab_datastructure_change(SUBJECTDOMAIN,ADDTABNUMBER,REDUCETABNUMBER,CHANGETABNUMBER,COLLECTTIME)
              values(c.sub_domain_name, add_num, reduce_num, change_num,sysdate);

        END;
  end loop;
  commit;
end;
/


spool off
