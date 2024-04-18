/* This query offers a comprehensive telemetry analysis for each driver in each event, 
including detailed metrics on throttle usage, brake usage, speed, RPM, and DRS activation*/

/*SELECT
    t.EventName,
    t.DriverNumber,
    AVG(NULLIF(CAST(t.Throttle AS FLOAT), 0)) AS AvgThrottleUsage,
    AVG(CASE WHEN t.Brake = 'True' THEN 1.0 ELSE 0 END) AS AvgBrakeUsage,
    AVG(NULLIF(CAST(t.Speed AS FLOAT), 0)) AS AvgSpeed,
    MAX(CAST(t.Speed AS FLOAT)) AS MaxSpeed,
    MIN(NULLIF(CAST(t.Speed AS FLOAT), 0)) AS MinSpeed,
    STDDEV_POP(CAST(t.Speed AS FLOAT)) AS StdDevSpeed,
    AVG(CAST(t.RPM AS FLOAT)) AS AvgRPM,
    MAX(CAST(t.RPM AS FLOAT)) AS MaxRPM,
    MIN(CAST(t.RPM AS FLOAT)) AS MinRPM,
    STDDEV_POP(CAST(t.RPM AS FLOAT)) AS StdDevRPM,
    SUM(CASE WHEN t.DRS = '1' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS PercentageDRSActivated
FROM 
    telemetry t
GROUP BY 
    t.EventName, t.DriverNumber
ORDER BY 
    t.EventName ASC, AvgSpeed DESC, t.DriverNumber ASC
INTO OUTFILE 'c:\\wamp64\\tmp\\telemetry_analysis.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
*/

SELECT 
    t.EventName,
    t.DriverNumber,
    AVG(NULLIF(CAST(t.Throttle AS FLOAT), 0)) AS AvgThrottleUsage,
    AVG(CASE WHEN t.Brake = 'True' THEN 1.0 ELSE 0 END) AS AvgBrakeUsage,
    AVG(NULLIF(CAST(t.Speed AS FLOAT), 0)) AS AvgSpeed,
    MAX(CAST(t.Speed AS FLOAT)) AS MaxSpeed,
    MIN(NULLIF(CAST(t.Speed AS FLOAT), 0)) AS MinSpeed,
    STDDEV_POP(CAST(t.Speed AS FLOAT)) AS StdDevSpeed,
    AVG(CAST(t.RPM AS FLOAT)) AS AvgRPM,
    MAX(CAST(t.RPM AS FLOAT)) AS MaxRPM,
    MIN(CAST(t.RPM AS FLOAT)) AS MinRPM,
    STDDEV_POP(CAST(t.RPM AS FLOAT)) AS StdDevRPM,
    SUM(CASE WHEN t.DRS = '1' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS PercentageDRSActivated
FROM 
    telemetry t
GROUP BY 
    t.EventName, t.DriverNumber
ORDER BY 
    t.EventName ASC, AvgSpeed DESC, t.DriverNumber ASC;
