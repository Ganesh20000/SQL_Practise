
use subquery;
-- find employees whose salary is greater than the average salary of all employees

select * from employee
where salary > (select avg(salary) from employee);


-- Find customers whose age is less than the maximum age of customers.

select * from employee;

select * from employee
where age < (select max(age) from employee);

-- Find movies with rating greater than the overall average rating.
select * from movies
where score > (select avg(score) from movies);


-- Find users who have placed at least one order.

select * from users
where user_id in (select distinct(user_id) from orders);


-- Find products whose price is higher than the minimum price in the products table.

show tables;


-- Find employees working in the same department as ‘Amit’.


select * from customer
where account_type in (select account_type from customer
where first_name like 'a%');



-- Find students who scored more than the highest score in subject ‘Maths’.
use subquery;
select * from student_scores;


select * from student_scores
where maths >= (select avg(maths) from student_scores);


-- Find employees who joined after the earliest joining date. 
select * from employee
where (joiningyear) > (select min(joiningyear) from employee);
