-- Aggregates funtion

-- Count total rows
SELECT COUNT(*) 
FROM instructor;

-- Count salaries (ignores NULL)
SELECT COUNT(salary) 
FROM instructor;

-- Average salary
SELECT AVG(salary) 
FROM instructor;

-- Sum of salary
SELECT SUM(salary) 
FROM instructor;

-- Group By {Department-wise average}
SELECT department, AVG(salary)
FROM instructor
GROUP BY department;