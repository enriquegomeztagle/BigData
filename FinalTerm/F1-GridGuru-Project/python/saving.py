import pandas as pd
import sqlalchemy

# Create sql connection
conn = sqlalchemy.create_engine('mysql+pymysql://root:root@localhost:3306/GridGuru')

query = """
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
"""

# Execute query and load into a DataFrame
df = pd.read_sql_query(query, conn)

# Save results to CSV
df.to_csv('teams-performance.csv', index=False)

# Close connection
conn.dispose()
