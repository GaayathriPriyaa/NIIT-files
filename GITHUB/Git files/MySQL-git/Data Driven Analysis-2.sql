-- TASK1.1
select COUNT(*) as total_employees from employees;
/*INTERPRETATION: This query returns the total number of employees in the employees table by counting all the rows.
 The result will give the total number of entries or employees.*/
-- TASK1.2
select employeeNumber, firstName, lastName from employees;
/*INTERPRETATION: This query retrieves a list of all employees along with their employeeNumber, firstName, and lastName.
 It is essentially showing the basic information (ID and names) of each employee.*/
-- TASK1.3
select jobTitle, COUNT(*) AS number_of_employees FROM employees GROUP BY jobTitle;
/*INTERPRETATION: This query counts the number of employees for each job title. By using GROUP BY jobTitle, 
the query groups employees by their job title, and the COUNT(*) function counts how many employees hold each job title.*/
-- TASK1.4
select employeeNumber, firstName, lastName FROM employees
WHERE reportsTo is null;
/*INTERPRETATION: This query retrieves the employee details (ID, first name, and last name) of those who do not report to anyone,
 meaning these are likely the top-level managers or executives in the organization.*/
-- TASK1.5
select sum(quantityOrdered*priceEach) as total_sales, e.employeeNumber,e.firstName,e.lastName from orderdetails as od 
join orders as o join customers as c join employees as e
on od.orderNumber = o.orderNumber and o.customerNumber = c.customerNumber 
and c.salesRepEmployeeNumber = e.employeeNumber group by  e.employeeNumber;
/*INTERPRETATION: This query calculates the total sales for each sales representative by summing the product of quantityOrdered and priceEach. 
It groups the results by the employee number and returns the employee's ID, first name, last name, and total sales.*/
-- TASK1.6
select sum(quantityOrdered*priceEach) as total_sales, e.employeeNumber from orderdetails as od
 join orders as o join customers as c join employees as e
on od.orderNumber = o.orderNumber and o.customerNumber = c.customerNumber and c.salesRepEmployeeNumber = e.employeeNumber
 group by  e.employeeNumber;
 /*INTERPRETATION: This query is similar to TASK 1.5, but it only returns the employee number (employeeNumber) and the total sales they generated,
 without including their first and last names.*/
-- TASK1.7
select concat(e.firstName, " " ,e.lastName) as name, sum(od.quantityOrdered*od.priceEach) as sold, avg(od.quantityOrdered*od.priceEach) as avg_sales ,e.employeeNumber 
from orderdetails as od
  join orders as o
  join customers as c 
  join employees as e
on od.orderNumber = o.orderNumber and o.customerNumber = c.customerNumber and c.salesRepEmployeeNumber = e.employeeNumber
 group by name,e.employeeNumber having sold > avg_sales;
 /*INTERPRETATION: This query identifies employees whose total sales exceed their average sales, calculating both metrics for each employee.
 It returns only those who have performed above average in terms of total sales.*/
 
 -- TASK2.1
 select avg(od.quantityOrdered*od.priceEach) as avg_order_amount ,o.customerNumber from orderdetails as od join orders as o on od.orderNumber = o.orderNumber 
 group by customerNumber;
  /*INTERPRETATION: This query calculates the average order value for each customer by grouping results based on customerNumber.*/
 -- TASK2.2
 select count(orderNumber) as number_of_orders , month(orderDate) from orders as o group by month(orderDate);
  /*INTERPRETATION: This query counts the number of orders placed each month. 
  It groups the results by the month of the orderDate and returns the total number of orders for each month.*/
 -- TASK2.3
 select orderNumber FROM orders where status = 'Pending';
  /*INTERPRETATION: This query retrieves the orderNumber of all orders that have a status of 'Pending'.*/
 -- TASK2.4
select o.orderNumber ,c.customerNumber,concat(c.contactFirstName, " ",c.contactLastName) as name from orders as o
join customers as c ON o.customerNumber = c.customerNumber;
 /*INTERPRETATION: This query retrieves the order number, customer number, and the full name (concatenating first and last names)
 of each customer by joining the `orders` and `customers` tables based on the `customerNumber`.
 It shows which customer placed each order.*/
-- TASK2.5
select * from orders order by orderDate desc limit 3;
 /*INTERPRETATION: This query retrieves the most recent three orders from the `orders` table by 
 sorting them in descending order based on the `orderDate` 
 and limiting the result to the last three entries.*/
-- TASK2.6
select sum(quantityOrdered*priceEach) as total_sales , o.orderNumber from orders as o join orderdetails as od 
on o.orderNumber = od.orderNumber group by o.orderNumber;
 /*INTERPRETATION: This query calculates the total sales for each order by multiplying `quantityOrdered` by `priceEach` 
 from the `orderdetails` table, then summing the result.
 It groups the data by `orderNumber` and returns the total sales amount for each order.*/
-- TASK2.7
select o.orderNumber, sum(quantityOrdered*priceEach) as total_sales from orders as o
join orderdetails as od ON o.orderNumber = od.orderNumber
group by o.orderNumber order by total_sales desc limit 1;
 /*INTERPRETATION: This query retrieves the order number and total sales for the highest-selling order.
 It calculates total sales by multiplying `quantityOrdered` by `priceEach`, groups the results by `orderNumber`,
 and orders them in descending order based on total sales, limiting the output to just the top order.*/
-- TASK2.8
select o.orderNumber, o.orderDate, od.productCode, od.quantityOrdered, od.priceEach from orders as o
join orderdetails as od ON o.orderNumber = od.orderNumber;
 /*INTERPRETATION: This query retrieves details of all orders, including the order number, order date, product code,
 quantity ordered, and price for each item.
 It joins the `orders` and `orderdetails` tables to provide a comprehensive view of each order's contents.*/
-- TASK2.9
select productLine, count(productName) from products group by productLine order by count(productName) desc;
/*INTERPRETATION: This query counts the number of products within each product line. It groups the results by `productLine`,
 orders them in descending order based on the product count, and shows which product lines have the most products. */
-- TASK2.10
select o.orderNumber, sum(quantityOrdered*priceEach) as total_revenue from orders as o
join orderdetails as od ON o.orderNumber = od.orderNumber group by o.orderNumber;
 /*INTERPRETATION: This query calculates the total revenue for each order by summing the product of `quantityOrdered` and `priceEach` from the `orderdetails` table.
 It groups the results by `orderNumber` and returns the total revenue for each order.*/
-- TASK2.11
select  o.orderNumber, sum(quantityOrdered*priceEach) as total_revenue from orders as o
join orderdetails as od ON o.orderNumber = od.orderNumber group by o.orderNumber
order by total_revenue desc limit 5;
 /*INTERPRETATION: This query retrieves the top 5 orders with the highest total revenue, calculated by summing `quantityOrdered * priceEach`,
 and orders them in descending order.*/
-- TASK2.12
select o.orderNumber, o.orderDate, p.productName, p.productDescription, od.quantityOrdered, od.priceEach from orders as o
join orderdetails as od on o.orderNumber = od.orderNumber
join products as p on od.productCode = p.productCode;
 /*INTERPRETATION: This query retrieves order details, including the order number, date, product name, description, quantity ordered,
 and price by joining the `orders`, `orderdetails`, and `products` tables.*/
-- TASK2.13
select orderNumber from orders where shippedDate > requiredDate;
 /*INTERPRETATION: This query retrieves the `orderNumber` of all orders where the `shippedDate`
 is later than the `requiredDate`, indicating delayed shipments.*/
-- TASK2.14
select od1.productcode as p1,od2.productcode as p2
FROM orderdetails AS od1
JOIN orderdetails AS od2 ON od1.orderNumber = od2.orderNumber 
where od1.productCode < od2.productCode;
-- TASK2.15
select  o.orderNumber, sum(quantityOrdered*priceEach) as total_revenue from orders as o
join orderdetails as od ON o.orderNumber = od.orderNumber group by o.orderNumber
order by total_revenue desc limit 10;
 /*INTERPRETATION: This query retrieves the top 10 orders with the highest total revenue. 
 It calculates the total revenue for each order by summing `quantityOrdered * priceEach`, groups the 
 results by `orderNumber`, and sorts them in descending order based on total revenue.*/
-- TASK2.16
select * from customers;
select * from orders;
select * from orderdetails;
delimiter $$
create trigger updated_customer
after insert on orders 
for each row
begin
INSERT INTO orders (orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber)
VALUES (10001, '2023-10-01', '2023-10-07', '2023-10-05', 'Shipped', 'Test order', 103);
update customers set creditlimit=creditlimit-sum(quantityOrdered*priceEach)
where customerNumber=new.customerNumber;
end $$
-- TASK2.17
select * from orders;
select * from orderdetails where productcode='s10_4962';
select * from products;
delimiter $$
create trigger log_product
after insert on orderdetails 
for each row
begin 
update products set quantityinstock= quantityinstock-new.quantityordered where productcode =new.productcode;
end $$
insert into orders (orderNumber, orderDate, requiredDate, shippedDate, status, comments, customerNumber)
values (10, '2024-09-29', '2024-10-08','2024-10-06', 'inprogress', 'Test order1', 103);
insert into orderdetails (orderNumber, productCode, quantityOrdered, priceEach, orderLineNumber)
values (10, 'S10_4962', 91, 20.00, 1);



