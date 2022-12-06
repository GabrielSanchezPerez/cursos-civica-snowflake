{{
  config(
    materialized='table'
  )
}}


WITH source_events AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'events') }}
),

renamed AS (

    SELECT
        TRIM(event_id) AS event_id,
        created_at,
        TRIM(product_id) AS product_id,
        TRIM(UPPER(event_type)) AS event_type,
        TRIM(user_id) AS user_id,
        TRIM(session_id) AS session_id,
        TRIM(order_id) AS order_id,
        TRIM(page_url) AS page_url,
        _fivetran_deleted,
        _fivetran_synced
    FROM source_events
)

SELECT * 
FROM renamed