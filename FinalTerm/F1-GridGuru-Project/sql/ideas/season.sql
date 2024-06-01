/*SELECT r.raceId, r.name AS raceName, r.date, rs.constructorId, rs.positionOrder
FROM results rs
JOIN races r ON rs.raceId = r.raceId
WHERE rs.constructorId = (SELECT constructorId FROM constructors WHERE name = 'Red Bull') AND r.season = '2023'
ORDER BY r.date;*/
USE GridGuru;
