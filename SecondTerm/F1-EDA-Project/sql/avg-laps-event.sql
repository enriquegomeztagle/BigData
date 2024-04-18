/* This query calculates the average number of laps completed for each Grand Prix (GP) event,
ordered by the highest average number of laps.*/

/* LOCAL TESTS
SELECT
    EventName AS `GP Name`,
    AVG(LapNumber) AS `Average Laps`
FROM 
    laps 
GROUP BY 
    EventName 
ORDER BY 
    AVG(LapNumber) DESC
INTO OUTFILE 'c:\\wamp64\\tmp\\average_laps_per_gp.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'; */


SELECT EventName as `GP Name`, AVG(LapNumber) AS `Average Laps`
FROM laps
GROUP BY EventName
ORDER BY AVG(LapNumber) DESC;