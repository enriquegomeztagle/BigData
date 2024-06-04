USE GridGuru;
SELECT 
    c.name AS constructorName,
    MIN(p.duration) AS minDuration,
    MAX(p.duration) AS maxDuration,
    AVG(p.duration) AS avgDuration,
    SUM(p.duration) AS totalDuration,
    COUNT(p.stop) AS numberOfStops,
    (SUM(p.duration) * 1000) / SUM(l.milliseconds) AS pitStopTimePercentage
FROM 
    pit_stops p
JOIN 
    races r ON p.raceId = r.raceId
JOIN 
    lap_times l ON p.raceId = l.raceId AND p.driverId = l.driverId
JOIN 
    results res ON p.raceId = res.raceId AND p.driverId = res.driverId
JOIN 
    constructors c ON res.constructorId = c.constructorId
GROUP BY 
    c.name
ORDER BY 
    avgDuration ASC, numberOfStops DESC, pitStopTimePercentage ASC;

/*
    This query can be useful to determine the pit stop strategy.
    It calculates the minimum, maximum, average, and total duration of pit stops for each constructor.
    It also calculates the number of stops, and the percentage of time spent in pit stops compared to the
    total race time for each constructor.
    With this information, our team can see how we are positioned in terms of pit stop strategy compared to other teams.
    
*/
