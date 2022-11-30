{{
  config(
    materialized='table'
  )
}}


WITH source AS (
    select * 
    from {{ source('sql_server_dbo', 'addresses') }}
),

renamed as (
    select
        TRIM(address_id) AS address_id,
        CASE 
            WHEN TRIM(zipcode) > 10000 AND TRIM(zipcode) < 99998 THEN TRIM(zipcode)
            ELSE 99999
        END AS zipcode ,
        TRIM(UPPER(address)) AS address,
        TRIM(UPPER(state)) AS state,
        TRIM(UPPER(country)) AS country,
        _fivetran_deleted,
        _fivetran_synced
    from source
)

select * from renamed