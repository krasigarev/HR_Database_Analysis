--- Query 1
SELECT
	first_name,
	last_name
FROM dbo.employees
WHERE salary > (SELECT salary FROM dbo.employees WHERE employee_id = 103);

--- Query 2
SELECT
	first_name,
	last_name,
	salary,
	department_id,
	job_id
FROM dbo.employees
WHERE job_id = (SELECT job_id FROM dbo.employees WHERE employee_id = 179);

--- Query 3
SELECT
	first_name,
	last_name,
	salary,
	department_id
FROM dbo.employees
WHERE salary IN (SELECT MIN(salary) FROM dbo.employees GROUP BY department_id);

--- Query 4
SELECT
	employee_id,
	first_name,
	last_name
FROM dbo.employees
WHERE salary > (SELECT AVG(salary) FROM dbo.employees);

--- Query 5
SELECT
	first_name,
	last_name,
	employee_id,
	salary
FROM DBO.employees
WHERE manager_id = (SELECT employee_id FROM dbo.employees WHERE first_name = 'Den');

--- Query 6
SELECT
	e.department_id,
	e.first_name,
	e.job_id,
	d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id AND d.department_name = 'Finance';

--- Query 7
SELECT
*
FROM employees
WHERE salary = 4000 AND manager_id = 123;

--- Query 8
SELECT
*
FROM employees
WHERE employee_id IN (100, 145,205);

--- Query 9
SELECT
*
FROM employees
WHERE salary BETWEEN 1000 AND 3000;

--- Query 10
SELECT
*
FROM employees
WHERE salary BETWEEN (SELECT MIN(salary) FROM employees) AND 3000;

--- Query 11
SELECT
*
FROM employees 
WHERE department_id NOT IN (SELECT department_id FROM departments WHERE manager_id BETWEEN 100 AND 200);

--- Query 12
SELECT
*
FROM employees
WHERE employee_id IN (SELECT employee_id FROM employees 
					  WHERE salary = 
					  (SELECT MAX(salary) FROM employees WHERE salary 
					  < 
					  (SELECT MAX(salary) FROM employees)));

--- Query 13
SELECT
	first_name,
	last_name,
	hire_date
FROM employees
WHERE department_id = (SELECT department_id FROM employees
					   WHERE first_name = 'Den')
					   AND 
					   first_name <> 'Den';

--- Query 14
SELECT
	employee_id,
	first_name,
	last_name
FROM employees
WHERE department_id IN (SELECT department_id FROM employees WHERE first_name LIKE '%T%');

--- Query 15
SELECT
	employee_id,
	first_name,
	salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
	  AND
	  department_id IN (SELECT department_id FROM employees WHERE first_name LIKE '%J%');

--- Query 16
SELECT
	first_name,
	last_name,
	employee_id,
	job_id
FROM employees
WHERE department_id = (SELECT department_id FROM departments WHERE location_id =(
																    SELECT location_id FROM locations WHERE city = 'Toronto'));

--- Query 17
SELECT
	employee_id,
	first_name,
	last_name,
	job_id
FROM employees
WHERE salary < ANY (SELECT salary FROM employees WHERE job_id = 9);

--- Query 18
SELECT
	employee_id,
	first_name,
	last_name,
	job_id
FROM employees
WHERE salary < ANY (SELECT salary FROM employees WHERE job_id <> 9);
