select count(*) as number_of_zip_codes
from (
    SELECT 
        seller_zip_code_prefix 
    FROM 
        {{ source('e_commerce_analytics_dataset', 'olist_sellers_dataset') }}
) ts 