-- SOME Clause

select name
from instructor
where salary > some (select salary
from instructor
where dept name = 'Computer');

-- ALL clause

select name
from instructor
where salary > all (select salary
from instructor
where dept name = 'Computer');