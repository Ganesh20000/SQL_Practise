-- with contrainst

use sample;


create table emp2(
id int primary key,
name varchar(255) not null,
age  int check(age>22) not null,
city varchar(255),
branch varchar(255) default "it");

show tables;

create table books(
book_id int primary key,
title varchar(255) not null,
author varchar(255) not null default "unknown",
publication_year year check(publication_year >2000),
price_int int check(price_int>2000)
);



create table orders(
order_id int primary key,
cust_id int unique,
pro_name varchar(255) not null,
qty int check(qty>=1),
country varchar(255) default "india"
);



create table third(
id int primary key,
cust_name varchar(255) not null,
age int check(age>18) default 20);


  select * from emp;
  
  
 show tables;
  
  create table employee(
  emp_id int,
  name varchar(255),
  email varchar(255),
  age int );
  
  
  desc employee;
  
  -- alter table add column
  
  alter table employee
  add column salary int;
  -- after and 
  alter table employee
  add column phone bigint after age;
  
  -- first 
  
  alter table employee
  add column emps int first;
  
  -- 2 column add 
  
  alter table employee
  add column current_adress varchar(255), add premanant_address varchar(255);
  
  -- modify the table 
  
  alter table employee
  modify column email varchar(250) not null;
  
  -- multiple table modify
  
  alter table employee
  modify column email varchar(255),modify age int primary key;
  
  -- alter table rename column
  
  desc employee;
  
  alter table employee
  change email emails varchar(255);
  

  
  -- without change
  
  alter table employee
  rename column emails to email;
  
    -- drop the column
  alter table employee
  drop current_adress ,drop premanant_address;
  
  -- renaming table 
  
  alter table employee rename to emps;
  
  desc emps;
  
  
  