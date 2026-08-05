select count(*) number_of_order_ids
from (
SELECT 
    order_id
FROM 
    {{ source('e_commerce_analytics_dataset', 'olist_order_payments_dataset') }}
) ts