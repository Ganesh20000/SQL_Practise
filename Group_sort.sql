
use session33;
select * from phone;


-- top 5 samsung phone with max screen size and 
select brand_name,screen_size from phone
where brand_name='samsung'
order by screen_size desc limit 5;

-- add no of total camera then sort them

select  model,num_front_cameras+num_rear_cameras as 'total_camera' from phone
order by total_camera desc limit 5;


-- ppi sort 


select model,brand_name, sqrt(resolution_height*resolution_height+resolution_width*resolution_width)/screen_size from phone;

select model,round(sqrt(resolution_width*resolution_width+resolution_height*resolution_height)/screen_size) as 'ppi' from phone
order by ppi desc;


-- find the phone with second largest battery capacity
select * from phone
order by battery_capacity desc limit 1,1;


select * from phone
order by battery_capacity asc limit 0,1;


-- find the name and rating of the worst rated apple 

select model,rating from phone
where brand_name='apple'
order by rating asc limit 0,1;



select min(rating) from phone
where brand_name='apple';


-- sort phone alphabetically and the basic of rating in desc order

select * from phone
order by brand_name asc , price asc;

-- group by 

select brand_name, count(brand_name)
from phone
group by brand_name
order by count(brand_name) desc limit 0 ,5;

show tables;

select * from ipl_ball_by_ball_2008_2022;

SELECT BRAND_NAME,COUNT(*) AS 'TOTAL',
ROUND(AVG(PRICE),2) AS 'AVERAGE_PRICE',
Max(RATING) AS 'MAX_RATING',
ROUND(AVG(SCREEN_SIZE),2) AS 'AVG_SCREEN_SIZE'
 FROM PHONE
group by BRAND_NAME 
ORDER BY TOTAL DESC LIMIT 0,5;


-- group smartphone by whether they have an nfc and get avg price and rating
SELECT BRAND_NAME ,COUNT(*) AS 'COUNT_NFC' FROM PHONE
WHERE HAS_NFC='TRUE'
GROUP BY BRAND_NAME
ORDER BY COUNT_NFC DESC LIMIT 0,5;

SELECT BRAND_NAME, ROUND(AVG(PRICE),2) ,ROUND(AVG(RATING)) FROM PHONE
WHERE HAS_NFC='TRUE'
GROUP BY BRAND_NAME;


-- SIR SOLUTION IS THIS
SELECT HAS_NFC, ROUND(AVG(PRICE),2) ,ROUND(AVG(RATING)) FROM PHONE
-- WHERE HAS_NFC='T-- RUE'
GROUP BY HAS_NFC;

SELECT HAS_5G, COUNT(*), ROUND(AVG(PRICE),2), ROUND(AVG(RATING)) FROM phone
GROUP BY has_5g;

SELECT COUNT(FAST_CHARGING_AVAILABLE), AVG(PRICE), ROUND(AVG(RATING)) FROM PHONE
GROUP BY FAST_CHARGING_AVAILABLE;

-- GROUP SMARTPHONE BY EXTENDED MEMORY AVAILABLE AND GET AVERAGE PRICE

SELECT COUNT(EXTENDED_MEMORY_AVAILABLE) ,AVG(PRICE) FROM PHONE
GROUP BY EXTENDED_MEMORY_AVAILABLE;


-- GROUP SMARTPHONE BY THE BRAND AND PROCESSERGET  THE COUNT OF MODEL AND AVERAGE PRIMARY CAMERA RESOLUTIN 	 REAR

SELECT * FROM PHONE;
SELECT BRAND_NAME,PROCESSOR_BRAND,COUNT(*),round(AVG(PRIMARY_CAMERA_REAR),2) FROM PHONE
GROUP BY BRAND_NAME,PROCESSOR_BRAND;


-- find top 5 most costly brand


SELECT BRAND_NAME ,AVG(PRICE) FROM PHONE
GROUP BY BRAND_NAME
ORDER BY AVG(PRICE) DESC LIMIT 0,5;
-- WHICH BRAND MAKE SMALLEST SMART PHONE


SELECT BRAND_NAME ,ROUND(AVG(SCREEN_SIZE),2) AS 'SMALLEST' FROM PHONE
GROUP BY BRAND_NAME
ORDER BY SMALLEST ASC LIMIT 0,5;


-- avg price of 5g phone
SELECT BRAND_NAME, AVG(PRICE) FROM PHONE
WHERE HAS_5G='true'
GROUP BY BRAND_NAME
ORDER BY AVG(PRICE) ASC LIMIT 0,5;

SELECT * FROM PHONE;

-- group smartphone by brand and find the brand with the highest number of model have 
-- both nfc and an ir blaster

SELECT brand_name,count(*) as 'count' from phone
where has_nfc='true' and has_ir_blaster='true'
group by brand_name
order by count  desc limit 0,2;

-- find all samsung phone 5g enable smartphone and find the avg price foe nfc and not nfc

select has_nfc, avg(price) from phone
where brand_name='samsung' and has_5g='true'
group by has_nfc;

-- find the costlist phone
select brand_name,price from phone
order by price desc limit 1;


-- find the average price of smartphone which have more than  20 phones

select brand_name,count(*), avg(price)
from phone
group by brand_name
having count(*) >20
order by avg(price) desc;


-- find the avg rating of smartphone brand which have more than 20 phne
select brand_name ,avg(rating),count(*) from phone
group by brand_name
having count(*) >20;



-- find the 

select brand_name, avg(ram_capacity) from phone
where refresh_rate>90 and fast_charging_available=1
group by brand_name;

select brand_name,avg(ram_capacity) ,count(*) from phone
where refresh_rate>90 and fast_charging_available=1
group by brand_name
having count(*)>10
order by avg(ram_capacity) desc limit 0,3;


-- find the avg price phone brand with rating >70 and num phone more than 10 amoung all 5g enable phone

select  brand_name,avg(price)  from phone
where has_5g='True'
group by brand_name
having avg(rating)>70 and count(*) >10;

-- pratice

-- find the top  5 batsman in ipl

select * from ipl;

select batter, sum(total_run) from ipl
group by batter
order by sum(total_run) desc limit 0,5;


-- find second highest 6 hitter in ipl

select batter ,count(* ) from ipl
where batsman_run=6
group by batter
order by count(*) desc limit 1,1;


-- not possible beacuse incomplete data 
-- find virat kholi performance against all ipl teams
select * from ipl;

select batter,ID, sum(batsman_run) from ipl
where batter  in ('V Kohli')
group by batter,ID;

select * from ipl;

select batter, sum(batsman_run) from ipl
group by batter
order by sum(batsman_run) desc;


select * from ipl
where batter='V kohli';

-- find top 10 batsman with centuries in ipl 

select batter,ID,sum(batsman_run) ,count(*) from ipl
group by batter,ID
HAVING  SUM(batsman_run)>100
ORDER BY SUM(batsman_run) DESC;   


-- find the top 5 batsman with high strike rate who played a min 1000 balls 

select * from ipl;
-- top 5 BATSMAN With highest strike rate who played min 1000
select batter, sum(batsman_run)/count(batsman_run)*100 as 'strike_rate' from ipl
group by batter
having count(ballnumber)>1000
order by strike_rate desc limit 5;


select batter, 
       (sum(batsman_run) * 100.0 / count(*)) as strike_rate
from ipl
group by batter
having count(batsman_run) >1000
order by strike_rate desc
limit 5;


-- practise question 

-- Average Price by Brand
-- Find the average price of smartphones for each brand, 
-- and display only those brands whose average price is greater than ₹30,000.


select brand_name ,round(avg(price),2) from phone
group by brand_name
having avg(price) >30000
order by avg(price) desc ;


-- Count of 5G Models per Brand
-- Group smartphones by brand and count how many models support 5G. Show only brands with more than 5 models.
select * from phone;
select brand_name,count(*) from phone
where has_5g='true'
group by brand_name
having count(*) >5
order by count(*) desc;

-- Top Processor Brand by Average Rating
-- Group by processor_brand and calculate the average rating. Return the processor brand with the highest average rating.

select processor_brand, round(avg(rating),2) from phone
group by processor_brand
order by avg(rating) desc ;



create table employee(
emp_id int primary key,
emp_name varchar(255),
department varchar(255),
salary int default '25000');

desc employee;


-- Write a query to find total runs scored by each batting team across all 
-- seasons and sort the result in descending order of runs.

select batter,sum(batsman_run) from ipl
group by batter
order by sum(batsman_run) desc limit 0,5;

SELECT batting_team,
       SUM(total_runs) AS total_runs
FROM ipl_ball_by_ball
GROUP BY batting_team
ORDER BY total_runs DESC;

SHOW COLUMNS FROM IPL;
