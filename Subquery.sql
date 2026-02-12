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


use subquery;

select * from mark;


select branch from mark
group by branch;


-- window aggregate function
select  *, avg(mark) over(PARTITION BY branch) from mark;

select *, avg(mark) over(PARTITION BY branch) from marks;


-- rank is window function 

select *, 
avg(mark) over(PARTITION BY branch) as 'avg',
min(mark) over(PARTITION BY branch) as 'min',
max(mark ) over(PARTITION BY branch) as 'max' 
from mark

-- vs code is faster than the mysql 
-- select * from movies m
-- where score> (select avg(score ) from movies m2 where m2.genre=m.genre)

-- find the student who have marks higher than the avg mark of their respective barnch

select * from (
select *,
avg(mark) over(PARTITION BY branch) as 'max_mark'
from mark ) T
where t.mark>t.max_mark;  

select * from (
    select *,
    avg(score ) over(PARTITION BY genre) as 'avg_genre'
    from movies
) m
where m.score>m.avg_genre

select * 
from movies m
where score > (
    select avg(score)
    from movies m2
    where m2.genre = m.genre

);