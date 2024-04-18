/* This query provides an overview of each driver's performance, identifying the most used tire compound,
   calculating the average lap time in minutes, and determining the completion rate of laps.*/

/*SELECT
    l.Driver,
    (SELECT Compound 
     FROM laps 
     WHERE Driver = l.Driver AND LapTime IS NOT NULL 
     GROUP BY Compound 
     ORDER BY COUNT(*) DESC LIMIT 1) AS MostUsedCompound,
    AVG(
        SUBSTRING_INDEX(SUBSTRING_INDEX(LapTime, ' days ', 1), ' days ', -1) * 1440 +
        SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(LapTime, ' days ', -1), ':', 1), ' ', -1) * 60 +
        SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(LapTime, ':', 2), ':', -1), ' ', 1) +
        SUBSTRING_INDEX(SUBSTRING_INDEX(LapTime, ':', -1), '.', 1) / 60
    ) AS AvgLapTime,
    (COUNT(l.LapTime) / COUNT(*)) * 100 AS CompletionRate
FROM 
    laps l
GROUP BY 
    l.Driver
ORDER BY 
    CompletionRate DESC, AvgLapTime
INTO OUTFILE 'c:\\wamp64\\tmp\\driver_performance_analysis.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
*/

SELECT
    l.Driver,
    (SELECT Compound
     FROM laps
     WHERE Driver = l.Driver AND LapTime IS NOT NULL
     GROUP BY Compound
     ORDER BY COUNT(*) DESC LIMIT 1) AS MostUsedCompound,
    AVG(
        SUBSTRING_INDEX(SUBSTRING_INDEX(LapTime, ' days ', 1), ' days ', -1) * 1440 +
        SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(LapTime, ' days ', -1), ':', 1), ' ', -1) * 60 +
        SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(LapTime, ':', 2), ':', -1), ' ', 1) +
        SUBSTRING_INDEX(SUBSTRING_INDEX(LapTime, ':', -1), '.', 1) / 60
    ) AS AvgLapTime,
    (COUNT(l.LapTime) / COUNT(*)) * 100 AS CompletionRate
FROM
    laps l
GROUP BY
    l.Driver
ORDER BY
    CompletionRate DESC, AvgLapTime;
