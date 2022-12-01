{{
  config(
    materialized='table'
  )
}}



WITH source as (
    SELECT * 
    FROM {{ source('google_sheets', 'budget') }}
),

renamed as (
    SELECT
        TRIM(_row) AS _row,
        TRIM(quantity) AS quantity,
        SUBSTR(TRIM(month), 1, 7) AS month,
        TRIM(product_id) AS product_id,
        _fivetran_synced
    FROM source
)

SELECT * 
FROM renamed