use classicmodels; 
describe employees; 
select * from customers;
-- select * from employees;
-- select * from employees where officeCode = 4;
select count(*) from employees;
select * from employees where officeCode = 4;

select contactfirstname as `First Name`, contactlastname as `Last Name` 
from customers
order by contactfirstname asc;

select * from offices;
select count(addressline2) from offices;

select * from employees 
from employees
where jobTitle NOT like "Sales%";
-- order by jobTitle asc;
