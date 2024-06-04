SELECT 
    r.circuitId,
    c.name AS circuit_name,
    CASE
        WHEN lt.lap <= (SELECT MAX(lap) / 3 FROM lap_times WHERE raceId = lt.raceId) THEN 'Sector 1'
        WHEN lt.lap <= 2 * (SELECT MAX(lap) / 3 FROM lap_times WHERE raceId = lt.raceId) THEN 'Sector 2'
        ELSE 'Sector 3'
    END AS sector,
    COUNT(res.statusId) AS total_accidents
FROM 
    results res
JOIN 
    races r ON res.raceId = r.raceId
JOIN 
    circuits c ON r.circuitId = c.circuitId
JOIN 
    lap_times lt ON res.raceId = lt.raceId AND res.driverId = lt.driverId
JOIN 
    status s ON res.statusId = s.statusId
WHERE 
    s.statusId IN (3, 4)  -- IDs for Accident and Collision
GROUP BY 
    r.circuitId, c.name, sector
ORDER BY 
    total_accidents DESC;