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

-- string operation
SELECT * FROM students
WHERE name LIKE 'R%';

SELECT * FROM students
WHERE name LIKE '%h';

SELECT * FROM students
WHERE name LIKE '%var%';

-- Asending 
SELECT * FROM students
ORDER BY marks ASC;
-- desending 
SELECT * FROM students
ORDER BY age DESC;

-- between operator 
SELECT * FROM students
WHERE marks BETWEEN 70 AND 90;

SELECT * FROM students
WHERE age BETWEEN 20 AND 22;

-- Set Operations
-- union
SELECT name FROM students WHERE city = 'Pune'
UNION
SELECT name FROM students WHERE marks > 85;
-- intersect
SELECT name FROM students
WHERE city = 'Pune' AND marks > 85;
-- except
SELECT name FROM students
WHERE city = 'Pune'
AND id NOT IN (
    SELECT id FROM students WHERE marks > 85);
    
