/* This query calculates the number of distinct drivers for each Grand Prix event, facilitating analysis of participation diversity.*/

/* SELECT
    EventName as `GP Name`,
    COUNT(DISTINCT DriverNumber) AS `Number Of Drivers`
FROM
    results
GROUP BY
    EventName
ORDER BY
    COUNT(DISTINCT DriverNumber) ASC
INTO OUTFILE 'c:\\wamp64\\tmp\\number_of_drivers_per_gp.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'; */


SELECT EventName as `GP Name`, COUNT(DISTINCT DriverNumber) AS `Number Of Drivers`
FROM results
GROUP BY EventName
ORDER BY COUNT(DISTINCT DriverNumber) ASC;
