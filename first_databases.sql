-- create database called example_db
-- employee table has emp id, name, and age
-- address table address id, street address, city, state, fk_emp_id, timestamp with default value of time now 
-- constraints fk in address table for employee table 


create database example_db;
use example_db;

create table employee (
	emp_id int(4) primary key auto_increment,
	name varchar(255) not null default 'MISSING',
	age tinyint check(age >= 0)
);
describe employee;

insert into employee(`name`, `age`) values('Keith', '25');
insert into employee(`name`, `age`) values('Shaquille', '80');
select * from example_db.employee;

select * from classicmodels.employees;

-- address table with address, id, street address, city, state, fk_emp_id, timestamp

create table address (
	address_id int(11) primary key auto_increment,
	address_street varchar(255) not null default 'unknown',
	city varchar(255) not null default 'unknown',
	state char(2) not null default 'NA',
	timestamp TIMESTAMP not null default NOW(6),
	fk_emp_id int(4),
	constraint some_name foreign key(fk_emp_id)
	references employee(emp_id)
	
);
describe address;

insert into address (`address_street`, `city`, `state`, `fk_emp_id`)
values ('123 street', 'Plano', 'TX', 2);
select * from address;