CREATE SCHEMA if not exists company_constraints;

use company_constraints;

-- restricao atribuida a um dominio
-- CREATE domain d_num AS INT CHECK(d_num >0 AND d_num < 21);
 

CREATE TABLE employee( 
f_name varchar (15) NOT NULL,
minit char, 
l_name varchar(15) NOT NULL, 
ssn char(9) NOT NULL UNIQUE, 
b_date DATE,
addres varchar(50),
sex char, 
Salary decimal(10,2),
super_ssn char(9),
Dno int NOT NULL, 
CONSTRAINT chk_salary_employee CHECK (salary > 2000.0),
CONSTRAINT pk_employee PRIMARY KEY(Ssn)
 
);

desc employee;

CREATE TABLE department(
d_name VARCHAR (15) NOT NULL,
d_number INT NOT NULL,
mgr_ssn char(9),
mgr_start_date DATE, 
dept_create_date date,
CONSTRAINT chk_date_dept CHECK (dept_create_date < mgr_start_date ),
CONSTRAINT pk_dept PRIMARY KEY (d_number), 
CONSTRAINT unique_name_dept UNIQUE (d_name),
FOREIGN KEY (mgr_ssn) references employee (ssn)
);

desc department;

CREATE TABLE dept_location(
d_number INT NOT NULL, 
d_location VARCHAR(15) NOT NULL,
CONSTRAINT pk_dept_locations PRIMARY KEY (d_number, d_location), 
CONSTRAINT fk_dept_locations FOREIGN KEY (d_number) REFERENCES department(d_number)
);

CREATE TABLE project(
p_name VARCHAR (15) NOT NULL,
p_number INT NOT NULL, 
p_location VARCHAR(15), 
d_number INT NOT NULL, 
PRIMARY KEY (p_number), 
CONSTRAINT unique_project UNIQUE (p_name), 
CONSTRAINT fk_project_d_num FOREIGN KEY (d_number) references department (d_number)
);

CREATE TABLE works_on ( 
Essn CHAR(9) NOT NULL,
Pno INT NOT NULL,
hours DECIMAL (1,1) NOT NULL, 
PRIMARY KEY (Essn, Pno), 
CONSTRAINT fk_works_on_Essn
foreign key (Essn) references employee (ssn), 
CONSTRAINT fk_works_on_pnumber foreign key (Pno) references project (p_number) 
);

CREATE TABLE dependent (
Essn char(9) NOT NULL,
dependent_name varchar(15) NOT NULL, 
Sex char, 
b_date DATE, 
relationship VARCHAR(8),
age INT NOT NULL, 
CONSTRAINT chk_age_dependent check (age <22),
PRIMARY KEY (Essn, dependent_name), 
CONSTRAINT fk_dependent FOREIGN KEY (Essn) references employee(ssn) 

);

show tables;
desc  works_on;

-- verificar restrições de um BDD
SELECT * 
FROM information_schema.table_constraints 
WHERE constraint_schema = 'company_constraints';
-- verificar referencias de um BDD (PK)
SELECT * 
FROM information_schema.referential_constraints 
WHERE constraint_schema = 'company_constraints';
