select count(*) as number_of_unique_zip_codes
from (
    SELECT 
        geolocation_zip_code_prefix
    FROM {{ ref('stg_olist_geolocation_dataset__locations') }}
        
) ts 