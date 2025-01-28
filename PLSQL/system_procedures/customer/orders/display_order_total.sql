/*************************************************************************
* Procedure: GETORD
*
* Description:
* Displays the total amount for a specific order.
*
* Parameters:
* ordidv (IN) - Order ID to look up
*
* Exceptions:
* NO_DATA_FOUND - Invalid order ID
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."GETORD" (ordidv in number) AS totalv number (8,2); 
BEGIN
  select total into totalv from ord where ordid=ordidv;
  DBMS_OUTPUT.PUT_LINE('Order number '||ordidv||' accounted for a total of £'||totalv);
END GETORD;

/
