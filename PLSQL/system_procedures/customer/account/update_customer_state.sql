/*************************************************************************
* Procedure: CHANGESTATE
*
* Description:
* Updates customer state with audit tracking.
*
* Parameters:
* custidv (IN)  - Customer ID
* newstate (IN) - New state value
*
* Tables Modified:
* - customer: Updates state
* - TrackChanges: Inserts audit record
*
* Exceptions:
* NO_DATA_FOUND - Invalid customer ID
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."CHANGESTATE" (
  custidv IN customer.custid%TYPE,
  newstate IN VARCHAR2) AS
  originalstate VARCHAR2(50);
BEGIN
  SELECT STATE INTO originalstate
  FROM customer
  WHERE custid = custidv;
  UPDATE customer
  SET STATE = newstate
  WHERE custid = custidv;
  INSERT INTO TrackChanges VALUES (user, SYSDATE, originalstate, newstate);
  DBMS_OUTPUT.PUT_LINE('State for customer ' || custidv || ' changed to ' || newstate);
END ChangeState;
/
