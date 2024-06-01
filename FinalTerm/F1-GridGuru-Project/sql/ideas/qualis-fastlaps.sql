SELECT q.raceId, r.name AS raceName, q.driverId, q.position AS qualifyingPosition, rs.positionOrder, rs.fastestLapTime
FROM qualifying q
JOIN races r ON q.raceId = r.raceId
JOIN results rs ON q.raceId = rs.raceId AND q.driverId = rs.driverId
WHERE r.season = '2023' -- Asegúrate de actualizar el año según corresponda
ORDER BY q.raceId, q.position;