/*************************************************************************
* Procedure: SELECTFORUPDATE
*
* Description:
* Updates job title to 'Lecturer' for employee named 'CLARK' using cursor.
*
* Tables Modified: emp (job column)
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."SELECTFORUPDATE" AS 
    CURSOR SUMCP IS 
        SELECT ename, job FROM Emp FOR UPDATE OF job;

BEGIN
    FOR emp_rec IN SUMCP LOOP
        IF emp_rec.ename = 'CLARK' THEN
            UPDATE Emp
            SET job = 'Lecturer'
            WHERE CURRENT OF SUMCP;
        END IF;
    END LOOP;
END SELECTFORUPDATE;
/
