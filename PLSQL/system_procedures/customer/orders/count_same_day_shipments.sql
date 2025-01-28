/*************************************************************************
* Procedure: SHIPPED
*
* Description:
* Counts orders that were shipped on the same day they were ordered.
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."SHIPPED" AS ship number(2);
BEGIN
  select count(*)into ship from ord WHERE orderdate=shipdate;
  DBMS_OUTPUT.PUT_line('The number of orders shipped same day is ' ||ship);
END SHIPPED;

/
