SELECT
    vendor_id,
    rate_code,
    trip_type,
    SUM(passenger_count) OVER(PARTITION BY vendor_id, rate_code) AS tot_pass_count
FROM
    `bigquery-public-data.new_york_taxi_trips.tlc_green_trips_2021`;

