/*************************************************************************
* Procedure: FINDTOTORD
*
* Description:
* Retrieves and displays the total cost for a specific order.
*
* Parameters:
* ordnum (IN) - Order ID to look up
*
* Exceptions:
* NO_DATA_FOUND - Invalid order ID
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."FINDTOTORD" (ordnum IN ord.ordid%TYPE) AS totalcost number (8,2);
BEGIN
  select total into totalcost from ord where ordid=ordnum;
  DBMS_OUTPUT.PUT_LINE('Total cost is £'||totalcost);
END FINDTOTORD;
/
