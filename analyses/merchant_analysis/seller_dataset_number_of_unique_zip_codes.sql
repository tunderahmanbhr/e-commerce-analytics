select count(*) as number_of_unique_zip_codes
from (
    SELECT 
        distinct seller_zip_code_prefix 
    FROM 
        {{ source('e_commerce_analytics_dataset', 'olist_sellers_dataset') }}
) ts 