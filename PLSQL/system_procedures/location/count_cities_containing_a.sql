/*************************************************************************
* Procedure: CONTAINSA
*
* Description:
* Counts customers whose city contains the letter 'A' (case insensitive).
*
* Tables Used: customer
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."CONTAINSA" AS conA NUMBER(3);
BEGIN
  SELECT count(*) INTO conA FROM CUSTOMER WHERE UPPER(CITY) LIKE '%A%';
  DBMS_OUTPUT.PUT_LINE('The number of cities that contain the letter A is: ' || conA);
END CONTAINSA;

/
