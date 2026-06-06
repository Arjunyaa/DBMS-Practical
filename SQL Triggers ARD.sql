use  college_db;

-- Create Teacher Table
CREATE TABLE Teacher (
    TeacherID INT PRIMARY KEY,
    TeacherName VARCHAR(50),
    Subject VARCHAR(50),
    Salary DECIMAL(10,2)
);

-- Create Log Table
CREATE TABLE Teacher_Log (
    Message VARCHAR(100)
);

-- Change delimiter temporarily
DELIMITER //

-- Create Trigger
CREATE TRIGGER teacher_trigger
AFTER INSERT ON Teacher
FOR EACH ROW
BEGIN
    INSERT INTO Teacher_Log
    VALUES ('New Teacher Record Inserted');
END //

-- Restore delimiter
DELIMITER ;

-- Insert Data into Teacher Table
INSERT INTO Teacher
VALUES (101, 'Rahul Sharma', 'DBMS', 50000);

-- Check Teacher Table
SELECT * FROM Teacher;

-- Check Log Table
SELECT * FROM Teacher_Log;


use college_db;

-- Create Student Table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    Marks INT,
    Result VARCHAR(10)
);

-- Change delimiter
DELIMITER //

-- Create Trigger
CREATE TRIGGER student_result_trigger
BEFORE INSERT ON Student
FOR EACH ROW
BEGIN
    IF NEW.Marks > 40 THEN
        SET NEW.Result = 'Pass';
    ELSE
        SET NEW.Result = 'Fail';
    END IF;
END //

-- Restore delimiter
DELIMITER ;

-- Insert Records
INSERT INTO Student VALUES
(1, 'Amit', 75, NULL),
(2, 'Priya', 35, NULL),
(3, 'Rohan', 40, NULL),
(4, 'Sneha', 90, NULL);

-- Display Table
SELECT * FROM Student;
