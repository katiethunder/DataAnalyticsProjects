/*************************************************************************
* Procedure: SIXPACK
*
* Description:
* Counts products that are sold as 6-packs (case insensitive search).
*
* Tables Used: product
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."SIXPACK" AS sixpack number(2); 
BEGIN
    select count(*)INTO sixpack from product WHERE UPPER(DESCRIP) LIKE '%6 PACK%';
    DBMS_OUTPUT.PUT_LINE('The number of produts that come in a sixpack is: ' || sixpack);
END SIXPACK;

/
