import pandas as pd
import sqlalchemy

# Create SQL connection
conn = sqlalchemy.create_engine('mysql+pymysql://root:root@localhost:3306/GridGuru')

query = """
SELECT 
    d.forename AS FirstName, 
    d.surname AS LastName,
    c.name AS BestPerformanceTeam,
    COUNT(DISTINCT ra.year) AS CompetitiveSeasons,
    AVG(ds.points) AS AvgPointsPerSeason,
    SUM(ds.points) AS TotalCareerPoints,
    SUM(CASE WHEN r.position = 1 THEN 1 ELSE 0 END) AS Wins,
    COUNT(CASE WHEN r.position <= 3 THEN 1 ELSE NULL END) AS Podiums,
    MIN(r.positionOrder) AS BestFinish,
    SUM(CASE WHEN s.status NOT LIKE %s AND s.status NOT LIKE %s THEN 1 ELSE 0 END) AS Retirements,
    AVG(r.positionOrder) AS AvgFinishPosition
FROM driver_standings ds
JOIN drivers d ON ds.driverId = d.driverId
JOIN results r ON ds.driverId = r.driverId AND ds.raceId = r.raceId
JOIN races ra ON ra.raceId = r.raceId
JOIN constructors c ON r.constructorId = c.constructorId
JOIN status s ON r.statusId = s.statusId
WHERE ra.year >= YEAR(CURDATE()) - 5
GROUP BY d.forename, d.surname, c.name
HAVING CompetitiveSeasons >= 3
ORDER BY AvgPointsPerSeason DESC, Wins DESC, Podiums DESC, Retirements ASC, AvgFinishPosition ASC
LIMIT 5;
"""

# Parameters for SQL query to prevent the error
params = ('%Finished%', '%fin%')

# Execute query and load into a DataFrame
df = pd.read_sql_query(query, conn, params=params)

# Save results to CSV
df.to_csv('new-season-drivers.csv', index=False)

# Close connection
conn.dispose()
