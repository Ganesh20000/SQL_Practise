

use subquery;


show tables;



select * from users
where email like 'a%';



drop table branch;

show tables;

-- find max score movies
use subquery;

select * from movies
where score = (select max(score) from movies);


-- find the movie with highest profit 
select * from movies
where gross-budget = (select max(gross-budget) from movies);



select * from movies ;
use subquery

-- find  how many movies have a rating>the avg of all the movies 

use subquery;
select * from movies
where score > (select avg(score) as 'avg' from movies  ) ;

-- find  how many movies have a rating>the avg of all the movies find the count of above average movies

select count(*) from movies
where score >(select avg(score) from movies)

-- find the highest rated movies of 2000
select * from movies 
where year=2000 and score =(select max(score) from movies where year=2000 );

-- this is right upper one is wrong change it 
select * from movies
where year=2000 and score =(select max(score ) from movies where year=2000);

select * from movies
where  year=2000 and score=(select max(score) from movies where year=2000)


-- 
use subquery;


select * from movies 
where score > ( select avg(score ) from movies)

-- find the higest rated movie amoung all the  movies whose number of votes are > avg dataset avg votes

select max(score) from movies 
where votes >(select avg(votes) from movies)

select * from movies
where score ;


-- find the higest rated movie amoung all the  movies whose number of votes are > avg dataset avg votes

select * from movies
where score =(select max(score) from  movies 
where votes> ( select avg(votes) from movies))



use subquery;


-- find the highest rated movie that has higher votes than > avg votes 

show DATABASES;
select * from movies 
where score = (select max(score) from movies
where votes >(select avg(votes) from movies))




use subquery;

show TABLES;

select * from delivery_partner;

select * from orders O
join users u1
on u1.user_id=o.user_id;


use subquery;
select * from users
where user_id not in (select DISTINCT(user_id) from orders);



-- select 

use subquery;

select * from users;

show tables;

select * from users
where user_id not in (select DISTINCT(user_id) from orders)


-- find the top 3 director in term of total gross incomme


select * from movies
where director in (select director  from movies
GROUP BY director
order by sum(gross) desc limit 0,3)


with top_director as (select director ,sum(gross) as 'gross_' from movies
GROUP BY director
order by gross_ desc limit 3)


select * from top_director;x
select director  from movies
GROUP BY director
order by sum(gross) desc limit 0,3;

-- find the movies that made by top 3 director in term of gross income 

with directors as (select director from movies 
group by director
order by sum(gross) desc
limit 3)

select * from movies
where director in (select * from directors);


USE SUBQUERY;



WITH TOP_DIRECTOR AS (
    SELECT DIRECTOR 
    FROM MOVIES 
    GROUP BY DIRECTOR
    ORDER BY SUM(GROSS) DESC
    LIMIT 3
) 

SELECT * FROM MOVIES 
WHERE DIRECTOR IN (SELECT * FROM TOP_DIRECTOR);

show tables;


-- find all movies of those actors whose filmography avg rating >8.5(take 25000 votes as cutoff) 

-- normal way first 
select * from movies 
where star in ( select star  from movies
where votes >25000
group by star
having avg(score) >8.5 );


-- with cte same answer 

with top_actors as (
select star from movies
where votes >25000
group by star
having avg(score) >8.5)

select * from movies
where star in ( select * from top_actors);


-- table subqery

use subquery;


-- find most profitable movie of each year

select year , max(gross-budget) from movies
group by year;


select * from movies
where (year ,gross-budget) in (
select year , max(gross-budget) from movies
group by year);


-- find the highest rated movie of each genre votes cutoff of 25000
select genre,avg(score) from movies
where votes>25000
group by genre;


select * from movies
where (genre,score) in (select genre,max(score) from movies
where votes>25000
group by genre);

with genre_rating as (select genre,max(score) from movies
where votes>2d5000
group by genre)

select * from movies
where (genre,score) in (select * from genre_rating) and votes >25000;


with table3 as (select star,director,  max(gross) from movies
group by star,director
order by sum(gross) desc )

select * from movies
where (director,star,gross) in (select * from table3);

-- correlated sub query;

-- FIND THE MOVIES THAT HAVE HIGHER RATING THAN AVG RATING OF MOVIES IN SAME GENRE 

SELECT * FROM MOVIES M1
WHERE SCORE > (SELECT AVG(SCORE) FROM MOVIES M2 WHERE M2.GENRE=M1.GENRE); 



show tables;

use subquery;
select * from employee;



select * from employee;




alter table employee add column salary int;
-- Step 1: Add a new column
ALTER TABLE employees ADD salary INT;

-- Step 2: Fill it with random values (example: between 30,000 and 100,000)
UPDATE employee
SET salary = FLOOR(RAND() * (100000 - 30000 + 1)) + 30000;


-- find the emp who is earing more salary than the	average salary earned by employee of same designation 

select * from employee e1
where e1.salary >= (select avg(salary) from employee e where e1.education=e.education);

select * from employee e1
where salary >= (select avg(salary) from employee e where e1.city=e.city);


-- chatgpt answer to make fast execute 
SELECT e1.*
FROM employee e1
JOIN (
    SELECT city, AVG(salary) AS avg_salary
    FROM employee
    GROUP BY city
) e2
ON e1.city = e2.city
WHERE e1.salary >= e2.avg_salary;

SELECT *
FROM (
    SELECT *,
           AVG(salary) OVER (PARTITION BY city) AS avg_salary
    FROM employee
) t
WHERE salary >= avg_salary;


-- find all the  movies that  have a rating higher the average rating of movies 
-- in the same genre 

select * from movies g1
where score >= (select avg(score) from movies g where g1.genre=g.genre);



-- using join 

select g1.*from movies g1
join(

select genre,avg(score)
from movies
group by genre ) g2
on g1.genre=g2.genre
where g1.genre=g2.genre;


SELECT g1.*
FROM movies g1
JOIN (
    SELECT genre, AVG(score) AS avg_score
    FROM movies
    GROUP BY genre
) g2
ON g1.genre = g2.genre
WHERE g1.score >= g2.avg_score;


-- find favourite food of each customer 
select * from orders o
join order_details o1
on o.order_id=o1.order_id
join food f
on f.f_id=o1.f_id
join users u
on u.user_id=o.user_id;

select * from users;


select  u.name ,f.f_name,count(*) from orders o
join order_details o1
on o.order_id=o1.order_id
join food f
on f.f_id=o1.f_id
join users u
on u.user_id=o.user_id
group by f.f_Name,u.name
order by count(*) desc limit 0,8;


with favourite as (select  u.name ,f.f_name,count(*) as 'frequency' from orders o
join order_details o1
on o.order_id=o1.order_id
join food f
on f.f_id=o1.f_id
join users u
on u.user_id=o.user_id
group by f.f_Name,u.name)


s-- elect * from favourite f
-- where frequency = (select max(frequency) );
-- ;

-- select * from customer;


-- select * from movies
-- where year=2000 and score=  (select max(score) from movies where year=2000);


-- with top_movie as (select max(score) from movies
-- where votes > (select avg(votes) from movies) )

-- select * from movies
-- where score = top_movie;
-- select * from movies;

-- select * from users 
-- where user_id not in (select distinct(user_id) from orders);

-- with top_3_director as (
-- select director from movies
-- group by director 
-- order by sum(gross) desc limit 0,3)

-- select * from movies
-- where director in (select * from top_3_director);


-- how to use select in  subquery 
 


select name,genre ,score , round((select avg(score) from movies m1 where m1.genre=m2.genre) ,2)from movies m2;



-- how to use subquery from (FROM) 


SELECT R_NAME,AVG_RATING FROM (SELECT R_ID,AVG(RESTAURANT_RATING) AS 'AVG_RATING'
FROM orders 
group by R_ID) R
JOIN RESTAURANTS o
ON O.R_ID=R.R_ID;

SELECT * FROM RESTAURANTS;


SELECT R_NAME,AVG_RATING 
FROM (SELECT R_ID,AVG(RESTAURANT_RATING) AS 'AVG_RATING' FROM ORDERS 
GROUP BY R_ID ) o
join restaurants r
on r.r_id=o.r_id;


-- find genre having avg score >avg score of all the movies

select genre ,avg(score) from movies group by genre;


select genre,round(avg(score),2) from movies
group by genre
having avg(score) >(select avg(score) from movies);



-- subquery in insert inside 
create table loyal_user(
user_id int,
name varchar(255),
money int);


insert into loyal_user
(user_id,name)
select o.user_id, u.name from orders o
join users u
on o.user_id=u.user_id
group by user_id,u.name
having count(*) >3;


select * from loyal_user;


-- update subquery in this 

update loyal_user
set money =(select user_id,sum(amount) from orders
group by user_id);
select user_id,sum(amount) from orders
group by user_id;


-- delete who never order 

delete from users
where user_id in (select user_id from users
where user_id not in (select distinct(user_id) from orders));

select * from users 
where user_id not in (select distinct(user_id) from orders);


select * from users;

-- thiss is the chatgpt answer 

delete u
FROM users u
LEFT JOIN orders o
  ON u.user_id = o.user_id
WHERE o.user_id IS NULL;
