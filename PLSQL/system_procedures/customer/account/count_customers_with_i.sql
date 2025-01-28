/*************************************************************************
* Procedure: NUMCUST
*
* Description:
* Counts customers with letter 'I' in their address.
*
* Parameters:
* countans (OUT) - Count of matching customers
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."NUMCUST" (countans OUT number) AS countv number(2);
BEGIN
  select count(*) into countans from customer where address like '%I%';
END NUMCUST;
/
