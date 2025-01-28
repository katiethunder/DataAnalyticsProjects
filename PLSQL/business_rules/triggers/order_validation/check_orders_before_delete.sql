--------------------------------------------------------
--  DDL for Trigger CHECKORDERSBEFOREDELETE
--------------------------------------------------------

/*************************************************************************
* Trigger: CHECK_ORDERS_BEFORE_DELETE
* Type: BEFORE DELETE (Row-Level)
* Table: ORDERS
*
* Description:
* Prevents deletion of orders that are in a 'Pending' status to maintain
* data integrity and prevent accidental removal of active orders.
*
* Business Rules:
* - Cannot delete orders with status = 'Pending'
*
* Error Handling:
* Error Code: -20004
* Error Message: Orders cannot be deleted if they are pending.
*************************************************************************/

  CREATE OR REPLACE TRIGGER "BOL"."CHECKORDERSBEFOREDELETE" 
BEFORE DELETE ON orders 
FOR EACH ROW 
BEGIN
  IF :OLD.Status = 'Pending' THEN
        RAISE_APPLICATION_ERROR(-20004, 'Orders cannot be deleted if they are pending.');
    END IF;
END;
/
ALTER TRIGGER "BOL"."CHECKORDERSBEFOREDELETE" ENABLE;
