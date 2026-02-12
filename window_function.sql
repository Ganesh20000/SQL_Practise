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
use subquery;


-- rank and dense rank and row number
-- i have to rank all branch every branch one student 

select *,
rank() over(ORDER BY mark desc)
from marks;

-- what if branch wise
select *,
rank() over(PARTITION BY branch ORDER BY mark desc),
DENSE_RANK() over(PARTITION BY branch ORDER BY mark desc),
ROW_NUMBER() over()
from mark;

--RANK() assigns the same rank to tied values but skips the next rank(s).  For example, if two rows tie for rank 2, the next distinct value gets rank 4 (skipping 3).
 
--DENSE_RANK() also assigns the same rank to tied values but does not skip ranks, ensuring consecutive numbering.  In the same example, the next distinct value gets rank 3. 

-- row number
--create roll no from branch and mark
select *,
CONCAT(branch,'-',ROW_NUMBER() over(PARTITION BY branch))
from mark;


-- find top most paying customer for each month

select * from orders;
select MONTHNAME(date) AS 'MONTH',user_id,sum(amount) AS 'SUM OF AMOUNT',
RANK() OVER(PARTITION BY MONTHNAME(DATE) ORDER BY SUM(AMOUNT) DESC) AS 'RANK MONTH WISE'

from orders
GROUP BY MONTHNAME(date),user_id;


--
SELECT * FROM (
                SELECT MONTHNAME(DATE) AS 'MONTH',USER_ID ,SUM(AMOUNT) AS 'SUM',
                RANK() OVER(PARTITION BY MONTHNAME(DATE) ORDER BY SUM(AMOUNT) DESC) as 'ranks'
                FROM ORDERS
                GROUP BY MONTHNAME(DATE),USER_ID) T
                where t.ranks<3
                ORDER BY month desc , ranks asc;



-- first value and last value  and nth values 
use subquery;

-- which give wrong value 
select *,
FIRST_VALUE(name) over(ORDER BY mark desc),
LAST_VALUE(name) over(ORDER BY mark asc)
from marks; 

-- frames
select *,
LAST_VALUE(name) over(ORDER BY mark desc rows BETWEEN UNBOUNDED PRECEDING and UNBOUNDED FOLLOWING)
from marks;


Frame Boundaries:
-- UNBOUNDED PRECEDING: Start from the first row of the partition.
-- CURRENT ROW: The row currently being processed.
-- UNBOUNDED FOLLOWING: End at the last row of the partition.
--  N PRECEDING/N FOLLOWING: N rows before/after the current row.

use subquery;
-- nth  value
select *,
NTH_VALUE(name,2) over( PARTITION BY branch ORDER BY mark desc ROWS BETWEEN UNBOUNDED PRECEDING and UNBOUNDED FOLLOWING)
from mark;


-- question on this 

-- find the branch topper


select * from 
(select *,
FIRST_VALUE(name) OVER(PARTITION BY branch order by mark desc) as 'topper_name',
FIRST_VALUE(mark) over(PARTITION BY branch ORDER BY mark desc) as 'topper_mark'
from mark)  t
where t.name=t.topper_name and t.mark=t.topper_mark


-- find the last of each branch wise student

select * from 
    (select *,
            LAST_VALUE(name) over  W as last_name,
            LAST_VALUE(mark) OVER W as last_mark
            from mark
            WINDOW w as (PARTITION BY branch ORDER BY mark desc rows BETWEEN UNBOUNDED PRECEDING and UNBOUNDED FOLLOWING)
            )  t
where t.mark=t.last_mark and t.name=t.last_name;


SELECT *
FROM (
    SELECT *,
           LAST_VALUE(name) OVER w AS last_name,
           LAST_VALUE(mark) OVER w AS last_mark
    FROM mark
    WINDOW w AS (
        PARTITION BY branch 
        ORDER BY mark DESC 
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    )
) t
WHERE t.mark = t.last_mark 
  AND t.name = t.last_name;




UPDATE mark
set mark=5
where name="Rupesh"