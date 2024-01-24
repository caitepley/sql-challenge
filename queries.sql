SELECT employees.emp_no,employees.last_name,employees.first_name,employees.sex,salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no=salaries.emp_no;

SELECT first_name,last_name,hire_date FROM employees
WHERE hire_date LIKE '%1986';

SELECT dept_manager.dept_no,departments.dept_name,dept_manager.emp_no,employees.last_name,employees.first_name
FROM dept_manager
INNER JOIN employees ON
dept_manager.emp_no=employees.emp_no
INNER JOIN departments ON
dept_manager.dept_no=departments.dept_no;

SELECT dept_emp.dept_no,employees.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM dept_emp
INNER JOIN employees ON
dept_emp.emp_no=employees.emp_no
INNER JOIN departments ON
dept_emp.dept_no=departments.dept_no;

SELECT first_name,last_name, sex FROM employees
WHERE first_name = 'Hercules' and last_name LIKE 'B%'

SELECT emp_no,last_name,first_name
FROM employees
WHERE emp_no IN
(
  SELECT emp_no
  FROM dept_emp
  WHERE dept_no IN
	(
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
	)
);

SELECT employees.emp_no,employees.last_name,employees.first_name,departments.dept_name
FROM dept_emp
INNER JOIN employees ON
dept_emp.emp_no=employees.emp_no
INNER JOIN departments ON
dept_emp.dept_no=departments.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
ORDER BY last_name DESC;