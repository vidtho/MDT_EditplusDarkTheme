#TITLE=SQLplus DBA
#INFO
Cliptext Library for SQLplus written by ES-Computing.
This file is provided as a sample Cliptext library of EditPlus.
#SORT=n

#T=UserRoles
--  View roles givent to user
--==========================
select * from USER_ROLE_PRIVS;
#T=Explain-plan
--  Explain plan
--==========================

	SQL> EXPLAIN PLAN FOR select * from dept where deptno = 40;
	Explained.

	SQL> set linesize 132
	SQL> SELECT * FROM TABLE(dbms_xplan.display);

	SQL> SELECT sql_id, child_number FROM v$sql  WHERE sql_text LIKE 'SELECT dd.value_date%';

	SQL_ID        CHILD_NUMBER
	------------- ------------
	fvu80m4hsbycm            0
	fvu80m4hsbycm            1

	SQL> SELECT * FROM table(DBMS_XPLAN.DISPLAY_CURSOR(('fvu80m4hsbycm'),1));
#T=Temp-tablespace
-- Temp tablespace queries
--==========================

	SELECT   A.tablespace_name tablespace, D.mb_total,
	     SUM (A.used_blocks * D.block_size) / 1024 / 1024 mb_used,
	     D.mb_total - SUM (A.used_blocks * D.block_size) / 1024 / 1024 mb_free
	FROM     v$sort_segment A,
	     (
	     SELECT   B.name, C.block_size, SUM (C.bytes) / 1024 / 1024 mb_total
	     FROM     v$tablespace B, v$tempfile C
	     WHERE    B.ts#= C.ts#
	     GROUP BY B.name, C.block_size
	     ) D
	WHERE    A.tablespace_name = D.name
	GROUP by A.tablespace_name, D.mb_total;

	SELECT   S.sid || ',' || S.serial# sid_serial, S.username, S.osuser, P.spid, S.module,
		 S.program, SUM (T.blocks) * TBS.block_size / 1024 / 1024 mb_used, T.tablespace,
		 COUNT(*) sort_ops
	FROM     v$sort_usage T, v$session S, dba_tablespaces TBS, v$process P
	WHERE    T.session_addr = S.saddr
	AND      S.paddr = P.addr
	AND      T.tablespace = TBS.tablespace_name
	GROUP BY S.sid, S.serial#, S.username, S.osuser, P.spid, S.module,
		 S.program, TBS.block_size, T.tablespace
	ORDER BY sid_serial;
#T=Long-running-opertions
-- Long running opertions
--==========================
	select * from v$session where status = 'ACTIVE' and schemaname not in ('SYS');

	select * from V$SESSION_LONGOPS where sid = 1191
	and start_time > (sysdate - 4/24)


	SELECT s.sid,
	       s.serial#,
	       opname, target, start_time, sofar, totalwork,
	       ROUND(sl.elapsed_seconds/60) || ':' || MOD(sl.elapsed_seconds,60) elapsed_mins,
	       ROUND(sl.time_remaining/60) || ':' || MOD(sl.time_remaining,60) remaining_mins,
	       ROUND(sl.sofar/sl.totalwork*100, 2) progress_pct,
	       message
	FROM   v$session s,
	       v$session_longops sl
	WHERE  s.sid     = sl.sid
	AND    s.serial# = sl.serial#
	--and s.sid = 1191
	and sl.time_remaining > 0
	and s.username = 'SCOTT';
