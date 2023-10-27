CREATE SEQUENCE employee_id_seq START 1;

ALTER TABLE Employees
ALTER COLUMN employee_id SET DATA TYPE INTEGER,
ALTER COLUMN employee_name SET NOT NULL,
ALTER COLUMN employee_position SET NOT NULL,
ALTER COLUMN hire_date SET NOT NULL;

ALTER TABLE Employees
ALTER COLUMN employee_id SET DEFAULT nextval('employee_id_seq');

ALTER TABLE Projects
DROP CONSTRAINT fk_project_client;

ALTER TABLE Projects
ALTER COLUMN project_id SET DATA TYPE INTEGER,
ALTER COLUMN project_name SET NOT NULL,
ALTER COLUMN project_start_date SET NOT NULL;

ALTER TABLE Projects
ADD CONSTRAINT fk_project_client
FOREIGN KEY (client_id) REFERENCES Clients(client_id);

ALTER TABLE Tasks
ALTER COLUMN task_id SET DATA TYPE INTEGER,
ALTER COLUMN task_description SET NOT NULL,
ALTER COLUMN deadline SET NOT NULL,
ALTER COLUMN employee_id SET DATA TYPE INTEGER;

ALTER TABLE Tasks
ADD CONSTRAINT fk_task_employee
FOREIGN KEY (employee_id) REFERENCES Employees(employee_id);

ALTER TABLE Departments
ALTER COLUMN department_id SET DATA TYPE INT;

ALTER TABLE Departments
ALTER COLUMN department_id SET DEFAULT nextval('departments_department_id_seq'::regclass);

ALTER TABLE Clients
DROP COLUMN client_id;

ALTER TABLE Clients
ADD COLUMN new_client_id SERIAL;

UPDATE Clients
SET new_client_id = client_id;

ALTER TABLE Clients
DROP COLUMN client_id;

ALTER TABLE Clients
RENAME COLUMN new_client_id TO client_id;
