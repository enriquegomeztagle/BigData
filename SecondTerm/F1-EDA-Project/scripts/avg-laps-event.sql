-- Average number of laps completed for each GP

SELECT EventName as 'GP Name', AVG(LapNumber) AS 'Average Laps'
FROM laps 
GROUP BY EventName 
ORDER BY AVG(LapNumber) DESC;
