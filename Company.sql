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
