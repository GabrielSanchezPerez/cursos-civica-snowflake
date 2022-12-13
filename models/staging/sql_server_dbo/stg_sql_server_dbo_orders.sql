{{
  config(
    materialized='view'
  )
}}


WITH source_orders AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'orders') }}
),

renamed AS (
    SELECT
        TRIM(order_id) as order_id
      , CASE
          WHEN TRIM(UPPER(shipping_service)) = ''
            THEN 'N/A'
          ELSE TRIM(UPPER(shipping_service))
        END AS shipping_service
      , TRIM(shipping_cost) AS shipping_cost_eur
      , TRIM(address_id) AS address_id
      , created_at
      , CASE
          WHEN TRIM(UPPER(promo_id)) = ''
            THEN 'N/A'
          ELSE TRIM(UPPER(promo_id))
        END AS promo_id
      , estimated_delivery_at
      , TRIM(order_cost) AS order_cost_eur
      , TRIM(user_id) AS user_id
      , TRIM(order_total) AS order_total_eur
      , delivered_at
      , TRIM(tracking_id) AS tracking_id
      , TRIM(UPPER(status)) AS status
      , _fivetran_deleted
      , _fivetran_synced AS date_load
    FROM source_orders
)

SELECT * 
FROM renamed