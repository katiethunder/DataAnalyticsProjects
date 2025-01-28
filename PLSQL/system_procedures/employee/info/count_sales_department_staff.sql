/*************************************************************************
* Procedure: NUMEMPSALES
*
* Description:
* Counts total number of employees in Sales department.
*
* Tables Used: emp, dept
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."NUMEMPSALES" AS numemp number(5);
BEGIN
   Select COUNT(*) into numemp from emp,dept WHERE emp.deptno=dept.deptno AND dname =
'SALES';
 dbms_output.put_line('There are '||numemp||' employees in the Sales department');
END NUMEMPSALES;
/
