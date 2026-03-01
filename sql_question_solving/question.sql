use hospitaldb;



create table patients(
    patient_id int,
    first_name varchar(255),
    last_name varchar(255),
    gender CHAR(1),
    birth_date date,
    city varchar(255),
    province_id char (2),
    allergies varchar(255),
    height int,
    weight int
);

create table admissions(
    patient_id int,
    admission_date date,
    discharge_date date,
    diagnosis varchar(255),
    attending_doctor_id int
);

INSERT INTO admissions (patient_id, admission_date, discharge_date, diagnosis, attending_doctor_id)
VALUES
(1, '2025-01-10', '2025-01-15', 'Dementia', 101),
(2, '2025-02-05', '2025-02-12', 'Diabetes', 102),
(3, '2025-03-01', '2025-03-07', 'Hypertension', 103),
(4, '2025-03-15', '2025-03-20', 'Asthma', 104),
(5, '2025-04-02', '2025-04-09', 'Dementia', 105),
(6, '2025-04-18', '2025-04-25', 'Arthritis', 106),
(7, '2025-05-01', '2025-05-06', 'Migraine', 107),
(8, '2025-05-10', '2025-05-15', 'Cancer', 108),
(9, '2025-06-01', '2025-06-08', 'Tuberculosis', 109),
(10, '2025-06-12', '2025-06-18', 'Dementia', 110),
(11, '2025-07-01', '2025-07-05', 'Stroke', 111),
(12, '2025-07-15', '2025-07-22', 'Heart Disease', 112),
(13, '2025-08-01', '2025-08-07', 'Kidney Failure', 113),
(14, '2025-08-10', '2025-08-15', 'Dementia', 114),
(15, '2025-09-01', '2025-09-06', 'Epilepsy', 115),
(16, '2025-09-12', '2025-09-18', 'Pneumonia', 116),
(17, '2025-10-01', '2025-10-07', 'COVID-19', 117),
(18, '2025-10-15', '2025-10-20', 'Dementia', 118),
(19, '2025-11-01', '2025-11-06', 'Malaria', 119),
(20, '2025-11-12', '2025-11-18', 'Dementia', 120);

INSERT INTO Patients (patient_id, first_name, last_name, gender, birth_date, city, province_id, allergies, height, weight)
VALUES
(1, 'Amit', 'Sharma', 'M', '1990-05-12', 'Mumbai', 'MH', 'Peanuts', 175, 72),
(2, 'Priya', 'Patel', 'F', '1988-11-23', 'Ahmedabad', 'GJ', 'None', 162, 58),
(3, 'Rahul', 'Verma', 'M', '1995-07-04', 'Delhi', 'DL', 'Dust', 180, 80),
(4, 'priya', 'Iyer', 'F', '1992-03-15', 'Chennai', 'TN', 'Penicillin', 158, 55),
(5, 'Karan', 'Singh', 'M', '1985-09-30', 'Jaipur', 'RJ', 'Shellfish', 170, 68),
(6, 'Meera', 'Joshi', 'F', '1998-01-20', 'Pune', 'MH', 'None', 165, 60),
(7, 'Arjun', 'Kapoor', 'M', '1993-06-18', 'Lucknow', 'UP', 'Pollen', 178, 75),
(8, 'amit', 'Desai', 'F', '1991-12-02', 'Surat', 'GJ', 'None', 160, 52),
(9, 'Vikram', 'Rao', 'M', '1987-08-25', 'Hyderabad', 'TS', 'Latex', 172, 70),
(10, 'Anjali', 'Nair', 'F', '1996-04-10', 'Kochi', 'KL', 'None', 164, 57),
(11, 'Siddharth', 'Gupta', 'M', '1989-02-14', 'Bhopal', 'MP', 'Milk', 176, 74),
(12, 'Ritika', 'Mehta', 'F', '1994-10-05', 'Nagpur', 'MH', 'None', 161, 56),
(13, 'vikram', 'Chauhan', 'M', '1986-07-22', 'Kanpur', 'UP', 'Eggs', 173, 69),
(14, 'Pooja', 'Reddy', 'F', '1997-09-11', 'Visakhapatnam', 'AP', 'None', 159, 54),
(15, 'rohan', 'Yadav', 'M', '1992-12-19', 'Patna', 'BR', 'Dust', 177, 73),
(16, 'Shalini', 'Bose', 'F', '1990-08-08', 'Kolkata', 'WB', 'None', 163, 59),
(17, 'Rohan', 'Malhotra', 'M', '1993-05-27', 'Chandigarh', 'CH', 'Peanuts', 174, 71),
(18, 'swati', 'Thakur', 'F', '1988-01-16', 'Shimla', 'HP', 'None', 160, 53),
(19, 'Nikhil', 'Agarwal', 'M', '1995-11-09', 'Indore', 'MP', 'Penicillin', 179, 76),
(20, 'Swati', 'Kulkarni', 'F', '1991-06-21', 'Nashik', 'MH', 'None', 162, 55);

select * from patients;
drop table patients;

-- easy one question answer

-- Show the first_name, last_name, and height of the patient with the greatest height.

select first_name,last_name, max(height) from patients
group by first_name,last_name
order by max(height) desc limit 1;

-- editor one answer
select first_Name,last_name , max(height) from patients;

-- Show all columns for patients who have one of the following patient_ids: 1,45,534,879,1000

select * from patients
where patient_id in (1,5,4,8,9,6);


-- Show unique first names from the patients table which only occurs once in the list.

-- For example, if two or more people are named 'John' in the first_name column then don't include their name in the output list. 
-- If only 1 person is named 'Leo' then include them in the output.

select first_name from patients
where first_name in (
    select first_name
    from patients
    GROUP BY first_name
    having count(*)=1
);

select DATE_ADD(birth_date, 1,year) from patients;
SELECT DATE_ADD(birth_date, INTERVAL 1 day) AS new_birth_date
FROM patients;

-- 
-- Show patient_id and first_name from patients where their first_name start and ends with 's' and is at least 6 characters long.

select * from patients
where first_name like 's%'
and length(first_name) >=6;


select * from admissions;

-- Show patient_id, first_name, last_name from patients whos diagnosis is 'Dementia'.

select p.patient_id,p.first_name,p.last_name,a.diagnosis from patients p
join admissions a
on p.patient_id=a.patient_id
where diagnosis='Dementia';



-- conginzent solving;
select account_id , avg(balance) from account
group by account_id
having avg(balance)>50000;


select c.first_name,c.last_name,a.account from customer c
join account a
on a.customer_id=c.customer_id
where a.balance>=50000
order by c.first_name asc;