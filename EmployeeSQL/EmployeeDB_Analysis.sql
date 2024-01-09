--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM "Employees" AS e left join "Salaries" AS s 
ON e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM "Employees" 
WHERE to_char(hire_date, 'YYYY') = '1986';

--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM "Dept_Manager" AS dm 
JOIN "Employees" AS e ON dm.emp_no = e.emp_no
JOIN "Departments" AS d ON dm.dept_no = d.dept_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM "Dept_Employee" AS de 
JOIN "Employees" AS e ON de.emp_no = e.emp_no
JOIN "Departments" AS d ON de.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules'
AND last_name like 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT e.emp_no, e.last_name, e.first_name
FROM "Dept_Employee" AS de 
JOIN "Employees" AS e ON de.emp_no = e.emp_no
JOIN "Departments" AS d ON de.dept_no = d.dept_no
WHERE d.dept_no = 'd007';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name
FROM "Dept_Employee" AS de 
JOIN "Employees" AS e ON de.emp_no = e.emp_no
JOIN "Departments" AS d ON de.dept_no = d.dept_no
WHERE d.dept_no = 'd007' OR d.dept_no = 'd005';

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) as frquency_counts
FROM "Employees"
GROUP BY last_name;
