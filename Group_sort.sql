-- Grouping and sorting

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

select * from phone;    		
