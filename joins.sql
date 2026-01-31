-- sql joins

select * from ipl;

-- intro to join 


create table table1(
emp_id int,
name varchar(255),
salary int );


create table table2(
emp_id int,
status varchar(255),
age int);


insert into table1 values(1,"john",25000),
(2,"alex",42000),
(3,"lie",56665),
(null,"nia",52222),
(6,"yash",45000),
(7,"illa",8144),
(8,null,null);


insert into table2 values(1,"marrid",45),
(2,null,40),
(3,"marrid",45),
(6,"bachlor",18),
(4,null,25),
(7,"bachlor",28),
(null,"marrid",56);


-- cross join 

select * from table1 t1
cross join  table2 t2
where t1.emp_id=t2.emp_id;

-- inner join

select * from table1 t1
join table2 t2
where t1.emp_id=t2.emp_id;


-- left join 

select * from table1 t1
left join table2 t2
on t1.emp_id=t2.emp_id;

-- right 
select * from table1 t1
right join table2 t2
on t1.emp_id=t2.emp_id;

-- full outer join

show tables;


USE SAMPLE;

-- SELECT * FROM session33.IPL;-- 
SELECT * FROM SAMPLE.USERS;

SELECT* FROM SAMPLE.USERS1
