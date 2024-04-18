from pyspark.sql import SparkSession
from pyspark.sql.functions import col, when

# Iniciar SparkSession
spark = SparkSession.builder \
    .appName("Update LapTimes") \
    .enableHiveSupport() \
    .getOrCreate()

# Cargar el DataFrame (esto es solo un ejemplo; tu fuente de datos puede ser diferente)
laps_df = spark.table("laps")

# Reemplazar cadenas vacías con valores nulos en la columna 'LapTime'
laps_df_updated = laps_df.withColumn(
    "LapTime",
    when(col("LapTime") != "", col("LapTime")).otherwise(None)
)

laps_df_updated.createOrReplaceTempView("laps_temp")

# Ahora puedes ejecutar consultas SQL sobre esta vista utilizando SparkSession
result = spark.sql("""
    SELECT Driver, COUNT(*) AS TotalLaps, SUM(CASE WHEN LapTime IS NULL THEN 1 ELSE 0 END) AS NullLapTimes
    FROM laps_temp
    GROUP BY Driver
""")

# Mostrar los resultados de la consulta
result.show()





