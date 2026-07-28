SELECT *    
FROM 
    {{ source('e_commerce_analytics_dataset', 'olist-geolocation-dataset') }}
where geolocation_zip_code_prefix = 24220
