{{
  config(
    materialized='table'
  )
}}

WITH stg_address AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_address') }}
),


renamed_casted AS (
    SELECT
        address_id 
        , zipcode 
        , address
        , state
        , country
    FROM stg_address
    )

SELECT * FROM renamed_casted