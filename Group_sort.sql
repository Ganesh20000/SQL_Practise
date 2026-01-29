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


