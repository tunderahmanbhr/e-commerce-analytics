SELECT 
    *
FROM 
    {{ source('e_commerce_analytics_dataset', 'olist_orders_dataset') }}