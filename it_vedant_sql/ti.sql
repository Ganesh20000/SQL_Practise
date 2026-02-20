select * from titanic;


-- List all passengers who survived.-- 
select  count(*) from titanic
where Survived=1;
 
-- Show names and ages of all female passengers.



-- Find the total number of passengers.

select count(*)
from titanic;

-- Display distinct embarkation points.

select distinct(embark_town) from titanic;

-- Show top 10 passengers who paid the highest fare.

select *  from titanic
order by  fare desc
limit 0,10;



-- Find the average age of passengers by gender.


select avg(age) from titanic
group by sex;



-- Count the number of survivors in each passenger class.
select count(*) from titanic
where Survived=1
group by Pclass;



-- Find passengers who paid above the average fare.
select fare,age,who from titanic
where  fare>  (select avg(fare) from titanic);


-- List the top 5 oldest survivors.


select * from titanic;


select age from titanic
where 


