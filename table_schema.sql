--TITLES TABLE

CREATE TABLE titles (
	"title_ID" varchar(255) NOT NULL,
    "title" varchar(255) NOT NULL,
	PRIMARY KEY ("title_ID")
);

select * from titles;

--DEPARTMENTS TABLE

CREATE TABLE departments (
    "department_number" varchar(255)   NOT NULL,
    "department_name" varchar(255)   NOT NULL,
	PRIMARY KEY("department_number")
);

select * from departments;

--EMPLOYEES TABLE

CREATE TABLE employees (
	"employee_number" int  NOT NULL,
    "title_ID" varchar(255) NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar(255) NOT NULL,
    "last_name" varchar(255) NOT NULL,
    "sex" varchar (255) NOT NULL,
    "hire_date" date NOT NULL,
	PRIMARY KEY (employee_number)
--	FOREIGN KEY ("title_ID") 
--		REFERENCES titles("title_ID")
);

select * from employees;

ALTER TABLE employees
	ADD CONSTRAINT fk_wtf
		FOREIGN KEY ("title_ID") 
			REFERENCES titles("title_ID");

select * from employees;

--Check whether employee_number has replicates (no)
SELECT
  employee_number
FROM employees
GROUP BY
  employee_number
HAVING count(employee_number) > 1;

--DEPARTMENT EMPLOYEES TABLE

CREATE TABLE department_employees (
    "employee_number" int   NOT NULL,
    "department_number" varchar(255) NOT NULL,
	PRIMARY KEY(employee_number, department_number)
);

select * from department_employees;
--order by employee_number;

--Check whether department_employees has replicates (yes, so used composite key)
SELECT
  employee_number
FROM department_employees
GROUP BY
  employee_number
HAVING count(employee_number) > 1;


--DEPARTMENT MANAGERS TABLE
--As far as I can tell, this table is redundant
CREATE TABLE department_managers (
    "department_number" varchar(255) NOT NULL,
    "employee_number" int NOT NULL,
	PRIMARY KEY (employee_number),
	FOREIGN KEY (department_number) 
		REFERENCES departments(department_number)
);

select * from department_managers;

--Check whether department_managers has replicates (no)
SELECT
  employee_number
FROM department_managers
GROUP BY
  employee_number
HAVING count(employee_number) > 1;

--SALARIES TABLE

CREATE TABLE salaries (
    "employee_number" int   NOT NULL,
    "salary" int   NOT NULL,
	PRIMARY KEY (employee_number)
);

--Check whether salaries has replicates (no)
SELECT
  employee_number
FROM salaries
GROUP BY
  employee_number
HAVING count(employee_number) > 1;

--JOIN TABLES
--**noticed weird name value TRUE
--Some employees have more than one dept, check hire dates... promotion? Shared job?

CREATE TABLE combined_table AS
SELECT 
	employees.employee_number,
	department_employees.department_number,	
	employees."title_ID",
	titles.title,
	departments.department_name,	
	employees.first_name,
	employees.last_name,
	employees.birth_date,
	employees.sex,
	employees.hire_date,
	salaries.salary
FROM employees
JOIN titles
	ON titles."title_ID" = employees."title_ID"
JOIN salaries
	ON salaries.employee_number = employees.employee_number
JOIN department_employees
	ON department_employees.employee_number = employees.employee_number
JOIN departments
	ON departments.department_number = department_employees.department_number;










	
	




	