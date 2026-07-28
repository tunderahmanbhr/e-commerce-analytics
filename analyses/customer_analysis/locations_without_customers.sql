with customer as (
    select * from {{ ref('stg_olist_customers_dataset__customers') }} 
),

customer_location as (
    select * from {{ ref('stg_olist_geolocation_dataset__locations') }} 
)

select 
    customer_id,
    customer_unique_id,
    geolocation_zip_code_prefix
from customer 
right join customer_location
on customer.customer_zip_code_prefix = customer_location.geolocation_zip_code_prefix
where customer_unique_id is null