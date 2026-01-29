

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

select os as 'operating_system',battery_capacity as 'MAH' FROM PHONE;

-- PPI SQRT FORMULA

-- Select model,round(sqrt(resolution_width*resolution_width+resolution_ aheight*resolution_height))  as 'ppi' from phone



select * from phone;

select model ,
sqrt(resolution_width*resolution_width+
resolution_height*resolution_height)
/screen_size as 'ppi'
 from phone;


SELECT
  model,
  sqrt(
    resolution_width * resolution_width +
    resolution_height * resolution_height
  ) / screen_size AS 'ppi'
FROM phone;


-- RATING


SELECT MODEL,RATING/10 FROM PHONE;

-- distinct
select distinct(brand_name) as 'brand_name' from phone;


-- distinct 
select distinct(processor_brand) as 'processor' from phone;


select distinct(os) as 'operating' from phone;

-- combination of both

select distinct brand_name,processor_brand from phone;


-- filter row using where clause 

-- find all samsung phone 

select * from phone 
where brand_name ="samsung";

-- find all phone with price greather than 50000

select brand_name,model,price,rating,refresh_rate,screen_size from phone 
where price >50000;


-- find all phone price range between 10000 and 20000

select brand_name,model,price from phone
where price between 10000 and 20000;


-- find all phone where rating >80 and price <25000

select model,price,rating from phone
where rating >80 and price<25000 ;



-- find all samsung phone with ram greather than 8 gb

select * from phone
where brand_name='samsung' and ram_capacity>8;

-- find all phone with samsung and snapdragon processor
select * from phone;

select brand_name,model,price,processor_brand from phone
where processor_brand='snapdragon' and brand_name='samsung';

-- find all phone with apple and bionic processor

select brand_name,price,processor_brand from phone  
where processor_brand='bionic' and brand_name='apple';


-- find all brand name who sell phone >50000

select distinct(brand_name) from phone
where price>50000;


-- in and not in 

select * from phone
where processor_brand='snapdragon' or processor_brand='dimensity' or processor_brand='exynos';

-- insted


select * from phone
where processor_brand  in ('snapdragon','dimensity','bionic');

select * from phone
where processor_brand not  in ('snapdragon','dimensity','bionic');

-- update  

select * from phone
where processor_brand='mediatek'; 


-- update 
update session33.phone
set processor_brand='bionic_apple'
where processor_brand='bionic';

select * from phone where processor_brand='bionic_apple';

update session33.phone
set processor_brand='bionic'
where processor_brand='bionic_apple';


select * from phone where processor_brand='bionic';

select distinct(brand_name) from phone;

-- update sharp 
update session33.phone
set brand_name = 'new_brand'
where brand_name='sharp';

select * from phone where brand_name ='new_brand';


show tables;



update session33.users
set email='pop@123gmail.com',password='p1324654'
where name = 'pop';

update session33.users
set email='tom@123',password='125554'
where name='tom';



select * from phone
where price>200000;

-- delete this data

delete from phone
where price>200000;

select * from phone where
price >150000;

delete from phone
where primary_camera_rear>125;

select brand_name ,primary_camera_rear from phone where primary_camera_rear>100;


-- aggregation function 

-- find the costlier samsung  mobile
select max(price) from session33.phone
where brand_name='samsung';



select * from phone where price=110999 and brand_name='samsung';

-- average rating

select avg(rating) from phone where brand_name='apple';

select avg(price) from phone where brand_name='samsung';

select sum(price) from session33.phone;

select sum(price) from phone
where brand_name='apple';

select sum(price) from phone
where brand_name='samsung';

-- find  no of oneplus phones

select count(*) from phone
where brand_name='oneplus';


select count(brand_name) from phone
where brand_name='apple';

-- find no of unique brand in dataset
select count(distinct(brand_name)) from phone;


select count(distinct(processor_brand)) from phone; 

select std(screen_size) from phone; 

select variance(screen_size) from phone;


-- scalar function in sql 
select  abs(price - 50000) as 'price2' from phone;


select round(processor_speed) from phone;

-- ceil 
select ceil(screen_size) from phone;

-- floor 

select floor(screen_size) from phone;

-- ceil 
select ceil(processor_speed) from phone;


-- practise 
-- find the average battery capacity and the average primary rear camera resolution for all smartphone with alter
-- price greather than or equal to 100000

select avg(battery_capacity), avg(primary_camera_rear) from phone
where price >=100000;

-- find the No of 5g enable capacity 
SELECT COUNT(*) 
FROM phone
WHERE has_5g = 'TRUE';



-- 

select avg(internal_memory) from phone
where refresh_rate>120 and primary_camera_front>=20;


-- Create a phone table where:
-- price must always be greater than 0
-- rating must be between 0 and 5
-- model_name cannot be null

create table if not exists phone2(
price int check(price>0),
rating decimal check(rating between 0 and  5),
model_name varchar(255) not null);

desc phone2;

alter table phone2
add column discount_price int,
add constraint check_price
check (discount_price<price);
 
 
 desc phone2;
 
 -- decimal rating column to allow decimal values
 
 alter table phone2
modify rating decimal(8,2);




-- add new column lauch year

alter table phone2
add column lauch_year int;


-- rename the lauch_year to Year_of_lauch 

alter table phone2 rename column lauch_year to Year_of_lauch;



desc phone2;

-- add not null constrainst to brand_name
alter table phone
modify column brand_name varchar(255) not null;

-- alter table index primary key 

-- Create a PRIMARY KEY on a column phone_id.


select * from phone;

alter table phone2
add column index_ int not null auto_increment;


alter table phone2
drop column index_;

desc phone2;

select * from phone;

-- modify the battery capacity to 2000 to 7000 mah

alter table phone
modify column battery_capacity int 
check (battery_capacity  between 2000 and 5000);



select * from users;

alter table users
add column age int check(age>18);


-- age value between 19-22 only

alter table users
modify column age int check( age between 19 and 22);

desc users;

insert into users values(10,"l","l@1","ll",22);

select * from users;





