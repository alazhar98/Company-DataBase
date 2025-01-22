
Create a database named CompanyDB and switch to using it.
Table Creation:
Create a departments table with:
department_id as the primary key.
department_name and location as required fields.
Create an employees table with:
employee_id as the primary key.
name, salary, department_id, and hire_date fields.
Set department_id as a foreign key referencing the departments table.
Create a projects table with:
project_id as the primary key.
project_name, department_id, and budget fields.
Set department_id as a foreign key referencing the departments table.
Insert Sample Data:
Populate the departments table with records for HR, IT, Finance, and Marketing departments.
Populate the employees table with employee data, ensuring some employees are assigned to departments while others are not.
Populate the projects table with sample projects linked to specific departments.
Tables and Their Attributes
departments Table:
department_id: INT AUTO_INCREMENT PRIMARY KEY
A unique identifier for each department.
department_name: VARCHAR(50) NOT NULL
The name of the department (e.g., HR, IT).
location: VARCHAR(50) NOT NULL
The location of the department (e.g., New York, San Francisco).
employees Table:
employee_id: INT AUTO_INCREMENT PRIMARY KEY
A unique identifier for each employee.
name: VARCHAR(100) NOT NULL
The name of the employee (e.g., Alice, Bob).
salary: DECIMAL(10, 2) NOT NULL
The salary of the employee, stored as a decimal value.
department_id: INT
A foreign key referencing the department_id in the departments table.
hire_date: DATE NOT NULL
The date the employee was hired (e.g., '2020-05-15').
projects Table:
project_id: INT AUTO_INCREMENT PRIMARY KEY
A unique identifier for each project.
project_name: VARCHAR(100) NOT NULL
The name of the project (e.g., HR Automation, Cloud Migration).
department_id: INT
A foreign key referencing the department_id in the departments table.
budget: DECIMAL(10, 2) NOT NULL
The budget allocated to the project.

