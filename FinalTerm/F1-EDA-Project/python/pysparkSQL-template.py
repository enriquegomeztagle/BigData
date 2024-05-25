from pyspark.sql import SparkSession

# Initialize a SparkSession with Hive support enabled
spark = SparkSession.builder \
    .appName("SQL Query Template") \
    .enableHiveSupport() \
    .getOrCreate()

# Define SQL Query
sql_query = """
"""

# Execute the SQL query
result_df = spark.sql(sql_query)

# Display the results to verify them
result_df.show()

# Stop the Spark session to free up resources when done
spark.stop()
