/*************************************************************************
* Procedure: CHECKJOB
*
* Description:
* Verifies if employee is in Sales department but not a salesman.
*
* Parameters:
* tempno (IN) - Employee number
*
* Tables Used: emp, dept
*
* Exceptions:
* NO_DATA_FOUND - Invalid employee number
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."CHECKJOB" (tempno in emp.empno%TYPE)
AS tjob emp.job%TYPE; tdname dept.dname%TYPE;
BEGIN 
select job,dname into tjob,tdname from emp,dept where
emp.deptno=dept.deptno and empno=tempno;
    if tjob !='SALESMAN' and tdname='SALES' then
        dbms_output.put_line('Match Found');
    else
        dbms_output.put_line('No Match');
    end if;
 END CHECKJOB;
/
