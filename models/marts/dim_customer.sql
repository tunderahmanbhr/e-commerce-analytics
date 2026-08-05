with customer as (
    select * from {{ ref('stg_olist_customers_dataset__customers') }}
),

customer_location as (
    select * from {{ ref('stg_olist_geolocation_dataset__locations') }}
)

select 
    {{ dbt_utils.generate_surrogate_key(['customer_id']) }} as customer_key,
    customer_unique_id,
    customer_city,
    customer_state,
    geolocation_lat as customer_geolocation_lat,
    geolocation_lng as customer_geolocation_lng
from customer 
left join customer_location
on customer.customer_zip_code_prefix = customer_location.geolocation_zip_code_prefix
