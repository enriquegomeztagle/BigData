/* This query calculates the percentage of completed and incomplete laps for each driver,
   helping to assess their consistency and reliability during races.*/

/*SELECT
    Driver,
    SUM(CASE WHEN LapTime IS NOT NULL THEN 1 ELSE 0 END) AS CompletedLaps,
    SUM(CASE WHEN LapTime IS NULL THEN 1 ELSE 0 END) AS IncompleteLaps,
    ROUND(100 * SUM(CASE WHEN LapTime IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*), 2) AS PercentageOfCompletedLaps,
    ROUND(100 * SUM(CASE WHEN LapTime IS NULL THEN 1 ELSE 0 END) / COUNT(*), 2) AS PercentageOfIncompleteLaps
FROM laps
GROUP BY Driver
ORDER BY PercentageOfCompletedLaps DESC
INTO OUTFILE 'c:\\wamp64\\tmp\\driver_lap_completion.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
*/

SELECT
    Driver,
    SUM(CASE WHEN LapTime IS NOT NULL THEN 1 ELSE 0 END) AS CompletedLaps,
    SUM(CASE WHEN LapTime IS NULL THEN 1 ELSE 0 END) AS IncompleteLaps,
    ROUND(100 * SUM(CASE WHEN LapTime IS NOT NULL THEN 1 ELSE 0 END) / COUNT(*), 2) AS PercentageOfCompletedLaps,
    ROUND(100 * SUM(CASE WHEN LapTime IS NULL THEN 1 ELSE 0 END) / COUNT(*), 2) AS PercentageOfIncompleteLaps
FROM laps_temp_updated
GROUP BY Driver
ORDER BY PercentageOfCompletedLaps DESC;
