-- subquery-->(inner query/nested query)
-- A query within a query is called subquery

use sakila;

select * from actor;

select first_name from actor where actor_id=5;

      -- syntax --
select * from actor where 
first_name=(select first_name from actor where actor_id=5);

select * from actor where 
first_name=(select first_name from actor where actor_id=2);

select * from payment;

select amount from payment where payment_id=3;

select * from payment where amount=5.99;
select * from payment where amount=(select amount from payment where payment_id=3);

-- 1. get the payment id,amount,and payment date where the amount of rental id 1476 is same

select amount from payment where rental_id=1476;

select payment_id,amount,payment_date from payment
where amount=(select amount from payment where rental_id=1476);

-- 2.get the payment id,amount and payment date where the month of the table
-- is eqals to the month of payment id 4

select month(payment_date) from payment where payment_id=4;

-- >,<,>=
select payment_id,amount,payment_date from payment 
where month(payment_date)=(select month(payment_date) from payment where payment_id=4);

select * from payment;

-- 3.get the payment id and amount from the table where the amount is equal to
-- the max amount from the table

select max(amount) from payment;

select payment_id,amount from payment
 where amount=(select max(amount) from payment);
 
