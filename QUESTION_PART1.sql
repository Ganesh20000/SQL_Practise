-- QUESTION AND ANSWER IN THIS 


-- Write a query to find total runs scored by each BattingTeam, sorted by total runs in descending order.
SELECT BATTINGTEAM ,SUM(TOTAL_RUN) FROM IPL
GROUP BY BATTINGTEAM
ORDER by SUM(TOTAL_RUN) DESC;

-- Write a query to display batter-wise total runs, sorted by runs descending.
SELECT BATTER, SUM(TOTAL_RUN) FROM IPL
GROUP BY BATTER
ORDER BY SUM(TOTAL_RUN) DESC;


-- Write a query to find bowler-wise total wickets taken

SELECT BOWLER, count(*)  FROM IPL
where ISWICKETDELIVERY=1
GROUP BY BOWLER
ORDER BY COUNT(*) DESC ;

-- Write a query to find innings-wise total runs.

SELECT INNINGS ,SUM(TOTAL_RUN) FROM IPL
GROUP BY INNINGS;

-- Write a query to find over-wise total runs for each innings.

SELECT INNINGS,OVERS ,SUM(TOTAL_RUN) FROM IPL
GROUP BY INNINGS, OVERS
ORDER BY INNINGS ,OVERS;


-- Write a query to count number of balls faced by each batter.
SELECT * FROM IPL;

SELECT BATTER,COUNT(*) FROM IPL
GROUP BY BATTER
ORDER BY COUNT(*) DESC;


-- OR WE CAN DO THIS ALSO  
SELECT BATTER,COUNT(BALLNUMBER) FROM IPL
GROUP BY BATTER
ORDER BY COUNT(BALLNUMBER) DESC;

-- Write a query to display extra_type-wise total extra runs conceded.
SELECT * FROM IPL;

SELECT EXTRA_TYPE,SUM(EXTRAS_RUN) FROM IPL
GROUP BY EXTRA_TYPE;


-- Write a query to find BattingTeam-wise total number of sixes
-- (batsman_run = 6).

SELECT BATTINGTEAM, SUM(TOTAL_RUN) FROM IPL
WHERE BATSMAN_RUN=6
GROUP BY BATTINGTEAM;


-- Write a query to find BattingTeams whose total runs exceed 30000 , sorted by total runs descending.

SELECT BattingTeam,
       SUM(total_run) AS total_runs
FROM IPL
GROUP BY BATTINGTEAM
HAVING TOTAL_RUNS>30000
ORDER BY TOTAL_RUNS DESC;


-- Write a query to find top 10 batters based on total runs scored.

SELECT BATTER, SUM(TOTAL_RUN) AS 'TOP' FROM IPL
GROUP BY BATTER 
ORDER BY TOP DESC LIMIT 0,10;

-- Write a query to find bowlers who have taken more than 100 wickets.
SELECT bowler,COUNT(*) FROM IPL
WHERE ISWICKETDELIVERY=1
GROUP BY BOWLER
HAVING COUNT(*) >100
ORDER BY COUNT(*) DESC;


-- Write a query to calculate economy rate of each bowler
-- (total_run per over), sorted by lowest economy first.
SELECT * FROM IPL;


SELECT BOWLER, SUM(TOTAL_RUN)*6/COUNT(*) AS 'ECONOMY_RATE' FROM IPL
GROUP BY BOWLER
ORDER BY ECONOMY_RATE;

SELECT bowler,
       ROUND(SUM(total_run) * 6.0 / COUNT(*), 2) AS economy_rate
FROM IPL
GROUP BY bowler
HAVING COUNT(*) >= 300
ORDER BY economy_rate;


-- Write a query to find batters who have scored runs in more than 100 distinct overs.

SELECT distinct(OVERS),BATTER  FROM IPL
GROUP BY BATTER,OVERS;

SELECT * FROM IPL;
-- Write a query to find batters who scored more runs from boundaries than non-boundaries.

SELECT BATTER ,SUM(TOTAL_RUN) FROM IPL
WHERE TOTAL_RUN IN (6,4)
GROUP BY BATTER
ORDER BY SUM(TOTAL_RUN) DESC;

-- Write a query to find BattingTeam-wise total wickets lost, sorted descending.
SELECT BATTINGTEAM , SUM(ISWICKETDELIVERY) FROM IPL
WHERE ISWICKETDELIVERY=1
GROUP BY BATTINGTEAM;


Write a query to find fielders involved in more than 50 dismissals.

Write a query to find kind-wise count of dismissals, sorted by count descending.

Write a query to find batters with average runs per ball greater than 1.2
(minimum 500 balls faced).






-- find second highest salary 

show TABLES;

select DISTINCT(salary) from emp
order by salary desc limit 1,1; 


select DISTINCT(salary) from employees
order by salary desc limit 1,1;


-- find third salary 
select DISTINCT(salary) from employees
order by salary desc limit 2,1


-- show emp name start with a
select * from emp
where name like 'a%' ;


-- show emp name end wih a
select * from emp
where name like "%a";