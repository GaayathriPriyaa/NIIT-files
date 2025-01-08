-- TASK1.1
SELECT customerName, creditLimit FROM customers
ORDER BY creditLimit DESC limit 10;
/*INTERPRETATION: This query is used to retrieve the names and credit limits of the top 10
 customers with the highest credit limits from the customers table.*/
-- TASK1.2
SELECT country, AVG(creditLimit) AS average_creditLimit FROM customers
GROUP BY country;
/*INTERPRETATION: This query calculates the average credit limit for customers in each country from the customers table.
It helps identify how the average credit limit varies across different countries.*/
-- TASK1.3
SELECT state, COUNT(*) AS customer_count FROM  customers
GROUP BY state;
/*INTERPRETATION: The query will return the number of customers located in each state, showing how many customers are in each region.*/
-- TASK1.4
select * from customers;
select * from orders;
SELECT customerName, customerNumber FROM customers where customerNumber not in( select customerNumber from orders);
/*INTERPRETATION: This query finds all customers who have never placed an order. It helps identify customers in the system 
who exist in the customers table but have no corresponding orders in the orders table.*/
-- TASK1.5
select c.customerName ,sum(quantityOrdered*priceEach) as totalSales from customers AS c join orders AS o join orderdetails AS od
on c.customerNumber=o.customerNumber and o.orderNumber=od.orderNumber group by c.customerName order by totalSales ;
/*INTERPRETATION: This query calculates the total sales for each customer based on the quantity ordered and the price per unit of their orders.*/
-- TASK1.6
select * from customers;
select * from employees;
select c.customerNumber,c.contactFirstName,e.employeeNumber,e.firstName as sales_representatives from customers as c join employees as e 
where c.salesRepEmployeeNumber=e.employeeNumber order by employeeNumber desc limit 10;
/*INTERPRETATION: This query finds the sales representatives assigned to each customer by joining the customers and employees tables.*/	
-- TASK1.7
Select * from payments;
select * from customers;
select c.customerNumber, c.customerName, p.amount, max(paymentDate) from customers as c join payments as p
on c.customerNumber = p.customerNumber group by  c.customerNumber, c.customerName, p.amount;
/*INTERPRETATION: This query retrieves the latest payment date and the corresponding payment amount for each customer.*/
-- TASK1.8
select customerName,customerNumber,creditLimit from customers where creditLimit<=0;
/*INTERPRETATION: This query retrieves the names, customer numbers, and credit limits of customers whose credit limit
 is less than or equal to zero.*/
-- TASK1.9
SELECT * FROM CUSTOMERS;
SELECT * FROM PRODUCTS;
select c.customerName,p.productLine from customers as c 
inner join orders as o inner join orderdetails as od inner join products as p
on c.customerNumber=o.customerNumber and o.orderNumber=od.orderNumber and od.productCode=p.productCode
where p.productLine='motorcycles'
group by c.customerName;
 /*INTERPRETATION:The query lists the names of customers who have purchased motorcycles. This could help in analyzing customer preferences
 or targeting specific promotions to these customers.*/
-- TASK1.10
select C.customerName,max(OD.priceEach),P.productLine from customers AS C
inner join orders as O
inner join orderdetails as OD
inner join products as P
ON c.customerNumber= O.customerNumber and
O.orderNumber = OD.orderNumber and
OD.productCode = P.productCode
group by customerName,P.productLine
order by max(OD.priceEach) desc;
/*INTERPRETATION: This query finds the highest price each customer has paid for a product, 
grouped by product line and sorted in descending order of the price.*/

-- TASK2.1
select count(employeeNumber) as number_of_employees, officeCode from employees group by officeCode;
/*INTERPRETATION:  This query retrieves the number of employees in each office, grouped by the office code.*/
-- TASK2.2
select o.officeCode,count(e.employeeNumber) as total_no_of_employees from offices as o join employees as e 
ON o.officeCode = e.officeCode group by o.officeCode having (count(e.employeeNumber))<5;
/*INTERPRETATION: Lists offices where the employee count is less than 5, which might be useful for resource allocation or restructuring.*/
-- TASK2.3
select officeCode,territory from offices;
 /*INTERPRETATION: Lists each office's code and the territory it operates in.*/
-- TASK2.4
select officecode from offices  where officecode not in (select officecode from employees);
 /*INTERPRETATION: This query finds offices that have no employees assigned to them.*/
-- TASK2.5
select sum(od.quantityOrdered*od.priceEach) as total_sales,o.officeCode
from offices as o
INNER JOIN employees as e
INNER JOIN customers AS c
INNER JOIN orders AS oo
INNER JOIN orderdetails AS od
ON o.officeCode = e.officeCode
and e.employeeNumber = c.salesRepEmployeeNumber
and oo.orderNumber = od.orderNumber
group by o.officeCode
order by sum(od.quantityOrdered*od.priceEach) desc limit 10;
/*INTERPRETATION: This query calculates the total sales for each office and lists the top 10 offices with the highest sales.*/
-- TASK2.6
select o.officecode,count(e.employeenumber) as number_of_employees from offices as o 
inner join employees as e on o.officeCode = e.officeCode group by o.officeCode
order by number_of_employees desc;
/*INTERPRETATION: This query retrieves the number of employees in each office and sorts the results in descending order.*/
-- TASK2.7
select o.officeCode,avg(c.creditlimit) as average_credit from offices as o 
join employees as e
join customers as c
on o.officeCode = e.officeCode AND e.employeeNumber = c.salesRepEmployeeNumber group by o.officeCode;
/*INTERPRETATION: This query calculates the average credit limit of customers, grouped by the office code of the sales representatives.*/
-- TASK2.8
select country,count(officeCode) as office_count from offices group by country ;
/*INTERPRETATION: This query counts the number of offices in each country.*/

-- TASK3.1
select productline,count(productcode) as product_count from products group by productLine ;
/*INTERPRETATION:  Displays the total count of products for each product line, which helps understand product distribution across lines.*/
-- TASK3.2
select productline,avg(priceeach) as average_price from products as p 
inner join orderdetails as od on p.productCode = od.productCode
group by productLine order by average_price desc;
/*INTERPRETATION: This query lists each product line with its average price, allowing analysis of pricing strategies and product value.*/
-- TASK3.3
select productCode,productName,MSRP from products where MSRP between 50 and 100;
/*INTERPRETATION:This query displays products that fall within the specified price range, useful for marketing or
 promotional strategies targeting specific price points.*/
-- TASK3.4
select p.productLine,sum(od.quantityOrdered * od.priceEach) as Total_sales_amount from products as p
inner join orderdetails as od on p.productcode = od.productCode group by productLine;
/*INTERPRETATION: This query Displays total sales for each product line, which can inform business decisions regarding inventory and marketing.*/
-- TASK3.5
select productCode,productName,quantityInStock from products where quantityInStock < 10;
/*INTERPRETATION: This query retrieves products that have a stock quantity of less than 10.*/
-- TASK3.6
select productName, max(MSRP) from products group by productName order by max(MSRP) desc limit 1 ;
/*INTERPRETATION:This query finds the product name with the highest MSRP,useful for identifying premium offerings.*/
-- TASK3.7
select p.productCode,p.productName,sum(od.quantityOrdered * od.priceEach) as total_sales from products as p
inner join orderdetails as od on p.productCode = od.productCode
group by p.productCode,p.productName;
/*INTERPRETATION:This query Lists each product's total sales, which helps evaluate product performance.*/
-- TASK3.8
DELIMITER //
CREATE PROCEDURE sp_top_selling_product( IN top_products INT)
BEGIN
SELECT p.productCode,p.productName,sum(od.quantityOrdered) as total_quantity from products as p 
inner join orderdetails as od on p.productCode = od.productCode 
group by p.productCode,p.productName order by total_quantity desc limit top_products ;
END // 
CALL sp_top_selling_product(5);
/*INTERPRETATION: This stored procedure retrieves the top-selling products based on the total quantity ordered, 
providing valuable insights for inventory and sales strategies.*/
-- TASK3.9
select productLine,quantityInStock from products where quantityInStock < 10 and productLine in ('classic cars','motorcycles');
/*INTERPRETATION: This query identifies products in the "classic cars" and "motorcycles" product lines with a stock quantity of less than 10.*/
-- TASK3.10
select p.productName,count(c.customerNumber) as number_of_customers from products p join orderdetails od join orders o join customers c
 on p.productCode=od.productCode and od.orderNumber=o.orderNumber and o.customerNumber=c.customerNumber
 group by p.productName
 having number_of_customers >10;
 /*INTERPRETATION: This query identifies products that have been purchased by more than 10 customers which have a broad customer base, 
 indicating popularity.*/
-- TASK3.11
select p.productName,p.productLine,od.quantityOrdered from products p join orderdetails od on p.productCode=od.productCode
where od.quantityOrdered>(select avg(quantityOrdered) from orderdetails) group by p.productName,p.productLine,od.quantityOrdered;
/*INTERPRETATION: This query retrieves products that have been ordered in quantities greater than the average quantity ordered across all products,
 which may indicate high demand or popularity.*/