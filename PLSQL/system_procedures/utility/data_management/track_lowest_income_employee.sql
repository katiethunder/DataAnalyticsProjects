/*************************************************************************
* Procedure: UPDATELOW
*
* Description:
* Identifies employee with lowest total income (salary + commission) and
* records details in LOWINCOME1 table.
*
* Tables Used: emp
* Tables Modified: LOWINCOME1
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."UPDATELOW" AS
tempname varchar(40);
tempinc number(4);
BEGIN
select ename,sal+nvl(comm,0) into tempname,tempinc from emp where
sal+nvl(comm,0)=(select min(sal+nvl(comm,0)) from emp);
 DBMS_OUTPUT.PUT_LINE(TEMPNAME || TEMPINC);
 INSERT INTO LOWINCOME1 VALUES(TEMPNAME,TEMPINC);
END UPDATELOW;

/
