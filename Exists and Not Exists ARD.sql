-- exist clause
select course_id
from section as S
where semester = 'Fall' and year = 2017 and 
exists  (select *
from section as T
where semester = 'Spring' and year= 2018 
and S.course_id = T.course_id);

-- not exists clause
select distinct S.ID, S.name
from student as S
where not exists ( (select course_id
from course
where dept_name = 'Computer')
except
(select T.course_id
from takes as T
where S.ID = T.ID));