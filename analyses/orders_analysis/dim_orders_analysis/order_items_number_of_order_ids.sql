SELECT 
    count(order_id) number_of_order_ids
FROM 
    {{ source('e_commerce_analytics_dataset', 'olist-order-items-dataset') }}

