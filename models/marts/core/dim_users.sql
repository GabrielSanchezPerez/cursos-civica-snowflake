{{
  config(
    materialized='table'
  )
}}

WITH stg_users AS (
    SELECT * 
    FROM {{ ref('stg_sql_server_dbo_users') }}
),


renamed_casted AS (
    SELECT
          user_id
        , updated_at
        , address_id
        , last_name
        , created_at
        , phone_number
        , first_name
        , email
        , _fivetran_deleted
        , _fivetran_synced
    FROM stg_users
    )

SELECT * FROM renamed_casted