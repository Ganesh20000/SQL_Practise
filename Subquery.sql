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
