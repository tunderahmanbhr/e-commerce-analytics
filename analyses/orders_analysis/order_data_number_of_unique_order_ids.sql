SELECT 
    count(order_id) as number_of_ids
FROM 
{{ source('e_commerce_analytics_dataset', 'olist_orders_dataset') }}