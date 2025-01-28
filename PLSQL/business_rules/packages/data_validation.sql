/*************************************************************************
* Description:
* Collection of procedures for validating and manipulating data across
* various tables in the BOL schema.
*************************************************************************/

CREATE OR REPLACE PACKAGE BODY "BOL"."CHECKDATA" AS

/*************************************************************************
* Procedure: EmployeesHiredInJuly
*
* Description:
* Retrieves and displays a list of employees who were hired in July.
*
* Parameters: None
* Output: Prints employee names to DBMS_OUTPUT
*************************************************************************/
PROCEDURE EmployeesHiredInJuly AS
BEGIN
    FOR emp_rec IN (
        SELECT first_name, last_name 
        FROM employees 
        WHERE UPPER(SUBSTR(hire_date, 4, 3)) = 'JUL'
    ) LOOP
        DBMS_OUTPUT.PUT_LINE(emp_rec.first_name || ' ' || emp_rec.last_name);
    END LOOP;
END EmployeesHiredInJuly;

/*************************************************************************
* Procedure: CustomersWithELowCredit
*
* Description:
* Identifies customers with websites containing 'e' and credit limits
* below the average. Raises exception if more than 30 customers found.
*
* Variables:
* - v_avg_creditlimit: Average credit limit across all customers
* - v_count: Number of customers matching criteria
*
* Exceptions:
* - too_many_customers: Raised when more than 30 matching customers found
*************************************************************************/
PROCEDURE CustomersWithELowCredit IS 
    v_avg_creditlimit NUMBER; 
    v_count NUMBER; 
    too_many_customers EXCEPTION;
BEGIN
    SELECT AVG(credit_limit) INTO v_avg_creditlimit FROM customers;
        SELECT COUNT(*) INTO v_count FROM customers WHERE INSTR(website, 'e') > 0 AND credit_limit < v_avg_creditlimit;
        IF v_count > 30 THEN
            RAISE too_many_customers;
        ELSE
            FOR cust_rec IN (SELECT name FROM customers WHERE INSTR(website, 'e') > 0 AND credit_limit < v_avg_creditlimit) LOOP
                DBMS_OUTPUT.PUT_LINE('Customer: ' || cust_rec.name);
            END LOOP;
        END IF;
    EXCEPTION
        WHEN too_many_customers THEN
            DBMS_OUTPUT.PUT_LINE('There are more than 30 customers who match the criteria.');
END CustomersWithELowCredit;

/*************************************************************************
* Procedure: DeleteCountriesWithY
*
* Description:
* Deletes all countries that have the letter 'Y' in their name
* (case-insensitive search).
*
* Tables Modified: COUNTRIES
*************************************************************************/
PROCEDURE DeleteCountriesWithY AS
BEGIN
    FOR country_rec IN (SELECT country_id FROM countries WHERE UPPER(country_name) LIKE '%Y%') LOOP
        DELETE FROM countries WHERE country_id = country_rec.country_id;
    END LOOP;
END DeleteCountriesWithY;

/*************************************************************************
* Procedure: UpdatePhoneForTommyBailey
*
* Description:
* Updates phone numbers to '123.123.1234' for all employees who report
* to Tommy Bailey.
*
* Tables Modified: EMPLOYEES
* Variables:
* - v_manager_id: Employee ID of Tommy Bailey
*************************************************************************/
PROCEDURE UpdatePhoneForTommyBailey AS 
    v_manager_id employees.employee_id%TYPE;
BEGIN
    SELECT employee_id INTO v_manager_id FROM employees WHERE first_name = 'Tommy' AND last_name = 'Bailey';
    FOR emp_rec IN (SELECT employee_id FROM employees WHERE manager_id = v_manager_id) LOOP
        UPDATE employees SET phone = '123.123.1234' WHERE employee_id = emp_rec.employee_id;
    END LOOP;
END UpdatePhoneForTommyBailey;

/*************************************************************************
* Procedure: DisplayCountriesWithLetter
*
* Description:
* Displays all country names containing a specified letter
* (case-insensitive search).
*
* Parameters:
* - p_letter IN CHAR: Letter to search for in country names
*
* Output: Prints matching country names to DBMS_OUTPUT
*************************************************************************/
PROCEDURE DisplayCountriesWithLetter(p_letter IN CHAR) AS
BEGIN
    FOR country_rec IN (SELECT country_name FROM countries WHERE UPPER(country_name) LIKE '%' || UPPER(p_letter) || '%') LOOP
        DBMS_OUTPUT.PUT_LINE(country_rec.country_name);
    END LOOP;
END DisplayCountriesWithLetter;

END CHECKDATA;

/
