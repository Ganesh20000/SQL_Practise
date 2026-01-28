

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


