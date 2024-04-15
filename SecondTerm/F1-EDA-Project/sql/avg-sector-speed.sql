/* This query calculates the average speeds for each sector in races, ensuring all sectors have recorded speeds. */

/* SELECT 
    AVG(SpeedI1) AS AvgSpeedSector1,
    AVG(SpeedI2) AS AvgSpeedSector2,
    AVG(SpeedFL) AS AvgSpeedFinalSector
FROM laps
WHERE SpeedI1 IS NOT NULL AND SpeedI2 IS NOT NULL AND SpeedFL IS NOT NULL
INTO OUTFILE 'c:\\wamp64\\tmp\\average_speeds_per_sector.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
 */


SELECT 
    AVG(SpeedI1) AS AvgSpeedSector1,
    AVG(SpeedI2) AS AvgSpeedSector2,
    AVG(SpeedFL) AS AvgSpeedFinalSector
FROM laps
WHERE SpeedI1 IS NOT NULL AND SpeedI2 IS NOT NULL AND SpeedFL IS NOT NULL;
 

