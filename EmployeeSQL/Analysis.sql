--1-List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees as e
INNER JOIN salaries as s
ON
e.emp_no=s.emp_no
--2-List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT e.first_name, e.last_name, e.hire_date
FROM employees as e
where e.hire_date between '1986-01-01' and '1986-12-31'
--3-List the manager of each department along with their department number, department name,
--employee number, last name, and first name.
SELECT d.dept_no,d.dept_name,e.emp_no,e.last_name,e.first_name
FROM employees as e
INNER JOIN dept_manager as dm
ON
e.emp_no=dm.emp_no
INNER JOIN departments as d
ON
d.dept_no=dm.dept_no
--4-List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name.
CREATE VIEW employees_in_depts AS
SELECT dept_emp.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM dept_emp
INNER JOIN employees ON dept_emp.emp_no=employees.emp_no
INNER JOIN departments ON dept_emp.dept_no=departments.dept_no
ORDER BY dept_emp.emp_no

--5-List first name, last name, and sex of each employee whose first name is Hercules
--and whose last name begins with the letter B.
SELECT first_name,last_name,sex
FROM employees
WHERE first_name='Hercules'
AND last_name LIKE 'B%'
--6-List each employee in the Sales department, including their employee number,
--last name, and first name.
SELECT *
FROM employees_in_depts
WHERE dept_name='Sales'
--7-List each employee in the Sales and Development departments, including their employee number,
--last name, first name, and department name.
SELECT *
FROM employees_in_depts
WHERE dept_name='Sales'
OR dept_name='Development'
--8-List the frequency counts, in descending order, of all the employee
--last names (that is, how many employees share each last name).
Select last_name,COUNT(last_name) AS "Frequency Count"
FROM employees
GROUP BY last_name
ORDER BY "Frequency Count" DESC