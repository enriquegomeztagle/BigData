SELECT 
    r.circuitId,
    c.name AS circuit_name,
    AVG(res.points) AS avg_points
FROM 
    results res
JOIN
    races r ON res.raceId = r.raceId
JOIN 
    circuits c ON r.circuitId = c.circuitId
JOIN 
    constructors con ON res.constructorId = con.constructorId
WHERE
    res.constructorId = 9
GROUP BY 
    r.circuitId, c.name, res.constructorId, con.name
ORDER BY 
    avg_points DESC;