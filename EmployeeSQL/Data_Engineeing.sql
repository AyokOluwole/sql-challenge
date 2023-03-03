CREATE TABLE departments(
dept_no character varying(4),
dept_name VARCHAR(50) NOT NULL
);
CREATE TABLE dept_emp(
emp_no INT,
dept_no character varying(4)	
);
CREATE TABLE dept_manager(
dept_no character varying(4),
emp_no INT PRIMARY KEY
);
CREATE TABLE employees(
emp_no INT PRIMARY KEY,
emp_title_id character varying(10),
birth_date DATE NOT NULL,
first_name VARCHAR(50) NOT NULL,
last_name VARCHAR(50) NOT NULL,
sex VARCHAR(1) NOT NULL,
hire_date DATE NOT NULL
);
CREATE TABLE salaries(
emp_no INT PRIMARY KEY,
salary INT
);
CREATE TABLE titles(
title_id  character varying(5),
title VARCHAR(50) NOT NULL
);