--------------------------------------------------------
--  DDL for Trigger CHECKORDERSBEFOREINSERT
--------------------------------------------------------

/*************************************************************************
* Trigger: CHECK_ORDERS_BEFORE_INSERT
* Type: BEFORE INSERT (Row-Level)
* Table: CUSTOMERS
*
* Description:
* Prevents creation of new orders for Customer ID 7, which may represent
* a blocked or special case customer account.
*
* Business Rules:
* - No new orders allowed for Customer_ID = 7
*
* Error Handling:
* Error Code: -20003
* Error Message: No new orders are allowed for customer number 7.
*************************************************************************/

CREATE OR REPLACE TRIGGER "BOL"."CHECKORDERSBEFOREINSERT" 
BEFORE INSERT ON customers 
FOR EACH ROW 
BEGIN
  IF :NEW.Customer_ID = 7 THEN
        RAISE_APPLICATION_ERROR(-20003, 'No new orders are allowed for customer number 7.');
    END IF;
END;
/
ALTER TRIGGER "BOL"."CHECKORDERSBEFOREINSERT" ENABLE;
