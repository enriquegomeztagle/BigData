-- Best Lap time on each GP
SELECT EventName as 'GP Name', MIN(LapTime) AS 'Best Lap Time' 
FROM laps 
WHERE LapTime IS NOT NULL 
GROUP BY EventName
ORDER BY MIN(LapTime) ASC;
