{{
  config(
    materialized='table'
  )
}}

WITH source AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'products') }}
),

renamed AS (

    SELECT
        TRIM(product_id) AS product_id,
        TRIM(UPPER(name)) as name,
        TRIM(price) AS price_euros,
        TRIM(inventory) AS inventory,
        _fivetran_deleted,
        _fivetran_synced
    FROM source

)

SELECT * 
from renamed