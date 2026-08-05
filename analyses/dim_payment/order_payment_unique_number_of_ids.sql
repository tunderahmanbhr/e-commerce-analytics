select count(*) unique_number_of_order_ids
from (
SELECT 
    distinct order_id
FROM 
    {{ source('e_commerce_analytics_dataset', 'olist_order_payments_dataset') }}
) ts