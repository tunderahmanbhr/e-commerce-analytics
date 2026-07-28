SELECT 
    count(*) as number_of_orders
FROM 
    {{ source('e_commerce_analytics_dataset', 'olist_orders_dataset') }}
