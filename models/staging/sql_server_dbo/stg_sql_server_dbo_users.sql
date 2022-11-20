{{
  config(
    materialized='view'
  )
}}


WITH users AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'users') }}
    ),

renamed_casted AS (
    SELECT
          TRIM(user_id)
        , SUBSTR(updated_at, 1, 10) AS update_at
        , TRIM(address_id)
        , TRIM(UPPER(last_name))
        , SUBSTR(created_at, 1, 10) AS created_at
        , REGEXP_REPLACE(phone_number, '-','')
        , TRIM(UPPER(first_name))
        , TRIM(email)
        , _fivetran_deleted
        , _fivetran_synced AS date_load
    FROM users
    )

SELECT * FROM renamed_casted







