-- window function sql 	
use subquery;

-- window function in sql are type of analytic function that perform calculation across set of 
-- row that are related to current row called "window" a window across 
show tables;

select branch,avg(mark) from marks
group by branch;

select *, avg(mark) over(partition by branch) from mark;

select branch ,avg(mark)  from mark;

select *, avg(mark) over(partition by branch) from mark;
group by branch;

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

-- rank the branch wise 