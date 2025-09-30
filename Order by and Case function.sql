use sakila;

-- subgrouping--

select * from payment;
select customer_id,count(amount) from payment group by customer_id,amount;

select customer_id,amount,count(amount) from payment group by customer_id,amount;

-- how much amount we have expand in each year
select year(payment_date),sum(amount) from payment group by year(payment_date);

select year(payment_date),sum(amount),staff_id from payment group by year(payment_date),staff_id;

-- Order by--(sort)
 select * from payment order by customer_id;
 
select * from payment order by customer_id desc;

-- fro two column-
select * from payment order by customer_id desc,amount desc;

-- Conditional statement/functions-->

select customer_id,amount,if(amount>3,'High','Low') from payment;

-- nested condition-->

select customer_id,amount,if(amount=2.99,'High',if(amount=5.99,'Avg','Low')) from payment;

-- Case-->

select customer_id,amount,
 case
    when amount=2.99 then 'High'
    when amount=5.99 then 'Avg'
    else 'Low'
 end as 'A'
from payment; 

-- 1.select two column customer_id and status if customer id is greater than 1
-- print hello if customer id is greater than 4 print user otherwise print regex

select * from payment;

select customer_id ,
 case
    when customer_id>4 then 'User'
    when customer_id>1 then 'Hello'
    else 'Regex'
  end as 'Status'
from payment;  



