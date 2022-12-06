{{
  config(
    materialized='table'
  )
}}

WITH stg_date AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_date') }}
),


renamed_casted AS (
    SELECT
      date_id
    , fecha_forecast
    , CAST(anio AS VARCHAR(4)) AS anio
    , mes
    , desc_mes
    , CAST(id_anio_mes AS VARCHAR(6)) AS id_anio_mes
    , dia_previo
    , anio_semana_dia
    , semana
    FROM stg_date
    )

SELECT * FROM renamed_casted