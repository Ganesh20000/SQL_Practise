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

