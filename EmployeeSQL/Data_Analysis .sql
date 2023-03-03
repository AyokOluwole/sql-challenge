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

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees AS e
left join salaries AS s
on e.emp_no = s.emp_no
ORDER BY e.emp_no

---- 
SELECT e.last_name, e.first_name, e.hire_date
FROM employees e
WHERE (SELECT EXTRACT(YEAR FROM hire_date)) = 1986
;


--- 


-- List the manager of each department along with their department number,
-- department name, employee number, last name, and first name
SELECT * FROM departments;
SELECT * FROM dept_manager;
SELECT dmp.dept_no, d.dept_name, dmp.emp_no, e.last_name, e.first_name
FROM dept_manager AS dmp
inner join departments AS d
on dmp.dept_no = d.dept_no
inner join employees AS e
on dmp.emp_no = e.emp_no
order by d.dept_no
;	


--

--List the department number for each employee along
--with that employee’s employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, dept.dept_name
FROM employees AS e
inner join dept_emp AS depem
on e.emp_no = depem.emp_no
inner join departments dept
on depem.dept_no = dept.dept_no
;

-- 
--List first name, last name, and sex of each employee
-- whose first name is Hercules and whose last name begins with the letter B.
SELECT e.last_name, e.first_name, e.sex
FROM	employees AS e
WHERE	e.first_name = 'Hercules'AND e.last_name LIKE 'B%'
;

-- 

-- List each employee in the Sales department,
-- including their employee number, last name, and first name.
-- Sales = d007
SELECT e.emp_no, e.last_name, e.first_name, departments.dept_name
FROM employees AS e
JOIN dept_emp ON e.emp_no = dept_emp.emp_no
JOIN departments ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_no = 'd007';

-- 
-- List each employee in the Sales and Development departments,
-- including their employee number, last name, first name, and department name.
-- Development = d005
-- e.emp_no, e.last_name, e.first_name, departments.dept_name
--
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees AS e
inner join dept_emp AS depemp
ON e.emp_no = depemp.emp_no
inner join departments AS d
ON depemp.dept_no = d.dept_no
WHERE d.dept_no = 'd005' or d.dept_no = 'd007';
;

--- 

-- List the frequency counts, in descending order,
--of all the employee last names (that is, how many employees share each last name).
-- SELECT ** , COUNT(*)AS Frequency
--  FROM *
--  GROUP BY *
-- ORDER BY Frequency DESC
SELECT e.last_name, count(e.last_name) AS Frequency
FROM employees AS e
GROUP BY e.last_name
ORDER BY Frequency DESC
;


