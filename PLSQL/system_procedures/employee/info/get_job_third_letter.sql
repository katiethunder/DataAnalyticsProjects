--------------------------------------------------------
--  DDL for Procedure JOBEMP
--------------------------------------------------------
set define off;

/*************************************************************************
* Procedure: JOBEMP
*
* Description:
* Extracts third letter of job title for employee 7876.
*
* Exceptions:
* NO_DATA_FOUND - Employee 7876 not found
*************************************************************************/
CREATE OR REPLACE PROCEDURE "SYSTEM"."JOBEMP" AS v_job VARCHAR (1);
BEGIN
  SELECT SUBSTR(JOB, 3, 1)
  INTO v_job
  FROM emp
  WHERE empno = 7876;
  DBMS_OUTPUT.PUT_LINE('The third letter of the job title is: ' || v_job);
END JOBEMP;

/
