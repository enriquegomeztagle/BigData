-- Rango de Incertidumbre para Casos y Muertes Confirmados Acumulativos
SELECT state_name, 
       MAX(cumulative_confirmed_q0025) AS lower_bound_confirmed,
       MAX(cumulative_confirmed_q0975) AS upper_bound_confirmed,
       MAX(cumulative_deaths_q0025) AS lower_bound_deaths,
       MAX(cumulative_deaths_q0975) AS upper_bound_deaths
FROM `bigquery-public-data.covid19_public_forecasts.state_28d`
GROUP BY state_name
ORDER BY state_name;

--Análisis de Incertidumbre en Pacientes Hospitalizados y en Cuidados Intensivos
SELECT state_name, forecast_date,
       AVG(hospitalized_patients_q0025) AS lower_bound_hospitalized,
       AVG(hospitalized_patients_q0975) AS upper_bound_hospitalized,
       AVG(intensive_care_patients_q0025) AS lower_bound_icu,
       AVG(intensive_care_patients_q0975) AS upper_bound_icu
FROM `bigquery-public-data.covid19_public_forecasts.state_28d`
GROUP BY state_name, forecast_date
ORDER BY state_name, forecast_date DESC;

-- Variabilidad en el Uso de Ventiladores
SELECT state_name, 
       MAX(ventilator_patients_q0025) AS lower_bound_ventilators,
       MAX(ventilator_patients_q0975) AS upper_bound_ventilators
FROM `bigquery-public-data.covid19_public_forecasts.state_28d`
GROUP BY state_name
ORDER BY state_name;

-- Rango de Incertidumbre para Recuperaciones
SELECT state_name, 
       MAX(recovered_q0025) AS lower_bound_recovered,
       MAX(recovered_q0975) AS upper_bound_recovered
FROM `bigquery-public-data.covid19_public_forecasts.state_28d`
GROUP BY state_name
ORDER BY state_name;
