-- view  
CREATE VIEW student_department_view AS
SELECT s.id, s.name, s.course, d.dept_name
FROM students s
JOIN department d
ON s.dept_id = d.dept_id;

-- use the view 
SELECT * FROM student_department_view;

-- filter the view
SELECT * FROM student_department_view
WHERE course = 'BCA';

-- view
CREATE VIEW high_marks_students AS
SELECT name, course, marks
FROM students
WHERE marks > 80;

SELECT * FROM high_marks_students;