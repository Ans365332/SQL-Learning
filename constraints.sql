-- constraints-->
/*
 these are rules and regulation which don't allow inalid data entry in table
 
 -- not null
*/

use regex123;

create table text(id int);
insert into text values(10),(11),(10),(null);

select count(*),count(id) from text;


create table text2(id int not null);
insert into text2 values(10),(11),(10),(null); -- it will give error becauese
                                               --  we used constraint not null
     
-- unique constraints-

create table text4(id int unique);
insert into text4 values(10),(11),(10),(null); -- no duplicate values are allowed in table
											   -- because we use unique constraint
                                               
                                               
-- default constraint

create table text5(id int, gender varchar(20) default 'male'); -- by default it will give default value
                                                               -- because we use default constraint
insert into text5(id) values(10);

select * from text5;

-- check constraint

create table text6(id int check (id>5), gender varchar(20) default 'male');
insert into text6(id) values(10);
insert into text6(id) values(3);-- it will give error because check condition is not valid here
select * from text6;

create table text7(id int check (id>5), gender varchar(20) check (gender in ('male','female')));
insert into text7(id,gender) values(10,'male');
insert into text7(id) values(11,'transgender');-- it will give error because check condition is not valid here
select * from text7;

create table text8(id int check (id>5), gender varchar(20) 
constraint reg_test8_gender_chk check (gender in ('male','female')));
insert into text8(id,gender) values(10,'male');
insert into text8(id,gender) values(11,'transgender');-- it will give error because check condition is not valid here
select * from text8;

create table text9(id int primary key, gender varchar(20) 
constraint reg_test9_gender_chk check (gender in ('male','female')));
insert into text9(id,gender) values(10,'male');
insert into text9(id,gender) values(10,'female');-- it will give error because check condition is not valid here
select * from text9;

-- foriegn key

create table product_n(pid int primary key, pname varchar(20));
insert into product_n values(101,'iphone');
insert into product_n values(102,'ipad');
select * from product_n;

-- without foreign key
create table order_n(order_id int ,price int,pid int);
insert into order_n values(1981,200,101),(1982,300,102),(1984,400,101),(1999,299,108);
select * from order_n;

-- with foreign key
create table orders2(order_id int,price int,pid int,foreign key (pid) references product_n(pid));
insert into orders2 values(1981,200,101),(1982,300,102),(1984,400,101);
insert into orders2 values(1983,299,108);
select * from orders2;

-- Q-> 

create table employee(emp_id int primary key,emp_name varchar(50),
emp_mail varchar(50) unique,foreign key (dep_id) references department(dep_id));
insert into employee values(1,'Raj','r1@gmail.com',1),(2,'Aman','a2@gmail.com',1),
(3,'Ram','r3@gmail.com',2),(4,'Vani','v4@fmail.com',2);
select * from employee;

create table department(dep_id int unique,dep_name varchar(50)
constraint reg_department_dep_name_chk check(dep_name in ('biology','physics')));
insert into department values (1,'physics'),(2,'biology');
select * from department;