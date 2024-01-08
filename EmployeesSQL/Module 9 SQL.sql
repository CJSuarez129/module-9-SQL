SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;

SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date >= '1986-01-01'
AND hire_date <= '1986-12-31';
	
SELECT dept_manager.emp_no, dept_manager.dept_no, departments.dept_name, employees.last_name, employees.first_name
FROM dept_manager
JOIN departments
ON dept_manager.dept_no = departments.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;

SELECT employees.emp_no, dept_manager.dept_no, departments.dept_name, employees.last_name, employees.first_name
FROM employees
JOIN dept_manager
ON (employees.emp_no = dept_manager.emp_no)
JOIN departments
ON (dept_manager.dept_no = departments.dept_no);

SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
WHERE e.emp_no IN
	(SELECT de.emp_no
	FROM dept_emp de
	WHERE de.dept_no IN
		(SELECT d.dept_no
		 FROM departments d
		 WHERE d.dept_name = 'Sales'
		)
	);
	
SELECT e.emp_no, e.last_name, e.first_name
FROM employees e
JOIN dept_emp de
ON (de.emp_no = e.emp_no)
JOIN departments d
ON (de.dept_no = d.dept_no)
WHERE e.emp_no IN (
	SELECT emp_no
	FROM dept_emp
	WHERE dept_no IN (
		SELECT dept_no
		FROM departments
		WHERE dept_name = 'Sales'
			OR dept_name = 'Development'
		)
	)
GROUP BY e.emp_no;

SELECT last_name, COUNT(last_name) as "Frequency Counts"
FROM employees
GROUP BY last_name
ORDER BY "Frequency Counts" DESC;

