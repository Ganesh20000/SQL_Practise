-- QUESTION AND ANSWER IN THIS 


-- Write a query to find total runs scored by each BattingTeam, sorted by total runs in descending order.
SELECT BATTINGTEAM ,SUM(TOTAL_RUN) FROM IPL
GROUP BY BATTINGTEAM
ORDER by SUM(TOTAL_RUN) DESC;

-- Write a query to display batter-wise total runs, sorted by runs descending.
SELECT BATTER, SUM(TOTAL_RUN) FROM IPL
GROUP BY BATTER
ORDER BY SUM(TOTAL_RUN) DESC;