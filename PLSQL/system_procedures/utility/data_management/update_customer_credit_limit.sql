/*************************************************************************
* Procedure: UPDATELIMIT
*
* Description:
* Increases credit limit by 10% for customers not in ZIP codes starting 
* with 9, and logs changes in custcredit table.
*
* Tables Used: customer
* Tables Modified: 
* - customer (creditlimit column)
* - custcredit (audit log)
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."UPDATELIMIT" AS oldcl number(9,2);
newcl number(9,2);
vcustid customer.custid %TYPE; 
BEGIN
  select custid into vcustid from customer where zip not like '9%'; select creditlimit into oldcl from customer where zip not like '9%';
  update customer
  set creditlimit=creditlimit*1.1
 where zip not like '9%';
select creditlimit into newcl from customer where zip not like '9%';
insert into custcredit values(vcustid,oldcl,newcl);
END UPDATELIMIT;
/
