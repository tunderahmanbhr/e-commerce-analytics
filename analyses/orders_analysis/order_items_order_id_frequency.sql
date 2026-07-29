SELECT 
    order_id,
    count(order_id) as frequency_of_order_id
FROM 
    {{ source('e_commerce_analytics_dataset', 'olist-order-items-dataset') }}
group by order_id
order by frequency_of_order_id desc