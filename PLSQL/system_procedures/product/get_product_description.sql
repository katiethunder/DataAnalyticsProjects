/*************************************************************************
* Procedure: GETPRODUCT
*
* Description:
* Retrieves and displays product description by product ID.
*
* Parameters:
* getprod (IN) - Product ID to look up
*
* Tables Used: product
*
* Exceptions:
* NO_DATA_FOUND - Invalid product ID
*************************************************************************/
set define off;

CREATE OR REPLACE PROCEDURE "SYSTEM"."GETPRODUCT" (getprod IN product.prodid%TYPE) AS VDESC VARCHAR(30);
BEGIN
  select descrip into vdesc from product where prodid=getprod;
  DBMS_OUTPUT.PUT_LINE(vdesc);
END GETPRODUCT;

/
