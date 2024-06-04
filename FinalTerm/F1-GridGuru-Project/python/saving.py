import pandas as pd
import sqlalchemy

# Create SQL connection
conn = sqlalchemy.create_engine('mysql+pymysql://root:root@localhost:3306/GridGuru')

# Define your SQL query
query = """
SELECT 
    q.driverId,
    CONCAT(d.forename, ' ', d.surname) AS driver_name,
    AVG(res.position - q.position) AS avg_position_change
FROM 
    qualifying q
JOIN 
    results res ON q.raceId = res.raceId AND q.driverId = res.driverId
JOIN 
    drivers d ON q.driverId = d.driverId
GROUP BY 
    q.driverId, d.forename, d.surname
ORDER BY 
    avg_position_change DESC;
"""

# Execute the query and load into a DataFrame
df = pd.read_sql_query(query, conn)

# Save results to CSV
df.to_csv('quali-vs-race.csv', index=False)

# Close connection
conn.dispose()
