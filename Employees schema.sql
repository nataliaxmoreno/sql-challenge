-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


-- data modeling for employee pewerthackard
CREATE TABLE Titles (
    title_id VARCHAR(6)   NOT NULL,
    title VARCHAR   NOT NULL,
    CONSTRAINT pk_Titles PRIMARY KEY (
        title_id
     )
);

CREATE TABLE Employees (
    Emp_no INT   NOT NULL,
    Emp_title_id VARCHAR(6)   NOT NULL,
    birthdate DATE   NOT NULL,
    first_name VARCHAR   NOT NULL,
    last_name VARCHAR   NOT NULL,
    sex VARCHAR(2)   NOT NULL,
    hire_date DATE   NOT NULL,
    CONSTRAINT pk_Employees PRIMARY KEY (
        Emp_no
     )
);

CREATE TABLE Departments (
    Dept_no VARCHAR(5)   NOT NULL,
    Dept_name VARCHAR(50)   NOT NULL,
    CONSTRAINT pk_Departments PRIMARY KEY (
        Dept_no
     )
);

CREATE TABLE Dept_emp (
    Emp_no INT   NOT NULL,
    Dept_no VARCHAR(5)   NOT NULL,
    CONSTRAINT pk_Dept_emp 
	PRIMARY KEY (Emp_no,Dept_no));

CREATE TABLE Dept_Manager (
    Dept_no VARCHAR(5)   NOT NULL,
    Emp_no INT   NOT NULL,
    CONSTRAINT pk_Dept_Manager PRIMARY KEY (Dept_no,Emp_no)
    );

CREATE TABLE Salaries (
    Emp_no INT   NOT NULL,
    salary INT   NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (
        Emp_no
     )
);

ALTER TABLE Employees ADD CONSTRAINT fk_Employees_Emp_title_id FOREIGN KEY(Emp_title_id)
REFERENCES Titles (title_id);

ALTER TABLE Dept_emp ADD CONSTRAINT fk_Dept_emp_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_no);

ALTER TABLE Dept_emp ADD CONSTRAINT fk_Dept_emp_Dept_no FOREIGN KEY(Dept_no)
REFERENCES Departments(Dept_no);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_Dept_no FOREIGN KEY(Dept_no)
REFERENCES Departments (Dept_no);

ALTER TABLE Dept_Manager ADD CONSTRAINT fk_Dept_Manager_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_no);

ALTER TABLE Salaries ADD CONSTRAINT fk_Salaries_Emp_no FOREIGN KEY(Emp_no)
REFERENCES Employees (Emp_no);

