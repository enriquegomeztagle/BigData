SELECT 
    t.EventName,
    t.DriverNumber,
    AVG(t.Throttle) AS AvgThrottleUsage,
    AVG(t.Brake) AS AvgBrakeUsage,
    AVG(t.Speed) AS AvgSpeed,
    MAX(t.Speed) AS MaxSpeed,
    AVG(t.RPM) AS AvgRPM,
    COUNT(*) AS SampleSize
FROM 
    telemetry t
WHERE 
    t.EventName = 'Specific Event Name'  -- Reemplaza con un nombre de evento específico
GROUP BY 
    t.EventName, t.DriverNumber
ORDER BY 
    t.EventName, AvgSpeed DESC;
