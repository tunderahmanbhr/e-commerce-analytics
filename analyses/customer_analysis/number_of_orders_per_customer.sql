SELECT 
    customer_id,
    count(order_id) as num_of_orders
FROM 
    {{ source('e_commerce_analytics_dataset', 'olist_orders_dataset') }}
group by 
    1
order by 
    2 desc 

--this query shows that each customer placed just one order during the given time period. strange!!!