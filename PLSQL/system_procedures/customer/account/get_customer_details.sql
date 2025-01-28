/*************************************************************************
* Procedure: CHECKCUST
*
* Description:
* Displays name and address for a given customer ID.
*
* Parameters:
* custnum (IN) - Customer ID to look up
*
* Exceptions:
* NO_DATA_FOUND - Invalid customer ID
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."CHECKCUST" (custnum IN NUMBER) AS custname VARCHAR(45); custadd VARCHAR (40); 
BEGIN
   select name, address INTO custname, custadd from customer where custid=custnum;
     DBMS_OUTPUT.PUT_LINE('That customer is '||custname||' from '||custadd);
END CHECKCUST;

/
