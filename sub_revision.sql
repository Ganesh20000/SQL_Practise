
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


-- 🟡 MEDIUM LEVEL (Multi-row subqueries, IN, ANY, ALL)

-- Find employees whose salary is greater than ANY salary in department 10.
use subquery;
show tables;


select* from employee
where city ="bangalore" and salary > (select avg(salary) from employee );


-- Find employees whose salary is greater than ALL salaries in department 20.



-- Find departments that have at least one employee.
select * from employee;


-- Find movies whose genre appears more than once.

select * from movies m1
where  (select count(*) from movies m2 where m2.genre=m1.genre) >1;


-- solve this

-- Find employees who earn more than the average salary.

use subquery;
select * from employee
where salary > (select avg(salary) from employee);


-- Find students who scored more than the average marks in Maths.


select * from student_scores
where maths> (select avg(maths) from student_scores);


-- List products whose price is higher than the average price.
select * from orders
where amount >(select avg(amount) from orders);
;

-- Find employees with salary equal to the maximum salary.
select * from employee
where salary = (select max(salary) from employee);

-- Find customers who placed at least one order.

select * from customer
where customer_id in (select distinct(user_id) from orders);


-- Find employees who work in the same department as ‘John’.

select * from customer
where account_type in (select account_type from customer where first_name like 'a%');




-- Find students whose marks are less than the average marks.
select * from mark
where mark < (select avg(mark) from mark);

select avg(mark) from mark;

-- Find employees whose age is greater than the minimum age.
select * from employee
where age>(select min(age) from employee);



-- Display details of employees who earn exactly the average salary.
select * from employee
where salary = (select avg(salary) from employee);

select avg(salary) from employee;
select * from employee;
select salary from employee
where salary = 65090;

update employee
set salary =65090 where age =22;


-- Find movies with rating higher than the overall average rating.

-- Find employees who earn more than the average salary of their city .

select * from employee e1
where salary >(select avg(salary) from employee e2 where e2.city=e1.city);
-- Find departments that have more than 5 employees

select * from emp2
where dept in (select dept from emp2
group by dept
having count(*) >3);




-- Find employees who earn less than the maximum salary.
select * from emp
where salary < (select max(salary) from emp);

-- Find the second highest salary using a subquery.

select salary from emp
order by salary desc limit 2;



select max(salary) from emp
where salary < (select max(salary) from emp );



-- Find students who scored the highest marks in each subject.

select * from marks
where mark < (select max(mark) from marks);
-- Find products that were never sold.
select * from orders;
select * from users;
-- Find customers who never placed an order.
select * from users
where user_id not in (select distinct(user_id) from orders);

insert into users values
(6,"kalu","kalu@1","kallu");

-- Find employees whose salary is between average and maximum salary.
select * from emp
where salary between (select avg(salary) from emp)
			and  	(select max(salary) from emp);

-- Find employees who joined before the average joining year.
use subquery;
-- Find employees who earn more than any employee in department ‘HR’.
select * from emp2
where salary > any (select salary from emp2 where dept = "HR");

-- Find employees who joined before the average joining year.
select * from employee
where joiningyear < (select avg(joiningyear) from employee);



-- hard one 

-- ADVANCED / CORRELATED SUBQUERY QUESTIONS

-- Find employees who earn more than the average salary of their own department (correlated).
select * from emp2 e1
where salary > (select avg(salary) from emp2 e2 where e2.dept=e1.dept);



-- Find the highest-paid employee in each department.

select * from emp2 e1
where salary = (select max(salary) from emp2 e2 where e2.dept=e1.dept);
 -- Find students who scored above average in their own class.

 
 -- find student who scored above average in their science subject
-- select * from student_scores s
-- where science = (select avg(science) from student_scores s2 where  s.science=s2.science);

 
use subquery;


-- Find movies with rating higher than the average rating of their genre.
select * from movies m
where score >(select avg(score) from movies m2 where m2.genre=m.genre) ;


-- Find employees whose salary is greater than all employees in another department.

select * from emp2 e
where salary > (select avg(salary) from emp2 e2 where e2.dept<> e.dept);
select avg(salary) from emp2;
-- Find departments where average salary is greater than company average.

-- Find customers who placed orders worth more than their own average order value.


select * from orders o
where amount > (select avg(amount) from orders o1 where o1.user_id=o.user_id) ;

select avg(amount) from orders ;

desc orders;

-- Find employees who are older than the average age of their department.
select avg(age) from emp2;
select * from emp2 e
where age > (select avg(age) from emp2 e2 where e2.dept=e.dept);


-- Find products that have price higher than average price of their category.

select * from product p
where price > (select avg(price) from product p2 where p2.category_id=p.category_id);

-- Find employees whose salary is greater than at least one employee in every department.

select * from emp2 e
where salary > all (select min(salary) from emp2 e1 where e1.dept=e.dept);
	
-- ANY means:

-- Greater than at least one value from the subquery result.
