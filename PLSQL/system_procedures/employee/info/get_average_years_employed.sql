/*************************************************************************
* Procedure: AVGWORK
*
* Description:
* Calculates average years of employment for all employees.
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."AVGWORK" AS avgwork number(2);
BEGIN
  SELECT round(avg(MONTHS_BETWEEN(sysdate, EMP.HIREDATE) / 12)) INTO avgwork from EMP;
   DBMS_OUTPUT.put_line('The average number of years worked is '||avgwork);
END AVGWORK;
/
