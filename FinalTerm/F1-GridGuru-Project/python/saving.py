import pandas as pd
import sqlalchemy

# Create SQL connection
conn = sqlalchemy.create_engine('mysql+pymysql://root:root@localhost:3306/GridGuru')

# Define your SQL query
query = """

"""

# Execute the query and load into a DataFrame
df = pd.read_sql_query(query, conn)

# Save results to CSV
df.to_csv('.csv', index=False)

# Close connection
conn.dispose()
