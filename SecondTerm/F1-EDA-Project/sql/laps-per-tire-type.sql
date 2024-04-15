/* This query calculates the total number of laps completed for each tire compound,
   providing insights into tire usage and preferences*/

/* SELECT 
    Compound, 
    COUNT(*) AS `Total Laps`
FROM 
    laps 
WHERE 
    Compound IS NOT NULL 
GROUP BY 
    Compound
ORDER BY 
    COUNT(*) DESC
INTO OUTFILE 'c:\\wamp64\\tmp\\total_laps_per_tire_compound.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'; */


SELECT Compound, COUNT(*) AS 'Total Laps'
FROM laps WHERE Compound IS NOT NULL 
GROUP BY Compound
ORDER BY COUNT(*) DESC;
