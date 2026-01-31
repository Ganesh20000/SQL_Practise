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
SELECT  FROM IPL;