CREATE DATABASE college_db;
USE college_db;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);
CREATE TABLE Faculty (
    facuTableslty_id INT PRIMARY KEY,
    faculty_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);
CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);
CREATE TABLE Subject (
    subject_id INT PRIMARY KEY,
    subject_name VARCHAR(50),
    faculty_id INT,
    dept_id INT,
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id),
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

INSERT INTO Department VALUES  (1, 'Computer Eng');
INSERT INTO Department VALUES (2, 'Mechanical Eng');

INSERT INTO Faculty VALUES (101, 'Dr. Harsha', 1);
INSERT INTO Faculty VALUES (102, 'Dr. Gandhi', 2);

INSERT INTO Student VALUES (1, 'Ritesh', 1);
INSERT INTO Student VALUES (2, 'Harshal', 2);

INSERT INTO Subject VALUES (201, 'DBMS', 101, 1);
INSERT INTO Subject VALUES (202, 'CP', 102, 2);

show tables;
