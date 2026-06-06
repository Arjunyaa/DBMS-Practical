USE college_db;

CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    age INT,
    course VARCHAR(50),
    city VARCHAR(50),
    marks INT
);

INSERT INTO students (name, age, course, city, marks) VALUES
('Ramesh', 20, 'BCA', 'Pune', 85),
('Rajesh', 21, 'BBA', 'Mumbai', 78),
('Ravi', 19, 'BCA', 'Delhi', 92),
('Rohit', 22, 'BTech', 'Pune', 88),
('Suresh', 23, 'BCA', 'Nagpur', 67),
('Mahesh', 20, 'BBA', 'Pune', 74),
('Varun', 21, 'BTech', 'Delhi', 81),
('Vikas', 22, 'BCA', 'Mumbai', 69),
('Ranjeet', 24, 'BBA', 'Nagpur', 90),
('Rekha', 20, 'BCA', 'Pune', 95),
('Amit', 23, 'BTech', 'Delhi', 72),
('Neha', 21, 'BCA', 'Mumbai', 83),
('Kiran', 22, 'BBA', 'Pune', 76),
('Varenya', 19, 'BTech', 'Nagpur', 89);

SELECT * FROM students;


CREATE TABLE instructor (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

DESCRIBE instructor;

INSERT INTO instructor VALUES (1, 'Amit', 'Computer', 50000);
INSERT INTO instructor VALUES (2, 'Ravi', 'Mechanical', NULL);
INSERT INTO instructor VALUES (3, 'Sita', 'IT', 60000);
INSERT INTO instructor VALUES (4, 'John', 'Electrical', NULL);
INSERT INTO instructor VALUES (5, 'Neha', 'Computer', 55000);
INSERT INTO instructor VALUES (6, 'Rahul', 'Civil', 48000);
INSERT INTO instructor VALUES (7, 'Priya', 'Computer', NULL);
INSERT INTO instructor VALUES (8, 'Karan', 'IT', 70000);
INSERT INTO instructor VALUES (9, 'Sneha', 'Mechanical', 52000);
INSERT INTO instructor VALUES (10, 'Arjun', 'Civil', NULL);
INSERT INTO instructor VALUES (11, 'Pooja', 'Electrical', 58000);
INSERT INTO instructor VALUES (12, 'Vikram', 'Computer', 62000);
INSERT INTO instructor VALUES (13, 'Anjali', 'IT', NULL);
INSERT INTO instructor VALUES (14, 'Rohit', 'Mechanical', 45000);
INSERT INTO instructor VALUES (15, 'Meena', 'Electrical', 53000);

SELECT * FROM instructor;


CREATE TABLE `college_db`.`alumni` (
  `PRN` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`PRN`),
  UNIQUE INDEX `PRN_UNIQUE` (`PRN` ASC) VISIBLE);

describe alumni;

INSERT INTO `college_db`.`alumni` (`PRN`, `Name`) VALUES
(1001, 'Ritesh Birhade'),
(1002, 'Harshal Bhagat'),
(1003, 'Paras Bhosale'),
(1004, 'Krishna Tontutvar'),
(1005, 'Rohit Deshmukh'),
(1006, 'Loukik Vishe'),
(1007, 'Karan Singh'),
(1008, 'Pooja Mehta'),
(1009, 'Aditya Pawar'),
(1010, 'Deep Ture');

SELECT * FROM college_db.alumni;

