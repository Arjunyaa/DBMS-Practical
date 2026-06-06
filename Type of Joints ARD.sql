-- Inner Join
SELECT s.id, s.name, s.course, d.dept_name
FROM students s
INNER JOIN department d
ON s.dept_id = d.dept_id;

-- Left Join
SELECT s.id, s.name, s.course, d.dept_name
FROM students s
LEFT JOIN department d

ON s.dept_id = d.dept_id;

UPDATE students SET dept_id = NULL WHERE name = 'Neha';

-- Right Join
SELECT s.id, s.name, s.course, d.dept_name
FROM students s
RIGHT JOIN department d
ON s.dept_id = d.dept_id;

-- full Outer Join
SELECT s.id, s.name, s.course, d.dept_name
FROM students s
LEFT JOIN department d
ON s.dept_id = d.dept_id

UNION

SELECT s.id, s.name, s.course, d.dept_name
FROM students s
RIGHT JOIN department d
ON s.dept_id = d.dept_id;

-- Cross Join
SELECT s.name, d.dept_name
FROM students s
CROSS JOIN department d;
