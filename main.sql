CREATE TABLE departments(
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY(dept_no)
);

CREATE TABLE dept_emp(
	emp_no int NOT NULL,
	dept_no VARCHAR(4) NOT NULL
);

ALTER TABLE dept_emp
ADD FOREIGN KEY (dept_no) REFERENCES departments(dept_no)

CREATE TABLE dept_manager(
	emp_no int NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	PRIMARY KEY(emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments(dept_no)
);

CREATE TABLE titles(
	title_id VARCHAR(5) NOT NULL,
	title VARCHAR(30) NOT NULL,
	PRIMARY KEY(title_id)
);

CREATE TABLE salaries(
	emp_no int NOT NULL,
	salary int NOT NULL,
	PRIMARY KEY(emp_no)
);

CREATE TABLE employees(
	emp_no int NOT NULL,
	emp_title VARCHAR(5) NOT NULL,
	birth_date VARCHAR(10),
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date VARCHAR(10) NOT NULL,
	PRIMARY KEY(emp_no),
	FOREIGN KEY(emp_title) REFERENCES titles(title_id)
);

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