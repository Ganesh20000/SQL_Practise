-- one 

-- strutural query language is programming language that used to 
-- manipulate data in relation database allow crud operation 

-- sql support this type of Command

-- DDL 
-- DML
-- DCL
-- TCL


-- CONTRAINST IN SQL 

-- SQL CONTRAINTS are rules applied to column or table in relation database 
-- to limit the type of data that can be insert updated and deleted 


-- constraints

-- not null

-- unique 

-- primary key :- is combination of both not null and the unique contraints 

-- auto increment 

-- check 

-- default 

-- foreign key  


--

CREATE TABLE if
 not exists ONS(
Id int not null unique, 
Name varchar(255),
Age INT CHECK (AGE>=18),
City varchar(255)
);

INSERT INTO ONS (Id, Name, Age, City)
values 
(3,"Orry",18,"lo");

select * from ONS;


DROP TABLE BRANCH;
DROP TABLE STUDENT;

CREATE TABLE IF NOT EXISTS BRANCH (
    BID INT PRIMARY KEY,
    NAME VARCHAR(255),
    HOD VARCHAR(255)
);

CREATE TABLE STUDENT (
    SID INT NOT NULL,
    NAME VARCHAR(255),
    BID INT,
    FOREIGN KEY (BID) REFERENCES BRANCH(BID)
);

INSERT INTO BRANCH 
VALUES ( 10,"CSE","BANSU 2");

Insert into student
values (102,"ganesh",10);


select * from branch;


select * from student;


CREATE TABLE ORDERS(
O_ID INT ,
ORDER_NO INT NOT NULL,
C_ID INT primary KEY);


create table customers(
C_ID INT,
foreign key (C_ID) references ORDERS(C_ID),
NAME VARCHAR(255),
ADDRESS VARCHAR(255));


INSERT INTO  ORDERS VALUES (1,101,1);
INSERT INTO CUSTOMERS 
VALUES (2,"D","E");

-- AUTO INCREMENTS

CREATE TABLE AUTO_(
ID INT primary KEY auto_increment,
NAME VARCHAR(255));


SELECT * FROM AUTO_;

CREATE TABLE CUSTOMER2(
CID INT primary KEY,
NAME VARCHAR(255),
EMAIL VARCHAR(255));


CREATE TABLE ORDERS2(
ORDER_ID INT primary KEY,
CID INT,
foreign key (CID) references CUSTOMER2(CID),
DATE date );


INSERT INTO CUSTOMER2 
VALUES (1,"K","K@1"),
(2,"J","J@1");


INSERT INTO ORDERS2 VALUES
(204,1,"2025-12-25"),
(206,25,"2022-4-1");


-- ALTER TABLE 

ALTER TABLE ONS ADD column Grade  int not null default 15;

select * from ons;

alter table ons
drop column grade;



-- now start new 