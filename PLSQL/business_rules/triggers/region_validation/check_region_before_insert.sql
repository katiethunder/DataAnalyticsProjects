--------------------------------------------------------
--  DDL for Trigger CHECKREGIONBEFOREINSERT
--------------------------------------------------------

/*************************************************************************
* Trigger: CHECK_REGION_BEFORE_INSERT
* Type: BEFORE INSERT (Row-Level)
* Table: REGIONS
*
* Description:
* Enforces a business rule that limits Region_ID values to be less than 10,
* maintaining a controlled range of region identifiers.
*
* Business Rules:
* - Region_ID must be less than 10
*
* Error Handling:
* Error Code: -20001
* Error Message: Region_ID must be less than 10.
*************************************************************************/

  CREATE OR REPLACE TRIGGER "BOL"."CHECKREGIONBEFOREINSERT" 
BEFORE INSERT ON Regions
FOR EACH ROW 
BEGIN
  IF :NEW.Region_ID >= 10 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Region_ID must be less than 10.');
    END IF;
END;
/
ALTER TRIGGER "BOL"."CHECKREGIONBEFOREINSERT" ENABLE;
