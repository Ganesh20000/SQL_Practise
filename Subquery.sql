

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
where votes>25000
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
