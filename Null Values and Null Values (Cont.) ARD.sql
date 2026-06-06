-- Null Values
-- null
SELECT name FROM instructor
WHERE salary IS NULL; 

-- not null
SELECT name FROM instructor
WHERE salary IS NOT NULL;


-- Null Values (Cont.)
-- AND with UNKNOWN
SELECT name FROM instructor
WHERE salary > 50000 AND department = 'IT';

-- AND with FALSE + UNKNOWN
SELECT name FROM instructor
WHERE salary < 50000 AND department = 'IT';

-- OR with UNKNOWN
SELECT name FROM instructor
WHERE salary > 60000 OR department = 'IT';

-- OR with UNKNOWN + FALSE
SELECT name FROM instructor
WHERE salary > 80000 OR department = 'Mechanical';

-- NOT with UNKNOWN
SELECT name FROM instructor
WHERE NOT (salary > 50000);