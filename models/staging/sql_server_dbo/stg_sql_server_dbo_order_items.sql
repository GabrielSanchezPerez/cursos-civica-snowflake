{{
  config(
    materialized='table'
  )
}}


WITH source AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'order_items') }}
),

renamed AS (
    SELECT
        TRIM(order_id) AS order_id,
        TRIM(product_id) AS product_id,
        CASE 
            WHEN TRIM(quantity) > 0 
                THEN quantity
                ELSE 0
            END AS quantity,
        _fivetran_deleted,
        _fivetran_synced
    FROM source
)

SELECT * 
FROM renamed