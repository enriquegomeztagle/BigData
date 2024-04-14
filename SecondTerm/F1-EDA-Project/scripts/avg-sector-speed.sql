-- Average speed for each sector
SELECT 
    AVG(SpeedI1) AS AvgSpeedSector1,
    AVG(SpeedI2) AS AvgSpeedSector2,
    AVG(SpeedFL) AS AvgSpeedFinalSector
FROM laps
WHERE SpeedI1 IS NOT NULL AND SpeedI2 IS NOT NULL AND SpeedFL IS NOT NULL;
