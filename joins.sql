-- sql joins

select * from ipl;


create table emp(
empId int,
name varchar(255),
salary int

);


create table country(
empID INT,
COUNTRY VARCHAR(255),
City varchar(255)
);


-- drop table emp;
INSERT INTO emp (empId, name, salary) VALUES
(1, 'Rahul Sharma', 55000),
(2, 'Priya Mehta', 72000),
(3, 'Amit Kumar', NULL),          -- salary missing
(4, 'Sneha Patil', 48000),
(5, 'John Doe', 60000),
(6, 'Jane Smith', 85000),
(7, NULL, 50000),                 -- name missing
(8, 'Arjun Singh', 45000),
(9, 'Neha Gupta', 90000),
(10, 'Michael Brown', NULL);      -- salary missing



INSERT INTO emp (empId, name, salary) VALUES
( 11,'Rahul varma', 55000),
( 12,'anjali Mehta', 72000),
( 13,'Amita Kumar', NULL),          -- salary missing
( 12,'Satish Patil', 48000),
( 15,'John doe', 60000),
( null,'uma Smith', 85000),
( 16,NULL, 50000),                 -- name missing
( 17,'Arjun ', 45000),
(18, null, 90000),
(19, 'Michael Brown', NULL);      -- salary missing


INSERT INTO country (empID, COUNTRY, City) VALUES
(12, 'India', 'Mumbai'),
(14, 'India', 'Delhi'),
(18, 'USA', 'New York'),
(11, 'India', NULL),               -- city missing
(null, 'UK', 'London'),
(18, 'Canada', 'Toronto'),
(19, 'India', 'Pune'),
(15, NULL, 'Bangalore'),           -- country missing
(16, 'Germany', 'Berlin'),
(10, 'Australia', NULL),          -- city missing
(18, 'India', 'Chennai'),          -- duplicate empID with different city
(17, 'Nepal', 'Kathmandu');       -- same empID, different country               -- both country and city missing

select* from emp; 



select * from country;


SELECT * FROM COUNTRY O
JOIN EMP E 
WHERE O.EMPID=E.EMPID;




-- CROSS JOIN 

SELECT * FROM EMP E
cross JOIN COUNTRY C
WHERE E.EMPID=C.EMPID;

-- innner
select * from emp e
inner join country c
where e.empid=c.empid;


-- right join
select * from emp e
right join country c
on e.empid=c.empid;

-- left join 
select * from emp e
left join country c
on e.empid=c.empid;


show tables;
use sample;

select * from users1;

select * from users1 
cross join group_;


select * from users1;


select * from membership;


select * from membership m1
inner join users1 t1
on t1.user_id=m1.user_id;

-- left join 
select * from membership m
left join users1 u
on m.user_id=u.user_id;

-- right join

select * from membership m
right join users1 u
on m.user_id=u.user_id;


-- outer join 

-- sql set operation 

-- union only remove duplicate 
select * from person1
union
select *from person2;

-- keep duplicate value 
select * from person1
union all
select * from person2;

-- except
select * from person1
except
select * from person2;

-- intercept

select * from person1
INTERSECT
select * from person2;


-- full join 
select * from users1 u
left join membership m
on u.user_id=m.user_id
union 
select * from users1 u
right join membership m
on u.user_id=m.user_id;



-- self join 

select * from users1 u
join users1 u2
on u.user_id=u2.emergency_contact;

select user_id from users1 intersect select emergency_contact from users1;


select user_id from users intersect select user_id from users1;

create table emplo(
id int,
ename varchar(255),
dept varchar(255),
com_id int);

create table computer(
com_id int ,
make varchar(255),
model varchar(255),
makeyear date);

INSERT INTO emplo (id, ename, dept, com_id) VALUES
(1, 'Alice', 'HR', 101),
(2, 'Bob', 'Finance', 102),
(3, 'Charlie', 'IT', 103),
(4, 'David', 'Marketing', 104),
(5, 'Eva', 'Sales', 105),
(6, 'Frank', 'Operations', 106),
(7, 'Grace', 'IT', 107),
(8, 'Helen', 'Finance', 108),
(9, 'Ian', 'HR', 109),
(10, 'Jack', 'Sales', 110);

INSERT INTO computer (com_id, make, model, makeyear) VALUES
(101, 'Dell', 'Inspiron 15', '2020-01-01'),
(102, 'HP', 'Pavilion x360', '2019-05-01'),
(103, 'Lenovo', 'ThinkPad T14', '2021-03-01'),
(104, 'ASUS', 'MacBook Air', '2022-07-01'),
(105, 'Asus', 'VivoBook S15', '2020-09-01'),
(106, 'HP', 'Aspire 5', '2018-11-01'),
(107, 'HP', 'Surface Laptop 4', '2021-04-01'),
(108, 'HP', 'Galaxy Book Pro', '2022-02-01'),
(109, 'DELL', 'Gram 14', '2020-06-01'),
(110, 'Toshiba', 'Satellite Pro', '2017-08-01');


drop table computer;

-- order of the execution 
select make,count(*) from emplo e right join computer c on e.com_id=e.com_id
where model <> 'hp' group by make HAVING COUNT(*)>=15 order by make DESC;

-- FROM JOIN WHERE GROUP HAVING SELECT DISTINCT ORDER 


-- JOINING ONE AND TWO OR MORE TABLE;
select * from class;

-- inner join 
SELECT * from students s
inner join class c
on s.class_id=c.class_id
and s.enrollment_year=c.class_year;

-- left join 
SELECT * from students s
left join class c
on s.class_id=c.class_id
and s.enrollment_year=c.class_year;


use sample;
-- rightjoin
select * from students s
right join class c
on s.class_id=c.class_id
and s.enrollment_year=c.class_year;


--

-- alter table category rename column category to verticals;
-- alter table category rename column vertical to category;

-- alter table name adding 
alter table category 
add column name varchar(255);


-- dropping the column 
alter table category
drop column name;

select * from category;


-- find the order name and corresponding category name 

SELECT * FROM order_details O
join ORDERS O1
ON O.order_id=O1.order_id
JOIN USERS U
ON U.USER_ID=O1.USER_ID;

-- find order_id and name and city by joining
select o.order_id,u.name,u.city from orders o
join users u
on o.user_id=u.user_id;


-- find order_id product_category 

select o1.order_id,c.category from order_details o1
join category c
on c.category_id=o1.category_id;

-- filter row in joining

select * from orders o1 
join users u
on u.user_id=o1.user_id
where city not in ('pune','mumbai','ahmedabad') and u.name='DIVSHA';



-- find all the order under chairs is the category 

select * from category c
join order_details o
on o.category_id=c.category_id
where c.vertical='Chairs';


select distinct(vertical) from category;

-- find all profitable order in this 

select o.order_id ,sum(o.profit) as 'profit' from order_details o
join orders o1
on o.order_id=o1.order_id
group by o.order_id
having profit >0
order by profit desc;



select o.order_id ,sum(o.profit) as 'profit' from order_details o
join orders o1
on o.order_id=o1.order_id
where profit >0
group by o.order_id
order by profit desc;


-- find the customer who placed max no of order name 

-- select u.name,count(*) from orders o1
-- join users u
-- on u.user_id=o1.user_id
-- group by u.name
-- order by count(*) desc;





-- find higesht order order by user name order id city
select o.order_id,u.name,sum(o.amount),count(*),u.city from order_details o
inner join orders o1
on o.order_id=o1.order_id
inner join users u
on u.user_id=o1.user_id
group by o.order_id,u.name,u.city
having sum(o.amount)>5500
order by sum(o.amount) desc limit 0,5;



-- find the customer who place max no of order 

select u.name ,count(*)  from orders o
join users u
on o.user_id=u.user_id
group by u.name
order by count(*) desc;

-- find which is most profitable category 

select c.category ,sum(profit) as 'profits' from order_details o
join category c
on o.category_id=c.category_id
group by c.category
having  profits >0
order by profits desc;


-- most profitable verticles 

select c.vertical ,sum(profit) as 'profits' from order_details o
join category c
on o.category_id=c.category_id
group by c.vertical
having  profits >0
order by profits desc limit 0,5;


-- find all the category have profit greather than 5000
select u.category ,sum(profit) as 'profit_' from order_details o
join category u
on u.category_id=o.category_id
group by u.category
having profit_ >5000
order by profit_ desc;


-- find the most profitable state 

select u.state,sum(o1.profit) as 'state' from orders o
join order_details o1
on o.order_id=o1.order_id
join users u
on u.user_id=o.user_id
join category c
on o1.category_id=c.category_id
group by u.state
having sum(o1.profit) >2000
order by state desc ;


select * from category;