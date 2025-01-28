/*************************************************************************
* Procedure: CHECKBONUS
*
* Description:
* Determines bonus percentage based on employee number.
*
* Parameters:
* vempno (IN) - Employee number
*
* Exceptions:
* NO_DATA_FOUND - Invalid employee number
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."CHECKBONUS" (vempno IN emp.empno%TYPE) AS vdate VARCHAR(2);
BEGIN
select substr(hiredate,8,2) into vdate from emp where empno=vempno;
if vempno=80 then
    DBMS_OUTPUT.PUT_LINE('2% bonus due');
elsif vempno=81 then
    DBMS_OUTPUT.PUT_LINE('1.5% bonus due');
elsif vempno=82 then
    DBMS_OUTPUT.PUT_LINE('1% bonus due');
else
    DBMS_OUTPUT.PUT_LINE('No bonus due');
end if;
END CHECKBONUS;

/
