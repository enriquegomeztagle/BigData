SELECT 
    d.forename AS FirstName, 
    d.surname AS LastName,
    c.name AS RecentTeam, -- Equipo más reciente para cada piloto
    COUNT(DISTINCT ra.year) AS SeasonsCompeted,
    AVG(ds.points) AS AvgPointsPerSeason,
    SUM(ds.points) AS TotalPoints,
    SUM(CASE WHEN r.position = 1 THEN 1 ELSE 0 END) AS Wins,
    COUNT(CASE WHEN r.position <= 3 THEN 1 ELSE NULL END) AS Podiums, -- Total de podios
    MIN(r.positionOrder) AS BestFinish, -- Mejor posición de llegada en una carrera
    SUM(CASE WHEN r.status NOT LIKE 'Finished%' THEN 1 ELSE 0 END) AS Retirements, -- Abandonos (no finalizaciones)
    AVG(r.positionOrder) AS AvgFinishPosition
FROM driver_standings ds
JOIN drivers d ON ds.driverId = d.driverId
JOIN results r ON ds.driverId = r.driverId AND ds.raceId = r.raceId
JOIN races ra ON ra.raceId = r.raceId
JOIN constructors c ON r.constructorId = c.constructorId
WHERE ra.year >= YEAR(CURDATE()) - 5 -- Ajustando a los últimos cinco años como parece ser el intervalo deseado
GROUP BY d.forename, d.surname
HAVING SeasonsCompeted >= 3 -- Asegurando que los pilotos han competido al menos 3 temporadas
ORDER BY AvgPointsPerSeason DESC
LIMIT 9;
