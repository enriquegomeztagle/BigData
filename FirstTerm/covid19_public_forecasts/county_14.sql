-- Tendencia de casos nuevos confirmados a lo largo del tiempo por condado
-- SELECT forecast_date, county_name, SUM(new_confirmed) AS daily_new_confirmed
-- FROM bigquery-public-data.covid19_public_forecasts.county_14d
-- GROUP BY forecast_date, county_name
-- ORDER BY forecast_date ASC;

-- Comparar casos confirmados acumulados y muertes acumuladas entre condados
-- SELECT county_name, MAX(cumulative_confirmed) AS total_confirmed, MAX(cumulative_deaths) AS total_deaths
-- FROM bigquery-public-data.covid19_public_forecasts.county_14d
-- GROUP BY county_name
-- ORDER BY total_confirmed DESC;

-- Tasas de casos confirmados per cápita por condado
-- SELECT county_name, (MAX(cumulative_confirmed) / MAX(county_population)) * 100 AS cases_per_100
-- FROM bigquery-public-data.covid19_public_forecasts.county_14d
-- GROUP BY county_name
-- ORDER BY cases_per_100 DESC;

-- Comparar casos confirmados reportados vs. verdad de terreno para un periodo específico
-- SELECT forecast_date,
       -- SUM(new_confirmed) AS reported_new_confirmed,
       -- SUM(new_confirmed_ground_truth) AS ground_truth_new_confirmed
-- FROM bigquery-public-data.covid19_public_forecasts.county_14d
-- GROUP BY forecast_date
-- ORDER BY forecast_date ASC;

-- Cambio en casos nuevos confirmados antes y después de una fecha de intervención
-- WITH before_after AS (
  -- SELECT
    -- county_name,
    -- SUM(CASE WHEN forecast_date < '2021-01-01' THEN new_confirmed ELSE 0 END) AS before_intervention,
    -- SUM(CASE WHEN forecast_date >= '2022-01-01' THEN new_confirmed ELSE 0 END) AS after_intervention
  -- FROM bigquery-public-data.covid19_public_forecasts.county_14d
  -- GROUP BY county_name
-- )
-- SELECT county_name, before_intervention, after_intervention
-- FROM before_after;

-- Proporción de pacientes recuperados sobre casos confirmados acumulados
-- SELECT county_name, MAX(recovered) / MAX(cumulative_confirmed) AS recovery_rate
-- FROM bigquery-public-data.covid19_public_forecasts.county_14d
-- GROUP BY county_name
-- ORDER BY recovery_rate DESC;

-- Tasas de mortalidad por condado
-- SELECT county_name, (MAX(cumulative_deaths) / MAX(county_population)) * 100 AS death_rate_per_100
-- FROM bigquery-public-data.covid19_public_forecasts.county_14d
-- GROUP BY county_name
-- ORDER BY death_rate_per_100 DESC;

-- Carga sobre el sistema de salud por condado
-- SELECT forecast_date, county_name, SUM(hospitalized_patients) AS total_hospitalized
-- FROM bigquery-public-data.covid19_public_forecasts.county_14d
-- GROUP BY forecast_date, county_name
-- ORDER BY total_hospitalized DESC;
