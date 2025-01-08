-- task-1
use sakila;
show tables;
select * from customer;
select * from customer where active=0;

-- task-2
use sakila;
select * from customer;
select first_name,last_name,email from customer where active=0;

-- task-3
use sakila;
select * from customer;
select max(store_id) from customer where active=0;

-- task-4
use sakila;
select * from film;
select * from film where rating='pg-13';

-- task-5
select title,length from film where rating='pg-13' order by length desc limit 3;

-- task-6
select title,rental_duration from film where rating='pg-13' order by rental_duration asc ;

-- task-7
select avg (rental_rate) as 'average rental_rate' from film;

-- task-8
select title, sum(replacement_cost) as 'total replacement_cost' from film group by title;

-- task-9
select * from film_category;
select * from category;
select category_id,name as catname from category where name in("animation","children");
select count(category_id) from film_category where category_id in(2,3) group by(category_id);