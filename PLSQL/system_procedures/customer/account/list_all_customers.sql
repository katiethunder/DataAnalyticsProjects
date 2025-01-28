/*************************************************************************
* Procedure: CHECKCUSTCUR
*
* Description:
* Lists all customers using cursor for memory efficiency.
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."CHECKCUSTCUR" AS 
    CURSOR GetCust IS 
        SELECT name, address FROM customer;

    nameV customer.name%TYPE;
    addressV customer.address%TYPE;
BEGIN
    OPEN GetCust;

    LOOP
        FETCH GetCust INTO nameV, addressV;
        EXIT WHEN GetCust%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(nameV || ' from ' || addressV);
    END LOOP;

    CLOSE GetCust;
END CHECKCUSTCUR;
/
