--------------------------------------------------------
--  DDL for Procedure CHECKNAME
--------------------------------------------------------
set define off;

/*************************************************************************
* Procedure: CHECKNAME
*
* Description:
* Retrieves and displays employee name by employee number.
*
* Parameters:
* enum (IN) - Employee number
*
* Exceptions:
* NO_DATA_FOUND - Invalid employee number
*************************************************************************/
CREATE OR REPLACE PROCEDURE "SYSTEM"."CHECKNAME" (enum IN number) AS vname varchar(10);
BEGIN
  select ename into vname from emp where empno=enum;
  DBMS_OUTPUT.PUT_LINE('The employee name is ' || vname);
END CHECKNAME;

/
