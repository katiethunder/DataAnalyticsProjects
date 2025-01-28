/*************************************************************************
* Procedure: CHECKSALARY
*
* Description:
* Compares employee's salary against a specified value.
*
* Parameters:
* vempno (IN) - Employee number
* vsal (IN)   - Salary value to compare against
*
* Exceptions:
* NO_DATA_FOUND - Invalid employee number
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."CHECKSALARY" (vempno in number,vsal in number) AS
tsal emp.sal%TYPE; 
BEGIN
 select sal into tsal from emp where empno=vempno;
    if tsal>vsal then
        dbms_output.put_line('Salary is greater');
    Else
        dbms_output.put_line('Salary is not greater');
     End IF;
 END CHECKSALARY;
/
