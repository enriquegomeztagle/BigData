-- Diferencia entre cuantiles para casos confirmados acumulados por condado
-- SELECT county_name, 
       -- AVG(cumulative_confirmed_q0975 - cumulative_confirmed_q0025) AS avg_confirmed_uncertainty_range
-- FROM `bigquery-public-data.covid19_public_forecasts.county_28d`
-- GROUP BY county_name
-- ORDER BY avg_confirmed_uncertainty_range DESC;

-- Diferencia entre cuantiles para muertes acumuladas por condado
-- SELECT county_name,
       -- AVG(cumulative_deaths_q0975 - cumulative_deaths_q0025) AS avg_deaths_uncertainty_range
-- FROM `bigquery-public-data.covid19_public_forecasts.county_28d`
-- GROUP BY county_name
-- ORDER BY avg_deaths_uncertainty_range DESC;

-- Rango de incertidumbre en pacientes hospitalizados por condado
-- SELECT county_name, 
       -- AVG(hospitalized_patients_q0975 - hospitalized_patients_q0025) AS avg_hospitalized_uncertainty_range
-- FROM `bigquery-public-data.covid19_public_forecasts.county_28d`
-- GROUP BY county_name
-- ORDER BY avg_hospitalized_uncertainty_range DESC;

-- Rango de incertidumbre en recuperaciones documentadas por condado
--SELECT county_name, 
       -- AVG(recovered_q0975 - recovered_q0025) AS avg_recovered_uncertainty_range
-- FROM `bigquery-public-data.covid19_public_forecasts.county_28d`
-- GROUP BY county_name
-- ORDER BY avg_recovered_uncertainty_range DESC;

-- -- Variabilidad en el tiempo de los casos confirmados acumulados
-- SELECT forecast_date, 
       -- AVG(cumulative_confirmed_q0975 - cumulative_confirmed_q0025) AS avg_daily_confirmed_uncertainty_range
-- FROM `bigquery-public-data.covid19_public_forecasts.county_28d`
-- GROUP BY forecast_date
-- ORDER BY forecast_date ASC;

-- Variabilidad en el tiempo de las muertes acumuladas
-- SELECT forecast_date, 
       -- AVG(cumulative_deaths_q0975 - cumulative_deaths_q0025) AS avg_daily_deaths_uncertainty_range
-- FROM `bigquery-public-data.covid19_public_forecasts.county_28d`
-- GROUP BY forecast_date
-- ORDER BY forecast_date ASC;

