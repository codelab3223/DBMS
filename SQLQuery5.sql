use dbms

 
select * from customer;
select * from salesman;
select * from orders;

SELECT o.ord_no, s.names
FROM orders o
JOIN salesman s ON o.salesman_id = s.salesman_id
WHERE s.salesman_id IN (
    SELECT salesman_id
    FROM salesman
    WHERE names = 'Ayush'
);

SELECT o.ord_no , s.names 
From orders o 
JOIN salesman s ON o.salesman_id = s.salesman_id
WHERE s.salesman_id IN(
SELECT salesman_id 
FROM salesman
WHERE city ='PKR');

SELECT o.ord_no,o.salesman_id , s.names,o.purch_amt, o.ord_date,o.customer_id
from orders o 
JOIN salesman s ON o.salesman_id  = s.salesman_id
WHERE s.salesman_id IN (
SELECT c.salesman_id 
FROM customer c
where customer_id = 3007);

SELECT * from orders o where o.purch_amt > (
SELECT AVG(o.purch_amt) from orders o 
where ord_date = '2012-11-15');

SELECT count(grade) from customer c where c.grade > (
SELECT AVG(c.grade) from customer c 
where city = 'KTM');

SELECT s.names from 
salesman s where s.city = 'PKR' Union select c.cust_name from  customer c  
 where c.city='PKR';

 select distinct s.salesman_id,s.city from salesman s  union select c.salesman_id ,   c.city
 from customer c ;