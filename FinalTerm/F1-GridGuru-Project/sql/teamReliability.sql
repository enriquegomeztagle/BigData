USE GridGuru;

SELECT s.status          AS Status,
       c.name            AS ConstructorName,
       COUNT(r.statusId) AS CountStatus,
       CASE
           WHEN COUNT(r.statusId) = maxAndMin.MaxCount THEN 'Max'
           WHEN COUNT(r.statusId) = maxAndMin.MinCount THEN 'Min'
           WHEN c.name = 'Red Bull' THEN 'Red Bull'
           ELSE 'Other'
           END           AS Category
FROM results r
         JOIN status s ON r.statusId = s.statusId
         JOIN constructors c ON r.constructorId = c.constructorId
         JOIN (SELECT statusId,
                      MAX(CountStatus) AS MaxCount,
                      MIN(CountStatus) AS MinCount
               FROM (SELECT statusId,
                            COUNT(statusId) AS CountStatus
                     FROM results
                     GROUP BY statusId, constructorId) AS SubCounts
               GROUP BY statusId) AS maxAndMin ON r.statusId = maxAndMin.statusId
GROUP BY s.status, c.name, maxAndMin.MaxCount, maxAndMin.MinCount
HAVING Category IN ('Max', 'Min', 'Red Bull')
ORDER BY s.status, Category DESC;

/* With this query, we can see the number of times each status has been reached by out team. 
   We can also see the maximum and minimum number of times a status has been reached by any team. 
   This information helps us to understand the reliability of our team and how it compares to other teams in the competition. */
