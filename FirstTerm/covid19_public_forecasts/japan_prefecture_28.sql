-- Casos confirmados acumulados por prefectura
-- SELECT prefecture_name, prefecture_name_kanji, MAX(cumulative_confirmed) AS total_confirmed
-- FROM bigquery-public-data.covid19_public_forecasts.japan_prefecture_28d
-- GROUP BY prefecture_name, prefecture_name_kanji
-- ORDER BY total_confirmed DESC;

-- Tasas de casos confirmados per cápita por prefectura
-- SELECT prefecture_name, (MAX(cumulative_confirmed) / MAX(prefecture_population)) * 100 AS cases_per_100
-- FROM bigquery-public-data.covid19_public_forecasts.japan_prefecture_28d
-- GROUP BY prefecture_name
-- ORDER BY cases_per_100 DESC;

-- Diferencia entre cuantiles para casos confirmados acumulados por prefectura
-- SELECT prefecture_name, 
       -- AVG(cumulative_confirmed_q0975 - cumulative_confirmed_q0025) AS avg_confirmed_uncertainty_range
-- FROM bigquery-public-data.covid19_public_forecasts.japan_prefecture_28d
-- GROUP BY prefecture_name
-- ORDER BY avg_confirmed_uncertainty_range DESC;

-- Diferencia entre cuantiles para muertes acumuladas por prefectura
-- SELECT prefecture_name,
       -- AVG(cumulative_deaths_q0975 - cumulative_deaths_q0025) AS avg_deaths_uncertainty_range
-- FROM bigquery-public-data.covid19_public_forecasts.japan_prefecture_28d
-- GROUP BY prefecture_name
-- ORDER BY avg_deaths_uncertainty_range DESC;

-- Rango de incertidumbre en pacientes hospitalizados por prefectura
-- SELECT prefecture_name, 
       -- AVG(hospitalized_patients_q0975 - hospitalized_patients_q0025) AS avg_hospitalized_uncertainty_range
-- FROM bigquery-public-data.covid19_public_forecasts.japan_prefecture_28d
-- GROUP BY prefecture_name
-- ORDER BY avg_hospitalized_uncertainty_range DESC;

-- Comparar casos confirmados reportados vs. verdad de terreno para un periodo específico en una prefectura
-- SELECT prediction_date, 
       -- SUM(new_confirmed) AS reported_new_confirmed, 
       -- SUM(new_confirmed_ground_truth) AS ground_truth_new_confirmed
-- FROM bigquery-public-data.covid19_public_forecasts.japan_prefecture_28d
-- WHERE prefecture_name = 'Fukui'
-- GROUP BY prediction_date
-- ORDER BY prediction_date ASC;

-- Promedio móvil de 7 días para nuevos casos confirmados por prefectura
SELECT forecast_date, prefecture_name, AVG(new_confirmed_7day_rolling) AS rolling_avg_new_confirmed
FROM bigquery-public-data.covid19_public_forecasts.japan_prefecture_28d
WHERE prefecture_name = 'Fukui'
GROUP BY forecast_date, prefecture_name
ORDER BY forecast_date ASC;
