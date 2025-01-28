/* SQL script performing various employee analyses, from basic demographic 
queries to retirement planning and job tracking.

Skills demonstrated:
--Data aggregation and filtering
--Date manipulation and calculations
--Table joins and subqueries
--Conditional logic (CASE statements)
--Table modifications (ALTER, UPDATE)
*/

/* Display a list of all the employees who are male, ordering by 
last name. */

SELECT 
    first_name, last_name
FROM
    employees
WHERE
    gender = 'M'
ORDER BY last_name;

/* Display a count of the number of employees of each gender. */

SELECT 
    COUNT(CASE
        WHEN gender = 'M' THEN 1
    END) AS 'Number of Males',
    COUNT(CASE
        WHEN gender = 'F' THEN 1
    END) AS 'Number of Females'
FROM
    employees;
    
/* Display a list of all female employees who have four letters in
 their last name, ordered by last name. */
    
SELECT 
    first_name, last_name
FROM
    employees
WHERE
    gender = 'F'
        AND CHAR_LENGTH(last_name) = 4
ORDER BY last_name;

/* Display a list of all female employees who have four letters in
their last name, and the location where they work,
ordered by location and last name. */

SELECT 
    first_name, last_name, dept_loc
FROM
    employees, departments
WHERE employees.dept_no = departments.dept_no AND
    gender = 'F'
        AND CHAR_LENGTH(last_name) = 4
ORDER BY dept_loc, last_name;

/* Display a list of the names of all the employees in department 
'd003'and the year they were born in, ordered by year. */

SELECT 
    first_name,
    last_name,
    dept_no,
    YEAR(birth_date) AS 'Year Born'
FROM
    employees
WHERE
    dept_no = 'd003'
ORDER BY birth_date;

/* Add a new age column to the employee table. */

ALTER TABLE employees ADD COLUMN age TINYINT;

/* Insert the age for each employee. */

SET SQL_SAFE_UPDATES = 0;
UPDATE employees 
SET age = DATE_FORMAT(FROM_DAYS(DATEDIFF(NOW(),birth_date)), '%Y') + 0;

/* The retirement age has been reduced from 70 to 65, list how many employees
in department 'd003' will retire this year, ordered by age. This query 
includes only employees who are aged 65 and above. */

SELECT 
    COUNT(*) as retirement_count,
    age
FROM
    employees
WHERE
    dept_no = 'd003'
        AND age >= 65
GROUP BY age
ORDER BY age;

/* The above query does not consider those who will turn 65 this year, 
this query includes those who are 64 but will turn 65 this year. */

SELECT 
    COUNT(*) as retirement_count,
    age
FROM
    employees
WHERE
    dept_no = 'd003'
        AND (age >= 65 OR (age = 64 AND MONTH(birth_date) <= MONTH(CURDATE())))
GROUP BY age
ORDER BY age;


/* For every employee, display the employee number, the most recent job,
and the date they started in the job, ordered by employee number. */

SELECT 
    first_name, last_name, employees.emp_no, from_date, title
FROM
    employees,
    job
WHERE
    job.from_date IN (SELECT 
            MAX(from_date)
        FROM
            job
        WHERE
            employees.emp_no = job.emp_no)
ORDER BY employees.emp_no; 

/* Display the most recent managers of each department in department order. */

SELECT 
    *
FROM
    job,
    employees
WHERE
    job.emp_no = employees.emp_no
        AND title = 'Manager'
        AND from_date IN (SELECT 
            MAX(from_date)
        FROM
            job
        WHERE
            employees.emp_no = job.emp_no);
            

/* Display a list of all the employees who are male and show their current job, 
ordered by last name. */

SELECT 
    first_name, last_name, title
FROM
    employees, job
WHERE
    employees.emp_no = job.emp_no
        AND gender = 'M'
        AND job.from_date IN (  -- Get only the most recent job
            SELECT MAX(from_date)
            FROM job
            WHERE employees.emp_no = job.emp_no
        )
ORDER BY last_name;


    