--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.Emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM Employees e
JOIN Salaries s
ON e.Emp_no = s.Emp_no
ORDER BY Emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT first_name, last_name, hire_date
FROM Employees
WHERE DATE_PART('year',hire_date) = 1986;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM departments d
JOIN dept_manager dm ON (d.dept_no=dm.dept_no)
JOIN employees e ON(e.emp_no=dm.emp_no)

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON (de.emp_no=e.emp_no)
JOIN departments d ON (d.dept_no=de.dept_no)
ORDER BY dept_name;
--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM Employees
WHERE first_name='Hercules' and last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON (e.emp_no=de.emp_no)
JOIN departments d ON(d.dept_no=de.dept_no)
WHERE d.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT de.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_emp de ON (e.emp_no=de.emp_no)
JOIN departments d ON(d.dept_no=de.dept_no)
WHERE d.dept_name in ('Sales', 'Development')
ORDER BY dept_name;
--8. List the frequency count of employee last names (i.e., how many employees share each last name) in descending order.
SELECT last_name, COUNT(last_name) AS freq_count_last_names
FROM employees
GROUP BY last_name
ORDER BY freq_count_last_names DESC;