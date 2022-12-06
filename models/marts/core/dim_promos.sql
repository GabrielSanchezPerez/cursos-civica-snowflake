{{
  config(
    materialized='table'
  )
}}

WITH stg_promos AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_promos') }}
),


renamed_casted AS (
    SELECT
          promo_id
        , disconut_porcentaje
        , status
        , _fivetran_deleted
        , _fivetran_synced
    FROM stg_promos
    )

SELECT * FROM renamed_casted