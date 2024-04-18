/* This query analyzes the performance of tire compounds under varying weather conditions across different GP events,
   computing the average lap times and categorizing weather impacts. Results are exported to 'performance_under_weather_conditions.csv'. */

/*SELECT
    EventName,
    Compound,
    AVG(AvgLapTime) AS AvgLapTime,
    TemperatureCondition,
    HumidityCondition
FROM (
    SELECT 
        l.EventName,
        l.Compound,
        (SUBSTRING_INDEX(SUBSTRING_INDEX(l.LapTime, ' ', 3), ' ', -1) * 1440) +  
        (SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(l.LapTime, ' ', 4), ':', 1), ' ', -1) * 60) +  
        (SUBSTRING_INDEX(SUBSTRING_INDEX(l.LapTime, ':', 2), ':', -1)) +  
        (SUBSTRING_INDEX(SUBSTRING_INDEX(l.LapTime, ':', -1), '.', 1) / 60) AS AvgLapTime,  
        CASE
            WHEN AVG(w.AirTemp) OVER (PARTITION BY l.EventName) >= 25 THEN 'Hot'
            WHEN AVG(w.AirTemp) OVER (PARTITION BY l.EventName) BETWEEN 15 AND 24 THEN 'Mild'
            ELSE 'Cold'
        END AS TemperatureCondition,
        CASE
            WHEN AVG(w.Humidity) OVER (PARTITION BY l.EventName) > 70 THEN 'High Humidity'
            ELSE 'Low/Medium Humidity'
        END AS HumidityCondition
    FROM 
        laps l
    JOIN 
        weather w ON l.EventName = w.EventName
    WHERE 
        l.LapTime IS NOT NULL
) sub
GROUP BY 
    EventName, Compound, TemperatureCondition, HumidityCondition
ORDER BY 
    EventName, AvgLapTime
INTO OUTFILE 'c:\\wamp64\\tmp\\performance_under_weather_conditions.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';
*/

SELECT 
    EventName,
    Compound,
    AVG(AvgLapTime) AS AvgLapTime,
    TemperatureCondition,
    HumidityCondition
FROM (
    SELECT 
        l.EventName,
        l.Compound,
        -- Conversión de LapTime a minutos
        (SUBSTRING_INDEX(SUBSTRING_INDEX(l.LapTime, ' ', 3), ' ', -1) * 1440) +  -- días a minutos
        (SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(l.LapTime, ' ', 4), ':', 1), ' ', -1) * 60) +  -- horas a minutos
        (SUBSTRING_INDEX(SUBSTRING_INDEX(l.LapTime, ':', 2), ':', -1)) +  -- minutos
        (SUBSTRING_INDEX(SUBSTRING_INDEX(l.LapTime, ':', -1), '.', 1) / 60) AS AvgLapTime,  -- segundos a minutos
        CASE
            WHEN AVG(w.AirTemp) OVER (PARTITION BY l.EventName) >= 25 THEN 'Hot'
            WHEN AVG(w.AirTemp) OVER (PARTITION BY l.EventName) BETWEEN 15 AND 24 THEN 'Mild'
            ELSE 'Cold'
        END AS TemperatureCondition,
        CASE
            WHEN AVG(w.Humidity) OVER (PARTITION BY l.EventName) > 70 THEN 'High Humidity'
            ELSE 'Low/Medium Humidity'
        END AS HumidityCondition
    FROM 
        laps l
    JOIN 
        weather w ON l.EventName = w.EventName
    WHERE 
        l.LapTime IS NOT NULL
) sub
GROUP BY 
    EventName, Compound, TemperatureCondition, HumidityCondition
ORDER BY 
    EventName, AvgLapTime;
