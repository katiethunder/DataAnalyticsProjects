/*************************************************************************
* Procedure: CHECKORDERS
*
* Description:
* Calculates and displays the sum of all orders that exceed 
* the average order total.
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."CHECKORDERS" AS
  avgtotal NUMBER;
  totaloveravg NUMBER := 0;
BEGIN
  SELECT AVG(total)INTO avgtotal FROM ord;
  SELECT SUM(total)INTO totaloveravg
  FROM ord
  WHERE total > avgtotal;
  DBMS_OUTPUT.PUT_LINE('The total of all orders over the average order total is £' || totaloveravg);
END CheckOrders;
/
