-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- it's assumed that a merchant can have mutliple locations, this assumption will need to checked
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

with merchant_data as (
    SELECT * FROM {{ ref('stg_olist_sellers_dataset__merchants') }}
),
location_data as (
    SELECT * FROM {{ ref('stg_olist_geolocation_dataset__locations') }}
),
dim_merchant as (
    select distinct 
        {{ dbt_utils.generate_surrogate_key(['seller_id','seller_city','seller_state','seller_zip_code_prefix','geolocation_lat','geolocation_lng']) }} as merchant_key,
        merchant_data.seller_id as merchant_id,
        merchant_data.seller_city as merchant_city,
        merchant_data.seller_state as merchant_state,
        merchant_data.seller_zip_code_prefix as merchant_zip_code,
        location_data.geolocation_lat as merchant_geolocation_lat,
        location_data.geolocation_lng as merchant_geolocation_lng
    from 
        merchant_data 
    left join 
        location_data 
    on
        merchant_data.seller_zip_code_prefix = location_data.geolocation_zip_code_prefix
)
select *
from dim_merchant
