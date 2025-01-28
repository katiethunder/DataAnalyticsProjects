--------------------------------------------------------
--  DDL for Procedure FINDEMPJOB
--------------------------------------------------------
set define off;

/*************************************************************************
* Procedure: FINDEMPJOB
*
* Description:
* Retrieves job title for specified employee.
*
* Parameters:
* vempno (IN)  - Employee number
* empjobv (OUT) - Job title
*
* Exceptions:
* NO_DATA_FOUND - Invalid employee number
*************************************************************************/
CREATE OR REPLACE PROCEDURE "SYSTEM"."FINDEMPJOB" (vempno IN emp.empno%TYPE, empjobv OUT varchar) AS 
BEGIN
  select job into empjobv from emp where vempno=empno;
END FINDEMPJOB;

/
