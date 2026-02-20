create database college;

use college;

create table student(
roll_no int primary key,
f_name varchar(50) not null,
l_name varchar(50) ,
s_email varchar(70) default "xyz@gmail.com",
s_age int ,
s_mob bigint unique,
sub_1 int,
sub_2 int,
sub_3 int);


insert into student values(
1, 'Aman', 'Sharma', 'aman.sharma@gmail.com', 20, 9876543210, 85, 78, 90),
(2, 'Priya', 'Patel', 'priya.patel@gmail.com', 19, 9123456780, 88, 92, 81),
(3, 'Rahul', 'Verma', 'rahul.verma@gmail.com', 21, 9988776655, 75, 69, 80),
(4, 'Sneha', 'Iyer', 'sneha.iyer@gmail.com', 20, 9090909090, 91, 89, 95),
(5, 'Arjun', 'Mehta', 'arjun.mehta@gmail.com', 22, 9876501234, 67, 74, 70),
(6, 'Kavya', 'Rao', 'kavya.rao@gmail.com', 19, 9012345678, 93, 88, 84),
(7, 'Rohit', 'Singh', 'rohit.singh@gmail.com', 21, 9765432109, 72, 65, 78),
(8, 'Neha', 'Gupta', 'neha.gupta@gmail.com', 20, 9345678901, 86, 90, 89),
(9, 'Vikas', 'Yadav', 'vikas.yadav@gmail.com', 23, 9876012345, 60, 70, 68),
(10, 'Anjali', 'Desai', 'anjali.desai@gmail.com', 18, 9456123789, 95, 94, 96);

select * from student;



drop table student;


-- add column

alter table student
add column s_total int;

-- modify f_name datatype varchar 80
alter table student
modify column f_name varchar(80);

-- rename column name roll_no to s_rollno

alter table student
rename column roll_no to s_rollno;

-- delete column s_mob
alter table student
drop column s_mob;

-- change table name 
rename table student to student_info;

-- update one as chavan whose roll no is 106
select * from student_info;

update student_info
set f_name='chavan'
where s_rollno =1;

select * from student_info;
-- update sub1 sub3 as 25,40 respec

update student_info
set sub_1 =25 and sub_3=40
where s_rollno=2;

-- delete record 
delete from student_info
where s_rollno=6;

-- add city column in studnet table with 