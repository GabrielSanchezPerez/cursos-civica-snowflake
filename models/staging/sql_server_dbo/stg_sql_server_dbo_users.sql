{{
  config(
    materialized='view'
  )
}}


WITH source_users AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'users') }}
    ),

renamed_casted AS (
    SELECT
          TRIM(user_id) AS user_id
        , CAST(updated_at AS DATE) AS updated_at
        , TRIM(address_id) AS address_id
        , TRIM(UPPER(last_name)) AS last_name
        , CAST(created_at AS DATE) AS created_at
        , CASE
            WHEN LEN(REPLACE(phone_number, '-', '')) = 10 THEN TO_CHAR(REPLACE(phone_number, '-', ''))
            ELSE '9999999999'
          END AS phone_number
        , TRIM(UPPER(first_name)) AS first_name
        , TRIM(UPPER(email)) AS email
        , _fivetran_deleted
        , _fivetran_synced AS date_load
    FROM source_users
    )

SELECT * 
FROM renamed_casted







