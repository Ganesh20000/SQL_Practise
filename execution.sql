
select * from (
    select *,
    avg(score ) over(PARTITION BY genre) as 'avg_genre'
    from movies
) m
where m.score>m.avg_genre;

select * 
from movies m
where score > (
    select avg(score)
    from movies m2
    where m2.genre = m.genre

);