-- Joins and Groupings

use classicmodels;

-- Question 1
select CONCAT(c.contactFirstName, ' ', c.contactLastName) as `Customer Name`, CONCAT(e.lastName, ', ', e.firstName) as `Sales Rep`
from customers as c
join employees as e on c.salesRepEmployeeNumber = e.employeeNumber
order by `Customer Name`;

-- Question 2
select p.productName as `Product Name`, SUM(o.quantityOrdered) as `Total # Ordered`, SUM(o.priceEach * o.quantityOrdered) as `Total Sale`
from products as p
join orderdetails as o on p.productCode = o.productCode
group by productName order by `Total Sale` desc;

-- Question 3
select status as `Order Status`, count(status) as `# Orders` from orders 
group by `Order Status`;

-- Question 4
select p.productLine as `Product Line`, sum(o.quantityOrdered) as `# Sold`
from products as p
join orderdetails as o on o.productCode = p.productCode
group by productLine;

select * from orders;

-- Question 5
-- SELECT *, 

SELECT CONCAT(lastName, ', ', firstName) as `Sales Rep`, if((od.quantityOrdered IS NULL), '0.00', SUM(od.quantityOrdered*od.priceEach)) as `Total Sales`
FROM employees as e
LEFT JOIN customers as c on e.employeeNumber = c.salesRepEmployeeNumber
LEFT JOIN orders as o on o.customerNumber = c.customerNumber
LEFT JOIN orderdetails as od on od.orderNumber = o.orderNumber
WHERE e.jobTitle ='Sales Rep'
GROUP BY `Sales Rep` ORDER By SUM(od.quantityOrdered*od.priceEach) desc;


-- SELECT CONCAT(lastName, ', ', firstName) as `Sales Rep`, if(SUM(od.quantityOrdered*od.priceEach IS NULL), CAST('0.00' AS INT), SUM(od.quantityOrdered*od.priceEach)) as `Total Sales`
-- FROM employees as e
-- LEFT JOIN customers as c on e.employeeNumber = c.salesRepEmployeeNumber
-- LEFT JOIN orders as o on o.customerNumber = c.customerNumber
-- LEFT JOIN orderdetails as od on od.orderNumber = o.orderNumber
-- WHERE e.jobTitle ='Sales Rep'
-- GROUP BY `Sales Rep` ORDER By `Total Sales` desc;

-- Question 6
SELECT MONTHNAME(paymentDate) AS `Month`, CAST(YEAR(paymentDate) AS VARCHAR(4)) AS `Year`, FORMAT(SUM(amount), 2) AS `Payments Received` from payments
GROUP BY `Year`, `Month` ORDER BY paymentDate;


