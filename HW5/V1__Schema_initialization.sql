CREATE TABLE Employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(255) NOT NULL,
    employee_position VARCHAR(255) NOT NULL,
    hire_date DATE NOT NULL
);

CREATE TABLE Projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(255) NOT NULL,
    project_start_date DATE NOT NULL,
    client_id INT
);

CREATE TABLE Tasks (
    task_id INT PRIMARY KEY,
    task_description TEXT NOT NULL,
    deadline DATE,
    employee_id INT
);

CREATE TABLE Departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    budget DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Clients (
    client_id SERIAL PRIMARY KEY,
    client_name VARCHAR(255) NOT NULL,
    contact_name VARCHAR(255),
    contact_email VARCHAR(255)
);
