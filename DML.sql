-- dml data manipulation language

-- dml provide easy way to work with existing data whether you want to add update move or delete data 
show tables;


select * from session33.phone
where price;

-- insert keyword

create table users(
user_id int primary key auto_increment,
name varchar(255),
email varchar(255) not null unique,
password varchar(255) not null 

);  


insert into users 
values (null, "pop","pop@1","ppp"),
(null,"tom","tom@1","1254");

select * from users; 

show tables;


desc one;

insert into one (id,name) values (10,"looop");


insert into users (name,password) values ("larry","478");

-- modily email constraints
alter table users
modify email varchar(255) unique;
describe users;



-- select keyword
select model, price,rating from phone where price ;
select model,battery_capacity,os from phone;

-- as keyword

select os as 'operating_system',battery_capacity as 'MAH' FROM PHONE

-- PPI SQ