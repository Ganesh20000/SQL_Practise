-- dml


-- insert update delete


use sample;


create table dml(
id int,
name varchar(255),
age int);


desc dml;

-- alter table add column 

alter table dml add column salary int;

-- alter table add multiple column 
alter table dml add column dob date,add education varchar(255);

desc dml;

-- before and first

alter table dml add column surname varchar(255) after name;

-- first 
alter table dml add column emp_ int first ;

desc  dml;

-- modify the table

alter table dml 
modify column age int check(age>19 ), modify column id int primary key ;


-- rename

alter table dml
rename column name to names;

-- drop 
alter table dml
drop column education ,drop column dob;


-- rename table

rename table dml to dml2;


desc dml2;

-- drop emp_
alter table dml2
drop column emp_;

insert into dml2 values(
2,"bob","mick",42,140000);


select * from dml2;

show tables;


create table student(
id int primary key,
first_name varchar(255),
last_name varchar(255),
email varchar(255),
birthdate date,
start_date date);

create table lecturer(
id int primary key,
first_name varchar(128),
last_name varchar(128),
degree varchar(25),
email varchar(288));


create table academic(
id int primary key,
calender_year int,
start_Date date,
end_date date);

desc academic;
create table course_edition(
id int,
lecture_id int,
academic_semester_id int,

foreign key (lecture_id)
references lecturer(id),


foreign key (academic_semester_id)
references academic(id)
);

desc course_edition;


