-- Number of drivers on each GP
SELECT EventName as 'GP Name', COUNT(DISTINCT DriverNumber) AS 'Number Of Drivers'
FROM results 
GROUP BY EventName 
ORDER BY COUNT(DISTINCT DriverNumber) ASC;
