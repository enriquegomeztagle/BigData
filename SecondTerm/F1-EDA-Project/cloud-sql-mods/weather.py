from pyspark.sql import SparkSession

spark = SparkSession.builder \
    .appName("Weather Insights") \
    .enableHiveSupport() \
    .getOrCreate()

weather_insights_query = """
SELECT
    EventName,
    Compound,
    AVG(LapTime) AS AvgLapTime,
    TemperatureCondition,
    HumidityCondition
FROM (
    SELECT
        l.EventName,
        l.Compound,
        l.LapTime,
        CASE
            WHEN AVG(w.AirTemp) OVER (PARTITION BY l.EventName) >= 25 THEN 'Hot'
            WHEN AVG(w.AirTemp) OVER (PARTITION BY l.EventName) BETWEEN 15 AND 24 THEN 'Mild'
            ELSE 'Cold'
        END AS TemperatureCondition,
        CASE
            WHEN AVG(w.Humidity) OVER (PARTITION BY l.EventName) > 70 THEN 'High Humidity'
            ELSE 'Low/Medium Humidity'
        END AS HumidityCondition
    FROM
        laps_temp_updated l
    JOIN
        weather w ON l.EventName = w.EventName
    WHERE
        l.LapTime IS NOT NULL  
) sub
GROUP BY
    EventName, Compound, TemperatureCondition, HumidityCondition
ORDER BY
    EventName, AvgLapTime;
"""

weather_insights = spark.sql(weather_insights_query)
weather_insights.show()
