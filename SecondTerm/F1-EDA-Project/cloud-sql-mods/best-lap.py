from pyspark.sql import SparkSession

# Iniciar SparkSession
spark = SparkSession.builder \
    .appName("Best Lap Time Analysis") \
    .enableHiveSupport() \
    .getOrCreate()

# SQL directo
query = """
SELECT EventName AS `GP Name`, MIN(LapTime) AS `Best Lap Time`
FROM laps_temp_updated
WHERE LapTime IS NOT NULL
GROUP BY EventName
ORDER BY MIN(LapTime) ASC
"""

# Ejecutar la consulta
best_lap_time_df = spark.sql(query)

# Mostrar los resultados
best_lap_time_df.show()
