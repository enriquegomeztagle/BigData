-- SELECT payment_type, COUNT(*) as tx_count SELECT payment_type, COUNT(*) as tx_count FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_*` WHERE tip_amout>0 GROUP BY 1 ORDER BY 2 DESC;

SELECT COUNT(*) FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_*`;

SELECT EXTRACT(hour FROM pickup_datetime) AS hour_of_the_day, (COUNT(*)/84598433)*100 as num_trips FROM `bigquery-public-data.new_york_taxi_trips.tlc_yellow_trips_2019` GROUP BY 1 ORDER BY 2 DESC;
