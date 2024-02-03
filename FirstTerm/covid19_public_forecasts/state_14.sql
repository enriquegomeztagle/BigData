-- Casos confirmados acumulados y nuevos casos (promedio de 7 días) por estado
SELECT state_name, MAX(cumulative_confirmed) AS total_confirmed, AVG(new_confirmed_7day_rolling) AS avg_new_confirmed_7d
FROM `bigquery-public-data.covid19_public_forecasts.state_14d`
GROUP BY state_name
ORDER BY total_confirmed DESC;

-- Muertes acumuladas y nuevas muertes (promedio de 7 días) por estado
SELECT state_name, MAX(cumulative_deaths) AS total_deaths, AVG(new_deaths_7day_rolling) AS avg_new_deaths_7d
FROM `bigquery-public-data.covid19_public_forecasts.state_14d`
GROUP BY state_name
ORDER BY total_deaths DESC;

-- Pacientes hospitalizados, en cuidados intensivos y en ventiladores por estado
SELECT forecast_date, state_name, 
       MAX(hospitalized_patients) AS hospitalized,
       MAX(intensive_care_patients) AS in_intensive_care,
       MAX(ventilator_patients) AS on_ventilators
FROM `bigquery-public-data.covid19_public_forecasts.state_14d`
GROUP BY forecast_date, state_name
ORDER BY state_name, forecast_date DESC;

-- Recuperaciones documentadas por estado
SELECT state_name, MAX(recovered) AS total_recovered
FROM `bigquery-public-data.covid19_public_forecasts.state_14d`
GROUP BY state_name
ORDER BY total_recovered DESC;

-- Comparar casos confirmados reportados vs. verdad de terreno para un estado específico
SELECT prediction_date,
       SUM(new_confirmed) AS reported_new_confirmed,
       SUM(new_confirmed_ground_truth) AS ground_truth_new_confirmed
FROM `bigquery-public-data.covid19_public_forecasts.state_14d`
WHERE state_name = 'Texas'
GROUP BY prediction_date
ORDER BY prediction_date ASC;

-- Tasas de casos confirmados y muertes per cápita por estado
SELECT state_name, 
       (MAX(cumulative_confirmed) / MAX(state_population)) * 100 AS cases_per_100,
       (MAX(cumulative_deaths) / MAX(state_population)) * 100 AS deaths_per_100
FROM `bigquery-public-data.covid19_public_forecasts.state_14d`
GROUP BY state_name
ORDER BY cases_per_100 DESC;
