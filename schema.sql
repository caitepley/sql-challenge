DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;

CREATE TABLE departments(
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(30) NOT NULL,
	PRIMARY KEY(dept_no)
);

CREATE TABLE titles(
	title_id VARCHAR(5) NOT NULL,
	title VARCHAR(30) NOT NULL,
	PRIMARY KEY(title_id)
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

CREATE TABLE dept_emp(
	emp_no int NOT NULL,
	dept_no VARCHAR(4) NOT NULL
);
ALTER TABLE dept_emp
ADD FOREIGN KEY(emp_no) REFERENCES employees(emp_no);
ALTER TABLE dept_emp
ADD FOREIGN KEY(dept_no) REFERENCES employees(dept_no);

CREATE TABLE dept_manager(
	emp_no int NOT NULL,
	dept_no VARCHAR(4) NOT NULL
);
ALTER TABLE dept_manager
ADD FOREIGN KEY(emp_no) REFERENCES employees(emp_no);
ALTER TABLE dept_manager
ADD FOREIGN KEY(dept_no) REFERENCES employees(dept_no);

CREATE TABLE salaries(
	emp_no int NOT NULL,
	salary int NOT NULL
);

ALTER TABLE salaries
ADD FOREIGN KEY(emp_no) REFERENCES employees(emp_no);