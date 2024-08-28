-- Data Analysis --
-- 1.List the following details of each employee: employee number, last name, first name, sex, and salary.
select * from employees
select * from salaries

select employees.emp_no,
employees.first_name,
employees.last_name,
employees.sex,
salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no=salaries.emp_no

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name,
employees.last_name, 
employees.hire_date
FROM employees
WHERE
	hire_date >= '1986-01-01'
	and hire_date <= '1986-12-30';

	
-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
select * from departments
select * from dept_manager
select * from employees

select dept_manager.emp_no,
dept_manager.dept_no,
departments.dept_name,
employees.last_name,
employees.first_name
from dept_manager
INNER JOIN departments ON
dept_manager.dept_no=departments.dept_no
INNER JOIN employees ON
dept_manager.emp_no=employees.emp_no


-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.
select * from dept_emp
select employees.emp_no,
departments.dept_name,
employees.last_name,
employees.first_name
from employees
INNER JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
INNER JOIN departments ON dept_manager.dept_no = departments.dept_no;

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
select employees.first_name,
employees.last_name,
employees.sex
FROM employees
where 
first_name='Hercules'
and last_name LIKE 'B%';
-- 6.List all employees in the Sales department, including their employee number, last name, first name, and department name.
select * from departments
select * from employees
select employees.emp_no,
employees.first_name,
employees.last_name,
departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no=departments.dept_no
where departments.dept_name='Sales' ;
-- 7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select employees.emp_no,
employees.first_name,
employees.last_name,
departments.dept_name
FROM employees
INNER JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
INNER JOIN departments ON dept_emp.dept_no=departments.dept_no
where departments.dept_name='Sales' or departments.dept_name='Development' ;
-- 8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT(last_name) AS "frequency"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;