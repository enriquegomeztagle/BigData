from pyspark.sql import SparkSession
from pyspark.sql.functions import udf, col
from pyspark.sql.types import FloatType

spark = SparkSession.builder \
    .appName("LapTime Conversion") \
    .enableHiveSupport() \
    .getOrCreate()

def convert_laptime_to_minutes(laptime):
    try:
        if laptime is not None:
            parts = laptime.split()
            days = int(parts[0])
            time_parts = parts[2].split(':')
            hours = int(time_parts[0])
            minutes = int(time_parts[1])
            seconds = float(time_parts[2])

            total_minutes = days * 1440 + hours * 60 + minutes + seconds / 60
            return total_minutes
        else:
            return None
    except Exception as e:
        return None

convert_laptime_udf = udf(convert_laptime_to_minutes, FloatType())

updated_df = spark.table("laps_temp").withColumn("LapTime", convert_laptime_udf(col("LapTime")))

updated_df.write.mode("overwrite").saveAsTable("laps_temp_updated")

updated_df.show()
