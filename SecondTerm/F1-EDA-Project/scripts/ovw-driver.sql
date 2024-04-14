SELECT 
    l.Driver,
    (SELECT Compound 
     FROM laps 
     WHERE Driver = l.Driver AND LapTime IS NOT NULL 
     GROUP BY Compound 
     ORDER BY COUNT(*) DESC LIMIT 1) AS MostUsedCompound,
    AVG(
        -- Convertir días a minutos
        SUBSTRING_INDEX(SUBSTRING_INDEX(LapTime, ' days ', 1), ' days ', -1) * 1440 +
        -- Convertir horas a minutos
        SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(LapTime, ' days ', -1), ':', 1), ' ', -1) * 60 +
        -- Agregar minutos
        SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(LapTime, ':', 2), ':', -1), ' ', 1) +
        -- Convertir segundos a minutos
        SUBSTRING_INDEX(SUBSTRING_INDEX(LapTime, ':', -1), '.', 1) / 60
    ) AS AvgLapTime,
    (COUNT(l.LapTime) / COUNT(*)) * 100 AS CompletionRate
FROM 
    laps l
GROUP BY 
    l.Driver
ORDER BY 
    CompletionRate DESC, AvgLapTime;
