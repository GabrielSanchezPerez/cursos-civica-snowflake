{{
  config(
    materialized='table'
  )
}}


WITH users AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'users') }}
    ),

renamed_casted AS (
    SELECT
          TRIM(user_id) AS user_id
        , SUBSTR(updated_at, 1, 10) AS update_at
        , TRIM(address_id) AS address_id
        , TRIM(UPPER(last_name)) AS last_name
        , SUBSTR(created_at, 1, 10) AS created_at
        , CASE
            WHEN LEN(REPLACE(phone_number, '-', '')) = 10 THEN REPLACE(phone_number, '-', '')
            ELSE 9999999999
          END AS phone_number
        , TRIM(UPPER(first_name)) AS first_name
        , TRIM(email) AS email
        , _fivetran_deleted
        , _fivetran_synced AS date_load
    FROM users
    )

SELECT * FROM renamed_casted







