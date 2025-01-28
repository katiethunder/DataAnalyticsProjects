/*************************************************************************
* Procedure: AVGSALSALES
*
* Description:
* Calculates average salary for Sales department employees.
*
* Tables Used: emp, dept
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."AVGSALSALES" AS avgsal number(6);
BEGIN
  SELECT avg(SAL) INTO avgsal FROM emp, dept WHERE emp.deptno=dept.deptno AND dname='SALES'; 
  DBMS_OUTPUT.PUT_line('Average Salary of Sales Dept is ' ||avgsal);
END AvgSalSales;

/
