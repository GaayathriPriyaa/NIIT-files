use hr;
select * from employees;
select * from departments;

-- task1
select employee_id,first_name,last_name,(select department_name from departments where employees.department_id=departments.department_id) as department_name from employees;

-- task2
select department_id,first_name,last_name,salary from employees where salary > (select avg(salary) from employees) group by department_id,first_name,last_name,salary;

-- task3
select first_name,last_name from employees where department_id in(select department_id from departments where department_name='sales')
 and salary<(select avg(salary) from employees where department_id in(select department_id from departments where department_name='sales'));

 -- task4
select first_name,last_name,salary from employees where salary>(select max(salary) from employees where job_id='IT_PROG') order by salary asc ;

-- task5
select job_id,salary from employees where salary in (select min(salary) from employees group by job_id) order by salary asc;

-- task6
select e.first_name,e.last_name,e.department_id from employees as e where salary>
(select(sum(salary)*0.6) as 'percentage' from employees as e where e.department_id=e.department_id);
