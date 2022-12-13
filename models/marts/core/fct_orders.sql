{{
  config(
    materialized='table'
  )
}}

WITH stg_orders AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_orders') }}
),


renamed_casted AS (
    SELECT
        order_id 
        , user_id 
        , promo_id
        , address_id
        , TO_CHAR(created_at, 'YYYYMMDD') AS date_id
        , created_at
        , order_cost_eur
        , shipping_cost_eur
        , order_total_eur
        , tracking_id
        , shipping_service
        , estimated_delivery_at
        , delivered_at
				,	DATEDIFF(day, created_at, delivered_at) AS days_to_deliver
        , status
        , date_load
    FROM stg_orders
    )

SELECT * FROM renamed_casted