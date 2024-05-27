SELECT 
    d.forename AS FirstName, 
    d.surname AS LastName,
    (SELECT c.name 
     FROM constructors c 
     JOIN results r ON c.constructorId = r.constructorId 
     WHERE r.driverId = d.driverId 
     ORDER BY r.raceId DESC LIMIT 1) AS LastTeam,
    COUNT(DISTINCT ra.year) AS SeasonsCompeted,
    AVG(ds.points) AS AvgPointsPerSeason,
    SUM(ds.points) AS TotalPoints,
    SUM(CASE WHEN r.position = 1 THEN 1 ELSE 0 END) AS Wins,
    COUNT(CASE WHEN r.position <= 3 THEN 1 ELSE NULL END) AS Podiums,
    MIN(r.positionOrder) AS BestFinish,
    SUM(CASE WHEN s.status NOT LIKE '%Finished%' AND s.status NOT LIKE '%fin%' THEN 1 ELSE 0 END) AS Retirements,
    AVG(r.positionOrder) AS AvgFinishPosition
FROM driver_standings ds
JOIN drivers d ON ds.driverId = d.driverId
JOIN results r ON ds.driverId = d.driverId
JOIN races ra ON r.raceId = r.raceId
JOIN status s ON r.statusId = s.statusId
WHERE ra.year >= YEAR(CURDATE()) - 6
GROUP BY d.driverId, d.forename, d.surname -- Incluyendo el driverId en el GROUP BY
ORDER BY AvgPointsPerSeason DESC, Wins DESC, Podiums DESC, Retirements ASC, AvgFinishPosition ASC
LIMIT 5;
