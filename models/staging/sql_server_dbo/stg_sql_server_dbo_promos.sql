{{
  config(
    materialized='table'
  )
}}



WITH source AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'promos') }}
),

renamed AS (
    SELECT
        TRIM(UPPER(promo_id)) AS promo_id,
        TRIM(discount) AS disconut_porcentaje,
        TRIM(UPPER(status)) AS status,
        _fivetran_deleted,
        _fivetran_synced
    FROM source
)

SELECT * 
FROM renamed