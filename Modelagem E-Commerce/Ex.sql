CREATE SCHEMA if not exists company;
use company;

CREATE TABLE company.employee( 
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
primary key (Ssn)
);

CREATE TABLE department(
d_name VARCHAR (15) NOT NULL,
d_number INT NOT NULL,
mgr_ssn char(9),
mgr_start_date DATE, 
PRIMARY KEY (d_number), 
UNIQUE (d_name),
FOREIGN KEY (mgr_ssn) references employee (ssn)
);

CREATE TABLE dept_location(
d_number INT NOT NULL, 
d_location VARCHAR(15) NOT NULL,
PRIMARY KEY (d_number, d_location), 
FOREIGN KEY (d_number) REFERENCES department(d_number)
);

CREATE TABLE project(
p_name VARCHAR (15) NOT NULL,
p_number INT NOT NULL, 
p_location VARCHAR(15), 
d_number INT NOT NULL, 
PRIMARY KEY (p_number), 
UNIQUE (p_name), 
FOREIGN KEY (d_number) references department (d_number)
);

CREATE TABLE works_on ( 
Essn CHAR(9) NOT NULL,
Pno INT NOT NULL,
hours DECIMAL (1,1) NOT NULL, 
PRIMARY KEY (Essn, Pno), 
foreign key (Essn) references employee (ssn), 
foreign key (Pno) references project (p_number) 
);

CREATE TABLE dependent (
Essn char(9) NOT NULL,
dependent_name varchar(15) NOT NULL, 
Sex char, 
b_date DATE, 
relationship VARCHAR(8),
PRIMARY KEY (Essn, dependent_name), 
FOREIGN KEY (Essn) references employee(ssn) 

);

show tables;

desc  works_on;