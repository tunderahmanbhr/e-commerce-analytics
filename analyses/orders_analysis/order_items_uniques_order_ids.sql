select count(*) number_of_unique_order_ids
from (
SELECT 
    distinct order_id 
FROM 
    {{ source('e_commerce_analytics_dataset', 'olist-order-items-dataset') }}
) ts