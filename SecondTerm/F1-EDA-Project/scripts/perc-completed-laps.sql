-- Percentage of completed laps for each driver
SELECT 
    Driver, 
    SUM(CASE WHEN LapTime IS NOT NULL THEN 1 ELSE 0 END) AS CompletedLaps,
    SUM(CASE WHEN LapTime IS NULL THEN 1 ELSE 0 END) AS IncompleteLaps,
    ROUND(100 * SUM(CASE WHEN LapTime IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*), 2) AS PercentageOfCompletedLaps,
    ROUND(100 * SUM(CASE WHEN LapTime IS NULL THEN 1 ELSE 0 END) / COUNT(*), 2) AS PercentageOfIncompleteLaps
FROM laps
GROUP BY Driver
ORDER BY PercentageOfCompletedLaps DESC;
