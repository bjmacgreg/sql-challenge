--QUESTION ONE
--As previously noted, there are duplicates - not sure if they have salaries from /
--two different departments, or changed jobs at some point, or what
CREATE TABLE Question_One AS
SELECT 
	employee_number,
	last_name,
	first_name,
	sex,
	salary
FROM combined_table;

--QUESTION TWO
CREATE TABLE Question_Two AS
SELECT 
	first_name,
	last_name,
	hire_date
FROM combined_table
WHERE
	hire_date >= '1986-01-01'
	AND hire_date <  '1987-01-01';
	
--QUESTION THREE
CREATE TABLE Question_Three AS
SELECT 
	department_number,
	department_name,
	employee_number,
	last_name,
	first_name
FROM combined_table
WHERE title = 'Manager';

--QUESTION FOUR
CREATE TABLE Question_Four AS
SELECT 
	employee_number,
	last_name,
	first_name,
	department_name
FROM combined_table;

--QUESTION FIVE
CREATE TABLE Question_Five AS
SELECT 
	first_name,
	last_name,
	sex
FROM combined_table
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%'
	
--QUESTION SIX
CREATE TABLE Question_Six AS
SELECT 
	employee_number,
	last_name,
	first_name,
	department_name
FROM combined_table
WHERE department_name = 'Sales';

--QUESTION SEVEN
CREATE TABLE Question_Seven AS
SELECT 
	employee_number,
	last_name,
	first_name,
	department_name
FROM combined_table
WHERE department_name = 'Sales'
	OR department_name = 'Development';
	
--QUESTION EIGHT
CREATE TABLE Question_Eight AS
SELECT last_name, COUNT(*) AS "Number of employees"
FROM combined_table
GROUP BY last_name
ORDER BY COUNT(*) DESC;

--QUESTION 499942
CREATE TABLE Question_499942 AS
SELECT 
	employee_number,
	title,
	birth_date,
	first_name,
	last_name,
	sex,
	hire_date
FROM combined_table
WHERE employee_number = '499942';
