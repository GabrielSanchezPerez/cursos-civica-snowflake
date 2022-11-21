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
          TRIM(user_id) AS user_id
        , SUBSTR(updated_at, 1, 10) AS update_at
        , TRIM(address_id) AS address_id
        , TRIM(UPPER(last_name)) AS last_name
        , SUBSTR(created_at, 1, 10) AS created_at
        , phone_number
        , {{validador_telefono(phone_number)}} as phone_number
        , TRIM(UPPER(first_name)) AS first_name
        , TRIM(email) AS email
        , _fivetran_deleted
        , _fivetran_synced AS date_load
    FROM users
    )

SELECT * FROM renamed_casted







