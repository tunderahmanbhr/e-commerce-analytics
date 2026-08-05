with location_data as (
    SELECT * FROM {{ source('e_commerce_analytics_dataset', 'olist-geolocation-dataset') }}
)
select *
from location_data