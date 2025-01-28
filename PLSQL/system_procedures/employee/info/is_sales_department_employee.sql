--------------------------------------------------------
--  DDL for Procedure CHECKSALES
--------------------------------------------------------
set define off;

/*************************************************************************
* Procedure: CHECKSALES
*
* Description:
* Checks if employee belongs to Sales department.
*
* Parameters:
* tempno (IN)  - Employee number
* Ans (OUT)    - 'YES' if in Sales, 'NO' if not
*
* Tables Used: emp, dept
*
* Exceptions:
* NO_DATA_FOUND - Invalid employee number
*************************************************************************/
CREATE OR REPLACE PROCEDURE "SYSTEM"."CHECKSALES" (tempno in emp.empno%TYPE, Ans Out varchar) AS
tdname dept.dname%TYPE;
BEGIN 
select dname into tdname from emp,dept where
emp.deptno=dept.deptno and empno=tempno;
    if tdname='SALES' then
        ans:='YES'; 
    Else ans:='NO';
    End if;
END CHECKSALES;

/
