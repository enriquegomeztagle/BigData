from pyspark.sql import SparkSession
from pyspark.sql.functions import col, expr, count, when, avg
from pyspark.sql.window import Window

spark = SparkSession.builder \
    .appName("Driver Analysis Without Subqueries") \
    .enableHiveSupport() \
    .getOrCreate()

compounds_usage = spark.sql("""
SELECT Driver, Compound, COUNT(*) AS UsageCount
FROM laps
WHERE LapTime IS NOT NULL
GROUP BY Driver, Compound
""")

windowSpec = Window.partitionBy("Driver").orderBy(col("UsageCount").desc())
most_used_compound = compounds_usage.withColumn("rank", row_number().over(windowSpec)) \
    .filter(col("rank") == 1) \
    .drop("UsageCount", "rank")

driver_stats = spark.table("laps_temp").groupBy("Driver").agg(
    avg(
        when(col("LapTime").isNotNull(),
             expr("""
                SUBSTRING_INDEX(SUBSTRING_INDEX(LapTime, ' days ', 1), ' days ', -1) * 1440 +
                SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(LapTime, ' days ', -1), ':', 1), ' ', -1) * 60 +
                SUBSTRING_INDEX(SUBSTRING_INDEX(SUBSTRING_INDEX(LapTime, ':', 2), ':', -1), ' ', 1) +
                SUBSTRING_INDEX(SUBSTRING_INDEX(LapTime, ':', -1), '.', 1) / 60
             """)
        )
    ).alias("AvgLapTime"),
    (count(when(col("LapTime").isNotNull(), 1)).cast("double") / count("*").cast("double") * 100).alias("CompletionRate")
)

final_result = driver_stats.join(most_used_compound, ["Driver"], "left") \
    .select("Driver", "Compound", "AvgLapTime", "CompletionRate") \
    .orderBy(col("CompletionRate").desc(), col("AvgLapTime"))

final_result.show()
