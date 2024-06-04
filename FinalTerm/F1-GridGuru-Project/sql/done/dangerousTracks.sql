CREATE TABLE dangerous_tracks AS
SELECT 
    c.circuitId,
    c.name AS circuit_name,
    c.location,
    c.country,
    COUNT(res.resultId) AS total_incidents
FROM 
    circuits c
JOIN 
    races r ON c.circuitId = r.circuitId
JOIN 
    results res ON r.raceId = res.raceId
JOIN 
    status s ON res.statusId = s.statusId
WHERE 
    s.statusId IN (3, 4)  -- IDs for Accident and Collision
GROUP BY 
    c.circuitId, c.name, c.location, c.country
ORDER BY 
    total_incidents DESC;