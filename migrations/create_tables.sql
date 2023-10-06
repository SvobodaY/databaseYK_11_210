CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(255),
    employee_position VARCHAR(255),
    hire_date DATE,
);

CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(255),
    project_start_date DATE,
    client_id INT,
);

CREATE TABLE Tasks (
    task_id          INT PRIMARY KEY,
    task_description varchar(max),
    deadline         DATE,
    employee_id      INT,
);

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(255),
    location VARCHAR(255),
    budget DECIMAL(10, 2),
);

CREATE TABLE Clients (
    client_id INT PRIMARY KEY,
    client_name VARCHAR(255),
    contact_name VARCHAR(255),
    contact_email VARCHAR(255),
);
