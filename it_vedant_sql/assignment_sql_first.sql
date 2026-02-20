-- Write a query to create database with name pizza_sales_analysis.

create database pizza_sales_analysis;


use pizza_sales_analysis;
-- Write a query to see list of all databases.
show databases;

-- Write a query to create following table.

create table order(
id int,
data date);

-- Write a query to add column time with datatype time after date column in above order table.

alter table orders
add column time time ;

-- Write a query to rename the table order to orders.

rename table orders to order2;


--   6. Add primary key constraint to the column id on existing table orders.


alter table order2
modify column id int primary key;

desc order2;



