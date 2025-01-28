/*************************************************************************
* Procedure: TOTCOMM
*
* Description:
* Calculates total commission paid across all employees.
* Treats null commission values as zero.
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."TOTCOMM" AS totcom number(10);
BEGIN
  SELECT SUM(nvl(COMM,0)) INTO totcom FROM EMP;
  DBMS_OUTPUT.put_line('The total commission paid is £'||totcom);
END TOTCOMM;
/
