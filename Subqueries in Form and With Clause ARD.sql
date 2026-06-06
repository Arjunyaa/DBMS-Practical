-- Subqueries in the Form Clause 

select dept_name, avg_salary
from ( select dept_name, avg (salary) as avg_salary
from instructor
group by dept_name)
where avg_salary > 42000;

select dept_name, avg_salary
from ( select dept_name, avg (salary) 
from instructor
group by dept_name) 
as dept_avg (dept_name, avg_salary)
where avg_salary > 42000;

-- Subqueries in the With Clause

with max_budget (value) as 
(select max(budget)
from department)
select department.name
from department, max_budget
where department.budget = max_budget.value;