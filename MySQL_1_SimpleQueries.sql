use classicmodels;

select productName, productLine, buyPrice from products
order by buyPrice desc;

select contactFirstname as `First Name`, contactLastName as `Last Name`, city as `City` from customers
order by `Last Name`;

select UNIQUE status from orders;

select * from payments
where paymentDate >= "2005-01-01"
order by paymentDate;
describe payments;

select officeCode, lastName as `Last Name`, firstName as `First Name`, Email as `email`, jobTitle as `Job Title` from employees 
where officeCode = 1
order by lastName;

select productName as `Name`, productLine as `Product Line`, productScale as `Scale`, productVendor as `Product Vendor` from products
where productLine = "Classic Cars" or productLine = "Vintage Cars"
order by productName;

-- can reject numbers




-- group by productLine;
-- = "Vintage Cars",
-- group by productLine = "Classic Cars";
-- order by productName;

-- order by desc;
-- order by "Vintage%", "Classic%";
