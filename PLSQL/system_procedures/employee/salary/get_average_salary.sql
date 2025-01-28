/*************************************************************************
* Procedure: AVGSAL
*
* Description:
* Calculates and displays average salary across all employees.
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."AVGSAL" AS averagesal number(6);
BEGIN
  SELECT avg(SAL) INTO averagesal FROM emp; 
  DBMS_OUTPUT.PUT_line('Average Salary is ' ||averagesal);
END AVGSAL;
/
