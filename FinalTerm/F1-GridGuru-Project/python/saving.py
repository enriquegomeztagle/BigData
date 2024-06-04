import pandas as pd
import sqlalchemy

# Create SQL connection
conn = sqlalchemy.create_engine('mysql+pymysql://root:root@localhost:3306/GridGuru')

# Define your SQL query
query = """
SELECT 
    r.circuitId,
    c.name AS circuit_name,
    AVG(res.points) AS avg_points
FROM 
    results res
JOIN
    races r ON res.raceId = r.raceId
JOIN 
    circuits c ON r.circuitId = c.circuitId
JOIN 
    constructors con ON res.constructorId = con.constructorId
WHERE
    res.constructorId = 9
GROUP BY 
    r.circuitId, c.name, res.constructorId, con.name
ORDER BY 
    avg_points DESC;
"""

# Execute the query and load into a DataFrame
df = pd.read_sql_query(query, conn)

# Save results to CSV
df.to_csv('pointsByGP.csv', index=False)

# Close connection
conn.dispose()
