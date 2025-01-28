/*************************************************************************
* Procedure: CHECKITEM
*
* Description:
* Classifies order quantity as Low, Medium, or High based on item quantity.
*
* Parameters:
* order_id (IN) - Order ID to check
* item_id (IN) - Item ID within the order
*
* Exceptions:
* NO_DATA_FOUND - Invalid order_id/item_id combination
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."CHECKITEM" (
  order_id IN NUMBER,
  item_id IN NUMBER
) AS
  quantity_purchased NUMBER;
  message VARCHAR2(100);
BEGIN
  SELECT QTY 
  INTO quantity_purchased
  FROM item
  WHERE ordid = order_id AND itemid = item_id;
  IF quantity_purchased < 10 THEN
    message := 'Low Order';
  ELSIF quantity_purchased BETWEEN 10 AND 100 THEN
    message := 'Medium Order';
  ELSE
    message := 'High Order';
  END IF;
DBMS_OUTPUT.PUT_LINE('Order ID: ' || order_id || ', Item ID: ' || item_id || ' - ' || message);
END CheckItem;

/
