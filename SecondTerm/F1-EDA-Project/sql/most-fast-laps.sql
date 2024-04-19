/* This query calculates the number of personal best lap times achieved by each driver across different events,
   highlighting driver performance and consistency*/

/* SELECT
    Driver,
    COUNT(*) AS NumberOfFastestLaps
FROM (
    SELECT
        Driver,
        EventName,
        MIN(LapTime) AS FastestLap
    FROM
        fastest_laps
    WHERE
        LapTime IS NOT NULL
    GROUP BY
        Driver, EventName
) AS DriverFastestLaps
GROUP BY
    Driver
ORDER BY
    NumberOfFastestLaps DESC
INTO OUTFILE 'c:\\wamp64\\tmp\\number_of_personal_bests_per_driver.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'; */


SELECT Driver, COUNT(*) AS NumberOfFastestLaps
FROM (
    SELECT Driver, EventName, MIN(LapTime) AS FastestLap
    FROM fastest_laps
    WHERE LapTime IS NOT NULL
    GROUP BY Driver, EventName
) AS DriverFastestLaps
GROUP BY Driver
ORDER BY NumberOfFastestLaps DESC;
