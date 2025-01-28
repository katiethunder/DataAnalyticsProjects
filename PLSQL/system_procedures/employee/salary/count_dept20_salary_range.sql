/*************************************************************************
* Procedure: CHECKSAL
*
* Description:
* Counts employees in department 20 within specified salary range.
*
* Parameters:
* minsal (IN) - Minimum salary range
* maxsal (IN) - Maximum salary range
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."CHECKSAL" (minsal IN NUMBER, maxsal IN NUMBER) AS checks number(2);
BEGIN
  select count(*) into checks from emp where sal between minsal and maxsal and deptno = 20;
    DBMS_OUTPUT.PUT_LINE('The number that meet the criteria: ' || checks);
END CHECKSAL;

/
