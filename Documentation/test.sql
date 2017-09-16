-- DDL
create table emp(  
  empno    number(4,0),  
  ename    varchar2(10),  
  job      varchar2(9),  
  mgr      number(4,0),  
  hiredate date,  
  sal      number(7,2),  
  comm     number(7,2),  
  deptno   number(2,0),  
  constraint pk_emp primary key (empno),  
  constraint fk_deptno foreign key (deptno) references dept (deptno)  
);

create index emp.emp_deptno_indx1 on emp(deptno);
grant select on emp to hr;

-- DML
insert into emp (empno, ename, job, hiredate, sal, deptno)
values( 7839, 'king', 'president', to_date('17-11-1981','dd-mm-yyyy'), 
        5000, 10);

-- PL/SQL
declare
   v_empno number;
begin
   select empno into v_empno from emp where ename = 'king');
   dbms_output.put_line(v_empno);
end;
/

-- SELECT
select d.department_name,
       e.employee_name
from   departments d
join employees e on d.department_id = e.department_id
where  d.department_id >= 30
order by d.department_name;

select d.department_name,
       e.employee_name     
from   departments d
left outer join employees e on d.department_id = e.department_id
where  d.department_id >= 30
order by d.department_name, e.employee_name;
