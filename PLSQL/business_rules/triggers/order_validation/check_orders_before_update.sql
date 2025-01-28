--------------------------------------------------------
--  DDL for Trigger CHECKORDERSBEFOREUPDATE
--------------------------------------------------------

/*************************************************************************
* Trigger: CHECK_ORDERS_BEFORE_UPDATE
* Type: BEFORE UPDATE (Row-Level)
* Table: ORDERS
*
* Description:
* Prevents updates to historical orders placed after December 31, 2016,
* maintaining data integrity for legacy orders.
*
* Business Rules:
* - Cannot modify orders placed after December 31, 2016
*
* Error Handling:
* Error Code: -20005
* Error Message: Orders placed after 2016 cannot be updated.
*************************************************************************/

  CREATE OR REPLACE TRIGGER "BOL"."CHECKORDERSBEFOREUPDATE" 
BEFORE UPDATE ON Orders 
FOR EACH ROW 
BEGIN
   IF :OLD.Order_Date > TO_DATE('31-DEC-16', 'DD-MON-YY') THEN
        RAISE_APPLICATION_ERROR(-20005, 'Orders placed after 2016 cannot be updated.');
    END IF;
END;
/
ALTER TRIGGER "BOL"."CHECKORDERSBEFOREUPDATE" ENABLE;
