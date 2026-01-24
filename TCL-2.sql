-- TCL

use regex1;

create table actor_cp2 as select actor_id,first_name from sakila.actor
where actor_id between 1 and 5;

select * from actor_cp2;

insert into actor_cp2 values(6,'Tushar');

-- autocommit ==> enable
set @@autocommit=0; -- ==> disable
select @@autocommit; 

insert into actor_cp2 values(7,'testoo');
select * from actor_cp2;
insert into actor_cp2 values(10,'news');
rollback;

commit; -- it close the transaction and make changes permanent

rollback;-- it will not run after commit


set @@autocommit=1; -- ==> enable(sare changes save ho jaenge)

start transaction;
insert into actor_cp2 values(13,'flipkart');
select * from actor_cp2;

-- now if we use any ddl operation ,changes will save automatically
create table xyz(id int);




insert into actor_cp2 values(14,'abc');
insert into actor_cp2 values(15,'cdf');

start transaction;
insert into actor_cp2 values(17,'adhj');
insert into actor_cp2 values(15,'hjjdj');
delete from actor_cp2 where actor_id in (7,9);
rollback;
select * from actor_cp2;

drop table actor_cp2;
create table actor_cp2 as select actor_id,first_name from sakila.actor
where actor_id between 1 and 5;

start transaction;
insert into actor_cp2 values(17,'adhj');
insert into actor_cp2 values(15,'hjjdj');
savepoint db_actor_cp2_svp1; -- it will rollback to specific point
delete from actor_cp2 where actor_id in (3);
rollback to db_actor_cp2_svp1;
select * from actor_cp2;
