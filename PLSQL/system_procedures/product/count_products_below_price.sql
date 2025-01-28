/*************************************************************************
* Procedure: NUMPRODUCTS
*
* Description:
* Counts products with standard price below specified value.
*
* Parameters:
* userprice (IN) - Price threshold to compare against
*
* Tables Used: price
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."NUMPRODUCTS" (userprice IN NUMBER) AS
BEGIN
  select count(*)into NUMPROD from price where stdprice < userprice;
  DBMS_OUTPUT.PUT_LINE('Number of cheaper items '||numprod);
END NUMPRODUCTS;

/
