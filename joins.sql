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
