
create database cdb;
use cdb;

create table customer(c_id int,
c_name varchar(50),
c_addr varchar(50),
c_salary decimal(18,2),
c_phone int,
c_age int
);

select * 
from customer

create table orders(
o_id int,
o_name varchar(50),
o_amt decimal(18,2),
cust_id int,
);

select *
from orders

alter table customer
alter column c_name varchar(50) not null;


alter table customer
alter column c_id int not null;


alter table customer
add constraint pk_constraint primary key(c_id);

alter table customer
add constraint c_addr_constraint
default 'butwal' for c_addr;

alter table customer
add constraint unique_constraint
unique (c_phone);


alter table customer 
add constraint check_constraint
check (c_age>=18);

alter table orders
add foreign key (cust_id) references
customer(c_id);




ALTER TABLE customer
ADD c_phone varchar(50);


ALTER TABLE customer
DROP COLUMN c_phone;

ALTER TABLE customer
DROP CONSTRAINT unique_constraint;

INSERT INTO customer (c_id, c_name, c_addr, c_salary, c_age, c_phone) VALUES
(1, 'Ram Bahadur', 'Kathmandu', 55000.00, 30, '9801234567'),
(2, 'Sita Kumari', 'Lalitpur', 62000.50, 28, '9812345678'),
(3, 'Hari Prasad', 'Pokhara', 48000.75, 35, '9823456789'),
(4, 'Gita Rana', 'Biratnagar', 53000.00, 33, '9834567890'),
(5, 'Shyam Thapa', 'Butwal', 60000.25, 40, '9845678901'),
(6, 'Mina Shrestha', 'Bhaktapur', 57000.10, 27, '9856789012'),
(7, 'Ramesh Karki', 'Dharan', 49000.00, 31, '9867890123'),
(8, 'Bina Basnet', 'Janakpur', 51000.55, 29, '9878901234'),
(9, 'Dipak Lama', 'Hetauda', 54000.00, 36, '9889012345'),
(10, 'Sunita Joshi', 'Nepalgunj', 58000.80, 34, '9890123456');

select *
from customer

INSERT INTO orders (o_id, o_name, o_amt, cust_id) VALUES
(101, 'Laptop Purchase', 85000.00, 1),
(102, 'Mobile Phone', 35000.50, 2),
(103, 'Refrigerator', 45000.00, 3),
(104, 'Television', 55000.00, 4),
(105, 'Washing Machine', 30000.00, 5),
(106, 'Air Conditioner', 60000.75, 6),
(107, 'Microwave Oven', 25000.20, 7),
(108, 'Smart Watch', 15000.00, 8),
(109, 'Tablet', 22000.00, 9),
(110, 'Printer', 18000.00, 10);


select *
from orders

INSERT INTO orders (o_id, o_name, o_amt, cust_id) VALUES
(111, 'Headphones', 4500.00, 1),
(112, 'Bluetooth Speaker', 7000.00, 2),
(113, 'Dining Table', 30000.00, 3),
(114, 'Sofa Set', 65000.00, 4),
(115, 'Office Chair', 12000.50, 5),
(116, 'Gaming Console', 50000.00, 6),
(117, 'Camera', 72000.00, 7),
(118, 'Bookshelf', 8500.00, 8),
(119, 'Study Desk', 15000.00, 9),
(120, 'Ceiling Fan', 4000.00, 10);


update customer
set c_addr = 'abc'
where c_addr = 'Kathmandu' or c_addr='Pokhara';

select * 
from customer


select o.cust_id,sum(o.o_amt) as total_amount, count(o.cust_id) as order_qt
from customer as c , orders as o
where c.c_id = o.cust_id
group by o.cust_id;

create view sales_view as 
select o.cust_id,sum(o.o_amt) as total_amount, count(o.cust_id) as order_qt
from customer as c , orders as o
where c.c_id = o.cust_id
group by o.cust_id;

select * from sales_view

select  distinct(c.c_salary) as unique_salary , c.c_name 
from customer as c

delete from customer 
where c_age between 24 and 26

//Display the record of customer whose salary > those customer whose age > 35
select *
from customer
where c_salary > (select max(c_salary) from customer
					where c_age>35)

select max(c_salary) from customer
where c_age>35
select * from customer


create table sales (
s_id int ,
s_pname varchar(50),
s_prodname varchar(50),
c_id int references customer(c_id),
)