/*************************************************************************
* Trigger: CHECK_COUNTRIES_UPDATE
* Type: BEFORE UPDATE
* Table: COUNTRIES
*
* Description:
* Enforces maintenance window restrictions for country data updates.
* Updates are only permitted during the designated maintenance window
* on Mondays between 9 AM and 1 PM.
*
* Business Rules:
* - Updates restricted to Mondays only
* - Updates allowed only between 9 AM and 1 PM
*
* Variables:
* - v_current_day: Current day of the week (1-7)
* - v_current_hour: Current hour (24-hour format)
*
* Error Handling:
* Error Code: -20002
* Error Message: Updates are only allowed on Mondays between 9 AM and 1 PM.
*************************************************************************/

CREATE OR REPLACE TRIGGER "BOL"."CHECKCOUNTRIESUPDATE" 
BEFORE UPDATE ON countries DECLARE
    v_current_day NUMBER;
    v_current_hour NUMBER;
BEGIN 
  SELECT TO_CHAR(SYSDATE, 'D') INTO v_current_day FROM DUAL;
    SELECT TO_NUMBER(TO_CHAR(SYSDATE, 'HH24')) INTO v_current_hour FROM DUAL;

    IF NOT (v_current_day = 2 AND v_current_hour BETWEEN 9 AND 13) THEN
        RAISE_APPLICATION_ERROR(-20002, 'Updates are only allowed on Mondays between 9 AM and 1 PM.');
    END IF;
END;
/
ALTER TRIGGER "BOL"."CHECKCOUNTRIESUPDATE" ENABLE;
