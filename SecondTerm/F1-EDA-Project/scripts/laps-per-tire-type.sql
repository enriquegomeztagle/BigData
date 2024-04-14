-- Total laps per tire type
SELECT Compound, COUNT(*) AS 'Total Laps'
FROM laps WHERE Compound IS NOT NULL 
GROUP BY Compound
ORDER BY COUNT(*) DESC;
