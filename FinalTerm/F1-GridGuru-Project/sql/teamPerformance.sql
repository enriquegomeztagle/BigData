USE GridGuru;

SELECT
    cons.name AS teamName,                                  -- Team name
    AVG(res.points) AS averagePoints,                       -- Average points earned per race
    AVG(res.positionOrder) AS averagePosition,              -- Average finishing position
    COUNT(IF(res.position = 1, 1, NULL)) AS totalWins,      -- Total number of race wins
    SUM(IF(res.position = 1, res.laps, 0)) AS totalLapsLed, -- Total number of laps led by the team when winning
    SUM(res.laps) AS totalLap,                              -- Total laps completed
    SUM(IF(res.position = 1, res.laps, 0)) * 100 / SUM(res.laps) AS percentageOfLapsLed -- Percentage of laps led out of total laps completed
FROM results res
JOIN constructors cons ON res.constructorId = cons.constructorId
GROUP BY cons.name
ORDER BY averagePoints DESC, totalWins DESC;

/*
    We used the previous query to get the average points, average position, total wins, total laps led, total laps and the 
    percentage of laps led for each team that has participated in the Formula 1. 
    This information helps us to understand how our team has performed in comparison to other teams in the competition.
*/