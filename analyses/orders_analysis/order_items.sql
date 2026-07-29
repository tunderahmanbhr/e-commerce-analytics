SELECT *
FROM 
    {{ source('e_commerce_analytics_dataset', 'olist-order-items-dataset') }}
where order_id = '00143d0f86d6fbd9f9b38ab440ac16f5'