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
--此存储过程用来将编码表CODE_CODING_TYPE初始化入DATA_CONFIG配置表
  CURSOR jgj IS
   select CODING_TYPE_CODE,CODING_CLASSIFY from CODE_CODING_TYPE;
   obj  jgj%ROWTYPE;
   typecodin varchar2(40);--标准编码过滤值
   isdata INTEGER;--增量判断
   istype varchar2(20);--编码类型（判断是自定义编码还是标准编码）
   typecode varchar2(40);--自定义编码过滤值
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
         VALUES(dataConfig_seq.NEXTVAL,'code_custom','code_name,code_value,',typecode,'0 0 0 * * ?','自定义编码','code_name:自定义编码名称//code_value:自定义编码值//','1','1');
      end if;

        INSERT INTO DATA_CONFIG ( CONFIG_ID,TABLENAME,TABLEFIELD,FILTER_CON,SERVICETIME,TABLECNNAME,TABLECNFIELD,RESPONSETYPE,DATATYPE)
         VALUES(dataConfig_seq.NEXTVAL,'code_coding','coding_name,coding_code,',typecodin,'0 0 0 * * ?','标准编码','coding_name:标准编码名称//coding_code:标准编码值//','1','1');
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
CREATE OR REPLACE PROCEDURE prc_proc_log(v_proc_id     IN NUMBER,  ---存储过程的ID标识
                                         iv_date       IN VARCHAR2,---数据统计日期
                                         v_proc_name   IN VARCHAR2,---存储过程名称
                                         v_tab_name    IN VARCHAR2,---目标表名
                                         v_step_name   IN VARCHAR2,---步骤名称
                                         v_begin_time  IN VARCHAR2,---存储过程执行的开始时间
                                         v_end_time    IN VARCHAR2,---存储过程执行的结束时间
                                         v_error_flag  IN VARCHAR2,-----错误标志（0，正常；1，错误）
                                         v_log_mess    IN VARCHAR2,-----日志信息
                                         v_effect_rows IN NUMBER)  -----有效记录
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
  iv_date    in varchar2  -- 数据统计日期，格式：yyyymm
)
is
/***************************************************************************************************
  * 目标表：SNAP_VIEWS（快照视图表）
  * 源表：SNAP_CONFIG(快照配置表)

  * 方式：     增量
  * 运行频度： 按需
  * 任务功能说明: 根据快照配置表创建周期性的快照视图
  * 输入参数： iv_date    处理日期，格式：yyyymmdd

  * 输出参数： 无
  * 作者：        黄蓉
  * 创建日期：    2017-8-4
  *
  * 修改记录
  **************************************************************************************************
  * 修改人                  修改日期          修改内容
  *************************************************************************************************/
  v_proc_name   varchar2(32) := 'CREATE_SNAPVIEW'; --存储过程名
  v_tab_name    varchar2(32) := 'SNAP_CONFIG';--目标表名
  v_step_name   varchar2(100):= '创建周期性的快照视图'; --步骤名称
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --结束时间
  v_error_flag  varchar2(4)  := '0'; --错误标志（0，正常；1，错误）
  v_log_mess    varchar2(300):='insert into snap_views normal'; --日志信息
  v_effect_rows number := 0; --有效影响行数
  v_proc_id     number := seq_proc_log.nextval; --存储过程的ID号
  v_createview_sql varchar2(10000);  /*创建视图的语句*/
  v_snap_views     varchar2(1000);   /*删除已有的快照视图表的记录*/
  v_sql_tmp1       varchar2(1000);  /*记录创建快照视图as前的字符串*/
  v_sql_tmp2       varchar2(1000);  /*拼接视图中sql的筛选满足修改时间内最新记录的主表的字符串*/
  v_sql_tmp3       varchar2(1000);  /*v_sql_tmp2去掉最后一个逗号*/
  v_sql_tmp4       varchar2(1000);  /*拼接视图中sql的筛选满足修改时间内最新记录的关联表的字符串*/
  v_sql_tmp5       varchar2(1000); /*v_sql_tmp4去掉最后一个逗号*/
  v_sql_tmp6       varchar2(1000); /*截取所给sql的选择字段*/
  v_sql_tmp7       varchar2(1000); /*截取配置表中sql的on之后的所有条件*/
  v_sql_con1       varchar2(1000);/*筛选主表最新的记录条件*/
  v_sql_con2       varchar2(1000);/*筛选关联表最新的记录条件*/
  v_busdate        varchar2(1000);  /*记录配置表中业务日期分隔后每个主数据对应的业务日期*/
  bus_indx         number  :=0;     /*业务日期循环计数*/
  v_mtabnames      varchar2(1000);  /*主表数组集合*/
  v_mtabname       varchar2(1000);
  v_ctabnames      varchar2(1000);   /*关联表数组集合*/
  v_ctabname       varchar2(1000);
  v_uniq_key       varchar2(1000);  /*记录主数据表的逻辑主键字段*/
  mtab_indx        number  :=0; /*主表循环计数*/
  mtab_cnt         number;  /*统计主表的个数*/
  ctab_indx        number  :=0; /*关联表循环计数*/
  ctab_cnt         number;  /*统计关联表的个数*/
  cursor c_viewname is select snap_tabname,--快照的主数据表名
                              snap_viewname,--快照的视图名
                              view_type,--快照视图的依据类型
                              patch_code,--主数据的业务日期
                              sql_text --创建快照视图的依据sql
                        from snap_config where snap_type='C';
  c_row c_viewname%rowtype;
begin
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '程序开始执行'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, 'Procedure begins successfully', v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  
  /*创建视图*/
  for c_row in c_viewname loop
      v_effect_rows := 0;
      v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
      v_step_name:= '开始删除snap_views表中含有当前视图名称的数据'; --步骤名称
      prc_proc_log(v_proc_id,iv_date,v_proc_name,''  || c_row.snap_viewname  ||'', v_step_name, v_begin_time, v_end_time, v_error_flag, 'create view '  || c_row.snap_viewname  ||' normal', v_effect_rows);
      v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
      
      v_snap_views :='delete from snap_views where view_name='||''''||c_row.snap_viewname||'_'||iv_date||''''||'';

      --dbms_output.put_line(v_snap_views);
      execute immediate v_snap_views;

      v_effect_rows := sql%rowcount; --有效影响行数
      v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
      v_step_name:= '删除删除snap_views表中含有当前视图名称的数据结束'; --步骤名称
      prc_proc_log(v_proc_id,iv_date,v_proc_name,''  || c_row.snap_viewname  ||'', v_step_name, v_begin_time, v_end_time, v_error_flag, 'create view '  || c_row.snap_viewname  ||' normal', v_effect_rows);
      v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
      commit;
             
      v_sql_tmp1 :='create view  '||c_row.snap_viewname||'_'||iv_date||' as ';
      if c_row.view_type = 'V'
      then
         if instr(c_row.sql_text,'INNER JOIN',1,1)!=0
         then 
           /*截取主表字符串*/
             v_mtabnames :=replace(substr(c_row.sql_text,instr(c_row.sql_text,'FROM',1,1)+4,instr(c_row.sql_text,'INNER',1,1)-instr(c_row.sql_text,'FROM',1,1)-4),' ','');
             v_ctabnames :=replace(substr(c_row.sql_text,instr(c_row.sql_text,'JOIN',1,1)+4,instr(c_row.sql_text,' ON',1,1)-instr(c_row.sql_text,'JOIN',1,1)-3),' ','');
             loop
                    bus_indx :=bus_indx+1;
                    select regexp_substr(c_row.patch_code, '[^,]+', 1, bus_indx) 
                      into v_busdate 
                      from dual;
                    mtab_indx :=mtab_indx+1;
                    /*从主表集合中以,为分隔符拆分主表*/
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
                    /*从关联表集合中以,为分隔符拆分主表*/
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
             v_step_name:= '开始创建'  || c_row.snap_viewname  ||'视图'; --步骤名称
             prc_proc_log(v_proc_id,iv_date,v_proc_name,''  || c_row.snap_viewname  ||'', v_step_name, v_begin_time, v_end_time, v_error_flag, 'create view '  || c_row.snap_viewname  ||' normal', v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
             
             execute immediate v_createview_sql;
             
             v_effect_rows := sql%rowcount; --有效影响行数
             v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
             v_step_name:= '创建'  || c_row.snap_viewname  ||'视图结束'; --步骤名称
             prc_proc_log(v_proc_id,iv_date,v_proc_name,''  || c_row.snap_viewname  ||'', v_step_name, v_begin_time, v_end_time, v_error_flag, 'create view '  || c_row.snap_viewname  ||' normal', v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
             commit;
             
             v_effect_rows := 0;
             v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
             v_step_name:= '开始插入视图信息到SNAP_VIEWS表中'; --步骤名称
             prc_proc_log(v_proc_id,iv_date,v_proc_name,'SNAP_VIEWS', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
                            
             /*视图创建后把视图信息插入到快照视图中*/
             insert into snap_views
                  select sys_guid(),
                         t.snap_id,
                         c_row.snap_viewname||'_'||iv_date,
                         sysdate,
                         ''
                    from snap_config t
                   where t.snap_viewname=c_row.snap_viewname;
                   
             v_effect_rows := sql%rowcount; --有效影响行数
             v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
             v_step_name:= '插入视图信息到SNAP_VIEWS表中结束'; --步骤名称
             prc_proc_log(v_proc_id,iv_date,v_proc_name,'SNAP_VIEWS', v_step_name, v_begin_time, v_end_time, v_error_flag,v_log_mess, v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
             commit; 
                      
          elsif instr(c_row.sql_text,'LEFT JOIN',1,1)!=0
          then
            /*截取主表字符串*/
             v_mtabnames := replace(substr(c_row.sql_text,instr(c_row.sql_text,'FROM',1,1)+4,instr(c_row.sql_text,'LEFT',1,1)-instr(c_row.sql_text,'FROM',1,1)-5),' ','');
             v_ctabnames :=replace(substr(c_row.sql_text,instr(c_row.sql_text,'JOIN',1,1)+4,instr(c_row.sql_text,' ON',1,1)-instr(c_row.sql_text,'JOIN',1,1)-3),' ','');
             loop
                bus_indx :=bus_indx+1;
                select regexp_substr(c_row.patch_code, '[^,]+', 1, bus_indx) 
                  into v_busdate 
                  from dual;        
                mtab_indx :=mtab_indx+1;
                /*从主表集合中以,为分隔符拆分主表*/
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
                /*从关联表集合中以,为分隔符拆分主表*/
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
             v_step_name:= '开始创建'  || c_row.snap_viewname  ||'视图'; --步骤名称
             prc_proc_log(v_proc_id,iv_date,v_proc_name,''  || c_row.snap_viewname  ||'', v_step_name, v_begin_time, v_end_time, v_error_flag, 'create view '  || c_row.snap_viewname  ||' normal', v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
             
             execute immediate v_createview_sql;
             
             v_effect_rows := sql%rowcount; --有效影响行数
             v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
             v_step_name:= '创建'  || c_row.snap_viewname  ||'视图结束'; --步骤名称
             prc_proc_log(v_proc_id,iv_date,v_proc_name,''  || c_row.snap_viewname  ||'', v_step_name, v_begin_time, v_end_time, v_error_flag, 'create view '  || c_row.snap_viewname  ||' normal', v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
             commit;
             
             v_effect_rows := 0;
             v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
             v_step_name:= '开始插入视图信息到SNAP_VIEWS表中'; --步骤名称
             prc_proc_log(v_proc_id,iv_date,v_proc_name,'SNAP_VIEWS', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
             /*视图创建后把视图信息插入到快照视图中*/
             insert into snap_views
                  select sys_guid(),
                         t.snap_id,
                         c_row.snap_viewname||'_'||iv_date,
                         sysdate,
                         ''
                    from snap_config t
                   where t.snap_viewname=c_row.snap_viewname;
                   
             v_effect_rows := sql%rowcount; --有效影响行数
             v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
             v_step_name:= '插入视图信息到SNAP_VIEWS表中结束'; --步骤名称
             prc_proc_log(v_proc_id,iv_date,v_proc_name,'SNAP_VIEWS', v_step_name, v_begin_time, v_end_time, v_error_flag,v_log_mess, v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
             commit;
           else
             /*截取主表字符串*/
             v_mtabnames :=replace(substr(c_row.sql_text,instr(c_row.sql_text,'FROM',1,1)+4,instr(c_row.sql_text,'RIGHT',1,1)-instr(c_row.sql_text,'FROM',1,1)-4),' ','');
             v_ctabnames :=replace(substr(c_row.sql_text,instr(c_row.sql_text,'JOIN',1,1)+4,instr(c_row.sql_text,' ON',1,1)-instr(c_row.sql_text,'JOIN',1,1)-3),' ','');
             loop
                bus_indx :=bus_indx+1;
                select regexp_substr(c_row.patch_code, '[^,]+', 1, bus_indx) 
                  into v_busdate 
                  from dual;
                mtab_indx :=mtab_indx+1;
                /*从主表集合中以,为分隔符拆分主表*/
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
                /*从关联表集合中以,为分隔符拆分主表*/
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
             v_step_name:= '开始创建'  || c_row.snap_viewname  ||'视图'; --步骤名称
             prc_proc_log(v_proc_id,iv_date,v_proc_name,''  || c_row.snap_viewname  ||'', v_step_name, v_begin_time, v_end_time, v_error_flag, 'create view '  || c_row.snap_viewname  ||' normal', v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
             
             execute immediate v_createview_sql;
             
             v_effect_rows := sql%rowcount; --有效影响行数
             v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
             v_step_name:= '创建'  || c_row.snap_viewname  ||'视图结束'; --步骤名称
             prc_proc_log(v_proc_id,iv_date,v_proc_name,''  || c_row.snap_viewname  ||'', v_step_name, v_begin_time, v_end_time, v_error_flag, 'create view '  || c_row.snap_viewname  ||' normal', v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
             commit;

             v_effect_rows := 0;
             v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
             v_step_name:= '开始插入视图信息到SNAP_VIEWS表中'; --步骤名称
             prc_proc_log(v_proc_id,iv_date,v_proc_name,'SNAP_VIEWS', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
             /*视图创建后把视图信息插入到快照视图中*/
             insert into snap_views
                  select sys_guid(),
                         t.snap_id,
                         c_row.snap_viewname||'_'||iv_date,
                         sysdate,
                         ''
                    from snap_config t
                   where t.snap_viewname=c_row.snap_viewname;

             v_effect_rows := sql%rowcount; --有效影响行数
             v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
             v_step_name:= '插入视图信息到SNAP_VIEWS表中结束'; --步骤名称
             prc_proc_log(v_proc_id,iv_date,v_proc_name,'SNAP_VIEWS', v_step_name, v_begin_time, v_end_time, v_error_flag,v_log_mess, v_effect_rows);
             v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
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
        v_step_name:= '开始创建'  || c_row.snap_viewname  ||'视图'; --步骤名称
        prc_proc_log(v_proc_id,iv_date,v_proc_name,''  || c_row.snap_viewname  ||'', v_step_name, v_begin_time, v_end_time, v_error_flag, 'create view '  || c_row.snap_viewname  ||' normal', v_effect_rows);
        v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
             
        execute immediate v_createview_sql;
             
        v_effect_rows := sql%rowcount; --有效影响行数
        v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
        v_step_name:= '创建'  || c_row.snap_viewname  ||'视图结束'; --步骤名称
        prc_proc_log(v_proc_id,iv_date,v_proc_name,''  || c_row.snap_viewname  ||'', v_step_name, v_begin_time, v_end_time, v_error_flag, 'create view '  || c_row.snap_viewname  ||' normal', v_effect_rows);
        v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
        commit;

        v_effect_rows := 0;
        v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
        v_step_name:= '开始插入视图信息到SNAP_VIEWS表中'; --步骤名称
        prc_proc_log(v_proc_id,iv_date,v_proc_name,'SNAP_VIEWS', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
        v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
        
        /*视图创建后把视图信息插入到快照视图中*/
         insert into snap_views
              select sys_guid(),
                     t.snap_id,
                     c_row.snap_viewname||'_'||iv_date,
                     sysdate,
                     ''
                 from snap_config t
                where t.snap_viewname=c_row.snap_viewname;
        v_effect_rows := sql%rowcount; --有效影响行数
        v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
        v_step_name:= '插入视图信息到SNAP_VIEWS表中结束'; --步骤名称
        prc_proc_log(v_proc_id,iv_date,v_proc_name,'SNAP_VIEWS', v_step_name, v_begin_time, v_end_time, v_error_flag,v_log_mess, v_effect_rows);
        v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
        commit;
     end if;
  end loop;
  
   /*************************正常处理***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '程序执行完成'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);  
    
  /**********异常处理，也可以在其它需要进行异常控制的地方加入异常处理*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'insert into snap_views fail: ' || substr(sqlerrm, 1, 300); --异常日志信息
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
  iv_date  in  varchar2  ---数据统计日期，格式：yyyymmdd
)
/*************************************************************************
  * 目标表：dim_age_range（年龄段维表）
  * 源表：

  * 方式：     增量
  * 运行频度： 按需
  * 任务功能说明: 更新dim_age_range年龄段维表的开始时间和结束时间数据
  * 输入参数： iv_date    处理日期，格式：yyyymmdd
  * 输出参数： 无
  * 作者：        黄蓉
  * 创建日期：    2017-2-27
  *
  * 修改记录
  *************************************************************************
  * 修改人                  修改日期          修改内容

  *************************************************************************/
is
  v_proc_name   varchar2(32) := 'PRC_DIM_AGE_RANGE'; --存储过程名
  v_tab_name    varchar2(32) := 'DIM_AGE_RANGE';
  v_step_name   varchar2(50) := '更新年龄段维表的开始时间和结束时间'; --步骤名称
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --结束时间
  v_error_flag  varchar2(4) := '0'; --错误标志（0，正常；1，错误）
  v_log_mess    varchar2(300) := 'update dim_age_range normal'; --日志信息
  v_effect_rows number := 0; --有效影响行数
  v_proc_id       number := seq_proc_log.nextval; --存储过程的ID号
begin
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '程序开始执行'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time  := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '开始更新dim_age_range年龄段维表的时间数据'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  
  /*更新年龄段维表的开始时间和结束时间*/
     update dim_age_range t
       set start_time =  case when t.to_now_months_max is null then '18000101'  ---开始时间的极限定为18000101
                           else  to_char(add_months(sysdate , 0-t.to_now_months_max )+1 ,'yyyymmdd') ---当前时间与最大月份之差计算为开始时间
                          end ,
            end_time  =  case when t.to_now_months_min is null then '99991231'   ---结束时间的极限定为99991231
                           else  to_char(add_months(sysdate , 0-t.to_now_months_min ) ,'yyyymmdd')   ----当前时间与最小月份之差计算为结束时间
                         end;
                       
   v_effect_rows := sql%rowcount; --有效影响行数                   
   commit;
      v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
      v_step_name:= '更新dim_age_range年龄段维表的时间数据结束'; --步骤名称
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
      v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    /*************************正常处理***************************************/
      v_effect_rows := 0;
      v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
      v_step_name:= '程序执行完成'; --步骤名称
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   
 /**********异常处理，也可以在其它需要进行异常控制的地方加入异常处理*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'update dim_age_range fail: ' || substr(sqlerrm, 1, 300); --异常日志信息
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;

end;
/

prompt
prompt Creating procedure PRC_DM_LEG_PER_BASIC_INFO
prompt ============================================
prompt
create or replace procedure prc_dm_leg_per_basic_info  ----法人信息汇总表
(
  iv_date  in  varchar2  ---数据统计日期，格式：yyyymmdd
)
/*************************************************************************
  * 目标表：dm_leg_per_basic_info（法人信息汇总表）
  * 源表：leg_per_basic_info（法人基本信息表）
          leg_per_reg_info（法人登记信息表）
          dim_idt_ctgr（行业门类维表）
          dim_reg_type（登记类型维表）

  * 方式：     增量
  * 运行频度： 按需
  * 任务功能说明: 插入法人信息汇总数据
  * 输入参数： iv_date    处理日期，格式：yyyymmdd
  * 输出参数： 无
  * 作者：        黄蓉
  * 创建日期：    2017-2-27
  *
  * 修改记录
  *************************************************************************
  * 修改人                  修改日期          修改内容

  *************************************************************************/
is
  v_proc_name   varchar2(32) := 'PRC_DM_LEG_PER_BASIC_INFO'; --存储过程名
  v_tab_name    varchar2(32) := 'DM_LEG_PER_BASIC_INFO';--目标表名
  v_step_name   varchar2(50) := '插入法人信息汇总数据'; --步骤名称
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --结束时间
  v_error_flag  varchar2(4) := '0'; --错误标志（0，正常；1，错误）
  v_log_mess    varchar2(300) := 'insert into dm_leg_per_basic_info normal'; --日志信息
  v_effect_rows number := 0; --有效影响行数
  v_proc_id     number := seq_proc_log.nextval; --存储过程的ID号
begin
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '程序开始执行'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  execute immediate 'truncate table dm_leg_per_basic_info';---更新表之前先清空表的数据


  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '开始插入dm_leg_per_basic_info表数据'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     /*插入行业门类、登记类型、统计法人数数据*/
     insert into dm_leg_per_basic_info(idt_ctgr_code,reg_type_code,leg_per_cnt)
          select 
                 nvl(t1.idt_ctgr_code,'9999'),  ---行业门类编码
                 t2.reg_type_code,     ---登记类型编码
                 count(tt1.reg_num)
           from  
                 leg_per_basic_info tt1,
                 leg_per_reg_info   tt2,
                 dim_idt_ctgr t1,
                 dim_reg_type t2
           where  tt1.reg_num = tt2.reg_num（+）---tt1的注册号多于或等于tt2表的
             and tt1.reg_type_code=t2.reg_type_code
             and tt2.idt_ctgr_code=t1.idt_ctgr_code(+)--和tt2表相关联的都要外联
        group by t1.idt_ctgr_code,
                 t2.reg_type_code;

      v_effect_rows := sql%rowcount; --有效影响行数
      commit;
      v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
      v_step_name:= '插入更新dm_leg_per_basic_info表的数据完成'; --步骤名称
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
      v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  /*************************正常处理***************************************/
    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '程序执行完成'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********异常处理，也可以在其它需要进行异常控制的地方加入异常处理*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'insert into dm_leg_per_basic_info fail: ' || substr(sqlerrm, 1, 300); --异常日志信息
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;

end ;
/

prompt
prompt Creating procedure PRC_DM_POP_BASIC_INFO
prompt ========================================
prompt
create or replace procedure prc_dm_pop_basic_info  ----人口信息汇总表
(
  iv_date  in  varchar2  ---数据统计日期，格式：yyyymmdd
)
/*************************************************************************
  * 目标表：dm_pop_basic_info(人口信息汇总表)
  * 源表：  pop_basic_info（人口基本信息表）
            dim_education  （学历维表）
            dim_age_range （年龄段维表）
            dim_childbbear_age（育龄妇女维表）
            dim_marry_status（婚姻状况维表）
            dim_region（地区维表）
            dim_sex （性别维表）

  * 方式：     增量
  * 运行频度： 按需
  * 任务功能说明: 插入人口汇总数据
  * 输入参数：iv_date    处理日期，格式：yyyymmdd
  * 输出参数： 无
  * 作者：        黄蓉
  * 创建日期：    2017-2-27
  *
  * 修改记录
  *************************************************************************
  * 修改人                  修改日期          修改内容

  *************************************************************************/
is
  v_proc_name   varchar2(32) := 'PRC_DM_POP_BASIC_INFO'; --存储过程名
  v_tab_name    varchar2(32) := 'DM_POP_BASIC_INFO';--目标表名
  v_step_name   varchar2(50) := '插入人口汇总数据'; --步骤名称
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --结束时间
  v_error_flag  varchar2(4) := '0'; --错误标志（0，正常；1，错误）
  v_log_mess    varchar2(300) := 'insert into dm_pop_basic_info normal'; --日志信息
  v_effect_rows number := 0; --有效影响行数
  v_proc_id     number := seq_proc_log.nextval; --存储过程的ID号
begin 
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '程序开始执行'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  
  execute immediate 'truncate table dm_pop_basic_info';---更新数据之前先清空表的数据
  

  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '开始插入dm_pop_basic_info表数据'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  
  /*以学历、年龄段、是否育龄、婚姻状况、地区、性别六个维度为组统计人口表的人数*/
     insert into dm_pop_basic_info
           (education_code,age_range_code,is_childbear_age_code,marry_status_code,region_code,sex_code,pop_cnt_1,pop_cnt_2,pop_cnt_3)
     select  c1.education_code ,--学历编码
             c21.age_range_code, --年龄段编码
             c3.is_childbear_age_code, --是否育龄编码
             c4.marry_status_code, --婚姻状况编码
             c5.region_code,  ---地区编码
             c6.sex_code,  ---性别编码
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
       and     nvl(tt.birthday , date'9999-12-31') >=  to_date(nvl(c21.start_time,'18000101'),'yyyymmdd')--判断出生日期是否在开始时间和结束时间之间
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
     select  c1.education_code ,--学历编码
             c22.age_range_code, --年龄段编码
             c3.is_childbear_age_code, --是否育龄编码
             c4.marry_status_code, --婚姻状况编码
             c5.region_code,  ---地区编码
             c6.sex_code,  ---性别编码
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
       and     nvl(tt.birthday , date'9999-12-31') >=  to_date(nvl(c22.start_time,'18000101'),'yyyymmdd')--判断出生日期是否在开始时间和结束时间之间
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
     select  c1.education_code ,--学历编码
             c23.age_range_code, --年龄段编码
             c3.is_childbear_age_code, --是否育龄编码
             c4.marry_status_code, --婚姻状况编码
             c5.region_code,  ---地区编码
             c6.sex_code,  ---性别编码
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
       and     nvl(tt.birthday , date'9999-12-31') >=  to_date(nvl(c23.start_time,'18000101'),'yyyymmdd')--判断出生日期是否在开始时间和结束时间之间
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
    
      v_effect_rows := sql%rowcount; --有效影响行数
      commit;
      v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
      v_step_name:= '插入更新dm_pop_basic_info表的数据完成'; --步骤名称
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
      v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  /*************************正常处理***************************************/
    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '程序执行完成'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    
  /**********异常处理，也可以在其它需要进行异常控制的地方加入异常处理*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'insert into dm_pop_basic_info fail: ' || substr(sqlerrm, 1, 300); --异常日志信息
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;

end ;
/

prompt
prompt Creating procedure PRC_LEG_PER_BASIC_INFO
prompt =========================================
prompt
create or replace procedure prc_leg_per_basic_info ---法人基本信息
(
    iv_date    in varchar2  -- 数据统计日期，格式：yyyymmdd
)
/***************************************************************************************************
  * 目标表：LEG_PER_BASIC_INFO(法人基本信息)
  * 源表：SRC0126_CORP_INFO(内资表)
          SRC0126_INDIV_INFO(个体表)

  * 方式：     增量
  * 运行频度： 按需
  * 任务功能说明: 加载法人基本信息表数据
  * 输入参数： iv_date    处理日期，格式：yyyymmdd

  * 输出参数： 无
  * 作者：        黄蓉
  * 创建日期：    2017-3-1
  *
  * 修改记录
  **************************************************************************************************
  * 修改人                  修改日期          修改内容
    黄蓉                   2017-5-23          旧的数据版本改为非最近版本，新的数据插入到主数据表中
  *************************************************************************************************/
is
   v_proc_name   varchar2(32) := 'PRC_LEG_PER_BASIC_INFO'; --存储过程名
   v_tab_name    varchar2(32) := 'LEG_PER_BASIC_INFO';--目标表名
   v_step_name   varchar2(200) := '加载法人基本信息表数据'; --步骤名称
   v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --结束时间
   v_error_flag  varchar2(4) := '0'; --错误标志（0，正常；1，错误）
   v_log_mess    varchar2(300) := 'merge into LEG_PER_BASIC_INFO normal'; --日志信息
   v_effect_rows number := 0; --有效影响行数
   v_proc_id     number := seq_proc_log.nextval; --存储过程的ID号
   v_sortid      number;
   v_patch       varchar(255);
begin
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '程序开始执行'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   
   select nvl(max(sort_id),0)+1 into v_sortid from leg_per_basic_info ;--获取leg_per_basic_info表中最大的排序号
   
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始清空TMP_LEG_PER_BASIC_INFO表的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_BASIC_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
   delete from tmp_leg_per_basic_info;
   
   delete from tmp_leg_per_basic_info_bak;
     
   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '清空TMP_LEG_PER_BASIC_INFO表的数据数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_BASIC_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;
   
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始备份LEG_PER_BASIC_INFO表执行时间的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
   insert into tmp_leg_per_basic_info_bak select * from leg_per_basic_info where latestversion=1 and description ='调用存储过程';
     
   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '备份LEG_PER_BASIC_INFO表执行时间的数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;
   
   /*手工执行*/
   --delete from leg_per_basic_info 
    --where modified_date >= to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd') 
   -- and modified_date< to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd') + 1
   -- and description ='调用存储过程';
    --commit;
    
    /*还原数据*/
    --insert into leg_per_basic_info select * from tmp_leg_per_basic_info_bak;
    --commit;

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '开始抽取SRC0126_CORP_INFO表数据插入更新到TMP_LEG_PER_BASIC_INFO表中'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_BASIC_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    
    
    /*查找出主数据表中最新的批次*/
    select t.patch_code
      into v_patch
      from patch_config t
      where t.patch_status=1
        and t.tar_tab_enname='LEG_PER_BASIC_INFO';
      
   
    /*插入内资表的数据到法人基本信息临时表中*/
     insert into tmp_leg_per_basic_info
      select t1.usc_code,
             substr(t1.usc_code,9,9),--统一社会信用代码（9-17位）
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
             '调用存储过程',
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
             'SRC0126_CORP_INFO',        --0代表内资表
             v_patch
       from src0126_corp_info t1,
            dim_reg_type t2,
            (select reg_num,patch_code,max(version) max_version from leg_per_basic_info group by reg_num,patch_code) a
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and nvl(t1.reg_type,'未知')=t2.reg_type_name(+) ---匹配登记类型名称
        and a.reg_num=t1.reg_num
        and a.patch_code=v_patch
     union all
           select t1.usc_code,
             substr(t1.usc_code,9,9),--统一社会信用代码（9-17位）
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
             '调用存储过程',
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
             'SRC0126_CORP_INFO',        --0代表内资表
             v_patch
       from src0126_corp_info t1,
            dim_reg_type t2,
            (select reg_num,patch_code,max(version) max_version from leg_per_basic_info group by reg_num,patch_code) a
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and nvl(t1.reg_type,'未知')=t2.reg_type_name(+) ---匹配登记类型名称
        and a.reg_num=t1.reg_num
        and v_patch not in (select distinct patch_code  from leg_per_basic_info)
     union all
      select t1.usc_code,
             substr(t1.usc_code,9,9),--统一社会信用代码（9-17位）
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
             '调用存储过程',
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
             'SRC0126_CORP_INFO',        --0代表内资表
             v_patch
       from src0126_corp_info t1,
            dim_reg_type t2
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and nvl(t1.reg_type,'未知')=t2.reg_type_name(+) ---匹配登记类型名称
        and t1.reg_num not in (select s.reg_num from leg_per_basic_info s );
   
     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '抽取SRC0126_CORP_INFO表数据插入更新到TMP_LEG_PER_BASIC_INFO表结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_BASIC_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始抽取SRC0126_INDIV_INFO表数据插入更新到TMP_LEG_PER_BASIC_INFO表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_BASIC_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
 
   /*插入个体表的数据到法人基本信息临时表中*/
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
             '调用存储过程',
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
             'SRC0126_INDIV_INFO',        --1代表个体表
             v_patch
       from src0126_indiv_info t1,
            dim_reg_type t2,
            (select reg_num,patch_code,max(version) max_version from leg_per_basic_info group by reg_num,patch_code) a
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and nvl(t1.form,'未知')=t2.reg_type_name(+) ---匹配登记类型名称
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
             '调用存储过程',
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
             'SRC0126_INDIV_INFO',        --1代表个体表
             v_patch
       from src0126_indiv_info t1,
            dim_reg_type t2,
            (select reg_num,patch_code,max(version) max_version from leg_per_basic_info group by reg_num,patch_code) a
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and nvl(t1.form,'未知')=t2.reg_type_name(+) ---匹配登记类型名称
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
             '调用存储过程',
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
             'SRC0126_INDIV_INFO',        --1代表个体表
             v_patch
       from src0126_indiv_info t1,
            dim_reg_type t2
      where t1.time >= to_date(iv_date , 'yyyymmdd')
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and nvl(t1.form,'未知')=t2.reg_type_name(+) ---匹配登记类型名称
        and t1.reg_num not in (select s.reg_num from leg_per_basic_info s );
        
     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '抽取SRC0126_INDIV_INFO表数据插入更新到TMP_LEG_PER_BASIC_INFO表结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_BASIC_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;
    
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新LEG_PER_BASIC_INFO表中有，而SRC0126_CORP_INFO和SRC0126_INDIV_INFO表需要修改的有效版本为无效'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
     update leg_per_basic_info s 
        set s.latestversion=0
      where s.latestversion=1
        and s.reg_num in(select t.reg_num from tmp_leg_per_basic_info t);
     
     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新LEG_PER_BASIC_INFO的版本数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始把TMP_LEG_PER_BASIC_INFO的数据插入到LEG_PER_BASIC_INFO表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
        
     insert into leg_per_basic_info select * from tmp_leg_per_basic_info;
     
     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '插入LEG_PER_BASIC_INFO表的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始清空TMP_LEG_PER_BASIC_INFO表的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_BASIC_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
     delete from tmp_leg_per_basic_info;
     
     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '清空TMP_LEG_PER_BASIC_INFO表的数据数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_BASIC_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;
   
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新sys_md_apply_cfg表中的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
     /*如果sys_md_apply_cfg表中添加leg_per_basic_info，则需要添加*/
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
     v_effect_rows := sql%rowcount; --有效影响行数
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新sys_md_apply_cfg表中的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新sys_md_select_cfg表中的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
     /*更新主数据集下拉框选择表的数据*/
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
     v_effect_rows := sql%rowcount; --有效影响行数
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新sys_md_select_cfg表中的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间              
  /*************************正常处理***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '程序执行完成'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********异常处理，也可以在其它需要进行异常控制的地方加入异常处理*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into LEG_PER_BASIC_INFO fail: ' || substr(sqlerrm, 1, 300); --异常日志信息
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_LEG_PER_CONTACT_INFO
prompt ===========================================
prompt
create or replace procedure prc_leg_per_contact_info ---法人联系信息
(
    iv_date    in varchar2  -- 数据统计日期，格式：yyyymmdd
)
/***************************************************************************************************
  * 目标表：LEG_PER_CONTACT_INFO(法人联系信息)
  * 源表：SRC0126_CORP_INFO(内资表)
          SRC0126_INDIV_INFO(个体表)


  * 方式：     增量
  * 运行频度： 按需
  * 任务功能说明: 加载法人联系信息表数据
  * 输入参数： iv_date    处理日期，格式：yyyymmdd
  * 输出参数： 无
  * 作者：        黄蓉
  * 创建日期：    2017-3-1
  *
  * 修改记录
  **************************************************************************************************
  * 修改人                  修改日期          修改内容
    黄蓉                   2017-5-22          旧的数据版本改为非最近版本，新的数据插入到主数据表中
  *************************************************************************************************/
is
   v_proc_name   varchar2(100) := 'PRC_LEG_PER_CONTACT_INFO'; --存储过程名
   v_tab_name    varchar2(32) := 'LEG_PER_CONTACT_INFO'; --目标表名
   v_step_name   varchar2(200) := '加载法人联系信息表数据'; --步骤名称
   v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --结束时间
   v_error_flag  varchar2(4) := '0'; --错误标志（0，正常；1，错误）
   v_log_mess    varchar2(300) := 'merge into LEG_PER_CONTACT_INFO normal'; --日志信息
   v_effect_rows number := 0; --有效影响行数
   v_proc_id     number := seq_proc_log.nextval; --存储过程的ID号
   v_sortid      number;
   v_patch       varchar(255);
begin
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '程序开始执行'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   
   select nvl(max(sort_id),0)+1 into v_sortid from leg_per_contact_info ;--获取leg_per_contact_info表中最大的排序号
   
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始清空TMP_LEG_PER_CONTACT_INFO表的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_CONTACT_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
   delete from tmp_leg_per_contact_info;
   delete from tmp_leg_per_contact_info_bak;
     
   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '清空TMP_LEG_PER_CONTACT_INFO表的数据数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_CONTACT_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;
   
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始备份LEG_PER_CONTACT_INFO表执行时间的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
   insert into tmp_leg_per_contact_info_bak select * from leg_per_contact_info where latestversion=1 and description ='调用存储过程';
   
      /*手工执行*/
   --delete from leg_per_contact_info 
   --where modified_date >= to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd') 
   -- and modified_date< to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd') + 1
   -- and description ='调用存储过程';
    --commit;
    
    /*还原数据*/
    --insert into leg_per_contact_info select * from tmp_leg_per_contact_info_bak;
    --commit;
    
   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '备份LEG_PER_CONTACT_INFO表执行时间的数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;
   
    /*查找出主数据表中最新的批次*/
    select t.patch_code
      into v_patch
      from patch_config t
      where t.patch_status=1
        and t.tar_tab_enname='LEG_PER_CONTACT_INFO';
   
    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '开始抽取SRC0126_CORP_INFO表数据插入更新到TMP_LEG_PER_CONTACT_INFO表中'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_CONTACT_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   
  /*插入内资表的数据到法人联系信息表中*/ 
     insert into tmp_leg_per_contact_info
      select t1.reg_num,
             t1.postcode,
             t1.operator_tel,
             '',
             '',
             t1.liaison,
             t1.liaison_tel,
             '',
             'SRC0126_CORP_INFO',        ----0代表内资表
             t1.time,
             v_sortid ,
             '调用存储过程',
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
             'SRC0126_CORP_INFO',        ----0代表内资表
             t1.time,
             v_sortid ,
             '调用存储过程',
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
             'SRC0126_CORP_INFO',        --0代表内资表
             t1.time,
             v_sortid ,
             '调用存储过程',
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
        
    v_effect_rows := sql%rowcount; --有效影响行数
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '抽取SRC0126_CORP_INFO表数据插入更新到TMP_LEG_PER_CONTACT_INFO表结束'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_CONTACT_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    commit;
    
    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '开始抽取SRC0126_INDIV_INFO表数据插入更新到TMP_LEG_PER_CONTACT_INFO表中'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_CONTACT_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

   /*插入个体表的数据到法人联系信息表中*/
     insert into tmp_leg_per_contact_info
      select t1.reg_num,
             '',
             t1.operator_tel,
             '',
             '',
             t1.liaison,
             t1.liaison_tel,
             '',
             'SRC0126_INDIV_INFO',        --1代表个体表
             t1.time,
             v_sortid ,
             '调用存储过程',
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
             'SRC0126_INDIV_INFO',        --1代表个体表
             t1.time,
             v_sortid ,
             '调用存储过程',
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
             'SRC0126_INDIV_INFO',        --1代表个体表
             t1.time,
             v_sortid ,
             '调用存储过程',
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
     
     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '抽取SRC0126_INDIV_INFO表数据插入更新到TMP_LEG_PER_CONTACT_INFO表结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_CONTACT_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    commit;
    
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新leg_per_contact_info中有，而SRC0126_CORP_INFO和SRC0126_INDIV_INFO需要修改的有效版本为无效'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
     update leg_per_contact_info s 
        set s.latestversion=0
      where s.latestversion=1
        and s.reg_num in(select t.reg_num from tmp_leg_per_contact_info t);
     
     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新LEG_PER_CONTACT_INFO的版本数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始把TMP_LEG_PER_CONTACT_INFO的数据插入到LEG_PER_CONTACT_INFO表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
        
     insert into leg_per_contact_info select * from tmp_leg_per_contact_info;
     
     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '插入LEG_PER_CONTACT_INFO表的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始清空TMP_LEG_PER_CONTACT_INFO表的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_CONTACT_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
     delete from tmp_leg_per_contact_info;
     
     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '清空TMP_LEG_PER_CONTACT_INFO表的数据数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_CONTACT_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;
    
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新sys_md_apply_cfg表中的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
     /*如果sys_md_apply_cfg表中添加leg_per_contact_info，则需要添加*/
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
     v_effect_rows := sql%rowcount; --有效影响行数
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新sys_md_apply_cfg表中的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新sys_md_select_cfg表中的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
     /*更新主数据集下拉框选择表的数据*/
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
     v_effect_rows := sql%rowcount; --有效影响行数
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新sys_md_select_cfg表中的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间   
  /*************************正常处理***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '程序执行完成'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********异常处理，也可以在其它需要进行异常控制的地方加入异常处理*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into LEG_PER_CONTACT_INFO fail: ' || substr(sqlerrm, 1, 300); --异常日志信息
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_LEG_PER_REG_INFO
prompt =======================================
prompt
create or replace procedure prc_leg_per_reg_info ---法人注册或登记信息表
(
    iv_date    in varchar2  -- 数据统计日期，格式：yyyymmdd
)
is
/**************************************************************************************************
  * 目标表：LEG_PER_REG_INFO(法人注册或登记信息表)
  * 源表：SRC0126_CORP_INFO(内资表)
          SRC0126_INDIV_INFO(个体表)

  * 方式：     增量
  * 运行频度： 按需
  * 任务功能说明: 加载法人注册或登记信息表数据
  * 输入参数： iv_date    处理日期，格式：yyyymmdd
  * 输出参数： 无
  * 作者：        黄蓉
  * 创建日期：    2017-2-27
  *
  * 修改记录
  **************************************************************************************************
  * 修改人                  修改日期          修改内容
    黄蓉                   2017-5-22          旧的数据版本改为非最近版本，新的数据插入到主数据表中
  *************************************************************************************************/
  v_proc_name   varchar2(32) := 'PRC_LEG_PER_REG_INFO'; --存储过程名
  v_tab_name    varchar2(32) := 'LEG_PER_REG_INFO'; --目标表名
  v_step_name   varchar2(100) := '加载法人注册或登记信息表数据'; --步骤名称
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --结束时间
  v_error_flag  varchar2(4) := '0'; --错误标志（0，正常；1，错误）
  v_log_mess    varchar2(300) := 'merge into LEG_PER_REG_INFO normal'; --日志信息
  v_effect_rows number := 0; --有效影响行数
  v_proc_id     number := seq_proc_log.nextval; --存储过程的ID号
  v_sortid      number;
  v_patch       varchar(255);

begin
  
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '程序开始执行'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    
  select nvl(max(sort_id),0)+1 into v_sortid from leg_per_reg_info ;--获取leg_per_reg_info表中最大的排序号
  
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始清空TMP_LEG_PER_REG_INFO表的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_REG_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
   delete from tmp_leg_per_reg_info;
   delete from tmp_leg_per_reg_info_bak;
     
   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '清空TMP_LEG_PER_REG_INFO表的数据数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_REG_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始备份LEG_PER_REG_INFO表执行时间的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   
    insert into tmp_leg_per_reg_info_bak select * from leg_per_reg_info where latestversion=1 and description ='调用存储过程';
     
   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '备份LEG_PER_REG_INFO表执行时间的数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;
   
    /*手工执行*/
   --delete from leg_per_reg_info 
   --where modified_date >= to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd') 
   -- and modified_date< to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd') + 1
   -- and description ='调用存储过程';
   --commit;
    
    /*还原数据*/
    --insert into leg_per_reg_info select * from tmp_leg_per_reg_info_bak;
    --commit;

    /*查找出主数据表中最新的批次*/
    select t.patch_code
      into v_patch
      from patch_config t
      where t.patch_status=1
        and t.tar_tab_enname='LEG_PER_REG_INFO';
   
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '开始抽取SRC0126_CORP_INFO表数据插入更新到TMP_LEG_PER_REG_INFO表中'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_REG_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

    /*插入内资表的数据到法人注册或登记信息表中*/
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
             'SRC0126_CORP_INFO',        --0代表内资表
             t1.time,
             v_sortid ,
             '调用存储过程',
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
        and  nvl(t1.idt_ctgr,'未知'）=t2.idt_ctgr_name
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
             'SRC0126_CORP_INFO',        --0代表内资表
             t1.time,
             v_sortid ,
             '调用存储过程',
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
        and  nvl(t1.idt_ctgr,'未知'）=t2.idt_ctgr_name
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
             'SRC0126_CORP_INFO',        --0代表内资表
             t1.time,
             v_sortid ,
             '调用存储过程',
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
        and nvl(t1.idt_ctgr,'未知'）=t2.idt_ctgr_name ---匹配行业门类维表中的行业门类名称
        and t1.reg_num not in (select s.reg_num from leg_per_reg_info s );
        
    v_effect_rows := sql%rowcount; --有效影响行数
    commit;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '抽取SRC0126_CORP_INFO表数据插入更新到TMP_LEG_PER_REG_INFO表结束'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_REG_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    
    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '开始抽取SRC0126_INDIV_INFO表数据插入更新到TMP_LEG_PER_REG_INFO表中'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_REG_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    
   /*插入个体表的数据到法人注册或登记信息表中*/ 
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
             'SRC0126_INDIV_INFO',        --1代表个体表
             t1.time,
             v_sortid ,
             '调用存储过程',
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
        and nvl(t1.idt_ctgr,'未知'）=t2.idt_ctgr_name ---匹配行业门类维表中的行业门类名称
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
             'SRC0126_INDIV_INFO',        --1代表个体表
             t1.time,
             v_sortid ,
             '调用存储过程',
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
        and nvl(t1.idt_ctgr,'未知'）=t2.idt_ctgr_name ---匹配行业门类维表中的行业门类名称
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
             'SRC0126_INDIV_INFO',        --1代表个体表
             t1.time,
             v_sortid ,
             '调用存储过程',
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
        and nvl(t1.idt_ctgr,'未知'）=t2.idt_ctgr_name ---匹配登记类型名称
        and t1.reg_num not in (select s.reg_num from leg_per_reg_info s );
                 
     v_effect_rows := sql%rowcount; --有效影响行数
    commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '抽取SRC0126_INDIV_INFO表数据插入更新到TMP_LEG_PER_REG_INFO表结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_REG_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新LEG_PER_REG_INFO表中有，而SRC0126_CORP_INFO和SRC0126_INDIV_INFO表需要修改的有效版本为无效'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
     update leg_per_reg_info s 
        set s.latestversion=0
      where s.latestversion=1
        and s.reg_num in(select t.reg_num from tmp_leg_per_reg_info t);
     
     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新LEG_PER_REG_INFO的版本数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始把TMP_LEG_PER_REG_INFO的数据插入到LEG_PER_REG_INFO表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
        
     insert into leg_per_reg_info select * from tmp_leg_per_reg_info;
     
     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '插入LEG_PER_REG_INFO表的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始清空TMP_LEG_PER_REG_INFO表的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_REG_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
      delete from tmp_leg_per_reg_info;
     
     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '清空TMP_LEG_PER_REG_INFO表的数据数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_REG_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;
    
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新sys_md_apply_cfg表中的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     /*如果sys_md_apply_cfg表中添加pop_basic_info，则需要添加*/
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
     v_effect_rows := sql%rowcount; --有效影响行数
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新sys_md_apply_cfg表中的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新sys_md_select_cfg表中的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
     /*更新主数据集下拉框选择表的数据*/
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
     v_effect_rows := sql%rowcount; --有效影响行数
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新sys_md_select_cfg表中的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间   
  /*************************正常处理***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '程序执行完成'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********异常处理，也可以在其它需要进行异常控制的地方加入异常处理*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into LEG_PER_REG_INFO fail: ' || substr(sqlerrm, 1, 300); --异常日志信息
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_LEG_PER_TAX_INFO
prompt =======================================
prompt
create or replace procedure prc_leg_per_tax_info ---税务信息
(
    iv_date    in varchar2  -- 数据统计日期，格式：yyyymmdd
)
is
/**************************************************************************************************
  * 目标表：LEG_PER_TAX_INFO(税务信息)
  * 源表：SRC0128_LANDTAX_BUS
  * 方式：     增量
  * 运行频度： 按需
  * 任务功能说明: 加载法人税务信息表数据
  * 输入参数： iv_date    处理日期，格式：yyyymmdd
  * 输出参数： 无
  * 作者：        黄蓉
  * 创建日期：    2017-3-1
  *
  * 修改记录
  **************************************************************************************************
  * 修改人                  修改日期          修改内容
    黄蓉                   2017-5-23          旧的数据版本改为非最近版本，新的数据插入到主数据表中
  *************************************************************************************************/
  v_proc_name   varchar2(32) := 'PRC_LEG_PER_TAX_INFO'; --存储过程名
  v_tab_name    varchar2(32) := 'LEG_PER_TAX_INFO';
  v_step_name   varchar2(100) := '加载法人税务信息表数据'; --步骤名称
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --结束时间
  v_error_flag  varchar2(4) := '0'; --错误标志（0，正常；1，错误）
  v_log_mess    varchar2(300) := 'merge into LEG_PER_TAX_INFO normal'; --日志信息
  v_effect_rows number := 0; --有效影响行数
  v_proc_id     number := seq_proc_log.nextval; --存储过程的ID号
  v_sortid      number;
  v_patch       varchar(255);
begin
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '程序开始执行'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

   select nvl(max(sort_id),0)+1 into v_sortid from leg_per_tax_info ;--获取leg_per_tax_info表中最大的排序号

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始清空TMP_LEG_PER_TAX_INFO表的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_TAX_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

   delete from tmp_leg_per_tax_info;
   delete from tmp_leg_per_tax_info_bak;

   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '清空TMP_LEG_PER_TAX_INFO表的数据数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_TAX_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;
   
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始备份LEG_PER_TAX_INFO表执行时间的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   
   insert into tmp_leg_per_tax_info_bak select * from leg_per_tax_info where latestversion=1 and description ='调用存储过程';

     
   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '备份LEG_PER_TAX_INFO表执行时间的数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;
   
    /*手工执行*/
   --delete from leg_per_basic_info 
    --where modified_date >= to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd') 
   -- and modified_date< to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd') + 1
   -- and description ='调用存储过程';
    --commit;
    
    /*还原数据*/
    --insert into leg_per_basic_info select * from tmp_leg_per_basic_info_bak;
    --commit;
    
   /*查找出主数据表中最新的批次*/
    select t.patch_code
      into v_patch
      from patch_config t
      where t.patch_status=1
        and t.tar_tab_enname='LEG_PER_TAX_INFO';
     
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始抽取SRC0128_LANDTAX_BUS表数据插入更新到TMP_LEG_PER_TAX_INFO表中'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_TAX_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

   /*插入地税表的数据到税务信息中*/
     insert into tmp_leg_per_tax_info
      select t1.soc_cre_code,--纳税人识别号
             t1.com_tax_aut,--税务登记机关名称
             '',
             '',
             '',
             '',
             t1.time,
             v_sortid ,
             '调用存储过程',
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
      where t1.time >= to_date(iv_date , 'yyyymmdd')         ---增量抽取
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and a.usc_code=t1.soc_cre_code
        and a.patch_code=v_patch
     union all
      select t1.soc_cre_code,--纳税人识别号
             t1.com_tax_aut,--税务登记机关名称
             '',
             '',
             '',
             '',
             t1.time,
             v_sortid ,
             '调用存储过程',
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
      where t1.time >= to_date(iv_date , 'yyyymmdd')         ---增量抽取
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and a.usc_code=t1.soc_cre_code
        and v_patch not in (select distinct patch_code  from leg_per_tax_info)
     union all
      select t1.soc_cre_code,--纳税人识别号
             t1.com_tax_aut,--税务登记机关名称
             '',
             '',
             '',
             '',
             t1.time,
             v_sortid ,
             '调用存储过程',
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
      where t1.time >= to_date(iv_date , 'yyyymmdd')         ---增量抽取
        and t1.time < to_date(iv_date , 'yyyymmdd') + 1
        and t1.soc_cre_code not in (select s.usc_code from leg_per_tax_info s );

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '抽取SRC0128_LANDTAX_BUS表数据插入更新到TMP_LEG_PER_TAX_INFO表结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_TAX_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新LEG_PER_TAX_INFO中有，而SRC0128_LANDTAX_BUS需要修改的有效版本为无效'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     update leg_per_tax_info s
        set s.latestversion=0
      where s.latestversion=1
        and s.usc_code in(select t.usc_code from tmp_leg_per_tax_info t);

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新LEG_PER_TAX_INFO的版本数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始把TMP_LEG_PER_TAX_INFO的数据插入到LEG_PER_TAX_INFO表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     insert into leg_per_tax_info select * from tmp_leg_per_tax_info;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '插入LEG_PER_TAX_INFO表的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始清空TMP_LEG_PER_TAX_INFO表的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_TAX_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     delete from tmp_leg_per_tax_info;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '清空TMP_LEG_PER_TAX_INFO表的数据数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_LEG_PER_TAX_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新sys_md_apply_cfg表中的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     /*如果sys_md_apply_cfg表中添加pop_basic_info，则需要添加*/
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
     v_effect_rows := sql%rowcount; --有效影响行数
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新sys_md_apply_cfg表中的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新sys_md_select_cfg表中的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
     /*更新主数据集下拉框选择表的数据*/
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
     v_effect_rows := sql%rowcount; --有效影响行数
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新sys_md_select_cfg表中的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间   
  /*************************正常处理***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '程序执行完成'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********异常处理，也可以在其它需要进行异常控制的地方加入异常处理*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into LEG_PER_TAX_INFO fail: ' || substr(sqlerrm, 1, 300); --异常日志信息
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_MAC_ECO_INDEX
prompt ====================================
prompt
create or replace procedure prc_mac_eco_index ---宏观经济指标综合表
(
    iv_date    in varchar2  -- 数据统计日期，格式：yyyymmdd
)
is
/*************************************************************************************************
  * 目标表：MAC_ECO_INDEX(宏观经济指标综合表)
  * 源表：SRC0108_SOCECO_INDI_Q
  * 方式：     增量
  * 运行频度： 按需
  * 任务功能说明: 加载宏观经济指标综合表数据
  * 输入参数： iv_date    处理日期，格式：yyyymmdd
  * 输出参数： 无
  * 作者：        黄蓉
  * 创建日期：    2017-3-1
  *
  * 修改记录
  *************************************************************************************************
  * 修改人                  修改日期          修改内容
     黄蓉                   2017-3-13         修改index_month、cur_month_val等4个字段名称
     黄蓉                   2017-5-22         旧的数据版本改为非最近版本，新的数据插入到主数据表中
  *************************************************************************************************/
  v_proc_name   varchar2(32) := 'PRC_MAC_ECO_INDEX'; --存储过程名
  v_tab_name    varchar2(32) := 'MAC_ECO_INDEX';
  v_step_name   varchar2(200):= '加载宏观经济指标综合表数据'; --步骤名称
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --结束时间
  v_error_flag  varchar2(4)  := '0'; --错误标志（0，正常；1，错误）
  v_log_mess    varchar2(300) := 'merge into MAC_ECO_INDEX normal'; --日志信息
  v_effect_rows number := 0; --有效影响行数
  v_proc_id     number := seq_proc_log.nextval; --存储过程的ID号
  v_sortid      number;
  v_patch       varchar(255);
begin
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '程序开始执行'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

   select max(nvl(sort_id,0))+1 into v_sortid from mac_eco_index ;--获取mac_eco_index表中最大的排序号
   
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始清空TMP_MAC_ECO_INDEX表的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
   delete from tmp_mac_eco_index;
   delete from tmp_mac_eco_index_bak;
    
   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '清空TMP_MAC_ECO_INDEX表的数据数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;
   

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始备份MAC_ECO_INDEX表执行时间的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   
   insert into tmp_mac_eco_index_bak select * from mac_eco_index where latestversion=1 and description ='调用存储过程';
     
   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '备份MAC_ECO_INDEX表执行时间的数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;
   
      /*手工执行*/
   --delete from mac_eco_index 
    --where modified_date >= to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd') 
   -- and modified_date< to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd') + 1
   -- and description ='调用存储过程';
    --commit;
    
    /*还原数据*/
    --insert into mac_eco_index select * from tmp_mac_eco_index_bak;
    --commit;
        
    /*查找出主数据表中最新的批次*/
    select t.patch_code
      into v_patch
      from patch_config t
      where t.patch_status=1
        and t.tar_tab_enname='MAC_ECO_INDEX';
    
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始抽取SRC0108_SOCECO_INDI_Q表数据插入更新到TMP_MAC_ECO_INDEX表中'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_MAC_ECO_INDEX', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  
  /*插入宏观经济指标综合表临时表的数据*/
    insert into tmp_mac_eco_index
     select t1.code||substr(t1.input_date,1,4)||substr(t1.input_date,6,2) index_month,  --源表的社会经济指标综合编码+年月
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
            substr(t1.input_date,1,4)||substr(t1.input_date,6,2) ym_code, --年月编码（去掉年月文字）
            t1.input_date,
            t1.time,
            v_sortid,
            '调用存储过程',
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
       and t1.code=t2.index_code  --宏观经济指标综合编码
       and t2.latestversion=1
       and t1.code||substr(t1.input_date,1,4)||substr(t1.input_date,6,2)=a.index_month
       and a.patch_code=v_patch
    union all
         select t1.code||substr(t1.input_date,1,4)||substr(t1.input_date,6,2) index_month,  --源表的社会经济指标综合编码+年月
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
            substr(t1.input_date,1,4)||substr(t1.input_date,6,2) ym_code, --年月编码（去掉年月文字）
            t1.input_date,
            t1.time,
            v_sortid,
            '调用存储过程',
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
       and t1.code=t2.index_code  --宏观经济指标综合编码
       and t2.latestversion=1
       and t1.code||substr(t1.input_date,1,4)||substr(t1.input_date,6,2)=a.index_month
       and v_patch not in (select distinct patch_code  from mac_eco_index)
    union all 
    select  t1.code||substr(t1.input_date,1,4)||substr(t1.input_date,6,2) index_month,  --源表的社会经济指标综合编码+年月
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
            substr(t1.input_date,1,4)||substr(t1.input_date,6,2) ym_code, --年月编码（去掉年月文字）
            t1.input_date,
            t1.time,
            v_sortid,
            '调用存储过程',
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
       and t1.code=t2.index_code  --宏观经济指标综合编码
       and t2.latestversion=1
       and t1.code||substr(t1.input_date,1,4)||substr(t1.input_date,6,2) not in 
           (select s.index_month from mac_eco_index s );
     
     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '抽取SRC0108_SOCECO_INDI_Q表数据插入更新到TMP_MAC_ECO_INDEX表结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_MAC_ECO_INDEX', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;
    
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新mac_eco_index表中已有，而SRC0108_SOCECO_INDI_Q表需要修改的有效版本数据为无效'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
     update mac_eco_index s 
        set s.latestversion=0
      where s.latestversion=1
        and s.index_month in(select t.index_month from tmp_mac_eco_index t);
        
     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新mac_eco_index的版本数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;
      
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始把tmp_mac_eco_index的数据插入到mac_eco_index表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
     insert into mac_eco_index select * from tmp_mac_eco_index;
     
     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '插入mac_eco_index表的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始清空TMP_MAC_ECO_INDEX表的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
     delete from tmp_mac_eco_index;
    
     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '清空TMP_MAC_ECO_INDEX表的数据数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '开始更新sys_md_apply_cfg表中的数据'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    
    /*如果sys_md_apply_cfg表中添加mac_eco_index，则需要添加*/
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
    v_effect_rows := sql%rowcount; --有效影响行数
    commit;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '更新sys_md_apply_cfg表中的数据结束'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新sys_md_select_cfg表中的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
     /*更新主数据集下拉框选择表的数据*/
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
     v_effect_rows := sql%rowcount; --有效影响行数
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新sys_md_select_cfg表中的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间       
  /*************************正常处理***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '程序执行完成'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********异常处理，也可以在其它需要进行异常控制的地方加入异常处理*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into MAC_ECO_INDEX fail: ' || substr(sqlerrm, 1, 300); --异常日志信息
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
   
  /*插入META_E_TAR_ENTITY表的数据*/
   insert into meta_e_tar_entity(tar_entity_id,tar_tab_en_nm,tar_tab_cn_nm,tar_tab_uniqueinfo,sub_domain_name,sub_domain_id,version,versionstatus,sub_domain_code,tar_tab_datarource_code,collecttime,opreasonexp,oppsrsonnel)
   select
          sys_guid() tar_entity_id,
          a.table_name tar_tab_en_nm,
          nvl(a.comments,'暂时为空') tar_tab_cn_nm,
          a.comments tar_tab_uniqueinfo,
          nvl(d.sub_domain_name,'暂时为空'),
          nvl(d.sub_domain_id,'暂时为空'),
          1,
          1,
          d.sub_domain_code,
          'ORACLE',
          sysdate,
          '通过sql语句初次导入,生成版本信息[系统自动]!'，
          'admin'
     from dba_tab_comments a,
          meta_e_sub_domain d
     where a.table_name = tartab_row.tablename
       and a.owner='C##_BIGDATA'
       and substr(a.table_name,1,instr(a.table_name,'_',1,2)-1) =d.sub_domain_code;

   /*开始插入META_E_TAR_ATTRI表的数据*/
   insert into meta_e_tar_attri(tar_attri_id,tar_entity_id,tar_tab_entity,tar_tab_en_nm,tar_tab_cn_nm,tar_attri_en_nm,tar_attri_cn_nm,tar_attri_typ,tar_tab_fullinfo,sub_domain_name,sub_domain_code,sub_domain_id,tar_tab_rourcesys_type,tar_attri_length,null_flag,unique_flay)
   select
         sys_guid() tar_attri_id,
         e.tar_entity_id,
         '000001',
         e.tar_tab_en_nm,
         nvl(a.comments,'暂时为空'),
         c.column_name,
         nvl(c.comments,'暂时为空'),
         s.data_type,
         e.tar_tab_en_nm||'_'||c.column_name||'_'||d.sub_domain_id,
         nvl(d.sub_domain_name,'暂时为空'),
         d.sub_domain_code,
         nvl(d.sub_domain_id,'暂时为空'),
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

    /**********异常处理，也可以在其它需要进行异常控制的地方加入异常处理*********/
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
  iv_latest_patch_code in varchar,   ---最新的批次号
  iv_tar_tabnames       in varchar,        ---主数据表
  oi_return             out integer,  ---返回数据插入的结果
  oi_err_msg            out varchar2  ---返回报错信息
)

is
  v_last_patch_code varchar2(500); ---获取上一个批次号
  iv_tar_tabname    varchar2(500); ---获取主数据表串的单个成员
  tar_tab_cnt       number;        ---主数据表的个数
  tar_tab_indx      number;        ---拆分后第几个主数据表
  tmp_tar_tabname   varchar2(500); ---主数据表的临时表
  v_sql1            varchar2(500);
  v_sql2            varchar2(500);
  v_sql3            varchar2(500);
  v_sql4            varchar2(500);
  v_sql5            varchar2(500);
  v_sql6            varchar2(500);
begin

  tar_tab_indx :=0;
  /*统计勾选的主数据表的个数*/
  select regexp_count(iv_tar_tabnames,',')+1 into tar_tab_cnt from dual;

  loop
    tar_tab_indx := tar_tab_indx +1;

    /*拆分主数据表串赋给单个主数据表变量*/
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
    
    /*保存上一个批次的数据到临时表中*/
    v_sql3 :='insert into '|| tmp_tar_tabname||' select * from '|| iv_tar_tabname ||' where patch_code = '||''''||v_last_patch_code||''''||' and latestversion=1';
    execute immediate v_sql3;

    /*更新主数据表中上一个批次的数据为不是最新数据*/
    v_sql2 := 'update '||iv_tar_tabname||' set latestversion = 0 where patch_code = '|| ''''||v_last_patch_code||''''||'';
    execute immediate v_sql2;
    commit;

    /*更新临时表中的批次号为最新的批次号*/
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

    oi_return :=0; --数据插入成功返回0

exception
  when others then
    oi_err_msg  := substr(sqlerrm, 1, 300);
    oi_return :=-1;  --数据插入失败,返回-1
 
end;
/

prompt
prompt Creating procedure PRC_POP_BASIC_INFO
prompt =====================================
prompt
create or replace procedure prc_pop_basic_info
(
    iv_date   in varchar2---数据统计日期，格式：yyyymmdd
)
is
/*************************************************************************************************
  * 目标表：POP_BASIC_INFO(人口基础信息)
  * 源表：SRC0117_POP_BAISHA(白沙人口信息)
          SRC0117_POP_DAJING(大径人口信息)
          SRC0117_POP_DIANDI(店地人口信息)
          SRC0117_POP_LINGBO(凌波人口信息)
          SRC0117_POP_SHIKENG(石坑人口信息)
          SRC0117_POP_RECTIFICATION(矫正人员信息)
          SRC0117_POP_SEV_MEN_PAT(重症精神病人信息表)
          SRC0117_POP_CULT(邪派人员信息表)

  * 方式：     增量
  * 运行频度： 按需
  * 任务功能说明: 加载人口基础信息表数据
  * 输入参数： iv_date    处理日期，格式：yyyymmdd

  * 输出参数： 无
  * 作者：        黄蓉
  * 创建日期：    2017-2-27
  *
  * 修改记录
  ************************************************************************************************
  * 修改人                  修改日期          修改内容
    黄蓉                   2017-5-19          旧的数据版本改为非最近版本，新的数据插入到主数据表中
  *************************************************************************************************/
  v_proc_name   varchar2(32) := 'PRC_POP_BASIC_INFO'; --存储过程名
  v_tab_name    varchar2(32) := 'POP_BASIC_INFO';--目标表名
  v_step_name   varchar2(100):= '加载人口基础信息表数据'; --步骤名称
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --结束时间
  v_error_flag  varchar2(4)  := '0'; --错误标志（0，正常；1，错误）
  v_log_mess    varchar2(300) := 'merge into POP_BASIC_INFO normal'; --日志信息
  v_effect_rows number := 0; --有效影响行数
  v_proc_id     number := seq_proc_log.nextval; --存储过程的ID号
  src_tabnames  varchar2(1000); /*源表名组*/
  src_tabname   varchar2(1000); /*源表名*/
  ele_indx      number; /*第几个源表*/
  ele_cnt       number; /*源表的个数*/
  ele_region    varchar2(100); /*地区*/
  ele_type      varchar2(100); /*人口类型*/
  exc_sql       varchar2(10000); /*增量生成主数据*/
  v_sortid      number;
  v_patch       varchar(255);
begin
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '程序开始执行'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

  select nvl(max(sort_id),0)+1 into v_sortid from pop_basic_info ;--获取pop_basic_info表中最大的排序号

  src_tabnames := 'SRC0117_POP_BAISHA,SRC0117_POP_DAJING,SRC0117_POP_DIANDI,SRC0117_POP_LINGBO,SRC0117_POP_SHIKENG,SRC0117_POP_RECTIFICATION,SRC0117_POP_SEV_MEN_PAT,SRC0117_POP_CULT';--源表数组
  ele_indx     := 0; --第几个元组
  ele_cnt      := 8; --共有几个元组

  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '开始清空TMP_POP_BASIC_INFO表的数据'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

  delete from tmp_pop_basic_info;
  delete from tmp_pop_basic_info_bak;

  v_effect_rows := sql%rowcount; --有效影响行数
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '清空TMP_POP_BASIC_INFO表的数据数据结束'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始备份POP_BASIC_INFO表执行时间的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

   insert into tmp_pop_basic_info_bak select * from pop_basic_info where latestversion=1 and description ='调用存储过程';


   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '备份POP_BASIC_INFO表执行时间的数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;

   /*重跑数据手工执行*/
   --delete from pop_basic_info
   --where modified_date >= to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd')
   -- and modified_date< to_date(to_char(sysdate,'yyyymmdd') , 'yyyymmdd') + 1
   -- and description ='调用存储过程';
   --commit;

    /*还原数据*/
    --insert into pop_basic_info select * from tmp_pop_basic_info_bak;
    --commit;

  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '开始更新POP_BASIC_INFO表中已有，而'  || src_tabname  ||'表需要修改的有效版本数据为无效'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

    /*把人口基本信息表中特殊人群数据的版本状态改为无效，此版本不为最新版本*/
    update pop_basic_info s
       set s.latestversion=0
     where s.latestversion=1
       and s.pop_type!='N';

  v_effect_rows := sql%rowcount; --有效影响行数
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '更新POP_BASIC_INFO的版本数据结束'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
  v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  commit;

  /*查找出主数据表中最新的批次*/
   select t.patch_code
     into v_patch
     from patch_config t
    where t.patch_status=1
      and t.tar_tab_enname='POP_BASIC_INFO';

  /*循环插入数据*/
  loop
    ele_indx := ele_indx + 1;
    select regexp_substr(src_tabnames, '[^,]+', 1, ele_indx),---以逗号为分隔，截取的是以非逗号开头的一个或多个字符，即源表组中的第ele_indx个源表，ele_indx从1开始自增
           decode(regexp_substr(regexp_substr(src_tabnames, '[^,]+', 1, ele_indx), '[^_]+', 1, 3), 'RECTIFICATION', 'R', 'SEV', 'S', 'CULT', 'C', 'N'),
           --对于选中的第ele_indx个源表，以_为分隔，如果截取的是以_为分隔的第三个字符串是RECTIFICATION，则人口类型就为R，如果是SEV，则人口类型为S，如果是CULT，则人口类型为C，其他的则人口类型为N（正常人）
           decode(regexp_substr(regexp_substr(src_tabnames, '[^,]+',1,ele_indx),'[^_]+',1,3),'BAISHA','baisha','DAJING','dajing','DIANDI','diandi','LINGBO','lingbo','SHIKENG','shikeng','RECTIFICATION','未知','SEV','未知','CULT','未知')
           --地区的取值是通过截取源表的以_为分隔第三个字符串的小写，非正常人的地区为空
      into src_tabname, ele_type, ele_region
      from dual;

     --序列
     /*-- Create sequence
     create sequence seq_pop_basic_info
     maxvalue 9999999999999999999999
     start with 1
     increment by 1;*/

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始抽取'  || src_tabname  ||'表数据，插入更新到tmp_pop_basic_info表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_POP_BASIC_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

   /*当人口类型为正常人时，插入更新人口基本信息表数据如下：*/
     if ele_type = 'N'
    then   exc_sql := 'insert into tmp_pop_basic_info  /*向人口基本信息临时表中插入需要更新的增量数据*/
                       select t1.account_no,          /*当插入的数据的证件号存在于人口基本信息表中*/
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
                              decode(substr(t1.gen_grid,1,1),''A'',''A网格'',''B'',''B网格'',''C'',''C网格'',''D'',''D网格'',''凌'',''E网格'',''未知''）,
                               --把所属网格字段统一转为 字母+网格
                              t1.time,
                              ' || '''' || v_sortid || '''' || ',
                              ''调用存储过程'',
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
                              decode(' || '''' ||ele_region|| '''' || ',''baisha'',''白沙'',''dajing'',''大径'',''diandi'',''店地'',''lingbo'',''凌波'',''shikeng'',''石坑'',''未知''),
                              ' || '''' || v_patch || '''' || '
                              from '  || src_tabname  ||' t1,
                                   dim_sex t2,
                                   dim_marry_status t3,
                                   dim_education t4,
                                   dim_region t5,
                                   (select account_no,patch_code,max(version) max_version from pop_basic_info group by account_no,patch_code)s
                             where t1.time >= to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'')
                               and t1.time < to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'') + 1
                               and t2.sex_name=nvl(t1.pop_sex,''未知'') --性别为空不要漏掉
                               and t3.marry_status_name=nvl(t1.mar_status,''未知'')--婚姻状况为空不要漏掉
                               and t4.education_name=nvl(t1.deg_edu,''未知'')--学历为空不要漏掉
                               and nvl(' || '''' || ele_region || '''' || '|| decode(substr(t1.gen_grid,1,1),''凌'',''E'',substr(t1.gen_grid,1,1)),''未知'')=t5.region_formname  --把 凌波社区居民网格 转为E网格
                               and t1.account_no = s.account_no
                               and s.patch_code=' || '''' || v_patch || '''' || '
                      union all
                       select t1.account_no,          /*当插入的数据的证件号存在于人口基本信息表中*/
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
                              decode(substr(t1.gen_grid,1,1),''A'',''A网格'',''B'',''B网格'',''C'',''C网格'',''D'',''D网格'',''凌'',''E网格'',''未知''）,
                               --把所属网格字段统一转为 字母+网格
                              t1.time,
                              ' || '''' || v_sortid || '''' || ',
                              ''调用存储过程'',
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
                              decode(' || '''' ||ele_region|| '''' || ',''baisha'',''白沙'',''dajing'',''大径'',''diandi'',''店地'',''lingbo'',''凌波'',''shikeng'',''石坑'',''未知''),
                              ' || '''' || v_patch || '''' || '
                        from '  || src_tabname  ||' t1,
                             dim_sex t2,
                             dim_marry_status t3,
                             dim_education t4,
                             dim_region t5,
                             (select account_no,patch_code,max(version) max_version from pop_basic_info group by account_no,patch_code)s
                       where t1.time >= to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'')
                         and t1.time < to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'') + 1
                         and t2.sex_name=nvl(t1.pop_sex,''未知'') --性别为空不要漏掉
                         and t3.marry_status_name=nvl(t1.mar_status,''未知'')--婚姻状况为空不要漏掉
                         and t4.education_name=nvl(t1.deg_edu,''未知'')--学历为空不要漏掉
                         and nvl(' || '''' || ele_region || '''' || '|| decode(substr(t1.gen_grid,1,1),''凌'',''E'',substr(t1.gen_grid,1,1)),''未知'')=t5.region_formname  --把 凌波社区居民网格 转为E网格
                         and t1.account_no = s.account_no
                         and ' || '''' || v_patch || '''' || ' not in (select distinct patch_code  from pop_basic_info)
                      union all
                      select  t1.account_no,   /*当插入的数据的证件号不存在于人口基本信息表中*/
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
                              decode(substr(t1.gen_grid,1,1),''A'',''A网格'',''B'',''B网格'',''C'',''C网格'',''D'',''D网格'',''凌'',''E网格'',''未知''）,
                               --把所属网格字段统一转为 字母+网格
                              t1.time,
                              ' || '''' || v_sortid || '''' || ',
                              ''调用存储过程'',
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
                              decode(' || '''' ||ele_region|| '''' || ',''baisha'',''白沙'',''dajing'',''大径'',''diandi'',''店地'',''lingbo'',''凌波'',''shikeng'',''石坑''),
                              ' || '''' || v_patch || '''' || '
                       from '  || src_tabname  ||' t1,
                             dim_sex t2,
                             dim_marry_status t3,
                             dim_education t4,
                             dim_region t5
                       where t1.time>= to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'')  --增量抽取
                         and t1.time < to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'') + 1
                         and t2.sex_name=nvl(t1.pop_sex,''未知'') --性别为空不要漏掉
                         and t3.marry_status_name=nvl(t1.mar_status,''未知'')--婚姻状况为空不要漏掉
                         and t4.education_name=nvl(t1.deg_edu,''未知'')--学历为空不要漏掉
                         and nvl(' || '''' || ele_region || '''' || '|| decode(substr(t1.gen_grid,1,1),''凌'',''E'',substr(t1.gen_grid,1,1)),''未知'')=t5.region_formname  --把 凌波社区居民网格 转为E网格
                         and t1.account_no not in(select s.account_no from tmp_pop_basic_info s)
                         and t1.account_no not in(select p.account_no from pop_basic_info p)';

    execute immediate exc_sql;
    v_effect_rows := sql%rowcount; --有效影响行数
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '抽取'  || src_tabname  ||'表数据到tmp_pop_basic_info中过程结束'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_POP_BASIC_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    commit;


     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新POP_BASIC_INFO表中已有，而'  || src_tabname  ||'表需要修改的有效版本数据为无效'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    /*把人口基本信息表中存在的证件号的数据的版本状态改为无效，此版本不为最新版本*/
    update pop_basic_info s
       set s.latestversion=0
     where s.latestversion=1
       and s.pop_type='N'
       and s.account_no in(select t.account_no from tmp_pop_basic_info t);

    v_effect_rows := sql%rowcount; --有效影响行数
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '更新POP_BASIC_INFO的版本数据结束'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    commit;

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '开始把TMP_POP_BASIC_INFO的数据插入到pop_basic_info表中'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    /*向人口基本信息表中插入临时表的数据*/
    insert into pop_basic_info  select * from tmp_pop_basic_info;

    v_effect_rows := sql%rowcount; --有效影响行数
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '插入POP_BASIC_INFO表的数据结束'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    commit;

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '开始清空TMP_POP_BASIC_INFO表的数据'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

    delete from tmp_pop_basic_info;

    v_effect_rows := sql%rowcount; --有效影响行数
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '清空TMP_POP_BASIC_INFO表的数据数据结束'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    commit;

    else
      /*当人口类型为非正常人时，只记录身份证号和姓名*/
       exc_sql := 'insert into tmp_pop_basic_info(account_no,pop_name,pop_type,region_code,region,gen_grid,time_stamp,sort_id,description,create_date,modified_date,version_status,version,latestversion,approvalstae,src_entity,src_community,patch_code)
                      select                         /*证件号在正常人中匹配到*/
                            t1.account_no,
                            t1.pop_name,
                             '|| '''' || ele_type || '''' || ',
                            ''9999'',
                            ''未知'',
                            ''未知'',
                            t1.time,
                            ' || '''' || v_sortid || '''' || ',
                            ''调用存储过程'',
                            sysdate,
                            sysdate,
                            1,
                            s.version+1,
                            1,
                            0,
                            ' || '''' || src_tabname || '''' || '，
                            ''未知'',
                            ' || '''' || v_patch || '''' || '
                      from '  || src_tabname  ||' t1,
                             pop_basic_info s
                      where t1.time>= to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'')  --增量抽取
                        and t1.time < to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'') + 1
                        and t1.account_no=s.account_no
                        and s.patch_code=' || '''' || v_patch || '''' || '
                        and s.pop_type=''N''
                        and s.latestversion=1
                    union all
                     select                         /*证件号在正常人中匹配到*/
                            t1.account_no,
                            t1.pop_name,
                             '|| '''' || ele_type || '''' || ',
                            ''9999'',
                            ''未知'',
                            ''未知'',
                            t1.time,
                            ' || '''' || v_sortid || '''' || ',
                            ''调用存储过程'',
                            sysdate,
                            sysdate,
                            1,
                            1,
                            1,
                            0,
                            ' || '''' || src_tabname || '''' || '，
                            ''未知'',
                            ' || '''' || v_patch || '''' || '
                      from '  || src_tabname  ||' t1,
                             pop_basic_info s
                      where t1.time>= to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'')  --增量抽取
                        and t1.time < to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'') + 1
                        and t1.account_no=s.account_no
                        and s.patch_code=' || '''' || v_patch || '''' || '
                        and s.pop_type=''N''
                        and s.latestversion=1
                        and ' || '''' || v_patch || '''' || ' not in (select distinct patch_code  from pop_basic_info)
                    union all
                       select                        /*证件号在正常人中匹配不到*/
                            t1.account_no,
                            t1.pop_name,
                            '|| '''' || ele_type || '''' || ',
                            ''9999'',
                            ''未知'',
                            ''未知'',
                            t1.time,
                            ' || '''' || v_sortid || '''' || ',
                            ''调用存储过程'',
                            sysdate,
                            sysdate,
                            1,
                            max_version+1,
                            1,
                            0,
                            ' || '''' || src_tabname || '''' || '，
                            ''未知'',
                            ' || '''' || v_patch || '''' || '
                      from '  || src_tabname  ||' t1,
                           (select account_no,patch_code,max(version) max_version from pop_basic_info where pop_type!=''N'' group by account_no,patch_code ) s
                      where t1.time>= to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'')  --增量抽取
                        and t1.time < to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'') + 1
                        and t1.account_no not in(select s.account_no from pop_basic_info s where s.pop_type=''N'' and s.latestversion=1)
                        and t1.account_no =s.account_no
                        and s.patch_code=' || '''' || v_patch || '''' || '
                      union all
                      select                        /*证件号在正常人中匹配不到*/
                            t1.account_no,
                            t1.pop_name,
                            '|| '''' || ele_type || '''' || ',
                            ''9999'',
                            ''未知'',
                            ''未知'',
                            t1.time,
                            ' || '''' || v_sortid || '''' || ',
                            ''调用存储过程'',
                            sysdate,
                            sysdate,
                            1,
                            max_version+1,
                            1,
                            0,
                            ' || '''' || src_tabname || '''' || '，
                            ''未知'',
                            ' || '''' || v_patch || '''' || '
                      from '  || src_tabname  ||' t1,
                           (select account_no,patch_code,max(version) max_version from pop_basic_info where pop_type!=''N'' group by account_no,patch_code ) s
                      where t1.time>= to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'')  --增量抽取
                        and t1.time < to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'') + 1
                        and t1.account_no not in(select s.account_no from pop_basic_info s where s.pop_type=''N'' and s.latestversion=1)
                        and t1.account_no =s.account_no
                        and ' || '''' || v_patch || '''' || ' not in (select distinct patch_code  from pop_basic_info)
                      union all
                        select                        /*证件号在正常和非正常人中匹配不到*/
                            t1.account_no,
                            t1.pop_name,
                            '|| '''' || ele_type || '''' || ',
                            ''9999'',
                            ''未知'',
                            ''未知'',
                            t1.time,
                            ' || '''' || v_sortid || '''' || ',
                            ''调用存储过程'',
                            sysdate,
                            sysdate,
                            1,
                            1,
                            1,
                            0,
                            ' || '''' || src_tabname || '''' || '，
                            ''未知'',
                            ' || '''' || v_patch || '''' || '
                      from '  || src_tabname  ||' t1
                      where t1.time>= to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'')  --增量抽取
                        and t1.time < to_date(' || '''' || iv_date || '''' || ' , ''yyyymmdd'') + 1 
                        and t1.account_no not in(select s.account_no from pop_basic_info s where s.pop_type=''N'' and s.latestversion=1)
                        and t1.account_no not in(select s.account_no from pop_basic_info s where s.pop_type!=''N'')';
    dbms_output.put_line(exc_sql);
    execute immediate exc_sql;

    v_effect_rows := sql%rowcount; --有效影响行数
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '抽取'  || src_tabname  ||'表数据到tmp_pop_basic_info中过程结束'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_POP_BASIC_INFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    commit;
    end if;

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '开始把TMP_POP_BASIC_INFO的数据插入到pop_basic_info表中'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    /*向人口基本信息表中插入临时表的数据*/
    merge into pop_basic_info  t
       using (select a.* from  tmp_pop_basic_info a  ) s
         on (t.account_no = s.account_no and t.latestversion=1 and t.patch_code=v_patch)
       when matched then
       update set  t.pop_type  = case when instr(t.pop_type ,s.pop_type) >0 then t.pop_type  --如果更新之前的类型存在此类型，则人口类型不变
                                      else t.pop_type ||'&'||s.pop_type  end,     --如果更新之前的类型不存在此类型，则把给类型添加到人口类型中去，用&合并
                   t.src_entity = case when instr(t.src_entity ,s.src_entity) >0 then t.src_entity
                                        else t.src_entity ||'&'||s.src_entity  end
       where t.pop_type != s.pop_type
         --and t.src_tabname != s.src_tabname
         --and t.bus_date != s.bus_date
       when not matched then
       insert   (account_no      ,
                 pop_name        ,
                 pop_type        ,
                 region_code     ，
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

    v_effect_rows := sql%rowcount; --有效影响行数
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '插入POP_BASIC_INFO表的数据结束'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    commit;

    exit when ele_indx = ele_cnt;
    end loop;

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '开始清空TMP_POP_BASIC_INFO表的数据'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

    --delete from tmp_pop_basic_info;

    v_effect_rows := sql%rowcount; --有效影响行数
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '清空TMP_POP_BASIC_INFO表的数据数据结束'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新是否育龄字段is_childbear_age开始'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    update  POP_BASIC_INFO
    set  is_Childbear_age_code =  case when pop_sex_code='F' and trunc(months_between(sysdate,birthday)/12) between 15 and 49 then 'Y'
                                       when birthday is not null then 'N' end,
         is_childbear_age = case when pop_sex_code='F' and trunc(months_between(sysdate,birthday)/12) between 15 and 49 then '是'
                                 when birthday is not null then '否' end;

    v_effect_rows := sql%rowcount; --有效影响行数
    commit;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '更新是否育龄字段is_childbear_age结束'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '开始更新sys_md_apply_cfg表中的数据'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    /*如果sys_md_apply_cfg表中添加pop_basic_info，则需要添加*/
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
    v_effect_rows := sql%rowcount; --有效影响行数
    commit;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '更新sys_md_apply_cfg表中的数据结束'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新sys_md_select_cfg表中的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     /*更新主数据集下拉框选择表的数据*/
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
     v_effect_rows := sql%rowcount; --有效影响行数
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新sys_md_select_cfg表中的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   /*************************正常处理***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '程序执行完成'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********异常处理，也可以在其它需要进行异常控制的地方加入异常处理*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into POP_BASIC_INFO fail: ' || substr(sqlerrm, 1, 300); --异常日志信息
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_PRJ_BASEINFO
prompt ===================================
prompt
create or replace procedure prc_prj_baseinfo ---土地经营类项目基本信息
(
    iv_date    in varchar2  -- 数据统计日期，格式：yyyymmdd
)
is
/*************************************************************************************************
  * 目标表：AC_PRJ_BASEINFO、LC_PRJ_BASEINFO(土地经营类项目基本信息)
  * 源表：SRC0202_PLN_PROJECT
  * 方式：     增量
  * 运行频度： 按需
  * 任务功能说明: 加载项目表的有关土地经营类项目基本信息的数据
  * 输入参数： iv_date    处理日期，格式：yyyymmdd
  * 输出参数： 无
  * 作者：        黄蓉
  * 创建日期：    2017-7-11
  *
  * 修改记录
  *************************************************************************************************
  * 修改人                  修改日期          修改内容
  *************************************************************************************************/
  v_proc_name   varchar2(32) := 'PRC_AC_PRJ_BASEINFO'; --存储过程名
  v_tab_name    varchar2(32) := 'AC_PRJ_BASEINFO';
  v_step_name   varchar2(200):= '加载土地经营类项目基本信息表数据'; --步骤名称
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --结束时间
  v_error_flag  varchar2(4)  := '0'; --错误标志（0，正常；1，错误）
  v_log_mess    varchar2(300) := 'merge into ac_prj_baseinfo normal'; --日志信息
  v_effect_rows number := 0; --有效影响行数
  v_proc_id     number := seq_proc_log.nextval; --存储过程的ID号
  v_sortid_ac   number;
  v_sortid_lc   number;
begin
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '程序开始执行'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   
    select nvl(max(sort_id),0)+1 into v_sortid_ac from ac_prj_baseinfo ;--获取ac_prj_baseinfo表中最大的排序号
    
    select nvl(max(sort_id),0)+1 into v_sortid_lc from lc_prj_baseinfo ;--获取lc_prj_baseinfo表中最大的排序号

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始清空TMP_AC_PRJ_BASEINFO表的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

   delete from tmp_ac_prj_baseinfo;

   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '清空TMP_AC_PRJ_BASEINFO表的数据数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始清空目标表执行时间的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

   delete from ac_prj_baseinfo c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---删除需要重跑的数据
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;
   
   delete from lc_prj_baseinfo c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---删除需要重跑的数据
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;

   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '清空目标表执行时间的数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_BASEINFO表中'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

  /*插入管委会的土地经营类项目基本信息临时表的数据*/
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
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT',
            v_sortid_ac
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from ac_prj_baseinfo s group by s.project_id) a
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
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
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT'，
            v_sortid_ac
      from src0202_pln_project t1
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.program_id='194'
       and t1.project_id not in (select s.project_id from ac_prj_baseinfo s );
       
     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_BASEINFO表结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新AC_PRJ_BASEINFO表中已有，而PLN_PROJECT表需要修改的有效版本数据为无效'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     update ac_prj_baseinfo s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_baseinfo t);

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新AC_PRJ_BASEINFO的版本数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始把TMP_AC_PRJ_BASEINFO的数据插入到AC_PRJ_BASEINFO表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     insert into ac_prj_baseinfo select * from tmp_ac_prj_baseinfo;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '插入AC_PRJ_BASEINFO表的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;       
       
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始清空TMP_AC_PRJ_BASEINFO表的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     delete from tmp_ac_prj_baseinfo;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '清空TMP_AC_PRJ_BASEINFO表的数据数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_BASEINFO表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

 /*插入开发公司的土地经营类项目基本信息临时表的数据*/
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
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT'，
            v_sortid_lc
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from lc_prj_baseinfo s group by s.project_id) a
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
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
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT',
            v_sortid_lc
      from src0202_pln_project t1
     where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.program_id='195'
       and t1.project_id not in (select s.project_id from lc_prj_baseinfo s );

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_BASEINFO表结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新LC_PRJ_BASEINFO表中已有，而SRC0202_PLN_PROJECT表需要修改的有效版本数据为无效'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'LC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     update lc_prj_baseinfo s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_baseinfo t);

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新LC_PRJ_BASEINFO的版本数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'LC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始把TMP_AC_PRJ_BASEINFO的数据插入到LC_PRJ_BASEINFO表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'LC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     insert into lc_prj_baseinfo select * from tmp_ac_prj_baseinfo;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '插入LC_PRJ_BASEINFO表的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'LC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始清空TMP_AC_PRJ_BASEINFO表的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     delete from tmp_ac_prj_baseinfo;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '清空TMP_AC_PRJ_BASEINFO表的数据数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_BASEINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;
     
    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '开始更新sys_md_apply_cfg表中的数据'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    
    /*如果sys_md_apply_cfg表中没有添加目标表，则需要添加*/
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
    v_effect_rows := sql%rowcount; --有效影响行数
    commit;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '更新sys_md_apply_cfg表中的数据结束'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

  /*************************正常处理***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '程序执行完成'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********异常处理，也可以在其它需要进行异常控制的地方加入异常处理*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into ac_prj_baseinfo fail: ' || substr(sqlerrm, 1, 300); --异常日志信息
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_PRJ_CONTRACT
prompt ===================================
prompt
create or replace procedure prc_prj_contract ---相关合同表
(
    iv_date    in varchar2  -- 数据统计日期，格式：yyyymmdd
)
is
/*************************************************************************************************
  * 目标表：AC_PRJ_CONTRACT、LC_PRJ_CONTRACT(相关合同表)
  * 源表：SRC0202_PLN_PROJECT
  * 方式：     增量
  * 运行频度： 按需
  * 任务功能说明: 加载项目表的有关相关合同表的数据
  * 输入参数： iv_date    处理日期，格式：yyyymmdd
  * 输出参数： 无
  * 作者：        黄蓉
  * 创建日期：    2017-7-11
  *
  * 修改记录
  *************************************************************************************************
  * 修改人                  修改日期          修改内容
  *************************************************************************************************/
  v_proc_name   varchar2(32) := 'PRC_AC_PRJ_CONTRACT'; --存储过程名
  v_tab_name    varchar2(32) := 'AC_PRJ_CONTRACT';
  v_step_name   varchar2(200):= '加载相关合同表数据'; --步骤名称
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --结束时间
  v_error_flag  varchar2(4)  := '0'; --错误标志（0，正常；1，错误）
  v_log_mess    varchar2(300) := 'merge into ac_prj_contract normal'; --日志信息
  v_effect_rows number := 0; --有效影响行数
  v_proc_id     number := seq_proc_log.nextval; --存储过程的ID号
  v_sortid_ac   number;
  v_sortid_lc   number;
begin
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '程序开始执行'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   
    select nvl(max(sort_id),0)+1 into v_sortid_ac from ac_prj_contract ;--获取ac_prj_baseinfo表中最大的排序号
    
    select nvl(max(sort_id),0)+1 into v_sortid_lc from lc_prj_contract ;--获取lc_prj_baseinfo表中最大的排序号

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始清空TMP_AC_PRJ_CONTRACT表的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_CONTRACT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

   delete from tmp_ac_prj_contract;

   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '清空TMP_AC_PRJ_CONTRACT表的数据数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_CONTRACT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始清空目标表执行时间的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

   delete from ac_prj_contract c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---删除需要重跑的数据
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;
           
   delete from lc_prj_contract c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---删除需要重跑的数据
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;       
   

   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '清空目标表执行时间的数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_CONTRACT表中'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_CONTRACT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

  /*插入管委会的相关合同临时表的数据*/
    insert into tmp_ac_prj_contract(project_id,project_code,contractcode,description,create_date,modified_date,version_status,version,latestversion,approvalstae, bus_date,src_table,src_system,sort_id)
     select
            t1.project_id,
            t1.project_shortname,
            t1.contract_id,
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT',
            v_sortid_ac
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from ac_prj_contract s group by s.project_id) a
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.project_id=a.project_id
       and t1.program_id='194'
    union all
    select  t1.project_id,
            t1.project_shortname,
            t1.contract_id,
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT',
            v_sortid_ac
      from src0202_pln_project t1
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.program_id='194'
       and t1.project_id not in (select s.project_id from ac_prj_contract s );

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_CONTRACT表结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_CONTRACT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新AC_PRJ_CONTRACT表中已有，而SRC0202_PLN_PROJECT表需要修改的有效版本数据为无效'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     update ac_prj_contract s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_contract t);

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新AC_PRJ_CONTRACT的版本数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始把TMP_AC_PRJ_CONTRACT的数据插入到AC_PRJ_CONTRACT表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     insert into ac_prj_contract select * from tmp_ac_prj_contract;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '插入AC_PRJ_CONTRACT表的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始清空TMP_AC_PRJ_CONTRACT表的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_CONTRACT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     delete from tmp_ac_prj_contract;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '清空TMP_AC_PRJ_CONTRACT表的数据数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_CONTRACT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_CONTRACT表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_CONTRACT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
     /*插入开发公司的相关合同临时表的数据*/
    insert into tmp_ac_prj_contract(project_id,project_code,contractcode,description,create_date,modified_date,version_status,version,latestversion,approvalstae, bus_date,src_table,src_system,sort_id)
     select
            t1.project_id,
            t1.project_shortname,
            t1.contract_id,
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT',
            v_sortid_lc
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from lc_prj_contract s group by s.project_id) a
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.project_id=a.project_id
       and t1.program_id='195'
    union all
    select  t1.project_id,
            t1.project_shortname,
            t1.contract_id,
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT',
            v_sortid_lc
      from src0202_pln_project t1
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.program_id='195'
       and t1.project_id not in (select s.project_id from lc_prj_contract s );

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_CONTRACT表结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_CONTRACT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新LC_PRJ_CONTRACT表中已有，而SRC0202_PLN_PROJECT表需要修改的有效版本数据为无效'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     update lc_prj_contract s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_contract t);

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新LC_PRJ_CONTRACT的版本数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始把TMP_AC_PRJ_CONTRACT的数据插入到LC_PRJ_CONTRACT表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     insert into lc_prj_contract select * from tmp_ac_prj_contract;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '插入LC_PRJ_CONTRACT表的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始清空TMP_AC_PRJ_CONTRACT表的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_CONTRACT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     delete from tmp_ac_prj_contract;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '清空TMP_AC_PRJ_CONTRACT表的数据数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_CONTRACT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '开始更新sys_md_apply_cfg表中的数据'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    
    /*如果sys_md_apply_cfg表中没有添加目标表，则需要添加*/
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
    v_effect_rows := sql%rowcount; --有效影响行数
    commit;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '更新sys_md_apply_cfg表中的数据结束'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

  /*************************正常处理***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '程序执行完成'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********异常处理，也可以在其它需要进行异常控制的地方加入异常处理*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into ac_prj_contract fail: ' || substr(sqlerrm, 1, 300); --异常日志信息
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_PRJ_INVESTINFO
prompt =====================================
prompt
create or replace procedure prc_prj_investinfo ---投资总额表
(
    iv_date    in varchar2  -- 数据统计日期，格式：yyyymmdd
)
is
/*************************************************************************************************
  * 目标表：AC_PRJ_INVESTINFO、LC_PRJ_INVESTINFO(投资总额表)
  * 源表：SRC0202_PLN_PROJECT
  * 方式：     增量
  * 运行频度： 按需
  * 任务功能说明: 加载项目表的有关投资总额表的数据
  * 输入参数： iv_date    处理日期，格式：yyyymmdd
  * 输出参数： 无
  * 作者：        黄蓉
  * 创建日期：    2017-7-11
  *
  * 修改记录
  *************************************************************************************************
  * 修改人                  修改日期          修改内容
  *************************************************************************************************/
  v_proc_name   varchar2(32) := 'PRC_AC_PRJ_INVESTINFO'; --存储过程名
  v_tab_name    varchar2(32) := 'AC_PRJ_INVESTINFO';
  v_step_name   varchar2(200):= '加载投资总额表数据'; --步骤名称
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --结束时间
  v_error_flag  varchar2(4)  := '0'; --错误标志（0，正常；1，错误）
  v_log_mess    varchar2(300) := 'merge into AC_PRJ_INVESTINFO normal'; --日志信息
  v_effect_rows number := 0; --有效影响行数
  v_proc_id     number := seq_proc_log.nextval; --存储过程的ID号
  v_sortid_ac   number;
  v_sortid_lc   number;
begin
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '程序开始执行'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   
      
    select nvl(max(sort_id),0)+1 into v_sortid_ac from ac_prj_investinfo ;--获取ac_prj_contract表中最大的排序号
    
    select nvl(max(sort_id),0)+1 into v_sortid_lc from lc_prj_investinfo ;--获取lc_prj_contract表中最大的排序号

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始清空TMP_AC_PRJ_INVESTINFO表的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

   delete from tmp_ac_prj_investinfo;

   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '清空TMP_AC_PRJ_INVESTINFO表的数据数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始清空目标表执行时间的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

   delete from ac_prj_investinfo c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---删除需要重跑的数据
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;
           
   delete from lc_prj_investinfo c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---删除需要重跑的数据
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;
           
   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '清空目标表执行时间的数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_INVESTINFO表中'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

  /*插入管委会的投资总额临时表的数据*/
    insert into tmp_ac_prj_investinfo(project_id,project_code,originalamount,currentamount,description,create_date,modified_date,version_status,version,latestversion,approvalstae,bus_date,src_table,src_system,sort_id)
     select
            t1.project_id,
            t1.project_shortname,
            t1.totalinvest,
            c.currentinvest,
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT',
            v_sortid_ac
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from ac_prj_investinfo s group by s.project_id) a,
           (select project_id,sum(thisyearinvest) currentinvest from src0202_pln_project group by project_id) c
    where  t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.project_id=a.project_id
       and t1.project_id=c.project_id
       and t1.program_id='194'
    union all
    select  t1.project_id,
            t1.project_shortname,
            t1.totalinvest,
            c.currentinvest,
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT',
            v_sortid_ac
      from src0202_pln_project t1,
           (select project_id,sum(thisyearinvest) currentinvest from src0202_pln_project group by project_id) c
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.project_id=c.project_id
       and t1.program_id='194'       
       and t1.project_id not in (select s.project_id from ac_prj_investinfo s );

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_INVESTINFO表结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新AC_PRJ_INVESTINFO表中已有，而SRC0202_PLN_PROJECT表需要修改的有效版本数据为无效'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     update ac_prj_investinfo s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_investinfo t);

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新AC_PRJ_INVESTINFO的版本数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始把TMP_AC_PRJ_INVESTINFO的数据插入到AC_PRJ_INVESTINFO表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     insert into ac_prj_investinfo select * from tmp_ac_prj_investinfo;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '插入AC_PRJ_INVESTINFO表的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始清空TMP_AC_PRJ_INVESTINFO表的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     delete from tmp_ac_prj_investinfo;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '清空TMP_AC_PRJ_INVESTINFO表的数据数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_INVESTINFO表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

    /*插入开发公司的投资总额临时表的数据*/
     insert into tmp_ac_prj_investinfo(project_id,project_code,originalamount,currentamount,description,create_date,modified_date,version_status,version,latestversion,approvalstae,bus_date,src_table,src_system,sort_id)
      select
            t1.project_id,
            t1.project_shortname,
            t1.totalinvest,
            c.currentinvest,
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT',
            v_sortid_lc
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from lc_prj_investinfo s group by s.project_id) a,
           (select project_id,sum(thisyearinvest) currentinvest from src0202_pln_project group by project_id) c
    where  t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.project_id=a.project_id
       and t1.project_id=c.project_id
       and t1.program_id='195'
    union all
    select  t1.project_id,
            t1.project_shortname,
            t1.totalinvest,
            c.currentinvest,
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT',
            v_sortid_lc
      from src0202_pln_project t1,
           (select project_id,sum(thisyearinvest) currentinvest from src0202_pln_project group by project_id) c
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.project_id=c.project_id
       and t1.program_id='195'       
       and t1.project_id not in (select s.project_id from lc_prj_investinfo s );

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_INVESTINFO表结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新LC_PRJ_INVESTINFO表中已有，而SRC0202_PLN_PROJECT表需要修改的有效版本数据为无效'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     update lc_prj_investinfo s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_investinfo t);

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新LC_PRJ_INVESTINFO的版本数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始把TMP_AC_PRJ_INVESTINFO的数据插入到LC_PRJ_INVESTINFO表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     insert into lc_prj_investinfo select * from tmp_ac_prj_investinfo;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '插入LC_PRJ_INVESTINFO表的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始清空TMP_AC_PRJ_INVESTINFO表的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     delete from tmp_ac_prj_investinfo;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '清空TMP_AC_PRJ_INVESTINFO表的数据数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTINFO', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '开始更新sys_md_apply_cfg表中的数据'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    
    /*如果sys_md_apply_cfg表中没有添加目标表，则需要添加*/
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
    v_effect_rows := sql%rowcount; --有效影响行数
    commit;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '更新sys_md_apply_cfg表中的数据结束'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

  /*************************正常处理***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '程序执行完成'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********异常处理，也可以在其它需要进行异常控制的地方加入异常处理*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into AC_PRJ_INVESTINFO fail: ' || substr(sqlerrm, 1, 300); --异常日志信息
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_PRJ_INVESTMENT
prompt =====================================
prompt
create or replace procedure prc_prj_investment ---投资总额表
(
    iv_date    in varchar2  -- 数据统计日期，格式：yyyymmdd
)
is
/*************************************************************************************************
  * 目标表：AC_PRJ_INVESTMENT、LC_PRJ_INVESTMENT(投资总额表)
  * 源表：SRC0202_PLN_PROJECT
  * 方式：     增量
  * 运行频度： 按需
  * 任务功能说明: 加载项目表的有关投资总额表的数据
  * 输入参数： iv_date    处理日期，格式：yyyymmdd
  * 输出参数： 无
  * 作者：        黄蓉
  * 创建日期：    2017-7-11
  *
  * 修改记录
  *************************************************************************************************
  * 修改人                  修改日期          修改内容
  *************************************************************************************************/
  v_proc_name   varchar2(32) := 'PRC_AC_PRJ_INVESTMENT'; --存储过程名
  v_tab_name1    varchar2(32) := 'AC_PRJ_INVESTMENT';
  v_tab_name2    varchar2(32) := 'LC_PRJ_INVESTMENT';
  v_step_name   varchar2(200):= '加载投资总额表数据'; --步骤名称
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --结束时间
  v_error_flag  varchar2(4)  := '0'; --错误标志（0，正常；1，错误）
  v_log_mess    varchar2(300) := 'merge into ac_prj_investment normal'; --日志信息
  v_effect_rows number := 0; --有效影响行数
  v_proc_id     number := seq_proc_log.nextval; --存储过程的ID号
  v_sortid_ac   number;
  v_sortid_lc   number;
begin
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '程序开始执行'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间


    select nvl(max(sort_id),0)+1 into v_sortid_ac from ac_prj_investment ;--获取ac_prj_contract表中最大的排序号

    select nvl(max(sort_id),0)+1 into v_sortid_lc from lc_prj_investment ;--获取lc_prj_contract表中最大的排序号

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始清空TMP_AC_PRJ_INVESTMENT表的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTMENT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

   delete from tmp_ac_prj_investment;

   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '清空TMP_AC_PRJ_INVESTMENT表的数据数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTMENT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始清空目标表执行时间的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

   delete from ac_prj_investment c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---删除需要重跑的数据
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;

   delete from lc_prj_investment c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---删除需要重跑的数据
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;

   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '清空目标表执行时间的数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_INVESTMENT表中'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTMENT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

  /*插入管委会的投资总额临时表的数据*/
    insert into tmp_ac_prj_investment(project_id,project_code,originalamount,currentamount,contractcode,description,create_date,modified_date,version_status,version,latestversion,approvalstae,bus_date,src_table,src_system,sort_id)
     select
            t1.project_id,
            t1.project_shortname,
            t1.totalinvest,
            c.currentinvest,
            t1.contract_id,
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT',
            v_sortid_ac
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from ac_prj_investment s group by s.project_id) a,
           (select project_id,sum(thisyearinvest) currentinvest from src0202_pln_project group by project_id) c
    where  t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
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
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT',
            v_sortid_ac
      from src0202_pln_project t1,
           (select project_id,sum(thisyearinvest) currentinvest from src0202_pln_project group by project_id) c
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
       and t1.update_date<=to_date(iv_date,'yyyymmdd')-1
       and t1.project_id=c.project_id
       and t1.program_id='194'
       and t1.project_id not in (select s.project_id from ac_prj_investment s );

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_INVESTMENT表结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTMENT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新AC_PRJ_INVESTMENT表中已有，而SRC0202_PLN_PROJECT表需要修改的有效版本数据为无效'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     update ac_prj_investment s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_investment t);

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新AC_PRJ_INVESTMENT的版本数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始把TMP_AC_PRJ_INVESTMENT的数据插入到AC_PRJ_INVESTMENT表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     insert into ac_prj_investment select * from tmp_ac_prj_investment;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '插入AC_PRJ_INVESTMENT表的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始清空TMP_AC_PRJ_INVESTMENT表的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTMENT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     delete from tmp_ac_prj_investment;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '清空TMP_AC_PRJ_INVESTMENT表的数据数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTMENT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_INVESTMENT表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTMENT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

    /*插入开发公司的投资总额临时表的数据*/
     insert into tmp_ac_prj_investment(project_id,project_code,originalamount,currentamount,contractcode,description,create_date,modified_date,version_status,version,latestversion,approvalstae,bus_date,src_table,src_system,sort_id)
      select
            t1.project_id,
            t1.project_shortname,
            t1.totalinvest,
            c.currentinvest,
            t1.contract_id,
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT',
            v_sortid_lc
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from lc_prj_investment s group by s.project_id) a,
           (select project_id,sum(thisyearinvest) currentinvest from src0202_pln_project group by project_id) c
    where  t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
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
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT',
            v_sortid_lc
      from src0202_pln_project t1,
           (select project_id,sum(thisyearinvest) currentinvest from src0202_pln_project group by project_id) c
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
       and t1.update_date<=to_date(iv_date,'yyyymmdd')-1
       and t1.project_id=c.project_id
       and t1.program_id='195'
       and t1.project_id not in (select s.project_id from lc_prj_investment s );

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_INVESTMENT表结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTMENT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新LC_PRJ_INVESTMENT表中已有，而SRC0202_PLN_PROJECT表需要修改的有效版本数据为无效'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name2, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     update lc_prj_investment s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_investment t);

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新LC_PRJ_INVESTMENT的版本数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name2, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始把TMP_AC_PRJ_INVESTMENT的数据插入到LC_PRJ_INVESTMENT表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name2, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     insert into lc_prj_investment select * from tmp_ac_prj_investment;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '插入LC_PRJ_INVESTMENT表的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name2, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始清空TMP_AC_PRJ_INVESTMENT表的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTMENT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     delete from tmp_ac_prj_investment;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '清空TMP_AC_PRJ_INVESTMENT表的数据数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_INVESTMENT', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '开始更新sys_md_apply_cfg表中的数据'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

    /*如果sys_md_apply_cfg表中没有添加目标表，则需要添加*/
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
    v_effect_rows := sql%rowcount; --有效影响行数
    commit;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '更新sys_md_apply_cfg表中的数据结束'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新sys_md_select_cfg表中的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
     /*更新主数据集下拉框选择表的数据*/
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
     v_effect_rows := sql%rowcount; --有效影响行数
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新sys_md_select_cfg表中的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间   
  /*************************正常处理***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '程序执行完成'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name2, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********异常处理，也可以在其它需要进行异常控制的地方加入异常处理*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into ac_prj_investment fail: ' || substr(sqlerrm, 1, 300); --异常日志信息
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_PRJ_LAND
prompt ===============================
prompt
create or replace procedure prc_prj_land ---地块信息表
(
    iv_date    in varchar2  -- 数据统计日期，格式：yyyymmdd
)
is
/*************************************************************************************************
  * 目标表：AC_PRJ_LAND、LC_PRJ_LAND(地块信息表)
  * 源表：SRC0202_PLN_PROJECT
  * 方式：     增量
  * 运行频度： 按需
  * 任务功能说明: 加载项目表的有关地块信息表的数据
  * 输入参数： iv_date    处理日期，格式：yyyymmdd
  * 输出参数： 无
  * 作者：        黄蓉
  * 创建日期：    2017-7-11
  *
  * 修改记录
  *************************************************************************************************
  * 修改人                  修改日期          修改内容
  *************************************************************************************************/
  v_proc_name   varchar2(32) := 'PRC_AC_PRJ_LAND'; --存储过程名
  v_tab_name    varchar2(32) := 'AC_PRJ_LAND';
  v_step_name   varchar2(200):= '加载地块信息表数据'; --步骤名称
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --结束时间
  v_error_flag  varchar2(4)  := '0'; --错误标志（0，正常；1，错误）
  v_log_mess    varchar2(300) := 'merge into ac_prj_land normal'; --日志信息
  v_effect_rows number := 0; --有效影响行数
  v_proc_id     number := seq_proc_log.nextval; --存储过程的ID号
  v_sortid_ac   number;
  v_sortid_lc   number;
begin
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '程序开始执行'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   
    select nvl(max(sort_id),0)+1 into v_sortid_ac from ac_prj_land ;--获取ac_prj_land表中最大的排序号
    
    select nvl(max(sort_id),0)+1 into v_sortid_lc from lc_prj_land ;--获取lc_prj_land表中最大的排序号

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始清空TMP_AC_PRJ_LAND表的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LAND', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

   delete from tmp_ac_prj_land;

   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '清空TMP_AC_PRJ_LAND表的数据数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LAND', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始清空目标表执行时间的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

   delete from ac_prj_land c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---删除需要重跑的数据
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;
           
   delete from lc_prj_land c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---删除需要重跑的数据
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;

   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '清空目标表执行时间的数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_LAND表中'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LAND', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

  /*插入管委会的地块信息临时表的数据*/
    insert into tmp_ac_prj_land(project_id,project_code,code,arrivesate,description,create_date, modified_date, version_status, version, latestversion, approvalstae, bus_date,src_table,src_system,sort_id)
     select
            t1.project_id,
            t1.project_shortname,
            t1.dikuai_code,
            t1.plan_state,
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT',
            v_sortid_ac
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from ac_prj_land s group by s.project_id) a
    where  t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.project_id=a.project_id
       and t1.program_id='194'
    union all
    select  t1.project_id,
            t1.project_shortname,
            t1.dikuai_code,
            t1.plan_state,
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT',
            v_sortid_ac
      from src0202_pln_project t1
    where  t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.program_id='194'
       and t1.project_id not in (select s.project_id from ac_prj_land s );

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_LAND表结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LAND', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新AC_PRJ_LAND表中已有，而SRC0202_PLN_PROJECT表需要修改的有效版本数据为无效'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     update ac_prj_land s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_land t);

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新AC_PRJ_LAND的版本数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始把TMP_AC_PRJ_LAND的数据插入到AC_PRJ_LAND表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     insert into ac_prj_land select * from tmp_ac_prj_land;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '插入AC_PRJ_LAND表的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始清空TMP_AC_PRJ_LAND表的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LAND', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     delete from tmp_ac_prj_land;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '清空TMP_AC_PRJ_LAND表的数据数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LAND', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;
     
     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_LAND表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LAND', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

  /*插入开发公司的地块信息临时表的数据*/
    insert into tmp_ac_prj_land(project_id,project_code,code,arrivesate,description,create_date, modified_date, version_status, version, latestversion, approvalstae, bus_date,src_table,src_system,sort_id)
     select
            t1.project_id,
            t1.project_shortname,
            t1.dikuai_code,
            t1.plan_state,
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT',
            v_sortid_lc
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from lc_prj_land s group by s.project_id) a
    where  t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.project_id=a.project_id
       and t1.program_id='194'
    union all
    select  t1.project_id,
            t1.project_shortname,
            t1.dikuai_code,
            t1.plan_state,
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT',
            v_sortid_lc
      from src0202_pln_project t1
    where  t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
       and t1.update_date<=to_date(iv_date,'yyyymmdd')
       and t1.program_id='194'
       and t1.project_id not in (select s.project_id from lc_prj_land s );

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_LAND表结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LAND', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新LC_PRJ_LAND表中已有，而SRC0202_PLN_PROJECT表需要修改的有效版本数据为无效'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     update lc_prj_land s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_land t);

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新LC_PRJ_LAND的版本数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始把TMP_AC_PRJ_LAND的数据插入到LC_PRJ_LAND表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     insert into lc_prj_land select * from tmp_ac_prj_land;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '插入LC_PRJ_LAND表的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始清空TMP_AC_PRJ_LAND表的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LAND', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     delete from tmp_ac_prj_land;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '清空TMP_AC_PRJ_LAND表的数据数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LAND', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '开始更新sys_md_apply_cfg表中的数据'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
    
    /*如果sys_md_apply_cfg表中没有添加目标表，则需要添加*/
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
    v_effect_rows := sql%rowcount; --有效影响行数
    commit;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '更新sys_md_apply_cfg表中的数据结束'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

  /*************************正常处理***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '程序执行完成'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********异常处理，也可以在其它需要进行异常控制的地方加入异常处理*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into ac_prj_land fail: ' || substr(sqlerrm, 1, 300); --异常日志信息
      prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    end;
end;
/

prompt
prompt Creating procedure PRC_PRJ_LANDPRJ
prompt ==================================
prompt
create or replace procedure prc_prj_landprj ---土地经营类项目基本信息
(
    iv_date    in varchar2  -- 数据统计日期，格式：yyyymmdd
)
is
/*************************************************************************************************
  * 目标表：AC_PRJ_LANDPRJ、LC_PRJ_LANDPRJ(土地经营类项目基本信息)
  * 源表：SRC0202_PLN_PROJECT
  * 方式：     增量
  * 运行频度： 按需
  * 任务功能说明: 加载项目表的有关土地经营类项目基本信息的数据
  * 输入参数： iv_date    处理日期，格式：yyyymmdd
  * 输出参数： 无
  * 作者：        黄蓉
  * 创建日期：    2017-7-11
  *
  * 修改记录
  *************************************************************************************************
  * 修改人                  修改日期          修改内容
  *************************************************************************************************/
  v_proc_name   varchar2(32) := 'PRC_PRJ_LANDPRJ'; --存储过程名
  v_tab_name1   varchar2(32) := 'AC_PRJ_LANDPRJ';
  v_tab_name2   varchar2(32) := 'LC_PRJ_LANDPRJ';
  v_step_name   varchar2(200):= '加载土地经营类项目基本信息表数据'; --步骤名称
  v_begin_time  varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
  v_end_time    varchar2(30) := to_char(sysdate, 'yyyymmddhh24miss'); --结束时间
  v_error_flag  varchar2(4)  := '0'; --错误标志（0，正常；1，错误）
  v_log_mess    varchar2(300) := 'merge into ac_prj_landprj normal'; --日志信息
  v_effect_rows number := 0; --有效影响行数
  v_proc_id     number := seq_proc_log.nextval; --存储过程的ID号
  v_sortid_ac   number;
  v_sortid_lc   number;
begin
   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '程序开始执行'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

    select nvl(max(sort_id),0)+1 into v_sortid_ac from ac_prj_landprj ;--获取AC_PRJ_LANDPRJ表中最大的排序号

    select nvl(max(sort_id),0)+1 into v_sortid_lc from lc_prj_landprj ;--获取LC_PRJ_LANDPRJ表中最大的排序号

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始清空TMP_AC_PRJ_LANDPRJ表的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

   delete from tmp_ac_prj_landprj;

   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '清空TMP_AC_PRJ_LANDPRJ表的数据数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始清空目标表执行时间的数据'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

   delete from ac_prj_landprj c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---删除需要重跑的数据
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;

   delete from LC_PRJ_LANDPRJ c
         where c.modified_date>= to_date(iv_date , 'yyyymmdd')         ---删除需要重跑的数据
           and c.modified_date < to_date(iv_date , 'yyyymmdd') + 1;

   v_effect_rows := sql%rowcount; --有效影响行数
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '清空目标表执行时间的数据结束'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
   commit;

   v_effect_rows := 0;
   v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
   v_step_name:= '开始抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_LANDPRJ表中'; --步骤名称
   prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
   v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

  /*插入管委会的土地经营类项目基本信息临时表的数据*/
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
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT',
            v_sortid_ac
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from ac_prj_landprj s group by s.project_id) a
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
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
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT'，
            v_sortid_ac
      from src0202_pln_project t1
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
       and t1.update_date<=to_date(iv_date,'yyyymmdd')-1
       and t1.program_id='194'
       and t1.project_id not in (select s.project_id from ac_prj_landprj s );

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_LANDPRJ表结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新AC_PRJ_LANDPRJ表中已有，而PLN_PROJECT表需要修改的有效版本数据为无效'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     update ac_prj_landprj s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_landprj t);

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新AC_PRJ_LANDPRJ的版本数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始把TMP_AC_PRJ_LANDPRJ的数据插入到AC_PRJ_LANDPRJ表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     insert into ac_prj_landprj select * from tmp_ac_prj_landprj;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '插入AC_PRJ_LANDPRJ表的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name1, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始清空TMP_AC_PRJ_LANDPRJ表的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     delete from tmp_ac_prj_landprj;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '清空TMP_AC_PRJ_LANDPRJ表的数据数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_LANDPRJ表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

 /*插入开发公司的土地经营类项目基本信息临时表的数据*/
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
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            a.max_version+1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT'，
            v_sortid_lc
      from src0202_pln_project t1,
           (select s.project_id,max(s.version) max_version from lc_prj_landprj s group by s.project_id) a
    where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
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
            '存储过程调用',
            sysdate,
            sysdate,
            1,
            1,
            1,
            1,
            to_date(to_char(t1.update_date,'yyyymm'),'yyyymm'),
            '0202_PMS系统',
            'SRC0202_PLN_PROJECT',
            v_sortid_lc
      from src0202_pln_project t1
     where t1.update_date>add_months(to_date(iv_date,'yyyymmdd'),-1) --更新过数据
       and t1.update_date<=to_date(iv_date,'yyyymmdd')-1
       and t1.program_id='195'
       and t1.project_id not in (select s.project_id from lc_prj_landprj s );

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '抽取SRC0202_PLN_PROJECT表数据插入更新到TMP_AC_PRJ_LANDPRJ表结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新LC_PRJ_LANDPRJ表中已有，而SRC0202_PLN_PROJECT表需要修改的有效版本数据为无效'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'LC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     update lc_prj_landprj s
        set s.latestversion=0
      where s.latestversion=1
        and s.project_id in(select t.project_id from tmp_ac_prj_landprj t);

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新LC_PRJ_LANDPRJ的版本数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'LC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始把TMP_AC_PRJ_LANDPRJ的数据插入到LC_PRJ_LANDPRJ表中'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'LC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     insert into lc_prj_landprj select * from tmp_ac_prj_landprj;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '插入LC_PRJ_LANDPRJ表的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'LC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始清空TMP_AC_PRJ_LANDPRJ表的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     delete from tmp_ac_prj_landprj;

     v_effect_rows := sql%rowcount; --有效影响行数
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '清空TMP_AC_PRJ_LANDPRJ表的数据数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'TMP_AC_PRJ_LANDPRJ', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     commit;

    v_effect_rows := 0;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '开始更新sys_md_apply_cfg表中的数据'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

    /*如果sys_md_apply_cfg表中没有添加目标表，则需要添加*/
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
    v_effect_rows := sql%rowcount; --有效影响行数
    commit;
    v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
    v_step_name:= '更新sys_md_apply_cfg表中的数据结束'; --步骤名称
    prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_APPLY_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
    v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间

     v_effect_rows := 0;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '开始更新sys_md_select_cfg表中的数据'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间
     
     /*更新主数据集下拉框选择表的数据*/
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
     v_effect_rows := sql%rowcount; --有效影响行数
     commit;
     v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
     v_step_name:= '更新sys_md_select_cfg表中的数据结束'; --步骤名称
     prc_proc_log(v_proc_id,iv_date,v_proc_name,'SYS_MD_SELECT_CFG', v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);
     v_begin_time := to_char(sysdate, 'yyyymmddhh24miss'); --开始时间   
  /*************************正常处理***************************************/
  v_effect_rows := 0;
  v_end_time := to_char(sysdate, 'yyyymmddhh24miss');
  v_step_name:= '程序执行完成'; --步骤名称
  prc_proc_log(v_proc_id,iv_date,v_proc_name,v_tab_name2, v_step_name, v_begin_time, v_end_time, v_error_flag, v_log_mess, v_effect_rows);

  /**********异常处理，也可以在其它需要进行异常控制的地方加入异常处理*********/
exception
  when others then
    begin
      rollback;
      v_end_time    := to_char(sysdate, 'yyyymmddhh24miss');
      v_error_flag  := '1';
      v_effect_rows := 0;
      v_log_mess    := 'merge into ac_prj_landprj fail: ' || substr(sqlerrm, 1, 300); --异常日志信息
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
 iv_proc      in varchar2,--创建或更新存储过程语句
 iv_sql       in varchar2,--提供的sql语句
 oi_err_msg   out varchar2,--返回sql报错信息
 oi_return    out integer, --返回sql结果的标志位
 oc_sql_data  out sys_refcursor, --返回结果集
 oi_tabname   out sys_refcursor, --返回sql查询的表名
 oi_viewname  out sys_refcursor --返回sql查询的视图名
)
is
tab_cnt varchar2(10);---统计sql语句中允许查询表的个数
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
                                        from meta_tar_entity t  --配置表
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
        oi_return :=-2; --sql执行的表不在规定的配置表，即查询的表是不允许查询的表，返回-2
        oi_err_msg :='没有权限查询sql语句中的表';
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
           oi_return :=0; --sql执行成功返回0
    end if;
exception
  when others then
    oi_err_msg  := substr(sqlerrm, 1, 300);
    oi_return :=-1;  --sql语句执行失败,返回-1
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
