/* This query identifies the best lap time recorded for each Grand Prix, ensuring accuracy by only considering valid laps.*/

/* SELECT
    EventName as `GP Name`,
    MIN(LapTime) AS `Best Lap Time`
FROM
    laps
WHERE
    LapTime IS NOT NULL
GROUP BY
    EventName
ORDER BY
    MIN(LapTime) ASC
INTO OUTFILE 'c:\\wamp64\\tmp\\best_lap_times_per_gp.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'; */



SELECT EventName as `GP Name`, MIN(LapTime) AS `Best Lap Time`
FROM laps_temp_updated
WHERE LapTime IS NOT NULL
GROUP BY EventName
ORDER BY MIN(LapTime) ASC;
