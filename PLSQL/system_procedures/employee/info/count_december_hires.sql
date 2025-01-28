/*************************************************************************
* Procedure: HIREDEC
*
* Description:
* Counts number of employees hired in December.
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."HIREDEC" AS numemp NUMBER (5);
BEGIN
  SELECT count(empno) INTO numemp FROM EMP WHERE HIREDATE LIKE '%DEC%';
  DBMS_OUTPUT.PUT_LINE('The number of employees hired in Dec is: ' || numemp);
END HIREDEC;

/
