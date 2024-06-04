SELECT 
    q.driverId,
    CONCAT(d.forename, ' ', d.surname) AS driver_name,
    AVG(res.position - q.position) AS avg_position_change
FROM 
    qualifying q
JOIN 
    results res ON q.raceId = res.raceId AND q.driverId = res.driverId
JOIN 
    drivers d ON q.driverId = d.driverId
GROUP BY 
    q.driverId, d.forename, d.surname
ORDER BY 
    avg_position_change DESC;