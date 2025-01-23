create DataBase company

use company 

create table departments(
	department_id INT IDENTITY(1,1) PRIMARY KEY,
	department_name VARCHAR(50) NOT NULL,
	location VARCHAR(50) NOT NULL

);    


create table employees (
	employee_id INT IDENTITY(1,1) PRIMARY KEY,
	name  VARCHAR(100) NOT NULL,
	salary DECIMAL(10, 2) NOT NULL,
	department_id INT,
	hire_date DATE NOT NULL,
	FOREIGN KEY (department_id) REFERENCES departments(department_id),

);

create table projects  (
	project_id INT IDENTITY(1,1) PRIMARY KEY,
	project_name  VARCHAR(100) NOT NULL,
	budget DECIMAL(10, 2) NOT NULL,
	department_id INT,
	FOREIGN KEY (department_id) REFERENCES departments(department_id),

);


INSERT INTO departments (department_name, location)
VALUES
    ('HR', 'Building A'),
    ('IT', 'Building B'),
    ('Finance', 'Building C'),
    ('Marketing', 'Building D');


INSERT INTO employees (name, salary, department_id, hire_date)
VALUES
    ('alazhar', 20000.00, 1, '2023-01-15'),
    ('salim', 1000.00, 2, '2022-11-01');
  
INSERT INTO projects (project_name, budget, department_id)
VALUES
    ('company', 10000.00, 1),
    ('Website ', 50000.00, 2);
;
/*Find all employees earning a salary higher than the average salary of all employees.*/
select name from employees where salary > (select AVG(salary) from employees);

/*List the names of employees working in departments located in 'New York'.*/
select name from employees  where department_id IN( select department_id from departments where location ='Building B');

/*List the names of employees working in departments located in 'New York'.*/
select name from employees e where salary > (select avg(salary) from employees where department_id =e.department_id);

/*Retrieve the names of employees who are not assigned to any department.*/
select name from employees where department_id is null;

/*Identify the department name with the highest number of employees.*/
SELECT department_name FROM departments WHERE department_id = ( SELECT TOP 1 department_id FROM employees GROUP BY department_id ORDER BY COUNT(department_id) DESC);

/*List the names of departments that do not have any associated projects.*/
select department_name from departments where department_id not in (select department_id from projects group by department_id);

/*List the names and salaries of the highest-paid employees in each department.*/
select name , salary from employees e  where salary =(select MAX(salary) from employees where department_id=e.department_id);

/*Find projects whose budgets exceed the total salaries of all employees in their respective departments.*/
select project_name from projects where budget>(select MAX (salary) from employees where department_id = projects.department_id); 

/*Find the names of employees working in departments that manage projects with a budget greater than $200,000.*/
select name from employees where department_id in (select department_id from projects where budget>200000);

/*List the names of employees who work in departments located in 'San Francisco'.*/
select name from employees  where department_id IN( select department_id from departments where location ='San Francisco');

/*Retrieve the name of the department that manages the project with the highest budget..*/
SELECT name FROM employees WHERE salary > (SELECT AVG(salary) FROM employees AS e WHERE e.department_id = employees.department_id);

/*Display the department ID and the total number of employees in each department.*/
select  department_id , COUNT(employee_id) AS total_employees from employees group by department_id;

/*List employees who are in departments that do not have any projects.*/
select name from employees where department_id not in (select DISTINCT department_id from projects);  

/*List the names of projects that have a budget higher than the average project budget.*/
select project_name from projects where budget>(select AVG(budget) from projects);

/*Find the department IDs of departments that have fewer than three employees.*/
select department_id from employees  group by department_id having COUNT(employee_id)<3;

/*Find the name of the employee with the highest salary in the company*/
select name from employees where salary=(select max(salary) from employees);

/*Find the names of departments that manage projects with a budget of less than $100,000.*/
select department_name from departments where department_id in (select department_id from projects where budget<100000);

/*Identify the name and hire date of the most recently hired employee.*/
select name , hire_date from employees where hire_date= ( SELECT MAX(hire_date) FROM employees);
