-- Normalization->

create database  regex123;
use regex123;


-- primary key is pid
select * from product;

-- primary key is order id  and productid is a foreign key 
-- that refer to primary key of product table
select * from orders;

-- inner join->
select prd.pid,prd.pname,ord.productid,ord.city 
from product as prd join orders as ord
where prd.pid=ord.productid;

   -- or --
   
select prd.pid,prd.pname,ord.productid,ord.city 
from product as prd inner join orders as ord
on prd.pid=ord.productid;

-- left join->

select prd.pid,prd.pname,ord.productid,ord.city 
from product as prd left join orders as ord
on prd.pid=ord.productid;

select orders.productid,orders.city,product.pid,product.pname
from orders left join product on 
orders.productid=product.pid;

-- right join-->

select prd.pid,prd.pname,ord.productid,ord.city 
from product as prd right join orders as ord
on prd.pid=ord.productid;

select orders.productid,orders.city,product.pid,product.pname
from orders right join product on 
orders.productid=product.pid;

use sakila;
select * from actor;
select * from film_actor;

-- to check all value are unique in actor id column--

desc actor;

select count(actor_id),count(distinct actor_id) from actor;


desc film_actor;

select actor.actor_id,actor.first_name,film_actor.actor_id,
film_actor.film_id from actor inner join film_actor
on actor.actor_id=film_actor.actor_id;

-- actor_id=1-
select actor.actor_id,actor.first_name,film_actor.actor_id,
film_actor.film_id from actor inner join film_actor
on actor.actor_id=film_actor.actor_id and actor.actor_id=1; 




drop database regex123;
create database regex123;

use regex123;
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseName VARCHAR(50),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID)
);


INSERT INTO Student (StudentID, StudentName) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David'),
(5, 'Eva'),
(6, 'Frank'),
(7, 'Grace'),
(8, 'Helen'),
(9, 'Ian'),
(10, 'Jack');


INSERT INTO Enrollment (EnrollmentID, StudentID, CourseName) VALUES
(101, 1, 'Math'),
(102, 2, 'Physics'),
(103, 3, 'Chemistry'),
(104, 1, 'English'),
(105, 5, 'Biology'),
(106, 7, 'History'),
(107, 10, 'Math');

select * from student;
select * from Enrollment;

-- 1.student who are enrolled in any course-

select student.studentid,student.studentname,
enrollment.coursename from student join enrollment
where student.studentid=enrollment.studentid;

-- 2.all students 

select student.studentid,student.studentname,
enrollment.coursename from student left join enrollment
on student.studentid=enrollment.studentid;

-- 3.student enrolled in atleast one course

select student.studentid,student.studentname,
enrollment.coursename from student inner join enrollment
on student.studentid=enrollment.studentid;

-- 4. find student who are not enrolled in any course

select student.studentid,student.studentname,
enrollment.enrollmentid from student left join enrollment
on student.studentid=enrollment.studentid where enrollmentid is null;

-- 5. show the all student name and total no. of course enrolled

select student.studentid,count(enrollment.enrollmentid) from student left join enrollment
on student.studentid=enrollment.studentid
group by student.studentid;

select student.studentname,count(enrollment.enrollmentid) from student left join enrollment
on student.studentid=enrollment.studentid
group by student.studentname;

-- group by course

select enrollment.coursename,count(student.studentid),count(enrollment.coursename)
from student inner join enrollment
on student.studentid=enrollment.studentid
group by enrollment.coursename;
