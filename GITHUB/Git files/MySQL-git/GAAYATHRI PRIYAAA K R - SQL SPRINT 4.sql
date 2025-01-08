use hr;
-- task1
select * from employees;
select * from departments;
select e.employee_id,e.first_name,e.last_name,d.department_name from employees as e inner join departments as d on e.department_id=d.department_id where d.department_name='it';
-- task2
select min(e.salary),max(e.salary),d.department_name from employees as e right join departments as d on e.department_id=d.department_id group by d.department_name;
-- task3
select count(*)as total_emp,city from employees as e inner join departments as d inner join locations as l on e.department_id=d.department_id and d.location_id=l.location_id group by l.city order by total_emp desc limit 10;
-- task4

