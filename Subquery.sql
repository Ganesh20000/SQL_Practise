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


