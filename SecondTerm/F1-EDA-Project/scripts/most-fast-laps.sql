-- Number of personal bests per driver
SELECT Driver, COUNT(*) AS NumberOfFastestLaps
FROM (
    SELECT Driver, EventName, MIN(LapTime) AS FastestLap
    FROM fastest_laps
    WHERE LapTime IS NOT NULL
    GROUP BY Driver, EventName
) AS DriverFastestLaps
GROUP BY Driver
ORDER BY NumberOfFastestLaps DESC;
