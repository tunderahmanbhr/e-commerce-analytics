SELECT 
    customer_id,
    count(customer_id) as frequency_of_customer_ids
FROM 
    {{ source('e_commerce_analytics_dataset', 'olist_orders_dataset') }}
group by customer_id
order by frequency_of_customer_ids desc